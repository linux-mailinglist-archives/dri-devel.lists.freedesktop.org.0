Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC339F89FA
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 03:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6CE10E09B;
	Fri, 20 Dec 2024 02:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zaKpL7BX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8AC10E09B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 02:05:56 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-30167f4c1deso13686301fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 18:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734660354; x=1735265154; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZQxHQhAM/RIga/+fsnUSzPyCCidH3uhXF5rvSgJCUYc=;
 b=zaKpL7BXLZhsU0uyTssjcnedlM3UwBb7vAsceBQplHwbxwHCBHELhYhNXdQiMkrHoc
 nVpq23YDuP6Dm0sxKwkcdABhdTqTpOPLJCwAqBWKtKzYx2oGeKd+AZUccrwQ8yShfJyP
 768tPZliCAXJ4xsM4GSz9wpSGqey53XmEWFlCxRKu0n9fOjHYnlDWNWPz5LJrf5lF1bX
 Q3Hkzu3uLZj39NUJ2iMvfXwhbNa+MtgsainGV++XpcMr/3r47JJ/2YevxinaIKImh0HZ
 2l3fV50w5xG6ekgd+y4bRKm7b83RyRYYRKoC8uajI/8CwjvZfobQLUAFAg1vC+zglvWr
 umlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734660354; x=1735265154;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZQxHQhAM/RIga/+fsnUSzPyCCidH3uhXF5rvSgJCUYc=;
 b=TamgQluJE0sEeq+h//Wkht3ObfsWCq41LTVBlD0f/O+FHOiJN8PsvMF1WB0XpTItA2
 5EmtKDw/zy71nowUMZyycPBVQ5wo7nw3t9/WU5l1flvZ74BUcVVEb8GLGSKUxPaC7JAH
 p552B3mntXVOHYrIbnqJy0k1Gf9NE6ple5rsys7oYnjMlFiZ0BZil8Ar1VHAaX5PU2nc
 FB25K0XALZk9D//6gbl4XCaGVeIpqtIZ9fXOJPIdB9Ed4JQc80iGXXkDPd5c9MyklWw7
 /OmvCsQJrE41FP6iDHqPUFyNOG4ZZnS013bO5hRO8NZ980ZpnA2kV/RqwzAIA+Ds8j8H
 0wMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWexbgVfFKmxHlpmGzSzVtmANL90B0a73Kj8N7a9J372w8l+rK6oBDegcrsV3/YByr5a2Dm0NGs2Hw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKwRQ0S1WhY2cbXSZ3VQQ+A5LKYLnCHLDoI/MUXBcR7jvlZvN4
 ZqnHzagOFCZ96Y2SwsdQe+JJ3y0ou1fk3y6zVSZXsxcRdTdrK8ViRZgV+m3BtrM=
X-Gm-Gg: ASbGncsq+0WRkzxv30tjOSaRH8w/awCxrDDlit9YKBVrAZ3Inab6w2lvEzQ87GOY5pS
 Ctw56KLTIzETBgsdoXhL4vV93iBjey+oILzettLz7/dxPQv+HcTPMwre3BdTmMaqaMafLADh588
 jdW7Mhg0c4A6Z4T4RG1pw2/gkRmedVbBzia5J6c2+IJJLfF/ZgOtYf6YsluZkrMw90WgxgxzXGG
 7BhEsmApDqH7+2J/Sxew4dVgbOyfhv3KMqqq9HyCX7A9+DQjhgS01s2orP/R0mdjumN2nzH2f0N
 UxDjLiZcH5D/Qyj3DiYR1nfIDhHE4Vrq4GTq
X-Google-Smtp-Source: AGHT+IHURm6OhzUQ0iMpBsbdwQ1MR5yYr44AHK2evlbJh3OZ0k8zFONE3zq16fo7BuPT9wsNNQz8vA==
X-Received: by 2002:ac2:4c54:0:b0:542:2a73:b483 with SMTP id
 2adb3069b0e04-5422a73b4d8mr2714e87.0.1734660354272; 
 Thu, 19 Dec 2024 18:05:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5d5asm340423e87.45.2024.12.19.18.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 18:05:52 -0800 (PST)
Date: Fri, 20 Dec 2024 04:05:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com
Subject: Re: [PATCH v3 0/2] drm: Allow encoder modeset when connectors are
 changed
Message-ID: <oaus2k2oilaxd33ysecpak7b6pz5fiqsyhfr3ei6om7hzsgn3f@5j3ykluusjuz>
References: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
 <20241216-daring-opalescent-herring-bfdc8f@houat>
 <8484df79-6ad8-4702-853f-31d985178607@quicinc.com>
 <20241217-fervent-hot-teal-dc3516@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-fervent-hot-teal-dc3516@houat>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2024 at 04:02:21PM +0100, Maxime Ripard wrote:
> On Mon, Dec 16, 2024 at 10:27:44AM -0800, Abhinav Kumar wrote:
> > 
> > 
> > On 12/16/2024 3:06 AM, Maxime Ripard wrote:
> > > On Wed, Dec 11, 2024 at 01:18:41PM -0800, Jessica Zhang wrote:
> > > > Call encoder mode_set() when connectors are changed. This avoids issues
> > > > for cases where the connectors are changed but CRTC mode is not.
> > > 
> > > Looks great, thanks a lot for doing the tests :)
> > > 
> > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > 
> > > Maxime
> > 
> > Thanks for your feedback.
> > 
> > Can we get an ack to land this through msm tree as part of the series which
> > needed it?
> 
> If possible, I'd rather merge it through drm-misc. We merge a
> significant number of patches affecting the framework there, so a
> conflict would be less likely there.

I think it should be fine to merge this patchset + core part of the
Jessica's CWB patches ([1]) through drm-misc, then merge drm-misc-next
into msm-next. I'd ask for such a merge anyway, once Vignesh's IGT uprev
[2] lands in drm-misc as I need it to finally land the patchset
converting msm/hdmi to use the HDMI Connector framework.

[1] https://lore.kernel.org/dri-devel/20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com/#r
[2] https://lore.kernel.org/dri-devel/20241217160655.2371138-1-vignesh.raman@collabora.com/

-- 
With best wishes
Dmitry

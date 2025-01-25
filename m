Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E01A1C4C0
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 19:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7DC10E038;
	Sat, 25 Jan 2025 18:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D0LiukYE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0702110E038
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 18:04:27 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso3232497e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 10:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737828266; x=1738433066; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dzSy8liY2gyXwBlcvSnsmfhSO4F0Z9sutNJNIuQmsZE=;
 b=D0LiukYE6gjUu2NMWEYUSH7jHyxGpygDVwBtY2h8+/a4CdBOcqO0yHt8Sk3a2g7kND
 GayXjjFQ5mLurQPPKB+CrnfHcq1fzgpl5C07EbBdtVolSmbr1rSkLdaAzy93GfAXH4wh
 gZTmLPXhjX/ZYqC8bsQetshofWPBDqnzBDoUEp+5D+MhVMI3rb/NwffWopuOlriU6qhv
 wLzJgSrKmq50APq5DiNcmfdrgPX//uFoUS2oSdCWT9dgfldiDXOo8TN/+gSVTfQpSbdF
 7w6s2ac5a1gTayaajuWxt5uLAhYjivH8EMD2kslD9gA8GgNKzOC6FNYxAMASJdYxVEqQ
 aQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737828266; x=1738433066;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dzSy8liY2gyXwBlcvSnsmfhSO4F0Z9sutNJNIuQmsZE=;
 b=ExnmrD1MuMfiipzRaZ7w5HzW7BfAL9aUjHYLHlfy0MLy+PQhxr5vSrnhjnLk+P5g7J
 fmwHzkBpamYfEVH3PKLs2RDnaCeR6aKpkaqzmzenPxqoURiyHkLVo7Y5/kis1+uwraFq
 NHV7f+58niT1Q+zZ+ah/vLtSwCDup12b/0H9rPtRcZ6RIyiS6ZDqfWHZVyzeV3RA3guM
 aIMwFN41cVL0addLBJzCsmB022GHktz+nBP+nLQFl0srBH2X2fyAx/lNRf/AUeemhi4s
 u+tUWscCcqie9d5fuz+3RYuxWoTJB6aQEhk3UtFi1rMa3RShg99Kza9awrxZ81ALP9gw
 vUQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Z9twkinW6wB+O5g9OrcJ53zjXnhE9IZzVul88gDiz0/BGhwkvAxFEZK5NG4yyEBRpBBb7JiWmlI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWwVKGNfahyNZLnJP4RFPeQdI+7tliRyOnr0TnLwVuA/YEBpRK
 jwQaTAaBsPIdYLR3QOJqHK93Zy/7sKsfBQPXp3kspvhpgxd7mOa5ereIk4Or7rU=
X-Gm-Gg: ASbGncsRzu3OB/r3/CNw1GrrsinpyzJ16I+cyMNzcctwoyoSLHoHGp1Z6hPjHOwgcsX
 LAcsmPJj+49ksn/aZuH0UCIOORaOfoLZn0qwyIQT1iIVo4Ea09nqCLzQzLnxan+i0d8wgFdY1W1
 d5Wc8/PibusfHEEGn2QoOlafVfb0j8+vtYNVm73GfHzC4E2EFoPjjdzCsgGPBSAyb3Uo1Oo6pym
 NRzar8llsTJX2p4UnS+xMAOJa6Njj6tEClDMUvW4RE40DJn0ujy6+J2zA92pzHTbtPgo4MFmow9
 +NtATnOjUQ/73UcrqvR03yl4ZQCIQvP29fGeavcwfFvBCey+RK6fCy+Pl/Xc
X-Google-Smtp-Source: AGHT+IFqlsioC2N8eIrYR1B/g5ir+0aDTpIBc6L7li4LyPvhrRta6EbanbGoI3JmULDWOPYh7BuYSA==
X-Received: by 2002:ac2:5d6e:0:b0:542:2972:4e59 with SMTP id
 2adb3069b0e04-5439c249f21mr11068203e87.28.1737828265991; 
 Sat, 25 Jan 2025 10:04:25 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c836830asm669436e87.139.2025.01.25.10.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 10:04:24 -0800 (PST)
Date: Sat, 25 Jan 2025 20:04:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH RFT 0/2] drm/bridge: Use per-client debugfs entry
Message-ID: <a3hrta4eiiknuf4sukk27xewhhirzf43u2eeefnpjny27m4x5s@aifvnevj7cb6>
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
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

On Sat, Jan 25, 2025 at 01:53:20PM +0100, Wolfram Sang wrote:
> The I2C core now offers a debugfs-directory per client. Use it and
> remove the custom handling in drm bridge drivers. I don't have the
> hardware, so I hope I can find people willing to test here. Build bots
> are happy. And for it6505, it even fixes a problem. See the patch
> description there.
> 
> Looking forward to comments.
> 
> Wolfram Sang (2):
>   drm/bridge: it6505: Use per-client debugfs entry
>   drm/bridge: ti-sn65dsi86: Use per-client debugfs entry

I'd say, it should be done in a slightly different way: bridges have the
debugfs_init() callback, which is used by drm_bridge_connector (and can
be used by other bridge-created connetors) in order to create per-bridge
debugfs data. Please consider using it to create per-bridge debugfs data.

Note, that callbacks gets connector's dentry as an argument, so bridges
still should probably create a subdir for their own stuff.

-- 
With best wishes
Dmitry

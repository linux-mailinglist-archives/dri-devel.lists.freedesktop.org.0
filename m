Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054B2A78FF7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7682B10E7DB;
	Wed,  2 Apr 2025 13:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y5q6srgQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEAC10E7E0;
 Wed,  2 Apr 2025 13:36:53 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso1362463066b.3; 
 Wed, 02 Apr 2025 06:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743601012; x=1744205812; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6YcnQVeAyHD8E7Z9q5MeYx0CrRnuZdFDj+LArbhVdEQ=;
 b=Y5q6srgQVIGVIpzRgeboJpDIbB99IZHf5Ff5yQCjoPKhI4yhvfhLYBvzNv33TdSin4
 BF3gPaGZnHsX5je8/PWR0bXfgXz073ugwOgKTWq8/rVotS9QnQXW7FqZzN0rzk94sE7D
 YhrcQO80X3GgmVMkAvQ8uTU8eIHjqnKMi+nCdjHlyUQuloXElj3yasoleAFTDAIVFQlH
 UgYwn36EIsw90vp44D5PLSGQobO6WnF0YN4jWvdDFgNLDUkxqEtHXOZK/xZk05sb79Ch
 UyrAsTnlZSCPMkioLILdEWev4DAbFCvOirENKmYMt8Nhi1KwKe+P6sg3ZgRwIlOCOMMJ
 CL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743601012; x=1744205812;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6YcnQVeAyHD8E7Z9q5MeYx0CrRnuZdFDj+LArbhVdEQ=;
 b=PK0bCHlefThVOjb+j3+uwIUsXVMS9mV5kdg02OSRan5CEpXPYLuMIDPsA6YawWSEkK
 Qy5RuhslR2MeNmrtyQUe7ealq/Sry2lkgavmWUH9JBYjwUoNNJGRzxNlw7OHUC67u0ym
 zJkeuD1As7/kDkwdS4PC8CfhLro3PtBsFNnaCXfgpKx6O6ep4dUkbDb/NHUutZoHRwxm
 e3w6G22EhMRzoEdIL8VgVywtLpzgTUhfspeRVb+w0VFCOvqXDXdq0WAhSXSggcxBdrAm
 476Qlt0+3NZwTySAAmYfqseG7TLMf5FEKJVWPVhwVDGVqhegxKdRboostsWBQ8SKfv8m
 SQBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURsSKfDsF2y9IRjvpfUPrqnbGFQGXC6C7ocy93h14Z1ApeCbHKtv9qnO0xw6n8c0pJgBBFK+rnK84w@lists.freedesktop.org,
 AJvYcCVs+tuLWRJYFuqQ1etzW8oPyajdKywCSWrPUq811XoCTsswG4YP8xOhfMffnDsdJIlBuU164kDD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQsQ6F9olx+wUyLAXdnYRmJObmhJUTjIJkfV7ch/raobp42RBK
 rrEXeCqadxC0JEmGSwAZ83sm2e1encjHppy6813+AEtZT5/VSN/IhL73B3YEM/FmqA/Ir4+5yhd
 pKLqoG2dlta8QP01eE3OoCkdSkh4=
X-Gm-Gg: ASbGnctUW+d1eJ/7VhIAny/Xih5jHTDnYMykfwNQBKfeUyBwoM0EdOfUbm54ITMMSRO
 pn604nkQArOMqgnTPzaOQRCYljJXFKZkMufFD+NFEniY5dkOiqBQstJem9BA1ThupolXkJW+ZjD
 sMJ6GnpF7tD+UL5GgWychzkBCC4VGE5eecN+0Pvidr
X-Google-Smtp-Source: AGHT+IGiRNUzPFdPSLLv3HybeyLyN8HPd/5lzM/oyvuyIgllHW/BtQW9F5MZSBv3hVR+Ngp7/Cv5R4OpJ+MTpbZUlWw=
X-Received: by 2002:a17:907:9707:b0:ac3:8626:607 with SMTP id
 a640c23a62f3a-ac782e3a8camr647737166b.38.1743601011777; Wed, 02 Apr 2025
 06:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
 <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
In-Reply-To: <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 2 Apr 2025 16:36:40 +0300
X-Gm-Features: AQ5f1JquQhOZxQMjaSHZ3hNl0wenZmYuULWVR-_sE5d_ZmjrXEhKjyvAnCxSmPs
Message-ID: <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
Subject: Re: amdgpu_dm_connector_mode_valid regression
To: Gergo Koteles <soyer@irl.hu>
Cc: Dmitry Baryshkov <lumag@kernel.org>, regressions@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 2 Apr 2025 at 15:00, Gergo Koteles <soyer@irl.hu> wrote:
>
> to: Dmitry's new address
> cc: regressions
>
> On Wed, 2025-04-02 at 12:40 +0200, Gergo Koteles wrote:
> > Hi,
> >
> > While playing with
> > https://lore.kernel.org/all/61c3df83ab73aba0bc7a941a443cd7faf4cf7fb0.1743195250.git.soyer@irl.hu/
> >
> > I found a regression that prevented some EDID DTDs from being selected
> > in some specific cases.
> >
> > This is the first bad commit:
> > b255ce4 ("drm/amdgpu: don't change mode in
> > amdgpu_dm_connector_mode_valid()")
> >
> > I think the problem is that decide_crtc_timing_for_drm_display_mode()
> > function tries to copy the crtc information from the preferred mode,
> > but that's not filled yet if the first one is the preferred one and
> > it's not the one with the maximum refresh rate.
> >
> > amdgpu_dm_connector_mode_valid()
> > create_validate_stream_for_sink()
> > create_stream_for_sink()
> > decide_crtc_timing_for_drm_display_mode(&mode, preferred_mode, scale)
> >
> > It works if I call
> > drm_mode_set_crtcinfo((struct drm_display_mode *)mode, 0) before
> > create_validate_stream_for_sink()
> > in amdgpu_dm_connector_mode_valid()
> >
> > or
> >
> > if I comment out the decide_crtc_timing_for_drm_display_mode() in
> > create_stream_for_sink()
> >
> > but a better fix than these can be imagined :)

Would it help if you force recalculate_timings to be true if
(drm_mode->crtc_clock == 0)

> >
> > more information:
> > https://gitlab.freedesktop.org/drm/amd/-/issues/4085
> >
> > Regards,
> > Gergo
> >
>


-- 
With best wishes
Dmitry

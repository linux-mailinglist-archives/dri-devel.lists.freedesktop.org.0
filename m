Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6709A37017
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 19:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6268D10E0FE;
	Sat, 15 Feb 2025 18:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AwNlca+Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727A610E0FE
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 18:09:15 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7c08621f6a2so147837685a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 10:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739642954; x=1740247754; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NPF/Alw+//gUVq8mrgRf1sA3HpgcZBGZ+ed5dpOL9uU=;
 b=AwNlca+ZzFeERi81BdWtNSU0mXVNro3uEsmv2WvOt3BUbpml6BfLU2gOZBKsJZhUNj
 RVoeWiwXFo3M5DAp4lQ8wiF5i9jykuDp3v2dcMJwlBb4/alLImRs+FAY4Q4PZosU258d
 NfzB4VMQkZT72O0+8thakeZJ/5V0yoe0AHKXV4sUF19NQSdxJLkOabjNmHkQXHLfxJTg
 vCCePbDB9t2Q0r2Ssupud9KF596CpvHf82oRpmfOtmUEebHUpMaomc3dVdAM6xrWKz/h
 mfwR1GEbQuzoVJflhQuJ5S+KSG8fnkCAD8f8EGEhRWg4G4cB8ZF0ZqudmCS65+VPNi1Z
 IYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739642954; x=1740247754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NPF/Alw+//gUVq8mrgRf1sA3HpgcZBGZ+ed5dpOL9uU=;
 b=vgHSQgI3+1f7WhZOsEqdZAikqPF+PBpo1XpzTbAIRy+Uw1JHjlA/nVCQWMvf0C9Tw/
 2yotbpIqEFmu/FPlbcbHt4jlO+YdJeTMu4ZePH4U42/CMOdeexhuqP3s1qoYfKHHG7P5
 R1qPplzsFkeN4gdrEGin8q+51AszmBXKcq0enBGHKLR9AjYlc4UAsX8RQ0fhqB6Ia2b3
 TktM2/I3t+CfuUbf/1su6CevFyY44RDm43Y4Sb6i1ie7R8UHiDgBNo2fqHm4OsI63p/y
 IC+P7Z/ajQKz42SChlu6TPLRE6g+AC3r0lnr3+0p1+ZYU3bfVEr1RocKab145aME9bM2
 P19Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPyLA9zZ4BkMJW1EPxZ3NFvwAv1G/1rl92mJ1w9DNgL0Na04ck/BeBT0Pjc+glTct/yfcQPgfQJMA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/hBWj5e9+aafMteD7k2L0XowT7pDmm/C2BHELUnvaQp1Fp2y6
 r2PtwPyyXx81YpUkmlEI4RNEYKPdZgV/uo+PBsWnb0MzpmsPbdMh
X-Gm-Gg: ASbGnctBK4+gn/fKe/doLGE1EPZ4Ma32DFEeS6GFf11CW7iTxJsmj2a/H/sMrKyFPDZ
 jsgiPxIRT66AJ3v7RLEt4OmrtAJY/YrLsw8+Qv9A56chlay09JqcGOaCjH1L3i4Tay69nMRlelB
 Ra/yyjrM2oM39zgDEvfq9vdtiOZFgLxO3HQHS7XAsfMn0C0xba7B7RWqQtBycSI8soFcZMKXusp
 E9Tf8W6RZ9ifpfjnPb+bL+lNj2fj6yYjzk1HSxaOwDtKLzZdwU6Tk0bzSdTFClPZ0PVNz4VzXBH
 n98t2ylxtKrZ2JLivLSfRawNotSd7LhZf0e3gs2C22qFdzGl4XCz
X-Google-Smtp-Source: AGHT+IEl9KdRZhqzx5Xxn8OZkjroz7UixGi1SO9rhPskdpCEoIBJLhf+0gV/LBbwxGIzrqNyLlXW+Q==
X-Received: by 2002:a05:620a:4441:b0:7c0:7f07:a635 with SMTP id
 af79cd13be357-7c08aac61c6mr588315685a.53.1739642954075; 
 Sat, 15 Feb 2025 10:09:14 -0800 (PST)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e65d77927csm34123606d6.10.2025.02.15.10.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 10:09:13 -0800 (PST)
Date: Sat, 15 Feb 2025 13:09:11 -0500
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, David Laight <david.laight.linux@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH] drm/repaper: fix integer overflows in repeat functions
Message-ID: <xn7ikpjzqddnrna72ojiitufruemineonyhh5cmwizrrnt4txp@gh2sy6ixddx7>
References: <20250116134801.22067-1-n.zhandarovich@fintech.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116134801.22067-1-n.zhandarovich@fintech.ru>
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

On Thu, Jan 16, 2025 at 05:48:01AM -0800, Nikita Zhandarovich wrote:
> There are conditions, albeit somewhat unlikely, under which right hand
> expressions, calculating the end of time period in functions like
> repaper_frame_fixed_repeat(), may overflow.
> 
> For instance, if 'factor10x' in repaper_get_temperature() is high
> enough (170), as is 'epd->stage_time' in repaper_probe(), then the
> resulting value of 'end' will not fit in unsigned int expression.
> 
> Mitigate this by casting 'epd->factored_stage_time' to wider type before
> any multiplication is done.
> 
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
> 
> Fixes: 3589211e9b03 ("drm/tinydrm: Add RePaper e-ink driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

After discussing with David Laight I cleared up my concerns.

Reviewed-by: Alex Lanzano <lanzano.alex@gmail.com>

> ---
>  drivers/gpu/drm/tiny/repaper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 77944eb17b3c..d76c0e8e05f5 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -456,7 +456,7 @@ static void repaper_frame_fixed_repeat(struct repaper_epd *epd, u8 fixed_value,
>  				       enum repaper_stage stage)
>  {
>  	u64 start = local_clock();
> -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
>  
>  	do {
>  		repaper_frame_fixed(epd, fixed_value, stage);
> @@ -467,7 +467,7 @@ static void repaper_frame_data_repeat(struct repaper_epd *epd, const u8 *image,
>  				      const u8 *mask, enum repaper_stage stage)
>  {
>  	u64 start = local_clock();
> -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
>  
>  	do {
>  		repaper_frame_data(epd, image, mask, stage);

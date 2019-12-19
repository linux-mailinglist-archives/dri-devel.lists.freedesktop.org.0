Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B41264F6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 15:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4316EB86;
	Thu, 19 Dec 2019 14:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA0A6EB86
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 14:39:16 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id e28so6487122ljo.9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 06:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ETYzlEK/SKBE9MSwRXzOWbDS35XqdxpOfczqaHg4TKc=;
 b=bF6N2eZx/MJp5NAY51e4sTEXMVHwISjjo0PKdetj3l1hlk8EBl5mFcOmJzXliHShr4
 Qv0rBP6jIhfLuA3CYg+1GAP89gytngUDyanU8HoX8Ep7UOqEEMcsywI4fI82j79oNZDC
 vIKrkImriDPp8C9uFKfr/6dSxwwy7pcKPHQmDAY8pzWNBwJrY/6xNGzB08dxLJtgqM5v
 Sb+wiyOfpSXx6nI1wORv2R5/1xNgnKBBcv/DOkq14SWK+BsssmTjxvZtRgVPGAbk3Hxk
 sOndlmLpSj0y9fidXN4WwG4jG9KByFjYzS4F7zzCP8Wh4dSoaFayAtRDQOcQB77kXXDZ
 Ti5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ETYzlEK/SKBE9MSwRXzOWbDS35XqdxpOfczqaHg4TKc=;
 b=LFXobQNaUH5kVLTXj4RhSIeJeuSs3rlqPWiqH2gQ9PMJSZczhtfp0Jcx59St1r5giH
 muoPuDEDqiSw2egFJT6lqIScLlCZqfyqKEMud7QtvzAKqbRtUxI13qeXAIaTRq9qmCmw
 clRsak5S2VlRQpzh9U290eqcHof81LDqR66Yex+l9gbaAYXexiMOtmLFe+nhuKkECz2r
 IherG+rd001CNuR/f3eSDCA/wbBT1q7c44zU3JxAZtsSCnjoyHMEajkS+JM57FQPlud6
 8PyLCX97fJgSAFNmuCJo0wzIucQR31pJgnShi59T8rlKiGXl0VHWkxKJMJeUwD/Gp8yz
 Ioiw==
X-Gm-Message-State: APjAAAWr8MXlTkp4nC6na4OwXEqYj8kzqXYSqMuSKYomgVZCQfl+Ssov
 yZg3lJAn0d50CKAnmo6GDxW0XowX/869RhGenlw=
X-Google-Smtp-Source: APXvYqy/s+mw/ppdDLohJW+mt6r4UAY+bJ1lL980yaETjnVIH9hg0vqWdUTsurmxXhTnZAp4biAnBoy/zXdN4xmx5AI=
X-Received: by 2002:a05:651c:2046:: with SMTP id
 t6mr5483542ljo.180.1576766355054; 
 Thu, 19 Dec 2019 06:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20191216162136.270114-1-colin.king@canonical.com>
In-Reply-To: <20191216162136.270114-1-colin.king@canonical.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 19 Dec 2019 15:39:04 +0100
Message-ID: <CAMeQTsYmqJwYrAM1bGu2VyVop3sSFcp2fOMrxD4OvhH13jad9Q@mail.gmail.com>
Subject: Re: [PATCH][next] drm/gma500: fix null dereference of pointer fb
 before null check
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 5:21 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Pointer fb is being dereferenced when assigning dev before it
> is null checked.  Fix this by only dereferencing dev after the
> null check.

Applied to drm-misc-next

Thanks
Patrik

>
> Fixes: 6b7ce2c4161a ("drm/gma500: Remove struct psb_fbdev")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/gma500/accel_2d.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/accel_2d.c b/drivers/gpu/drm/gma500/accel_2d.c
> index b9e5a38632f7..adc0507545bf 100644
> --- a/drivers/gpu/drm/gma500/accel_2d.c
> +++ b/drivers/gpu/drm/gma500/accel_2d.c
> @@ -228,8 +228,8 @@ static void psbfb_copyarea_accel(struct fb_info *info,
>  {
>         struct drm_fb_helper *fb_helper = info->par;
>         struct drm_framebuffer *fb = fb_helper->fb;
> -       struct drm_device *dev = fb->dev;
> -       struct drm_psb_private *dev_priv = dev->dev_private;
> +       struct drm_device *dev;
> +       struct drm_psb_private *dev_priv;
>         uint32_t offset;
>         uint32_t stride;
>         uint32_t src_format;
> @@ -238,6 +238,8 @@ static void psbfb_copyarea_accel(struct fb_info *info,
>         if (!fb)
>                 return;
>
> +       dev = fb->dev;
> +       dev_priv = dev->dev_private;
>         offset = to_gtt_range(fb->obj[0])->offset;
>         stride = fb->pitches[0];
>
> --
> 2.24.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

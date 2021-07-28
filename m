Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744783D90BC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 16:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C266EB2D;
	Wed, 28 Jul 2021 14:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC386EB29
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 14:34:27 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id d6so1184286uav.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 07:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7u2BTk0mrMKoVnndTza4mcFVVzMmku9h4wSobsJzJUs=;
 b=kFDUlnbAKeAGtgqONFDWFYDiQfyoWPHSCclsB8xQjKMo5wmAuNAm2UT0e5yfNnapxI
 f4tB0UmaF/ucF/t9ooyYFuDbgxbGrgXiR1AKXFE68p5p4LWt4CUu/pWW1UFFfkJhT96V
 nx3QNkFX0fFstdPaET2GrDDT6gPiHba+O+yWDfpYqCy72I4Ptaz7X7BdM/RHosgz1uAU
 P9huM7gLFoROYj86VVgPQHDcWTlK2BZdhcfoSesLdjAhKMJj06lbOImgeQkvMRE/1o7c
 AfgInLjSbTMkcefYrQq6plLcSgMiAYlhz1UuqRQhtepIxcyh32UyCL7cPfg/7e0suJKl
 7KMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7u2BTk0mrMKoVnndTza4mcFVVzMmku9h4wSobsJzJUs=;
 b=tadp2LOUVrIyEBhxOaGOSbuNbK/fart0jzvD1LnDawNeQq8xo9WBoLhTihybjHHyWc
 0eshZDmbUssBir0aqaBGByiqXYnAnNzu/i+0JwHvS2RaqSdUDe/myblPjOsclMyR4KMd
 creLM0eeZVCLDnlBSVYMqMbxU/o0kJoxotXb/SUNqi3x4ZPkyCvlphgtXmkWSYGHAt0X
 iHzLNvTu0r9EPxxDbzGGVZCo1PypgCS5Xe1ttyNckuRsOa7+IGOPOE39IIKYT5CEdbJK
 LR6ydfcApziOys0Qqibt5PttpgWwzRBzE3BFiRfM15fA823ZX2S2rGYrY54padL/SmtD
 DnvQ==
X-Gm-Message-State: AOAM531PgjPy0ZDRn2ojVQiLg57w2+wgZ0qQL4QFSiKpxK5xpPgUNSMs
 bFfOTlXPMejx2bFGuIOxeuG7e+y3JEo/U6mTEQc=
X-Google-Smtp-Source: ABdhPJyPNjUpufsG7zWKi5R3dBQQ+gs28pFkpo1Oh3BpQfnLxrH+pv/zmNBnwuN+D6u/AAkbCQXjWctcLxYFNKzQTzg=
X-Received: by 2002:ab0:25c5:: with SMTP id y5mr67652uan.142.1627482866205;
 Wed, 28 Jul 2021 07:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-3-sean@poorly.run>
In-Reply-To: <20210721175526.22020-3-sean@poorly.run>
From: jim.cromie@gmail.com
Date: Wed, 28 Jul 2021 10:34:00 -0400
Message-ID: <CAJfuBxwZ-qfJMJ+kq1=JN9F7KY3LFQu5tCW4=VpP35LQq_FO+g@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 02/14] drm/sil164: Convert dev_printk to
 drm_dev_dbg
To: Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi Sean,

one little niggle here.

On Wed, Jul 21, 2021 at 1:55 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Use the drm debug helper instead of dev_printk in order to leverage the
> upcoming tracefs support
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-3-sean@poorly.run #v5
>
> Changes in v5:
> -Added to the set
> Changes in v6:
> -None
> ---
>  drivers/gpu/drm/i2c/sil164_drv.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/i2c/sil164_drv.c
> index 741886b54419..b315a789fca2 100644
> --- a/drivers/gpu/drm/i2c/sil164_drv.c
> +++ b/drivers/gpu/drm/i2c/sil164_drv.c
> @@ -43,11 +43,6 @@ struct sil164_priv {
>  #define to_sil164_priv(x) \
>         ((struct sil164_priv *)to_encoder_slave(x)->slave_priv)
>
> -#define sil164_dbg(client, format, ...) do {                           \
> -               if (drm_debug_enabled(DRM_UT_KMS))                      \
> -                       dev_printk(KERN_DEBUG, &client->dev,            \
> -                                  "%s: " format, __func__, ## __VA_ARGS__); \
> -       } while (0)
>  #define sil164_info(client, format, ...)               \
>         dev_info(&client->dev, format, __VA_ARGS__)
>  #define sil164_err(client, format, ...)                        \
> @@ -359,8 +354,8 @@ sil164_probe(struct i2c_client *client, const struct i2c_device_id *id)
>         int rev = sil164_read(client, SIL164_REVISION);
>
>         if (vendor != 0x1 || device != 0x6) {
> -               sil164_dbg(client, "Unknown device %x:%x.%x\n",
> -                          vendor, device, rev);
> +               drm_dev_dbg(&client->dev, DRM_UT_KMS,
> +                           "Unknown device %x:%x.%x\n", vendor, device, rev);

we have a macro for that :-)

 #define drm_dbg_kms(drm, fmt, ...)                                     \
-       drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+       drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CLASS_KMS, fmt,
##__VA_ARGS__)

and again below.

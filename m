Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEA5580C87
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 09:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E6111B6AD;
	Tue, 26 Jul 2022 07:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF6E11B80F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 07:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658820190;
 bh=87Dwh7067qd7DtPJ/NTAN/t/IaMuPuUKPEZAEiBlBAo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=kP/NQsiROB70ArzFE552x2oNxBc80FiKCiR+cIXDKc0GMYc2GlKwxTkUPjfVlIQjn
 buHKK7Ozk1vyq35A+LZ5DvKamw7dsEaX8Nfi2lsJSQv0dfHFrWEb7kKCSEbXrl+cuo
 BpiYh/auhun04r+Dzsi0e5DpuNwuS2FV923oQ124=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.186.181]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCbEp-1oOFOn1WZn-009hWr; Tue, 26
 Jul 2022 09:23:10 +0200
Message-ID: <4b3e4d1b-e219-1ecc-5dd3-d693c69f6124@gmx.de>
Date: Tue, 26 Jul 2022 09:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fbdev: Make registered_fb[] private to fbmem.c
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220725075400.68478-1-javierm@redhat.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220725075400.68478-1-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:akojF7SaFix7y2EiczH+UV96lavMDM7AZJsP+iaDgbQEG+V+i2q
 AHp5GhXCKXNYNDOCssfMAC/zfYNxRCCJshEriwFrLnGyA1Y6pwwtSwNag0vDCVz4l90tkVW
 DIiFJN86HihlvrTwFG4ohFYO7eklHfRT3PRulwLXOdHR0cKitqTH/XJOidG4mMQ2ZIdaVip
 Qb52HfSj5m1KZaPuL+4Mw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2epUbeCrlb4=:nJ4/GE1ohg6n44gxvvA1g0
 9tcYvqxfX29++V5TPhldux6wE+5RdakqeysnSOxwvJtU3QsfOiPWnuBaTfZHFB2e6XDI+62yX
 Nz83sJk6qIPwxUFOPONNz62ypPSCcY0rjf82hjb9Hi2Lwi85RE/Wv8KDJ3LCi9TZKxrOOLM6x
 q+0Fuy3DBSUKYuB0H+alZufFJ4j9+65ZpF4aOYW/hoMPFFTBOIw0Xxr1IeTidvFollcEnQbpF
 +XfC3CGTqdf8bJwlRC6jN+hBcc7B1hgFvn25YROveAwOV/g5GveJS1Z/O4KvGV/iCcoqgsrNM
 fCRA6jQToPDoNE8T4SQV+5vmc5jalrSX83t4zGpWJcZPQPD2KWlGjs1bwLozn0sQuFfvLOKaN
 1gNdrbYTNgLXnVUAKgvVSCF2xgDAoBsg/lM3MWfDou6DtlNcL9hCY6hS8gHKrlB4Mi1eS5Hqi
 Y2sod2IRPNdEAofC/+7dApmBcSJwAG49Lft5z+At3tVmHld2z3+b2dU9yMk1bOt81R5SmngJ6
 mwH9FdhZ5bpEr+dH3pqPGNEtiPgP6EOh/jFkUB2wCZPiiQuYpjJ6Px9/s32f0mDRLaZBb9zGc
 I6MQdYh6nJL83crGe3gAUjbVPzzGxuqRwhLI7zSXdl+eTi8iDnnYXpH7XEduENG7QxoMOiBcK
 +6R+9C0uYujlTGYfXL1EehIwPQlWmwlj74S8lWa8LysB0fc4qzdA0OT+iJtJwKNST/iI6ua5u
 5O4GRigAerQA11xXo4LUlVxuJGyKHUwW8YNM+4/TfHCfJ8pV4A3s/znEd2WDuP9ex4mMnV8vw
 EzJWkCF4ZlgOTcdqREApz5ZP1jbgnHPGsQ69+W7P9ur/r5G6PrUmeCRGC+o4vRU61t59jySXd
 U25SRnofD0CgrpZbbw3x8JBb7sDbu5kUTFX9IxjfJ0rh1B0cOuNVBe+oyh8cRAKoBxNN3rVik
 hDwE6VpFYPlsHH3CwY5RHmurfpyIG9SlHBs18HCeIBzkReUl2/KrEt1geR+BgTxUl1QIo5l9P
 Nqi5mil5Kv6r+pYpXO/lxteBQMq4F4PQyPdzB5kBHYyN23nVpXw7P6kWDWranPh6v94XYpcAK
 cH4e6S9KuZae9P7D9d5AkDswbDqf+s2iP0IegQL/JOeQhdkk0zT83Vv8Q==
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/25/22 09:54, Javier Martinez Canillas wrote:
> From: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> No driver access this anymore, except for the olpc dcon fbdev driver but
> that has been marked as broken anyways by commit de0952f267ff ("staging:
> olpc_dcon: mark driver as broken").
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

I've applied it to the fbdev git tree.

Thanks!
Helge

> ---
>
>  drivers/video/fbdev/core/fbmem.c | 6 +++---
>  include/linux/fb.h               | 6 ------
>  2 files changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core=
/fbmem.c
> index 6ae1c5fa19f9..1e70d8c67653 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -51,10 +51,10 @@
>  static DEFINE_MUTEX(registration_lock);
>
>  struct fb_info *registered_fb[FB_MAX] __read_mostly;
> -EXPORT_SYMBOL(registered_fb);
> -
>  int num_registered_fb __read_mostly;
> -EXPORT_SYMBOL(num_registered_fb);
> +#define for_each_registered_fb(i)		\
> +	for (i =3D 0; i < FB_MAX; i++)		\
> +		if (!registered_fb[i]) {} else
>
>  bool fb_center_logo __read_mostly;
>
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 453c3b2b6b8e..0aff76bcbb00 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -627,16 +627,10 @@ extern int fb_get_color_depth(struct fb_var_screen=
info *var,
>  extern int fb_get_options(const char *name, char **option);
>  extern int fb_new_modelist(struct fb_info *info);
>
> -extern struct fb_info *registered_fb[FB_MAX];
> -extern int num_registered_fb;
>  extern bool fb_center_logo;
>  extern int fb_logo_count;
>  extern struct class *fb_class;
>
> -#define for_each_registered_fb(i)		\
> -	for (i =3D 0; i < FB_MAX; i++)		\
> -		if (!registered_fb[i]) {} else
> -
>  static inline void lock_fb_info(struct fb_info *info)
>  {
>  	mutex_lock(&info->lock);


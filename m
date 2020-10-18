Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A258291FB3
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 22:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6FF6E898;
	Sun, 18 Oct 2020 20:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A336E898
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 20:09:17 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id d28so8511250ote.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 13:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uTkIKpAXXUMsdDW0M0pmci3ckhN0Y57VkQTrzhAampI=;
 b=ZWCwRmzA1q9rUb7p8BjxAG+i4vhfm41OiL5T5ZG1GnAzhlOaxO4waXtz1aznqqxQm5
 /oy0veyH2tbq9YBXGF14heMaLwtJ2uC0ylKJ28Fv5bQAY4Xf9NljJvappbUUvvslOsUF
 n/y7UMXZeAkHNZVGiFW/izHWH2KpsQ+bkOwXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uTkIKpAXXUMsdDW0M0pmci3ckhN0Y57VkQTrzhAampI=;
 b=XJpZqIgcdL1HcuqbxbGxrAmGcpUbwSMGzbjqGj66u7gZg4YqafERH//ysdHBOdteRL
 /MZDtXF3Lwsur4lWDeiZ7tT4ZoMCNOEOnoGZIOK3kDE+hbd9nuYRnaru+ACLhI2u4eET
 7DNbZdDvx2vbcW4mn/L742GKtbYk+qbW+QwCI+b7GB7K20Pk86s474zf3FORSA6S+2mR
 innv0nqKgPmzpf3MJyf5Pcf7xEoLpe5N1gLS6JZoMVBtypg1DoL0Vy7htc/OaDjBbFTi
 dcmcMrWMNiAeW1gj6u46ijN409acDy48TxTdjDjJ8kjVoi3CgH3N5ufYNCHYj0sp4+Qa
 mcig==
X-Gm-Message-State: AOAM531efzXeb9oNrAwRXJM6nxfTb54yJMDMO9Ng9ArjzvuE1Del18Pf
 3DUh9Y7wZOlpkO9JZwrDdr6+DAlUo1CSwE2CfU671g==
X-Google-Smtp-Source: ABdhPJxwCztnu8cd9eSC2rortQrG/hZH4mpTa2NjpeAnAc2MGwNccXKO+BizjvsWvItIcVTXrXUk+bHpiY8MDg2YKNU=
X-Received: by 2002:a05:6830:8b:: with SMTP id
 a11mr9517320oto.303.1603051757215; 
 Sun, 18 Oct 2020 13:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200820082137.5907-1-s.hauer@pengutronix.de>
 <926453876c92caac34cba8545716a491754d04d5.1603037079.git.yepeilin.cs@gmail.com>
In-Reply-To: <926453876c92caac34cba8545716a491754d04d5.1603037079.git.yepeilin.cs@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 18 Oct 2020 22:09:06 +0200
Message-ID: <CAKMK7uF9E24P=vzKt28=1_iaFTYD7obHs+tEPwwZPNMhh7DBrg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fonts: Support FONT_EXTRA_WORDS macros for font_6x8
To: Peilin Ye <yepeilin.cs@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sven Schneider <s.schneider@arkona-technologies.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding dri-devel too, not sure anyone is still listening on linux-fbdev.

On Sun, Oct 18, 2020 at 8:13 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> Recently, in commit 6735b4632def ("Fonts: Support FONT_EXTRA_WORDS macros
> for built-in fonts"), we wrapped each of our built-in data buffers in a
> `font_data` structure, in order to use the following macros on them, see
> include/linux/font.h:
>
>         #define REFCOUNT(fd)    (((int *)(fd))[-1])
>         #define FNTSIZE(fd)     (((int *)(fd))[-2])
>         #define FNTCHARCNT(fd)  (((int *)(fd))[-3])
>         #define FNTSUM(fd)      (((int *)(fd))[-4])
>
>         #define FONT_EXTRA_WORDS 4
>
> Do the same thing to our new 6x8 font. For built-in fonts, currently we
> only use FNTSIZE(). Since this is only a temporary solution for an
> out-of-bounds issue in the framebuffer layer (see commit 5af08640795b
> ("fbcon: Fix global-out-of-bounds read in fbcon_get_font()")), all the
> three other fields are intentionally set to zero in order to discourage
> using these negative-indexing macros.
>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Patch looks good to me, but it says 1/2 and I can't find 2/2 anywhere,
not even on lore. Did that get lost?
-Daniel

> ---
>  lib/fonts/font_6x8.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/lib/fonts/font_6x8.c b/lib/fonts/font_6x8.c
> index e06447788418..700039a9ceae 100644
> --- a/lib/fonts/font_6x8.c
> +++ b/lib/fonts/font_6x8.c
> @@ -3,8 +3,8 @@
>
>  #define FONTDATAMAX 2048
>
> -static const unsigned char fontdata_6x8[FONTDATAMAX] = {
> -
> +static struct font_data fontdata_6x8 = {
> +       { 0, 0, FONTDATAMAX, 0 }, {
>         /* 0 0x00 '^@' */
>         0x00, /* 000000 */
>         0x00, /* 000000 */
> @@ -2564,13 +2564,13 @@ static const unsigned char fontdata_6x8[FONTDATAMAX] = {
>         0x00, /* 000000 */
>         0x00, /* 000000 */
>         0x00, /* 000000 */
> -};
> +} };
>
>  const struct font_desc font_6x8 = {
>         .idx    = FONT6x8_IDX,
>         .name   = "6x8",
>         .width  = 6,
>         .height = 8,
> -       .data   = fontdata_6x8,
> +       .data   = fontdata_6x8.data,
>         .pref   = 0,
>  };
> --
> 2.25.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

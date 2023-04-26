Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BEC6EF69E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 16:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D35710E947;
	Wed, 26 Apr 2023 14:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD3710E947
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 14:42:02 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-54fb9b1a421so55204797b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682520120; x=1685112120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rK+iQZUdgtSnkZ6Lx2wX0WHKPwvzBDLIrvkOHQDhz8A=;
 b=fw5iS3nQpTgqB2hgdUMoy2EPg8Dd8jZ6EHIMpEvr+dzJp1bczyfE3pSS9XzlcvG0g0
 syr5Y6hv8goLd+eg8+dMBMbvt96t0Q3ppz8vIcePnDw4QamyMz073vk+Ha2pEH6i01Uy
 VZjVReCm/738CY3Yaxwm53yXrkTCJLXkoTeZua4QwBUdtfXxHl+aqCpCHqW8iOBKQlXl
 3SrSjkT2DDCSTg+GZHTI+NKGqbJ+94ulhjFA5wzqTR2jErnz+xV1TjmjzrKqe2kSfCwU
 mdyXvGu7G8nqdbreyLsssgY2uO4PnoMcfOvkhtt1c9gKGUDUTNbR2rF6TvLVxCVR4n/W
 71OA==
X-Gm-Message-State: AAQBX9evkQqzDttgnWhYsntDugsHUHFqBq2VFeRnlp3+RA6qUnimE1GF
 OGmtFZMwB1AOWTe9JnGs7h6MkSXzSkt7Tw==
X-Google-Smtp-Source: AKy350aCd4aGDBsEGgTx7N0fbSPtW2lLZxZ/QZIyXTLjdolEbntV9AEDm1WogAm6TizYg+PLAHEWWw==
X-Received: by 2002:a81:6606:0:b0:541:7e07:ed65 with SMTP id
 a6-20020a816606000000b005417e07ed65mr12872958ywc.5.1682520120338; 
 Wed, 26 Apr 2023 07:42:00 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 y185-20020a0defc2000000b00555ca01b115sm4160762ywe.104.2023.04.26.07.41.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 07:41:59 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-54fb89e1666so55118267b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:41:59 -0700 (PDT)
X-Received: by 2002:a0d:db91:0:b0:501:611e:c6f8 with SMTP id
 d139-20020a0ddb91000000b00501611ec6f8mr13230025ywe.17.1682520119656; Wed, 26
 Apr 2023 07:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-2-tzimmermann@suse.de>
In-Reply-To: <20230425142846.730-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Apr 2023 16:41:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUO3oC5+f9G=scwcySr17puO3ozrW746xcuhAkWGy8tg@mail.gmail.com>
Message-ID: <CAMuHMdUUO3oC5+f9G=scwcySr17puO3ozrW746xcuhAkWGy8tg@mail.gmail.com>
Subject: Re: [PATCH 1/6] fbdev: Return number of bytes read or written
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Apr 25, 2023 at 4:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Always return the number of bytes read or written within the
> framebuffer. Only return an errno code if framebuffer memory
> was not touched. This is the semantics required by POSIX and
> makes fb_read() and fb_write() compatible with IGT tests. [1]
>
> This bug has been fixed for fb_write() long ago by
> commit 6a2a88668e90 ("[PATCH] fbdev: Fix return error of
> fb_write"). The code in fb_read() and the corresponding fb_sys_()
> helpers was forgotten.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/test=
s/fbdev.c # 1

Thanks for your patch!

> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -820,7 +820,7 @@ fb_read(struct file *file, char __user *buf, size_t c=
ount, loff_t *ppos)
>
>         kfree(buffer);
>
> -       return (err) ? err : cnt;
> +       return cnt ? cnt : err;
>  }

Looks all good to me, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, shouldn't the copy_to_user() handling in fb_read() be fixed,
too?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

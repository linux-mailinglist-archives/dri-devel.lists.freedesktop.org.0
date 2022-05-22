Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8091953026B
	for <lists+dri-devel@lfdr.de>; Sun, 22 May 2022 12:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEB210E066;
	Sun, 22 May 2022 10:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2722B10E066
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 10:30:38 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id b9so4633820qtx.11
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 03:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=flUjSOL8jzsTLGzNGG4aRYZ3gOkmaTV1EbLGclXSu1o=;
 b=o9GssBFk5iIQbAnBwhCQhprW15EHjiE0KYYBqKsfLU1M7CPGy8QstTCjCPCtFG1N1y
 SbNEHJ1DkglYaX4GVJTUTHJ+rEA8GGeIgfxj8RN0PLg2JMtNKdagzQxQU3cYho7bJtrE
 LKevZE3ZsiwZqy1y2wNhcA/ACiK7CN4CJe/QU8/iBVVvs7cR3QUcrP/eQ9jsMWh6obaG
 e/RURIwNgSFrPfn8V0x3Sp3KjHr+QWG7prOnhTsbr1CrXKB4zsmd2RRQV6TuXqezdbOD
 C/lMYrs6zyjXVqW8n54rldcw2Goim0NBkj6N34D4LKqlTpgDxlf+9FfaAN/2LHqahp67
 LHkA==
X-Gm-Message-State: AOAM531jOb7cMHt3rsij0qEvfntd2jb8pvJGLeTGIF8LxHEYvTxPn0ru
 CuVb6iW3PP+mtLW+CLtwtt+7Y4N9hyLBpA==
X-Google-Smtp-Source: ABdhPJymKXf1qr265QEVV54sDJ7PAP9sSz1HK7pHCrgu7x4YwOV8mowAQws+0yerpSqpsMhlnu4ytA==
X-Received: by 2002:ac8:7dc5:0:b0:2f3:f4d4:50e1 with SMTP id
 c5-20020ac87dc5000000b002f3f4d450e1mr13257597qte.561.1653215436884; 
 Sun, 22 May 2022 03:30:36 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 p189-20020a37a6c6000000b006a0ffae114fsm2688203qke.120.2022.05.22.03.30.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 03:30:36 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id j2so20933706ybu.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 03:30:36 -0700 (PDT)
X-Received: by 2002:a25:e04d:0:b0:64d:6f23:b906 with SMTP id
 x74-20020a25e04d000000b0064d6f23b906mr16858388ybg.380.1653215436251; Sun, 22
 May 2022 03:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220521195942.645048-1-trix@redhat.com>
In-Reply-To: <20220521195942.645048-1-trix@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 22 May 2022 12:30:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVELy4M2Xog+NykEpb=k5sw+B1iYzC6O1Otsz75qMWBRA@mail.gmail.com>
Message-ID: <CAMuHMdVELy4M2Xog+NykEpb=k5sw+B1iYzC6O1Otsz75qMWBRA@mail.gmail.com>
Subject: Re: [PATCH] xen: remove setting of 'transp' parameter
To: Tom Rix <trix@redhat.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 22, 2022 at 3:22 AM Tom Rix <trix@redhat.com> wrote:
> cppcheck reports
> [drivers/video/fbdev/xen-fbfront.c:226]: (style) Assignment of function parameter has no effect outside the function.
>
> The value parameter 'transp' is not used, so setting it can be removed.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

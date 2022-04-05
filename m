Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEA94F2388
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 08:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A6710ED22;
	Tue,  5 Apr 2022 06:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA2710ED22
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 06:46:20 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id s11so9722939qtc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 23:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UuWjfy1DmKGBwxecHn9QW28Mp8RGeP8Fe6idp3HhRGs=;
 b=0ZUHhHPHlMix1g7f2T8Vjs4apKmxs6Sbfhj/LnrAOA5akl9nN8RgQZYWOBJkVZsUGA
 c0BMbBc6nlZwMuHp73xBBd13CNTg4CfSoCGOZOYZSBa6kIRFZxlplJwcs3VNEjlAeyOm
 vKWut1+ZW7GEReDZfVYvrQBOJY5GcX7YV4kUcdRpE3kscHGz37EYZythfuOXD3B+P9H6
 RS/dP89kVQ9Gy9+FGWFEkXMAEd3cQwmqVxft8mymPlLW2WRaFjfHjYqC+MmfrM3j8HNW
 OHK82cTLX20ashJxgchdxgarBIWhLH+xSgpcRojy1PcdHIRLHA2npji5C8n6P0LFHBpv
 Ba4Q==
X-Gm-Message-State: AOAM531k8vSL3jgI2BHXoWWrOCP/xhp9G/Tn2cke7m2SgJwgZKuzRXl7
 hE2hnO3A+kVn4Bttc0D3vWNUsm8+WNO/QQ==
X-Google-Smtp-Source: ABdhPJyKoQD8T10+6vTL6z4CX1iI4D1e+kqsUO6n+RlsOLHdeBLD3f4WltkIe5TG5Ku7CclUm0pgJQ==
X-Received: by 2002:a05:622a:64a:b0:2e1:d8b4:c6a1 with SMTP id
 a10-20020a05622a064a00b002e1d8b4c6a1mr1710751qtb.0.1649141179117; 
 Mon, 04 Apr 2022 23:46:19 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 s16-20020ac85cd0000000b002e1ed82f1e5sm11097973qta.75.2022.04.04.23.46.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 23:46:18 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id l36so14198710ybj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 23:46:18 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id
 66-20020a250045000000b0063396e22179mr1490905yba.393.1649141178137; 
 Mon, 04 Apr 2022 23:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wg6FWL1xjVyHx7DdjD2dHZETA5_=FqqW17Z19X-WTfWSg@mail.gmail.com>
 <20220404074734.1092959-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg>
 <874k38u20c.fsf@tynnyri.adurom.net>
In-Reply-To: <874k38u20c.fsf@tynnyri.adurom.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Apr 2022 08:46:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_-3TOHYehUsHeqwHjQtzN1Ot886K7vwPr4P-4u8eehw@mail.gmail.com>
Message-ID: <CAMuHMdV_-3TOHYehUsHeqwHjQtzN1Ot886K7vwPr4P-4u8eehw@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.18-rc1
To: Kalle Valo <kvalo@kernel.org>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 USB list <linux-usb@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma <linux-rdma@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 linux-um <linux-um@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-xfs@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kalle,

On Mon, Apr 4, 2022 at 8:39 PM Kalle Valo <kvalo@kernel.org> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> >> /kisskb/src/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:
> >> error: case label does not reduce to an integer constant: => 3798:2,
> >> 3809:2
> >
> > arm64-gcc5.4/arm64-allmodconfig
> > powerpc-gcc5/powerpc-allmodconfig
> > powerpc-gcc5/ppc64_book3e_allmodconfig
>
> After v5.17 there were two commits to brcmfmac/sdio.c:
>
> $ git log --oneline v5.17.. drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> ed26edf7bfd9 brcmfmac: Add BCM43454/6 support
> 6d766d8cb505 brcmfmac: pcie: Declare missing firmware files in pcie.c
>
> I can't see how either of them could cause this warning. Could something
> else cause this or am I missing something?

Doh, I should not have reduced the CC list in the xfs subthread...

The builds above are all gcc-5 builds, so they are affected by the same
issue as XFS: unsigned constants that don't fit in int are lacking a
"U" suffix.

I assume Arnd's patch for
drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
fixes this?
https://lore.kernel.org/all/CAK8P3a0wRiS03imdXk2WbGONkSSczEGdE-ue5ubF6UyyDE9dQg@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

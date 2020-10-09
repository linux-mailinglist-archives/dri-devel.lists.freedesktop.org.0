Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D279289BB9
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 00:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8ACE6EE2D;
	Fri,  9 Oct 2020 22:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B0D6EE2D;
 Fri,  9 Oct 2020 22:23:50 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id c1so3577426uap.3;
 Fri, 09 Oct 2020 15:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MC2fdfaVlH+mre+0j68WIGjdkJNggJpOVWSfFdZZdnw=;
 b=XZmOlRsOCHpujdKPV0Rl4sSCvaW3+YVO2UzijM1DQaULwXDmE3Dr/V8sq6nAj2UrQ2
 ZpeIFQDI+n5W4yyaedQ9W9ha8JGVRNbVG9cW6TMKrHaHYE0yB4BEpj0ROqDaKt6a6nNr
 OFvwZxJcD75OHYduMT5/a91Ft9Sj3BYUslA81miQBcqkc6ECZebCO9XjND9xJRjPqcuK
 cuY4kUGz/ElQzi4marVROJSTU7cru0jVMNAWiCN5/SezZ/Un+hUCAfsRzefEYCxRCvNZ
 f51zJWlTpwY4eXBBBTj7UwXjP82cYbxcOoFi3B0AbyGwOPRzw9hkwHUqZD/1EMx3mgi4
 Mekw==
X-Gm-Message-State: AOAM533uK1950uzU2/EonVmnnNbe+yzp2SSasp2qq6oVxiCqTrYISAKV
 Dpt2DwFFvRpwU5dnVm3GE06yErckqVud/vpVGas=
X-Google-Smtp-Source: ABdhPJxRORGEoBoiWaD7aBjfjM/aj4zhCreHXHY13cwCyqx2s3N45kFjyL/xYEYp1WZ89Nylw49RNQox0CWiW8A+VrU=
X-Received: by 2002:ab0:2117:: with SMTP id d23mr8803869ual.15.1602282229545; 
 Fri, 09 Oct 2020 15:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <202010092326.20482.linux@zary.sk>
 <CACO55tuj_=PUYuBnJLZgCEize_8Po0VnuDVPtkHLEZxL3RgF7Q@mail.gmail.com>
In-Reply-To: <CACO55tuj_=PUYuBnJLZgCEize_8Po0VnuDVPtkHLEZxL3RgF7Q@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 9 Oct 2020 18:23:38 -0400
Message-ID: <CAKb7UvggVn2c=jUNSfjf6r529n89xfNgVBpn3jnXznVh8Gs4+w@mail.gmail.com>
Subject: Re: [Nouveau] nouveau broken on Riva TNT2 in 5.9.0-rc8: GPU not
 supported on big-endian
To: Karol Herbst <kherbst@redhat.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ondrej Zary <linux@zary.sk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 9, 2020 at 5:54 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Fri, Oct 9, 2020 at 11:35 PM Ondrej Zary <linux@zary.sk> wrote:
> >
> > Hello,
> > I'm testing 5.9.0-rc8 and found that Riva TNT2 stopped working:
> > [    0.000000] Linux version 5.9.0-rc8+ (zary@gsql) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #326 SMP Fri Oct 9 22:31:40 CEST 2020
> > ...
> > [   14.771464] nouveau 0000:01:00.0: GPU not supported on big-endian
> > [   14.771782] nouveau: probe of 0000:01:00.0 failed with error -38
> >
> > big-endian? WTF? The machine is x86.
> >
>
> mhh, we reworked the endianess checks a bit and apparently that broke
> something... I will give it some thoughts, but could you be so kind
> and create an mmiotrace under 5.9 with nouveau? You won't need to
> start X or anything while doing it. Just enable the trace and modprobe
> nouveau and collect the trace.

Looks like nvkm_device_endianness unconditionally reads out 0x4. I
don't think that reg is there pre-NV11. At least NV4, NV5, NV10 and
maybe NV15 (which is logically pre-NV11) don't support big-endian
mode. Not sure about NV1A, which was the IGP of the series and IIRC
logically pre-NV11 as well (but clearly could only be used with x86
chips, since it was part of the motherboard).

Aha, it's documented in rnndb:

https://github.com/envytools/envytools/blob/master/rnndb/bus/pmc.xml
<reg32 offset="0x004" name="ENDIAN" variants="NV1A-"/>

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

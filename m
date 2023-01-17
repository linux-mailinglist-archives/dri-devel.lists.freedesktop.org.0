Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB4466E680
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 20:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA1310E329;
	Tue, 17 Jan 2023 19:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A1E10E332
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 19:01:24 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1442977d77dso32989365fac.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 11:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OgaymgAXi9Z6g6pYwBOzM02/P477EqWitgDVTE3LFbU=;
 b=7UFMvbpKkJyjWVLlq6ctk0nXiLL3RrLgvGqk+/g8pD0wAzMEFNodkoMNXxSPAzvJye
 T4nqVDpRCF5Pkw4fe0ROrd1BjE8DZbycDcUSRlgnihtqJaZkkqELJ7TzEZYyPHojRNxM
 MBh6YZCgcmJgLXwboxe3bvrjmez4qHhfCRIxGuc2G0+QOOJ/eKT38XBZ7MfSSmNLVm7z
 gDt6C3Ymsnj+eKLcMZ0dj5q2KFKnZutgcY/1C6+IgeLmT5DwAU4QsUhG6TCQdnlD6nEb
 fYtWfawIuB6wYahQA/cq89ISwAR2GZXbrrCFpCVxRJqHc9Mn337ID3jg/QgfKjbyHIu6
 BObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OgaymgAXi9Z6g6pYwBOzM02/P477EqWitgDVTE3LFbU=;
 b=FwgbYhVrve9TClF2Ox0ioMyVHbuMprVvAKNth7xNOsRwW9ZxqPgjsa8639JfFspbDj
 w+scWnno/TWzW8NwxGE4jmTgf2Gt3xJ+GqKljBJKHMy+ZGbSMSECONkN68zMUhCMfNOo
 OclacmDkS26SzOk+6f3dI5FsatvUAic/YJGsBDy61cY/erCvW7e3QSgv3B3C782TXKtc
 RhEP2VVsvK+pc/4y0eovFSqH65ftC8m+2Y9v0g284BwVhNfHpHGD70XCvxcI8skZJvLa
 wGAO1A94KXO7oqEZY/XJ8Sz7VLT++8vwKWqwibEAIzq8DveZ1RUADzLLywDeJTKClXOx
 xZEQ==
X-Gm-Message-State: AFqh2krkXRDBxekb27WYSOaMzYLXiOoSUnIIn1BKuR2lARxPAUMM6Hte
 7BmleAkqZNIR8lCY2PRM/0Hhdw==
X-Google-Smtp-Source: AMrXdXsgzCxMhqm+bb3il7EsJjEv0NbGPCzT1qf9VREFYRxVllxrk/YEzaFAyrBdtefAaDgGfnk/UQ==
X-Received: by 2002:a05:6870:c190:b0:15e:cfca:b312 with SMTP id
 h16-20020a056870c19000b0015ecfcab312mr2807015oad.52.1673982083592; 
 Tue, 17 Jan 2023 11:01:23 -0800 (PST)
Received: from [192.168.86.224] ([136.62.38.22])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05687080d200b0012763819bcasm16664335oab.50.2023.01.17.11.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 11:01:22 -0800 (PST)
Message-ID: <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
Date: Tue, 17 Jan 2023 13:13:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: remove arch/sh
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
From: Rob Landley <rob@landley.net>
In-Reply-To: <20230116071306.GA15848@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/16/23 01:13, Christoph Hellwig wrote:
> On Fri, Jan 13, 2023 at 09:09:52AM +0100, John Paul Adrian Glaubitz wrote:
>> I'm still maintaining and using this port in Debian.
>>
>> It's a bit disappointing that people keep hammering on it. It works fine for me.
> 
> What platforms do you (or your users) use it on?

3 j-core boards, two sh4 boards (the sh7760 one I patched the kernel of), and an
sh4 emulator.

I have multiple j-core systems (sh2 compatible with extensions, nommu, 3
different kinds of boards running it here). There's an existing mmu version of
j-core that's sh3 flavored but they want to redo it so it hasn't been publicly
released yet, I have yet to get that to run Linux because the mmu code would
need adapting, but the most recent customer projects were on the existing nommu
SOC, as was last year's ASIC work via sky130.

My physical sh4 boards are a Johnson Controls N40 (sh7760 chipset) and the
little blue one is... sh4a I think? (It can run the same userspace, I haven't
replaced that board's kernel since I got it, I think it's the type Glaubitz is
using? It's mostly in case he had an issue I couldn't reproduce on different
hardware, or if I spill something on my N40.)

I also have a physical sh2 board on the shelf which I haven't touched in years
(used to comparison test during j2 development, and then the j2 boards replaced it).

I'm lazy and mostly test each new sh4 build under qemu -M r2d because it's
really convenient: neither of my physical boards boot from SD card so replacing
the kernel requires reflashing soldered in flash. (They'll net mount userspace
but I haven't gotten either bootloader to net-boot a kernel.)

I include sh4 in the my mkroot builds each toybox release, I have a ~300 line
bash script that builds bootable toybox systems for a dozen-ish architectures,
including building a kernel configured to run under qemu:

  https://github.com/landley/toybox/blob/master/scripts/mkroot.sh

And I ship the resulting bootable system images, most recent release is at:

  https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/

As described at:

  http://landley.net/toybox/faq.html#mkroot

Various people in Japan have more hardware, but I haven't made it physically
back there since 2020. (My residency card expired during the pandemic.)

Rob

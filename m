Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B88916DE6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 18:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4E210E1A1;
	Tue, 25 Jun 2024 16:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GjSdL+TM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E7C10E1A1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 16:21:30 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dff0712ede2so5614522276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 09:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1719332489; x=1719937289;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qb2E6wZdQOD4FpB99oMUsAKBgWpj20AwfW8pSsc6D5k=;
 b=GjSdL+TM/MZC9VWYhNoH19ScNOa3QW6QYGorXvcMuY0wZWYCWG1fS2kNV4/w+5E7Kh
 Zyze2Xe3AW1uyoKDdBD+PcOToXI7XPHEdm/598cTvYOtODUVgGrgckf/TCoOIy6Ie5yP
 GfexcD85Hiah4npb2FcfG2lqwqmPwkzDWzEqpCJrQYjPrw/P50zDjJkzOoDlO3Vx4KbB
 eAyQnJxSTszThBdeHm1B7oSfejC48IUvd83zwL6zBVqaRSz6b/0pm8JnKc+zHWPjcoTj
 bHJyCD4Vs6oMTeovBaBtLJcOF/PHHvevBfIQZDyypX7ZVcXDeqEY6kBLsghKoFsk/XdP
 sHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719332489; x=1719937289;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qb2E6wZdQOD4FpB99oMUsAKBgWpj20AwfW8pSsc6D5k=;
 b=w8gn2F1U9y2CURpLajUv4ntMJCfRAy5ngW8uTuXZWoKW5sy+1ULnPNRWGaEWyR+mhr
 iXikMIIvb8elSFzt2TGPNdXXBE7JrEFoKk30jhtUT98M64Fh7x2rb2Yk1AWMmfDlT0qP
 fl8ShPZJHWxTkXWyI0MfRohFH2gWWsP+IsqYgNvtDqrUmJiE/PvG8HjLR4D2hrtX2x5W
 nnJYlTERRdFzMjk3KFN5UUhMMSPvrj9bwEkh4mn061+Z+HZ+CPWsEJ/c4ICgnGpbWpiR
 QjO1YXnuQrU1RtgQlbQI4YuooZrC34XsMP9deIh+2UlR4xkdsmXOsSnDtJXOH4WY9vNm
 4MOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv2p631qd/ZA5UYVMOojSc29WAlNWOXgN0aM/4nnjJdlmz/hSzSrne1oI27g6BaORj+0M1CAJXe5CzjsdyQGAe7leszSmzXZT55tOqA6Ke
X-Gm-Message-State: AOJu0Yz4YRJ5FEqeDZsyIOxty2apWOz/7gZ4g9W5ERZp+RYo1O0WAoVX
 +LQ54yE2DcnYlWjCWDHpVlFGt8scFiWHVGZeDWyrJUGFUMCJlcd6B98OOcdXD5k3GwrQVAakqiU
 pQgW9TpP31X9TQeVYc2SeRa7ggzbLaD8kuOoPrw==
X-Google-Smtp-Source: AGHT+IFvJFRMGLkvlz90nUmrwbH4uLb1Am8e4l5s0tWHQCH+l8Gv5Qv98MQC7wZStmOIUJKeQ6T13TtnSRScfn8cC/s=
X-Received: by 2002:a25:28b:0:b0:e02:bd27:ffa0 with SMTP id
 3f1490d57ef6-e0303ff97e2mr7397168276.47.1719332489288; Tue, 25 Jun 2024
 09:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240524182702.1317935-1-dave.stevenson@raspberrypi.com>
 <20240524182702.1317935-2-dave.stevenson@raspberrypi.com>
 <20240528063332.GA30051@lst.de>
In-Reply-To: <20240528063332.GA30051@lst.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 25 Jun 2024 17:21:12 +0100
Message-ID: <CAPY8ntDuKjD08Q0Y8uukpd7ep85y2qoGDv8hPFxu3QPmL8+wew@mail.gmail.com>
Subject: Re: [PATCH 01/18] dma-direct: take dma-ranges/offsets into account in
 resource mapping
To: Christoph Hellwig <hch@lst.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Vladimir Murzin <vladimir.murzin@arm.com>, Phil Elwell <phil@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org, iommu@lists.linux.dev, 
 linux-sound@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph

Sorry for the delay in coming back to you.

On Tue, 28 May 2024 at 07:33, Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, May 24, 2024 at 07:26:45PM +0100, Dave Stevenson wrote:
> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> >
> > A basic device-specific linear memory mapping was introduced back in
> > commit ("dma: Take into account dma_pfn_offset") as a single-valued offset
> > preserved in the device.dma_pfn_offset field, which was initialized for
> > instance by means of the "dma-ranges" DT property. Afterwards the
> > functionality was extended to support more than one device-specific region
> > defined in the device.dma_range_map list of maps. But all of these
> > improvements concerned a single pointer, page or sg DMA-mapping methods,
> > while the system resource mapping function turned to miss the
> > corresponding modification. Thus the dma_direct_map_resource() method now
> > just casts the CPU physical address to the device DMA address with no
> > dma-ranges-based mapping taking into account, which is obviously wrong.
> > Let's fix it by using the phys_to_dma_direct() method to get the
> > device-specific bus address from the passed memory resource for the case
> > of the directly mapped DMA.
>
> My memory is getting a little bad, but as dma_direct_map_resource is
> mostly used for (non-PCIe) peer to peer transfers, any kind of mapping
> from the host address should be excluded.

Could you elaborate on mapping from the host address being excluded?
On BCM283x DMA address != CPU physical address, so some mapping has to occur.

Robin Murphy directed us at dma_map_resource() in [1], and referenced
this patch as necessary because dma_map_resource() didn't currently
use dma-ranges mappings.
Mark Brown also hadn't corrected/objected to the statement that
dma_map_resource() was the correct call when I was querying how to
tackle this historic mismatch in [2].

I'll happily defer to the experts on DMA (I would never classify
myself as such), but I'm not clear on the direction you want here.

[1] https://lore.kernel.org/lkml/ee19a95d-fe1e-4f3f-bc81-bdef38475469@arm.com/
[2] https://lore.kernel.org/linux-arm-kernel/CAPY8ntBua=wPVUj+SM0WGcUL0fT56uEHo8YZUTMB8Z54X_aPRw@mail.gmail.com/T/

> (dma_direct_map_resource in general is a horrible interface and I'd
> prefer everyone to switch to the map_sg based P2P support, but we
> have plenty of users for it unfortunately)

Is that applicable for mapping device addresses with DMA_DEV_TO_MEM or
DMA_MEM_TO_DEV transfers?
Example use case on BCM283x is HDMI audio where the HDMI driver should
be passing in the CPU physical address of the audio FIFO, and that
needs to be mapped to the DMA address for the DMA controller. How do I
get a sglist for the peripheral address?

As noted in the cover letter for this series, if this isn't the
approved mechanism, then please let me know what is.

Many thanks
  Dave

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7871A78C4AD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 15:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8172E10E03B;
	Tue, 29 Aug 2023 13:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB8B10E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 13:00:40 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E0CC86607214;
 Tue, 29 Aug 2023 14:00:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693314039;
 bh=mQDEZvbsKHU6Hgw90+jlouja2pjqsp3La4v91PjtpD8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ooo9a/cSX0zBrwAPnaB+9BIR0D7y2slJukIbJeeYfouq4fOPV0YYwYqf19MxaFu14
 EB8g/Sru0df1D43WJsYe5YC9KHp4H7AufTUky5rlQeIE7A2WK6lbR+vDHZbB0msJU+
 CFPp1wdkNXKHUbvWiZoSdTkSPATjneyJsQulRwMo+xyEXzk4LVUYuGuX9eXFFLiNbI
 UGIr8a/EoG9e8xF/mdc3dYCAx2NaZysHA+nbls3O9I6gjPIj1Bdwdo7uFHruXl8Hjf
 dWgV4pz9WnBPISE8JMditx0wn0HBi0p9L/qwLZAtR97A+G4dHE4MXpEnqNEzPsJwXk
 RzUrRKemdDDXQ==
Date: Tue, 29 Aug 2023 15:00:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 03/15] drm/panthor: Add GPU register definitions
Message-ID: <20230829150035.158d2817@collabora.com>
In-Reply-To: <2b801b98-5158-5aba-9ab7-23b0b0b9c0a1@arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-4-boris.brezillon@collabora.com>
 <2b801b98-5158-5aba-9ab7-23b0b0b9c0a1@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Aug 2023 15:13:23 +0100
Steven Price <steven.price@arm.com> wrote:

> > +#define AS_TRANSCFG_LO(as)				(MMU_AS(as) + 0x30)
> > +#define AS_TRANSCFG_HI(as)				(MMU_AS(as) + 0x34)
> > +#define   AS_TRANSCFG_ADRMODE_LEGACY			(0 << 0)  
> 
> I don't believe legacy mode exists any more (it's not in my copy of the
> spec).

Oops, I'll drop it.

> 
> > +#define   AS_TRANSCFG_ADRMODE_UNMAPPED			(1 << 0)
> > +#define   AS_TRANSCFG_ADRMODE_IDENTITY			(2 << 0)
> > +#define   AS_TRANSCFG_ADRMODE_AARCH64_4K		(6 << 0)
> > +#define   AS_TRANSCFG_ADRMODE_AARCH64_64K		(8 << 0)
> > +#define   AS_TRANSCFG_INA_BITS(x)			((x) << 6)
> > +#define   AS_TRANSCFG_OUTA_BITS(x)			((x) << 14)
> > +#define   AS_TRANSCFG_SL_CONCAT				BIT(22)
> > +#define   AS_TRANSCFG_PTW_MEMATTR_NC			(1 << 24)
> > +#define   AS_TRANSCFG_PTW_MEMATTR_WB			(2 << 24)
> > +#define   AS_TRANSCFG_PTW_SH_NS				(0 << 28)
> > +#define   AS_TRANSCFG_PTW_SH_OS				(2 << 28)
> > +#define   AS_TRANSCFG_PTW_SH_IS				(3 << 28)
> > +#define   AS_TRANSCFG_PTW_RA				BIT(30)
> > +#define   AS_TRANSCFG_DISABLE_HIER_AP			BIT(33)
> > +#define   AS_TRANSCFG_DISABLE_AF_FAULT			BIT(34)
> > +#define   AS_TRANSCFG_WXN				BIT(35)
> > +#define   AS_TRANSCFG_XREADABLE				BIT(36)
> > +#define AS_FAULTEXTRA_LO(as)				(MMU_AS(as) + 0x38)
> > +#define AS_FAULTEXTRA_HI(as)				(MMU_AS(as) + 0x3C)
> > +
> > +#define CSF_GPU_LATEST_FLUSH_ID				0x10000
> > +#define CSF_GPU_LATEST_FLUSH_ID_DEFAULT			0xffffe0  
> 
> I'm not sure why we need the default value of this register? Seems an
> odd thing to include.

I'm using it to set the dummy FLUSH_ID page to the reset value on
suspend, which you suggested to set to zero or one. If we agree on that
(still want to explain the reasoning before taking a decision), I'll
drop this definition.

> 
> Steve
> 
> > +
> > +#define CSF_DOORBELL(i)					(0x80000 + ((i) * 0x10000))
> > +#define CSF_GLB_DOORBELL_ID				0
> > +
> > +#define gpu_write(dev, reg, data) \
> > +	writel(data, (dev)->iomem + (reg))
> > +
> > +#define gpu_read(dev, reg) \
> > +	readl((dev)->iomem + (reg))
> > +
> > +#endif  
> 


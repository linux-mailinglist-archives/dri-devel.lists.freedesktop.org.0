Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588C99639C1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 07:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6AB10E194;
	Thu, 29 Aug 2024 05:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="cHEoehbu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4008910E194
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 05:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1724908225; x=1725513025; i=markus.elfring@web.de;
 bh=x0H5LhWeBnap376Af69NmB4TBfSaSBhzBfGyQjPVPB8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=cHEoehbuOE6W4x4I+N76/6FiOuExmeFWUQhfWdrSV6PTsN/9DWrmoO0yxJsOUl2V
 WQyAXumerCU8oJtd1SB2jlFzuc0w1jifSl1EE0sPCoX8YxiIZyqCm094CmDAsq9BO
 byzdlRxIWacR1tQrZbE5k0N995stzs+mcvg6NI5iIk2X0M2o/AotPb2xv5AxmNKjx
 4v5W1d0DkJa55QzPs5OJInjNm3cN0Gu0cHromuMOj8F7XvPHLRjJU7dhROuz8PTr/
 a3803NJS2XlpDqnlHyTa+9l0+fjKyRHXoimeADK7tg26lV7/WzLbV3ixPQLueS/hF
 FT/i/2q+bk5syQNi+g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Myv72-1rp71X22zK-00uSO5; Thu, 29
 Aug 2024 07:10:25 +0200
Message-ID: <75ffe2db-a5d5-471b-9e8b-53b98e75368e@web.de>
Date: Thu, 29 Aug 2024 07:10:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hui-Ping Chen <hpchen0nvt@gmail.com>, linux-mtd@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240821071132.281018-3-hpchen0nvt@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240821071132.281018-3-hpchen0nvt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P17nbWou0TFVsrRb5ZgVibk9Jj9ThMZLILYHiiSBcaB4zGnpU7i
 d3nGa573rBMdE/Sn7xSbbnb4oG20qYzkXmvPMobuVmM2/OOl25j7K2jCCqjwFMBOwvNDosc
 3P5I8cuiD2iyp1ey55TCcv/3krjIddp9i+FsQ2jR4V7aNrDZHIRxiwOCjLHSE12IE339m/M
 EWV4excC/Vf/yiN1hOa5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uyUJvvjWHBA=;lmK5yfkuO6oybTgUqjJef7gzTex
 C+IW3/jqkkEk+ehwv0zec1lU4cceppSd2W4RDl2aDbvRfuhOc03lCoKS9TkcPoXzV2aaZyB4x
 a7S/FoTIuXAscD78GSCSfXhVAUxbDzYYLRPP6c0f0XW6u/Th73nPovPIgW5X7n9o4+arSYRoa
 2G09L5hafj4i+oQiyUN155ulJ2skjCRzJjjw1O+x3sneXPdtYrfL/2VjV+6eCVTcL+HukpKcz
 BgXHULCNz9bsQzrwgEW/cSOvCAH+5NsLAPvH/IzvD7xnBMI6xw9s7QY/VLEuvrXrj05shXOb8
 k5bAR8x/VWWz1bZYuuqsXvy8Zv7fJfZ/0M7EYxRQT8iXRSCB4GsAw9tSqBM6n+s8S1eyHTOgp
 +J831BdHjlxrhuWd+Y9YAQUMTU+E/Aaye0hHVyXZCccxL/IdLQKA3jlVCXalyrKGbBM3kjp1I
 Be9+K66xldnuE3yO/tREJNMX1KLbYrwSKIzLK+i2wyHxkVgCh1NWCxzebysQo2d4DNih6DUdi
 feVPauS3pLZVyia992XftojjPmTmMdL0TBgLjoosZaw1iSeakczlH6YuP6Sfx7j5Wm+o2FDtb
 3Czh+AUiZN+0wreGIEa5BCWmoqPlvP1M88YO8IQuGe58/J9l5b4uNpTcQGl96pNpkNhjbDjRR
 dkLVvX5NNLPQjHjEm6v+bIbRKUO1iReFOG4HRwgjhX2e6HwlKJ0PMLyC/X/uoK/t7kLQe3QXE
 QwObMRqOyZpZxIfMnCg9v/zXzBHGyuGs1t43LhfeIoumZYy6OyJsFvlc7qv9KUz6Em9aPpS4X
 0ojkGP9/sW9GbLSQamt+VVvg==
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

> Nuvoton MA35 SoCs NAND Flash Interface Controller
> supports 2KB, 4KB and 8KB page size, and up to 8-bit,
> 12-bit, and 24-bit hardware ECC calculation circuit
> to protect data communication.

You may occasionally put more than 53 characters into text lines
of such a change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.11-rc5#n45


=E2=80=A6
> +++ b/drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c
> @@ -0,0 +1,1068 @@
=E2=80=A6
> +static irqreturn_t ma35_nand_irq(int irq, void *id)
> +{
=E2=80=A6
> +	u32 isr;
> +
> +	spin_lock(&nand->dma_lock);
=E2=80=A6
> +	spin_unlock(&nand->dma_lock);
> +
> +	return IRQ_HANDLED;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock)(&nand->dma_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc5/source/include/linux/spinlock.h=
#L559

Regards,
Markus

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A7937D08
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 21:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658CD10ECAF;
	Fri, 19 Jul 2024 19:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="o4jfNsaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2D910ECAF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 19:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1721418174; x=1722022974; i=markus.elfring@web.de;
 bh=XdQo978hRhSu8hM06roh7Tew0L0VVxDPucLV02cKyPY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=o4jfNsaMGhzFX5LW9JO7Gtukc8h7ZmQveyKm9f88V3SEeHuft9puFpf1LYKQBr7n
 vdI0iZB82Tg8WZsu2QBN7yZtvXoofpFgRrLJD30iYBB4cBdQn4AEWdLMvNiCZpJCu
 w8YGKRmBzLSgLrdRGxraC+u61QOaK2d3fqBkP7fESE1HJH1rmanpLQrBdSNVzypVZ
 4zP7eHpwR87EY/mJ02pNIjjxZm/xslxlDnp9+KvCBFgY3TC3OUWhfIlZDFd+O73T/
 wpRDoKwQLm67P5tzXCCXP7M+ahmFJoE7k17wW/KoU5ZxV6wu1tRTdDTwx3DAKtq2S
 /6WoPT+rku4mJGW6qg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MmQYd-1s4fM72cbZ-00mOXn; Fri, 19
 Jul 2024 21:42:54 +0200
Message-ID: <7a419902-f45e-45bc-bd9c-3b3e434f9e7a@web.de>
Date: Fri, 19 Jul 2024 21:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: George Yang <George.Yang@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Min Ma <min.ma@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Max Zhen <max.zhen@amd.com>,
 Sonal Santan <sonal.santan@amd.com>
References: <20240719175128.2257677-2-lizhi.hou@amd.com>
Subject: Re: [PATCH 01/10] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240719175128.2257677-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Fn7rppQ3jnGXNy7LucW3aU0X3tgjl2Av2G5DVyWrblsBGnlVuCJ
 HKBxgFv03UWtWyTgoPQ+SMLqJoPzU3zgA98uyeHuVwN+xktcscaZ10dOCA3VDMbkwkBu3Ew
 Rqt2Ofh00VX2YxS1DwZRcoHUpBwje4NyQZumE2tcdLY2+m7abvJ7nZredDDtCIaLCGb+pFs
 7g/yyE7eMOx3uWPfiIIqw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:B9F4nfLKQ4I=;kMj1+AXKPM9WZlQe1gqrmFmci8k
 yPFPT6426dcawxgDcqum+XLLrOIv4gTrTHZXMvo8kQgfUs5vdYqUB0kONydWToFe2pU7IiCXI
 hHx3ft7khrbKRI9Hv4yHABVH0yfKPnQu2sEjZ9PRii1H1aNtAG1i/rTJIIw3ZZJXRe+jX3VPd
 IO4gVrhpTG4bKu6SoeBrhwi2EBAyhx0EdqAzOkmCsdRXpA8fy16NDIxGnvYTQkMsMCxWPJVC0
 gN2jaDd4agRaSKgYoNdhkiDOOJbHUN4EeSwH9SFea3RQNTHbZkiASwPxXeYUli0wNCJ/AYJQR
 aU7yznMlRcw9vykOFBiYBD6J/hu9bARsEh//J5W/TU0K06j5xe0vsoP7Gi6Ktz6FycAyIkvy7
 GxTQQ8xWJGAJAZ7vUWZMiLjoYnRApsDZGzDkH+er90TUzCb4pwZSksTAJjrZTZgoyDJo9p/ZL
 YE88Muq5XPL8mn7CiHw8bEUqcJnR6whurGdedXW3LI4904cRczO1By3QO1RsEOiHYmUr9qxAT
 6KmkSUnYK9Vu94FFmum4slBfve/lU/uhTRRCaQnGd8rnkZ3hIgcTwWAoZE0t2WZa71ZWI/i5x
 x5Nh3Gpl2w6gG+LESPj6gOrQX0AVSKGkSNeobEXXCHNfXcaj44DQOxZPNGk2DjQ5myqPxlVzS
 i1Hz3o6/7Cw3qpj5HJa2jEptQUDYLT6NEJaWNZX8e0XHLNC5TfDCMtVAPDa1dT0SiR873DzV2
 S8O4R76BhVG01rNSyoRyZKaZ7c3fVDsj6V5ct/07rfwyoZ6w25F3xDl0iXFyVz9jOA54qXzr0
 lD7wM2mb3r1LhX2xjuDzMuOw==
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

=E2=80=A6
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -0,0 +1,118 @@
=E2=80=A6
> +static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_=
id *id)
> +{
=E2=80=A6
> +	mutex_lock(&xdna->dev_lock);
> +	ret =3D xdna->dev_info->ops->init(xdna);
> +	mutex_unlock(&xdna->dev_lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&xdna->dev_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc5/source/include/linux/mutex.h#L1=
96

Regards,
Markus

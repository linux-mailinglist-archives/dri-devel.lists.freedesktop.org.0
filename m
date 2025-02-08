Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB546A2D71E
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 17:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F1C10E021;
	Sat,  8 Feb 2025 16:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="sQbTsvoQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B6E10E479
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1739030448; x=1739635248; i=markus.elfring@web.de;
 bh=Fg2JiZMmnK61MdHBlVq6XhIHAvPp2DJJ0WNo23hTHWY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=sQbTsvoQxKsSobMXrvfOogsNZ9YnCYEQpBCFx4l/wbkoJPk6SZ4tOVNTGq7Hyw6h
 LX5dMdKoHDRBB2aS1cPGKmf5DMp8aAmVKbrvy+fx9ZKv0f5aL9LoqLThZCu1a3VED
 RQF6vrLTqZppfe0FZGTl2mqY1QUB1pyVgaP8hkITP9mFfNu33dEnPWdD0XW3xy37n
 khj52+hT0yu8OWFaLaC+WDKtAf9C94ZLjxrJUGG9HHr+0Uhd5QLorLrA1+XHIC4Jc
 f13v9uHV65/TkP1ubYEwEyC0Bw+jUjp4gRHhCbmEVIA6EOqMj4UKwR23SuTng3b5s
 502ko6QrH2BJqGjSJg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.11]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mmyr7-1swxyp0sFj-00adxo; Sat, 08
 Feb 2025 17:00:48 +0100
Message-ID: <af94dab5-266f-4b1d-95e1-d11a41ebe3e0@web.de>
Date: Sat, 8 Feb 2025 17:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charles Han <hanchunchao@inspur.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Vishal Sagar <vishal.sagar@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20250208100323.11625-1-hanchunchao@inspur.com>
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: Add NULL checks in
 zynqmp_audio_init()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250208100323.11625-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:tWX9Yp8k5eSbPZvEe2id20EXKcSWu0YgkMbUFdQ9fiDBwmd7chG
 aHIDVWOgnhfr1Y/Qs+a8/X6Jkb2yrGjp+HFoHBLLHyyJV3HU2ydAdv3+3LO40Aat4Zv0nTD
 o219p7G2i35zOVhOGkxri+ihhfn1hNu+KmiEp6UinsfF9WaDOhFjF/OCOCw9NAEc4OhQw00
 u9LxQ0dZreHMHPeJWHs7A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:C1ZI3h6gqPU=;snI/KsuJJ/Q8OOSdU3CR16eexbD
 h8c8Orq/SOJWvE1jHI/JMoMrPa1WTbypZR0oe6dw8GxlJudbkjF/PrnfssXN3qq/W19Mjwmca
 PEZ4PgRNS1tUknEGsAcQqS5UXcYUDNZscwjcWvGzzYYFs1ZCHRUdtFLbAXGOsTUbHBCQfk/yd
 dEIc8ITQkB+/URdqrf7uRJUN2ank2dbtLEEMgFs4Zw281TQFBmAT9ZZcNBBAsN4olqRZCw8CR
 j1IxHzjrH9bN+f/MEQEP1vBVhAZYVVsZ7qeq0SU4n3h0CNcXfdXm4NzS1BEKWZ4Fg961g/QVh
 3bSgidHbieeg0PUHHJ+I342fUtMXLslDIklkSZbL6Xly8kaFQ4POBazZfi1bwDuawWY4tdrox
 u0sZ9sb5dN9CTD04l/VtJO5zVQb9sddORBFqpIPoUEDEYr0VA9K60UiFK9W8Aj1VI17j9nQfY
 9Pds11TcPRsA4fD/ZkZykQSOPmkIETptHgkYhChKK0MMiyNxouk0Vy2l+vFzvT8KQaOEbHwnb
 ShFODt/ov9Z/jGAzatuW92lCbIBWxhB3V6IPoIBtUpHuemKONTIaFiQE5BYmc5MOIAQ9Bq3mP
 /GH6gx9kuNyGLjH3VAnBmyNG2x2kgHhy/tolCxZMWw1LZvKz4AYKHod5GfoRJTSXu8oIufmwj
 bzYtlzX4rCm4qZhxO5L70cbWluVfsZcSRQFKT/NaTNpAi5Mj+V8RCwS5OdaAzskgz1ZO4AwZA
 hj5QyCEZfj4ypmXDeg5OJkoRlByKt1Xqin0XXCBAVy3LswsiF29qUEJnEefHlk01f40l0wzTG
 Bn99OU41C3beD1nTTVonoVl6sRuJ9A9RBXIHFl/CwDFu0C2XiNgcEVbuUnkEaF7rwab/pL+PB
 qvBewYHOvPSpObbRDx3V2c9mneIInT93ekqYFFVeP5BQyQNj1I2mEaKrf/a5+YTDdfyV/0kV5
 mziKkcNLqaxWyx+/xVUegDQ85dISON2tZRQofXaqHCzWzj/UJ3jyTbbsaPtKdHMcVbtG6EXdQ
 9Z5qjkk4IukIz3sKHE5Q/f1qiy5xasMvcdg9/42nAVomhCOUsytwmMDr9liIpwHIgxdif3OgU
 wI5HczhtZwx8hsgVYyKswm3h8+0kqF7soEd5cAbQl1vpOtQcple8eaDfaI5E8mAy709Qt1Fzp
 ztpjKGk7DM1YWQ/W3ODVxQv/SWXjf8pMIA31qjhEu9phDA54tgAbuQ4LlTulD9rnChQLHZcX0
 mzpH25f5KjNJRgmESZr0/PjT/Xx0p/7s1rSkb0YGWW2m+aa/h4nnMj2wqE61iJi3WTqGSl1Xc
 u3ptGKSOvJG9vNrpbXeK7aBMpAmRrGbvEjcYqEFVVSZpEI/yXnzpcX1T0e+JfeR0PabU0EJgi
 FtNCHOC3ZOc25teLO1+s8kcni4VvISRL5sHcxNUSaUShPkbp4FATMDxIDe7PMP8kFBg6bJ7rI
 ArRpObA==
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

> devm_kasprintf() can return a NULL pointer on failure,but this
> returned value in zynqmp_audio_init() is not checked.

Another wording suggestion:
devm_kasprintf() calls can return null pointers on failure.
But some return values were not checked in zynqmp_audio_init().


> Add NULL check in zynqmp_audio_init(), to handle kernel NULL
> pointer dereference error.

Thus add three checks to prevent null pointer dereferences.

Regards,
Markus

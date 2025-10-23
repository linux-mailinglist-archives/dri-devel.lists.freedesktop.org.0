Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ADBC02B70
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 19:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C18610E952;
	Thu, 23 Oct 2025 17:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1133 seconds by postgrey-1.36 at gabe;
 Thu, 23 Oct 2025 17:22:38 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E2B10E949
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 17:22:38 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4csslW00WZz6L4xM;
 Fri, 24 Oct 2025 01:02:14 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
 by mail.maildlp.com (Postfix) with ESMTPS id 226131402FB;
 Fri, 24 Oct 2025 01:03:43 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 23 Oct
 2025 18:03:40 +0100
Date: Thu, 23 Oct 2025 18:03:39 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Moritz Fischer <mdf@kernel.org>, Xu Yilun
 <yilun.xu@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Guenter Roeck
 <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron
 <jic23@kernel.org>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, Georgi
 Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Joerg
 Roedel <joro@8bytes.org>, "Jassi Brar" <jassisinghbrar@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 "Jakub Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Johannes
 Berg <johannes@sipsolutions.net>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Mark Brown <broonie@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Olivia
 Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-fpga@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <iommu@lists.linux.dev>, <linux-media@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <20251023180339.0000525e@huawei.com>
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
References: <20251023143957.2899600-1-robh@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
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

On Thu, 23 Oct 2025 09:37:56 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

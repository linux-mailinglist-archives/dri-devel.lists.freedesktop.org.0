Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A1118DB93
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 00:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723E66EB87;
	Fri, 20 Mar 2020 23:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE836EB87
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 23:12:42 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AC152072D;
 Fri, 20 Mar 2020 23:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584745962;
 bh=H50y3xQFEH5K0TIHp7faQcmWTf6Q5LCbihorSKcCraE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=LZ+xqEMl3siMu/QgG8a07bp6G9TR2pwTJysbM37AGo869jGNxgDR73eHJB0NV9wK3
 yC/YoDmKvx5NYcp3DrzwGsqu4p3O9jhw6dNRK7Rl9FrxMV6Ikx/IS1KtWW5KsQz2bU
 pP+l3h4ZMlzbnvhSSTPP9zsdVt0f0H/f6MsT89fo=
MIME-Version: 1.0
In-Reply-To: <20200311165322.1594233-3-enric.balletbo@collabora.com>
References: <20200311165322.1594233-1-enric.balletbo@collabora.com>
 <20200311165322.1594233-3-enric.balletbo@collabora.com>
Subject: Re: [PATCH v12 2/5] dt-bindings: mediatek: Update mmsys binding to
 reflect it is a system controller
From: Stephen Boyd <sboyd@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, airlied@linux.ie,
 ck.hu@mediatek.com, laurent.pinchart@ideasonboard.com, mark.rutland@arm.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org,
 ulrich.hecht+renesas@gmail.com
Date: Fri, 20 Mar 2020 16:12:41 -0700
Message-ID: <158474596170.125146.8898369237824145904@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>, ,
	hat.com@freedesktop.org, dri-devel@lists.freedesktop.org,
	Collabora Kernel ML <kernel@collabora.com>,
	linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
	Richard Fontana <rfontana@red>, wens@csie.org,
	Allison Randal <allison@lohutok.net>,
	mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, frank-w@public-files.de,
	Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
	Houlong Wei <houlong.wei@mediatek.com>,
	linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rdunlap@infradead.org, linux-kernel@vger.kernel.org,
	matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Enric Balletbo i Serra (2020-03-11 09:53:19)
> The mmsys system controller is not only a pure clock controller, so
> update the binding documentation to reflect that apart from providing
> clocks, it also provides routing and miscellaneous control registers.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

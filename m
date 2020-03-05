Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5117B03A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 22:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72266E3B7;
	Thu,  5 Mar 2020 21:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278666E3B7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 21:03:25 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5C5320684;
 Thu,  5 Mar 2020 21:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583442205;
 bh=fM0aqw68EHCwMFIm/PcXmSHz7poq8CIOnswY/9edExc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=w+zVfmzKSWiR3nY7SFNmodTZNYO1wHfYU4/3JnkyC1Yu9sixmw5uYXvEZ1LiDqNaG
 wQhQrui40j2bqRdCz6sEZSrQpKdBrJlgIz8ygM7rcZIDcEfG8uBeWWuaH34IexFHWb
 LpyJ2d3SFnszJVDE2SCjAlOEnIaaTjJldansbut0=
MIME-Version: 1.0
In-Reply-To: <20200302110128.2664251-3-enric.balletbo@collabora.com>
References: <20200302110128.2664251-1-enric.balletbo@collabora.com>
 <20200302110128.2664251-3-enric.balletbo@collabora.com>
Subject: Re: [PATCH v11 2/5] dt-bindings: mediatek: Update mmsys binding to
 reflect it is a system controller
From: Stephen Boyd <sboyd@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, airlied@linux.ie,
 ck.hu@mediatek.com, laurent.pinchart@ideasonboard.com, mark.rutland@arm.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org,
 ulrich.hecht+renesas@gmail.com
Date: Thu, 05 Mar 2020 13:03:24 -0800
Message-ID: <158344220420.7173.13803480348303577692@swboyd.mtv.corp.google.com>
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
	dri-devel@lists.freedesktop.org,
	Richard Fontana <rfontana@redhat.com>,
	Collabora Kernel ML <kernel@collabora.com>,
	linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
	wens@csie.org, linux-arm-kernel@lists.infradead.org,
	mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, frank-w@public-files.de,
	Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
	Houlong Wei <houlong.wei@mediatek.com>,
	linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Allison Randal <allison@lohutok.net>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rdunlap@infradead.org, linux-kernel@vger.kernel.org,
	fwll.ch@freedesktop.org, Daniel Vetter <daniel@f>,
	matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Enric Balletbo i Serra (2020-03-02 03:01:25)
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

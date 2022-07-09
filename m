Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C20556C9B8
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 15:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CA7113D21;
	Sat,  9 Jul 2022 13:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB19113D13
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=QDvYa9cFEorN1ILaq5p0/t/GBxoIQgB2tyKasIexqXs=;
 b=uHxHgDorQxChvH4gH2fuo2MNARVNejJimVx6FLSWFl/wA01O2eLtrgFIQbsYwJRP/im+6jA2ffGBX
 Ic+bJZAUf3QMQugASocmdQQCjGyHUgzIP78TPUjvQZJUMAAe1ob1xDGCTDIKLGogh9sdontAFn5NDf
 7l+K6QNVGW3WLl+jiCdyT4e6OzNo3zmnPTu9DR3zF95QERBperdvqKnQsP0/g79v3ffuLc8B/azhhi
 sytiEsNxMM2sDaCKU9BpcSscUqS82ls8KL7++GkaE+rrbjSCsTxlnJEnfigoDyWX3j0prPhyF1HdBc
 V2zLMM+RPs9L5/BI0R69GiCNpi+h7KQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=QDvYa9cFEorN1ILaq5p0/t/GBxoIQgB2tyKasIexqXs=;
 b=OJYGdGwmD39yIGuezDD0shzbCZ80kbR/J8mg/gZnpYSmcwSzAvbTO8P3kVlx4THYAdM1qwFICXjmS
 xWE8pO6Ag==
X-HalOne-Cookie: e9bc3fa241fdae21be51ef3314c024f593f38501
X-HalOne-ID: 03389c65-ff8f-11ec-823c-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 03389c65-ff8f-11ec-823c-d0431ea8bb10;
 Sat, 09 Jul 2022 13:57:04 +0000 (UTC)
Date: Sat, 9 Jul 2022 15:57:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: simple: add support for
 Samsung LTL101AL01
Message-ID: <YsmJLhHBUGPHh7nL@ravnborg.org>
References: <20220516193709.10037-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516193709.10037-1-martin.juecker@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Martin,

On Mon, May 16, 2022 at 09:37:07PM +0200, Martin Jücker wrote:
> Add the Samsung LTL101AL01 WXGA LCD panel to the list.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>

Applied to drm-misc (drm-misc-next).

	Sam

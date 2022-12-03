Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6346417BC
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 17:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3A810E1CE;
	Sat,  3 Dec 2022 16:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CAF10E1CE
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Dec 2022 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=NdcOIwh7jH2NLDg8q17GpPYOPgUAra9TG2q90s/q5d0=; b=Bx62S9QYTn+h93Reu766DcUuqo
 IKHf//g8i+huz6J95GONDSIhr2SqvAoUgK2nKQiUP72oUwhdCwJc1xfzpoVDeU2mNIa11y1hkiLWA
 AnHMgBTlnboREybcZ45rd8rpWWs2OXfW54IEBKxAgkYTu2pzOIMIxzuPVscRgcUkfUPsnRpxroYfd
 TUsGYuuZrAinJf25cdzisXP1OJW00ojvO6agffY1O6yK0uH0oGktG35LFiO9wBwLoX6vTw4JGVSko
 lxIvbID5CzucBGGlMPRy/GbK6FDhBuDYVHHdr3xLngBEyb66gBDLZoTTIUOpX5z09Xk1TodE/3JnE
 f/rg4Rjw==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=57152)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1p1VGG-0003tm-28; Sat, 03 Dec 2022 17:21:08 +0100
Message-ID: <3e2ff466-d573-d932-467b-3307da90c697@tronnes.org>
Date: Sat, 3 Dec 2022 17:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 3/3] dt-bindings: display: panel: mipi-dbi-spi: Add
 io-supply
To: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221201160245.2093816-1-otto.pflueger@abscue.de>
 <20221201160245.2093816-4-otto.pflueger@abscue.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221201160245.2093816-4-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 01.12.2022 17.02, skrev Otto Pflüger:
> Add documentation for the new io-supply property, which specifies the
> regulator for the I/O voltage supply on platforms where the panel
> panel power and I/O supplies are separate.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

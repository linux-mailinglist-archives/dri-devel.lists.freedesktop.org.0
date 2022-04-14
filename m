Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D1500C68
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 13:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E35310FCA8;
	Thu, 14 Apr 2022 11:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DB010FCA7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 11:51:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1EEEC1F47996
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649937067;
 bh=FQo3+DfDK/439bMdjsIJSbbQW7m+3RsLgRDDfki4H+U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YtZBD7RNl720F69+xtlmXyfdDxjpi1ksA1V3yHN1HBA6AEH5w+VeB7DI9ibavjKHp
 ZjGwaDwxN6p4gy8x8MbJRnoAamqkn+diH9XzFHyDYHLNqyUhI5IkEXRuv1V9yIzUDU
 AYKcVdlaGGJYKVZd0ruW3n8o5eHJ/KA0XifmgbWE0Zi+B8mz0QSBmBpFmHyQTnPCGV
 qiWeXeq4ZGX5n+lMeRiDzj4II7gDE09xt+ks3FgMSN1jDl1LJ5P3bgAvEVMRBgwHdA
 5FFEZ0UDm6uyqdjercTqlpjz0C2WX369JjI3QCtFbS/aax9x7MO9bYwmNdz+pG65OE
 re3ANfGXiXIIA==
Message-ID: <ee2f0819-8c9e-4160-c4ae-fb4ad0da3f3b@collabora.com>
Date: Thu, 14 Apr 2022 13:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 1/2] dt-bindings: Add DT schema for Arm Mali Valhall GPU
Content-Language: en-US
To: Nick Fan <Nick.Fan@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220414025023.11516-1-Nick.Fan@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220414025023.11516-1-Nick.Fan@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 14/04/22 04:50, Nick Fan ha scritto:
> Add devicetree schema for Arm Mali Valhall GPU
> 
> Define a compatible string for the Mali Valhall GPU
> for MediaTek's SoC platform.
> 
> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>

Hello Nick,
Unfortunately, this binding is completely wrong.

First of all, there's no arm,mali-valhall driver upstream - this will be managed
by panfrost later, yes, but right now there's no support.
Then, you're also setting opp-microvolt in a way that will never (or, at least,
not anytime soon) be supported by the upstream driver, as it manages only one
supply for devfreq scaling.

Besides, please don't push bindings that have no upstream driver, especially if
these are for downstream drivers requiring proprietary components, while a
completely open source implementation is in the works.

Regards,
Angelo

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B061598FD6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 00:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFE910E42C;
	Thu, 18 Aug 2022 21:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9CB10E587
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 21:59:45 +0000 (UTC)
Received: from notapiano (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F5776601B46;
 Thu, 18 Aug 2022 22:59:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660859984;
 bh=Ywr+TRyo5kID6vdf/Ha5uTtV3PhPkoYBPghVaG7zL0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BacyDNYOHPFdC53DYZfM88pvN/PGaHbIqwvTh3QEO5GAUjuLicPbqx6QX0Ii6l85M
 4DpQHF36npu9SyYbqJ9t4c4WOE3nYiy0FEgmSQZ11QeADi/Eax46U9uloiuIs/oHxb
 ozgIlBMoHadbXBV3m5FhpMua6z+xlCT7il6RfqygnkNlkn8iG60Gx7X/kAT7JRhefF
 9v5bh8XuvBUbB8yuVGBrjpIYcN/TTPxEIERh7DsQpUL7aAzrkTJWsfs4dfbsc4p2Y7
 RZlsiPQesHSpcs7C5hlXboWxO13XUeYSncO6X/PCO7KkZjTUCS4IIxXERRehbBEKqo
 Hg9shXZpTpt7w==
Date: Thu, 18 Aug 2022 17:59:38 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH v25 00/10] Add MediaTek SoC(vdosys1) support for mt8195
Message-ID: <20220818215938.w6sgdp5tpvf5eert@notapiano>
References: <20220711075245.10492-1-nancy.lin@mediatek.com>
 <0afc69a72a4c55b17f8b626d43a08ad56ada64c5.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0afc69a72a4c55b17f8b626d43a08ad56ada64c5.camel@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, wim@linux-watchdog.org,
 linux@roeck-us.net,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 05, 2022 at 06:04:08PM +0800, Nancy.Lin wrote:
[..]
> Hello Matthias,
> 
> This series is about mmsys configuration of external display path.
> 
> It is in version *25*, and it is reviewed by many reviewers, like CK
> and Angelo.
> The reset.h is also reviewed by Krzysztof.
> 
> This series is also well tested by Rex-BC and Angelo.

There is actually a silly but breaking bug in this version [1] affecting a lot
of platforms, including mt8192.

I'll provide a Tested-by tag for mt8192 in the next version, just in case. (If
you can, please CC me, Nancy).

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20220818214715.spbyic34szubx3gi@notapiano/

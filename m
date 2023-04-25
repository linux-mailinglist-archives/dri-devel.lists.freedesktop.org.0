Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BEC6EE3C8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 16:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1728C10E053;
	Tue, 25 Apr 2023 14:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6BF10E053
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 14:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682432154; i=markus.elfring@web.de;
 bh=8bfz41NFqOMLyEMU3/iMzHFsfhiD3AnnDtGlJF9nEDk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=rexEqEq+iqjiHhuYy6r/fSpGllNnvYrzapxIYEYtlA1F3KK16g2xRNgsRnxtGVGBY
 Bxxz4Ibl+qa6q9lE9dDlaGP9teejIHouXgYQwFVDa5f5o9tijQKXm82hFBEGf0v8Hu
 Rh/GOGjslf1Unwr4x6WccZJ4h1kEesBPiAUNnTLPGGFMyJLPEaBF543KQNgOkZRZSs
 FaFfKf+2UA7i44RCSeeEMPsBxEnDalvZgSsemm1zY/U/3bCLqzsLGPdFf6eHk+p8I1
 7Z3seT5+Fb17QgPPmINNdYlICfhcAPg+W8yvo1RaVPi2Iv3dWA4AiHs6kBypH4TywN
 1LKrZLBPyjLVg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MtPvg-1q9GoW3BeA-00ue5h; Tue, 25
 Apr 2023 16:15:54 +0200
Message-ID: <6f758653-36c9-91a2-7bbc-278ae3f8ccee@web.de>
Date: Tue, 25 Apr 2023 16:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: drm/bridge: it6505: Move a variable assignment behind a null
 pointer check in receive_timing_debugfs_show()
Content-Language: en-GB
To: Robert Foss <rfoss@kernel.org>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Allen Chen <allen.chen@ite.com.tw>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Hermes Wu <hermes.wu@ite.com.tw>, Hsin-yi Wang <hsinyi@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <14636275-4d26-d639-5f6e-293fc6d1c4c6@web.de>
 <CAN6tsi7caOQZLLvbL7phMEtNvBLaWgJuHLkLo3YWdqQw7Vxnaw@mail.gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAN6tsi7caOQZLLvbL7phMEtNvBLaWgJuHLkLo3YWdqQw7Vxnaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:X09Tc0Fni7Q32vRjvx6Lp+ADugqqF6S21Vw8flGxT5heb7er/Li
 AFO/7m7Lzeui3BgqiJHd4CN+4l4HhbPcw9h+kP2UZLH/N14HDgbOXt2gsqx3sY982J8lcKW
 UwDDhadaphfDvadYPz1V00u2ysKo/roTAosogp1LMpjr5vXzhMvfaBcXEtQFjGy9nLB0S0d
 CfugamEsimiANerTueCDQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bNQDFXSB7t4=;t6nlYVYwi47XzLp0Xmqi5UGkjUN
 /qm543QuMN3bW6NdsEBQStYh5aIT9LcblkafEy+GR34SpbL7TGKtRZcFiUEkIXsP47on6nDsS
 hYN7WT8h7r/pw3I+hSqyHj1aGNuqbFj2beLsUxohN9LTofH6+vy3h3397CaMTLYhdXvF26CQS
 kOTOqcM/3ZuaYF3Fuk5C3IUwDYd61QkQAhVaL69a237thickNdlwhY2r2i9zXLOSUJAp97k+I
 X7Hw/QvzJQnUBF1jd1SBEihCyfKlWNsRg3thImKirIPsDk/sD69RKUwbN3a9aQcrnKJb86oBI
 IwTk6tVvNysDnwWd5tclaHUAHZCz1+2G56G/YHvICX6OvrGLWdirLglYwJnOmllts2X4vo7Ow
 tcZ0bx3S3fbcMos6D3HsLfOA6fQH8UxfpZSdkPnZVoPXRV2juT6wZUrgwZ7L0Nmg0QUyMveoj
 LItSf7LK8t7wdHYB+4j98I+Io6ZjhDZdYr4wzf/kIZ6gMdZtBqTgmHiqamw/AUaS+28SAi/yG
 HBtNzs+SqdipMRFKNHb5hCwRoPOFaDN0ZIJhkOnCEujURIkgPBLEqBmbUiGkQrvJiVmnAytaw
 nVPotL7kc7/xhyg3DvaYz3wYUpsR5yVWpSu1r73qeo4DAEDvgSDtNN41npAzRRn7vyw0kNTgM
 KumiGf6Y9MWVR3e1XCJDUg6R8Zl3AGzl0H3KpeCFgLoBE64ODghTjbGfC5pIb5/LZ3A+klRAM
 eifCPS/umibEXbssnZ3GNTl8NNforeywv5QGw/CkC/KyGgz5o48barkakFuF37+Obvz8wloM/
 rPeK9omYA1F1RnvX8j1ds/wAAXhVCo3rm+QQ8qlR5T+Gd9QKZeA/H3RzCNFx7UgcWGg6ZT+Wg
 vdF4wjKKTf2Ym1Rx/Nx1qrc/9JoAVHrDTPM20vHiEE574EtwWfWAzVpeJekBYAYqSnTvRGewP
 2Ub4dg==
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> This patch seems to be a part of a series without being marked as such,

The mentioned patch affects only a single function implementation.


> this causes issues when importing this patch with maintainer tools
> like b4 which automatically pull in the entire series and not
> just the specific patch.

It is a pity that there are special technical difficulties.


> Either label the patch as being part of a series ( [PATCH 1/XX] ),

Further software modules were similarly affected.

See also:
Reconsidering pointer dereferences before null pointer checks (with SmPL)
https://lore.kernel.org/cocci/1a11455f-ab57-dce0-1677-6beb8492a257@web.de/
https://sympa.inria.fr/sympa/arc/cocci/2023-04/msg00021.html


> or submit it separately.

I thought that I did that (in principle).

Regards,
Markus

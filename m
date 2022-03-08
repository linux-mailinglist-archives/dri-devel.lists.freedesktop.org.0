Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B0C4D196E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 14:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5539110E784;
	Tue,  8 Mar 2022 13:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE0610E684
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 13:43:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 22AA81F433C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646746993;
 bh=kSUI2BRp2JNG5LsOGU9IRITk5p6tBa0tvOC+DAN6vH4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q17/LXQEF1Xjh+aRlsNdjnnsHqr21WtQKV55Zg0+Gie1vBzNWqbspKyuzxJGQggds
 FpmVkV2N8dx2CQ6XBB85sHQ/Jc9emmJ8hgK8hBKCTY7MiM/DYCYP+LaF9yIgYSpeoI
 TTjC63wCGpDBfYPEEcbFXek3QHGn8Pso+VW7FtSNquuOuLBPqVo7U3EOOeBOcUo6es
 CKHcCasSUH4BrjSfrtAz0EsfymVDtAziRJ2MQZV87nccB2uLprZ0JzWcWWOowr6YG8
 50ZVWoJt2+O5aszZoxUiF9NZEzTowqD4CiAH6R8pk6sar49wsDKaZneTz3rUhmPKKZ
 /05k2uL5pyCWw==
Message-ID: <9f794d5f-49ad-d2f2-b1ea-6beaa1d5912c@collabora.com>
Date: Tue, 8 Mar 2022 14:43:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [RESEND v13 22/22] arm64: dts: mt8195: add display node for
 vdosys1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
References: <20220308093018.24189-1-nancy.lin@mediatek.com>
 <20220308093018.24189-23-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220308093018.24189-23-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 08/03/22 10:30, Nancy.Lin ha scritto:
> Add display node for vdosys1.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 223 +++++++++++++++++++++++
>   1 file changed, 223 insertions(+)
> 

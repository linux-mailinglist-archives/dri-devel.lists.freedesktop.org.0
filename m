Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E785C4D4510
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 11:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9503D10EE25;
	Thu, 10 Mar 2022 10:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DB110EE21
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 10:52:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 514991F454C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909572;
 bh=OIHzCHMj5k3sWfXIEjFNU/tLKLnLH7CCNdUZCAzV+8U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=noDVc6PlWR8NHZ+flnpVaExec2uRYYw+ohrKV9EspZ+HOev+L2pQYMDxNfd23VwQU
 zl3qV07k/Fif3WnLoFCx5GhsIKA/kAucN0A6tT1ezc9pc3qU1Deit3Pvqyi53vC3ZG
 Aiq5pBow465nZBl9dEVtKUikTRpo+/ko2LbXP5t6MPWYI/QAVhOBOmIJpDMtMNpUz1
 VVJ3XiJyKWJpJRHVRuZfYB2dq5E19nWV6RQF742dei02CZCa/a/tXK7RIyvIgelxJx
 PQTNWFF9KmvrR+MJ3+gxUfQueBKbCnDP3FTi83QUERxEqoah3OgUMMi6yUHi0Swqnm
 02oLql+r9oM1w==
Message-ID: <72b85cf8-cff2-0bd6-e0fb-d007a0a81d0c@collabora.com>
Date: Thu, 10 Mar 2022 11:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 14/22] drm/mediatek: add display merge async reset
 control
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-15-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-15-nancy.lin@mediatek.com>
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

Il 10/03/22 04:55, Nancy.Lin ha scritto:
> Add merge async reset control in mtk_merge_stop. Async hw doesn't do self
> reset on each sof signal(start of frame), so need to reset the async to
> clear the hw status for the next merge start.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2992D5B98DE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 12:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D1510E19F;
	Thu, 15 Sep 2022 10:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00C910EADF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 10:34:10 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C68D96601AAA;
 Thu, 15 Sep 2022 11:34:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663238049;
 bh=J5mscqBjskoIJTmbE49fccjEFLGV2r8MvVioIABdkxI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dKPxgbQRShNmGL/b7jZx4PFKNG282zTyXxU+SfgKnAbV4J6/XFebgfvLrEn6pGQYt
 xgThBVrgkdLdLKlmjs+zn33eG57xjFbB2AOdRagNudkFEaGNghFNB80NPjvM5AqBGk
 I3FWJCRpuDyZUXbfoItND/0tPF/peiUJw3580L6T3aRZLuzP0Ust49x2AKczfZo2yP
 OVSJ5Jxa7tS4KXIpll+cEgFvlwh0FxosQUuV7q1gGC1E0PmMFp05tyTvIGGTjPztmb
 HdNUnD3thRUbkvjOwrWpG6TEJ5KEL4T2ZiDDunFB3MgKIZ709DdrmSXjJxibvI1jDr
 6saRbAzdJcLOQ==
Message-ID: <47c6f2a3-ad38-c9c6-544b-5b2d1a234593@collabora.com>
Date: Thu, 15 Sep 2022 12:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/3] drm/mediatek: dp: Refactor drivers in
 mtk_dp_bdg_detect()
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie
References: <20220915075028.644-1-rex-bc.chen@mediatek.com>
 <20220915075028.644-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915075028.644-2-rex-bc.chen@mediatek.com>
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
Cc: granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/09/22 09:50, Bo-Chen Chen ha scritto:
> It is more clear to modify this in mtk_dp_bdg_detect().

I agree with this commit. Since you anyway have to send a v2 of this series,
please clarify the commit description and title, something like:

drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()

In order to improve human readability, reduce the indentation by returning
early if the dp/edp cable is not plugged in.

Cheers,
Angelo



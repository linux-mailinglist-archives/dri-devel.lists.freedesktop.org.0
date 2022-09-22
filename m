Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345DE5E5CB4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71DF10EA68;
	Thu, 22 Sep 2022 07:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CF210EA67
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:54:34 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 58F346602047;
 Thu, 22 Sep 2022 08:54:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663833273;
 bh=vzBoo+BDHqv1ompRIGMzCZyj3Bp/VrrSbEkMBtsWZ70=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QNYZcI1v2qBpuIORsyI3eJYR434HyCM9M1XhhOtmcjEwZJpp5NjvDUUdty/nwt6mU
 RQ9cU/luRd5HBspeWOyykanScv+RhwuP8C2TeMqfrOVfuSwOWhKb6xbJfc/aUjms+c
 6ASGz+zmVpOXnpq0YOvOSOLAr+NDp+VKpTRItRewdtlMjQx/4Ecsmw4sVhEn9A5du+
 lWujgholLtWEMyyrQRtx/OFED468W+9paGv1IqcMJtjjiwJQcNMMze4zTMcAw19H50
 72F/neB2p1YW46LQ/CIt7u/6DCoM6v4GYAXoNjHGGcVCuPNwoOTYO3N5896xUCFJ7t
 OI74fTpOUnJuA==
Message-ID: <449c88db-9da1-d7c4-520c-37730bbc04b7@collabora.com>
Date: Thu, 22 Sep 2022 09:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v7,3/3] drm: mediatek: Add mt8186 dpi compatible to
Content-Language: en-US
To: xinlei.lee@mediatek.com, matthias.bgg@gmail.com,
 jason-jh.lin@mediatek.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch
References: <1663831764-18169-1-git-send-email-xinlei.lee@mediatek.com>
 <1663831764-18169-4-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1663831764-18169-4-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 22/09/22 09:29, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add the compatible because use edge_cfg_in_mmsys in mt8186.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Please fix the commit title.

drm: mediatek: Add mt8186 dpi compatibles and platform data

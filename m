Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64764F5AB2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED53610E376;
	Wed,  6 Apr 2022 10:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6891F10E376
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:39:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 62E321F40636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649241544;
 bh=Wt6H1/5KeIwiv84NwDktEXWbagGeTc+A2tTQdBJ3m/M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hJXdG7l7xrjiCg6g8MWK7luueDWq70aow8lvQ6vnOWPs9zVmi0JNIIc5MWqIyomGP
 wkMZgWzgAdiwsoVsfGspG3eIJsMdhGaVqiX/foIUhBT6QcVRpYeJCi4l6LH9+AfNoA
 B4erpzjUZ5+wNT/w4SX6p0QB7uae9VJ+LNVqo8Jp1sFBDdu76zuAbqMsMhS9t+Oakt
 SI7wF/TKilhHc0+wt379jA/DQ59AcOOkDETmpZIAzVg8U2h6Isuhnk5CQA3zyXxpO0
 FILEIiEBjOnrt/MGSL8aWwAyOuHgrh+1uI8ON3fe7f5zvk9M1CawuUF+JtdoKi1ikq
 V3LYUnWeMTVFw==
Message-ID: <ff4e0e14-b0cc-feed-6038-45d383a0fd4a@collabora.com>
Date: Wed, 6 Apr 2022 12:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] arm64: dts: mt8183: Correct disp_aal node compatible
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220406094654.29722-3-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 06/04/22 11:46, Rex-BC Chen ha scritto:
> The driver data of MT8183 and MT8173 are different.
> The value of has_gamma for MT8173 is true while the value of MT8183 is
> false. Therefore, the compatible of disp_aal for MT8183 is not suitable
> for the compatible for MT8173.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

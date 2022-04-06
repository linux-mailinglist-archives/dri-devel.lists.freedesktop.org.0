Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5574F5A9A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C076210E2F2;
	Wed,  6 Apr 2022 10:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292B810E2F2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:38:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C74DE1F40636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649241526;
 bh=5GWmZjBirWLKxTJDH+AOnbEW/7YRX30utZckHcSznsA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b1yhGPYeG8w7Hp3otl5OwFcOZbuTdGDLENoQCChDRid7NyaHwJgMzTFezCf/36fV2
 fuQOYSawPvsvy2Gil0LJd3sKx2+iNHU5Z4uP1KTdPjDCbN6zti6mJwrFqE/0mULBDa
 MtpEJV+jra0//NFIIRW8QWD0FXJMBPQqRUx5zS7pyhDoIGAMd3uI9rU/mc7OwIX76V
 4CbeW4SEYM6BK09Mdij+l+jwkckSSGuGVOX6qG0lKjWZSGR43dbXQSq+O7AfSps4PQ
 D+HY0d/19iLzO9ZI2pjsLvnk0S8sbVY7t0/n1m8IXHILCglQspsK4DfeKx3NeaVWux
 V7Uhzleh+dAMA==
Message-ID: <19a1af29-19a7-a546-b565-a2cc973a7f28@collabora.com>
Date: Wed, 6 Apr 2022 12:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8183
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220406094654.29722-2-rex-bc.chen@mediatek.com>
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

Hello!
Yes, I definitely agree with this change, it makes no sense to have both
8173 and 8183 compatibles for 8183 (and similar).

Though, please, add a note in this commit message advertising that the
mistake was only in the yaml binding, as the driver doesn't require any
functional changes, so that things are clear for people with less expertise
on MediaTek platforms.

After that:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

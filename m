Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764916188DC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 20:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285FA10E255;
	Thu,  3 Nov 2022 19:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E513110E22A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 19:39:33 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8FB29660295F;
 Thu,  3 Nov 2022 19:39:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667504372;
 bh=GpG+ngXsfFCaRT4GOJHRCxmlTrFS2EeFudrgWsqneTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PaMyRk9pRHnNTI0UAGNbsu4Gdqk0Y3WTci3YdTVXMassIzSL5bNYV0ha3085r0ETz
 uMbjZSBan4TgTDDICKU54vOLnB1FX/mNSv84iE4RCDRUYBKg3qV/RVmTtqQmV2qilB
 jiDVkI8IEzPt+EjySDdn3kO0zFhBXE7D9YRQjBc5jXAbaRPoYJkJvDX+MGypRl52d4
 j8tLu4fGEBEQ6860QxcOu29NbSMWIp5cAdnvHcAwKmrgoflNg0HPvesqgwlwCA7OUI
 7ydBDi1ilq1mpLtq1REVGiI4E76XiGSQK7hJv/VI5XWDN/FkFxEs47kWYJHJczA+Ad
 rXOTW1zk7A13Q==
Date: Thu, 3 Nov 2022 15:39:25 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH v27 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Message-ID: <20221103193925.ahdhhuz67mg4noqz@notapiano>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
 <20221103032512.9144-2-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103032512.9144-2-nancy.lin@mediatek.com>
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

On Thu, Nov 03, 2022 at 11:25:02AM +0800, Nancy.Lin wrote:
> Add vdosys1 mmsys compatible for MT8195 platform.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Change-Id: I8065205ce44baa417f58176adaae9e1eefa6eadb

No Change-Id tag, please. There are some other commits with it as well.

Otherwise,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

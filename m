Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB8D598E45
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 22:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8C810EECD;
	Thu, 18 Aug 2022 20:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651EE10E78D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 20:42:38 +0000 (UTC)
Received: from notapiano (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DBE626601BF4;
 Thu, 18 Aug 2022 21:42:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660855357;
 bh=D7Xxxq2ivM89ftLoZFcKndJliveYXABeKvga5jeIPxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fn/n1YBEsHBcu+LaJsjFsogd/ABNi3DMfgFN131nKkah3nhbwwNPXWIJRNXQmPWQc
 QI7NxHqEz4NyyCwsmZT2QS2t/kPI6BsTyznD1SReSwnehkgg02CHT+Wk6YctN0D594
 iR68Wtm20Wb3TW4BA9pfXWr5V1rVGOfO6oSD+Y28nIHpdq0RBC81qRMksa/MA6mPcO
 SZfvev3HUHczAAVJH763JL7VNi5fZBrFhGR5e8VtkrSPp8cTjjWbCVKRjJ8KVcdfyw
 nrmVxwyWPErx1FknD8YmKHkJmnHtch7rQLY+olK/OhJMeoDtziOurhObeWJj9SB6mQ
 +xBtvs2WQe/zA==
Date: Thu, 18 Aug 2022 16:42:31 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH v25 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
Message-ID: <20220818204231.zvq6tipjyzen33oi@notapiano>
References: <20220804072827.22383-1-nancy.lin@mediatek.com>
 <20220804072827.22383-2-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804072827.22383-2-nancy.lin@mediatek.com>
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

Hi Nancy,

On Thu, Aug 04, 2022 at 03:28:21PM +0800, Nancy.Lin wrote:
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno
>  <angelogioacchino.delregno@collabora.com>

Some line-wrapping happened to your patch when sending, so it's corrupted and
won't apply:

	$ b4 am https://lore.kernel.org/all/20220804072827.22383-1-nancy.lin@mediatek.com/
	$ git am ./v25_20220804_nancy_lin_add_mediatek_soc_drm_vdosys1_support_for_mt8195.mbx
	Applying: dt-bindings: mediatek: add ethdr definition for mt8195
	error: corrupt patch at line 228

Fix whatever causes this in your setup and re-send. Tinghan also had this issue
recently [1].

[1] https://lore.kernel.org/all/96e66425-ff2a-4640-8b96-48fa39943bf9@linaro.org/

Thanks,
Nícolas

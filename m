Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C5A502858
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 12:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AAC10F330;
	Fri, 15 Apr 2022 10:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B740410F330
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 10:32:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C85F21F47E6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650018767;
 bh=nlyT9uQbkjzioWEO7W6j0Auq0HCeIzNo2fkjz3Pa5Bo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PhpUX9sJw3idQnExRhUN2jNHlw5zgo9InQmuXeIt/zr3f9kXox4eLopzl46snvjoK
 PW44SeAuzTuIPuiCHcpCu9Wf0/7GrabvSMNLTqZs+oFp9f5P7qC5UcNb7i0UTn0U6r
 G1c9zNMf1Bvjk79ml8RoYpQ3t8PmyU6ViAo0taWQCD92hkFrPAbj+5HZDvAcDmrPB4
 cDDnyOpmn08p0cbZO06axCyBwNBbarJVSu5PP+ulbn5o1EKYBCdDIjOB5TPHf/mvwj
 SvOnSkoXSgJhn24uopJkFOU6dDwq0lQm/eWYXmk1xYKTIqnBGCMTQDEoUpuj0wsR03
 8NoqlVfBgFyYQ==
Message-ID: <7f5a4307-b28d-1072-ee1d-752b3761bc30@collabora.com>
Date: Fri, 15 Apr 2022 12:32:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 09/10] drm/mediatek: add postfix 0 to
 DDP_COMPONENT_DITHER for mt8195 vdosys0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
 <20220415083911.5186-10-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415083911.5186-10-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/04/22 10:39, jason-jh.lin ha scritto:
> Because mt8195 vdosys0 has 2 DITHER components,
> so the postfix 0 need to be added to DDP_COMPONENT_DITHER.
> 
> Then DITHER enum will become:
> DDP_COMPONENT_DITHER0 and DDP_COMPONENT_DITHER1.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

I think that "postfix" should be "suffix" instead :)))

In any case:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


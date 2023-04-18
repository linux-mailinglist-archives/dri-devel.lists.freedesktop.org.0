Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E913D6E5B92
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C2010E6E0;
	Tue, 18 Apr 2023 08:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90A410E6E0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:04:57 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1410F66031F1;
 Tue, 18 Apr 2023 09:04:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681805095;
 bh=HYpSE05+ALPgNHVs9N+MeFT7atq4JrXWaOIKaYOOtLA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I+M00XgHxGxyOLUsCzKyQXxyIFIaswZl6IWIAkI/YQpGz/SP7UHqvJNwJu+2G0U5U
 g7glAtqLguG31hmXCDsLoscckWntth9/l3n7/0vIT0asKHkuEng9Ln9HAcfYOCNBt9
 Uu8Qab4z2c7pcpTKUbp7FCcTHLvVANrJ2ff/LKPCVPY6uzERkD1ilJgP0eZ63L5XMp
 vh6+K9uOa1RXtGJaly62mFwpTnsm+IYQBUMi06FZw07twoHX5yUeoTmfZZ9TpzDWIW
 qfmOvpK/DnQeEHLwK7DM1uUOhS1lPYGq4RbaTo0uPUuvRQ/LbVVrn9VzkdJyuweAto
 r/cEmfdyXuKpA==
Message-ID: <b91a7bf5-9da5-cfe2-e488-b7c4e6fd5470@collabora.com>
Date: Tue, 18 Apr 2023 10:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/panel: novatek-nt35950: Only unregister DSI1 if it
 exists
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230417-topic-maple_panel_fixup-v1-1-07c8db606f5e@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230417-topic-maple_panel_fixup-v1-1-07c8db606f5e@linaro.org>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 17/04/23 17:41, Konrad Dybcio ha scritto:
> Commit 5dd45b66742a ("drm/panel: novatek-nt35950: Improve error handling")
> introduced logic to unregister DSI1 on any sort of probe failure, as
> that's not done automatically by kernel APIs.
> 
> It did not however account for cases where only one DSI host is used.
> Fix that.
> 
> Fixes: 5dd45b66742a ("drm/panel: novatek-nt35950: Improve error handling")
> Reported-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



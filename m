Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0796B3A3C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 10:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96ACC10E994;
	Fri, 10 Mar 2023 09:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F4110E994
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 09:22:27 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 86DD7660305A;
 Fri, 10 Mar 2023 09:22:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678440146;
 bh=lrUTsUQ1bGCKU2xjx3ibtjUOoaBH8yYte1h4Ese0+o0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QjJ1bY5Rcn3B1NFnomFraoDbrnO/vXImycmr4kfkFyhH1RncnfVhqWsqB0K+4oKF3
 gZNIQcyHUkLw5nnE4yXeuXHnxWy+JT2j8b+IExQHskAHOy6giHm3dWZy4LhpqKZdkd
 CKzM0lFRYPRFXmr0OuvKc6Tnq55TgVndOEtnHTjG4qURa0IKaCSF0lMZD9aEFsW/qA
 POgbzHFFL74OOG8ji6Z0Dx8FsbsYTio4cwRXs9d7R5nfxq6CDR/1UM643GIYZLHUX+
 5Jih0jINQJv2BQxLwMctMFTic/Rcr+cTBZ6xri6lsx0J9djAtWCBRHt4cuEna3XJcF
 PkFoNxeRGCQXQ==
Message-ID: <310be4d9-57b2-8a74-8c21-54b258936bcb@collabora.com>
Date: Fri, 10 Mar 2023 10:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 3/3] drm/mediatek: Enable AR30 and BA30 overlays on
 MT8195
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20230309210416.1167020-1-greenjustin@chromium.org>
 <20230309210416.1167020-4-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230309210416.1167020-4-greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 wenst@chromium.org, matthias.bgg@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/03/23 22:04, Justin Green ha scritto:
> Modify the overlay driver data for MT8195 to enable bit depth control and
> enable support for AR30 and BA30 framebuffer formats. This patch in
> combination with the previous two patches in the series will allow MT8195
> devices to scanout AR30 and BA30 framebuffers.
> 
> Tested using "modetest -P" on an MT8195 device. The test pattern displays
> correctly for both AR30 and BA30 formats.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



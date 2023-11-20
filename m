Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9517F1501
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 14:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748B210E00C;
	Mon, 20 Nov 2023 13:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C2210E00C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:56:06 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DAD116600367;
 Mon, 20 Nov 2023 13:56:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700488564;
 bh=LRGku4mgI3CyWNGC5qdMEGicvWEaOWczf1gTa2doZpI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c9pGTjRpycIcF0pdwS4h+ZJFwwEsCe6B92BIOnLdsALi4qQ634vUfl9h82aIRi6aL
 Xb/GnBNmauxMVgbNA8CPIfzzoGbHXhEs2HmNzrjVG6/cMUJ4r42k6Fc80/IexCWs0q
 HMvRUHL57K0xfvASYsEazM8Z7f6YFqvHggz1ySIo2qiSjvh4fPN42V+CG8sibmfN6z
 lnl+V1jRvkkY7DTs2f6kir6cQb2vSLB0PDU+yesdf0s26ZDgtbGvTm77lawNlaenLA
 qG7cwXYQPYGv29BIGNbVDOjwhlKa46K8xBLHrbbj8GiNOt1eEvulQOksZxXgXCv0rY
 55NaZJWd6S60Q==
Message-ID: <17be794c-1e75-4843-8dda-63ca7b879c5d@collabora.com>
Date: Mon, 20 Nov 2023 14:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove
 I2C_CLASS_DDC support
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
 <20231119112826.5115-13-hkallweit1@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231119112826.5115-13-hkallweit1@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/11/23 12:28, Heiner Kallweit ha scritto:
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
> 
> Preferably this series should be applied via the i2c tree.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



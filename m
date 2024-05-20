Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F278C9CBD
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 13:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B668710E2CE;
	Mon, 20 May 2024 11:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Pz57cOLc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B7710E2CE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 11:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716206157;
 bh=HVdVs5WsRae2+1QNnkZk8b+8Vke7zSeq7GNWP4iLtE0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Pz57cOLcladhmdo5+/6Yy/Ks3GaYaTeKHcKTulsGnX7erKkpYOuVfk9HZAMKqnUy3
 t5SxNsaK0MHnaYCs7Iofizh3vsfHicUMyp1YOWul5M/ED7vFcj8y4QSU0I5E4WLFpb
 l/RqSzWiOq83+TlinnXWNfxJ7xVLRus4h5vUcgMU1HR8myXFmQYOmihk1hgLIbDbAc
 otfrAnUpt8A0LM43u4m3Fbf0Vf0+FIoZtEGN1Xc5aEYoTHgj2YrDshVMA5bRORqpWk
 Qq3s8hMeFveAo193c4XDBnxSuy1hSsZlehIycchb46jTXjThyfZ0QN6snIYwlGXveL
 JdseYdQ8dOAmA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6141C3780BFE;
 Mon, 20 May 2024 11:55:56 +0000 (UTC)
Message-ID: <df152312-a8ab-40d8-a361-fe5100e11dd9@collabora.com>
Date: Mon, 20 May 2024 13:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: Alexandre Mergnat <amergnat@baylibre.com>, chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-3-angelogioacchino.delregno@collabora.com>
 <ce1de395-3f60-4f7f-9424-bf036134de94@baylibre.com>
 <7dbe08cf-47a1-4da6-9035-6b0932cf8426@collabora.com>
 <67f13b3c-18b2-4042-9908-b4d41c24cdb0@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <67f13b3c-18b2-4042-9908-b4d41c24cdb0@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 20/05/24 13:49, Alexandre Mergnat ha scritto:
> 
> 
> On 20/05/2024 12:53, AngeloGioacchino Del Regno wrote:
>>> So, I don't know how you want to manage multiple display, but IMHO there are 2 
>>> ways:
>>> - removing the current "oneOf".
>>
>> ...eh I think this should be anyOf instead :-)
>>
>> I'll check later and send a v5.
> 
> "anyOf" behavior works as expected on my side, dt-validate pass ;)
> 

Hey, thanks for the test, buys me some important time.

Cheers!
Angelo

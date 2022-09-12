Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0CA5B5848
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 12:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2A810E35C;
	Mon, 12 Sep 2022 10:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9230A10E35C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 10:26:59 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BA5DC6601FDB;
 Mon, 12 Sep 2022 11:26:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662978418;
 bh=lsakC5tXlXnwjZ+SXxeOjNZ2MoFmMoIsT0zJ4vJo5oc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IoVq3MfDQ8Lq/69DJYionI4z0bCBxPZDwZDZXcK6CaMLDtptMrQZ9S5NcGnaCpV/E
 WO5+MytT5DVhIi0Us7pHAB8we6kAYnpaWwY8hwFgcdCJXVEyLK6c0ducJz8cFqkxeg
 XE2RyAGtqXhOSFTYIpcGorjtbtlc9AlwWH3OS9nfuSilhbqWdj7um0BRsHpGNuAaGH
 7Nq0KTNWdziVMeQBdRRiLd1yjPga0SpRCN5OtcSgBcZcIfXkMq2qw0tUeRKkBAp2Ve
 Q5s9ciPg0dH1qDawwpsraC04BLszfQGAERB7tF3uOpLxCQJVs+WAzITzDPOu+hUvVF
 tBHfe49Mvg7og==
Message-ID: <ed7ca57f-81c8-514d-2c64-26a4aa8e75d2@collabora.com>
Date: Mon, 12 Sep 2022 12:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 8/9] drm/mediatek: Add clear RELAY_MODE bit to set gamma
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
 <20220911153734.24243-9-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220911153734.24243-9-jason-jh.lin@mediatek.com>
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
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> Since the bootlaoder may set the RELAY_MODE to gamma be for the kerenl,
> we have to clear the RELAY_MODE bit to make sure that the gamma is
> enabled correctly.
> 
> Fixes: b10023b03082 ("FROMGIT: drm/mediatek: Separate gamma module")

This Fixes tag is invalid. Please fix.

Regards,
Angelo


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41944DD7DC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 11:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E5F10E9C0;
	Fri, 18 Mar 2022 10:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A89810E9B8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 10:21:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 967871F45DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647598905;
 bh=R2Fab+/4Q7++fifqmPDXKzsJYJZyn9f33fmTuUB0D4I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dod9l0meUNiRYcJN4FDqfmbnda3tnKjwdpK3zx/jLmDpE1cs+kukPITKnv4Xo4ZQW
 OxatywIqPs/f7uywjxvQOONMVvJuEsba2n1AxDugu50DHmFp60tebAgLauQPyDafcb
 6FoVy7FoYgmgZ0rZVYmSpsZ1OmgPSB9kzjW7EqAbYabqrdZcmU9LB5BC9OpkEhcMpj
 f1GaMJtUiUeb9c3kgLwBjsxHLZ1cb/3Pg7gtXR3em+ETEfvBs0KTbLbVB30UVJT+Ul
 J6eOsJ++nZ3HSHtqOVkBHRADiiSqlXbjkhUZiWB1q2of0qoxBkVSb+rhwQsJQAbdkz
 7NVSBTzY+VH7A==
Message-ID: <399aa873-4285-cc48-8c58-89673c505cb0@collabora.com>
Date: Fri, 18 Mar 2022 11:21:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/2 RESEND] drm/bridge: Add extra checks in pre_enable and
 post_enable
Content-Language: en-US
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20220311093406.4068019-1-ricardo.canuelo@collabora.com>
 <20220311093406.4068019-3-ricardo.canuelo@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220311093406.4068019-3-ricardo.canuelo@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, andrzej.hajda@intel.com,
 kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/03/22 10:34, Ricardo Cañuelo ha scritto:
> Depending on the bridge code, certain userspace events during a driver
> teardown (such as a DRM ioctl call) might cause a race condition where
> the drm_bridge_chain_pre_enable() and drm_bridge_chain_post_enable()
> functions could be called for a bridge that has just been detached and
> removed from the bridge chain of an encoder.
> 
> This change makes these functions a bit more robust by bailing out if
> the bridge has already been detached.
> 
> Tested on an Acer Chromebook R13 (Elm, MT8173) with Debian Sid.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

On various chromebooks with different MediaTek SoC models, and on
Qualcomm SC7180 Trogdor,

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


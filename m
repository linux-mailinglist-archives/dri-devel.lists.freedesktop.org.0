Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 858E4682680
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 09:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBBD10E116;
	Tue, 31 Jan 2023 08:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF1310E116
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 08:34:21 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CCBC66602EB0;
 Tue, 31 Jan 2023 08:34:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675154060;
 bh=YTDwGwfBFzyh04yq9kd12N21xcMUH+2G62M5xvhtgB0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=glgiKDV6E0zqSLzJqfUv4HNPK/4i0B3hHYBXcog8fqUYMD82r07E0DTjXVwGaEdDW
 CS1CfpfcK5a6OtbTivjP3gVimQLDHfVVnEEy78r3LL/wyWWZOq10JnvmfE7wVuzhdO
 ryCXFiZvpWNR9xqCTZjOebZI80LOrh0EJ3qvcMrE5yukEmy96e2khU1V7uyPGIilsn
 Z4vdsINZ3rZRZzNbA8xBuR0pkL0vdd5LklnIfs5i5A2dL9MrcM1cnh2oNqcIGzsDAc
 OoxNcKRD8XdkukwEoYw/mTXjHVyeVO6kWfVKXEA9bFYJqRlcLmmYYV0e905HPTvbav
 jOxONT4uTYDlA==
Message-ID: <34593781-1bef-10cb-0816-b2833e9d35ad@collabora.com>
Date: Tue, 31 Jan 2023 09:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/2] drm/panel: boe-tv101wum-nl6: Remove extra delay
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, thierry.reding@gmail.com, sam@ravnborg.org
References: <1675130359-24459-1-git-send-email-xinlei.lee@mediatek.com>
 <1675130359-24459-2-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1675130359-24459-2-git-send-email-xinlei.lee@mediatek.com>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 31/01/23 02:59, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Reduce the delay after LCM reset by removing an extra delay in the
> initialization commands array. The required delay of at least 6ms after
> reset is guaranteed by boe_panel_prepare().
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



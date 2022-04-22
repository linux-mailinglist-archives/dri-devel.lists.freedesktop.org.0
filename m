Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D0350B783
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 14:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B872910E9B8;
	Fri, 22 Apr 2022 12:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A15810E9B8;
 Fri, 22 Apr 2022 12:40:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 01B831F467B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650631235;
 bh=iPTlbvyMx1d7Mrt1YDijPEDXZRJjSVW/eJXTWZlURgI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FMiMQJrjHDXURWqTZZjn93rQIMl+5Yuzz+Tv9HnSkAHtSnldGOUrxG22nM/2m3Sy9
 0kq4f+BM/HZntwLE6mR9Q1eX+pA/8ohtuQmmZhItTgahx+eVLUp/FvKKoaXVWLm1Uu
 1Krkr554fJc+3KvsBhOX0v6eK1awjt5M6YhZBNHfpJFmr2fxLv5J3+5FrVX+U3XNqB
 1OS5pyimSsjEGFADcla8eG0DO7cVkRYm+TpcjrwjemLjd4BnxTlba/dIkrtawtQrFT
 UUlwoYCtuvVxPwg8kQ3B1FOKX/zYkeDwL8AmQeg/M1j4IIIiXGs0+Ep9vNSX8wuhbb
 vPvitMbwo3m/g==
Message-ID: <b1367db8-7cbb-557d-495a-863f9c98babf@collabora.com>
Date: Fri, 22 Apr 2022 14:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm: msm: fix error check return value of
 irq_of_parse_and_map()
Content-Language: en-US
To: cgel.zte@gmail.com, robdclark@gmail.com, sean@poorly.run,
 dmitry.baryshkov@linaro.org
References: <20220422085211.2776419-1-lv.ruyi@zte.com.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220422085211.2776419-1-lv.ruyi@zte.com.cn>
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 Lv Ruyi <lv.ruyi@zte.com.cn>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, quic_mkrishn@quicinc.com,
 vulab@iscas.ac.cn, freedreno@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 22/04/22 10:52, cgel.zte@gmail.com ha scritto:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return an negative value.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

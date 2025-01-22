Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423E7A18A3E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 03:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F77310E1F8;
	Wed, 22 Jan 2025 02:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="I5yfY2lv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id D1BE910E1F8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 02:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
 Content-Type; bh=k8/fB0V+2dkp5kKYS4ctDJyDs14ukSa7D7B8RrQExIY=;
 b=I5yfY2lvLBDGB0nBHE5rIFWFEZ2W3YoIW4lVn+xbxAdGXUAXleB2C3MNNMS1DQ
 qQ0dQp/3AZRTWAd4yuvXRu9/UbkGxl/BhH853K5wWfGq+D2opzwQktccsPQ5hCzH
 WnWX9pyAObXrn+m/8eb4/Ike4rTSHVn3mkGZ92Ko/z7jY=
Received: from [10.42.20.80] (unknown [])
 by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id
 _____wBHAY1BXZBnn1awHg--.57740S2; 
 Wed, 22 Jan 2025 10:51:45 +0800 (CST)
Message-ID: <b8655031-671e-a0c4-22b6-604a01cbf644@163.com>
Date: Wed, 22 Jan 2025 10:51:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/bridge: Use devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250121081336.218918-1-oushixiong1025@163.com>
 <5azphlwpnx6i6uj367ywj6xyr24dcwjpx55hg4ibvb4y5qmngi@ngh2qeuazgd3>
From: Shixiong Ou <oushixiong1025@163.com>
In-Reply-To: <5azphlwpnx6i6uj367ywj6xyr24dcwjpx55hg4ibvb4y5qmngi@ngh2qeuazgd3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHAY1BXZBnn1awHg--.57740S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFyUuF1DAFykJFyDGF4fAFb_yoW3uwb_uF
 1ktw1DZrZ5Cr1Dua93GFy7W342g3W5W3yUJryDt345X343Z3W7JayUtFZFv3WDKF40yFyY
 yw18Xryjyrn3CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_Ksj7UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQzcD2eQUO-1fgAAsB
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


在 2025/1/21 18:16, Dmitry Baryshkov 写道:
> On Tue, Jan 21, 2025 at 04:13:36PM +0800, oushixiong1025@163.com wrote:
>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>
> Missing commit message
I will add commit message on v2, thanks.
>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> This doesn't match your email address, so SoB is missing.
>
The SMAP service for my email <oushixiong@kylinos.cn>  is not working 
now, so I sent this patch from my alternate mailbox.
<oushixiong@kylinos.cn> and <oushixiong1025@163.com> are both my email 
addresses.
>> ---
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 +---
>>   drivers/gpu/drm/bridge/microchip-lvds.c            | 5 ++---
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 3 +--
>>   3 files changed, 4 insertions(+), 8 deletions(-)
>>
>>


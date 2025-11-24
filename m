Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C68C7EC45
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 02:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA86810E1B8;
	Mon, 24 Nov 2025 01:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="jFaRCEOC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49236.qiye.163.com (mail-m49236.qiye.163.com
 [45.254.49.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2D410E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 01:46:03 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2a99bc279;
 Mon, 24 Nov 2025 09:45:59 +0800 (GMT+08:00)
Message-ID: <c73306de-f3a0-42ac-bfed-ef6b52cf4759@rock-chips.com>
Date: Mon, 24 Nov 2025 09:45:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/11] usb: typec: Export all typec device types
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251120022343.250-1-kernel@airkyi.com>
 <20251120022343.250-3-kernel@airkyi.com>
 <2025112109-glacial-outmatch-add7@gregkh>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2025112109-glacial-outmatch-add7@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ab38a087603abkunm5871a99e38da02
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0hCHlZDGUIeTExJS0ofGE1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=jFaRCEOC5tnsMOQoZGeJ0Zdgx6p5zsQj8cNYZi/RkN84pJ52JSRZufKH1THClfPoo8DtwqnoQ0GVvgMekScnFuWH9BR5DRj80PaRKV0KeKuZpBEK7cGkPcgAngzJsImZ/9i2H2DZEy0eBEvv86asQkLn4UStVNdivkE8Tjti02Q=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=iFeIe++8q8EPpaof9jHYzhJp6EO127xLsuYKalp+96M=;
 h=date:mime-version:subject:message-id:from;
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

Hi Greg,

On 11/21/2025 10:07 PM, Greg Kroah-Hartman wrote:
> On Thu, Nov 20, 2025 at 10:23:34AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Export all typec device types for identification.
> I do not understand what this means.  Who is going to use these symbols,
> and for what exactly?
>
> Be specific please.

In patch3, we need to distinguish whether the notifiers in patch1 are triggered by the typec port device or the typec partner device. Therefore, we export the various device types of typec here.

Sorry for the confusion. I will add more information later.

>
> thanks,
>
> greg k-h
>
>
-- 
Best,
Chaoyi


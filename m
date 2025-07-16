Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 047B9B06B10
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 03:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FC710E245;
	Wed, 16 Jul 2025 01:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="QErOC5Uo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 16 Jul 2025 01:21:02 UTC
Received: from mail-m49211.qiye.163.com (mail-m49211.qiye.163.com
 [45.254.49.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2267B10E245
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 01:21:01 +0000 (UTC)
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes
 [58.22.7.114]) by smtp.qiye.163.com (Hmail) with ESMTP id 1c20d7125;
 Wed, 16 Jul 2025 09:15:47 +0800 (GMT+08:00)
Message-ID: <3a27b7f6-a614-49b4-85dd-5ecba1fbbf70@rock-chips.com>
Date: Wed, 16 Jul 2025 09:13:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: connector: Add displayport connector for
 hotplug notify
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20250715112456.101-1-kernel@airkyi.com>
 <20250715112456.101-2-kernel@airkyi.com>
 <r7b4y74lr5qwejkejquosaar75mthjvjfy4pp6bbl4pgte6cq4@n3gwjolsaw2j>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <r7b4y74lr5qwejkejquosaar75mthjvjfy4pp6bbl4pgte6cq4@n3gwjolsaw2j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxOSVZISklNSh0dHkIYGk9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
 9VSktLVUpCS0tZBg++
X-HM-Tid: 0a9810cd504203abkunm840d694a1422a31
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDo6KCo4ITE1QgkzSBFDOBBD
 KD4wCg1VSlVKTE5JTUlDTk5MT0tLVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
 WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSU5ITTcG
DKIM-Signature: a=rsa-sha256;
 b=QErOC5UoqyDYWY6i+q1Kg2Q45UWi3O2IVyJcMA1U/7LcGrlGgWVB09uVvIPfrOYKEcsJjjpCUbjXms9J4bcz4KxHOo2ErvusAHAuHfIyYmuk3PwbGw6m0m6hCQLlKA6SYkIKMj/7nPuL8sgKuV/dILnY4vDV16XIqVGUvBs+5u4=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=8tvZ89+8JoZnHFukEKSRMTvjOkm6vgN7ue8AXAXJ2pE=;
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

On 2025/7/15 20:04, Dmitry Baryshkov wrote:

> On Tue, Jul 15, 2025 at 07:24:52PM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The USB Type-C DisplayPort alternate mode driver will find
>> "displayport" property for DRM hotplug event notify[0].
>>
>> [0]: https://lore.kernel.org/all/20210817215201.795062-9-hdegoede@redhat.com/
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>   .../devicetree/bindings/connector/usb-connector.yaml          | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
> Please see how it was done on other platforms. For example, qualcomm
> (both tcpm and pmic-glink) use port / endpoint to link to the DP PHY /
> DP controller.
Thank you! I'll check these out.


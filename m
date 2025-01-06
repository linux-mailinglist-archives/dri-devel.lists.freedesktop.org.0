Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C39DA02180
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 10:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8475F10E086;
	Mon,  6 Jan 2025 09:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="PiuwPbAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973189.qiye.163.com (mail-m1973189.qiye.163.com
 [220.197.31.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A1210E086
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 09:09:42 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 7d472a1c;
 Mon, 6 Jan 2025 17:09:36 +0800 (GMT+08:00)
Message-ID: <48e5f547-0f7a-406f-990e-6ec3e5df3e8f@rock-chips.com>
Date: Mon, 6 Jan 2025 17:09:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/17] phy: phy-rockchip-samsung-hdptx: Add the '_MASK'
 suffix to all registers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-7-damon.ding@rock-chips.com>
 <3dgfsscqpvlqzajjeav6oneeyae2tpc46av7hadgon5uwqibg5@ubziqwztp62m>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <3dgfsscqpvlqzajjeav6oneeyae2tpc46av7hadgon5uwqibg5@ubziqwztp62m>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk0ZS1YaHUsfSkxOS0hJTE5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a943ae0763003a3kunm7d472a1c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PxQ6SAw4CjITEx8wGBxKTEtK
 TA0aCyJVSlVKTEhNSk5PTkxDSkpNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFOQkI3Bg++
DKIM-Signature: a=rsa-sha256;
 b=PiuwPbAqxmEFBwTa2T0HrOX4XUXA3zPt+sglkv0JcB16IrLZpVbngO+jbHH4Mya55DrE/dTmA0yKZYELC6l/GAiO5N0hshCpCngbvtwiGZkY6IDqplB148jYLo69e1HURmXFLi3CgjIeYHJVE34Om3fHBpslXUaCrFqRCYWGLWU=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=IOtYJ/4fuEb2AjwCiDYcEOfXLlyiZIOg+Et+T8SsFS0=;
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

Hi Dmitry,

On 2024/12/30 20:34, Dmitry Baryshkov wrote:
> On Thu, Dec 26, 2024 at 02:33:02PM +0800, Damon Ding wrote:
>> Adding the '_MASK' suffix to all registers ensures consistency in the
>> naming convention for register macros throughout the file.
> 
> Nit: usually it would be "Add the '_MASK' suffix [...] in order to
> ensure consistency [...]".
> 

The commit msg will be fixed in next v5 patch series.

>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

Best regards
Damon

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3794480B167
	for <lists+dri-devel@lfdr.de>; Sat,  9 Dec 2023 02:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DF410E16B;
	Sat,  9 Dec 2023 01:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m12811.netease.com (mail-m12811.netease.com
 [103.209.128.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A90810E16B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 01:26:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=BwufFL80XCbds4b0EwhNO3JkhrzAg11DySk5t/d0z26Lz8b/7R1KMxF3bj8BT+vJDKHTsgAgOehypOhLxtqlQheaA/4ZjRICQ+ZPWZBmJN1cp0YMYWqo2aqLDJ6o+rJ661UMdqq951sRFc9+ln+5nuKNRUeVki9SfQZ2x6JNpe4=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
 bh=1bTFE0EmmEHjiY9PXtz3uWCZdBxCozfW+7tytPfM1i0=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id 817C3780197;
 Sat,  9 Dec 2023 09:26:25 +0800 (CST)
Message-ID: <bbf4d7a5-a6f5-447a-9f3e-1cd6f2acc7c9@rock-chips.com>
Date: Sat, 9 Dec 2023 09:26:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/17] dt-bindings: iommu: rockchip: Add Rockchip RK3588
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andyshrk@163.com>
References: <20231207075906.651771-1-andyshrk@163.com>
 <20231207080235.652719-1-andyshrk@163.com> <4012684.R56niFO833@diego>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <4012684.R56niFO833@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkxOHlZIHkIdQh0dTk9MSx1VEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
 kG
X-HM-Tid: 0a8c4c2ed0f4b24fkuuu817c3780197
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ky46Sww*HDw9S04JFhg2Sygp
 Fg0KChFVSlVKTEtJS0NOSkNNSEtLVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSU9DSDcG
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko:

On 12/9/23 00:29, Heiko Stübner wrote:
> Am Donnerstag, 7. Dezember 2023, 09:02:35 CET schrieb Andy Yan:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> Add a Rockchip RK3588 compatible
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 
> In the next iteration, please split this out into a separate patch and send
> it to the iommu+dt maintainers.
> 
> Supporting the iommus on rk3588 can be realized separately and the
> patch needs to go through a separate tree anyway.

Okay, I will split this patch out of this vop2 series, does this mean that
I also need to split out the iommu dt node as a separate patch from current
PATCH16 ?
> 
> 
> Thanks
> Heiko
> 
> 
> 

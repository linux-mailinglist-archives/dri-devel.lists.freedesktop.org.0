Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34E24B8AEF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 15:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0186510EDD3;
	Wed, 16 Feb 2022 14:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 38A7910EE11
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 14:01:21 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:52036.771379645
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 5D5DA100249;
 Wed, 16 Feb 2022 22:01:17 +0800 (CST)
Received: from  ([172.27.8.53])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 548e00fac09a411c85fa6fb7ab0cae38 for krzk@kernel.org; 
 Wed, 16 Feb 2022 22:01:19 CST
X-Transaction-ID: 548e00fac09a411c85fa6fb7ab0cae38
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
Message-ID: <3e34a508-3969-80d9-4ef7-7cb358c0147d@189.cn>
Date: Wed, 16 Feb 2022 22:01:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 2/3] dt-bindings: ls2k1000: add the display controller
 device node
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-3-15330273260@189.cn>
 <CAJKOXPfN+Ax8i_Mcax9LfbSG8VwM86YgUxuRUfSF_YEx4z0EaQ@mail.gmail.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <CAJKOXPfN+Ax8i_Mcax9LfbSG8VwM86YgUxuRUfSF_YEx4z0EaQ@mail.gmail.com>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-mips@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/2/3 16:50, Krzysztof Kozlowski wrote:
> On Thu, 3 Feb 2022 at 09:26, Sui Jingfeng <15330273260@189.cn> wrote:
>> From: suijingfeng <suijingfeng@loongson.cn>
>>
>> The display controller is a pci device, its vendor id is 0x0014
>> its device id is 0x7a06.
> The same as your patch 3 - these are not bindings.
>
> Best regards,
> Krzysztof

Yes, you are right. As there is no compatible string in my driver to match against the compatible
in the dc@6,1 device node.

I don't know how to write YAML document now, it seems no similar case can be reference?


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63E14C16E9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 16:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C094C10E6C2;
	Wed, 23 Feb 2022 15:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C64C10E6C2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 15:35:46 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:56548.2055228999
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 1F2A8100226;
 Wed, 23 Feb 2022 23:35:42 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 9c00df451d474c3f8e318f922b3767e2 for robh@kernel.org; 
 Wed, 23 Feb 2022 23:35:44 CST
X-Transaction-ID: 9c00df451d474c3f8e318f922b3767e2
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <72e3790f-088d-1a70-a5f7-3a18c14a6eae@189.cn>
Date: Wed, 23 Feb 2022 23:35:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 2/4] Documentation/dt: Add descriptions for loongson
 display controller
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-3-15330273260@189.cn>
 <YhVrigEnXTiNgk67@robh.at.kernel.org>
 <720f940e.5ac.17f26de3a5b.Coremail.suijingfeng@loongson.cn>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <720f940e.5ac.17f26de3a5b.Coremail.suijingfeng@loongson.cn>
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/2/23 21:56, 隋景峰 wrote:
> Something like this:
>   
> dt-bindings: display: Add Loongson display controller

Hi,

We are not a platform device driver, there is no
of_device_id defined in my driver. In other word,
my driver will not bind against devices whose compatible
is "loongson,ls7a1000-dc". We just parse the device tree
actively, find necessary information of interest.

What's the meaning of dt-bindings by definition ?
In this case, can I use the word "dt-bindings" in the commit title?

I want to follow the conventions, but get some push back,
Krzysztof say that he can not see any bindings, these are not bindings.


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239EE58C141
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 03:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B11E11A929;
	Mon,  8 Aug 2022 01:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A412411A929
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 01:57:42 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 00B3281F4E;
 Mon,  8 Aug 2022 03:57:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1659923860;
 bh=pmbwwpNpeueT+ISdq9JYGWZKBeNckBvZC95Cyj0u2Sg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=swPqynnQcZz6+SlHvETz+dwhUjz4urK9u64r73z6XvsUYdAbGVkP/mtbkhRWgHRh6
 OJXN7pa1wXLMrlZfyJ2y17VJsGqlajeEysgl3ZVDNjh2DxBXRkoJqjSU82j8zDfzSg
 343BA8tTQsKh8Bn4QTK4hWaVGqZc9ZKAkbHrlTLXT5p6GnOn5L6u+Fwi+TNLpp2L2s
 9o8/BSNbSgHNWA8qqTBi6DrYg+jR5jU0x/SsG1ghUA+lPs5xDbJ/W9pG0RsHE14rMI
 JKJZeke5ayJVD2eO/6wmkvTMrzNoUCOurRSuyZRcCXcczQ+6LsEdjgA/zGM+yH+HsA
 MsW3EsXkplYvA==
Message-ID: <4788af3e-b36d-fbe9-bd17-db1db85f1b7f@denx.de>
Date: Mon, 8 Aug 2022 03:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: icn6211: Add support
 for RGB/BGR swap
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220801131901.183090-1-marex@denx.de>
 <20220801163238.GA1130127-robh@kernel.org>
 <4d917546-23a2-a33a-1f59-ec78305aa854@denx.de>
 <CAL_JsqLHKnL80spDSAqMq0cOkVNztv0MjVsR-Rs83qd_q7_MQg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAL_JsqLHKnL80spDSAqMq0cOkVNztv0MjVsR-Rs83qd_q7_MQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/4/22 00:41, Rob Herring wrote:
> On Tue, Aug 2, 2022 at 5:33 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 8/1/22 18:32, Rob Herring wrote:
>>> On Mon, Aug 01, 2022 at 03:19:00PM +0200, Marek Vasut wrote:
>>>> The ICN6211 is capable of swapping the output DPI RGB/BGR color channels,
>>>> document a DT property to select this swap in DT. This can be useful on
>>>> hardware where such swap happens.
>>>
>>> We should ensure this series[1] works for you instead.
>>
>> [...]
>>
>>> Rob
>>>
>>> [1] https://lore.kernel.org/r/20220628181838.2031-3-max.oss.09@gmail.com
>>
>> I'm still not convinced that we should encode this pixel format value
>> directly into the DT instead of trying to describe the DPI bus color
>> channel width/order/shift in the DT instead. I think I mentioned that
>> before in one of the previous versions of that series.
> 
> I worry that it gets pretty verbose, but worth having the discussion.
> In any case, let's have that discussion and not add yet another one
> off property.

Done, I replied

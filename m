Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7555A2729
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 13:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C22C10E886;
	Fri, 26 Aug 2022 11:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649B310E883
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 11:54:42 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9726784607;
 Fri, 26 Aug 2022 13:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1661514880;
 bh=D++rKF3s/UH4UakVb6HaK8I+E1t5NAMNIacqOqPlmps=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=p1hQ1LslnNX83kLeSwJyAkrTjBZC12zA+KwZwTZLOLVEG5MR1IY7MmMkSlzvjhvcd
 7CmDaRObj7aLX5nAqqjSTNvPq16rpUnGjfmb2nC6QGZduA4f1+DG4KqxVAsMKGnw5u
 oXtVU5IIG6mm3cD7Ox2Dau8743uXdN0RA3Wotp7G6vwdh0r86+vAspvuiBLwQHQrdS
 z8ud4vBTzE86nfFtlfpKOawjjaf1dbOwNHwtTwuUWtm3V0IQ1MCi7j65uPzqdEJXjG
 1Q5FRBRNo307r2VLAjaLtDQ5doODhmAe2h/Ok7YPLUwYv14Ud1VA94I1ESaKQvTwS8
 hSnrkP82Ql5tg==
Message-ID: <4ef461af-18f3-7803-e943-745577c569aa@denx.de>
Date: Fri, 26 Aug 2022 13:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: icn6211: Add support
 for RGB/BGR swap
To: Linus Walleij <linus.walleij@linaro.org>
References: <20220801131901.183090-1-marex@denx.de>
 <20220801163238.GA1130127-robh@kernel.org>
 <4d917546-23a2-a33a-1f59-ec78305aa854@denx.de>
 <CAL_JsqLHKnL80spDSAqMq0cOkVNztv0MjVsR-Rs83qd_q7_MQg@mail.gmail.com>
 <4788af3e-b36d-fbe9-bd17-db1db85f1b7f@denx.de>
 <CACRpkdZ9ZbspO8HGwsp+vhH5TZwwCOZ0n_wh7uJ8F14aaYtJjw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdZ9ZbspO8HGwsp+vhH5TZwwCOZ0n_wh7uJ8F14aaYtJjw@mail.gmail.com>
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

On 8/26/22 13:52, Linus Walleij wrote:
> On Mon, Aug 8, 2022 at 3:57 AM Marek Vasut <marex@denx.de> wrote:
>> On 8/4/22 00:41, Rob Herring wrote:
>>> On Tue, Aug 2, 2022 at 5:33 AM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 8/1/22 18:32, Rob Herring wrote:
>>>>> On Mon, Aug 01, 2022 at 03:19:00PM +0200, Marek Vasut wrote:
>>>>>> The ICN6211 is capable of swapping the output DPI RGB/BGR color channels,
>>>>>> document a DT property to select this swap in DT. This can be useful on
>>>>>> hardware where such swap happens.
>>>>>
>>>>> We should ensure this series[1] works for you instead.
>>>>
>>>> [...]
>>>>
>>>>> Rob
>>>>>
>>>>> [1] https://lore.kernel.org/r/20220628181838.2031-3-max.oss.09@gmail.com
>>>>
>>>> I'm still not convinced that we should encode this pixel format value
>>>> directly into the DT instead of trying to describe the DPI bus color
>>>> channel width/order/shift in the DT instead. I think I mentioned that
>>>> before in one of the previous versions of that series.
>>>
>>> I worry that it gets pretty verbose, but worth having the discussion.
>>> In any case, let's have that discussion and not add yet another one
>>> off property.
>>
>> Done, I replied
> 
> So what is the verdict? Is this patch set dropped or shall it be
> applied?

Drop

Let's wait for the DPI pixel format description discussion in DT gets 
sorted out.

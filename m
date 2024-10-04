Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39EE99028B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 13:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB60210E9E5;
	Fri,  4 Oct 2024 11:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q/kZrgof";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF4210E9E5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 11:52:28 +0000 (UTC)
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi
 [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A17B4C9;
 Fri,  4 Oct 2024 13:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1728042653;
 bh=ON6DrslYXWB/ZmGPt3jwO8A/AguBGTwo8imwe3TmbNQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q/kZrgofnAHR0XHO235lJQ32XNSBUlvUlu3X2MQ2RIMRMnoaNOVuGkcQq4fXMShFB
 afvFkJ6R2jE8iEOSUWESFu7NgDw7lQpPC99sFfV4VKn/bWsh3LRzvW5a9r2aGZTElU
 LHvcblS6UggwWyIQDC320dguWDKnaUEDR3TqIMzQ=
Message-ID: <babeae17-488d-4428-aa55-fdd904a5425e@ideasonboard.com>
Date: Fri, 4 Oct 2024 14:52:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: fw_devlinks preventing a panel driver from probing
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Devarsh Thakkar <devarsht@ti.com>
References: <1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com>
 <34mewzvfyjsvyud3lzy6swxs7sr64xkgrbkxtvyw3czvoerct7@7guo32ehwa52>
 <5a540bdb-e3ca-494a-b68d-8f81f4d1cc1a@ideasonboard.com>
 <il3s26owmtyf3knniv7klkmw3uuz4dffrump7jo47dk6hxdsya@v5plmtjcbukf>
 <bed619c7-1a82-4328-825c-117c2ee3639d@ideasonboard.com>
 <CAA8EJprDdst-mcwMsWs=0AHGCNa_5Ng90tubSJ7VAHamx2T93g@mail.gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <CAA8EJprDdst-mcwMsWs=0AHGCNa_5Ng90tubSJ7VAHamx2T93g@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 27/09/2024 11:35, Dmitry Baryshkov wrote:
> On Fri, 27 Sept 2024 at 08:41, Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> On 27/09/2024 02:26, Dmitry Baryshkov wrote:
>>> On Thu, Sep 26, 2024 at 02:52:35PM GMT, Tomi Valkeinen wrote:
>>>> Hi,
>>>>
>>>> On 21/09/2024 23:15, Dmitry Baryshkov wrote:
>>>>> On Mon, Sep 16, 2024 at 02:51:57PM GMT, Tomi Valkeinen wrote:
>>>>>> Hi,
>>>>>>
>>>>>> We have an issue where two devices have dependencies to each other,
>>>>>> according to drivers/base/core.c's fw_devlinks, and this prevents them from
>>>>>> probing. I've been adding debugging to the core.c, but so far I don't quite
>>>>>> grasp the issue, so I thought to ask. Maybe someone can instantly say that
>>>>>> this just won't work...
>>>>>
>>>>> Well, just 2c from my side. I consider that fw_devlink adds devlinks for
>>>>> of-graph nodes to be a bug. It doesn't know about the actual direction
>>>>> of dependencies between corresponding devices or about the actual
>>>>> relationship between drivers. It results in a loop which is then broken
>>>>> in some way. Sometimes this works. Sometimes it doesn't. Sometimes this
>>>>> hides actual dependencies between devices. I tried reverting offending
>>>>> parts of devlink, but this attempt failed.
>>>>
>>>> I was also wondering about this. The of-graphs are always two-way links, so
>>>> the system must always mark them as a cycle. But perhaps there are other
>>>> benefits in the devlinks than dependency handling?
>>>>
>>>>>> If I understand the fw_devlink code correctly, in a normal case the links
>>>>>> formed with media graphs are marked as a cycle (FWLINK_FLAG_CYCLE), and then
>>>>>> ignored as far as probing goes.
>>>>>>
>>>>>> What we see here is that when using a single-link OLDI panel, the panel
>>>>>> driver's probe never gets called, as it depends on the OLDI, and the link
>>>>>> between the panel and the OLDI is not a cycle.
>>>>>
>>>>> I think in your case you should be able to fix the issue by using the
>>>>> FWNODE_FLAG_NOT_DEVICE, which is intented to be used in such cases. You
>>>>
>>>> How would I go using FWNODE_FLAG_NOT_DEVICE? Won't this only make a
>>>> difference if the flag is there at early stage when the linux devices are
>>>> being created? I think it's too late if I set the flag when the dss driver
>>>> is being probed.
>>>
>>> I think you have the NOT_DEVICE case as the DSS device corresponds to
>>> the parent of your OLDI nodes. There is no device which corresponds to
>>> the oldi@0 / oldi@1 device nodes (which contain corresponding port
>>> nodes).
>>
>> Do you mean that I should already see FWNODE_FLAG_NOT_DEVICE set in the
>> fwnode?
> 
> No, I think you should set it for you DSS links. If I understand
> correctly, this should prevent fwdevlink from waiting on the OLDI to
> materialize as a device.
> Note: my understanding is based on a quick roaming through the code
> some time ago.

Ok. Well, I did experiment with that, but I didn't figure out how to use 
it. Afaics, even if I set FWNODE_FLAG_NOT_DEVICE to the oldi nodes (just 
as an experiment I also set it to all the nodes from dss to oldi) in the 
DSS driver's probe, it doesn't help: the panel driver still doesn't probe.

I also wonder whether it would work reliably even if it did work. First 
the panel driver is prevented from probing as the oldi dependency is not 
present. Then the DSS driver probes, sets the above flag, but then it 
fails to probe as the panel is missing. At this point something should 
trigger the probing of the panel driver again, and I wonder if there's 
anything to trigger it.

  Tomi


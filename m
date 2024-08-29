Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD4B963D7C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 09:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDF310E593;
	Thu, 29 Aug 2024 07:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14FA10E593
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 07:45:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DAB80CE11FD;
 Thu, 29 Aug 2024 07:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B353C4CEC1;
 Thu, 29 Aug 2024 07:45:46 +0000 (UTC)
Message-ID: <d2400855-c9ec-4491-aa30-7b5147dcb43a@xs4all.nl>
Date: Thu, 29 Aug 2024 09:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Letux-kernel] [PATCHv2 0/6] drm/omap: hdmi: improve hdmi4 CEC,
 add CEC for hdmi5
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-media@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <43F64377-8394-448F-A6F0-4DA11DB9AEF5@goldelico.com>
 <3c36b0cd-7b43-4a63-a832-1d8d14a4512a@ideasonboard.com>
 <83b8be7b-a2c5-42f8-a42b-93dfc528a414@xs4all.nl>
 <3D3C502B-C29B-4156-9616-E5EFDB89E4B7@goldelico.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <3D3C502B-C29B-4156-9616-E5EFDB89E4B7@goldelico.com>
Content-Type: text/plain; charset=UTF-8
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

On 28/08/2024 21:41, H. Nikolaus Schaller wrote:
> Hi all,
> 
>> Am 28.08.2024 um 16:14 schrieb Hans Verkuil <hverkuil-cisco@xs4all.nl>:
>>
>> On 28/08/2024 15:57, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 25/08/2024 23:31, H. Nikolaus Schaller wrote:
>>>> Hi,
>>>> CEC features are useful to e.g. control HDMI monitor standby.
>>>>
>>>> But I wonder what happened to this series?
>>>>
>>>> I could find some reviewed-by: and acked-by: in [1] but it wasn't merged upstream
>>>> for unidentifiable reasons.
>>>>
>>>> We apparently had merged this series some years ago into our LetuxOS distro kernel
>>>> and now we found it to be broken (NULL dereference) at least for omap5uevm
>>>> (and likely Pyra Handheld) after rebasing to v6.11-rc (it was already broken
>>>> since v6.9-rc1). Fixes were not difficult, but it would be better if it were
>>>> part of upstream.
>>>
>>> There was a v3:
>>>
>>> 20210428132545.1205162-1-hverkuil-cisco@xs4all.nl
> 
> [A clickable link is here: https://lore.kernel.org/linux-media/20210428132545.1205162-1-hverkuil-cisco@xs4all.nl/ ]
> 
> Ah, I see. It wasn't sent to linux-omap so I didn't recognise/find it in my mails
> or omap-patchwork.
> 
> 
>>> I see there was a concern from Laurent in:
>>>
>>> YLjMZiX71mcQNQdO@pendragon.ideasonboard.com
> 
> Well, he didn't reject it although he had concerns, but I am not experienced with what
> he is talking about for a proper solution...
> 
>>>
>>> And we need an ack from the bridge maintainers for the drm_bridge parts. But the series is three years old, so I think someone would have to rebase on top of mainline and re-test and re-send first.
>>
>> I never really followed up with this. I still have the hardware, it is primarily
>> time. And also that for me this is quite low priority since I don't use omap5.
>>
>> If someone wants to refresh this series and post it, then I would have no problem
>> with it.
> 
> A far as I see it just needs a rebase - I guess on linux-next (or drm-misc?) and some
> compile fixes I already have implemented for our distro kernel.
> 
> So if you agree I could work on it, test on omap4&5 and submit a v4 and hope that you
> can jump in and support for the discussion. I would keep you (Hans) as commit author
> and just add a signed-off: and tested-by:

That would be fine.

For what it is worth, the last version I have is this one from 3 years ago:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=omap-bridge-cec

I haven't looked at it since.

Regards,

	Hans

> 
> But I will also need some time...
> 
> BR and thanks,
> Nikolaus
> 


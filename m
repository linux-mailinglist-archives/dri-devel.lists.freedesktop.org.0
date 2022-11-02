Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B58261632A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 13:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8579410E0CC;
	Wed,  2 Nov 2022 12:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F5410E0CC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 12:56:39 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id d26so44982947eje.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 05:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q2uaugI2bLKCRBQDyZF1zpLdxkje5gCBBYFZp43Wd6I=;
 b=WUpjROp47DVLKE/YqCgRwVWs5Ba4KDwfOn2r8qsXcWESSqfu2BfoiODrYoEv32JK7D
 Yq64ykOaCSc/StqteuzicKY2xX6TuvRx5jDQMW9u5KqEkvvv2RpEuZpfA43kyPwI2/kI
 C/T5Gf69SJ7KwXPY0DPwUZydoqz2B7dOvTMf7TIb0SFGUnGHFjXeL2JJF66dlWqeAN8X
 LS/DZIS7d/YjBIqCvN0F+BW3BtuGMl/h3ysA6/L4W+5HemG/GHZy98BTEmBL/TKt4TqS
 VOwBryFxmUJSCr/WLHpbchAbIRKBK73idnzDvYtJ3MIDhAH/wTlqdxEDZAKaY6vnzNAI
 Q7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q2uaugI2bLKCRBQDyZF1zpLdxkje5gCBBYFZp43Wd6I=;
 b=EcysWxAijP8CtTwcwI/ukSRRS9hAo+4xuDND5hetAAS3rIGbyo8q3b/PoRYadb/+gi
 399rh6IhBU2EzPhRnU6BXFAgh05KiTMqZ+st9I+GsKUMSKU2vMfhw1z2/WN2pEiIS0ZR
 iX7XFNvy+tY5eVWh4qnxMMV6gOl5WN8hqJSZ8H1quMDuRglWgJZwIYQIGwgOYmm+nowZ
 mSuibymtnR10ujPQAilQbfynZFWN1eFid/dFpZ9tMWGIKxLIpvWEIzRL5eBGA+qf3nD1
 na3uztJR5pTteXFvPz0WD339LWscerqgfAW5JSth6zmgBoS6DiXNtcVI6G9tPHCbCBd9
 wKPg==
X-Gm-Message-State: ACrzQf0boC5ISfyZM97NDmzlFMamZfQi9kNHIpoUCtACOqHkrwSDJ0Lv
 rq2nwE2R9y4HH+c1z6f3U5E=
X-Google-Smtp-Source: AMsMyM5IIyHjuOylE5jH3gft4kmid2ugmwS2wPXe6BGGQMGneACXLozhaKbdbEpnNQo6DfccibWy3Q==
X-Received: by 2002:a17:906:9510:b0:7ad:fd3e:124b with SMTP id
 u16-20020a170906951000b007adfd3e124bmr4478279ejx.502.1667393797560; 
 Wed, 02 Nov 2022 05:56:37 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:576c:b102:647e:9ffd?
 ([2a02:908:1256:79a0:576c:b102:647e:9ffd])
 by smtp.gmail.com with ESMTPSA id
 bo19-20020a170906d05300b007acbac07f07sm5413014ejb.51.2022.11.02.05.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 05:56:36 -0700 (PDT)
Message-ID: <35eeda2b-4570-4871-73f2-18b880b84284@gmail.com>
Date: Wed, 2 Nov 2022 13:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <20221102141954.7d362068@eldfell>
 <cc470b3d-a611-044f-2b35-cc827c962f9b@gmail.com>
 <20221102145036.30c70134@eldfell>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20221102145036.30c70134@eldfell>
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
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.11.22 um 13:50 schrieb Pekka Paalanen:
> On Wed, 2 Nov 2022 13:27:18 +0100
> Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>
>> Am 02.11.22 um 13:19 schrieb Pekka Paalanen:
>>> On Wed, 2 Nov 2022 12:18:01 +0100
>>> Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>>>   
>>>> Am 01.11.22 um 22:09 schrieb Nicolas Dufresne:
>>>>> [SNIP]
>>>>>>> But the client is just a video player. It doesn't understand how to
>>>>>>> allocate BOs for Panfrost or AMD or etnaviv. So without a universal
>>>>>>> allocator (again ...), 'just allocate on the GPU' isn't a useful
>>>>>>> response to the client.
>>>>>> Well exactly that's the point I'm raising: The client *must* understand
>>>>>> that!
>>>>>>
>>>>>> See we need to be able to handle all restrictions here, coherency of the
>>>>>> data is just one of them.
>>>>>>
>>>>>> For example the much more important question is the location of the data
>>>>>> and for this allocating from the V4L2 device is in most cases just not
>>>>>> going to fly.
>>>>> It feels like this is a generic statement and there is no reason it could not be
>>>>> the other way around.
>>>> And exactly that's my point. You always need to look at both ways to
>>>> share the buffer and can't assume that one will always work.
>>>>
>>>> As far as I can see it you guys just allocate a buffer from a V4L2
>>>> device, fill it with data and send it to Wayland for displaying.
>>>>
>>>> To be honest I'm really surprised that the Wayland guys hasn't pushed
>>>> back on this practice already.
>>> What should we Wayland people be pushing back on exactly? And where is
>>> our authority and opportunity to do so?
>>>
>>> The Wayland protocol dmabuf extension allows a graceful failure if the
>>> Wayland compositor cannot use the given dmabuf at all, giving the
>>> client an opportunity to try something else.
>> That's exactly what I meant with pushing back :)
>>
>> I wasn't aware that this handling is already implemented.
> Well... it's "optional". The Wayland dmabuf protocol has two cases for
> a client/app:
>
> a) you do the right thing and wait for the compositor to ack that the
>     dmabuf works (the reply should come pretty much immediately, not
>     needing the compositor to actually composite), or
>
> b) you just send the dmabuf and continue as if it always worked. If it
>     doesn't, you might get a protocol error later and be disconnected.
>
> Guess which one Mesa uses?
>
> I've been told Mesa has no way to handle a failure there, so it
> doesn't. I would not be surprised if others just copy that behaviour.
>
> I recall personally being against adding option b) to begin with, but
> there it is, added for Mesa IIRC.

Well I'm not sure if those projects actually used X or Wayland, but we 
did had cases where this was really used.

IIRC in the case of Prime offloading we now allocate a buffer from the 
displaying device in Mesa and do the copy from the rendering GPU to the 
displaying GPU on the client side.

The background is that this gave us much better control which engine and 
parameters where used for the copy resulting in a nice performance 
improvement.

Regards,
Christian.

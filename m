Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A59691F96
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 14:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C937510E135;
	Fri, 10 Feb 2023 13:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA6B10E135
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 13:10:03 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id lu11so15736337ejb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 05:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F3aRUf2swoXQO8rRYdidY/Qe/ht0eJkaiT4cEbTR0o4=;
 b=QJPmXXgjv5GCYOITEGBeKXMJu3iaIvIBGqgoVSOWTknlqAnK9Gw9n2xWQLFzhyrS9Z
 5Hnm0xjsEyby8VJWQrj2OuGpRx1FyDmUthxPR/4RzfmwttQHl8OQZXj6evazASThoL6W
 qONFZb05VUnZTvRMTyhv89MFGYqaMUsg9M7HHHElo0Cylk8efKUZ01sUnQgkwHzSoh9m
 +70M3YhWZkOEssGphItX1n1nXSrknaiNqgEnH5Rv5TOPRhVhGaHfbfQqLgLUhv0ZT7GF
 88fZJGRIVK8kLpiAXd9QmC1ldlHr1MKq3jdKmnZWv7magysebOFkCfkeW+un5WCPxF9Q
 C7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F3aRUf2swoXQO8rRYdidY/Qe/ht0eJkaiT4cEbTR0o4=;
 b=Ed/k5luI62i/xihBb8na0GqiO6qVeApt3p7nCyBfoLYJ35HTl8Nch78LDhJS9ADYg7
 88O0ZgEiTaiZs+Up2KcDg6vktTq0RU9dYSlIGN/FVIb3fnyiBdxtimr2k2GIDT5zmCm7
 ueXWHTOwV02w5b5RI1Y2jSt4BNnMnF0Z9mKLrbAXtWPHx/vmtuRsfy/7pwB48cCm4RHf
 tEVOrAh2ouXfBWHw8Id3055Pi+UfvkPfTuUpxtkQlkty0C4v7mOVXFCWzoBbr8zR4GIW
 GFxz+6XMd2EOsS1FLiXIa9TWei2qHe0pdnaEjndddu4AdiudSJVPVSY+6KdD6MUUVqMB
 YIiw==
X-Gm-Message-State: AO0yUKV42T5ta17rZPwBOAhl5qL7nKWZjs4vGiZC0B53yKdCfQ/hiLkk
 wIi3lobgrHK7NwIpwSUcEqY=
X-Google-Smtp-Source: AK7set/dnfm4tpVX9kAbmf7ZkTAgblctM/rhqpuy8knPAoVd00/s0MXNjRpSleOp2hlDu5vyHvMtxQ==
X-Received: by 2002:a17:907:6e07:b0:878:7ef1:4a20 with SMTP id
 sd7-20020a1709076e0700b008787ef14a20mr20970121ejc.4.1676034602025; 
 Fri, 10 Feb 2023 05:10:02 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:c3a8:7f10:6721:9ce3?
 ([2a02:908:1256:79a0:c3a8:7f10:6721:9ce3])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a17090651c300b007c11e5ac250sm2393449ejk.91.2023.02.10.05.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 05:10:01 -0800 (PST)
Message-ID: <075eec0b-3d6b-47ff-b278-1f3b74883aae@gmail.com>
Date: Fri, 10 Feb 2023 14:10:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Try to address the drm_debugfs issues
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
 <4161ae4e-549c-00f6-5f37-f635a9cb775d@gmail.com>
 <613b9aec-7105-ca2d-13cd-16ddd85a6fda@igalia.com>
 <cbe1ac86-1d41-bcf7-679b-ad4e2a810361@gmail.com>
 <20230209141923.4n4ffsqchdrx5vnp@houat>
 <95e7f52a-46ce-5e16-b686-5e4011693287@gmail.com>
 <20230209184841.axndkk66geoopr6d@houat>
 <67e10f56-15b3-a4f0-b5b3-23e878c1f12a@gmail.com>
 <20230210121858.fxlgnurminvrg725@houat>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230210121858.fxlgnurminvrg725@houat>
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
Cc: daniel.vetter@ffwll.ch, =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, mwen@igalia.com, mairacanal@riseup.net,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.02.23 um 13:18 schrieb Maxime Ripard:
> [SNIP]
>> Well you don't seem to understand what I'm talking about.
> I would certainly like you to stop making those kind of statements.
> Apart from creating unnecessary tension, they don't bring anything to
> the discussion.

Sorry for saying that. It was really not very polite from me.

It's just that you indeed seem to be talking about something completely 
different.

>> This is about the primary and render node under /dev/dri/, not some
>> separate hw device.
> The thing is, vc4 and v3d are both different nodes under /dev/dri and
> separate hw devices.
>
>> So you really have only one hardware device. E.g. clocks, IOMMU, power
>> etc... is all the same.
> Well, I mean, you can claim that all you want, but they certainly aren't
> the same hardware device. Just like on virtually any !x86 SoC, the GPU
> and display engines aren't the same device, and most of the time don't
> even come from the same vendor.

Yeah, I'm perfectly aware of that.

This is just about the primary and render node under /dev/dri. This is a 
software construct we use for access control, nothing else.

As far as I can see separate render and display hardware are a 
completely different topic. Or am I missing something?

> Going back to the initial issue, one of the files exposed by the v3d
> driver is the v3d registers content. It makes no sense to expose the v3d
> registers into the primary (vc4) node when the hardware doesn't match,
> and v3d has its own node.

But those are different primary nodes, aren't they? E.g. you have 
different /dev/dri/card0 and /dev/dri/card1 for them?

For the IOCTL level the render node is just a secure subset of the 
functionality of the primary node. So I would not expect that there is 
something different for the debugfs files.

Regards,
Christian.

>
> Maxime


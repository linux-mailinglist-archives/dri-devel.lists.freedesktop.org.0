Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A27F78250E0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 10:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FCD10E590;
	Fri,  5 Jan 2024 09:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB4110E58E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 09:35:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d5d898162so10251665e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 01:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704447308; x=1705052108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lJUyDVGU0XKgaKwYDjGSDxNTROvNmlr5rGkLfg67AJU=;
 b=Yj3uQEyaHa7F2idUAk0odOgjil9EmjxvXSB/1bZ6SXmIhrDSCm6G86vO23+qgIqPGf
 KncTsOFBInTGaiwkUZQodGy6F43epZc6Adhy78z7yimdj++oLi/zgROTHiCUaQzUG6rr
 Y0GjKLPdxdUZy01f6xtAJPOeGxFMx1DaaayEUfE5Wkg19cV8iIr1Nq5AGfh7/eta9MY/
 tP40B/c9j2OEqWjVNrSPQ4BrE+/Lt0nk/cMQodelrt4CCmZAYjEVqxxvfTMUFL88ehBN
 l9xmyPfEMEimnqkaT57ktXpw3rcCfRJ1icz7xEqC69QLL5FJCUYREEHoUhtYttWOEEkt
 EaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704447308; x=1705052108;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lJUyDVGU0XKgaKwYDjGSDxNTROvNmlr5rGkLfg67AJU=;
 b=UJmgWn9CIrjn0RLdx0O5S6MorKeogEVrsa87T9TOoUKru3dzKJ1dNfzY5abzl500Bd
 eZ9TUuEHNezdeKBCyqubmNdxWmUYnH8WtY5HL04OHHEBB2Lxs3K95nS4mms1EJbS9FGS
 tYvw/waJ6EMfIKeyPQu/Ry167eP0X8U2Ms15mNFSymk16MrzocbZtf7B6E++0PSqjqQ5
 uMmQ9dZllaTHQJqdBp+dgJU+V/X8j9sRdziRyzwdvhN0RJa9sqJxoTtQvgmLQvoAYLjM
 Fg80FuyHVS95Zn+LvTyW59TufZc6fOt740epPT+eL+SpkSAFrej6Rufcz9mMopCq92eb
 cysQ==
X-Gm-Message-State: AOJu0YzTW6iu3Fq692UMQ835whRdwOpStfEGJdHqN54JiMbCqMqXP3uB
 L124hdzGU4KBVPLulfznHiw=
X-Google-Smtp-Source: AGHT+IGdYoX12msFQex2gQBmL00N+tTwnAfTSgVHTKvPHEqpTgUu6NAX8rJzRZKET7C6gVrEN0zBkQ==
X-Received: by 2002:a05:600c:4fcb:b0:40e:347e:b4d with SMTP id
 o11-20020a05600c4fcb00b0040e347e0b4dmr1100921wmq.89.1704447308037; 
 Fri, 05 Jan 2024 01:35:08 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a05600c1c1a00b0040e3804ea71sm1002466wms.10.2024.01.05.01.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 01:35:07 -0800 (PST)
Message-ID: <160df81d-e5fa-4798-96d4-5ab1809a9680@gmail.com>
Date: Fri, 5 Jan 2024 10:35:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Content-Language: en-US
To: Jeffrey Kardatzke <jkardatzke@google.com>, Simon Ser <contact@emersion.fr>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
 <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
 <20231213110517.6ce36aca@eldfell>
 <20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
 <20231213133825.0a329864@eldfell>
 <20231213132229.q3uxdhtdsxuzw3w6@pop-os.localdomain>
 <20231213161614.43e5bca8@eldfell>
 <9m8eC1j8YSwxu9Mr8vCXyzF0nfyCSHpFbfc__FtUjjKppew65jElBbUqa-nkzFTN-N_ME893w0YQRcb3r3UbIajQUP-Y5LxnHKKFoiBepSI=@emersion.fr>
 <CA+ddPcOew7Wtb1-Cakq_LPN1VwtG+4vpjpLFvXdsjBunpefT1A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CA+ddPcOew7Wtb1-Cakq_LPN1VwtG+4vpjpLFvXdsjBunpefT1A@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.01.24 um 20:50 schrieb Jeffrey Kardatzke:
> Any feedback from maintainers on what their preference is?  I'm fine
> with 'restricted' as well, but the main reason we chose secure was
> because of its use in ARM nomenclature and this is more for ARM usage
> than x86.

Well AMD calls this "trusted", but I think that's just slightly better 
than "secure".

+1 for using "restricted" cause that seems to match the technical 
consequences.

Regards,
Christian.

>
> The main difference with similar buffers on AMD/Intel is that with
> AMD/Intel the buffers are mappable and readable by the CPU in the
> kernel. The problem is their contents are encrypted so you get junk
> back if you do that. On ARM, the buffers are completely inaccessible
> by the kernel and the memory controller prevents access to them
> completely from the kernel.
>
> There are also other use cases for this where the hypervisor is what
> is controlling access (second stage in the MMU is providing
> isolation)....and in that case I do agree that 'secure' would not be
> the right terminology for those types of buffers.   So I do agree
> something other than 'secure' is probably a better option overall.
>
>
> On Fri, Dec 22, 2023 at 1:40 AM Simon Ser <contact@emersion.fr> wrote:
>> On Wednesday, December 13th, 2023 at 15:16, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>>>>> It is protected/shielded/fortified from all the kernel and userspace,
>>>>> but a more familiar word to describe that is inaccessible.
>>>>> "Inaccessible buffer" per se OTOH sounds like a useless concept.
>>>>>
>>>>> It is not secure, because it does not involve security in any way. In
>>>>> fact, given it's so fragile, I'd classify it as mildly opposite of
>>>>> secure, as e.g. clients of a Wayland compositor can potentially DoS the
>>>>> compositor with it by simply sending such a dmabuf. Or DoS the whole
>>>>> system.
>>>> I hear what you are saying and DoS is a known problem and attack vector,
>>>> but regardless, we have use cases where we don't want to expose
>>>> information in the clear and where we also would like to have some
>>>> guarantees about correctness. That is where various secure elements and
>>>> more generally security is needed.
>>>>
>>>> So, it sounds like we have two things here, the first is the naming and
>>>> the meaning behind it. I'm pretty sure the people following and
>>>> contributing to this thread can agree on a name that makes sense. Would
>>>> you personally be OK with "restricted" as the name? It sounds like that.
>>> I would. I'm also just a by-stander, not a maintainer of kernel
>>> anything. I have no power to accept nor reject anything here.
>> I'd also personally be OK with "restricted", I think it's a lot better
>> than "secure".
>>
>> In general I agree with everything Pekka said.


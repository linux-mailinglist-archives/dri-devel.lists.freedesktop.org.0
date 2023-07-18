Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3B3757AF1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 13:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191EB8911F;
	Tue, 18 Jul 2023 11:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A818911F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:52:47 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51e2a6a3768so8010421a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 04:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689681165; x=1692273165;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sG7ozDX9NM/o92dg3TXw0CQG4MCfF4i8UsLjn3lS5G0=;
 b=Z1thpY3baZq+vNWRDe7n6I78lo0iEWey746H4WIdm7n2G/qpKhAiP1OiNvTElXJBwg
 RcJ1rRNpB2Gd3buIlDETcE+iOXZ0tSFkob7doB6jT8ujswTv2d0inpsFtPfO8SjqawvD
 el6Hyp09AKo61UqGmNmM5QvD8cH3BwGkVggJ2eL5vE+KCh8AKp9qD8R+11DvJXby817E
 xDDgUI5F04r9m2fFL05HxJN+/xcLnhW6KlyuSR5bh5N5LZ3ReKNuzBxcxFVjU5Ha2auC
 /O0r+o8/4FLw4yG7Q8KbUe9Wc8E4H0vOp/0lzXZwLJhBH+4p4wt09tbhO+DtqtC7DG2t
 wOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689681165; x=1692273165;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sG7ozDX9NM/o92dg3TXw0CQG4MCfF4i8UsLjn3lS5G0=;
 b=JqP/5UBw7jMle5zzZRZ5QLCfNScK2NYslRSecJltsvRKwSrV97wngmDhExW2q9PS6J
 mYQSa1UA+dHi7Eyvt3QXgK3rxyV0VqoQAfOE/Soe6Zp+EXhaaeuga9vgGJ6oDaiP7YV6
 wrOh5+zpcG6h/MJYberTqWRACIlvxObAJLCQ2X4ZX1OY0ZoSodlziNgyI6y7OE3U0ttC
 by1G50+OQ2gAnKX6Ve7SXNx15tNUB85Z0eJ+1SUl2rBnvufs3ALL21ieJehEXXIAefhn
 PxChp9n8j5S+qr9YyJaoAEcRN+iT/Cwu3uZ9dF4oKnX/mA3P133MyJ3ilC1eW8E0HLHc
 fGrQ==
X-Gm-Message-State: ABy/qLa4PBs7EGNGxnTiBzNZ1Woxq2K/QkYvDzDBlYKNiNsqcDOi1+GO
 1tFqeF0RasX80OmyD+Mzs7Wh5g==
X-Google-Smtp-Source: APBJJlGRh5VMYFGKAv394CF4+UWzckjHWOKPQTtNJ6e5mbbsz7l5/4gYEjZGwnwOScJexCjtAxsLaA==
X-Received: by 2002:aa7:cb4d:0:b0:51d:8f9b:b6ce with SMTP id
 w13-20020aa7cb4d000000b0051d8f9bb6cemr13414755edt.1.1689681165230; 
 Tue, 18 Jul 2023 04:52:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7dcc5000000b005217a24addbsm1122638edu.20.2023.07.18.04.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 04:52:44 -0700 (PDT)
Message-ID: <74b666ec-092e-28ea-498b-0efa103d7988@linaro.org>
Date: Tue, 18 Jul 2023 13:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Content-Language: en-US
To: Frank Binns <Frank.Binns@imgtec.com>, "conor@kernel.org"
 <conor@kernel.org>, Sarah Walker <Sarah.Walker@imgtec.com>
References: <20230714142526.111569-1-sarah.walker@imgtec.com>
 <20230715-paramount-straining-6a486f8af20d@spud>
 <a86f6359706485cf595889a07e513e2b9fd6d71b.camel@imgtec.com>
 <4131759e-9474-48f6-cc05-67b6d4b6559b@linaro.org>
 <1cb4f6b57f0826377f0aef85a8abcf0b5f51c07c.camel@imgtec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1cb4f6b57f0826377f0aef85a8abcf0b5f51c07c.camel@imgtec.com>
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "hns@goldelico.com" <hns@goldelico.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>,
 Donald Robson <Donald.Robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/07/2023 13:36, Frank Binns wrote:
> Hi Krzysztof,
> 
> On Tue, 2023-07-18 at 13:10 +0200, Krzysztof Kozlowski wrote:
>> On 18/07/2023 13:08, Frank Binns wrote:
>>>> And this
>>>> items:
>>>>   - const: gpu
>>>> can just be
>>>> const: gpu
>>>>
>>>> Although, if there is only one interrupt this is probably not
>>>> particularly helpful. Are there other implementations of this IP that
>>>> have more interrupts?
>>>
>>> No, all our current GPUs just have a single interrupt. I assume it's more future
>>> proof to keep the name in case that ever changes? 
>>
>> Why do you need name in the first place? If there is single entry, the
>> name is pointless, especially if it repeats the name of the IP block.
>>
>>> As in, by having the name now
>>> we can make it a required property, which I guess we won't be able to do at some
>>> later point.
>>
>> Why even making it required?
> 
> It seems nicer to look up a resource in the driver based on a name rather than
> an index. 

Not really... Slower and confuses people, because then they think order
is flexible.


Best regards,
Krzysztof


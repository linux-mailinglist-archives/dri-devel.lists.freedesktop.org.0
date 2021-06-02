Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4753398582
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353DC6E18F;
	Wed,  2 Jun 2021 09:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21ED6E18F;
 Wed,  2 Jun 2021 09:44:44 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id ba2so423897edb.2;
 Wed, 02 Jun 2021 02:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=UuOPhdUyBFXrhfwFcct47T9i3iD1LmTi5xRIhQcwg6M=;
 b=mQnxGYaqIilkzlUf7huS35TYHXj16ZlTOoiIC7WMqVB5CLJUUK43Njo7+LZg3z04Gb
 +dF6I6CHkUie5PjK9+sjKgy466m6hZWbb/Q00I/8ISC4lyiXF+6GFI017SsNW1iRzom/
 +qYXCxekXXulkunG4fMHv21x5JqlQtOY+NhYDBdYzi02kIVUV60QsJTFb6oJtCfWtk5x
 sXs/T59pKo1noia0Rig5chAbWrrl94WUN9SMoMPbFQN6NFEy6Ja6nFbVc5tdHSB2DWlo
 vCAsu5TpKa6JETArcLNpXLf55rAhTJRoDCC+2mbo/5WEb00yqXAifIyozPrOoDgCYx/R
 HIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UuOPhdUyBFXrhfwFcct47T9i3iD1LmTi5xRIhQcwg6M=;
 b=T15zBYggpFoa7cLdeV8vcEuz7zb1GdA+FShaRKG93dJOKgrdxeMHELOacvd901D/Us
 rbJBznjjSM3wZlI6N+CaMIYlQl2uyuZQQnHB44r6A2GvjOt1pkP4MM9jlITFDO0stcmW
 +bhK+q+KSUVXvO9o4lQKDXzWEz/ciZZ4WhlCUiZKhUapkvqpImKJhoH3jvx/iJY743nB
 mwflM9R1GuqrtWtKCohiIaNfg3Rh1Bhl9vgA67N3i0dSJDFitJwjWmx4qGnI/R+hKV0G
 anZ8SlCPU4M02XY1Kkkv3Sg+GTJdSfjqmB1h59PTNVQ6J8kJma65Qdm8kMQjgprENIoL
 fKuw==
X-Gm-Message-State: AOAM530OSbv1inORQkfS4WSipH+g0I2jZGwMrVXCMB0nH17fGZeQwFOa
 q5aDnWnf/VHq7kIhXPk3YxqNcHuKBhQ=
X-Google-Smtp-Source: ABdhPJzg9rBP1xRaK4csTP9sh1j2pLq9FjuH8TAPsuxfZDGsbXQkQzs+4DaLfkKImUJsQiJLQGdKQQ==
X-Received: by 2002:a05:6402:1111:: with SMTP id
 u17mr37784269edv.87.1622627083523; 
 Wed, 02 Jun 2021 02:44:43 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00?
 ([2a02:908:1252:fb60:cd07:2759:3eec:1d00])
 by smtp.gmail.com with ESMTPSA id f7sm8352919ejz.95.2021.06.02.02.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 02:44:43 -0700 (PDT)
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Stone <daniel@fooishbar.org>
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <bbb990cf-008a-e4d3-93d3-a9adc2f202b7@gmail.com>
Date: Wed, 2 Jun 2021 11:44:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.06.21 um 10:57 schrieb Daniel Stone:
> Hi Christian,
>
> On Tue, 1 Jun 2021 at 13:51, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 01.06.21 um 14:30 schrieb Daniel Vetter:
>>> If you want to enable this use-case with driver magic and without the
>>> compositor being aware of what's going on, the solution is EGLStreams.
>>> Not sure we want to go there, but it's definitely a lot more feasible
>>> than trying to stuff eglstreams semantics into dma-buf implicit
>>> fencing support in a desperate attempt to not change compositors.
>> Well not changing compositors is certainly not something I would try
>> with this use case.
>>
>> Not changing compositors is more like ok we have Ubuntu 20.04 and need
>> to support that we the newest hardware generation.
> Serious question, have you talked to Canonical?
>
> I mean there's a hell of a lot of effort being expended here, but it
> seems to all be predicated on the assumption that Ubuntu's LTS
> HWE/backport policy is totally immutable, and that we might need to
> make the kernel do backflips to work around that. But ... is it? Has
> anyone actually asked them how they feel about this?

This was merely an example. What I wanted to say is that we need to 
support system already deployed.

In other words our customers won't accept that they need to replace the 
compositor just because they switch to a new hardware generation.

> I mean, my answer to the first email is 'no, absolutely not' from the
> technical perspective (the initial proposal totally breaks current and
> future userspace), from a design perspective (it breaks a lot of
> usecases which aren't single-vendor GPU+display+codec, or aren't just
> a simple desktop), and from a sustainability perspective (cutting
> Android adrift again isn't acceptable collateral damage to make it
> easier to backport things to last year's Ubuntu release).
>
> But then again, I don't even know what I'm NAKing here ... ? The
> original email just lists a proposal to break a ton of things, with
> proposed replacements which aren't technically viable, and it's not
> clear why? Can we please have some more details and some reasoning
> behind them?
>
> I don't mind that userspace (compositor, protocols, clients like Mesa
> as well as codec APIs) need to do a lot of work to support the new
> model. I do really care though that the hard-binary-switch model works
> fine enough for AMD but totally breaks heterogeneous systems and makes
> it impossible for userspace to do the right thing.

Well how the handling for new Android, distributions etc... is going to 
look like is a completely different story.

And I completely agree with both Daniel Vetter and you that we need to 
keep this in mind when designing the compatibility with older software.

For Android I'm really not sure what to do. In general Android is 
already trying to do the right thing by using explicit sync, the problem 
is that this is build around the idea that this explicit sync is 
syncfile kernel based.

Either we need to change Android and come up with something that works 
with user fences as well or we somehow invent a compatibility layer for 
syncfile as well.

Regards,
Christian.

>
> Cheers,
> Daniel


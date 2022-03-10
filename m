Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B574D440D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 10:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F044E10EA20;
	Thu, 10 Mar 2022 09:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33F510EA20;
 Thu, 10 Mar 2022 09:55:11 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id gb39so10838765ejc.1;
 Thu, 10 Mar 2022 01:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cvKu4UTXJmcsQPs19siSUTkXQcumaSo0woR4Cme30iA=;
 b=SLFLd/w+UX4pFJkFeyQvvhf8HM+jqcVn3Ml1pnSic50XG/3RRZG3HdzTgud2MFn53k
 noIRH642rMBNe1y3WaFAOppXiY75Xn/Ha0b57CzDOD6vBjbXCRZLjghCHZR1Gixhfy3W
 REeyfBp7wS1HthrmNlMCWUnolRyHZICTLawlim4N3Sc7b/hB2iONC5sCaTn6NofQ5jXt
 dClRbhagHmrfBw+8NE3MBvFD+hT4aRqWzOU+AVCXCLMaE9B1ZdnajJ4hRdBSj+bnwMgj
 LqL7m5G9MjiamERTTR6nX7X2C4aJg3H2Z1JivQQZKxOeAex9PraXM9l+sNbHzlllRX2y
 m8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cvKu4UTXJmcsQPs19siSUTkXQcumaSo0woR4Cme30iA=;
 b=aR/FCY9PVIYI2osvPhyrUOsMla9KPYQPo1aLgt+Qw8m7jobNu6RsT+oOTsD4R1yrSZ
 Oc6W3dp+QmlBwTyF6SmQ3xqjvWHrozneZfP0Jx0jnYCrjSNiOidNsR1S+ydoyUIaeeyb
 1T2dSC6IOId9+6T708qlCv+tL7TPGa5BruUqgBdWj/zFROEwJQAHTmcAnktTUmq0pFu8
 4Qf8rskXlFVzKNknybO/U2jSyOzM9+xdeIMBrj4aZcqztfT9WsM39sHK/Y6L2Hqupucs
 S5x4ZUPaMvp2MmRh1i7ppyQiaW+TwbYP9k2YW6TNvmXhfWUxzac4XU/Aq+N7yei39amf
 15zw==
X-Gm-Message-State: AOAM531ot1lfecUUfnTu35jq7rppZ4XdJECnKjtPZrYKNgS394qvQ8DH
 tuvL/pJobzy4kLe7bxAtgpg=
X-Google-Smtp-Source: ABdhPJxkMLbHCGoNe0uehvqL/c8C2fUEtv7z+XMinQa4I5a4GwJRQNaQZGm2rCfaHsCrAEjg/ERmJA==
X-Received: by 2002:a17:906:5d08:b0:6da:b4ea:937 with SMTP id
 g8-20020a1709065d0800b006dab4ea0937mr3479692ejt.446.1646906110428; 
 Thu, 10 Mar 2022 01:55:10 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:87b1:f8fa:c08e:8bd0?
 ([2a02:908:1252:fb60:87b1:f8fa:c08e:8bd0])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a50eb8c000000b00410f02e577esm1837327edr.7.2022.03.10.01.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 01:55:08 -0800 (PST)
Message-ID: <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
Date: Thu, 10 Mar 2022 10:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 09.03.22 um 19:12 schrieb Rob Clark:
> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
> <contactshashanksharma@gmail.com> wrote:
>> From: Shashank Sharma <shashank.sharma@amd.com>
>>
>> This patch adds a new sysfs event, which will indicate
>> the userland about a GPU reset, and can also provide
>> some information like:
>> - process ID of the process involved with the GPU reset
>> - process name of the involved process
>> - the GPU status info (using flags)
>>
>> This patch also introduces the first flag of the flags
>> bitmap, which can be appended as and when required.
> Why invent something new, rather than using the already existing devcoredump?

Yeah, that's a really valid question.

> I don't think we need (or should encourage/allow) something drm
> specific when there is already an existing solution used by both drm
> and non-drm drivers.  Userspace should not have to learn to support
> yet another mechanism to do the same thing.

Question is how is userspace notified about new available core dumps?

Regards,
Christian.

>
> BR,
> -R


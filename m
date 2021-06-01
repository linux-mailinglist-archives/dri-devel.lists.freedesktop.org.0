Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F13397154
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F196EA20;
	Tue,  1 Jun 2021 10:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C726EA19;
 Tue,  1 Jun 2021 10:21:59 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id df21so16619999edb.3;
 Tue, 01 Jun 2021 03:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=PVhxjR6hxKigUAheksYNUXdQ2PHTFXEJWkC6pvY3Q30=;
 b=Sn83TZNfoYnCNVhQai3cSgkPCNvkbdXTGTPeemY3ava8Po7C0nZecJj+1E4CiwJr3E
 q3/9jL8njRaNDH3Wh0pGPNbHsbLuL4mcJy5p6fcjamsP4jWKi2O0XshYBz7ALEnNAEmB
 u4R2VcFR83mzH+isBxuHeOdjdT/8IKKWXgPJc9IdWmxe1HoYrkfk750xZgWiMK9mdCs+
 qAXdMPFcFf+Rdr2CNfuG0TVkONVjuTd/UuGSrvpW9UbQKU+q5mIeCD4H2XgfEUXGfeBS
 bobmjUSEx9fDXkM4WRwvQ1I604njVA7+c9vfOUtJ9OWK2VvQQ443JkDuAewJuZ7U1MjJ
 sRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PVhxjR6hxKigUAheksYNUXdQ2PHTFXEJWkC6pvY3Q30=;
 b=j++340ByzEY0fcIdwfaHoQ5Xelh0QZx+zwR01O9BWYD/XY2V8pdMSSVetdz01Cm1BH
 C89zYo+zzh+2gJd6Mm2xiiCR994IoEGtJhjmtNnkbepS746B39Uweof7SAQio9O5yisN
 kScol9NcoUU/Yy0tVJFhvlbIljx9SlvgoLhUjXawTwlmPZU4X9+9ywnsA9e/WqV1m2jX
 eM/MrZ3aGBzAwjlNPfS2BSteQjBYiFKz5na9Bk6M3KyfhwvzqHKnOaQ09/y4aVoylvmD
 XoAXc8tev1V7bgqJ/muhvBoN2KDEoPgpP9rT4NzKf8NAsJ5UoGHhQEnj4vWEeoFXnUUw
 TULQ==
X-Gm-Message-State: AOAM533AClEoh/ljls++OVVlP8LGpz/6Qz2KPpdFxiAv9pd8pqRVsRsP
 0zGwHHiqEf5pOZGzoHnSfmE=
X-Google-Smtp-Source: ABdhPJz7RYm94kcXA9b3LZrumDi6Cl4NlxB5L4ZakHJyfZ0YlOpBnLYmjY87MfIQ9gJhWZDnbC/rdQ==
X-Received: by 2002:a05:6402:4381:: with SMTP id
 o1mr32353525edc.188.1622542917849; 
 Tue, 01 Jun 2021 03:21:57 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:5ee0:b6d9:de45:97bd?
 ([2a02:908:1252:fb60:5ee0:b6d9:de45:97bd])
 by smtp.gmail.com with ESMTPSA id b16sm8288402edu.53.2021.06.01.03.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 03:21:57 -0700 (PDT)
Subject: Re: Linux Graphics Next: Userspace submission update
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
Date: Tue, 1 Jun 2021 12:21:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.06.21 um 11:02 schrieb Michel Dänzer:
> On 2021-05-27 11:51 p.m., Marek Olšák wrote:
>> 3) Compositors (and other privileged processes, and display flipping) can't trust imported/exported fences. They need a timeout recovery mechanism from the beginning, and the following are some possible solutions to timeouts:
>>
>> a) use a CPU wait with a small absolute timeout, and display the previous content on timeout
>> b) use a GPU wait with a small absolute timeout, and conditional rendering will choose between the latest content (if signalled) and previous content (if timed out)
>>
>> The result would be that the desktop can run close to 60 fps even if an app runs at 1 fps.
> FWIW, this is working with
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 , even with implicit sync (on current Intel GPUs; amdgpu/radeonsi would need to provide the same dma-buf poll semantics as other drivers and high priority GFX contexts via EGL_IMG_context_priority which can preempt lower priority ones).

Yeah, that is really nice to have.

One question is if you wait on the CPU or the GPU for the new surface to 
become available? The former is a bit bad for latency and power management.

Another question is if that is sufficient as security for the display 
server or if we need further handling down the road? I mean essentially 
we are moving the reliability problem into the display server.

Regards,
Christian.

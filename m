Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0355F387A68
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8D56E092;
	Tue, 18 May 2021 13:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABF96E092
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 13:51:08 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id lz27so14655092ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 06:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=H8BiU6DOGOW5f6WfUlJmBeoZ0QJNBvbj4Vvb4k4VW+Y=;
 b=izG0HQnhby9bBPvsJkTkwDjERCs/ysS9w4FBy+Y4iFXO5HmN1+8h/q3DfOjSDeHmnP
 z7UWatxn3bbo4mjZaJhqnvPIAzHrj0sMmZEGN5pbBhzztIveyBDQ+PtyigyJqxSY7+SK
 jXES+dn+amfJgq6B02YdZ88kWgsnQJrEbawr2Qyjo1JNg0ZL7gZu/whw9yBxWCBcuKLi
 brnMdNNJXguOOvXbHcZtSe1F1pZT6ESC94BZe/Z8irdTF40yqUbixG5AUOaQXdg3Sx6p
 RDklEQELYuWBfbgQCkmxgOX0fKTr0K/GkwGOk6JJd4Q+HHUaVxt9CRk6lGfoohqKEaNJ
 //qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=H8BiU6DOGOW5f6WfUlJmBeoZ0QJNBvbj4Vvb4k4VW+Y=;
 b=lMeWAM4OKGz0HZtvIwbfpqbXp+S3o9d76yrHIchRn+yCIEouBfIlVUAqvCpKLbkWDa
 Igwzk4HPnYFlSB/uwgoJz52kIQ8TdTeiLhZIu/rxUaTUjNh8trUf0xrHHnqvJ5UTG3Sn
 nyKyiCG0l2wYTFfC93aumR7ordH/eUkQ3/vMMovSV1NeosbME4gu0bePVBL+bQyfziO6
 ReLmD0f7x7rbENHbsDixYpZZZ2tG2QzVsajgvIrZmnpgApLI+OAzncjKT3Q91LtPIecM
 4IGqSXumUJfVkctavFmCx9GzkVN7o2eFagbo6VFe/xOzFgcQCpeFA1/KzG7xCjWC581t
 oAxw==
X-Gm-Message-State: AOAM532QLPXQeF5VaJbta5Ha+IGvkndIVwE0JTbsFsKTcuse1TJQ4boR
 VrYWSC2Lda9tLD9sQWjYCG3UKPeMmgg=
X-Google-Smtp-Source: ABdhPJw9M116HnYxdYcivnj11KL9q3nu3EUn6CYqQyDtKQfknySljFZhh4qTnXX9kBKelQ8UZxTIhA==
X-Received: by 2002:a17:906:3042:: with SMTP id
 d2mr6228223ejd.234.1621345867365; 
 Tue, 18 May 2021 06:51:07 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3b27:1830:9671:4cc9?
 ([2a02:908:1252:fb60:3b27:1830:9671:4cc9])
 by smtp.gmail.com with ESMTPSA id k5sm14437656edk.46.2021.05.18.06.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 06:51:06 -0700 (PDT)
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: Daniel Stone <daniel@fooishbar.org>
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
 <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
 <CAKMK7uF=y44e9-0-4MBj3jRBdCqMaLgKutTMeBWCbySRnPR4KQ@mail.gmail.com>
 <CAOFGe960UMe4=Xxcoha9R2Y74ma3Pp4Z0DF6PM+SJ2sjq2DBXg@mail.gmail.com>
 <CAKMK7uGtTT+59hRi3PB1WHPES3YJAPYBvbT74vo9PApNE0i7MQ@mail.gmail.com>
 <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
 <CAPj87rN-1ST_wvnobEaeNNiOYdM9yAOvfZ+8_tcxbrFof3L-yA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <beb96836-2c9a-d37f-23e8-e093b3533d2f@gmail.com>
Date: Tue, 18 May 2021 15:51:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAPj87rN-1ST_wvnobEaeNNiOYdM9yAOvfZ+8_tcxbrFof3L-yA@mail.gmail.com>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.05.21 um 15:26 schrieb Daniel Stone:
> On Tue, 18 May 2021 at 13:49, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 18.05.21 um 07:59 schrieb Daniel Vetter:
>>> First step in fixing that is (and frankly was since years) to fix the
>>> amdgpu CS so winsys can pass along a bunch of flags about which CS
>>> should actually set the exclusive fence, so that you stop oversyncing
>>> so badly. Ofc old userspace needs to keep oversyncing forever, no way
>>> to fix that.
>> Exactly that is what we don't want to do because the winsys has no idea
>> when to sync and when not to sync.
> Hey, we're typing that out as fast as we can ... it's just that you
> keep reinventing sync primitives faster than we can ship support for
> them :P

You can stop typing. We will even need that for backward compatibility.

But yeah, not reinventing sync_file support with drm_syncobj would have 
helped :)

Cheers,
Christian.

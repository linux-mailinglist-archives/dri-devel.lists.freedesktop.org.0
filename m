Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5274052E5ED
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CE111ADE5;
	Fri, 20 May 2022 07:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AB811ADE5;
 Fri, 20 May 2022 07:11:03 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id h11so8487207eda.8;
 Fri, 20 May 2022 00:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eMF7NaKmW4LY421ecjdqkn4kSomZiZJIaVl/wfFw6nA=;
 b=hKqEfKUYA9cnrE7VTxcM0VtWck7hSVEP9rLI/7AKi/lfRaT1aW47JsG9+EpV7ecE8z
 Ly2UBP/I9IL7MVjipbKZZVczB65CialMFCiC2tScUmB2lOSzUaKKyp05VRed/RpJaO6m
 5YjUsYUr4WIIWMjlUszxZSWZjzlqD010P8gXbzWSrkcVKW2S6IRxbf0iUTlHX+t6cAkC
 Ed26Jx0eIoozWAbh9Ep4BfAS5ukizRF1gmlP0xp1jsLHelenJ8RDIHpwTtlQ0hCoXIMo
 JxFhu1xH+IBbHsbKxTJX0mNBfyshIS3ZOvWme0XK6q8RL17PIqxYPqKzI1vCvmfun7IA
 b5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eMF7NaKmW4LY421ecjdqkn4kSomZiZJIaVl/wfFw6nA=;
 b=4gT5pj/Pw4rqCikQJ6jOyFH5uXsPXUxrcxQCRIiwfZNx86TpiAkxEq3mfljm5Jv6SP
 FQZ3xBhJ6EcPh/+vqoJC9Tg+Bz14Xd0suHPOHyKsQq1LffnOcUVwpjxuo4fq4Ebho5BP
 pWnUMngI107flwmcAYsq/Io1yNCC1iCmzluABrTfNVM773A7NKKj4avJPEm5x4JnFTHN
 3DWNjkA0IFlePAgloVpwODy9hiwEZXmXffQEQKb55z+uQnnljpDjsLWhVoUMA6U3CAD/
 oIDa+rSYV5a7rzcvdQ5ZK4ZL8V8oASSoFCtXYdBWZobAEmoWccS8rtPDjh4YuuDDVx7L
 7ePQ==
X-Gm-Message-State: AOAM533UAgySpeuRy3eppib/fe01KT98q9GJ2X+ZWk8Nzj6FbOkKEA7A
 zDikt86ZOgzkOBRtSNMpVoE=
X-Google-Smtp-Source: ABdhPJzDQzaST1rh8D9ishD0T+BogYvA/4wXLPvCW5f8SCNq6+3AR8oCxUDhZ77jbdwsKU7St+i/Fw==
X-Received: by 2002:aa7:c48b:0:b0:42a:ba59:41d6 with SMTP id
 m11-20020aa7c48b000000b0042aba5941d6mr9017876edq.179.1653030662046; 
 Fri, 20 May 2022 00:11:02 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:66f:9303:6022:1507?
 ([2a02:908:1256:79a0:66f:9303:6022:1507])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a170907900500b006f3ef214dccsm2781842ejc.50.2022.05.20.00.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 00:11:01 -0700 (PDT)
Message-ID: <6547a9c7-6cd2-d3df-e9ca-d6ed74a27c8b@gmail.com>
Date: Fri, 20 May 2022 09:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re:
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20220519095508.115203-1-christian.koenig@amd.com>
 <CAM0jSHOP=vyuiWOaWqo5k3G+KbAEB2HhCZKgA1VScqZknZPEyg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAM0jSHOP=vyuiWOaWqo5k3G+KbAEB2HhCZKgA1VScqZknZPEyg@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.05.22 um 12:50 schrieb Matthew Auld:
> On Thu, 19 May 2022 at 10:55, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Just sending that out once more to intel-gfx to let the CI systems take
>> a look.
> If all went well it should normally appear at [1][2], if CI was able
> to pick up the series.
>
> Since it's not currently there, I assume it's temporarily stuck in the
> moderation queue, assuming you are not subscribed to intel-gfx ml?

Ah! Well I am subscribed, just not with the e-Mail address I use to send 
out those patches.

Going to fix that ASAP!

Thanks,
Christian.

>   If
> so, perhaps consider subscribing at [3] and then disable receiving any
> mail from the ml, so you get full use of CI without getting spammed.
>
> [1] https://intel-gfx-ci.01.org/queue/index.html
> [2] https://patchwork.freedesktop.org/project/intel-gfx/series/
> [3] https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
>> No functional change compared to the last version.
>>
>> Christian.
>>
>>


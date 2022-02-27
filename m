Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 907D64C6B11
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 12:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7889410E516;
	Mon, 28 Feb 2022 11:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E6B10E1F1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 23:57:56 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id 195so13079711iou.0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 15:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TYixXH/oSVNIYPjWy8IDeErfQMBt7NeciGEbuByoJUQ=;
 b=VA7Y7/hwNTpAG0EJBvjzNcqWEEoLvSuaQCNj01nO45OyMQcgooOoCeTcGzsvRipjXT
 GR51Exj8tHYQvvBj7rj4BWHnSURg64uycJzHdUCB+hGxEtEhlwx2pPdKlhw0XhHwjAE/
 I4bLKsSa7ST5UvIHRTX2rxKh1qtw9ZBdmZ77wJDCw6OPEltA1/Pz2/7JbQRL0duYZ4ct
 a7VUK+N8cmAKsjrWIe0Rajg2EbIFsIgRyubHIXT65zHok28ikdqymV+/J+ecIosK77WB
 vpTaCXz61HY+ci7o/cRo3ZW5ylwVRVT+7wiyD0oTOFySlCVCR7thfpDnSjzQN84bD+HM
 seNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TYixXH/oSVNIYPjWy8IDeErfQMBt7NeciGEbuByoJUQ=;
 b=xWfertjTTTOii24+6+xQck16kstt2QDyI/RUof4A90l/FohLzuNRs7ZilMlBEbVYj8
 qx4JKzgJmRrQBiusDkRp3bqCvmXGOixVEowFVs0+PXhCBbUgvi27XrdmZscPmZ+vjHso
 9eQVHT221F1ClM+HlFI4qhrkUHhMrWmh0Is8nHjbOZq9F46YbJKW3zff01q0kNtCUh2B
 +gWy4FO2iLT/KtuS94zDiEoci5fLO43obYM/OrEX76cJJzUV3DYgMBszDy6alV42bH6h
 94AJmPxpn4E5kJxB1myNtrHN3zupBuJRepIsvzmef0UduoyBgMwTinB0NDQypQZyiNaD
 PZFQ==
X-Gm-Message-State: AOAM532pML6XU1pJpj8y/WO7BrmZHxenTH4Z3QiQUMJMs6whtgPSPQOX
 eCnNVpqZZ/Y9ddqcw4vr0yyxeA==
X-Google-Smtp-Source: ABdhPJyPtYXXq4eTx/zm7hkEn1uc7x7ywQuCdrH5tLSdhR5RU9smY5dt5X0iXebRMULNf0pZ7UBpzA==
X-Received: by 2002:a02:c64e:0:b0:311:b1b4:1a08 with SMTP id
 k14-20020a02c64e000000b00311b1b41a08mr14572997jan.230.1646006275352; 
 Sun, 27 Feb 2022 15:57:55 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58]) by smtp.googlemail.com with ESMTPSA id
 n7-20020a056602340700b006409737fa99sm5093280ioz.27.2022.02.27.15.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 15:57:54 -0800 (PST)
Message-ID: <72ff1b04-4f37-9851-a6e6-aded72b46c83@linaro.org>
Date: Sun, 27 Feb 2022 17:57:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [greybus-dev] [PATCH] Kbuild: remove -std=gnu89 from compiler
 arguments
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20220227215408.3180023-1-arnd@kernel.org>
 <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
 <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 28 Feb 2022 11:45:00 +0000
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-staging@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org,
 Alex Shi <alexs@kernel.org>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Hu Haowen <src.res@email.cn>, linux-btrfs <linux-btrfs@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-doc-tw-discuss@lists.sourceforge.net,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/27/22 5:11 PM, Linus Torvalds wrote:
> On Sun, Feb 27, 2022 at 3:04 PM Alex Elder <elder@linaro.org> wrote:
>>
>> Glancing at the Greybus code, I don't believe there's any
>> reason it needs to shift a negative value.  Such warnings
>> could be fixed by making certain variables unsigned, for
>> example.
> 
> As mentioned in the original thread, making things unsigned actually
> is likely to introduce bugs and make things worse.

Understood.  What I meant is that the shifts were producing
single-bit masks from plain int values that range from 0 to 10
or something (in a for loop).  Looking again though, that it's
not so simple.  Regardless, your point about the warning is
good and I won't plan to "fix" this.

Thanks.

					-Alex
> 
> The warning is simply bogus, and the fact that it was enabled by
> -Wextra in gcc for std=gnu99 and up was a mistake that looks likely to
> be fixed in gcc.
> 
> So don't try to "fix" the code to make any possible warnings go away.
> You may just make things worse.
> 
> (That is often true in general for the more esoteric warnings, but in
> this case it's just painfully more obvious).
> 
>                Linus


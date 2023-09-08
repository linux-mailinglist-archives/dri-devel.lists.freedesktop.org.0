Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F17867982EC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 08:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506EE10E877;
	Fri,  8 Sep 2023 06:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC00E10E875;
 Fri,  8 Sep 2023 06:59:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31f6ddb3047so1498652f8f.1; 
 Thu, 07 Sep 2023 23:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694156378; x=1694761178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mjDLcllXuQB9fMiD1YO8Am5UOuvL3MHNOtNmYPG4ZJ8=;
 b=nsYnMRug3i8J3u46XuraHTE5RS6fxbzISw+qtYyeGoKZ8pCtLAFwFi13d0f6QxcA6O
 c2u4HdogjXTPg1C3pjr70gjsVD3e+XRnwO2+tAR9fMoFE/3AHsmZHfUgXdAHp5P1ppg2
 hJL/OWngUKEKu5M/BAzz8FPr3aDztDDdPxbOW420q/7rA2gNGm7t5s3hxA2SQb69mVyC
 W/0gvO7rD3h41ux1Nz/nCeHaCLuyL2dXGihXHyTbfQSQ64i/yeNiC27+Ef92bxBLPlGg
 dCm/GyfBeebbzgpzs4FcbVC51qtBQn4eYVqXprpOc4mpany1EEubdwvFkTSMIBderWOV
 Q58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694156378; x=1694761178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mjDLcllXuQB9fMiD1YO8Am5UOuvL3MHNOtNmYPG4ZJ8=;
 b=CbB0nvM8UJSgubvBskqs+RBZLB9y2K/NfWzLhZxT8fw6xDeC9iTRbfvIh20xXum/KL
 mup3LwgGjinT/SjM/71mEHSnzyaQIOGNwb3SGk/jHIavrt2VeyxZM/5s8F/A455MzLNF
 GmG3T7MV5m1/ezN94wWTbVVP5KhbucrfBlXnQINGSdIdkQLqkbXq9mmrHV5J+PDllXsM
 RzlxSG+gONQUBrD8+YUwBTdjQuFAKaHqDAPjySeLNDL10Vd4x6tcavvHXfIBVsKDSyv0
 g+ic8YnpJHQKSiZ1SyRxt/h/HoMyEBPP+zvZo1EvaBSQxEHM0szSeJt70ShwHGSYb/lO
 RPJQ==
X-Gm-Message-State: AOJu0YynUY0fCWKgpJRNtey42E5w3mcpBy3qGoMYujj190wnqVoYWyiy
 syi4KwC/mWDDqAqO4Fb2yD4=
X-Google-Smtp-Source: AGHT+IGM1JfDgyy/2dl6TEtwz/XvcIH37J3N2Fej+DS87LarA2/uYFOpOKc2ATIxC/1AxjCVyF/5iw==
X-Received: by 2002:a05:6000:1081:b0:30e:3caa:971b with SMTP id
 y1-20020a056000108100b0030e3caa971bmr1187063wrw.51.1694156378079; 
 Thu, 07 Sep 2023 23:59:38 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4150000000b00317a29af4b2sm1250339wrq.68.2023.09.07.23.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 23:59:37 -0700 (PDT)
Message-ID: <c9f33bc8-85be-5234-5bc8-7f50abc2dadd@gmail.com>
Date: Fri, 8 Sep 2023 08:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas
 <bhelgaas@google.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <2adfa653-ac35-d560-be52-c92848a1eef5@gmail.com>
 <b51d49f3-e3de-6b8d-9cb4-df5c03f3cdc0@loongson.cn>
 <10509692-ce04-e225-5a27-abc955554bdc@gmail.com>
 <a9af88c5-4509-96ff-a7fd-a0f72d2f1e6a@linux.dev>
 <127fab21-bc5c-f782-e42b-1092fbb8df34@amd.com>
 <39736dad-41e3-8b24-ccef-ac3425a6c9f4@loongson.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <39736dad-41e3-8b24-ccef-ac3425a6c9f4@loongson.cn>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.09.23 um 18:33 schrieb suijingfeng:
> Hi,
>
>
> On 2023/9/7 17:08, Christian König wrote:
>
>
>> I strongly suggest that you just completely drop this here 
>
>
> Drop this is OK, no problem. Then I will go to develop something else.
> This version is not intended to merge originally, as it's a RFC.
> Also, the core mechanism already finished, it is the first patch in 
> this series.
> Things left are just policy (how to specify one and parse the kernel 
> CMD line) and nothing interesting left.
> It is actually to fulfill my promise at V3 which is to give some 
> examples as usage cases.
>
>
>> and go into the AST driver and try to fix it. 
>
> Well, someone tell me that this is well defined behavior yesterday,
> which imply that it is not a bug. I'm not going to fix a non-bug.

Sorry for that, I wasn't realizing what you are actually trying to do.

> But if thomas ask me to fix it, then I probably have to try to fix.
> But I suggest if things not broken, don't fix it. Otherwise this may
> incur more big trouble. For server's single display use case, it is
> good enough.

Yeah, exactly that's the reason why you shouldn't mess with this.

In theory you could try to re-program the necessary north bridge blocks 
to make integrated graphics work even if you installed a dedicated VGA 
adapter, but you will most likely be missing something.

The only real fix is to tell the BIOS that you want to use the 
integrated VGA device even if a dedicated one is detected.

If you want to learn more about the background AMD has a bunch of 
documentation around this on their website: 
https://www.amd.com/en/search/documentation/hub.html

The most interesting document for you is probably the BIOS programming 
manual, but don't ask me what exactly the title of that one. @Alex do 
you remember what that was called?

IIRC Intel had similar documentations public, but I don't know where to 
find those of hand.

Regards,
Christian.

>
>
> Thanks.
>


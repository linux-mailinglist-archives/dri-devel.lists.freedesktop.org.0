Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FA846761F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 12:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96A773AC9;
	Fri,  3 Dec 2021 11:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4801873ACF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638530429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCEoUW7+u756imTky0jSFPok8S0L4DifBezJf8rr5n4=;
 b=PuS6xFLxV1vCf/2kAn99xhjNTYMHbJO95+YgxuqiWzRXiP3/g3t9TNP/O9pBORi5NbGdNf
 i786d9QN9f7IRte6OldhBEumTNRfVHymOI72iykO8de2uX13jAlNzx7DJQou+OxIF0lv6r
 DrMuasb/H1Pq1Y9D3QAECJWgxZOStF0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-c6qKNfOXOcyjPiIx_LIMJg-1; Fri, 03 Dec 2021 06:20:28 -0500
X-MC-Unique: c6qKNfOXOcyjPiIx_LIMJg-1
Received: by mail-wm1-f70.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so1395231wmb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 03:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TCEoUW7+u756imTky0jSFPok8S0L4DifBezJf8rr5n4=;
 b=YO9XJdfSuqO9mv+EdTKoWLzofRkpoDy1bdWfa1kSKG99xyULH4TZ9QoWOp/+M8iRJ6
 7tGSpzVTYnehEvhkpqT8sHiq3oU/rtUygefOClS3uTp0h9UJXH/uH3Ej57TMlUP0auP1
 /ASzZc7DNgQoJVu47/2+CFzc8uOKonrDxOo0TI6R2t7mL+gz0TA7LW4JWa+3jqYauV6U
 7trP8TxeAGxvWCBONdq2ypUu65Ivj6htGL/lT1BDXgL/7K8hoct5SFvlrRJWKwDgqMFs
 mMNAvuGsC55LQPB+CmrIGY7obMfiQUC05s+v0CsgYETr4zCRq9pxN44HEa1IMzdleKXs
 xkYw==
X-Gm-Message-State: AOAM530PEHAxrRR0tb97oh5V/Hl1DWg+3IFZQio0B6vykGldtpvBur5a
 ma4zpXj5gQryLAd2o0/1TEO+vIVrmmzqLaHpZm6oZrYu/oDTCHtRi728ooWl2Lay8b95vsVeZ+T
 QBUATWVjLA/dlXO4vPDri2/nMBMtO
X-Received: by 2002:adf:edc6:: with SMTP id v6mr21051558wro.461.1638530427174; 
 Fri, 03 Dec 2021 03:20:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJM87rlYiWw2QEKek+Z+Eku0ybwl3FqjSXdx/b5RzJmEzD14yUo8rrlrytrDw1uCbfb3NIDA==
X-Received: by 2002:adf:edc6:: with SMTP id v6mr21051531wro.461.1638530426960; 
 Fri, 03 Dec 2021 03:20:26 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o12sm2667241wmq.12.2021.12.03.03.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 03:20:26 -0800 (PST)
Message-ID: <5de368f7-91cd-5998-9fe4-1bf448e32742@redhat.com>
Date: Fri, 3 Dec 2021 12:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: 5.15 regression: CONFIG_SYSFB_SIMPLEFB breaks console scrolling
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Harald Dunkel <harri@afaics.de>
References: <e50d5ad5-19fd-07ae-41e4-5a2d26a98bcf@afaics.de>
 <4bf94684-6410-db9f-5bec-ea0540a2ea76@leemhuis.info>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <4bf94684-6410-db9f-5bec-ea0540a2ea76@leemhuis.info>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for the late reply.

On 11/21/21 12:47, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> On 16.11.21 05:52, Harald Dunkel wrote:
>>
>> if I enable CONFIG_SYSFB_SIMPLEFB in 5.15.2 and use grub's default
>> configuration
>> (Debian sid amd64), then a few lines at the bottom of /dev/tty1 including
>> login prompt are off-screen. Scrolling is broken. I can login, though.
>>
>> Enabling GRUB_TERMINAL=console in grub doesn't make a difference. Using
>> the same kernel except for CONFIG_SYSFB_SIMPLEFB the problem is gone.
>>
>> Graphics card is a GeForce GTX 1650. I tried with both CONFIG_DRM_NOUVEAU
>> and proprietary graphics drivers disabled.
>>
>> Attached you can find the config file. Please mail if I can help to track
>> this problem down.
> 
> Thx for the report. I'm not totally sure if this is a regression, as
> that's a new config option. But it might be one considered a successor
> to an older one, hence it might count as regression. Adding two
> developers and a mailing list to the CC, hopefully someone can clarify.
>

I don't think this is a regression since enabling CONFIG_SYSFB_SIMPLEFB will
make the simpledrm driver to be bound while disabling the option makes the
efifb driver to be bound instead.
 Yes, it seems to be a bug in the simpledrm driver but the solution if you
have issues with the simpledrm is to not enable CONFIG_SYSFB_SIMPLEFB and
keep using the old fbdev driver.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat


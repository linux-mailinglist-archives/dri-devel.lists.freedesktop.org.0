Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1F58BE604
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 16:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723BB10FC2E;
	Tue,  7 May 2024 14:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N0FwX0UN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D334810F60F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715092469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dxfYA0kT/oiCPR8P3ZGYKwq4gr+a/9ebQZcuGC0TkRM=;
 b=N0FwX0UNBddtLRQXq7EVkJxr9h4ws6d8hseW43nJAbnJynVWpl0yMwwudKNYlWMfe6Ddn4
 jT5jsGTYq/2RLBOYT9dHK6SBU7JsLuSpxEYfMPlDQWmVLC18MgzzwIfrwHhbL18W5r9euI
 gT1VJn23/WZK7qHWD/ZUlXvMpWGysmc=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-EQjC9sOaNCK5T3zHZ8bJMw-1; Tue, 07 May 2024 10:34:27 -0400
X-MC-Unique: EQjC9sOaNCK5T3zHZ8bJMw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-51fd3568b04so2620786e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 07:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715092466; x=1715697266;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dxfYA0kT/oiCPR8P3ZGYKwq4gr+a/9ebQZcuGC0TkRM=;
 b=q+Nfg1h79xha80hbA0Rx4Nryh8REIQzLW2NR5GzzF/pmie1KJwzN36FerdZeLXkQ8V
 ceV3ThYxIO1Xnzp5hVf2dkhDlN1fkSs0awnR8InfRSMGul0o22mUgBdoJPg/5+Qvh2cP
 FW6KMxjnK3dk1cYWAXOrUkOktu4Mj2q3fP/ICvEf3WRFK/keAssGmnbPkp0VHiBGUN38
 rGxKP2T3Pr0la8+tlWlCHhmHdHp0nN3oPocNSaFD026hRijU/PJ3HF5YnkE7mFhNYMmj
 dL6e+On0E+fx6wRZQ6uCv/GAb56sKh9RStdovm0P+gEdyWywhwIUFv33Zp0V0C6tOtvX
 pIuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKYh4EZPTgZQ5Zdq8vC9wJjrN0Lh7nHAHSLpsbHfxqxWVDi815Vr20GQiXUC0t1qzpRsJat426sakWCGaj7dG4KneAS4awIOa9sYAKBYIm
X-Gm-Message-State: AOJu0YxySrFeI/+XlAAW9sjxeqSprla37DRoE0v8rVcpk26GbEDOl9aq
 FtDjXba4jQ5BOQknB9d35mjpUJ7ooYkmAl+eA3FYAjjHXXkO0gv8xkBHRkcfg8+WtHdIpk27w2v
 uvSfhQEpHEfgEvhXIIHxOYK0nhFYrEhw+KLyEkUhY+3JDoRdnRoZcnhVEjfkFvpY65A==
X-Received: by 2002:ac2:4214:0:b0:519:1e33:9d85 with SMTP id
 y20-20020ac24214000000b005191e339d85mr8206482lfh.36.1715092465997; 
 Tue, 07 May 2024 07:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJf6M7/XK+2/GfqsOz3VPdKfvdQSS9fpgAz3ojdSlixZ5gK65wQW/LGj1l0TFGD5KOfhLbVw==
X-Received: by 2002:ac2:4214:0:b0:519:1e33:9d85 with SMTP id
 y20-20020ac24214000000b005191e339d85mr8206456lfh.36.1715092465580; 
 Tue, 07 May 2024 07:34:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b?
 (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a1709062b5300b00a59a05a8030sm4709239ejg.25.2024.05.07.07.34.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 07:34:25 -0700 (PDT)
Message-ID: <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
Date: Tue, 7 May 2024 16:34:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>, Maxime Ripard <mripard@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 5/7/24 3:32 PM, Dmitry Baryshkov wrote:
> On Mon, May 06, 2024 at 01:49:17PM +0200, Hans de Goede wrote:
>> Hi dma-buf maintainers, et.al.,
>>
>> Various people have been working on making complex/MIPI cameras work OOTB
>> with mainline Linux kernels and an opensource userspace stack.
>>
>> The generic solution adds a software ISP (for Debayering and 3A) to
>> libcamera. Libcamera's API guarantees that buffers handed to applications
>> using it are dma-bufs so that these can be passed to e.g. a video encoder.
>>
>> In order to meet this API guarantee the libcamera software ISP allocates
>> dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
>> the Fedora COPR repo for the PoC of this:
>> https://hansdegoede.dreamwidth.org/28153.html
> 
> Is there any reason for allocating DMA buffers for libcamera through
> /dev/dma_heap/ rather than allocating them via corresponding media
> device and then giving them away to DRM / VPU / etc?
> 
> At least this should solve the permission usecase: if the app can open
> camera device, it can allocate a buffer.

This is with a software ISP, the input buffers with raw bayer data
come from a v4l2 device, but the output buffers with the processed
data are purely userspace managed in this case.

Regards,

Hans


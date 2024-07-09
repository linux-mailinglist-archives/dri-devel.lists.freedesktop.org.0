Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345C692B8F7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 14:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6646010E517;
	Tue,  9 Jul 2024 12:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CHmeeePA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F013E10E517
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720526564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dy4YRqqLNlf0j0FOWn3tiz8LkZrh0YUIypGbDuzRZ3A=;
 b=CHmeeePA8HfjQ3i6p4S+teXMD1LcDi49vO9EZicWc0NZQpdVBxzdjXGh8sbAAP/NdASxHx
 uBBhCJX20fiuG4mhpgS2vp9qTJPJlNF6pPVV6/9tBLzQBk6HO7aobO0C8dQyF7fENRMBOj
 W0w2sYhstMdS0Ao1+spg/bmA3+u+njQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-4nSzAv4RNkm8Ashm4Ep7qw-1; Tue, 09 Jul 2024 08:02:42 -0400
X-MC-Unique: 4nSzAv4RNkm8Ashm4Ep7qw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42726545762so1832235e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 05:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720526561; x=1721131361;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dy4YRqqLNlf0j0FOWn3tiz8LkZrh0YUIypGbDuzRZ3A=;
 b=owVH6ZgopBgD1VrxcBylziH8Mvpkfo3vCpePiGAQDW723P/PyBZLxEjizeEIFxcjDD
 o6B1tQ+VquHb8N9nLbzU4cVCh+5Yr2Zd6BYd5/us+EUJMAf2IKhvoaWlO4NovWN6dlCA
 HGzWJNxZzUrZCsK1mMW/0j1b/8QA7BT8druAZebrEppiqmfzEofWDD7NeYlCwSvs6D8B
 3Q2T/u+nE3J+E84g8TlY9lChosKLJA6qSiZ0eg9bv6/YzLKGQDx9aWMUMVJNxhyTX6S+
 PqLqoxUJERhzqIjtnaoZqgD5LBQXNp5k8lFbtf4A9+6QB3Vq75NxxHqDXTU2gNdQuent
 +UNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiBdUYuXpGCr5ohwsEjVChI54un+AlvkS/9zNtfcyavIHl748jzSmyTcaa3o20z/KcOTaEuK07M2bNH2TykwARbQSMcLz2jBVNV+aLYOYq
X-Gm-Message-State: AOJu0YzgoNO8W/iPGrPMH+HqKv1MYqS0HgR2WFd+LOuuxhCv6UlScsuQ
 k2rg2XxcwMFoqyXUUanEh8gmJT8/wHw+bmV8OR9OK+WeF5BOLuDsvAyPtM59eimp6v8Tn7h8IeZ
 zHq/aFjkoT0pf6nGqIKDm5PpjiRQcpekCKoHNCH1i32djaA7Rliz5L8nmkTOofrk7yA==
X-Received: by 2002:a05:600c:3226:b0:426:59ec:17a9 with SMTP id
 5b1f17b1804b1-426707d7c9fmr16596895e9.22.1720526561306; 
 Tue, 09 Jul 2024 05:02:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSrbJt0jJlRogPAw/bQ1qZ0Lbp/49hLv8AiWFs4Pgl2/5UBg3dAYp6ZylEW9+XrxlA+vNo9w==
X-Received: by 2002:a05:600c:3226:b0:426:59ec:17a9 with SMTP id
 5b1f17b1804b1-426707d7c9fmr16596635e9.22.1720526560952; 
 Tue, 09 Jul 2024 05:02:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7deeasm2422525f8f.8.2024.07.09.05.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 05:02:40 -0700 (PDT)
Message-ID: <48cb6b5e-3685-4661-9183-080e25348892@redhat.com>
Date: Tue, 9 Jul 2024 14:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/panic: Add a qr_code panic screen
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240709084458.158659-1-jfalempe@redhat.com>
 <20240709084458.158659-5-jfalempe@redhat.com>
 <2024070951-tall-effective-c916@gregkh>
 <2024070947-exorcism-purchase-2f28@gregkh>
 <acd5c505-f058-46e7-9d92-620dea41d707@redhat.com>
 <2024070944-follow-crazy-ff95@gregkh>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <2024070944-follow-crazy-ff95@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/07/2024 12:12, Greg KH wrote:
> On Tue, Jul 09, 2024 at 12:04:02PM +0200, Jocelyn Falempe wrote:
>>
>>
>> On 09/07/2024 11:12, Greg KH wrote:
>>> On Tue, Jul 09, 2024 at 11:11:35AM +0200, Greg KH wrote:
>>>> On Tue, Jul 09, 2024 at 10:40:10AM +0200, Jocelyn Falempe wrote:
>>>>> +config DRM_PANIC_SCREEN_QR_CODE_URL
>>>>> +	string "Base url of the QR code in the panic screen"
>>>>> +	depends on DRM_PANIC_SCREEN_QR_CODE
>>>>> +	help
>>>>> +	  This option sets the base url to report the kernel panic. If it's set
>>>>> +	  the qr code will contain the url and the kmsg compressed with zlib as
>>>>> +	  url parameter. If it's empty, the qr code will contain the kmsg as
>>>>> +	  uncompressed text only.
>>>>
>>>> meta-comment, should we by default do this on a kernel.org domain so
>>>> that no specific distro has to worry about hosing this type of web
>>>> service?
>>>
>>> Also, do you have the backend source for this to show how anyone can
>>> host it themselves as well?  We can't add features to the kernel that no
>>> one but closed-source implementations will use for obvious reasons.
>>
>> I've made a proof of concept backend here:
>> https://github.com/kdj0c/panic_report/
>>
>> And the javascript to decode the kmsg trace is here (under MIT licence):
>> https://github.com/kdj0c/panic_report/blob/main/docs/panic_report.js
> 
> SPDX lines are your friend, you might want to look into that for this
> stuff :)

Sure, I've added the SPDX header for this file.
> 
>> It uses the pako js library to uncompress the zlib data, which is also under
>> MIT/Zlib licence https://github.com/nodeca/pako/
> 
> Great, can you put that in the Kconfig help area for this option in your
> next version?

Yes, I will add a link to the panic_report github project.
> 
>> If kernel.org want to host a default service for that, that would be great.
>> It can be linked with https://bugzilla.kernel.org to easily create a bug, or
>> look for similar bugs.
> 
> Someone should at least propose it if this is going to be an option that
> the kernel supports.

I hope someone will volunteer to do that, as I'm not really into web 
development. Also it's a bit early, drm panic is quite new, and needs 
more driver support to be really useful.
> thanks,
> 
> greg k-h
> 


-- 

Jocelyn


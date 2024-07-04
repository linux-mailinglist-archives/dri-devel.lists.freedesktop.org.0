Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0629271C7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7F010EA21;
	Thu,  4 Jul 2024 08:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U6eUOSaj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8BB10EA21
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720081940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fly4Axb2kq7yYa3s1bvRYz7zwAvd+XD9LSO+uMJgGd0=;
 b=U6eUOSajJzg4VeVpVei7huqZj1+9SW4trSsJ3yTAUwfgW1Gdwt3VdYzLxsRcvwvIFTLmpY
 KbxNzQwWGE3+C6vrLjtFl7aY/Wu0QD4JTqWJHczXOfjDQjsIXSOawE/FjZE6p3iUt4439C
 gkjkV2uvif/iH/rctSvdGNONmU9pQtE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-A7Aue1CoM2Ky6jVfNJ0sJQ-1; Thu, 04 Jul 2024 04:32:18 -0400
X-MC-Unique: A7Aue1CoM2Ky6jVfNJ0sJQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42566e8a995so2931485e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 01:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720081937; x=1720686737;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fly4Axb2kq7yYa3s1bvRYz7zwAvd+XD9LSO+uMJgGd0=;
 b=OL2daFnuqnP5uLgTqpV+hH702l8WlYqmSND8FQd1ssLxBGXhnCZuVhLAcPmKHX1Zgl
 KkKmuibeVmSjPDE3jeTVaKGMBL0I6VtAuiTRUgDmN1rN477EYBMrffXQTN09swxo73O9
 kKdhu/wCpSWsiBGu3GyonReYerZxyC96mY7osqfhdhCSu9eVpLMzRSB3as2ZRYXzXQId
 c7s1yFQRdZSgqbZC0U/cGxpbn9tKdXLvgi6r8Ty4rWt4k48Ev2pHPOxJVV6kSVXqT1yY
 s1U3C/xbEV+JFuTHw5LPf/w50GQEt5APO0gWJirxtROwWRTue1SDulkOJUAYCyFYDaeQ
 eJxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7qMul0L85uXpGXTFUnPeWvqT6vbnIK9jlIl/kIl6MlI88/Y+fS9jpqZ5yiIIn21EFPWR5l4mtbF8xhBDGA1abjqv4abOp3i66sQgcYlTO
X-Gm-Message-State: AOJu0YxNlCsbtbPzTfFSWqaBng3kK2AUey07El+oWJZ+weL0jslUpvnf
 THRWCkK4hgz2tx1YLRaJhCX63AQQORphkJzf91sSJ1bG/Fm97WQLU3Ab4GdA1+KTSKNYBPfcbmB
 5VPzm7QWo0S/gPt5H/8GIxOd688+yvDd7UmCGfeBLuvq3Sg9ITc+5zo0ZG5CcER2rMg==
X-Received: by 2002:a7b:cd95:0:b0:425:6dce:8c54 with SMTP id
 5b1f17b1804b1-4264a48c4e0mr6049555e9.33.1720081937440; 
 Thu, 04 Jul 2024 01:32:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnqR2vNBhJCq7+miK0hh0vE1WCYEKEi71Jb9hxbqW7v9GH8NeQk1sqkfUNsHXzGDgQk6MD+g==
X-Received: by 2002:a7b:cd95:0:b0:425:6dce:8c54 with SMTP id
 5b1f17b1804b1-4264a48c4e0mr6049255e9.33.1720081937006; 
 Thu, 04 Jul 2024 01:32:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d16e7sm14493795e9.6.2024.07.04.01.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 01:32:16 -0700 (PDT)
Message-ID: <c1f6472a-fbf6-43db-9b44-f5fb887f3a1e@redhat.com>
Date: Thu, 4 Jul 2024 10:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/panic: Add a qr_code panic screen
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
References: <20240703154309.426867-1-jfalempe@redhat.com>
 <2024070417-husked-edgy-f527@gregkh>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <2024070417-husked-edgy-f527@gregkh>
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



On 04/07/2024 07:03, Greg KH wrote:
> On Wed, Jul 03, 2024 at 05:33:57PM +0200, Jocelyn Falempe wrote:
>> This series adds a new panic screen, with the kmsg data embedded in a QR-code.
>>
>> The main advantage of QR-code, is that you can copy/paste the debug data to a bug report.
>>
>> The QR-code encoder is written in rust, and is very specific to drm_panic.
>> The reason is that it is called in a panic handler, and thus can't allocate memory, or use locking.
>> The rust code uses a few rust core API, and provides only two C entry points.
>> There is no particular reason to do it in rust, I just wanted to learn rust, and see if it can work in the kernel.
>>
>> If you want to see what it looks like, I've put a few screenshots here:
>> https://github.com/kdj0c/panic_report/issues/1
> 
> Cool, this idea has been floating around for decades, here's the last
> attempt at this back in 2014:
> 	https://lore.kernel.org/all/1395093587-2583-1-git-send-email-teobaluta@gmail.com/
> 
Yes, I've looked at this, but drawing a QR-code in the middle of fbcon 
was a bit complex. Now with drm panic, there is a proper infrastructure 
to display the QR code, and make sure it won't be overwritten.

>>
>> -- 
>>
>> Jocelyn
>>
>>
>> Jocelyn Falempe (4):
>>    drm/panic: Add integer scaling to blit()
>>    drm/rect: add drm_rect_overlap()
>>    drm/panic: simplify logo handling
>>    drm/panic: Add a qr_code panic screen
>>
>>   drivers/gpu/drm/Kconfig         |  29 +
>>   drivers/gpu/drm/Makefile        |   1 +
>>   drivers/gpu/drm/drm_drv.c       |   3 +
>>   drivers/gpu/drm/drm_panic.c     | 338 +++++++++--
>>   drivers/gpu/drm/drm_panic_qr.rs | 989 ++++++++++++++++++++++++++++++++
> 
> Wait, we can put .rs files in any directory now?  I didn't think that
> worked properly yet.

Yes, thanks to the work of the rust-for-linux team. When I started to 
work on this, I needed a few workarounds to make my rust code compile. 
But since 6.10-rc1, I was able to drop them all. Also for this simple 
case, I don't use bindgen, because there are only 2 Rust functions, that 
I need to call from C.

> 
> thanks,
> 
> greg k-h
> 

-- 

Jocelyn


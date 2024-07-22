Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66873938B87
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D645610E455;
	Mon, 22 Jul 2024 08:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UBF3Dwu2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F4A10E455
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721638389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RxI9qiM4lzIxZVwtwjzIK8T0OrMcooauWHayA/UpE+g=;
 b=UBF3Dwu29X4JUVlyb/v8qkk3r1ENtRrZzMYSV4Fujg8traP/gdeP2ygAlVzffNHhji6ANe
 PsQAzoz5fK1pev3RMWEjJlrEpEea9YdRtSlmScClP924usfP5VCgJeniliOnK6z37afn2U
 h7b7Rb5eaWmFIGCPddRBilz93NvhmZw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-hbDR-QqdNd2oUgdliyPivg-1; Mon, 22 Jul 2024 04:53:04 -0400
X-MC-Unique: hbDR-QqdNd2oUgdliyPivg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42725d3ae3eso30432785e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 01:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721638384; x=1722243184;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RxI9qiM4lzIxZVwtwjzIK8T0OrMcooauWHayA/UpE+g=;
 b=txwu/Gpll4bOIyZtgtGcPlgl8tzwwXmUG70HcqKtUEGusHR3imgffnn3gbbRcXvTO7
 2TvWzJGrN6ubkx7pfoWcKCk9/6pClOf2h2+xkimOdl00QmX/137OR56JpBg/bpakpGe/
 8UXXpHUfwdfLm4G5Xj8DxSDadcsBnyKKCOXvh8TvgiyBgu8Hp5p+9MNjqwBupGQhtan3
 V0uR8GH9jZOBM5Lfh5dMI96kvDsWlBITjwIO5PdJl+L6PzOleX8MbJB0uVzRx7mUDW0X
 6KrnRfOeReldUWB2AhlS0sNe1M38WHLR637tkfiaN+xLxUGb6KMv0ZVM0nhjQJeHvO3h
 uY7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6COYp3ezxXMSffMycwnrQkkMfr76hWuUhZxnm7CF03dVFD34rSYU6yQ5/3RYN32RATO8VyGDuvOWlzqYF3aeOVZEJqVOdSGhxU/jClQcF
X-Gm-Message-State: AOJu0YyI9pL69qEaGAcLGdpTQWJIhIJgPJ2wuyvcHF6yVnLENbW8mu9f
 qpZPK2DW0FIfylEoVinijFrhG8Bf/MBOX3w6ay24Im6z+zPh6z6cMxigEzksRqkKKe6Mjpp5I5F
 6OM8UVl2gjIWcx2AtiWjrz01QsXKvmmYHUfgA6Ebn+fjwVf9viOEvFu/wfOR4POFriA==
X-Received: by 2002:a05:600c:3553:b0:426:6765:d6b0 with SMTP id
 5b1f17b1804b1-427dc51d30amr38064645e9.15.1721638383823; 
 Mon, 22 Jul 2024 01:53:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQt0t4NSssP8bkkisHsnA8tLq8Iv91Jr480NjPHTYPZZEWC+ZnVhrLtxhOJzzrDG86YKQ7uw==
X-Received: by 2002:a05:600c:3553:b0:426:6765:d6b0 with SMTP id
 5b1f17b1804b1-427dc51d30amr38064325e9.15.1721638383386; 
 Mon, 22 Jul 2024 01:53:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a63c8dsm146615265e9.20.2024.07.22.01.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 01:53:02 -0700 (PDT)
Message-ID: <8803e15d-3531-4384-b641-25845176ded5@redhat.com>
Date: Mon, 22 Jul 2024 10:53:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] drm/panic: Add a QR code panic screen
To: Mitchell Levy <levymitchell0@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
References: <20240717142644.1106060-1-jfalempe@redhat.com>
 <0bad8507-22f3-38d2-5724-0aa6433990cc@gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <0bad8507-22f3-38d2-5724-0aa6433990cc@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/07/2024 20:50, Mitchell Levy wrote:
> I am trying to test this patchset on my setup, but I cannot get it 
> working. In case it's relevant, I'm running under HyperV. Any 
> troubleshooting steps/suggestions would definitely be appreciated.

First, make sure you have this in your .config:
CONFIG_RUST=y
CONFIG_DRM_SIMPLEDRM=y
CONFIG_SYSFB_SIMPLEFB=y
CONFIG_DRM_PANIC=y
CONFIG_DRM_PANIC_FOREGROUND_COLOR=0xffffff
CONFIG_DRM_PANIC_BACKGROUND_COLOR=0x000000
CONFIG_DRM_PANIC_DEBUG=y
CONFIG_DRM_PANIC_SCREEN="qr_code"
CONFIG_DRM_PANIC_SCREEN_QR_CODE=y

drm_panic is only supported by a few drivers. The easiest way to test, 
is to use the simpledrm driver, that should work on all EFI or BIOS 
based system.
To check the drm driver in use, run:
sudo udevadm info -a -n /dev/dri/card0 | grep DRIVER

If it's not simpledrm, you should blacklist it, and make sure you boot 
with simpledrm.

and then you can run:
echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0

On a side note, looking at the hyperv drm driver, it should be easy to 
add drm_panic support for it. I will look into that when I get some time.

Best regards,

-- 

Jocelyn

> 
> Thanks!
> Mitchell
> 
> On 7/17/2024 7:24 AM, Jocelyn Falempe wrote:
>> This series adds a new panic screen, with the kmsg data embedded in a 
>> QR code.
>>
>> The main advantage of QR code, is that you can copy/paste the debug 
>> data to a bug report.
>>
>> The QR code encoder is written in rust, and is very specific to drm 
>> panic.
>> The reason is that it is called in a panic handler, and thus can't 
>> allocate memory, or use locking.
>> The rust code uses a few rust core API, and provides only two C entry 
>> points.
>> There is no particular reason to do it in rust, I just wanted to learn 
>> rust, and see if it can work in the kernel.
>>
>> If you want to see what it looks like, I've put a few screenshots here:
>> https://github.com/kdj0c/panic_report/issues/1
>>
>> v2:
>>   * Rewrite the rust comments with Markdown (Alice Ryhl)
>>   * Mark drm_panic_qr_generate() as unsafe (Alice Ryhl)
>>   * Use CStr directly, and remove the call to as_str_unchecked()
>>     (Alice Ryhl)
>>   * Add a check for data_len <= data_size (Greg KH)
>>
>> v3:
>>   * Fix all rust comments (typo, punctuation) (Miguel Ojeda)
>>   * Change the wording of safety comments (Alice Ryhl)
>>   * Add a link to the javascript decoder in the Kconfig (Greg KH)
>>   * Fix data_size and tmp_size check in drm_panic_qr_generate()
>>   v4:
>>   * Fix the logic to find next line and skip the '\n' (Alice Ryhl)
>>   * Remove __LOG_PREFIX as it's not used (Alice Ryhl)
>>
>> Jocelyn Falempe (4):
>>    drm/panic: Add integer scaling to blit()
>>    drm/rect: Add drm_rect_overlap()
>>    drm/panic: Simplify logo handling
>>    drm/panic: Add a QR code panic screen
>>
>>   drivers/gpu/drm/Kconfig         |   31 +
>>   drivers/gpu/drm/Makefile        |    1 +
>>   drivers/gpu/drm/drm_drv.c       |    3 +
>>   drivers/gpu/drm/drm_panic.c     |  340 +++++++++--
>>   drivers/gpu/drm/drm_panic_qr.rs | 1003 +++++++++++++++++++++++++++++++
>>   include/drm/drm_panic.h         |    4 +
>>   include/drm/drm_rect.h          |   15 +
>>   7 files changed, 1358 insertions(+), 39 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_panic_qr.rs
>>
>>
>> base-commit: e1a261ba599eec97e1c5c7760d5c3698fc24e6a6
> 


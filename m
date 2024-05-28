Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C18D1850
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 12:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0758010E193;
	Tue, 28 May 2024 10:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hut2Vcta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD4A10E193;
 Tue, 28 May 2024 10:18:12 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-64f12fc9661so32324a12.3; 
 Tue, 28 May 2024 03:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716891492; x=1717496292; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=4oKjidjiVG3iD+sGVPZRpxklkmgxpuRK74mDLt2GwZ0=;
 b=Hut2VctaYlfZv9qtb34va80EolWKTiqFGlnLPlqogNBm/nISbVkOqndxyO0+qKCNBU
 o+GwQPGJ9rE4gRZlhCzm+cXXvhxLR6Bc1SmUx8SK4xnEjGBtNEiXiqoHZH/FLNEA1vkT
 ut7D1WZaf62oTHziiKI92PDVWP6e+WQ9aLA7TPItaqrsQR7iHZ15pw6FmIeTHLHeBg/i
 1ZIHHWEd56chB2wDYiS+Cy/DrmOV7YrbZrmXygXou8xoISbw9WlJl8Pf/PBmiU1dKK2P
 OHfeqN/oSMQb7TKC+TMsHt0AUIRN1t1Usx4OCqKNzLeAfWynkcm96jvNWtSpPid9P/Kl
 t0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716891492; x=1717496292;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4oKjidjiVG3iD+sGVPZRpxklkmgxpuRK74mDLt2GwZ0=;
 b=sJfEbveaCHI/OuXy9SYpXOeayr4NYgPoAUZO0dUiCjQTiBi1Psmu23mHNY9XFMRDzA
 aJeydAWhI6T6W/uarFg1efM3ajFZLWSuON6GNMUUEPKyZvpKlvU1U7eKrnLOpm28rfYr
 RfZPsc++r1LMNG+MVgyNtjBIYbB5PgAlb+vZA0wVUOuqzYTDoz2bw+tJ+9uEOFHFqx7E
 S0YW5w+c90qN/UWiOKcgJj0qO7tUZ15iyCai9oMjJiX4bqxPg1Y3Gkkg/RwQy7E2vzE7
 Alu02LJh24Ukf2GA3SRZWdHrPi2aCDTy1ihlzFMhFQdQRobpp4nmkAzB0sBZospulCrU
 HaSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOu6M6dsh9sXZcU23Znpyss6bHRNvRSFkwsV/z4hFlyrPB5pmTsMlujZ90B9WnUaQFTdvjq9BoFRj/Vn0bOYfSlnBGQMajL3egn4rLHfVXExoO5E8DnR1PjNsgcAMGDwwEdwGn/bYNF7WiMqJHPQ==
X-Gm-Message-State: AOJu0YxWtTifIfmFLjxMAvren1gG7eo82WE6CDA5rWMX1zmskcDasCZ4
 AgyVZGGpCcyPtQm2vx0TPKWNrwiEyATvtOUaYi9hiqltc6kP0rcp
X-Google-Smtp-Source: AGHT+IEELOe5mgelYMSGmtxG+kL4UbvP8a3LHl0DXgrfdRShMJFiYY7EESOCugBH7JHSw6S2HnBW3Q==
X-Received: by 2002:a05:6a20:9759:b0:1af:ce9c:6421 with SMTP id
 adf61e73a8af0-1b212b6f694mr10944170637.0.1716891491764; 
 Tue, 28 May 2024 03:18:11 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp.
 [180.15.241.226]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fcfe64ebsm6140939b3a.156.2024.05.28.03.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 03:18:11 -0700 (PDT)
Date: Tue, 28 May 2024 19:17:54 +0900 (JST)
Message-Id: <20240528.191754.1306229738730927340.fujita.tomonori@gmail.com>
To: zhiw@nvidia.com
Cc: dakr@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <fd5dbd42-24b7-422b-bc0b-393347b3fdca@nvidia.com>
References: <20240521083231.000074c2.zhiw@nvidia.com>
 <ZlTcnYNff2EDQJdj@pollux.localdomain>
 <fd5dbd42-24b7-422b-bc0b-393347b3fdca@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
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

Hi,

On Tue, 28 May 2024 08:40:20 +0000
Zhi Wang <zhiw@nvidia.com> wrote:

> On 27/05/2024 22.18, Danilo Krummrich wrote:
>> External email: Use caution opening links or attachments
>> 
>> 
>> On Tue, May 21, 2024 at 08:32:31AM +0300, Zhi Wang wrote:
>>> On Mon, 20 May 2024 19:24:19 +0200
>>> Danilo Krummrich <dakr@redhat.com> wrote:
>>>
>>>> Add an abstraction around the kernels firmware API to request firmware
>>>> images. The abstraction provides functions to access the firmware
>>>> buffer and / or copy it to a new buffer allocated with a given
>>>> allocator backend.
>>>>
>>>
>>> Was playing with firmware extractions based on this patch.
>>> Unfortunately I ended up with a lot of pointer operations, unsafe
>>> statements.
>>>
>>> As we know many vendors have a C headers for the definitions of the
>>> firwmare content, the driver extract the data by applying a struct
>>> pointer on it.
>>>
>>> But in rust, I feel it would nice that we can also have a common
>>> firmware extractor for drivers, that can wrap the pointer operations,
>>> take a list of the firmware struct members that converted from C headers
>>> as the input, offer the driver some common ABI methods to query them.
>>> Maybe that would ease the pain a lot.
>> 
>> So, you mean some abstraction that takes a list of types, offsets in the
>> firmware and a reference to the firmware itself and provides references to the
>> corresponding objects?
>> 
>> I agree it might be helpful to have some common infrastructure for this, but the
>> operations on it would still be unsafe, since ultimately it involves
>> dereferencing pointers.
>> 
> 
> I think the goal is to 1) concentrate the "unsafe" operations in a 
> abstraction so the driver doesn't have to write explanation of unsafe 
> operations here and there, improve the readability of the driver that 
> interacts with vendor-firmware buffer. 2) ease the driver maintenance 
> burden.
> 
> Some solutions I saw in different projects written in rust for 
> de-referencing a per-defined struct:

Aren't there other abstractions that require that functionality, not
just the firmware abstractions?

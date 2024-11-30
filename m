Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8183B9DEEF1
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 05:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C6A10E0FD;
	Sat, 30 Nov 2024 04:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Fr0LQfQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DE910E0FD
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 04:29:56 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5d0c098c870so1158411a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 20:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1732940994; x=1733545794;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fMKf0aAkTvoFZcRKLAWGSKUXjtHVT1NNnWsxVoZ3Ync=;
 b=Fr0LQfQ+OEjjnxN8aWg/1MJ2nnwR8FMhClzrtHIN0JvmILfLcXBJjwMVwbdHBXly1b
 5046UX4W8V1RRyOT3xlc1Os43l7jRaty302TJUArymWSl7uMEehrOPfwaO5HfPHa8Lnt
 lIvOsKnXi1YesQOq7eC5f3ePrTM8lGABfWg1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732940994; x=1733545794;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fMKf0aAkTvoFZcRKLAWGSKUXjtHVT1NNnWsxVoZ3Ync=;
 b=eD8uqwVGxVXad4hlRjec8zEyT6ioEwImCr0hWNbdCvNul53eLxGiU8DvsAll/rRsOh
 w+PlcWp73ApL21shIugaOZzX83AT4BgwoAlifo6vzt5NK+o1AbIyck3ZppFOjcnWsheY
 jBCKD7aRGbRzhUv1k+OWXnojhZ9PxAQ/Ti8OKLwiPU43u6HbCdmMA64gaQdZ6fqpPP5B
 MQ0+yYJMtay+bimTlKO1zW8iYS1K3nAnU3dw1YaTjAhyLa10HjHKQRv1mcTpUesghfWE
 bpl9YMjmj4B6Iq1epq1k7ny9X0jNbkj5UGUoi7htDELMruPXh5hup3cOyP9kKbzIIxtL
 sGJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJgWOXpm/Dwx3ZLpql0OBD6i24IR77y1pq1NnZbln3KGLhmyGwHwvbcOJNdygQLsJS3UAJs5dbz64=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNxFQAk3A6vezDg1noACtVY4LZ8q1hNNRKYCRbyq84gmxh2ItL
 FY7v8vHDbNjmD6n2Q2FELMN4v7R1GyDo039L6lKe7tJKyo9XCwS8MOV2lqPf+at7FoxaYtjMSKB
 hN9DcYg==
X-Gm-Gg: ASbGnctag+QVKXQtQPbTG7uCHSvcBbnfjNGU9x6xlXkZkfVewb1ZamjCYNmkrX9I9SK
 dNMTQrVeV3MaqJzoJDlWMt/MTZsdTCo6dxvNa7oDOzaSyP1JVEPzJY/4pKDc7S+oZpVQwu5IN83
 ppc7VwKqzJvUoAFC2iRNaE3bbpWy7FwgF5+JgdXcCAW4doXf6LR9ASx1VpBzJsyO3e1crxXnr3N
 mX76hN++Awa07GVnKKhnco4q8BeOFx3yQqq1LXsr/MN0fFeFYjX3U2ImORpHVbwAXn1dj5eXpNq
 uGx703OZqSoijVWJcPRpbWyr
X-Google-Smtp-Source: AGHT+IF/HscBMS/dBtXZHVHUnY+Ure/FVQILcnsKkGz1lswPC7HsV3GEZD/PqtEpoSkdJ2Y5BbJ7Hg==
X-Received: by 2002:a05:6402:5248:b0:5d0:9c15:7efc with SMTP id
 4fb4d7f45d1cf-5d09c157f83mr8994081a12.13.1732940994295; 
 Fri, 29 Nov 2024 20:29:54 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com.
 [209.85.218.49]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d0ccbf4e3fsm254560a12.47.2024.11.29.20.29.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 20:29:53 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-aa52edbcb63so616366666b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 20:29:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX/WDaG9pMLPz4t4DRfgwITm53wfUY1EF26pyRIcU+fdKG7byZJ9G3e7hM6HkB5yCzB8xziZ5I8QPE=@lists.freedesktop.org
X-Received: by 2002:a17:906:4789:b0:aa5:2056:f43 with SMTP id
 a640c23a62f3a-aa5945355cfmr1271655966b.10.1732940992140; Fri, 29 Nov 2024
 20:29:52 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tzpFOhQN3yCb4+OpLsfYVrq4mLuUS+SP=H=gq=qSLDz7g@mail.gmail.com>
 <CAHk-=wh74-reWGqpP+i3O8usrS1Jr12UGGMCfaK58_0aK5Lw_Q@mail.gmail.com>
 <Z0pHQ-Uxgj2snWvm@sashalap>
In-Reply-To: <Z0pHQ-Uxgj2snWvm@sashalap>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 29 Nov 2024 20:29:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wismrb=xrr_S5aCuJq6P1svhhbiaUMSJb9BXMpOppzMMQ@mail.gmail.com>
Message-ID: <CAHk-=wismrb=xrr_S5aCuJq6P1svhhbiaUMSJb9BXMpOppzMMQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.13-rc1
To: Sasha Levin <sashal@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 29 Nov 2024 at 14:59, Sasha Levin <sashal@kernel.org> wrote:
>
> I should be able to reuse their config and just add debug info, no?

Sadly, no. Not unless you exactly match their compiler version. And it
looks like you don't, because the line numbers make no sense.

For example, this is the thing I would expect shows exactly *which* of
the roundup_pow_of_two()'s it is that causes it, but:

> [    4.510096] amdgpu_vm_adjust_size.cold (drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2083 (discriminator 1))

that amdgpu_vm.c:2083 line doesn't match anything, and isn't even
inside amdgpu_vm_adjust_size() - or something it would be inlining -
at all.

So I'm afraid it would have to be done at the KernelCI/LKFT side.

            Linus

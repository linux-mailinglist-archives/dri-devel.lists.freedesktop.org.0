Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECB799D745
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 21:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B55310E4AE;
	Mon, 14 Oct 2024 19:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RxkXuchT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A62710E4AE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 19:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728933816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pr8kBiDDyEnpolDm4TeW3ziQndwc2QwIlDCytPXA2jo=;
 b=RxkXuchTfZ5ulJRJnyqc8o+w67SuYSdW2+c2W5HVr6MBrV2gfLbjZIt6Vl1A2liCsykXpm
 +veJqbq8K8KigzFGrX4ajx5dkDOMQjgRqOBx1D71P7C1BcFt76TSxRHNa94jtiwljoCubo
 PHevHkZPrIh7VtG6ycswpLTIDZmlDz0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-9zmYn1oQPeiL2anwCBm-eA-1; Mon, 14 Oct 2024 15:23:34 -0400
X-MC-Unique: 9zmYn1oQPeiL2anwCBm-eA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-431159f2864so24026775e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 12:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728933813; x=1729538613;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pr8kBiDDyEnpolDm4TeW3ziQndwc2QwIlDCytPXA2jo=;
 b=iAS9xijGzBs32x5u8wYYxiB0KWSI7PCLLXWz8EUGA/MOnxLla4RIGD4cgndeGBU8PR
 GvyH69STHqjOJCJvrg/TDv/e/UoE6/uMixEIQEDXR62tmZhx4TlFSx/XDg/Fh375m5WI
 cxFG1IK7Fe+61OL+G9xd74NXvNA7pH95pYNAjX/m9VitYNQBIm7DtZaP5vnHGaAFKm03
 /0Mco0Qz9Hijw369eHarlA10KWbXDsCMNchOtrwWxBmFW5VbXyOrwL7NtiHJ5W1Pufv0
 zTJvywk5aNac8xo9/zhrlmTp7/UVkojqimyyOf8aXvqGQf/iiMUvCBnX239MYnp/IKo5
 1ZkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0CiHNuIn0ninPMdBLZmFF4g2REsSezklfVn7h1BPmB3TbQIrU9OiCPCs6DyAHDhO4PnknasVCwAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv73jk1mhHrpRQX4c0wIZw2biOhGVY+8lXGrFQwdGPqsl2CoiK
 Rf0dcCiW7zWllc5+aH9BIWTMdlGseWdM4iN1mAAdEwV1/43LHn5Y1mcP5Ei6SPbwARL2bvSefiT
 jH/AKWkHDoicj6K6brQJ7k54P2U07ZYfjiUPybyRra3Zl7O7MWy5ZS9K81SoT4FpD1A==
X-Received: by 2002:a05:600c:1e88:b0:426:5e91:3920 with SMTP id
 5b1f17b1804b1-4311df5875fmr105232585e9.29.1728933812985; 
 Mon, 14 Oct 2024 12:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbTqTqdJ+uV85hzvy4tOJlJO5ZFnRlJoc3kwSn95A8eOaOkt0awKgBPBHzu+zMwf2VvN13PQ==
X-Received: by 2002:a05:600c:1e88:b0:426:5e91:3920 with SMTP id
 5b1f17b1804b1-4311df5875fmr105232285e9.29.1728933812596; 
 Mon, 14 Oct 2024 12:23:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d794asm129792535e9.1.2024.10.14.12.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 12:23:31 -0700 (PDT)
Message-ID: <2e5e6280-eaa2-480f-b89c-c9b832328d07@redhat.com>
Date: Mon, 14 Oct 2024 21:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/panic: allow verbose boolean for clarity
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <20241012075312.16342-6-witcher@wiredspace.de>
 <13f6f904-bd2c-4b0a-914e-0715d22a7ff5@redhat.com>
 <CANiq72kE0QtiC6OjyV32r_0V2KxhtPk+-8mQGkCvtexif+04vg@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72kE0QtiC6OjyV32r_0V2KxhtPk+-8mQGkCvtexif+04vg@mail.gmail.com>
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

On 14/10/2024 18:59, Miguel Ojeda wrote:
> On Mon, Oct 14, 2024 at 10:54 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> With the suggestions from Alice Ryhl to not introduce a return, and use
>> expect:
> 
> +1 to both.
> 
> `expect` (here and the other ones I suggested) require `rust-next`, so
> if this goes through DRM, then we can clean this up later. Otherwise,
> if you prefer `rust-next`, we can change them to `expect` already.

I don't plan to touch drm_panic_qr.rs, so I think it's better if this 
series goes through rust-next, to avoid an extra cleanup step later.

-- 

Jocelyn

> 
> Thanks!
> 
> Cheers,
> Miguel
> 


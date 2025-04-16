Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36338A914FF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 09:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFB510EA40;
	Thu, 17 Apr 2025 07:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TRaKsiDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D21B10E0F0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 22:05:09 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso97651f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 15:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744841105; x=1745445905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oHayVKFFsJNmr2sjJkndFwEOAkhvbxML2QrMhdj9R5Y=;
 b=TRaKsiDy0gpqLgfMyVKSKeZOb56BSJKvGH9KOiGBx3cxzcr07bacx4h0FvypHxxZO6
 swlxwQhzg7JSrxl4KVswPWI43RTmLaP/hnR453r1ARQDKQ2S4h1vCRDS/eiYRyM6T002
 afxsvgwGuAt7CyZSFTSLPsnIUqqwerNN7eJlYs94cGOWzGIA5TJWfgTLCOeiWzgVvXMZ
 ffqrNILmqnXSPMsCaQNVeeNoEmAVghI+JyU+o4muqN6ZzMRc+6vJLQ11x96NRrvQ/EU/
 L25WB3uIa/5v6NVu+e4yymjuEcYdNEJnfeCvrFR7X4wxlm4IWtmua7AW54BJZbpb08Iu
 cCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744841105; x=1745445905;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oHayVKFFsJNmr2sjJkndFwEOAkhvbxML2QrMhdj9R5Y=;
 b=GB8gKUBUoYu1cUj73ORC+SzFOiesUJ6hjJVami/w8CvqexPW3oXIjBlhWoW8dtd2fL
 pN0SZyqqH93Ke0+okttgLrkjt+sb1aZXtGClG64SSBnZGQF9RvHpivcwAoYzQUUkM02Y
 xTSHbcZZirXGegtjTpu+X+eyBV1bLok9AbsjA1HPPrwYRB9mdGq7PX7OrAYRSZ/Tizll
 zyFUolU9ULSKzLu/0L9V86FFAprstIVYpZjWdfFht6opHZ15naLWsoDOI4HQHByTRDM+
 LH3Rase+82in5lp1+f2TNCywSYPtAhPgZ9e7uZ1d/g42WtZSCQSfJxAbgwe9DL+X1ExD
 nJgw==
X-Gm-Message-State: AOJu0YyRiE7ti8CWs93IX1YkpOXBvmzC5evqHlvyhnKvnW4Zwrw7HgMA
 t4pLnOI2ToEv/GIclwqQHKSpI42ki2o2rtfIsd9o0hCQU0ek2aWL
X-Gm-Gg: ASbGncsL39CKSttvKRsb8FHtvE1JuMUxLLSrWqBFmqzQBnL0T+wC6Kpi9lKb2jpW9i2
 NnRioJtf6r8At5vwbqsfUiQ3D0MUOi9dsFZxYP0C9hqcF/0dbVfL4bg4Q9Jqy/HuUbPtjCZRIR+
 c7jxQW1Xh/CXbs1HjJnJPC44qL59va1aWhLc4JRnCV4HIc/0hF/C93rm7g1qZ2BHAva5II4az/0
 kYMnyHvcRlihW2m5IksnMeerhyjdJ+S+MWvidxYezLz0mOO087qsUFQACX188UcMTf9X+zGWiOj
 j+g7BtCCYHixUbUjDnCpN4KAEb4p/e77D0RunrH0LY6TT/zA2cMhhw==
X-Google-Smtp-Source: AGHT+IGC46S4S5h4Q5ailbC5feqlplYAzWogcdOjZfAGKxveTGmXYrJirUpLbhifwMOyo43pOFOhPw==
X-Received: by 2002:a05:6000:2509:b0:38d:ba8e:7327 with SMTP id
 ffacd0b85a97d-39eea37a7b1mr334295f8f.8.1744841105179; 
 Wed, 16 Apr 2025 15:05:05 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43ce3bsm18546012f8f.66.2025.04.16.15.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 15:05:04 -0700 (PDT)
Message-ID: <f801975c-a796-417c-a7b2-be493b32068f@gmail.com>
Date: Thu, 17 Apr 2025 00:05:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: use `///` for private items too
To: Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>, Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20250416122106.2554208-1-ojeda@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250416122106.2554208-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 17 Apr 2025 07:22:17 +0000
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

On 16.04.25 2:21 PM, Miguel Ojeda wrote:
> `///` should still be used for private items [1]. Some of the items in
> this file do so already, so do it for a few other clear candidates in
> the file.
> 
> Link: https://lore.kernel.org/rust-for-linux/20250416112454.2503872-1-ojeda@kernel.org/ [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> Not sure if you would consider it a fix, but please feel free to add Fixes: etc.
> if so. Thanks!
> 

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

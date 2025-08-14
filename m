Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8069B25A58
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 06:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDA410E201;
	Thu, 14 Aug 2025 04:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BgqhXEDS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F32710E0EA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 04:15:11 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-24458263458so4230175ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755144911; x=1755749711; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sWxfCtON1zed9A8C3GYhEYa8VInQ0SpyFdE2rQUbX1c=;
 b=BgqhXEDSSHqsKpjTjuvxtJp1oVNhTa5/AOqYO2CTTY5C577rKx7lvVAq7mtR4VEGwS
 Y56MqnpQsHuVSYnn4qwuwYSrXVXXFI5j+rPCETuaW3Lu1faZLU0z4YdYNazJ0ZoeUnd5
 0QHPmwTEZOJrVUfNVStAwfLJrY3ML7eZOnV0o5zao15Wjv8bOGgH8kaSx38XQ53UzbpP
 PC9vFgFUJtKuoo4ouQIy3sMe5AWkdd0UIHmNKs2znPA+I/AaBHzCm2q58H1wTsrEWohx
 HSiSpsA1k5KNVob+m1RsQwW2fGjcOpCZDmvPO9PhjOulDfiTExMgO8VT9nHRzlQu7SbM
 rWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755144911; x=1755749711;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sWxfCtON1zed9A8C3GYhEYa8VInQ0SpyFdE2rQUbX1c=;
 b=tsiQOGo1uGhkUikhlrKxtZj9tYc7Qxo3JzpaVIhQBopde+WI97cc7d4trDC2Yt2MCp
 B7moS2N7f1z44UbJAKfW/hLuRBHBkmTrHe0+pERefFigkserco419AFgqswqYuw5xtmb
 nDGaaTlIfCpHpFjULVcmjKxEKkOa9TqkL0l98NrOeXsy+Ju9wzZ85sUvwo6MPVywdT6m
 hOuE8Q0EO4wPtBvx9mdqT4Rb1fFpQhFeAzRlAspKwOdfF8cN8u2wKbqx56qDbAvYIXfa
 5uINkRnsUAr6ctE39irTLzx3piBjyt+Qyhbj5KBpQAM7GblV0fCiAMisdEp1FCQRaHht
 Gq+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWACkpvafpwpnRxLm1zlWbLuJpUtzeOKgaurJxTJlFpzjVHrJCYXlMoCfK+GCdNgeiVrPbs801TAik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVlCUokYmUcZflzURCZ9mu4I7fzTEEbZPkk1KRnnR5ash4uUeu
 WpjIIZrfVxdVxL6MGSFluP5DZeBnj7vMNtAxS7qqumej4TGKNrZ50KYGNTdvOH3ixj8=
X-Gm-Gg: ASbGnctPoFspg8zqIEPuufHNz5GqizjFkr/fpO9ZBDXtgCGKDcGtrVikbXke2C3t80q
 wXRSW68pWG9OG/D1mixkUf769Rs8BkZ4aIMrJQ+c104I/PvXkR1sa8mjYTQgv8XDercRgzOT4gz
 +rDsINvw+WtEnfk66wCDwhHBYnXGGU0df7Y2fD+LO6QJ/+LQHexjAkpA9iXvsfL3jY9RvkzlMoU
 aNtJQ0Zaoqt1GNoULZKKTxauKHl9V6p1648d3hDdubcLxfUMvWCejyYSGaqAVUcurLYov+Dhxm3
 RMwlw/HXEg5FapDHTZEhBDAhnWxEyPyv5NX3D58i1EyXUwcMlICABNtnrBB2M8gLEeUuvFku/Hw
 zF+FTHbmxJarl8dmXFDXZEF7q
X-Google-Smtp-Source: AGHT+IHt40bX0FwSrzcBQt9NOrie8YIvE0Bd/aZbf1eDUrCgWfF/cOlo6cUv942myCO6XkFRZpWJjg==
X-Received: by 2002:a17:902:ef46:b0:243:80d:c513 with SMTP id
 d9443c01a7336-244584c278amr22862505ad.4.1755144910690; 
 Wed, 13 Aug 2025 21:15:10 -0700 (PDT)
Received: from localhost ([122.172.87.165]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef6e45sm337724835ad.22.2025.08.13.21.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 21:15:09 -0700 (PDT)
Date: Thu, 14 Aug 2025 09:45:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 06/19] rust: cpufreq: replace `kernel::c_str!` with
 C-Strings
Message-ID: <20250814041507.sqkdumgaxfcalkhb@vireshk-i7>
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
 <20250813-core-cstr-cstrings-v2-6-00be80fc541b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-core-cstr-cstrings-v2-6-00be80fc541b@gmail.com>
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

On 13-08-25, 11:59, Tamir Duberstein wrote:
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs | 5 ++---
>  rust/kernel/cpufreq.rs         | 3 +--
>  2 files changed, 3 insertions(+), 5 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE74B25EAE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 10:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA5210E81C;
	Thu, 14 Aug 2025 08:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="br94YOue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD65810E81C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 08:24:43 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-45a1b04f817so2620585e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 01:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755159882; x=1755764682;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=XjZ/eR6SQYjR+SXWKMp+2N2e/5Kxjm09W05WAM7WjMU=;
 b=br94YOueVmso4x2j8T9sa/8Uqz/oM/C+X5i5K4M8wMJhzmlUDjwX6ij6nEzOOkpgAi
 5exRF/KyG3gG3k57NspU+EaCSDDPRRgt7I8XQ1P5xY4fxm+RGwIaJvM4VRLhL1tUK/o5
 vEohKnH/8jxJIqWnkJsFA/lZXkUIGu2mlxu0UC+M04cT1l57Tuirp73VlzsUamlNdDLW
 VwWCgW/4Qoc0Y6HoxVB6zuqtq1hPCpRCQARvQMH47Iwt7rl2A69NEBdI/HkFrPYrkdLW
 PgDd5DXMX6jwkHDBPB1S4opsGnRzshN39csstM8BVuLJxLYpNOcIUeYa7kZHnLGjB/r4
 yzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755159882; x=1755764682;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XjZ/eR6SQYjR+SXWKMp+2N2e/5Kxjm09W05WAM7WjMU=;
 b=A4HhjvTmVoGLjVrRvBHu298voqypQIWThAqbPnKtaY33pxGdokJucUszKkEWZ0VKrC
 cMb4Q2YIsYqOnIu5dAF87ezh1bVXHbhqxqB+S9uPAtbG6F2MRF2j/iY1BbJ4xuWfCK6R
 U9npyrm6hn4U3hhiL82bWHYqO6aiE1Jx82+Tvnqby7pAZRTZBhCRcOSct+cdUWNzx25b
 on8XHLB0ZSqQCJSa4r92ndhA42+KrnTtmN4SfUWzQQnDoreEe5Ur+gYAip1bzJGxYslz
 og98NhEBht56uZxJS97pgKQRxC9eQgUeTlGMTbTmUBxCohRbfeZwjkFmaT2VIZ9YxmtG
 /PmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoYu6B8b+EjiIiE8NjRpvWNMpG4sS7iCSUEXicPiOOw6d+Y9OC4dB/HP274Febrm2OJflmefVvbvo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyd648xjuCodBIp6uSDTNW/B7jBKYYlCJBTzLLAevD2soxvAuUD
 80tsK7YGTl6ghenT0pd1kQEAAzJ5URtgInUZ4sSEIdW/28mqlG4eJHC7sz/Ng4Gm0Aj/eXhzJf0
 jDs/V7mCbgoDFydTO+Q==
X-Google-Smtp-Source: AGHT+IEGivgrzos4CoGDHY7uH0CTjOvIWOyqPK2uMv3U+POUyDq1mhFpmt0OotkxsQj2w6KHcsTz1JVeOL0tM4c=
X-Received: from wmbjg12.prod.google.com
 ([2002:a05:600c:a00c:b0:458:a7ae:4acf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190a:b0:459:d6a6:792 with SMTP id
 5b1f17b1804b1-45a1b67a1ddmr13345765e9.29.1755159881981; 
 Thu, 14 Aug 2025 01:24:41 -0700 (PDT)
Date: Thu, 14 Aug 2025 08:24:41 +0000
In-Reply-To: <34d384af-6123-4602-bde0-85ca3d14fe09@sirena.org.uk>
Mime-Version: 1.0
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
 <34d384af-6123-4602-bde0-85ca3d14fe09@sirena.org.uk>
Message-ID: <aJ2dST9C8QLUcftA@google.com>
Subject: Re: [PATCH v2 00/19] rust: replace `kernel::c_str!` with C-Strings
From: Alice Ryhl <aliceryhl@google.com>
To: Mark Brown <broonie@debian.org>
Cc: Tamir Duberstein <tamird@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Breno Leitao <leitao@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Alexandre Courbot <acourbot@nvidia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Wed, Aug 13, 2025 at 09:11:51PM +0100, Mark Brown wrote:
> On Wed, Aug 13, 2025 at 11:59:10AM -0400, Tamir Duberstein wrote:
> > This series depends on step 3[0] which depends on steps 2a[1] and 2b[2]
> > which both depend on step 1[3].
> > 
> > This series also has a minor merge conflict with a small change[4] that
> > was taken through driver-core-testing. This series is marked as
> > depending on that change; as such it contains the post-conflict patch.
> > 
> > Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> > can be taken through Miguel's tree (where the previous series must go).
> 
> Something seems to have gone wrong with your posting, both my mail
> server and the mail archives stop at patch 15.  If it were just rate
> limiting or greylisting I'd have expected things to have sorted
> themselves out by now for one or the other.

Tamir mentioned to me that he ran into a daily limit on the number of
emails he could send.

Alice

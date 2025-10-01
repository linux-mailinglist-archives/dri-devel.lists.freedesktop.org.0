Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0EBBAFD8E
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 11:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A05210E2FF;
	Wed,  1 Oct 2025 09:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="C7TRBVFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4045110E2FD
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 09:28:37 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so66759925e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 02:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759310916; x=1759915716;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eWhaWIh1Ch5W+HrhvE/7nWxIJ4BqD2s5kUI/3gBmyEA=;
 b=C7TRBVFQQ++JPT4uedbale6thYFGw0UakoBxUqUYvNqOXxX1JbpITbODeA0yvuKmKX
 CbYPT0b7VfYTgisFulhx4My2QwT4dN5NgR5wcZU1T10ZyCTJY8vqJQwqbRqJf8ZuHKqX
 totj89Cmr61seEi5b9uMz3VJeJlIioTTCytrTXiallTz1H3bzUpfv9JEQbZDBej7RgHd
 cON2t/x8ZyJF1A4IivYGqbLywOuwRh9RAnuG9pNx42nIl31oYgnF+IYb+N9DMtctq76R
 hukJBLVTF+ChqgV62N0G7OPPXxUhZueTVbn4c4ywT4V4G7lL2i/KQ/BqF+01GtQ6N7WS
 yVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759310916; x=1759915716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eWhaWIh1Ch5W+HrhvE/7nWxIJ4BqD2s5kUI/3gBmyEA=;
 b=eqWdzdjIHV58SE3PApt2wGAxrBnxIjtQyFyRI7swvhPwbSIhGMYJZq9r/8eyHT9MLS
 QzZp+ck2kRMrjB7thVrOCzTdL5utW2bJSR5gs9/hTSvW8cOBHN/924+Mfav+Kr2FG735
 JnzUMBJGNyYatTBwDtxMbh4qIwBDm317pd6O4XTYd9woouHMy0IBDgAsUDf4mFHm1PRB
 cYwhVrQBZR9qpEoUMqYTvr+AR7xGVYdaI962ypsq08IpE1XvVP1jy3Ec/yM6F7U0nfBz
 dG2LxHi58aWXTA2DGe3czGIp7ZGOL1OEKAX+I21K6vr+dmCb4fHlF9JG9rXrFx1aUL13
 7Tlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUo7RJzoe2tYVJYS7zZ9hMb9Me05WUYTJ3rEJnYZVknlApPccC5VbRFKz/ZWw/h8HQY/kL018lsX8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ+XBWXGXP7no2CFbqzjGULgTuiSluaQT8hY1feeemaIfVGaPe
 XlAYjZtMYM/INNHLZIfMf1s1gHPoW2TWKF6cNwbcIBxBbGL0xD4V1EbyYCpKlLbG4/BXVu07WWt
 FWr3BuI/dgEL3xNUj8tv10ELQ3ksdOfONyxjvH2wK
X-Gm-Gg: ASbGncvHqOpSF8jHFs4o4AU2zAhA1RfqXrwtor3lgB5mzKvI3c0kHTocjN/1I2K9yaG
 WyyoIHj+xvRNmRgI8iHmf07O0LSKWP8iHwaezisDaFszuGxFs4BcJpFyL+RQBIDD+kLGmobWe0c
 coQP9VzVk2FtI0uGVqlzY61zLNkToIqonGCwhbbr6sToo1mkCEptjoYwyCJgbJ/ghVSIJwoVpx0
 IIzcr/dn9sT7MXpOwFq/ujELn+rrz4Z8lvqM63l3zGnecL6b4IN8zsd2zI4070pGaAGcPTjaHd9
 nFA=
X-Google-Smtp-Source: AGHT+IFcom3ihUiZsvQc7Ctd6T7AFUDP+BI45kum3YBKQg7Ja8eF4g1jmM9Rz4a7lPBApkzRM7m3vX/ZWyyP9taYRzo=
X-Received: by 2002:a05:600c:1d12:b0:46e:3d41:5fe7 with SMTP id
 5b1f17b1804b1-46e612dcff2mr22205905e9.29.1759310915370; Wed, 01 Oct 2025
 02:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
 <20250925-core-cstr-cstrings-v2-18-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-18-78e0aaace1cd@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 1 Oct 2025 11:28:23 +0200
X-Gm-Features: AS18NWC0UIhXtF3ngdaaXlg7HajAeA8SvMGIxlOaATZh6gKK8pvCVQpA1AHU2RE
Message-ID: <CAH5fLgh84SZznuv_BHMxSe4riF=YZekCp1Kx6KmiipzTOHmRsw@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] rust: io: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 25, 2025 at 3:56=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

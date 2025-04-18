Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B737A93CAC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E015E10E24B;
	Fri, 18 Apr 2025 18:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HvEkNuyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD0510E24B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:16:56 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b07d607dc83so1634782a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745000216; x=1745605016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RtR9yi+Z296JQYsaYU+wI+paZc4GBr03eUA9SnJEG0s=;
 b=HvEkNuyNWm8UEyB2a95mDN84CiXgy5317LlLSfH9UN5XMKqEDxp1Qa6n7xMrOulhmS
 SnR4TDAjOFFNG+MIjZcReUISljogAOj9u7/n4D0KrXvPavCn49wdk2fUC9Tft+S7ytLs
 s5S7XpWE2XMibGZblNQn3RNbYr1liq4ixfIAVclzV0g+psqxQkKs7aBNsCNGr9myNJl8
 Zyb6BFyyT1Lhyja2NcvfovJutkAbabOI98KxFERQEhznrtA5etU5mLZDVYyJL0hYhvWB
 tZcz7D60y2N3Q2iVY+RMl7gPWH9hQxq1eo/Ag+/KnQDunZYrYMTrc3HEaHz33uGZxJeq
 +3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745000216; x=1745605016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RtR9yi+Z296JQYsaYU+wI+paZc4GBr03eUA9SnJEG0s=;
 b=dftQGiW5QCl6LZtD/gyCb6wnHBz26GgNmSNJhRGuz9+wedCUxkJ4xrkvJizrndd10B
 S+i6ZSwF1jEviXfiNu1t069fiU05IRsGjGIgYfQBZr5Hdr99w2//dDC0dnXGDzAfJR9j
 6IiShTa28zYWvJZhtFiznTHxFJEazkW5Q3zZFtVK9Ky9e6Pcv7NUhvwrMBkp/FRY5Ou5
 I5QdwBIixK1Bl7dBT1nAI2fx75uILioHT4O79vp5MSr2Yj2W4saLmKv8cvJR3fnCUZ14
 2QyLfyEULoQV4/R7kk8D+CQLoqnLP+c1XArxN0IMfyvnytbU/AFeA8DHeYGXBhDKyew1
 MN2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV1MiEhDHxqeL9hPuVExsDU4qN2acB3x65rYA883W5uNJfyYASULwn9+HgrP7YonH0+777sQFHigg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGILqRVoD8P2rcTdjmDQ7GDe9HNxpEr3/SZEx3TnEQK3U/h5ot
 ++M616gd71f216xbe81IbN4K6PLpFiEbnMJh1xriguhYoo/L18zS
X-Gm-Gg: ASbGnctICbXXM69ztbEq3vnSXoa3Y/mnBTfuTX+Jh53NvnPFt9MX4kKeGidTefqdHvC
 rGTdAAlrQMaqTF0xPtxARBFJM69ofil9YFJYsl2jhTI1kUuF/+N6SEZ4s+cMFLNsYaIke0bdaUp
 HJZyDjLm0b87sIRawhLm7X5vmTrEcnF1z0Y75bwUGV8lCNXK0JoxvoouQGQnmVBK7JMCVMZyYRC
 +WKrbsU57ni62wdtp4+rq5rfMVXMir/0/G/emU/TGY7Ay8aJoLf3K4UViG75Ak+gkJ4CC/PLOZW
 tLrbGMbO4UBi7DmpVVlo8oQ8og6svbPCoRJy5gs=
X-Google-Smtp-Source: AGHT+IEgYyHoFNXqS+ng4zUSLjzFVHFHhp6c/GtXYk71PYeQLEijwI6Tlhvtyx+SG+0mbA7k2GDG+A==
X-Received: by 2002:a17:90b:5884:b0:2fe:a545:4c84 with SMTP id
 98e67ed59e1d1-3087bcc72c1mr4640664a91.34.1745000215613; 
 Fri, 18 Apr 2025 11:16:55 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3087df25d80sm1560674a91.25.2025.04.18.11.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:16:55 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org, danielt@kernel.org, deller@gmx.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jingoohan1@gmail.com, krzk+dt@kernel.org, lee@kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, lujianhua000@gmail.com, mitltlatltl@gmail.com,
 pavel@kernel.org, robh@kernel.org
Subject: Re: [PATCH 2/4] backlight: ktz8866: add slave handler
Date: Sat, 19 Apr 2025 02:14:41 +0800
Message-ID: <20250418181442.207436-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <eb23737f-5b6c-47fd-8b39-637e059bd5f1@kernel.org>
References: <eb23737f-5b6c-47fd-8b39-637e059bd5f1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Mon, Apr 7, 2025 at 6:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 07/04/2025 11:51, Pengyu Luo wrote:
> > Kinetic ktz8866, found in many android devices, nowadays, some oem use
> > dual ktz8866 to support a larger panel and  higher brightness, original
> > driver would only handle half backlight region on these devices,
> > registering it twice is unreasonable, so adding the slave handler to
> > support it.

[...]

> 
> I wrote on IRC - phandle to express the relationship between hardware -
> and I do not see it implemented.
> 
> If you have devices depending on each other, you need to express it -
> for links, for resource dependencies etc. phandle is for that usually.
> Or OF graph. Or parent-child relationship.
> 

I got you now, as a non-native speaker, I often misunderstood the first
time, you expected that accessing node phandle in relationship or graph
way, I did only access node phandle regardless of relationship or graph
description, I only implied it in compatible string, but there would be
a better way.

> You did not provide any description of the hardware in the binding, so I
> really do not have any idea what is this setup thus how to represent it.
> Use hardware terms, diagrams etc to explain the hardware in the bindings
> commit. What are the addresses? Are there any shared resources? What
> buses are devices sitting on, etc.

Agree.

Best wishes,
Pengyu

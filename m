Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7A2BE8D05
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9257F10EBED;
	Fri, 17 Oct 2025 13:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KjOmOEWC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F280810EBEC
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:23:06 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-471144baa7eso10631735e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760707385; x=1761312185;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=S5Yn8qbQoqMlqz8J8ZWtSvsw3x4TMtEW0q43wUSvDUs=;
 b=KjOmOEWCVqlPP8meiUS/xHacZzlJ/RM3HmiPYs5Fq8xDb3C4YeCfSWvatS2aCn8XpK
 qewe9VhiviIZcnLEKewgSrKc8a71LKTDzjMs2d6rnnHgPz6GbmBL3gsGCbTHDRbEqaH3
 cAD1sVmKXPVpOHOFkFD7YK6oBHVIH6eifNB7w+iMhW8IWPfrNsm0l94J1QD5SC3RRQJk
 9HelvH9jeAOuIGBGnPQGO8SXUqWs7QE6nIiKGgCmKAJNKdFxUdGaWfpZtRFreEaYaHOh
 nOsnHuNowseji2YlqT65/3r6BEZQUZcxNbCHC8F9QsO/ZGTb4ItlY/orAgSPTrkifyeA
 MeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760707385; x=1761312185;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S5Yn8qbQoqMlqz8J8ZWtSvsw3x4TMtEW0q43wUSvDUs=;
 b=QXGo3kkKNzqmFlrBH4AU+F/phj4w1ypA5RxsblAUotUG+Si4FbX+s4T8oAAoBwBnp9
 6h2ZzZ4o+gGHQ8sm24EGtfIGj9z0zOLmcxv8pM1oLqkDYT3Cn7JCpRRKzUv837rVLpuw
 rujajaUFsCbCy2l7h4imeV39HZg7JxR02AcOP72ehVDsL1q5k4Q7Wd4rDr7LMi/KXFHu
 PGIBFBB79b0DljnZOEseSRDdnQDEv6MeJtfb+rZjT18BlL2kYPD0/T56tpQP0JMZLydq
 PuRYdhAlOtlrf2+KRBXBvscsSWtxR/HSXHZdLksF8ampCNbDx6wBmJ2jC5x5AEmISO3u
 Bxhg==
X-Gm-Message-State: AOJu0Yxap7PD6KtK2RMhlTFJ7lWfLRC7XljQNJaid6PGixeDjIyTdKWD
 Es9qm7qCLENjfix8QUFJ2bcGw5b6RBVYh3xjSE+U2wwkfaREI2BnbVzMhbl4FGkto3lKGBzopcm
 YxG+aSLqP2lsc9tjeqQ==
X-Google-Smtp-Source: AGHT+IEYb4fFMQvjDzvyv+R6CQU79EQ8AAQbZcI28Pmog6TT3PGCHiGdYfpHiQEQ7liXGiI1hW8U/8CHkswY9G4=
X-Received: from wmgb8.prod.google.com ([2002:a05:600c:1508:b0:46e:3190:9ce])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:811b:b0:471:13fa:1b84 with SMTP id
 5b1f17b1804b1-4711787c803mr27313335e9.12.1760707385665; 
 Fri, 17 Oct 2025 06:23:05 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:23:04 +0000
In-Reply-To: <20251016210955.2813186-4-lyude@redhat.com>
Mime-Version: 1.0
References: <20251016210955.2813186-1-lyude@redhat.com>
 <20251016210955.2813186-4-lyude@redhat.com>
Message-ID: <aPJDOLvBldH_Km91@google.com>
Subject: Re: [PATCH v4 3/9] rust: helpers: Add bindings/wrappers for
 dma_resv_lock
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>, Asahi Lina <lina@asahilina.net>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Asahi Lina <lina+kernel@asahilina.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
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

On Thu, Oct 16, 2025 at 05:08:16PM -0400, Lyude Paul wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> This is just for basic usage in the DRM shmem abstractions for implied
> locking, not intended as a full DMA Reservation abstraction yet.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

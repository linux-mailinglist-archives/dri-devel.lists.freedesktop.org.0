Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF52D3C57C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B483B10E5B0;
	Tue, 20 Jan 2026 10:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WD45N7RV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9510E5B0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:37:31 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4779d8fd4ecso26466045e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 02:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768905450; x=1769510250;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=I9vLBXNMAjUczujnOT8nZXcD9eSaIcT1JipxISSliZs=;
 b=WD45N7RVp/HNPFqq8CNkew1gNB0rnS6XUFpTQH7a997+5ywkbPsPzjW/FxL1sBDkZd
 2EPjiCXHa2C7EkEKOitWFtC3M/N9mUCMf39pGCdi/TghPSZ1LpXXATw8zv42v9nSTbLR
 JsRr+1IUCqjPTCtosA3QhKagbgHvFQiTBNKIVM465jmb95Oto/2PlzDXcv34gNtRBOBA
 C9O0Jmx/chxVKdccmhB6bqlhq4PMdOI4g7jS0OlaPA4RFMAsQpPZXKe8vkJs6EvvflQn
 VPOhHdOaiWwc7WDyYL60K7hGBtVrsAnTTy5I7R0cSZoZsSL38EXrwhQyOzJMjDtgE/ib
 AgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768905450; x=1769510250;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I9vLBXNMAjUczujnOT8nZXcD9eSaIcT1JipxISSliZs=;
 b=hQcgNueUL+Z/yLtJRQn2FocumUYX4dHUcz+JOHYJkRl98AnpbSm1mMA9wBBs2j8PDU
 /JZX+r1MU5Bs7z4XfbatE8t9BmFEUHM5+OEXv50aGNcdrgpYMsq2BUld6otGe3Xkomeh
 vwULYAx32g8X+nTPxU9a62rdWCun5ypny67bb/gAX2kEafRjVWof4mAztU5msk9tE+ev
 pONs90R00/czIRG36x0BWeC+m7X2zvQW2v7pckTTcx4xRDYVcVCd1GdZzNJKU5TFkbQS
 IfAD05kvB/K3KFxXCQx5/rze0vw89GbfkLkEAd/rYI4ltZ2xqxhboo0WxoJ9dDR2UEbo
 aKWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbxKhb1XOpf/6lHY6MP9+aQc14z5DNOOOZrW9F/us4ZHUaMXakYgKYHhv4rj5ccve50nW1TsqtabQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypCI8bR2xn7o5MdRUd6DVX3dQmfNjs/bqho66HBqdK6vm8Hv2h
 iuq+Cd6/PrDgKoH+tN6EN4isPJgLhMBAq03Z5TZF1ozR0/meE9bN4Dc+RtGeKA6aOGDhAfEpqia
 SDrYq+ed71c1VzVmCTA==
X-Received: from wmqe20.prod.google.com ([2002:a05:600c:4e54:b0:479:36b0:ff54])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:470d:b0:477:9e0c:f59 with SMTP id
 5b1f17b1804b1-4801e530e35mr174624385e9.2.1768905449791; 
 Tue, 20 Jan 2026 02:37:29 -0800 (PST)
Date: Tue, 20 Jan 2026 10:37:28 +0000
In-Reply-To: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
Mime-Version: 1.0
References: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
Message-ID: <aW9a6KII98eI55HK@google.com>
Subject: Re: [PATCH 0/4] rust: Add ARef support for work items
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Thu, Jan 15, 2026 at 09:35:56PM -0300, Daniel Almeida wrote:
> This series adds ARef<T> support for both regular and delayed work items. 
> 
> - Patches 1 and 3 actually implement the support in workqueue.rs
> - Patches 2 and 4 adds a corresponding implementation in drm::Device that
>   dispatches the calls to the underlying T::Data.
> 
> This was tested on Tyr, and is actually needed in order to obtain a
> &drm::Device when handling work items. This is then needed in order to
> allocate GEM objects inside the work handler that processes the tiler OOM
> (out of memory) events. The current series sets the stage so that the above
> is possible in the future.
> 
> This is currently based on v6.19-rc5. I hope we can land all four commits
> on a single tree, but otherwise let me know whether I should split the
> workqueue.rs changes from the drm::Device ones and rebase accordingly.

Please send a new version that CCs workqueue maintainers.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>


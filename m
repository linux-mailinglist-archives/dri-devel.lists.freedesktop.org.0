Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 008D2C4593F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466EA10E366;
	Mon, 10 Nov 2025 09:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="rtAR70oB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13E110E366
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:16:56 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-47113538d8cso15484555e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 01:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762766215; x=1763371015;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8DCz0mrUxydHy6qjTOATBcYgT6UozKbC5ALC3SvZaJg=;
 b=rtAR70oBSeI92hPPk6M3V0CMyJ9eT+R2QgS6Nr5lsjRZcW2R7xIlEoxKLG/j4MDUIF
 LU9dY32VmI6tJ4jV7RLCFp3VktaePtYtz+p5pQF3yllanKrYC/sT0XwKOZFzBJ9IkR8U
 FZ4CuJWwD515Nmq15fsLxMmp7VTLb4dGT52/AiPaeusLW3U8gBwruC7vC5XcNPSmr5og
 aHv940e1LP+ECqEIbBrBRm+9dyEFIZJid7VbB7T7A7Tya/gS9bgSwFTcjplmcRdLKzvL
 u7aJOTmmBPW3IsX0WvnM7Z00rN2PeHLx4c7j8VXxVnltBWgOCNj/0QVMBROpH/n1nukv
 zkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762766215; x=1763371015;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8DCz0mrUxydHy6qjTOATBcYgT6UozKbC5ALC3SvZaJg=;
 b=ExavrJFRaj1UIovHHQ6qulesYDr+PY3jeAz1TXteSME2fpGqQQ86JugEIRPDqt84HA
 Fv15VPZafFcyxuyXRP7wbP8EhczpuMvytlNSe1enz9YGV4nwevq/7CashFjgNbfUGXOT
 eeaHNtBN77gVioGa9moYbZOf4O9TGwj94l82Agl0ePqICLIljW4WKZtNh7AcNH3c4y3K
 +hWAtDKUCGbwYgJycPyFvIg1kdeFWOUhitel82iLYqnLw5UO1EwILYH9RYZCiNAqp8tG
 TokLva2gR7xEw39JF/N94IyxB9SvQ6O5ZpruSzASHx3BhgE7dTrpNp+mwJhRXegciFh9
 DM6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfDSDTbw4FUUaajwLP2qXngBLHr1fq7uc9yVpIrrqSi+4zKEXlLX0sLJI29ah/N4OOdEVbRKf1uiA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw26NgulxMI5vv1fbiaD33uE1szE58n/2/MyFtMzgl53rBgrXir
 7/Ez/ir6tNUSgRtbyH+OlCsxkcOZNllEvBi3hiqVRZNR0gGcGWlmljz6TZhxGfWIyywbPQpzxxy
 ExPRuKp/XBpzcsj1y7Q==
X-Google-Smtp-Source: AGHT+IHJ0Wfc0oAyeXl3CzhYOpmTVuUwWYrw7MhcHKSK7WmFvUCgdXgPO3lw0ZhkywgHCWYQIR+SztdrcuiXOf0=
X-Received: from wmbjj18.prod.google.com
 ([2002:a05:600c:6a12:b0:46f:aa50:d716])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc7:b0:46e:506b:20c5 with SMTP id
 5b1f17b1804b1-477732834e3mr43391405e9.26.1762766215290; 
 Mon, 10 Nov 2025 01:16:55 -0800 (PST)
Date: Mon, 10 Nov 2025 09:16:54 +0000
In-Reply-To: <20251107202603.465932-1-lyude@redhat.com>
Mime-Version: 1.0
References: <20251107202603.465932-1-lyude@redhat.com>
Message-ID: <aRGthqv1efOU3Ic_@google.com>
Subject: Re: [PATCH] rust/drm/gem: Fix missing header in `Object` rustdoc
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, 
 Asahi Lina <lina+kernel@asahilina.net>
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

On Fri, Nov 07, 2025 at 03:25:56PM -0500, Lyude Paul wrote:
> Invariants should be prefixed with a # to turn it into a header.
> 
> There are no functional changes in this patch.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Applied to drm-rust-next. Thanks!

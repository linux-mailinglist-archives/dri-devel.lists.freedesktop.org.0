Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A79AD2521
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 19:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0465C10E40E;
	Mon,  9 Jun 2025 17:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F0zt/v0D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D0810E425;
 Mon,  9 Jun 2025 17:40:09 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-235248ba788so5247515ad.0; 
 Mon, 09 Jun 2025 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749490809; x=1750095609; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGeznkUaKCcPLr7t1/y1lEo9GbVM0sYWdQrm6riBKNU=;
 b=F0zt/v0D6nePwGzXRrjF875ibVrR8dJKyznvjSubOuYuvdjXHNfk2HBwMSmqVlnnS2
 3GFib1aQipy128j3owTEQ0IuuBOrSkIPOaDWOBZNiHz/SukObtU03XY9d1SdddlLNFJi
 7IvkI5JN5tvAknHBIQB+DAVEI7OGSkMuN4TWtBdErvmaHDJPuFsoZtur/H/m1HNqkiaR
 1JSW1IOGWyRFczsi5a+v1LEk7seJ/ZEAk5o7dEOyzDIExgFZWuUqSljF+XtLmCaiH2Xe
 JDA43mlXrstJke4TkuvrDLDnyBXudR1NZ9GzA09TPIiICRAMNckGNINEA+quh5mrBdbo
 9wDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749490809; x=1750095609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xGeznkUaKCcPLr7t1/y1lEo9GbVM0sYWdQrm6riBKNU=;
 b=PeDTAYrxZtU2nocC60BoK+1iiZIxhZrD1QlWJtDSY7lntOgXmy2lwq1FxnZUgHM0je
 cG294qX60Ph42j+qO5wmG7q2amRUfpdxAzNmYUZMHrANnorxvF8cGn2oCxfp4HRC9YLK
 wg5rt+ErmUt+FU3EznioXogLiY0JwPmwfZzAHMu5ydEDy1rCBg8nyGbmKisXAO6dCA8V
 spLqblMhxYAGN8wL/N7WnX3CTk8CH7KyWiVV/Vd1ueZmmCwThM9hPbMDXEZ6HsEqUmV8
 oiP6iwDnByxspOr7Iwd+nJz8mlcejl6+/bWPLNcrQn6qmvJoj74XghJFn5mLtubEYZnL
 e/Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc8Cl9kB5Mb4PnADeD2X5td6+YjojHrCqU7PpYHmWPS1TcGka+YHyiJZwKAYuzqu9hO7IK51Vb1ZY=@lists.freedesktop.org,
 AJvYcCWqpLxU4BpTkTRdymKMs04iI8r8fD1blFKkYyIP3sM5hBSk6IRP1z2fBqyWnaaDulTsrPQaiVFuSA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnvKz032uKDwOwGVoffmlLxlr63yiyu4f/cuiL4bFpktRYsVZu
 hlF5yzmXIvUrpiYdqeqkC3COqTTPKu915nNbeq3L2NL1ahTKHRJDr+XTLpuR+Vd0jQl9Ghpmgde
 mQbh7IYg7v17fCsciTJAemzJZPk7DkQQ=
X-Gm-Gg: ASbGnctTXHxNg3NiriuOOZBpOtBg91y35MYeP5pTMITjZOq9GVottQTIx5K5JNzqTdF
 S/e5ZchtVgk6PKlimXI5P3ulCRNv4uVh2ZYGGZ18QLyEb261WrzHGqQT2v5bjV6VK3z6OzY+nIF
 z5wQHV60sk0T2VcKDArHTRO4Ra3anzX2DLluQYMbuAd0c=
X-Google-Smtp-Source: AGHT+IFThlC3n9covTxeLg3gK9Kv9OvvHHRuR1HhvfFCCaCGVX93rTuPcJWuuY6ebE2DHabcjVjjFluviWfrbtz9GnY=
X-Received: by 2002:a17:903:2348:b0:235:ed02:2866 with SMTP id
 d9443c01a7336-23601d2278emr67580725ad.4.1749490809234; Mon, 09 Jun 2025
 10:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
In-Reply-To: <20250609122200.179307-1-trintaeoitogc@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Jun 2025 19:39:57 +0200
X-Gm-Features: AX0GCFt_1gEBX3323QkaeUgTuypBv0Rlai8JsNNbMvX6Wk8PlfCLW1weXoSbCmI
Message-ID: <CANiq72==Xybm956Ete95e3YH7MTresNd3szxLg7GdzvhW1O+jg@mail.gmail.com>
Subject: Re: [PATCH] rust: module: remove deprecated author key
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: rafael@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, mcgrof@kernel.org,
 russ.weight@linux.dev, ojeda@kernel.org, alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu, leitao@debian.org, 
 david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
 fujita.tomonori@gmail.com, tamird@gmail.com, igor.korotin.linux@gmail.com, 
 anisse@astier.eu, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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

On Mon, Jun 9, 2025 at 2:22=E2=80=AFPM Guilherme Giacomo Simoes
<trintaeoitogc@gmail.com> wrote:
>
> Now that all in-tree modules have migrated to `authors`, remove:

Nit: I would have said "most modules", since we have new/remaining
ones (no need for a new version for this).

I think this patch is OK -- we could wait to do this more cycles, but
if we are doing it, then probably the sooner we do it, the simpler.

>  drivers/cpufreq/rcpufreq_dt.rs        | 2 +-
>  drivers/gpu/drm/nova/nova.rs          | 2 +-
>  drivers/gpu/nova-core/nova_core.rs    | 2 +-
>  rust/kernel/firmware.rs               | 2 +-
>  samples/rust/rust_configfs.rs         | 2 +-
>  samples/rust/rust_driver_auxiliary.rs | 2 +-

Andreas, Danilo, Greg, Viresh: if nobody is against it, I will apply
it this cycle. Acked-by's for your bits appreciated, of course.

Thanks!

Cheers,
Miguel

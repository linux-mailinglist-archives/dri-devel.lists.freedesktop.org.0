Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A161FAD330F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 12:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B22210E4DB;
	Tue, 10 Jun 2025 10:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mKw9RiuE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1065A10E4DF;
 Tue, 10 Jun 2025 10:03:48 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-234b9b01a76so4822505ad.3; 
 Tue, 10 Jun 2025 03:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749549827; x=1750154627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tTJU7HrJ6ej1SJiEBa65fcjJmrmv7m2MmkFfBg64efA=;
 b=mKw9RiuEqK07lOgFynWQZZ2j+YfAXnLa1nzxk84e+JTx/wRufmLOmxLL7W+Hlr3Ova
 Ph3+9ess/PSdFk1pmFIkYTrOwoknXBe8sUx1pHrUQMUmMWlcio+5cT52B0s0sv+fB89e
 Uws/VI4ybSYjtZBsYADT2n2x3aPeRvRIWX+lt9LW6phQVuDwxKtnsl2A9ZTdT0GshksR
 +P8nZykWwx6cnBhXTjc10/fpyVIJQAAsy8kxPi9uLkqUvunh4/0SBJonOJc6aD6/Ibfy
 ZHtWThnbJybcZ/HqwdHGtOTN2j6IrlO+ooNVvgEP4neQv+LwLFfcKE6mRgXrd0cKkYjl
 pTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749549827; x=1750154627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tTJU7HrJ6ej1SJiEBa65fcjJmrmv7m2MmkFfBg64efA=;
 b=smyPrYD31JcTLSwHazK2Szou7KWHkdETPVOpyOHLWavMU88CVG+khZLGjAQ/3DnF0T
 NePf+V80vgKU31Tl7tbuQK3E6CK2kVf0LdLj8MTZzYW7d1k/aJTaBq/sUZ4wvAGO+VKv
 sBTwcHW1y3mQQSR+8hZ5s2Vd0Hv+LMv1vAcB1NhWkCHes6DBmzH2squfOuCCBZ1SwFcQ
 R6g475Ihl338gANPhxXEtE+4mC35Fa6MqkeYZfDLxCRaTFo/mqku5svNmV7TNizJ4c0i
 wb8Rxu2OumsqImb2pXnPuEbCLuhCGK6hI0MfVQIrFkBF9DlkLx4cY/WmNZVQP9xu4hRr
 IIBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ5XskjvX/YZX8epzvc2ALKWuIJpoSERIOAsDSDxsM8zhl85Alffbq4xF6qtpgfmwCuFPJFzXgIw==@lists.freedesktop.org,
 AJvYcCWzhFSishHNcf7pDiTxJx0GKsU4P8sm4ad/L59h6h0hkF6lxSVVxmzaEM32joQzY4bz7+i82n3f39E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXLn+qu5o89fUSYaGPp9IMLn8Ka2ABfsRi7kAnBWatbFMnNQqo
 ztSmn6TQbnnhF7D2P3A29x0G1a2s8rKS1ljw5H2494v+lS/81rtFDYPb6c+/yDxlLC56Mk2xfsW
 ttzVrDTqzlH1LQuHVhzER0y4lT5r52IA=
X-Gm-Gg: ASbGnctl/N587Yz5fXGlzoxmz5HvAL180bjcDMMLW6/Cr2revgjSs9oPh9Hf/gu1SCW
 NPRCmWKYfYzWZdhNAgkKEIfFd+aBXPa8YT7HxIseACtGZcdy6Nu4YZkVkpQr0ICsgvnAJZS2UKq
 iwrVoxoqNihpeow+YygiAkTv1kS1ZkUXb60YK4yGs0QrM=
X-Google-Smtp-Source: AGHT+IFl3QRS1ASxD5Nom/WmbJxg88zSGy1MBXMnBBS0GH7xlD4TWPEw8AfHbd8l7rkvR87H+MsMI8FvbSOGlFGFsG8=
X-Received: by 2002:a17:90b:4f8f:b0:311:488:f506 with SMTP id
 98e67ed59e1d1-3134753c5d1mr8776699a91.6.1749549827474; Tue, 10 Jun 2025
 03:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
 <DAIQ9342ZFYD.3VQVI80A18HKX@kernel.org>
In-Reply-To: <DAIQ9342ZFYD.3VQVI80A18HKX@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 12:03:35 +0200
X-Gm-Features: AX0GCFsqB3V8oX6wtHSUpzU2MNL8wo_FwhFMAyLhaEv4LKWmFGOaZ6ak2XtPuK0
Message-ID: <CANiq72kC1j-kprAQ5WU0QVV_zhyKfDPJ_M5E9xZ+8+fxt4R6qQ@mail.gmail.com>
Subject: Re: [PATCH] rust: module: remove deprecated author key
To: Benno Lossin <lossin@kernel.org>
Cc: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, 
 dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, mcgrof@kernel.org, 
 russ.weight@linux.dev, ojeda@kernel.org, alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 leitao@debian.org, gregkh@linuxfoundation.org, david.m.ertman@intel.com, 
 ira.weiny@intel.com, leon@kernel.org, fujita.tomonori@gmail.com, 
 tamird@gmail.com, igor.korotin.linux@gmail.com, walmeida@microsoft.com, 
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

On Tue, Jun 10, 2025 at 10:58=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> Unrelated to this change, I think we should add email addresses to
> people in authors. Possibly enforce it by scanning each author element
> and checking if there is an email address.

Sounds good to me, but I am not sure if it is possible in all cases.

At least looking at C, there are company names too.

I even saw a URL...

Cheers,
Miguel

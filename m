Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9115BB562F1
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 22:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809E910E04A;
	Sat, 13 Sep 2025 20:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dt1bBk3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C863A10E04A
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Sep 2025 20:37:46 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-25c99c2aa12so3262515ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Sep 2025 13:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757795866; x=1758400666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mATTaO6ztWHtL31tz3fa3XmKHBNOJGaadXz3sI1bEqM=;
 b=dt1bBk3yxeEBrMzM4l0Wa0qaKBeaAQFf0710pDxaM+kw7t5TV/bNhKawqfTt9I/oUl
 3/Z9+epJqujrXj5MlMWJ0j6slxMdbqGp0CxvPbWwnYusmRCHlfHGCOZ9g58N2mKsQDmJ
 i6uS2aW9e3oqyr6eQXiZH+p1mdv4uDIjC2ZzHm2nMsNBteIqBmweeQ5V80ejF2LlSXs1
 9UogW710RhMpZPqero/Pkfwbc+8m0mWTGh18iN47bkeIh/hxMsg0mcMhhrXHjBQYkpGP
 qgtLMTk9uBSXqqycu+d37IPccVkFxjJD5/NDrrE29qy7TQ0e9ehAfTWf09OAX1+Xhnm7
 JNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757795866; x=1758400666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mATTaO6ztWHtL31tz3fa3XmKHBNOJGaadXz3sI1bEqM=;
 b=YqnAtYwsocUhcW8CNX4vLJITWTLILe72FSZpmzy1d2VDUuBDuoPKAcrH7F++5hzRxP
 vg65O9q8/r/IBPQriOXH4E9QogxUXyT/CLkoefAh8tA/KOq7/i5nPHPc3sfID7kR69At
 hKeFcPNs6cpL1zPPM/2BcriShoVF7X6AUKyzsqoesUFLkD2RJzlnFvqwt0OqiiWmiVCs
 FckYL+NsJjmGII74O8xI/Uz6Nc+0+SXS5ywb49rjlQ24WTjGEsgcRuXJK3ignhu1nyUZ
 ilD+iJhYnQuFAfIgm3+Y0PCoP+dSZSs5y9kJHbiToBFVQTOqI79+zfsGlOboj4q32u9+
 oVrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX98UqY9PwB7ZTn1mCHllUEXYtVS++xoEMpcVXmInrkILa7yKl9kg2WXQyV2EYJaCbuYk0qMNSRN94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4xvrjs8FDHKA0JnSIpDESUHtWVSfaOdMBn5aIc69+3o8lkgek
 QsmwiPVtA/JAGJtX6qBFhMcxX4X0exkaIHXGJNHbAI01rt9QIgEcfC82swZVJJ8ccaOxNpKfViH
 zJFQOFVtFtl7FdVphJMAul3wmCEHFQqI=
X-Gm-Gg: ASbGnct2yF7ubnNBHiW3ptgCJaPgKuaEqvvj8uupvSbYQIY8iszaTIuZKacxtbVpgNJ
 rpKMUZUXYSJOFdJqGiiThSjGYvACdayCm7rEWhkmNy7IrNNu3Gu0gzbB/yzJYWKSybXzkVz3EmR
 Z7mZlqjdDTDI4sXiBnVFXFByL7wSPaxeqJ6itOiklZ/vZ3O0sbjo52NArfI5iLbKFk+9Feu4ESn
 Zx7oQRJzIu6zncmYWmTfJP7YzxWrCmWZn+PDRn2SBqEOyBTXyYrLyKJyltyut0gEmRDNf1scwg9
 nW7PKsIkrhp/R/VOrjOEeAk7rzEvfWHMcfJR
X-Google-Smtp-Source: AGHT+IHrVkKejELNksEXUkmKRimQGTe3Ad5+7htwK4BUNxGJGqqmJCijjdcznEeh8fuxUViY+RIMf0xL/mdPT29M8js=
X-Received: by 2002:a17:902:ce87:b0:261:500a:5742 with SMTP id
 d9443c01a7336-261500a594fmr14779775ad.10.1757795866176; Sat, 13 Sep 2025
 13:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com> <20250913010226.GA1478480@joelbox2>
 <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org> <20250913171357.GA1551194@joelbox2>
In-Reply-To: <20250913171357.GA1551194@joelbox2>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Sep 2025 22:37:34 +0200
X-Gm-Features: AS18NWCCjEi2nGimzvlQTTclneuWdDWNwA3S6j0YpJVAggEoL-8q-kmCadYD0Hg
Message-ID: <CANiq72n50MaMXeWdwvVOEQd3YEHbDRqeeRzbdY8hPnePtq-hnw@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Sat, Sep 13, 2025 at 7:14=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> I am not alone in that opinion.

Hmm... I am not sure how to read this.

> This should be first-class in a (systems) language, built into
> the language itself?

I would suggest taking a look at our website and the links there (like
issue #2) -- what we are doing upstream Rust is documented.

(Danilo gave you a direct link, but I mention it this way because
there are a lot of things going on, and it is worth a look and perhaps
you may find something interesting you could help with).

> except to satisfy paranoia

Using unsafe code everywhere (or introducing unsoundness or UB for
convenience) would defeat much of the Rust for Linux exercise.

Cheers,
Miguel

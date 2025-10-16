Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD966BE538B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 21:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E024910E346;
	Thu, 16 Oct 2025 19:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iysq2aAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AADA10EA5E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 19:22:28 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-29094f23eedso1633635ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 12:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760642548; x=1761247348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBABBnxn8fN9AsR0d75e1hIi7H9rcgMvSSTa+zi6yEc=;
 b=Iysq2aAO8o7hf6m4+gG9HK4rhSyfv2uq69jLxvMAwi1GtLn8seXdWuL9VGfGvZEyLJ
 Lu45t9QbglWMmgI53v+ePdCz3uqoNycqne9RnkOf4JYKG3kj1VRR2b0IqWLjKfmHi1DZ
 bkAEuQzuGk/DXvU5i7jxDOrf3/MCbcoEaOnr3kx9qoSH8WYtoaI/7yZv65Wb3DohE4hm
 AQLEAjLeD8Lz1fFaWv5nqQX05sxJbrrQsbWVgctYMmHHNqn9Udxug2qJAnC0WJzRRgTz
 FGRptGuv5q+X8KIaWjbtC1JyILtnWJmEswxkk+M8pb4nvEcC0lIawNOnNzXOTQMQd96+
 AT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760642548; x=1761247348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wBABBnxn8fN9AsR0d75e1hIi7H9rcgMvSSTa+zi6yEc=;
 b=aobDG26HiMsAifyXcEzKoF8wPl07KTaMiZSvk5B3OBPMHV5gj9KRt/dXNpOn6YZhro
 bH8iGEJI7L2q9BwPiGHLq9lCB97ePQtb3j9LJipo1Mzxcct0LNr3Dmh+psci4GLGFYxr
 6K+zwvTk9PE+yrtvz5dvZTsHg9zqcIPzX3/V32ysMm+uSalDf8laSYKwofFl3g92Mu4s
 NwXJgp3hlkDhrPVNvy2pEL/ymdkQPVFyXQn521XbmjsUBH5t8x0R2KjoDkl/YPdQEvaD
 6Oy3OXp9pN3hLJeC0UbFICNufYre1UhB9KwvwNRembaibOtkx//CXWiFzC3fRI6eD6dR
 IOsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzdf6/0QDZ1ryM83hpv73DrwduBKcrZffFN4Vt23RzTeVHNI6IJxkg5ld7CPANndl/Z/ebOCcNItQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAB7IeiNLnqJ0dhFnkyWYHPlnN7wZqA2sXplBylk4J7tYeLvQL
 UdEP4LWoCYeQD5ir/E3JAicT1aaivk+IpFh+ru1ev2s7RUC1u6hLm1A/1N7G9e0DxhPSG3Sydgm
 LVHf1I0llg6s/F3YmD6RF5oor+iUr/ZQ=
X-Gm-Gg: ASbGncttMIz1Ky3fihLfuSB+KsRnP0i/h2NFgN9Mym31e8SBDHQ7gHSQzkcr2Sds2dg
 uL16h4wBhboQPEXMajlxLWRoksoZQNhzyjiZqF3mCdfsMw3SLhBwrl/9gVE4L14RUHKbzy4vEEz
 gnlrUCSp2clazG6Obgf8bC2Ke5CHtlSjzKAWgFqZiullb/XAxKnVHE45tULUYjLow4oNoenZwIs
 7yjrfKcNRBVPQ6m8C1VsUxaijOsltKSVMelCeWVwJVn5KNc5+1O1nQpKsPoEN1DxVgXJyxqCuHQ
 vOlO06dgtbvEMN+QTygO/t9AuevNlTSQLxX6+i2ce4L2Cxj4CyaliwezBvnzyGyMsWzKcaUTLP+
 2aCtngxx7cUSpiQ==
X-Google-Smtp-Source: AGHT+IHjy8KjEMzI/k73gqsgnhmTui+XTn/RvV7qTycBPo1XmiJr5yhiR0piRHANoQ1JkvBfjCgn9II2uzdLiDAifMg=
X-Received: by 2002:a17:902:eccd:b0:290:ccf2:9371 with SMTP id
 d9443c01a7336-290ccf29388mr7338615ad.0.1760642547522; Thu, 16 Oct 2025
 12:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-7-apopple@nvidia.com>
 <DDJJ4Y320YEC.O6QIUDDLFVOH@nvidia.com>
In-Reply-To: <DDJJ4Y320YEC.O6QIUDDLFVOH@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Oct 2025 21:22:15 +0200
X-Gm-Features: AS18NWDEkVfvPPz-PXmo2P-iezhkJ_4yR77lvhxdIOXjaj9vZ-OB3fMu7gnX7yo
Message-ID: <CANiq72kWof2RL93s5L7t52ax+G65iBrOnfMa3XrqC+LgSO49=Q@mail.gmail.com>
Subject: Re: [PATCH v5 06/14] gpu: nova-core: Add GSP command queue bindings
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Thu, Oct 16, 2025 at 8:24=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> There are lots of unused warnings when building on this commit. I know
> we don't like big patches, but since this is semantically related to the
> next one and the two touch different files anyway, how about merging
> them? IMHO this is preferable to adding lots of `#[expect(unused)]` that
> we are going to remove right after.
>
> If you have been told to split in a previous version, let's just add a
> the `#[expect(unused)]`  where needed.

A possible middle-ground is to add the `expect` in a "more global"
position, e.g. at the top, so that it is a single line change. I think
that is fine as long as it is removed right after.

Thanks!

Cheers,
Miguel

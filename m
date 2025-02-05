Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C178A28E77
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 15:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0423710E064;
	Wed,  5 Feb 2025 14:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M+tAoWu/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F25D10E064;
 Wed,  5 Feb 2025 14:13:26 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2f9cf019884so338890a91.0; 
 Wed, 05 Feb 2025 06:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738764806; x=1739369606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y9bBxD6OlYG3QN3t6eEdPcfSBfOJrPnlO3VouFKzOcs=;
 b=M+tAoWu/0wWllQIxDpWRZO8COJjz7xHvS9niJ7mzWqJRGgYusPYexyou5uusrxHoSg
 dFApz41x8iBWQgCBtyBSiTUo9JPfgp+V0ZpZv9K+juG00HFqJdWXVfNGGi9rtml4NYaT
 VHClEerB6EyluJsooFcMhjvz+FFYQ2FnmjAC2oGGF1ax0DWK8LHFHM3k6PV3A7Ug6Dlq
 zmvEU+De87O13SkgP9sFD7qRAyv+k5DkniTf6a9TWaxUVtq2P2SET0PzAMfPowSSa2VK
 tfjLxOOrkULvhCeaSd7TK9SVDEmoxI2dN4UwOSWMA4Ry8xKh5g0iM9CVDxwMJKPlASXd
 M/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738764806; x=1739369606;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y9bBxD6OlYG3QN3t6eEdPcfSBfOJrPnlO3VouFKzOcs=;
 b=Dlhy90a5KRl3ib6tBIZ4sUM+grSJ5as7hMOOKe4W8IcId/B/Z3NxBt2O0We7t1YEmK
 g8n58kvi1EgKEYVab0GSuEmt386Jh9rZtV0EmOBMu9IrSOpjGZEyqaPhlxvUv3MRCfvk
 mRl8X7gdNfUTpCrZxoLN1qRlRDON8gu8Z9LbqiJHASu2zqBVLnroNiDMa8LOsFqIzPZB
 mZ5Vxq3U2Ev973muKL/x5dPCbdkwcTW06UdI5WAl0zweH3kl6KcHDP7aVKJut7nNJq1e
 u45C7ZoF1URincroCUZPZ3KSzWoWb6HxmtGSsOLHXnbem4cjjrTcH9Ccx3iW672TXtOW
 eCGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMX6mugx4toGnmmx34glZIPukARWVXuu1JI6ouvH9DyXTqD/BAPeFAXYWuC1Pi14BaOVte/sEF+A==@lists.freedesktop.org,
 AJvYcCVbkRfoTX+y/7usq4c14ddHn+04S9CntqWSSZcqBIhAh8Yr/+JAuKTRUX5VXJ908bAF9kPRS/mJzas=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGn51LWGzSAWqN6FySa0jhAuxTP0dRMBGYs8IaSgKM3rAiohdy
 dIW3jprxTembFtXH/ul4oeoTmz4jtJnHj7GElZd9djs9y01yCjzM4SHkuQ0DfqXPf8tR51zTelw
 ecQ8a+xIgiD0+D3pJBe6D0SZLEvo=
X-Gm-Gg: ASbGncuodu7ODtqzMNLmzbqBDYNrNHT3S7t3o2lJpU4Rb+27UaUtk+blH2VayWaDN9I
 mTvKNf+iJg52QEL7jJnlTMuyMtwW565AtgEeME5U44WMdzH0SFsh/2xio5o15DyLRWIZsSS/4
X-Google-Smtp-Source: AGHT+IF4hKXRVLLC6unmAjENx+zZEHsy43XxaM92zW4ScuMwkiqk1/7Tpba6AbMwT3b4dDa6OhFd6Tj7HQNu4hPCPUs=
X-Received: by 2002:a17:90b:4f4b:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-2f9e06b216cmr1912666a91.0.1738764805841; Wed, 05 Feb 2025
 06:13:25 -0800 (PST)
MIME-Version: 1.0
References: <20250204190400.2550-1-dakr@kernel.org>
 <20250204190400.2550-2-dakr@kernel.org>
 <20250205155646.00003c2f@nvidia.com>
In-Reply-To: <20250205155646.00003c2f@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Feb 2025 15:13:12 +0100
X-Gm-Features: AWEUYZkGVXHP4hrFG-5_ihud3NGINPm5TNS2CNAPtoXmocfUh6RQ24GiptUl5w0
Message-ID: <CANiq72mxKhCudmRaS=gwnC=gjkCLMhZcC2ZpfzKKaGX1Hivz9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add initial documentation
To: Zhi Wang <zhiw@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com, simona@ffwll.ch,
 corbet@lwn.net, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, cjia@nvidia.com, 
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com, ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
 aliceryhl@google.com, tmgross@umich.edu, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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

On Wed, Feb 5, 2025 at 2:57=E2=80=AFPM Zhi Wang <zhiw@nvidia.com> wrote:
>
> It would be also helpful to make the process explicit. E.g. sharing your
> command lines used to checking the patches. So folks can align with the
> expected outcome, e.g. command line parameters.

These two guidelines (and generally the few others above) are intended
to apply to all Rust code in the kernel (i.e. not just `rust/`) --
their command lines are mentioned in `Documentation/rust/`. We could
add a note to make that clearer if that helps. So I would suggest
avoiding repetition here by referencing those.

We also mention it in our "Subsystem Profile document" at
https://rust-for-linux.com/contributing#submit-checklist-addendum.

> > +The availability of proper documentation is essential in terms of scal=
ability,
> > +accessability for new contributors and maintainability of a project in=
 general,

Typo: accessibility?

Cheers,
Miguel

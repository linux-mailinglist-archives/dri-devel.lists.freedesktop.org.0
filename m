Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D173FB043CA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEAD10E4BC;
	Mon, 14 Jul 2025 15:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MYSnDpkf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A70610E4BC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:28:08 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-32ac42bb4e4so36514081fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 08:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752506887; x=1753111687; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oc+GlE+Ii/Y1/zyiLxV403jXwmHI4Vq7Wn9/5LCARxQ=;
 b=MYSnDpkfKU8eChN1yfylrQhgw2W92emBX/O1jRwEVd8f/ri1IqSh5TPwS8bOzvcWbX
 aSH+u2ABDqtiz8ncgr53UGGhF4Y0e3wAmGRPAhAMB+hX0tLdTY+99SD+XSX0QjBRmrZi
 efpSpP+QVNhG397Qq4DQnKITqcO/Su6yGyVYRkWjUXcRnLC9SwLCT3AgcTR9Myi5jhBo
 HdhflsEMYkzYbN2KnhLvNlj+jID6d+yHZQfpGS/e4ZOcss0LQKKKLU8RhA3BzHmCKyYa
 A0xN1G/HGAE685o5muSzeMC+/h12Px28BZK0duFP85eQcCfvsnBMsZCu80dIVZwfPNQP
 b/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752506887; x=1753111687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oc+GlE+Ii/Y1/zyiLxV403jXwmHI4Vq7Wn9/5LCARxQ=;
 b=SYekWjsa7I1iheZrElftFyMDtLTFy0cXQ1lFQLrBV/j8htanKz/R9Q8bMvW7WQKYkC
 4+rFxkixyWKnrmpyNakhXlAX63xPfzxXcNWipAX4miUgg5YB5hCFftepJpv013TutTmx
 he1seYlZRvRsT+5/2T4X6yE+hLWgs0mOUz/iFnGhMXoaryXylQT57tyqUel2OGgNAtsc
 Zog4K6YIR5xnwELywQUeQchVjBNpO8Z18KF/WMlfVixShmIY4SVCMnfiTWdo9X7BDV4p
 zO+fNwIzqXAN60bjgXsRG/s1AgfOJWT6coPx0xRA4dQV3pKswlahxeboSMFJcQ5R3OwB
 GiIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX584Ijsgb7gSzGsFTaFdGFEp/qq3nHXkTivX0p/qvgtB3rJnKjpYDGbDAZDYG8DSQ5pY6UJtSz4QE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9OnZy9OcLZdSfQBTx7vNemLMSC6TP7FWn43+kADV+oUW6MHja
 BYLCVYHW00Nk8BP9OmJCXyvZE2EkVb2vvmsQFuZy/VPDRRk8RcdOyrqf41Bbzv7mQkO68JVaBOZ
 +J2D+cXabEIkSulDpg8tS06a/65Qce7k=
X-Gm-Gg: ASbGncsy6pefLjXkHNQvvigNQAZk4TGfjxv6vWE+osL1QVTwBMitEPFi0vFfvrn4IvC
 yWvnDDN9v6potFgCxXlgpHJCax2EKqTq3KzP8fqBiMcHb3Ca8s9JhBT1nbp5MLAXZZ8L5aYCxjK
 CFiK/p0Rij+3hwEpD7vlO2bm04D00wxeFo92xCHj3uQEwIX3ALlPtIVE+V3DBbkyuHj+nqiNULG
 zuVOIxCioa2ftuZvS1EHIpXcIA289RYxkY+k747NA==
X-Google-Smtp-Source: AGHT+IH+F8scuE37tUd3Pg2ae8pcuxAEv4ojDDepRKjbKvYeGMh+F2C6iR06+KNOVOtz/FNk6yomF9YDFaXHlblFUCU=
X-Received: by 2002:a05:651c:1108:10b0:32a:77a3:8781 with SMTP id
 38308e7fff4ca-3305344519fmr27998491fa.30.1752506886586; Mon, 14 Jul 2025
 08:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
 <20250709-core-cstr-fanout-1-v1-1-fd793b3e58a2@gmail.com>
 <DBBQE3GJ0CHT.5PEF7RLS6C33@kernel.org>
 <CAJ-ks9=ZHtzeyyFSZaVuA1t-3C8-hc40n6r8qFWxn628qT-OeA@mail.gmail.com>
 <CANiq72kyQQMutGDkHH=McRQens+V+wkHLpiSfivmnAwwgXE62w@mail.gmail.com>
In-Reply-To: <CANiq72kyQQMutGDkHH=McRQens+V+wkHLpiSfivmnAwwgXE62w@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 14 Jul 2025 11:27:30 -0400
X-Gm-Features: Ac12FXy_EgfuBW5UCKV_g6NQQc-Ao21V9VhJ3CJtjS90O4a7j1zHA01rM8fcK4c
Message-ID: <CAJ-ks9kzrihJ7Jb8kAp0LpbPCfdouDQdFK06AHN3xi9pXNWZ9w@mail.gmail.com>
Subject: Re: [PATCH 01/10] gpu: nova-core: use `core::ffi::CStr` method names
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>
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

On Mon, Jul 14, 2025 at 11:18=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jul 14, 2025 at 2:35=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > How should I respin this one? the subject should be drm/panic, I think.
>
> I would mimic what the previous commits did, i.e. drm/panic indeed.
>
> (If I happen to pick it up before a resend, I could fix it on my side)

Yep, that's what I was going to do - but do I resend the whole series,
or somehow just this patch?

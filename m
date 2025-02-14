Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF6FA358A7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 09:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DAF10E282;
	Fri, 14 Feb 2025 08:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B3010E25A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:11:37 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5deb0d6787cso2494907a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 23:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739517096; x=1740121896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YBZbTGwwpOGkfmC2S2B/ns3VS+A0GE9103R09GlmDb0=;
 b=UgGdOej6F7KK5FY0Sao+a5y2pCDZYPLbmdn00z5Oi7V1fZQMWLQUK7vW++8HC0/JUm
 pt5onQTO9Ue2dFG3sC6etPhyKN0LRthc86fJ2Lbk63FbkgQNRFsnqitjm+dne9ElKYh4
 wKuafBRX0vqj3awcqyOS17EK2DB9Jo4pq95AktZ/rEFhlA4uPC8Rxogm+Bdo5tWqA7bS
 /DwfxTistVw0F1T5XsetQWZpXJoCgnoZ+P9Vg2NYu1iLZaAu+ppp5BdFsQiZ44W8o9Kq
 uN1MbYrpDID83Rnc+2ZiOon6fMc6gCSz/E41Pb8Od4pYeEhsG7c0fhN+ta29YIT1WbOC
 bVEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVBdxVvKAnevtNgU41jWLGZFfAYMOrlSYP1vhkI8z06lvxHy3iF2tuLDEY4tMS8pNXiRtjY+o1DAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyj6TTh0y+YR5xEWzqkTDcP+YxI6kBTpmpRRawJuAesRPJ146Vt
 UhEYBg1+Ahl/8kkKkL61LTBjZYBEAXAYO1pxcN0wCQAX9kLeyP+vvTxUZLLDl9Y=
X-Gm-Gg: ASbGnctI0/7zDnzHUjwQjbKLE6ECsFr7QFEhY1/k+cdP8MnZEd7+5uVEQVCqj7V8+K9
 pWO2gmJhNhoh4WbqrB4nBP2kQP3EFHvSiHiXPZvk7hLCqUIZeWoi8PQIemIMsLGEErqjsl1/dWU
 HkWq1Fqd2KRHDNU1wagcTzX/OgDCMHalML6Ex/zHjddWJPg61HJJA7NLExnvpF0bTGuwiNH1Q/S
 f1I+g0itBKzv3v987S3zKHMCHLm/+zEYwvql0j0ps0nGO2YufumzfoyBJmfJkyF5gXoM7bCVh3j
 zaEyg9Eh0twMSRBfOqj2AvrBgvmHQR+GXMyQbM+iyQEeww==
X-Google-Smtp-Source: AGHT+IHV24K6jmyJwehjheihVNqs/S6Qg1NnGSfYVYac+OhE0uxCqSGDQyG/kzKqHJt3mY6KiALcLg==
X-Received: by 2002:a05:6402:1e94:b0:5dc:72e1:63f5 with SMTP id
 4fb4d7f45d1cf-5deaddaa9f1mr9349699a12.12.1739517095767; 
 Thu, 13 Feb 2025 23:11:35 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece2709a9sm2417349a12.53.2025.02.13.23.11.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 23:11:34 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so266051266b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 23:11:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXfJhPPtPlegU97Y4Zlim2JnqoiJfXXkvdODFQ4e5n+FckgZaoYJ3iRtmtkZmdpF9cEzPNEjE+4Tlw=@lists.freedesktop.org
X-Received: by 2002:a17:907:c22:b0:ab7:c94f:af87 with SMTP id
 a640c23a62f3a-ab7f33c0897mr1109151066b.16.1739517094400; Thu, 13 Feb 2025
 23:11:34 -0800 (PST)
MIME-Version: 1.0
References: <2025013148-reversal-pessimism-1515@gregkh>
 <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
 <20250207-prehistoric-married-dormouse-3e1aa7@lemur>
 <7742420.9J7NaK4W3v@skuld-framework>
 <d6cae188-28e5-409f-86ed-7ddf374fd354@sirena.org.uk>
In-Reply-To: <d6cae188-28e5-409f-86ed-7ddf374fd354@sirena.org.uk>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 14 Feb 2025 02:10:57 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9BiTsTmaadVz7S0=Mj3PgKZSu4EnFixf+65bcbuu7+WA@mail.gmail.com>
X-Gm-Features: AWEUYZkDpaaCrtdHfh-vNgOgzQjACZNx_DnEFz8ZiojUP1KiLrlWIyNShKVYrqs
Message-ID: <CAEg-Je9BiTsTmaadVz7S0=Mj3PgKZSu4EnFixf+65bcbuu7+WA@mail.gmail.com>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: Mark Brown <broonie@kernel.org>
Cc: Hector Martin <marcan@marcan.st>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 phasta@kernel.org, Christoph Hellwig <hch@lst.de>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com, 
 aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 David Airlie <airlied@redhat.com>, 
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 14 Feb 2025 08:18:25 +0000
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

On Mon, Feb 10, 2025 at 12:28=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Sun, Feb 09, 2025 at 03:25:26AM -0500, Neal Gompa wrote:
> > On Friday, February 7, 2025 1:16:11=E2=80=AFPM Eastern Standard Time Ko=
nstantin
> > Ryabitsev wrote:
>
> > > It is my goal to be able to give subsystems a way to use forges witho=
ut it
> > > impacting how they interact with upstream or handle tree-wide changes=
. That
> > > is, once I'm done moving things from one Benevolent Company to anothe=
r.
>
> > Honestly, this is probably not possible. If a subsystem moves to a forg=
e
> > workflow, it pretty much means tree-wide changes need to work partially=
 that
> > way too.
>
> We do actually have some people using forges already, for example the
> SOF people do a bunch of their review on github and then turn that into
> patch serieses which they send via the normal email route when they're
> happy with them.  I think tree wide stuff flows in via back merges or
> rebases, one of the benefits of delegation is that it's not my problem.
> This all works perfectly well from my side, as far as I know it's fine
> for the SOF people too.  It certainly doesn't seem insurmountable.

It might be working as long as a subsystem continues to allow
receiving patches via email. As soon as a subsystem decides to stop
doing that (which is absolutely their right given the model of
subsystem maintenance that the Linux project has), I think this will
break down very quickly.

I wonder which team will be the first one to do it. It's not a
question of if, but when.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

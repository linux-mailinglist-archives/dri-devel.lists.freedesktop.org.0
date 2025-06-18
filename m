Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1441ADF525
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 19:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F54C10E1E6;
	Wed, 18 Jun 2025 17:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aax1AkfI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004AA10E8F6;
 Wed, 18 Jun 2025 17:57:46 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-32b78b5aa39so16266851fa.1; 
 Wed, 18 Jun 2025 10:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750269465; x=1750874265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xvbpCHoh061DVA2zXXba49YyPXgWLFHdq9S5LqMpTVY=;
 b=aax1AkfIJ9uE5wUREEGAX7ThCEre7PpLYwzAOjIRaKj9spGRij+/imyds7LiP8nk/a
 BDHWQsxaEOmZ/YpO89R2vLDph3iowUAEEHOJqfRyQfDe7KEyX5+9RGav2nhnemIbSbAZ
 wwRudx875ZZWnbbd+cUf+pz0BvAIjZGAFo1osQXyc+5ivpVjusxMpevIWCG0N4l9JddT
 erNWZ0xpi1d1VmOZFHY+Q24PNFMw7SfRY+YvANfq4kTwH1ArP3izzqsYPHw7r2BwsUmt
 hIrMisvJkdmVSorUjZpeGtzT9Plh2AUC8xzVTe2nn5AC5gbTWqF2SECAJ0ZiqmdloPKA
 ucQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750269465; x=1750874265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xvbpCHoh061DVA2zXXba49YyPXgWLFHdq9S5LqMpTVY=;
 b=YwT1Ih8uAX7meT+PG6JBVPa9z+grjJ4Jot61uMXqT1wMq5zFat48hPPFmHrI3CJJhO
 NrXjBcJLwXYIvdbbcjPW/UJIhxTHoV8qdnDTNTrX1Yss+7ZeNTVok9FpJzadTSNG5dzy
 jxUZpnWYvPOQ8tSuZ/BpA9Gwn2gZ+XJcIvpQkDEpgmNmWDeZIweRP9xwFpqoEpSAbcOT
 xfFqBfD/rKeBCUwD6QRjeNMKUK3JlgCsF7TDMIonp5r+JRsBiHtiwC4NqH8ccs0k5Kl6
 VN+/bGsDzZe+3MHCCcQ4e9+osJtFBYWm9ShcCAwJRKPh6GC5ymxxdSCpQx+e9IMro3uQ
 /wXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcfWb1WD5rj4PLHrHXAPBtkoG+aRs2QNt5owX6pWenfwaswjChe7MVeC5vkh9dxL22GeEkwBp6UO0=@lists.freedesktop.org,
 AJvYcCUy4EDWLe5t7TWnqogDyOp0UVGEyyPeayu6QYtWxxIEAPUlpWDFW6u2+B6myGU/yZ2n9FwKzLchxA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmEExDqiD4IIA2mnQYpxFhOpnNTRHM/9xqMvs3u/cbHzSsfLC2
 D7nsxVBxBCB+p3p2eGhwTRFyHkQ9UTXjrH0I28LNNFQe+RGgTF82METw4UWhrPougZtfQakmHUl
 pdX+d1gIQGoC9G3xaH8bzNfRm0cR8icE=
X-Gm-Gg: ASbGncu9c0yupRgenhLyHIWiyZsS8ov0OhItStK5SMl9lWscgETrM7D7A8y3BnPJhcw
 q3w0aYkfkzs2jSAFSxqb5U+smWbsVQHf6h7GEsnthggTDRXLPHbODvg80mmw6qyd7iyQk7Sa9ZE
 Q/YPfThbQ3qPDWN9hsK83lsonxdvQHYlrNs3G9GZZE84mRmqiqjKcRdoHVeAs=
X-Google-Smtp-Source: AGHT+IFGH5gYRz7HzyAkXc6xFQTZHx1HyKujaRGU1VWJSVoGv01/xHq7AkSOADDbcwptpLJI4NKBOCX7lc78OHe1zqc=
X-Received: by 2002:a05:651c:a0b:b0:32a:8591:6689 with SMTP id
 38308e7fff4ca-32b4a2d830bmr47463571fa.7.1750269465105; Wed, 18 Jun 2025
 10:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-1-f43b024581e8@gmail.com>
 <CAJ-ks9=6RSaLmNmDBv-TzJfGF8WzEi9Vd-s=1wyqBcF7_f7qQQ@mail.gmail.com>
 <CANiq72kgnKH2SSp76EdPeysExBWasqhTyf1JyReR65g6FMsidA@mail.gmail.com>
 <ccbc2a76-20fe-4f70-b69b-9d05b59f24b8@kernel.org>
In-Reply-To: <ccbc2a76-20fe-4f70-b69b-9d05b59f24b8@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 18 Jun 2025 13:57:08 -0400
X-Gm-Features: AX0GCFshtGegkfZ_3VnmKgAk7O_-RQpc08IGr2vNv8IcZdaPQIit0uo4DnD-Ozw
Message-ID: <CAJ-ks9kkmmHtMz0rubwEqGLu_08+gSzsG09gphVZ5e8Ccc77SQ@mail.gmail.com>
Subject: Re: [PATCH v12 1/6] rust: enable `clippy::ptr_as_ptr` lint
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Christian Brauner <brauner@kernel.org>, David Gow <davidgow@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tejun Heo <tj@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Wed, Jun 18, 2025 at 1:44=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On 6/18/25 6:45 PM, Miguel Ojeda wrote:
> > On Wed, Jun 18, 2025 at 3:54=E2=80=AFPM Tamir Duberstein <tamird@gmail.=
com> wrote:
> >>
> >> @Andreas Hindborg could you please have a look for configfs?
> >>
> >> @Rafael J. Wysocki @Viresh Kumar could you please have a look for cpuf=
req?
> >
> > Thanks Tamir.
> >
> > Christian, Danilo, David, Greg, Tejun: It would also be nice to get
> > Acked-by's for your bits. Thanks!
>
> For the whole series and the bits I maintain:
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
>
> --
>
> Independent from that, won't this potentially leave us with a lot of warn=
ings
> from code that goes through other trees in the upcoming merge window? How=
 do we
> deal with that?

I think the idea was to take this during rc so that all trees have it
by the start of the next merge window. I'm not 100% clear on the
kernel mechanics here, but that's my understanding.

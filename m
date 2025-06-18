Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C87ADF36B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 19:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECEA10E14F;
	Wed, 18 Jun 2025 17:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KSGtuTxV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145EA10E14F;
 Wed, 18 Jun 2025 17:06:16 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-312efc384fcso1231075a91.3; 
 Wed, 18 Jun 2025 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750266376; x=1750871176; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQ+ULoaBxec9yBNcJflV6Y412Q8N+SG1nYyU9X2N3BA=;
 b=KSGtuTxVeh7oPMOLO9KkKVtg2mkOCBpyKuWbR+/LmxfJXQTWFFg9WKrJJ6VnniAZ1A
 PIJyY5erUiyXWZb3E4hhItXVUQyYb02rHgFySMlu98UECLKgi5iOu1R8khrw4WmVfkFv
 77arELRrpZqHFVvhbPfXx7wUgZlCLMKc+akByn3V+3w3yVc/Mt+4WZ59yDYAGNB9WiZ+
 scdcsK/Ck5irKWlh0nsZpQujRCa3iDI0pNaZuYHBBqmi+OotvsmfXCyhEK9jD3+Qnv95
 a2RHW64FzrABTEx6LZuOb2sj7fi+9KgFqMk4JoASG4Zu3PYR40WPSK5hYIZWLFFjiWmv
 IcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750266376; x=1750871176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IQ+ULoaBxec9yBNcJflV6Y412Q8N+SG1nYyU9X2N3BA=;
 b=JYQLvtJ2P8Zleh8J2vfcmVIknnckd8QGwC+cUNGfl5EzYQfEN7JyWfg/Zub/F38Ejz
 qLxa5QxNtRCYCwxenux8xQr9WDu07QgrgYCeIVviUTLAz5pehKzABFDjT5KGyDg4fBej
 4cKuWHvBg4vVl0H64vpZy1ZaZwsSyK7yjTW/vf/unH1k80L4GaoAeLzJ7qXYEdP99Dc4
 rlwxLCCyMX0Z9ddKsSZccdPsu6n/S79kOA+5fmRSZUg02dlyoVOtKTyOHOrlso/NCkPC
 ZCz+9G83wdMThg+iIAh685cn8MEMDX+27SUkiVH7kg1OG2vwP5ntugT7cAnLOIA/ViR8
 e7aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/OTJhr+etgA676waOCCjpjskIAvq4rsQB417cegBBfiFQPARSk14M9O2KJUs82v3A1RFIJchzqg==@lists.freedesktop.org,
 AJvYcCUTPjJRYXNr8V0lNJyb6/0RpN42Pj624XCa7+6vwAZ/fgjgudTVhxWXnzO0fufMgdiPZliC3VxNM1I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1fHpb4qv9O88SUr9HkPUc1g6pvlf3vJ8mbJr+wGQoortF6UiC
 FS4S7c88x1kSJ9ou3kZwzfOjfY2O4EHwnB+nr4tHW2+rXoweaV2DD7Y8s+5q62qspgBku09v/XH
 r7AIGBtVqW7p4D92J/z1L71HzF3wyKpM=
X-Gm-Gg: ASbGncsiaYM/oQqDFGuzj+OcZKON8knrfSN9iTrSGnphuSIG2v+zx43XFroGpynY0Ig
 noscLgX3gZlWGijrEpAOyw6yitAZznS71GyVukXP3Gw6/8EV+AOGCALQk2rUdp8iMoNmM+s2xQD
 3t/UENT3NEgp1JYn8NqN+xahaYn6Y0ucxYb2plYIY+i04=
X-Google-Smtp-Source: AGHT+IHirtqhFXsuURYJFw2U0NHBhqBhBYGB1DxViI/aU8M6gaMBzEOkQBGGBiqg7VHDZ1qURJrmwHpGk9SmvSWMmek=
X-Received: by 2002:a17:90b:5825:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-31425261c29mr3942028a91.0.1750266375986; Wed, 18 Jun 2025
 10:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com>
 <CAJ-ks9=P=N=5L8yre_C7xKoEt=t0f=Sf3ZY5POHuhb_3+5GO3w@mail.gmail.com>
In-Reply-To: <CAJ-ks9=P=N=5L8yre_C7xKoEt=t0f=Sf3ZY5POHuhb_3+5GO3w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 19:06:02 +0200
X-Gm-Features: Ac12FXyBNxzN0lq5c5vwJkk5sgyraS1J6su2qYnb3x7QnOeHycaA3OMq8R_Q0z8
Message-ID: <CANiq72nkN4u3tTihF9MQFtFe4AizBvb_Te9oSLtvOjNfzxq3QQ@mail.gmail.com>
Subject: Re: [PATCH v12 5/6] rust: enable `clippy::cast_lossless` lint
To: Tamir Duberstein <tamird@gmail.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Nicolas Schier <nicolas.schier@linux.dev>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Benno Lossin <lossin@kernel.org>,
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

On Wed, Jun 18, 2025 at 3:52=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> @Danilo Krummrich could you please have a look for drm and nova?

Jocelyn, Tomo: it would also be nice to get Acked-by's for your bits.

Thanks!

Cheers,
Miguel

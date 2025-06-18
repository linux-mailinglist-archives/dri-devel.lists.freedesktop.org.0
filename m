Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639DFADF2E6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 18:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE05410E8D7;
	Wed, 18 Jun 2025 16:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gzvUpS/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4AD10E8E7;
 Wed, 18 Jun 2025 16:48:21 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b2700de85d0so384281a12.2; 
 Wed, 18 Jun 2025 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750265301; x=1750870101; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AW9mBOCDobrkScz6UXkBCPboXEmZQ8/FnXiXbPclB4M=;
 b=gzvUpS/uAlMK158hSfWrPKO3qjpOsefOzBoe39zucfIwLkHkTzHSK0yfoFGKXbC7ww
 K3Vj5gJYhsGz0Q6UZZnf5aGD+KPv4j91wuNbCYUBnNDDd6RY0LsdcCqQBk/FOeAQxbyb
 22XbFy1HE7kJt2IHIxs9MnFHx/j5bcrPtctl2TmBxMQYdkPJb9Do+BoWFt7sPEJgi+ge
 qMankQphSkyGpOc0fzjyakYvw1JOw71d3keL/tiQj2yy21pkoScgp1cyDxaTopq3kwr7
 jg3dKzkdATqgbtYF9WJj+dfGOxamyWraadMAKoSbTWf+0AU92wod4zK8nsQVGjuVbrfq
 y/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750265301; x=1750870101;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AW9mBOCDobrkScz6UXkBCPboXEmZQ8/FnXiXbPclB4M=;
 b=iIVu10k/bDgHLwLuF5mTs/dxTGD7jUCm7BrvinxzbwyW3W/8iOTeC7doLNh1m0Qy/m
 Eey+UDIr66jyFO8opLfoqR8DYAfd8ExMC4XZbIOpyF3S3jOuNzVkJtyVoF4tXPAjZ/Pv
 n03vzjUQj/Go8Yo739ksWB4FmpQAXS7TfRWC0y92TjDGK66n+431b8994IQamq0bIpGd
 3dNUUJ4Yar7a0UUigRtgGGb0OlmvZ5B85nWALQV7RCTySMKJkDldeR2I5GMVeOnSzPCN
 qPDCJPs+Cu4ceZSkPZq8JAozj1sUpXWHh1IDDgc8p7Re3yZqKD2HmGwkrrbApL5t5pOO
 cExA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqZ6NZukMUziNB1k2eyqw81WCMT9NmhZaP6/KgInpXGjTs5dScjypgsM+UM+xhqD105ufw6hNZIQ==@lists.freedesktop.org,
 AJvYcCXyeY4wkudr7I1XsAqn30/ro9cqsm86ZvQzXeOv2Y1vLeLGAHI5ipfsN9qRVpaUd1ozyMoRZ9YW0co=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK5nqVBG2xuFsJi5bitKAO9LAPsdww/zE3EE12dwLKGCHx0dhs
 Crcx7pMtIuViDTFTW80bi86lplQXNAE6KyklBcNFz7Nc4mtiN27KCpwKR1ZnyAP4Wk60XYiWdKZ
 7R/PNPnL860uE3KShMTzzqhsDwAROkAU=
X-Gm-Gg: ASbGncuTv8/AFO5rUh2TkTfPN1NuNkhKFAfG26AMLf9qjY+YSndzOojt4/xb9D7x4Fh
 aOs+z5zjOgU/AOiMJElbopXhz6PK7kvK7WBHEBChJhyV45mUjJ2ES9hefGzSF5WnXpCwGnn8Ek5
 2zPRfohRLgfrRaF/VsGbi6MHq5GWn67UWZZAcm2lileHU=
X-Google-Smtp-Source: AGHT+IHbZPpDlzhGTWnV2PLbhxK3FWVyrT693fd1mp3Na/PixMVTH2mNNXQ1lkOox0fBpQYU583IqtWRcabC98kzYIs=
X-Received: by 2002:a17:90b:53ce:b0:311:fde5:c4ae with SMTP id
 98e67ed59e1d1-3158bfee2a1mr6435a91.6.1750265300581; Wed, 18 Jun 2025 09:48:20
 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-1-f43b024581e8@gmail.com>
In-Reply-To: <20250615-ptr-as-ptr-v12-1-f43b024581e8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 18:48:07 +0200
X-Gm-Features: Ac12FXwww27fRmxpneEil4Z01A67o6MlxDze4sqqmIR4CifNVxQNGBiXiJdR-J0
Message-ID: <CANiq72mfjzXj0f4PKPKg7QgbOrhay4CF_+TBgScecKWO6acmyQ@mail.gmail.com>
Subject: Re: [PATCH v12 1/6] rust: enable `clippy::ptr_as_ptr` lint
To: Tamir Duberstein <tamird@gmail.com>, Viresh Kumar <vireshk@kernel.org>
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

On Sun, Jun 15, 2025 at 10:55=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> Apply these changes and enable the lint -- no functional change
> intended.

We need one more for `opp` [1] -- Viresh: I can do it on apply, unless
you disagree.

Cheers,
Miguel

[1]

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index a566fc3e7dcb..bc82a85ca883 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -92,7 +92,7 @@ fn to_c_str_array(names: &[CString]) ->
Result<KVec<*const u8>> {
     let mut list =3D KVec::with_capacity(names.len() + 1, GFP_KERNEL)?;

     for name in names.iter() {
-        list.push(name.as_ptr() as _, GFP_KERNEL)?;
+        list.push(name.as_ptr().cast(), GFP_KERNEL)?;
     }

     list.push(ptr::null(), GFP_KERNEL)?;

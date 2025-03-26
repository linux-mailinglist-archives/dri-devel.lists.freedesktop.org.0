Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D0EA7154D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 12:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E28910E6D6;
	Wed, 26 Mar 2025 11:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CqosZYCx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3888210E036
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 11:06:48 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3032a9c7cfeso1408745a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742987207; x=1743592007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cjIoZ515VXMsGD1yxEFHbH0kYM6gMh0q//2PA62fqjo=;
 b=CqosZYCx7LDRm1ovvohPNOqhg9dVXGwaCgtm4FVvl4tg0jbUg9pOenWWgls0cV3YWX
 +6GTghxRQnlO7HB2e1dsL6A4nEKIBw4K8G+2OnlAnhmAf3vEa5x+G89p0gVUJIdfledp
 4w/cmhEQL2Ps4+tjSuNI4RtSbi44IwcylP9jn3g0WKYyu3Za8pMNwXq5qdRAF6FOW693
 k9C6t/UQLyxZo/4hv2MRh4Oumx9r5ffLPuC8xJa/TRMh1J4n+rM4mtbC6O8QWGBbhhvJ
 SMEgtmfPwp+73oRQve5Hyay6d7MXYpUxgglj5a5nJtkX8w9BXb/PsFACNboiNRHMnxVn
 bQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742987207; x=1743592007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cjIoZ515VXMsGD1yxEFHbH0kYM6gMh0q//2PA62fqjo=;
 b=rL538gIt9JPq+xGzRxa255J7SSyRyKbODstVWlgexc5+qH481jOHAZkLf3axCcEVek
 qPVBHdATh0ZdQvHZ9W2hJ+9mcH74nw8BieD1xccayKjyql5WbFuenyGYnp/5RjRg0KgO
 DBSX6LZZ2mlS44qIJ9dfELHQE9O6b+RDnCKIKKtJiOa4RHKXoRoBqLgekHdi1D0Oyltu
 NTxi35TvI/HYWnN9oizC/DtQWcQfYj4KTJI1takPahdCL34kVrGtH1HUJr2rz4weToMh
 CRFrE5oEiqsbnLUJQ9rTPo4oft4tTK2j0A6Ay45bflk58YphgkV0RiDDwFvT6vzMasiq
 bn7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKti6IZ9FwXPcJYTKgnN73l9vdAn9ABgdpAOqL1LPoRluIwOlDbA2G0OWVIn23UcFzOpzGtat9kI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBohKhvIWbuP7E0azWK/hz7LjrMmknzKxlfpPIpqzKyNVr4g3U
 kY9CY/1bQ0qnNhPn7jvGJvUR/L+1cmkoxRN3IUwfHUgNqzIiHdmKfz1Pb4QCGMqFtoMWlyzHrZO
 LAURQT7veJZAp8ZJPaiVjlXHPrWM=
X-Gm-Gg: ASbGnctMYNj6g1Ib5MrF4OsldnJ76B0LpPLehTrX77LRjW+KMPwot+pAzjGoWGwj3Y0
 yEQHX/ClguRwmejPtnL9afrqLdwyeUOrJzXB0lFhqvloWfsja1MvFXRpn9VGt/0oqhiE280fSgK
 Xe7rvd3mzMHlC578RRG73qT0MZcPtL9/7P3ozT
X-Google-Smtp-Source: AGHT+IFhsN8zZEiUjn1NupRp0c1pqcGbeCXmIGQgB/y+ORwTbGJ4I/yJyHk/CZqlvC1iNtRZDp2oxdjkuKwBgXExacA=
X-Received: by 2002:a17:90b:2248:b0:2ff:682b:b754 with SMTP id
 98e67ed59e1d1-3036b3c5fffmr3814475a91.2.1742987206674; Wed, 26 Mar 2025
 04:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250325212823.669459-1-lyude@redhat.com>
 <20250325212823.669459-2-lyude@redhat.com>
 <87wmcc6ppo.fsf@intel.com>
In-Reply-To: <87wmcc6ppo.fsf@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Mar 2025 12:06:34 +0100
X-Gm-Features: AQ5f1JowHMpK8x-bPz-sN6uw4JBitWlFWSrrxZiXJIoCocSPB7rJGOOuT_Vb0Ng
Message-ID: <CANiq72ktoo_yfapmGsjkbyd07DwC7wcTL_3h9pHvk6Rt01+w7g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/edid: Use unsigned int in drm_add_modes_noedid()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 "open list:RUST:Keyword:b(?i:rust)b" <rust-for-linux@vger.kernel.org>
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

On Wed, Mar 26, 2025 at 11:39=E2=80=AFAM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
>
> That is largely the point, though. You know something fishy is going on
> when you have a negative resolution. Nobody blinks an eye when you ask
> for 4294963K telly, but it's still just as bonkers as that negative 4K.
>
> I think the change at hand is fine, but please let's not pretend using
> unsigned somehow protects us from negative numbers.

Is there a reasonable maximum that could/should be checked for? (I
don't know the context)

In other words, if one wants to detect invalid values in a primitive
type, one needs to define the valid range anyway. Using the negatives
of a signed type is convenient in C, but perhaps there is a tighter
threshold?

If so, then an extra advantage is that on the Rust side one could also
have a proper strong type for this etc.

Cheers,
Miguel

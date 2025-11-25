Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCEFC84F7A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C06E10E3C2;
	Tue, 25 Nov 2025 12:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AaACUqVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F64610E3C4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:31:31 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2960771ec71so9537735ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 04:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764073891; x=1764678691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZoWbCU/Fz1+eyrddUOSOAHDIsvDgxcG/td4vjeOMl2A=;
 b=AaACUqVRUneYxrJRqydowuNlxuRW47UOakHvFStD5IUz5hCXHUkkzXVrfzvFtEgFKE
 IA2pmxrM5aDOdQCK1FNevWNJo7akBlcV8QdHTAC0Bwm2J5lcv7A/EMf1w4vtAMMF2znd
 s6NV+1HPkXLvLNMCks3T1yFGVBrfUEJ+fQAF8XCh1SvXd9aRix+vGChIB7cOJ3v4k0HU
 88PGVYA/zm2lzt0HTzRiGpmp/z3Q6irHQEm6h2JUFyCDr+Uz8f/1yM/Qh1DBOpjq2bSE
 92lNUzrwHXgs+79tEYY8TlTRDkl4EYKxXdoZ4AYW9NhC9MA2FVh6uQCPo3jlTwPMriYp
 osjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764073891; x=1764678691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZoWbCU/Fz1+eyrddUOSOAHDIsvDgxcG/td4vjeOMl2A=;
 b=HJ7VXW7cGj5D4hZVpaBsY/JgjlMIR6/cjMoeIlkUJoOXqkFzKYarpzjnpF+aC55t4N
 v7q0bC2F4m2QNfKdTaZYdbR5WmRYZ1G4WwzjY5f2odf3zqIPCqRqIWZXG44FKmXNiKi/
 tEUOi5KFakW6gDIWPDuXbkJMohbXWR95psIKdmmzub6efMAh/jurRO6brq64KPN0y/7U
 H06nwEaQWIJD9W8l4mFTpFCaOgfvqDQ/ffqQHNlwbroWlzK/LUnNgvr5por+d55uRuTq
 hJKA+27JS1NB/KSdy7iZJVMA+w9PW158GZ2c7Ryqx5giDxevSLyJHmUTbBVX3KBqjpZI
 InzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8PpgtcCZ9nJc34kuEKYnVB/HXRiNQvD7xjTswbVclng7VMvZ3f9rfIyXXxdqtFXzRUJxU/QRRAsY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQ9eHRf8PF8q3OccBjWVV34EGzbTtpEeKfk8X3lNCm8qCMqbNb
 TgwTtnsVfgKj452AFuANxmd0bDJUScwdiGot9E7CUIprBz7CQs5U7FTLessIPVuwJcciHnNOcMD
 j/V26tkp/PUTuZnL+kkEX9BDz9XdQoMg=
X-Gm-Gg: ASbGncskeItEwFq7Cxud7JS3I+uDAe/Qcg10YuVZB0x/toYLrzXEmLe5C0shl0+tCQv
 Rin2g0/GJ/sukzAE8sMHvRJeJrnBYLKi5U7hQXiSh0pH2iz2RCJg7OElU1a/auT+hU7Kyg6K2GO
 y5crVfk+4kljfygS79RrJL0NBqYo/2XJTt5k8JFNbfCSdrmnPcZcEFGtKrBBFvBxunoMHuWSU5i
 1uFYV47ScZdveuyO16u6wQUZN1Tvugt0WuoIpyvp8bc6UhV2pHe4MNVHVA1pi2uQcMnzZIfNHPL
 9rIQJPlySBfLGIyKGdoUj8jWgYnO6cw4VseragYwAgrr4+SmK2yyhxWVIhRPUUpCB1/l+xTWsAb
 iNPOu3c5W2neuQQ==
X-Google-Smtp-Source: AGHT+IGgw5LUw+voSfpyRnybKCW9uSxmytNtm8JMKkx1AQxluRQJPOoxkh2lwkkXY6q2xRvx9r7q82tUTs2y48xKT6U=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr9704335eec.3.1764073890450; Tue, 25 Nov 2025
 04:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
 <20251123092438.182251-7-shankari.ak0208@gmail.com>
 <44gv3fhqppn4fyg5fnxkhhanlbbxr2slqq7k3kr3owx7frpnxw@idgwxlcv4otn>
In-Reply-To: <44gv3fhqppn4fyg5fnxkhhanlbbxr2slqq7k3kr3owx7frpnxw@idgwxlcv4otn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Nov 2025 13:31:17 +0100
X-Gm-Features: AWmQ_bnzR1pFS2tnO0i1TQxesvIl8Xiz1UJW9FJjv7yVIIdoY1qGA_4D1PTisOA
Message-ID: <CANiq72mQ4cu9wehGKxS92EK2H3kcX8XPpRmv2DdYmn6Ve9iDAw@mail.gmail.com>
Subject: Re: [PATCH 06/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Shankari Anand <shankari.ak0208@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-pwm@vger.kernel.org
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

On Mon, Nov 24, 2025 at 5:10=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> having no clue about Rust:
>
> Can this patch be applied independent of the others via the pwm tree? If
> I understand correctly it's only patch #10 that depends on the previous
> patches, right?
>
> Is there already a merge plan for this series?

Yeah, if subsystems pick the independent patches at their own pace,
then that is great, so please do!

Then, after 1 or 2 cycles, we can do the flag day change on the Rust
tree (with any last changes needed Ack'd, but ideally there will be
none remaining).

It is what did in similar cases for renaming (or moving across the
path hierarchy) things in Rust. For simple things that get Ack'd quick
enough by everyone, sometimes we may be able to take everything in the
Rust tree.

Thanks!

Cheers,
Miguel

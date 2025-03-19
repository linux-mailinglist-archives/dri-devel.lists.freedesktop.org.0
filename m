Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DD7A68E08
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 14:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A26F10E4FD;
	Wed, 19 Mar 2025 13:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i6anbx+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B59110E4FD;
 Wed, 19 Mar 2025 13:43:12 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30c44a87b9cso61078651fa.3; 
 Wed, 19 Mar 2025 06:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742391790; x=1742996590; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V2MSofc8cyvKVxUKPs8pE0XcoDtUlgqxF6FfrtYMUiE=;
 b=i6anbx+AAWGGVFELf4zQ4eyaP9j1l6dCoT4B6TsJIgyY4E5xRtGYhCxIyymwddcoN3
 TFHLXHQAkLLAg7y5c03ToszqyGI7NWg+oMNC/tjvQY95PBhYHmATJuLeoR4LDBUwve4h
 RYFLOEama6opuQ2q1OyMVHkb4E/v/SPNfic1zeov4kXIJ7sA97dsmrzq3NjdHl8dTJTO
 4MGTBbJiQ7pg2i5V6n0s86SbbDP4Z9wf9Q6oqB5hHGEns4sZDnMGHLsYJ8VXArweG73x
 ISD+qimovNSPcWgYH/o/BGTZNgC5fI8x7b1NuFOwBJuR1tocjPKSIE7Bnb5KQG11+8X7
 /Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742391790; x=1742996590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V2MSofc8cyvKVxUKPs8pE0XcoDtUlgqxF6FfrtYMUiE=;
 b=acNX1vtWrgemJHpesbzPP+wZQv1ggyoTx7NYu++a9sc51+1ktQxxWpLMA6YQSsLW0X
 FQGpmxUwBObw4hcN0Qq923CFrEPbxscAdQZ3yP4UdZYVNRKOpDxEpudZHj1C5BHX3oli
 rOc1jPollOQW3nU3IMmBXMYT8kzA8ZfgW3VlPQ2ZqqOCGnGAX4SrsrEhWh48L5kBZzFf
 sfdwQJgrEhk9cV5Kb6rJXVEliSTypD2qRcGYxp+8xgQXo6rcfEBNe01lUJMoeXQikSlW
 oiCByynViFjC5sqzfcxUB3DAj5fNENee+P2HrZCa9ZKKyspd6SHX0IuzCNyRioPVgS3E
 YB0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8I+lHKL9KqCR2wFS/yzEnQVVKfoiI7796rcxE1AsPGIzRyfjCDHBMUgU1ccUY3558bFEy/risClw=@lists.freedesktop.org,
 AJvYcCWqQXHf7pbtI0NtuCuJkhZFVkewQYoNh+9VdV2B/z6ho5vGND0BcDcnU9/ctd7rDLDUcYakRycsZQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDceX6m0FJKhUErbAXhFT1nP2T1ndlntUztgZjn7C7SDlh9eyX
 8G6vy46EUwXDSClILOQU4L91BPZ2dmleYhaLwqtTLEuQyZb5XJPF412V3/oTR5Yl75A/Pmc6s1a
 NIWi4CK2cl/iZm7VN5AduquxnCys=
X-Gm-Gg: ASbGncsI1gPEYZ/btoZx7rr0SdeU6xaiqBhYE8+nvksXVyx35NutLqSxnl3Rvx1izeB
 0pSsSEiPCSvzQ1N7E/S6bTG9N7zlE+HGAHcAC8PWcD09wihVxJoYYkwlwg+d2etDgNa1lxJWBPi
 v0/wvemifc2AnYpeV23oLNcj6IwvNGoaUMJc5EgY4eUg==
X-Google-Smtp-Source: AGHT+IF4UZnEdUSdxleThqoQmroEP7JDDLQW+0nYHiycAoFsWFqa8q5lYSIadDHk2oU9ljzuqsif8/Cf1eEeLepUQng=
X-Received: by 2002:a05:651c:1541:b0:30c:f60:6c6 with SMTP id
 38308e7fff4ca-30d6a39d6demr10181131fa.6.1742391790128; Wed, 19 Mar 2025
 06:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250316111644.154602-1-andrewjballance@gmail.com>
 <20250316111644.154602-3-andrewjballance@gmail.com>
 <CAJ-ks9kAROOfyPtxMe6LE4-UPsvXca2sQ2VDjhRchZp3HLddGg@mail.gmail.com>
 <D8JTWL8JY7DM.3IVH6FZ4M49CB@proton.me>
In-Reply-To: <D8JTWL8JY7DM.3IVH6FZ4M49CB@proton.me>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 19 Mar 2025 09:42:33 -0400
X-Gm-Features: AQ5f1JrzlMF52hRTEnPnE3fmFFgkh9IFrPPTcapQYiPgOpAS7vBvzN1PK6u3ims
Message-ID: <CAJ-ks9k+A1+0CWXZmD2m0+jRqTRTNFn-=d9VXqytiOqvn4BR0w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: alloc: add Vec::resize method
To: Benno Lossin <benno.lossin@proton.me>
Cc: Andrew Ballance <andrewjballance@gmail.com>, dakr@kernel.org,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, corbet@lwn.net, ojeda@kernel.org, alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 acourbot@nvidia.com, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Tue, Mar 18, 2025 at 8:50=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On Tue Mar 18, 2025 at 9:12 PM CET, Tamir Duberstein wrote:
> > On Sun, Mar 16, 2025 at 7:17=E2=80=AFAM Andrew Ballance
> > <andrewjballance@gmail.com> wrote:
> >> +    pub fn resize(&mut self, new_len: usize, value: T, flags: Flags) =
-> Result<(), AllocError> {
> >> +        if new_len > self.len() {
> >> +            self.extend_with(new_len - self.len(), value, flags)
> >> +        } else {
> >> +            self.truncate(new_len);
> >> +            Ok(())
> >> +        }
> >> +    }
> >
> > You can avoid underflow checking in debug builds by using `checked_sub`=
:
>
> `checked_sub` doesn't only avoid underflow in debug builds, but rather
> in all builds. But the code below is a good suggestion.

Yes, I know :)

I included that language because the underflow check is likely
optimized away in release builds.

Tamir

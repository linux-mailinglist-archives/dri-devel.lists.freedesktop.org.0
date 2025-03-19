Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F88A6964A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 18:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028D810E55F;
	Wed, 19 Mar 2025 17:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NqlzqzrK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D5010E55F;
 Wed, 19 Mar 2025 17:23:03 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-307c13298eeso12584761fa.0; 
 Wed, 19 Mar 2025 10:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742404981; x=1743009781; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hsaYUgrXM5qfLvhH06tltZQdRCjc5tEs2EI/X9vdw2c=;
 b=NqlzqzrKgd0yr2SXj9hIwr2qPm7jjhQWMs+kYUpFXrOt9sCuG6cEOph/vZgEewfTWR
 9u8z/f2k8BriaTynw7bqmPHaFZ59OMhTsPvhF0vjR4oBTzZxwhilxal8NxZwt1gGWSQm
 sNBnXmOTI/KtbmSnQYHLb/77GaECZmU6tYb+e8no1RWnuYBAB+vHLF+hqpYHcqhqWGOS
 eeXkDWrxuNcr+L5OOm708kvw2fqug9jDzdjEVmkQ+EU8xDxjmABkeElb0pJwRKrdCn6t
 oTMuZj8JXYW+jpRJcPDHhM/xhlYZP5zbNpLGIFS82A/sloTbS9ETHIDJ0r5fBxGEQlAo
 Ap7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742404981; x=1743009781;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hsaYUgrXM5qfLvhH06tltZQdRCjc5tEs2EI/X9vdw2c=;
 b=H+dfHiQjuXlIwAoQ7VQmG+Wkes7sa3gh1CRbJb4JFPtxRHG7/4s4xrMreaAfcAn+iD
 zcBipTTaHMiJHMC+Nge9dXReRqY+kHaR7CxG01rbFjGXz44eNapMfvGFs/SsZEnZgug2
 0k5ag6I/EGsf8aYhy3U21xEs28miWL0PrP2hTm/pz3+Zh9KAgYy5YjzIuIEf2sqzqe6L
 Yoft9TA46ZM8OUQHfh1co6J4IpphsXhuXMf6tGLiHBz4m3ua87ODMIXR27FjFqSXr/aV
 Y/AMaMDPat5sLVeEDMtn3u10RWAogqc7kDCrY2uXPhtDzpvKC5WgEYodyjW6MSUp/1KK
 9OdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZNO/xRq+RNxMptV1M1iEKhfYXQL+JZqWQZSxg7A4Eov2oPfyoSpxtAzHZWuiUy1Baoz5658i7eBE=@lists.freedesktop.org,
 AJvYcCXPRwl87wp0qtXwrs0SQWCZwmJ+5avZMs7F4kRK93SzPLgFMX9jp6ftt2dW5bf+KIfn+Ao0U5qsYQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwhWmsKsBZlGszLK9yGjSjRC9BjNgf7S3xUeEwSb4yIy1oTIgI
 X20Br1VkJ58j224IVUAN7z97tbDU+G9kiPWHmqk88dnPPeBV+avhnmvUhPMsoQsB8BJQYUA/pGi
 nYp16BVTdDcc1UFl0ML36GmC8Hfs=
X-Gm-Gg: ASbGncus7zOJs7Uo/JBjn4T/wH59fbOlPWDlT9/weWTdjl3L8O6vaqgaqOJq1Cllo1z
 V2y34Ym3BkHggHC2daZhwg7JA9aPNQEAUChMhzqxD7Yil1G0fqsPIWjAEbFzquY0zdgzCqsCqJ9
 2PFOrv/fX9SW2WCMVBNN75hQJ50yKxCYs2FrPfnkvsjhWAWCxJ4DZ1
X-Google-Smtp-Source: AGHT+IEjO2m1zIXw4HFAj9tm3S3oc43HEXQnmavT/Wdw9EFY3wTfyK5+LzJIIT2UTtXDcjxCFrMJwxSj2WzQC4KjEys=
X-Received: by 2002:a2e:90c5:0:b0:30b:e73e:e472 with SMTP id
 38308e7fff4ca-30d727aac9fmr1171781fa.14.1742404981302; Wed, 19 Mar 2025
 10:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250316111644.154602-1-andrewjballance@gmail.com>
 <20250316111644.154602-3-andrewjballance@gmail.com>
 <CAJ-ks9kAROOfyPtxMe6LE4-UPsvXca2sQ2VDjhRchZp3HLddGg@mail.gmail.com>
 <D8JTWL8JY7DM.3IVH6FZ4M49CB@proton.me>
 <CAJ-ks9k+A1+0CWXZmD2m0+jRqTRTNFn-=d9VXqytiOqvn4BR0w@mail.gmail.com>
 <D8KBFC9M74H5.4ZJ2SJK06SGR@proton.me>
 <CAJ-ks9=NQrz3ySacKt+XXm2vS+Fn9gjmtqAaaoz1k=iTG_1HXw@mail.gmail.com>
 <CANiq72mnT73Mb7RJhZjf4de=_Orv4pipunMhOersOj_aqrFA-g@mail.gmail.com>
 <CAJ-ks9=23qEqxT5rivsbfNYC6iUP4RXsKbcDU9XDx32ERnKbYg@mail.gmail.com>
 <CANiq72kfgDVkKAeX1SiahEoo13+kHrcvVY3hMAfRPGjwErCt6A@mail.gmail.com>
In-Reply-To: <CANiq72kfgDVkKAeX1SiahEoo13+kHrcvVY3hMAfRPGjwErCt6A@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 19 Mar 2025 13:22:25 -0400
X-Gm-Features: AQ5f1JrVVB0KaF0SOHg6B4PqxeZ26bWmx4gdmbRKGmZX3gyzx8re07gIpcxQEmU
Message-ID: <CAJ-ks9=mbqMdguFmnRP+t-P2OC+oYGVDU2oLtT1dZzY=USESEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: alloc: add Vec::resize method
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>,
 Andrew Ballance <andrewjballance@gmail.com>, dakr@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, 
 tmgross@umich.edu, acourbot@nvidia.com, nouveau@lists.freedesktop.org, 
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

On Wed, Mar 19, 2025 at 12:43=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Mar 19, 2025 at 5:13=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > No, I meant avoiding the check. The existing code already explicitly
> > checks `new_len > self.len()` before evaluating `new_len -
> > self.len()`. This means the check occurs twice. `checked_sub` reduces
> > the number of checks by 1. Perhaps my wording could have been clearer
> > ("avoid *an* underflow check").
>
> Ah, you mean in the function you suggested, I see.
>
> I think it they all may compile down to the same thing, whether
> overflows checks are enabled or not, and whether the version in the
> patch or `checked_sub` is used or not. At least in a quick Compiler
> Explorer test it seems so, but I didn't check in an actual kernel
> build.
>
> The implicit check is gated behind the other one, so that one can be
> removed, even if values are unknown -- we always have optimizations
> enabled, even under "debug" builds (assuming "debug" means overflow
> checking enabled).

Yeah, this elision is what I was trying to allude to in the original
wording. I still think the suggested code is simpler, but gave my RB
either way.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFEBA6943A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 16:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A525C10E541;
	Wed, 19 Mar 2025 15:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d2y24HN6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC1B10E543;
 Wed, 19 Mar 2025 15:59:38 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30bd11bfec6so70889321fa.0; 
 Wed, 19 Mar 2025 08:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742399977; x=1743004777; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9hyskz0+W8oxdMSBSrKYAiDGZxtrfIfmdmAlEMXAcA=;
 b=d2y24HN6DGV0wiDYN2uqRd+deR/VRTww0mkKMuDhkjxuKRh/hMO6m4CcmrBEgFzK4r
 kon12VujKB3v60rgweJ5HSLOYOBj3+5yjc3E7ubBhJ3lh4s6jpJm+f0XJHkmbvS6lbir
 Fm7vVS/hjKQnbw1DXUCZyjEawJjcJDLuFSUBYUn34lTAAC43hadGlzpRiXLOeFgjzn9w
 M6IWFSKR/ngKhyEHBJzBJjyqK5Vh8zxjGLl3dxcr+JSGVy/WpAvE752jzJxauLw+V2hO
 LQwbzTq2RLiKLAANV27mQ0CADedeM7q5+k9NLnlOgV+ZIKWT/1emmF2WLYMVRD3yiuOg
 hSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742399977; x=1743004777;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g9hyskz0+W8oxdMSBSrKYAiDGZxtrfIfmdmAlEMXAcA=;
 b=fBP3rnmz/34jTvb6bHRLpQTM9IeiMPujEvjPPdThjiYAOxrxCwWNpvLSp7kXwA/a9l
 NzkGYqvL+QBvEYJ3qvoIxRFfajL1A3HY5hotMfWCt/d+NaZYqQZUtLnE4bqZblP5Bf8H
 +6qaQOD1ctK6khfA0eXmhiuGCFFLISLdciIr7LcMqEIfNnuh8sfbEVld8KK2By4fGGFm
 47VmCIM7TQPqmKEtWK0EdfSeXuElLd2WCW0kZqhur1QIUa/VGzP0zQpVvzWa4rNhuUyt
 tS08en5NwRH6GcBlGVz5NP0TWwlX3fcOb2fOeqSuYgtCY0x++pXT/d4w6wC2fXVG8I04
 1qMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUICsnxHJQ7YAtm1djL292UuocYFel0545BX2mJIsRveBEeTIr+Am208wz4TzcVkz/DZPDDfRuP38o=@lists.freedesktop.org,
 AJvYcCV3gvw7r2wQ7fiSGY02Rwgu6ajMHjzZdZKBTKX2QdkWP7FnVlcTpFOK4VPhD6ge/DOwHJNa/PeHAg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEuki04h2SxO/B7nCy+0imEz5uCkg+mOKUiTpSwy1PIHC+0u9m
 rL6147okh5A1we/sGGDzk5A2l8dWNn+GPinWNDg1mxCS7/sKv0yKvVpNl0YyHmzTUMemBX8ntmv
 SwFRbpHGmUO1EpIuB+6Rhc59GSio=
X-Gm-Gg: ASbGncudVugWj1/7orbbzPTW8DPo5bAOhKlX6d509FTQ69ZZFz1SfGpoLaWBlerUV8B
 zTP19ARHIbXTWawPaFRZ9oeg26L5274IIf80Oje+tRfdBzkBSiVKINQfJ6ikSRPaAEKf148q/Dx
 9fC5Ss53I8StApnmfdNOBs+o6C9RPyCnHgtEaK/4KYug==
X-Google-Smtp-Source: AGHT+IGpFcafT3b6aIOYtJ2V3tq0B+fB5vBSvNidH0DfLkAvD0boqzlYgVWbBMeg+FDMjz+arPmg3F7bSk7c+dd0l3c=
X-Received: by 2002:a05:651c:210a:b0:30b:b00f:9507 with SMTP id
 38308e7fff4ca-30d6a44cae5mr15914741fa.24.1742399976387; Wed, 19 Mar 2025
 08:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250316111644.154602-1-andrewjballance@gmail.com>
 <20250316111644.154602-3-andrewjballance@gmail.com>
 <CAJ-ks9kAROOfyPtxMe6LE4-UPsvXca2sQ2VDjhRchZp3HLddGg@mail.gmail.com>
 <D8JTWL8JY7DM.3IVH6FZ4M49CB@proton.me>
 <CAJ-ks9k+A1+0CWXZmD2m0+jRqTRTNFn-=d9VXqytiOqvn4BR0w@mail.gmail.com>
 <D8KBFC9M74H5.4ZJ2SJK06SGR@proton.me>
In-Reply-To: <D8KBFC9M74H5.4ZJ2SJK06SGR@proton.me>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 19 Mar 2025 11:58:59 -0400
X-Gm-Features: AQ5f1Jqy1G9xW_d_MZv7EIGIWVxFYoqazHtgodTNU3whmyJ8gAuU1mj5mo_jYbc
Message-ID: <CAJ-ks9=NQrz3ySacKt+XXm2vS+Fn9gjmtqAaaoz1k=iTG_1HXw@mail.gmail.com>
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

On Wed, Mar 19, 2025 at 10:34=E2=80=AFAM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> On Wed Mar 19, 2025 at 2:42 PM CET, Tamir Duberstein wrote:
> > On Tue, Mar 18, 2025 at 8:50=E2=80=AFPM Benno Lossin <benno.lossin@prot=
on.me> wrote:
> >>
> >> On Tue Mar 18, 2025 at 9:12 PM CET, Tamir Duberstein wrote:
> >> > On Sun, Mar 16, 2025 at 7:17=E2=80=AFAM Andrew Ballance
> >> > <andrewjballance@gmail.com> wrote:
> >> >> +    pub fn resize(&mut self, new_len: usize, value: T, flags: Flag=
s) -> Result<(), AllocError> {
> >> >> +        if new_len > self.len() {
> >> >> +            self.extend_with(new_len - self.len(), value, flags)
> >> >> +        } else {
> >> >> +            self.truncate(new_len);
> >> >> +            Ok(())
> >> >> +        }
> >> >> +    }
> >> >
> >> > You can avoid underflow checking in debug builds by using `checked_s=
ub`:
> >>
> >> `checked_sub` doesn't only avoid underflow in debug builds, but rather
> >> in all builds. But the code below is a good suggestion.
> >
> > Yes, I know :)
> >
> > I included that language because the underflow check is likely
> > optimized away in release builds.
>
> If the function is inlined and the compiler can argue that `new_len >
> self.len()`, then yes, but otherwise I'm pretty sure it won't be
> optimized away.
>
> Also if it is optimized away, then the check was still "executed", so I
> find it a bit misleading to say "in debug builds" (making it sound like
> it wouldn't do it in non-debug builds).

If we're talking about the same thing then I think we're both wrong
and the correct phrasing would have been: "you can avoid underflow
checking when CONFIG_RUST_OVERFLOW_CHECKS=3Dy by using `checked_sub`". I
was referring to the underflow check implicit in `new_len -
self.len()`.

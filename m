Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AF59271A4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CAD10E9F2;
	Thu,  4 Jul 2024 08:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e8IOrkAj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA6110E9F2
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 08:28:07 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1fb3e9e32ffso134625ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 01:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720081687; x=1720686487; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VqmuX6C9I4AJfUwdN8mu0VpBGXtWyEp985SM/nEyh8s=;
 b=e8IOrkAjwnHpR3a0fSsexH/6X3NMT2nO7TDYYL31bBmJOzq/KXmPOPDR/U/PQf3tEj
 dojRJJRx4lOdwqUQx6sahlUA855P8YChv0FFmdhYEntWDKgexNAEEfpeVijtL9x/sOnM
 8HTvA6x+7f7Kn9cJ/41zjzYGz45l0aSzxb2pI4+kD/56daTG5l3vm2oTRz3fLE2M2lRB
 u2rSIHrbW2HHCJCgF9M3s8FfzEDVms2Lg3zLfTP5iszbRO3aw3xQU6iBRLVowy+0917u
 7NyZEKNSkii/Kqr40O6JCwnRCP7qO2CTNKW3Oy0348LiPIbX6H28GbBWMZOwXdBrdX/I
 mt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720081687; x=1720686487;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VqmuX6C9I4AJfUwdN8mu0VpBGXtWyEp985SM/nEyh8s=;
 b=MoZc+8liHWFtb7W2tD9JqyS+ltCw9MAwoL6dqdS6VP+kEgBD1R6XxD+jJvcpLNepRF
 f1F/FqJ5/e18IpRtPY2KzGqH3gs5jqRiab4QNDISPoUx+Umm2s/D2NrVR0H8Fxsf0Pb1
 kTB4l4g0oLg7XwtyZ316en22SDlW6bVIF5KyCrUMC7QkmjzOmfXdzRDc7BORWTDst8n/
 fhDVo8wGTp6NTGVri94SfGxyCNjy0nfRtob+86XFSCHtYhX55hj96iSwdykbg7407rx6
 NvZhLqzShjQxxJHd4FbEB0uTMJSXvUFpxEjLJm49CaC2LAy+gZ5lrJ4oJ2AAMNI2fHcv
 LN4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa/qr+dnblwRTJO9Xm/ydCQnkcebDras3OHIs9qmNzHMBjtdUffAe1/A76rzLgg8+r1FkiNBF543rfa01sXU4vc+QpJYB//dL0rSFqH2tg
X-Gm-Message-State: AOJu0YxmKb1YABFOejMjC6XScB/z3mHQ9/+ZfFW3Hb1/gb7mgs7a1wr6
 Il0q1xAM43mPB3fK+pwH+zRXiS92difjTrkONFVyu0cu1Sg+77B3LozERjr2BL/Opbo7atpJrDD
 EYKdB9db0uqJO5YOH5SrXgOAJTAw=
X-Google-Smtp-Source: AGHT+IEpwhI5B0ua49mWTjBo4KXXy9eQRzJQa3Fwh6aYFAXYWC3S+24kRsdY76+yGN5g+sXoux0AVXwMQNSoWcarS04=
X-Received: by 2002:a17:90a:f2c4:b0:2c9:8f97:d2ea with SMTP id
 98e67ed59e1d1-2c99c6cc3d9mr671455a91.6.1720081686806; Thu, 04 Jul 2024
 01:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240703154309.426867-1-jfalempe@redhat.com>
 <2024070417-husked-edgy-f527@gregkh>
In-Reply-To: <2024070417-husked-edgy-f527@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Jul 2024 10:27:54 +0200
Message-ID: <CANiq72=iqquz3a0sN5BUa=-hxW3WBZTAKdA6HxwTh7rGBJJBsA@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/panic: Add a qr_code panic screen
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
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

On Thu, Jul 4, 2024 at 7:03=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> Wait, we can put .rs files in any directory now?  I didn't think that
> worked properly yet.

We can put leaves of the crate graph (e.g. in-tree we have the samples
and the PHY driver), but not the rest of the graph. The former fits
just fine in Kbuild (which is why it was good enough for what we did
so far), the other part is what requires a rework of how things will
work.

Cheers,
Miguel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E3CA174C6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 23:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8ED810E115;
	Mon, 20 Jan 2025 22:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gHErFQOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E284F10E115
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 22:46:16 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-216406238f9so12059215ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 14:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737413116; x=1738017916; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qoRVz4xot9U45X7WBIu2KHjDW+ibf4oWqCI2kYAy8Qc=;
 b=gHErFQOR+AwPRfFuaph3Hni2kUa+XgQKtyTEQePoSOwJbdhp5p4Dc7tW4G7IjUkS8u
 nAFVBQu/zxJdO5HOeVC97b64+2fmV7Ng2qFi9SPhUksmOQ24KxmIS4rxylr/gdueyRr2
 Dx2q12TmuN+oGUrB1yZCguPyqaukzOwtkbK81QsUJA/+Dvd8/UY3G/VKVV+vLBt9Ljfk
 lpRlE3GlW2o8SB5An8IEYIaWRcTSWzfwyN52ikLh2RE0F9mPOL+1AVx7O0YiSgMQv3fL
 SQYH8m+yuQWq5sFp2wcoysfdD57i9+gOiIHdWcD2GL9I9lBvUst3uERUZYf0M+PPVufl
 bG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737413116; x=1738017916;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qoRVz4xot9U45X7WBIu2KHjDW+ibf4oWqCI2kYAy8Qc=;
 b=PUD6hMJmWZERUyEwJtxa0SztiW56X8++gaRuJ78hbMquIRhTosR2sOe4ktREFuAJQy
 pjXQyN+oFj3AMgy0ickLGAgfj5Q4/YiG7Vf9/liNq/wYEp/HrpHXge9qZfyVLIfV8Rv0
 RA1RAkUnWevhKp+J4eIzTz18Roc9IX6/NhOlfw28mkVt7z5SORdg6PJiJqeI+8/HTKrs
 vEVn9AODFWKQQNS1ijFg/lnu+sbuCC+Rb7mVhCDUEWCqztyfxSR8tKnIoCDsKsb5xlwX
 EIrarhdclCRs3gNTsecUa1n4o5fOp2lbVo1G5vdOb20tiNiqgFZU76D3aQo2irAfHlZ9
 Busw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYBxkBWuIoWYEnumQjFYBipHkzhlyom2naH/6Z9weDbPPYsQmTswO9zeJYWGEXPJOLQLMOqZHEyN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWRyr+V5WFOWhLAGbzD4CAoja80X55+wvV53fYNOrv5uRGZxTw
 uMWTLeYFwUzkyheClAsZ4wNXqckSU3qe1WhnifiwqJBLlkbn7G3FDA3M0GTSJ8fJW7cun8P9s44
 SlMsAbfCsFl1lKGO4dixTYFyJb+s=
X-Gm-Gg: ASbGncuUkk6TlthU1RXxA7Ss/XJJgSyOwWosjERNHPu5TG3ClORJlYz//o+LaTGSPF5
 GuvvvHNXuektnegENBA2ue//Q4AG6bkMYEMXtCuk21g5nEQhOgSI=
X-Google-Smtp-Source: AGHT+IFODT/xgYF7MkVM3GEyRLVEiM3Xsefx3OrlqeMRmOQtqHLNxXTFaliFbhmPohpf/AsMZz7d8/5zFFwj2Mri1ak=
X-Received: by 2002:a17:903:1c2:b0:215:7a16:8389 with SMTP id
 d9443c01a7336-21c35536f27mr82671565ad.3.1737413116501; Mon, 20 Jan 2025
 14:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20250120124531.2581448-1-linkmauve@linkmauve.fr>
 <CANiq72n1YpUowTh3Hdjo5auOmTTUU1-8d2FTL3e=Oyu3Q=-BkQ@mail.gmail.com>
 <Z47IJ-2tPDIVzMA4@desktop>
In-Reply-To: <Z47IJ-2tPDIVzMA4@desktop>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Jan 2025 23:45:04 +0100
X-Gm-Features: AbW1kvb2v2Ti_RvHiVDTO7BSLtPZG1cOcI0Zmq7o1Yi40QX64ft-88D8sAnjWV8
Message-ID: <CANiq72kRwmnM63Fb-5U5aHTjW4vh11-sii5eVf6BWvCqJViEmw@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: fix compilation issue on ARM
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Jocelyn Falempe <jfalempe@redhat.com>
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

On Mon, Jan 20, 2025 at 11:03=E2=80=AFPM Link Mauve <linkmauve@linkmauve.fr=
> wrote:
>
> when building with today=E2=80=99s nightly compiler (maybe that=E2=80=99s=
 relevant?).

Ah, that explains it! The type changes with beta (1.85.0), and I can
also reproduce it in CE.

We should probably try to backport the cleanups we did before the
remapping, i.e. the commit I mentioned in the previous reply, so I
will see if those apply cleanly. If that does not work, then a
targeted change can be made.

Cheers,
Miguel

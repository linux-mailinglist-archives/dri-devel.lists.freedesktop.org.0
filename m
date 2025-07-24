Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571CEB11253
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 22:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD2410E091;
	Thu, 24 Jul 2025 20:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WJ6RvsWL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0EB10E091;
 Thu, 24 Jul 2025 20:29:11 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-23c8f163476so1228585ad.2; 
 Thu, 24 Jul 2025 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753388951; x=1753993751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZM/cVPMjqnDcAHexC1gwfwrsHc2MgoIp0pKcizUhlwQ=;
 b=WJ6RvsWLcrHDfoaxYTy9Oyk3CMSSULg1M+Um9kn7PGAFSYSS66AlsdyTe14+ZsBZmb
 yNLKoAhtvO3U3Ifuo5OdSkFjHij3Ju+dy7uHK3gpuaEDocBwhKDWSYNClqH6sJPvmI49
 7p6i3+9rhC8n+zbHTd1Q/ZQ1uEZibIiRFFn09rNZI2E7gemMVNATxmsiHRf3SRtFJQAR
 npy1Y6Xm3+/MQ3accr/MJPyJMrRWon6L9eO+IHLSO6KWhdnlfCpDGXBHMs3sS1x4Gu4B
 aFM03JV+K7CoxJUw2t9OdPH6aTYq2+IboP0MiooJbFEQw1GBwfAj9KeMtQcvEGXveHF5
 ddtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753388951; x=1753993751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZM/cVPMjqnDcAHexC1gwfwrsHc2MgoIp0pKcizUhlwQ=;
 b=TRAg0JwD4st9mbrj3XEBQHTllqAaoyogOxMBrloP9Mb9NT7Q0biECLobGeGn9uKLvb
 FI4GlL9CIp8bhzHwOFiDYbldFpmGReWa6IJx3D+l18463hBiQ3v0kN+ppa0ODHh0Amc9
 tc2RGY8Zfj/FAvT3z+H4XkCZFCG93aF1HyqdKfeZCSivy85TITgpo3MZfBcx/Op+bWep
 LnR5lz25+k0z5r82QNCaoYXR1b00/nh7fLkl7VGpSl/+ORnE6Fik4mxWOry9gRQ/mvy4
 8PaQpNospBAtJnQmEL7Mx48pQeLmXJNzWeon+y6XwBgX1+ZjjJbJ0kcXKCp8/aGxDGiU
 VAVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmIL3Siaw/bCOYUkN32saJVR0FPOx6k5qmKXYNmkueDxRH/7/AzkCozFGHSn9K3fui2NVbbLLgWQ==@lists.freedesktop.org,
 AJvYcCX2y2rjPtolcbfro4iwdIWI4yF4WfvmTwHbmq/qJJIGo6IBiAVEFZ2pd4l/gNLWetalvAGVITCjIwc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMdJbGyOG/EHl2RMjK/HO/S8FHd79l6VDFvx9645ufvngyOr5W
 elTXjc2sXWwBZto7HEtrXuYh90Sc2B3uMwD3EN5ETVAKTK+LjZnr1Q0jk9Sg0hz8P7LF+pVhguU
 UQmgFEUK8+KSDB+u75F5NscFa2vY5wVY=
X-Gm-Gg: ASbGnctcEeHfXznKX9SdGnucla3GajAht9RD1n4SCUEnPHssG4bL66lBzYbb/g0tKsa
 lTBaZ47p7Kbl0Vf4GK9TguEeIe5qn5MOsdHSHfweKO5IojozwjUd+NNsdT/zAtYjhn60H629gFz
 zCgTt7lAVhNB2DUVOrm7qKc2+rTu/Mzy7w15acYlc5Bmw18nrEwegmKlDn8T5FlfFNUYATBo/DL
 z6bLl+1
X-Google-Smtp-Source: AGHT+IEAGFB37ZidsHLIIaba8FiGeBk2ECZccsALYfokim6qqvD8w9f6H1DHr7EVTrqZ0BiawsUQhH+jUVVtuE4an9o=
X-Received: by 2002:a17:902:f54b:b0:234:ba37:87a3 with SMTP id
 d9443c01a7336-23f98172235mr43503445ad.3.1753388951451; Thu, 24 Jul 2025
 13:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250724165441.2105632-1-ojeda@kernel.org>
 <DBKG6CA32OO0.368N1Y6VMIUTL@kernel.org>
In-Reply-To: <DBKG6CA32OO0.368N1Y6VMIUTL@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 24 Jul 2025 22:28:58 +0200
X-Gm-Features: Ac12FXxpi3gEikt92Cs8uSRLZnJHZD2m6LWFkt4o9DdE2xrir2WW5NTAjXO6LT0
Message-ID: <CANiq72m+t_vvBsSkgmHCtUvXOG0EOVTBoOij0XZTM1mzd7mNUQ@mail.gmail.com>
Subject: Re: [PATCH] drm: nova-drm: fix 32-bit arm build
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Alex Gaynor <alex.gaynor@gmail.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
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

On Thu, Jul 24, 2025 at 7:05=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Thanks -- will take it through -fixes once rc-1 is out.

By the way, in that case we should probably:

Cc: stable@vger.kernel.org

Cheers,
Miguel

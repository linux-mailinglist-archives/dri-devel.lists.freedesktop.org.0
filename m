Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF190C93FAE
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 15:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4353310E1FF;
	Sat, 29 Nov 2025 14:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lYMNXJUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A0610E1FF
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 14:31:06 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-295351ad2f5so5237545ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 06:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764426666; x=1765031466; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yMsbazQINn+Ap/ydJGs+KwKtfgjlcNUADEg2wwTJeFI=;
 b=lYMNXJUezepyqKwJ9hnudOtpiYTrKxXorYB4oAlVn+Xv7FoOUA4HbEIMxvKiVI9NKL
 R7nMVEQa6k2sY0ucmqQPdgHSKdiWaONmdToQ37PYTzHyvEK0Z3Rr1K7g8/p8Y6AY1zlr
 4t2of57Z15QWhjLLC1wKoW/L3K4B2mbUlmBsn+ERSmgFfLxnHfAqsgRx+Z7Re+iK+ayK
 hwaD+KEJAG569kSvUFEe43rtD3g8fTmx2zOiYQll6VRJoGxAzoiWfgJ9hp3rkoBpCujM
 q/cyCyLWVjX/GCe97ZI2Uz7wM10v2AnmYN8e2tcAeB21fTjrsPfKtFGS3yge3IO3c3cp
 Icxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764426666; x=1765031466;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yMsbazQINn+Ap/ydJGs+KwKtfgjlcNUADEg2wwTJeFI=;
 b=L2fBosoTuaENtw4DRmhZJvUH41sABTiOHpDum6JVsZWJ90C9TvyWBDylJRbHyImvQL
 EgaWxDPN4fGfxvfLDhEkzvNECxNKykDqGX4d2qm1qV52mKLd0tvdxZBmcI1ypJ/kov+0
 iVvqqlYxbu3WPj7pmHf63URQJvW2ioSJF5/SNOBY3hylrcFms0Yn378UTvy7SyCM3h/5
 R/RNMCv8s2kB7nmK+zVNVdBVF42HwahuYE9Wl5Fk750Hl/wW6NDDt0a+ZKAdHc49u/KY
 XYp04xstk80NviNsNkapbQqmQWOL7/NC67dTIAyMIpnc48NIp/D08ET2OX6m8+Fc9tf9
 PP4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjD4CEdj6EoGDMcoodoWORYQpF7h4GdXQdRKgsszDY/jcuRFidT13yReFUcvVOg3O4iDqKcVE4gnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMBwWYp7VA+7EQKpGT21HnU4fm79DkhjqKz2kNtEtFP5te1Qsj
 23Sk+JzahYmTvBlbkj1GdTb0/e47s1NxJF6Ce3sZUftUW9vYUQsd+RuZhJ0TdkYrK/rrixXOQQA
 DGEoIP71ndX8lz6ZPJ+LJf7PKb6Jh414=
X-Gm-Gg: ASbGncvi1VjzoujbF2Cu9xJebXAeqq4nP5M9j0Iy1BXn8cdj7DZjXCQYwh4EImzexWD
 L8SVPrVtN/Ax9+LjKOV31o2Msi1tAglTbbrWVdCBGXS0whtJTPt7HGgB8nxSswka6gE1WM7l7hP
 9V5JG7woatwSmvWt0BCtbhyG+P28W3+sWQvIZFPpypJ50/38Lb/NpKajF+5brE0dKQd993ngG93
 0P5dGxFdwXuYOJqi6ri33pR8w+h/uRSEGlQNZQECdOz/dsUrs25wIdoUQGfDezQ3oMwUX4+vfzO
 kH5l4/2IeoVn7NgzTn3E0KXZa27sI3DMo0bDRvPI3t9qpDhWIds3ZB6cO21Fo4kLW/GjbW8YUeo
 yL6jUeu37zLBugQ==
X-Google-Smtp-Source: AGHT+IHcOsjVFY9XJX2BiFAdmsHJ/f20IbX6P9+zd7PQm2nCPKxCB5i/K/WGxRB0xol4Ze03XmNGaR0r/rbYJIpjsVo=
X-Received: by 2002:a05:7301:4084:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2a724bbea18mr18350746eec.2.1764426665752; Sat, 29 Nov 2025
 06:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20251129134834.34559-1-atharvd440@gmail.com>
In-Reply-To: <20251129134834.34559-1-atharvd440@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Nov 2025 15:30:53 +0100
X-Gm-Features: AWmQ_bnPoDsTRNk5YATBKX1OFgMn8zdQLMedx-ZaZ6SNnvYibRdyQixueZZy5wk
Message-ID: <CANiq72mSStPR2Htq3aRS9FLbiHALJP21tTSgiwDfQJBR1zHr4g@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: use `pin_init::zeroed()` for file operations
 initialization
To: Atharv Dubey <atharvd440@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, dakr@kernel.org, aliceryhl@google.com, 
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
 a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
 lyude@redhat.com, shankari.ak0208@gmail.com, lina+kernel@asahilina.net, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Sat, Nov 29, 2025 at 2:48=E2=80=AFPM Atharv Dubey <atharvd440@gmail.com>=
 wrote:
>
> +

Spurious newline?

Cheers,
Miguel

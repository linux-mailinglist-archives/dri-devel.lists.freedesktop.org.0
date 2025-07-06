Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C19AFA597
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 15:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA5710E2B5;
	Sun,  6 Jul 2025 13:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KZsJUpTd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A54210E2B5;
 Sun,  6 Jul 2025 13:46:25 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-312a806f002so433356a91.3; 
 Sun, 06 Jul 2025 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751809585; x=1752414385; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gKLTNgJgTfofCTlF/JST0qzlC2FbwxSOsAmEM7FOTgU=;
 b=KZsJUpTdaD+c6ovB/lzBSIegPdzWXv8MV/fHrtreAQI7mdTw3bnK9FPd2KW33XC+xO
 dzegukY4Mw/1AGIbtF3JqUBbey6QY/riV0XxwxClUUy0Y/BTBkyUHgjRKX55bztO89q4
 n/pO4083c3cSRhtUDqzSXOaDV84Xu4D+5piv2SD3XXQBeZ1weOPdTH3C0er9A0JeMVlT
 fjhk1GgLwgrVha0FBw5veprr+Q+b++5Iy50DOOe9V4lBjyqPCjr1EYLqg8qfMpPTAqWk
 k9BCjMEJVpS5KwQOUpeF65t9YlCzGZimDxwogZqdKlgaMUUSXP9V2evM8rvDhNQb7PBN
 gcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751809585; x=1752414385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gKLTNgJgTfofCTlF/JST0qzlC2FbwxSOsAmEM7FOTgU=;
 b=W2GwyP6qL1GoVdlz4Z5Ri8t3/xp/wujSGsph5EzcsldcVb7OwkbO9FVsJXqsF9xM5A
 nz1+RpQbGSW4GtVlzlEXqT3nmix+ZE+GI7Sp0YTXk03stCun0Jtkc6jAvuQvRzbiiexo
 AAbhsidFLyymunhogABAxBSSkJBiyjSi6Nmhpf9CErCViTu6hFBOLDVuYb2hvPzIhAgO
 EoWzwyFFtITbMiGy1JihWev7WA1RFeryxdLmHP0DX5o8gaI+6rrO8s6c7lV2RBI4DR93
 ljneYwAtJZVvchgAZa/+kJ1Tj9+cK8fBt+umTJ2XkN/yOhG5Eqr1upuhy4Jhz/KPvzkT
 X2+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQiNPwav27RnQ4ggl9mSJSeTw/3GaVx8CGW2ezCRInH4LPCPSltrxquR6VvI3VuKWY4csNbW2yqg==@lists.freedesktop.org,
 AJvYcCWbRqJekImM9ln38QI5YUl6PCL8Utfyv29pzv76duG2UTFL7gh73LaLBjtVZfnnT31YCxA0c/z+A4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiUEB3R/CwDFdoEerVenT3a3133bDBHJbNKlN1EBoX+J32i16O
 mCLLDH2bHEQBHTVLSXBzZ0Ug3rqVu2l0nRrwScG2aUjLCbPbg4sbV3sRwIihPAXU3ZdcXQr355K
 POYeos3ls4WblxFeYdOnafRPqWmP3Gro=
X-Gm-Gg: ASbGncu3QGbKclL9Ny7VJbhnDMuG0WWw2Oefht1EYMYFgSHBOzyfIwbE/YLfcwjo3ZS
 WiADcZIhm26jN3qhonh6S65bON0ycx00jn9sUO3sicoObx+M8UcrQgwUiNMhtOmNJiRxNtcrFh6
 rIWQ2FALuv82D0DbnUANDxEL2F28MAUuf6asRbUDDJj3e8ZrgNJYoX3HM=
X-Google-Smtp-Source: AGHT+IHOv9GZgJf2WFKprOIy64F5CrgixXl8Scf2KyipOzlw7oCckduzujowyADaYXCyuHIJ4iHyaN1QrOx7fForFnk=
X-Received: by 2002:a17:902:d4c5:b0:234:ed31:fc9f with SMTP id
 d9443c01a7336-23c873bd881mr55359015ad.11.1751809584805; Sun, 06 Jul 2025
 06:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-2-f362260813e2@nvidia.com>
In-Reply-To: <20250702-nova-docs-v3-2-f362260813e2@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Jul 2025 15:46:12 +0200
X-Gm-Features: Ac12FXwSGwFmNVg0dK0RITOBy2nrTS1QW7QBJAFG70NZ191EM-5_o7Lr9NDvmZQ
Message-ID: <CANiq72nh71s9to5v1KHJWN79bEFv97zN6jcGJyEQkaJZ5UuJfg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpu: nova-core: Clarify sysmembar operations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Joel Fernandes <joelagnelf@nvidia.com>
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

On Wed, Jul 2, 2025 at 1:05=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> +/// driver initialization, and before any falcon is reset.
> +//
>  /// Users are responsible for manually calling [`Self::unregister`] befo=
re dropping this object,

Missing slash.

Added the possibility of catching this automatically in e.g. `rustdoc` to:

    https://github.com/Rust-for-Linux/linux/issues/350

> +// These two registers together hold the physical system memory address =
that is used by the GPU for
> +// perform sysmembar operation (see [`crate::fb::SysmemFlush`]).

This is a normal comment, so the intra-doc link will (sadly) not do anythin=
g.

Cheers,
Miguel

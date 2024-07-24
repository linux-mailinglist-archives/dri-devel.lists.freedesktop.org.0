Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A6D93B2CB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 16:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8B510E6F7;
	Wed, 24 Jul 2024 14:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dv7Iqlp2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B977910E6F7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 14:38:30 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-6e7e23b42c3so1276985a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721831910; x=1722436710; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5YfGNIlsO/NNcdOXqpqBk0T6w1npLT4dQ3KtAyVFgQ=;
 b=Dv7Iqlp2NfIrDP85zbj2l9dhn9YlquNWjcSRiEbNWfhrka489ox7KbkeAj1CtKd2EF
 DASNHZsEo+gH3ITDZtZSFTGVdFcLQReSBoLOLrIKpIjq3fJt2FvU+jD8SKJ2z5fckRp5
 +rSgMCDDCwhjtwSl77f/mMgok9Dxhs2RsTso9aqmipgjBhgDGg1YjfqGEiPJzPMP/Q3x
 THJ/8BkzbNmAVRN502z5vlyGcqp4ahTX7OQxxyFNmJOLaRuHLD47icyQzMbvuteUObz1
 iXhcaXdPEE5SJtM8tIeNuzAZDI/QYcWnYgqd2FvkP7w8run1wAjAML1gdwIY1TtWUvHL
 ZrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721831910; x=1722436710;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h5YfGNIlsO/NNcdOXqpqBk0T6w1npLT4dQ3KtAyVFgQ=;
 b=nwxQB1YZjcJiN63IMOioRRvaJZL62enNbOtx0UTNJORp1FfFb7slqYj1HBn8gEPJOq
 NxA6fugwQbmGdN/ajMpXTxaLhjpSsS6+WmSrqz/MP4Xo7d2vGECJOGp3rwgTF646yb0p
 hMDV8OEpjrI90w8Y2MG44lb+r8KnqakJnvBE2bnzG/OPLaVzrmpB1oKHjvP5LJufu/2T
 Kd6z0zdJZGC6pydC1zUW69RxBHqRRS4xzt+1YMIVcR9izgbDpioFHEY0LVO9pWfWaZXt
 m5DU/jh3oiIBQE5LZ7BWhB9LIJ8M4DcSqDXYV89KVypG/RpH2sJ411LDV9M0Qh91JTXX
 Vokg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCe3qfXWExqt0FIcymQcy334v7evjUO+ftOJwM2taE4DzSLM6gW6qFqhZD7H1GIJbVAB+waDxtekcc43gMfXC1Gfsf8GFaFzTjeKu7ZXO+
X-Gm-Message-State: AOJu0YzB5tYw3WevLEJVt1MoDG3Rxpn/wS8ZcnuJ1VUhuwL5kq1mzpWH
 kTbLekek9w2Y+GY9Ot/cmMOEqbcUl4uJzzHI93uXegFInkRaC88hkGGi1qFWv4CKEKAOgY4QDK8
 x59GDQnkmzkY6CM6KsCaD3KFohro=
X-Google-Smtp-Source: AGHT+IHkhoNnAUc5XxPmutCwvMdnvpdALQYON+aoV564xC4ii1mPdF6qwNMOsDonPZyJGvSXrQCgN6VolR2UrakMRW4=
X-Received: by 2002:a17:90a:ca86:b0:2cb:4b88:2aaf with SMTP id
 98e67ed59e1d1-2cdb513f24cmr2794532a91.12.1721831909978; Wed, 24 Jul 2024
 07:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <edda856e-3102-495a-8cc6-b79f5f114833@arm.com>
 <20240723180642.73502856@collabora.com>
 <6ce8fd12-b175-4a8f-8ea9-6221a555b69c@arm.com>
 <CAL_Jsq+Dr5zO5MKEGq0dW9SuTuawaJMhHziFd73Ef_S1zbOkXw@mail.gmail.com>
 <6b60a83d-8416-4cf8-b373-dc3c697c788a@arm.com>
In-Reply-To: <6b60a83d-8416-4cf8-b373-dc3c697c788a@arm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 24 Jul 2024 16:38:17 +0200
Message-ID: <CANiq72=AFLogwowqhi-hwYT1UcnQ+6kidg2Ni-Q0vStKK5wuSw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
To: Steven Price <steven.price@arm.com>
Cc: Rob Herring <robh@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org, 
 Danilo Krummrich <dakr@redhat.com>, lyude@redhat.com, lina@asahilina.net,
 mcanal@igalia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 24, 2024 at 3:54=E2=80=AFPM Steven Price <steven.price@arm.com>=
 wrote:
>
> I'd be quite keen for the "fork" to live in the upstream kernel. My
> preference is for the two drivers to sit side-by-side. I'm not sure
> whether that's a common view though.

It is supposed to be against the usual rules/guidelines, but we asked
since it came up a few times, and it can be done if you (as
maintainers) are OK with it. We have some notes about it here:

    https://rust-for-linux.com/rust-reference-drivers

Cheers,
Miguel

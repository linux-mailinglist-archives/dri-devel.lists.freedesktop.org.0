Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD73A28832
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 11:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D997410E176;
	Wed,  5 Feb 2025 10:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="AiQhzMRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF78310E176
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 10:40:11 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so3460308f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 02:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738752010; x=1739356810;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ok3L9NOrgiTrJ2G13cQv6YeWLMGqGxKCuRCJEVtHz3s=;
 b=AiQhzMRcQbiG3L2Z7j5j3kdb43eATTTbgPbLw9XiygDjpqhGDu+4mJySLmPnZ0AK+M
 D+m7jKVbDuxp5HKhWpoeO27/hqmZetV4hAj5Cz+vvgKWY40zsX48X/SrBj7cDPWnSFUu
 E+rbic9ehMBRL0F8Z8Ih2va94NPNH8UATnEfw2s1ASS1PBYt07HZu2z/PD5OOFLgQgvZ
 cy6mo5Va8vHetMWpH1IARNmtQNqEdsZsZAyDg58We2BlnpprTQTO9bfdV96CAtN+PrF2
 Bf0iCKG41NWEJmbDPzRAr5mh+lJYqSVUnk+K3zDEhTIQSt9hF2YPiJ1aoMjQ4URVlP8E
 pb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738752010; x=1739356810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ok3L9NOrgiTrJ2G13cQv6YeWLMGqGxKCuRCJEVtHz3s=;
 b=BAI/i7/CSkoOEtJnYR/Q+NVilHoAZFrbpcA1CYqojN7RLK4iSAvLDbx+L3r8aZwMIN
 yoaO9mw9Bfhhk3Fa4+Zpj8kisOhFWWDcexgO93/Xi6BkaZSE86qdJJyxajxvxpzoC4t/
 EnwURYm0cN2LpEvRSsVq+l1oC4S3cGE9VeemLul72SA8Jk0nft9kZOLyUStRJw/cC2z3
 0XzjnNmtXTLsJP5Bj0rUnoDCJAVqscZLEjQIqjE7YneFjcNNb6IoYLHLfrL5cfuvzKsS
 gbA/XVgEdNXMX+axNhHQqyW6A6qjbNdEMs/BEev/3mHkmGFvFqSQ6Mj3sWG3a4Vb0LWo
 I4uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzSPsmPrvaxro4aH0ZvopMk00dQsc7AKK1WTWbWp4sUYEscnTZ86WbQc7QJVMhpFNq12sRUIfH2Xg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKPMo0tvp6rT2kHwJlamyRZ3Hr7+rTpMVMI2Vq/0mJnG11F9gU
 naVDl2sns8Q8EiaDMMxWRuPkezDEqq9GmKhcaALHt7PzXALgawbcbhs6eANeRm+LQIPxSvEB82h
 xwaegyKDmw1+mpQ3QRrw//QxkIhdu8ojvgfeG
X-Gm-Gg: ASbGncuo+HiZwLFNSoMbyTLpSTO288MibzdceJQzBJSayWDW+DsiHGva+gTxiAb5brq
 zdT3lvajfD0LCWOCrjKLi23M12tIa+vcXxkjXdc91yxPT1zJQtbJ3hg5H3QmgjCYeHJ5JrO9LKO
 X2K5lV6DWrp9RcoIwH0VeKUgc6ALI=
X-Google-Smtp-Source: AGHT+IFgCfsYB5W3VJfmXRjdXwgsawgadfjC0P2QF+7DhKkGytDdoyEZ1kYgYvSLSTerc4B9u7Zm9jyi++oT3By96fY=
X-Received: by 2002:a5d:64c3:0:b0:38d:b3c5:4a88 with SMTP id
 ffacd0b85a97d-38db492050amr1485678f8f.54.1738752010235; Wed, 05 Feb 2025
 02:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20250204232824.3819437-1-robh@kernel.org>
In-Reply-To: <20250204232824.3819437-1-robh@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Feb 2025 11:39:57 +0100
X-Gm-Features: AWEUYZnFbKuaN4rtly1lDrAUSflqt7pqmStwcS774dgD-QUDEKs-d5zWsQLWkUc
Message-ID: <CAH5fLgjrYNek77De6SgCGiLRhWWXNe+PKc1_ecPp9MbYDSj43w@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: Convert IOCTL defines to an enum
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Beata Michalska <beata.michalska@arm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
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

On Wed, Feb 5, 2025 at 12:30=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Use an enum instead of #defines for panthor IOCTLs. This allows the
> header to be used with Rust code as bindgen can't handle complex
> defines.
>
> Cc: Beata Michalska <beata.michalska@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

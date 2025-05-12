Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A10AB372B
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8005110E3CA;
	Mon, 12 May 2025 12:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QaJn82/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E873610E3CA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:38:42 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b1faa09bae7so639000a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 05:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747053522; x=1747658322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L2vR12jukEHB8wkI6/8ITyfRSdlOZ7QdM2sX73UrN6c=;
 b=QaJn82/hSeST/5a6nS0JWpSFi9OtIPsGfCOqRpdg1FpGOulHR1lMi+WdxIh4foVTcb
 X81ySOfd04cgfZtL3ToDZe2b95iRjKyzBAh7ucF8TCL1Lrpj+UiTNKPfZg/Kb2UY+zP3
 kbUDF1V/dvDABCUxo44DjKck1+wPWMu9nZ91ozzE+9drvFlX89Bt+iPrgy3UoyZYVdLD
 SdtYYb5Pp5Vc164wQFIIWYOZH9leBgGbA5P+f72UR18Oqpa+r1PlhPHXGK7rOAiZEAG0
 +0tUhVy6vOvutZEA78mx67t2io8Fy8+Ebw0h7MI4d8z9jZN3ItfjGcNLzcNsfOkyI3C3
 uUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747053522; x=1747658322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L2vR12jukEHB8wkI6/8ITyfRSdlOZ7QdM2sX73UrN6c=;
 b=kZ3l6lCpPHlvpbmXzm3LGFv8S4CMRVr6bxPKggE0SeRKiO/0SRRNPm7xvr1Zvl9Hv9
 CBjUnDn9dNfsyotBBCEMoP07LmjkrdoTryD6i1nQ8Z0GQ7OnIMojMuwWQDoPJuYANMHb
 rm/uXxLkAQoKF+OiKJ6KtmOS1Tv6tggYSUm7igG/fXMC+JMPQYQcg4gSCTSLtPD035YM
 k1uYbYwXx5tKT/ItllznLB5aN+2HXx5XYrNKHpJp6mesclCQMT7/jDysQzl+0ycrYJOl
 /0/oEJ2PKE2Cbg7ytt8wb20iGI2zgoveOVM9LxnMTHC5qrUn1LeB9Q/geVauUUZrhlLz
 uu5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE9uYgiEiOfXNhcKiP4m4GJ9PdnnEuwbUDtYiSQ/w88cDWT4AZgspi5yr7Cax8vlcyY7DB+Zvxcx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy1QmALvq1B606eWcdvtJxGWCyaBzSgWs6lAVJGedXeVl3/xGR
 LOz7p3egertS9szW73exz/O7JJ92leXlNQ64DoZjrAQuypiTkNeGhQzqrMrIR9JyIZacYWtc9uK
 N7KcNUmFMOc4o7foc9aQDocSTLMA=
X-Gm-Gg: ASbGnct2zbcXc1gdjougCG26p7eTh0ephmo9pSKlsCAfYkqTZSAsc5Ihec92zYLmzRV
 QbOKRUdTiUuL4ZyhtNV2ca6vWHeuQVTsA1r9yDGGdFGSHL37xy+QavJAovyJHP/pOIa0VPRqh+j
 Uc5CqgB7wuNHjgOUNCHN0fHoqCr9kQKEKG
X-Google-Smtp-Source: AGHT+IEYqcS6EXB4bIsasmrb2iRFTXQLZPzpehKramsuR+1+ds9b4AEMvbC9xZkWHCXsZPKqLPabOXW06X/TVCmz/oY=
X-Received: by 2002:a17:902:ecc2:b0:224:1005:7281 with SMTP id
 d9443c01a7336-22fc8b7ae74mr65103295ad.7.1747053522145; Mon, 12 May 2025
 05:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-8-dakr@kernel.org>
 <CANiq72ks_1rEQYvYY464WOqAGKJTQpgvjM_RoBkHTJhMx1euyA@mail.gmail.com>
 <aCHk4286hSrq2pym@pollux>
In-Reply-To: <aCHk4286hSrq2pym@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 14:38:30 +0200
X-Gm-Features: AX0GCFvggQ_DN2wFmgfdRWsgwN3vMQlTeCFDKNSKjT_vFgvFDR_6caKO8FxgrNY
Message-ID: <CANiq72kshyTc8iK7a456wAKoJ9pD6omC_+zTZHf+k4Y=ME+aLQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com, lina@asahilina.net, 
 daniel.almeida@collabora.com, j@jannau.net, alyssa@rosenzweig.io, 
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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

On Mon, May 12, 2025 at 2:09=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Lyude's series [1] should address this and the other one you pointed out.

Great, thanks!

Cheers,
Miguel

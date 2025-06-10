Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0F8AD3364
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 12:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A1210E4DD;
	Tue, 10 Jun 2025 10:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZuC3h5Z8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C486F10E4DD;
 Tue, 10 Jun 2025 10:16:51 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-235248ba788so6462595ad.0; 
 Tue, 10 Jun 2025 03:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749550611; x=1750155411; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UUKpD09dHui4C4fVtz7ec5/TcctLfFsmGhQ+qO4+hGE=;
 b=ZuC3h5Z8VnhKn+HpL42TMeM+lGYX7CJPGiZZck7+1zCVIXuj2MZIsACsA1ZmWpdrQy
 JKN9yH3D8TyHUrRMshD1zHhQglqfFf1oYePj+cbqp55e2uooBsXZbq/12EopmC6faAi2
 Udd0daI7E6cbq6e26Huag9Gi4xUQGzS0HpsgzxRzBdJeolDPHLanFsp/Fs1hSDFhetjU
 y1DBi8GSKJUEiu404g/PvX/KuY54tDOdqauaX2E4Akz7w3rW8bLJD2Vx6mZo5ccyft9q
 JYOS63N39W2VnOJpOduWY/aTC3heKCvK/ffVRT7wFEWFjHvR0K7Mv2clqnjn82dYfoVW
 gAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749550611; x=1750155411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUKpD09dHui4C4fVtz7ec5/TcctLfFsmGhQ+qO4+hGE=;
 b=GYbnyiepdCAchYNoIiYWX77yRAlT0IU1NeZvwn4lpBdL3Ur21r1eAPcbxbXq6MhM/M
 B3iZvcqAyu3etr1e4y83aoxo8aTvhoZ+k6Vq7LQPfKq8C0r9WsfHtf3P2WAxaYVfQBl0
 b0KuutwwD2vVkb0oekJTH7tW1wBwDBin4xhYWc0e7lTeWQktk9hE4u3UwdNpeOGrCdJ/
 4VpXzdZMKQ62TxKkYyweU+jM4cB8NYfiQ+umMpcCuOHPY2hvBfl86waei6V+fC1A9bGN
 Y1C3Qb0eBpfoAQ3WstYY5x2gVuitEpUlvHURKznYN9F6+Bgnvg+el+hlOoTfUMRn4CuP
 5feA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzeIgCYplhwyYmnbRSKl1josC7PTqvk0zXmJG1z1+AI1d6dWFidiRhAypmGI3tzXtuzQyro3hVMQ==@lists.freedesktop.org,
 AJvYcCXSiIu66PEzHIeQfytwHcJiACISJA2FfAur3NyYoY8UckQ+L+OIZcm0RGmxtyCJbnx931SSqFmlYfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym+BVhE7GL1wQx3+Fykv5sabOQ961c8yiAD5ECcMIZYYaxxDM/
 PtUp3hpIfcuvx6Uu+P6TBhX//b0u66Nl38UYg0j4rr44RBi1Elgc4bUclOmNfVs+mLTDW/TjEMq
 T0yNiO9PVBW+gLBmH2p87C9Mvc/zYhtI=
X-Gm-Gg: ASbGncsz0kGsMw63pCq6U7cKocip3elrfHdEPNpNiYuauTRx7bb7qlepXn7X7YBDj5n
 buR+l2YzmlcvZ6cPU1rfilsWp3wjkooUHsIuF5vzSW3/XB1qbmBg91Z73yuUFufDEAbbugb7FE7
 cPLx0sn9C/C8ov1iEoJ2bg9F6EOfnCeNx9ov2WAE70oIo=
X-Google-Smtp-Source: AGHT+IGjNe4w/TZWClCQSXCO0edDTMBkbQhOnY+c8pbDSn5UW9W4Wf46Bs/AhhcRk7i4bblmszBZ6m7JuEbjAxmj0uM=
X-Received: by 2002:a17:902:ce85:b0:234:adce:3ea4 with SMTP id
 d9443c01a7336-23601da9a61mr93668205ad.10.1749550611325; Tue, 10 Jun 2025
 03:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
 <DAIQ9342ZFYD.3VQVI80A18HKX@kernel.org>
 <CANiq72kC1j-kprAQ5WU0QVV_zhyKfDPJ_M5E9xZ+8+fxt4R6qQ@mail.gmail.com>
 <DAIRU9INPO8A.1PLCLKFJJGODH@kernel.org>
In-Reply-To: <DAIRU9INPO8A.1PLCLKFJJGODH@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 12:16:36 +0200
X-Gm-Features: AX0GCFvnab1QEUDa9dFfE8CNMQFcfiIoOKuRWyWSIv2LB_UaenukRWb6fdKCArM
Message-ID: <CANiq72kORZjTe3tPEBueDi57TGF7KfxgTSw4Tn0DQeK_X5hi5A@mail.gmail.com>
Subject: Re: [PATCH] rust: module: remove deprecated author key
To: Benno Lossin <lossin@kernel.org>
Cc: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, 
 dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, mcgrof@kernel.org, 
 russ.weight@linux.dev, ojeda@kernel.org, alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 leitao@debian.org, gregkh@linuxfoundation.org, david.m.ertman@intel.com, 
 ira.weiny@intel.com, leon@kernel.org, fujita.tomonori@gmail.com, 
 tamird@gmail.com, igor.korotin.linux@gmail.com, walmeida@microsoft.com, 
 anisse@astier.eu, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
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

On Tue, Jun 10, 2025 at 12:12=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>
> Hmm, I guess a checkpatch lint fits better then?

Yeah, that would work.

Probably for the C side too -- from a quick grep I don't see it.

Cheers,
Miguel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED28CDFD8A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 15:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7AC10E2D2;
	Sat, 27 Dec 2025 14:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MLxcEBp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBDD10E2D2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 14:25:13 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b713c7096f9so1236196966b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766845512; x=1767450312; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J3Wwr64QQ2SpOhKfSDoML0fOFqI1wTu0FLnX32HL/bM=;
 b=MLxcEBp49Ff3xaOmvTXc7Oq02IaDwtsSrIcloPrduM+tsJrkSQDcxE3smpmgfVD7lp
 Jq08dbDs3DMN09H43DQBIaII4tYuh8aXzDP/DWH5mc7/c34kRp6A7TbRYquvFszoF6Ws
 twIv/qwLVz3nxLNhwZHHgK2VBw0eupcUVmtBN0WF6oOxuCce6FjIlgOU4c18V7DsQBLx
 jRL6iMnCwuXrwTKDyPWoB1dKMgnt6p2ofVGveuNX/6+Ri8+E3OKMbZQbHZWBdzaAJ3Fi
 XTOOn10Qc2AwXhgzxcgqeShHRDk6cts3NT+TyH6UA43U1V+BKaC3MDS9z3CmY5EF3gWm
 Rw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766845512; x=1767450312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J3Wwr64QQ2SpOhKfSDoML0fOFqI1wTu0FLnX32HL/bM=;
 b=cDtqUhyNL5NgZz8LMLcXW3Pck6N2bAHy45Xtm37Gnw52F4KvTTsEq5LfPdLNBl+lcA
 4onAb4QfU5ig2PFH2xAbYfX61Ekp1sTDro5mqsXAo6csUOSHskOZz//jbsnCYPPColYT
 JZfkZzOrLi0qwqS0KUkxkmXGwlAtVxAuYrR5oXQVsiIAyUN4aRur3JT6bUWmNYwFofBs
 se6t731q0Lv++B3+BtOxUxuklmKMpo+Yhc1s2jiuQgzgx1jya87F61HdA7hb1ie5iGJs
 sXnRwgD7mowJ+pqgwCLiGVppNAXkWRi44PFZME1B8HDwbCkjqlnBj4DkwYv4IOWQ94Bn
 Msng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxjZClws5huDlAir7YyFgvLoUwZ5OtK+qdUrab3/xA9pXLBGNd5G713mt5qFIJ32HjWz/wwuKvVO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4C5oCEnRQZH52tox13tR4rt9vrvRcWeaxtP2RuTBwSbgJeIz3
 C9w1R4Fmyl3Gr92ifgtuUWQXdK41x8MGM9aP5hC6uDQBNQsVN6Z8ImxZMe/Zl6qnAzphYlYFdIJ
 fpYJ1/O7TqWz/1oYFk/1tzc+ReQDP/io=
X-Gm-Gg: AY/fxX4mYYP2rkWuKmBzCSh6ipCDlFx19hay6xiMLXr/4PsNs4l/XeKvfFEO3uRdvVx
 F7thPGOghVogeWUhwqPvcBleUHn63UkuQHFfjk7XBuTfVBfocQroVdAzK2rWiep8/cqv2SX1QjG
 SHYYQochhigqcva0p3PD/B9Hf4zdtXyicg2UcJ0nYfBDMcBmQYYdO+yLrki50ZeHR4KGtwxBF14
 l55gziRI131G/VEWyZGjLr/W0fDcry+IGw9Ybb/Oq7mgnjcU8oSry4R7poOw24nm60nez9eV+pX
 p2Ecov78LDeVB7bhSdA+VpQSLfl5TJThHHuZVHtv7MZP11RqB9TMF0CaYbLep9w4rRa8Wvo=
X-Google-Smtp-Source: AGHT+IFX0lsgc4AotttgNOJdIQxVyJ6emc4QU5YPq31MHVjjCSjesmYFWIps47Gzc9uXozCoxrNAzwJrn4uIVEmnK7o=
X-Received: by 2002:a17:907:3faa:b0:b79:fcc9:b00d with SMTP id
 a640c23a62f3a-b80371f353bmr3038598866b.59.1766845511630; Sat, 27 Dec 2025
 06:25:11 -0800 (PST)
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-1-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:24:35 +0200
X-Gm-Features: AQt7F2qk4lZCeAfQafLC_2U29jnpMMyMdVKvtqDPeHxqHBPfiIH3Qwz7nSdnytw
Message-ID: <CAHp75VeiD518W13KU+vn1yykfw1pXA8Z9Co7t5bXbB+KhCtqPQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
 deller@gmx.de, gregkh@linuxfoundation.org
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

On Fri, Dec 19, 2025 at 7:43=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:
>
> This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
> it only for sysfs interfaces, addressing Thomas Zimmermann=E2=80=99s TODO=
 to
> remove hard FB_DEVICE dependencies.
>
> The series introduces a small helper, dev_of_fbinfo(), which returns
> NULL when CONFIG_FB_DEVICE=3Dn. This allows sysfs code paths to be skippe=
d
> via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
> full compile-time syntax checking.

Please, address my comments and I give a tag for v3. I pretty much
like the series, thanks!

--=20
With Best Regards,
Andy Shevchenko

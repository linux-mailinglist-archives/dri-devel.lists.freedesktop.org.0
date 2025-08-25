Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBE6B336F0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CC310E350;
	Mon, 25 Aug 2025 06:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nhdwwHyE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B0810E232
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 01:44:42 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-afcb61f6044so745728466b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 18:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756086281; x=1756691081; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s2avFoHaq0qeWQxHmu0/IfmoRr/AhaW/Ha68YwepWTw=;
 b=nhdwwHyESFh/uFCj7aWIK25fXv/GjAaa3yhL7zZMJtnJGW8ZpqvGgDX3JKlT1ef8UE
 8p2qUFyViUpZGt9F1gQqtD8Pk4n+z4u/dlx6joApom4l4iU0azAjOOgnjyM5st7D0qc/
 BVVSpd/14Tak1WQ3wTjYUfJIYUWwb+sWXWrbpZumBceX39Dhqy3SOhCgvwaKXq4hZMjp
 Xpn+iO+o0PMi7eVpdmhRFrdfhL+S3TpFntcbfYljJDISb6bBPp4BVuDEKG9GVGR6nt5N
 j3XrMTD5pGceJL8N93ksKNnTLF4iy9CzyAORqi3leEAVSwO5rUomo4sfNcL/L2/HsW3p
 UM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756086281; x=1756691081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s2avFoHaq0qeWQxHmu0/IfmoRr/AhaW/Ha68YwepWTw=;
 b=UA5I0JL18rdJ/MDYe6HdcsX1S1nzvbu5T+LOO2TGkE9VeDBgk3fZv7oh8C7oZtfN6w
 y0ylh5QGiKbTBv7zPyR6z8OilWGRStfdHk5zwyHBpdv9gd+yG5M69ruwFOgqaj4av1fv
 +/mR7RVZm5rTeVOul4sDnOPpEmR238nIkYyueHjbtndUTVbY6/smUunXocmpC9IZ9pLi
 ZxMRN4H8CoGG2mSpgA4jenOJT5AOGD59cl36ApBTTVrpVCshfaul+dNy79x22IPwnIaX
 qMqIIOgczeM3ezJ2p1KLvVu9zq9Epr3N7gRGUqyEEXbpBq5nYxk9FcJlgH6heD3dp29K
 PgFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlNKgF81AGYfxTQ58pwXhxUMGUyvhCxouufDjEiFfKTWt66QeCjMZdlsr+GGjI5llDpb3emL3LWYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJgcSHBSAsnnvUorlDQR1zT3avDRpb8pe6Uzc6wQm5sNH7n4bM
 ODQf+WASPrEQT9T/qXEqULckVoxvVwLxShle43ToyYZTKb7uz5N87N1U9EHq8ky5KHsdIYbxo21
 twR1od5VRmPbVnuuOuOqyu8LYs92R9RY=
X-Gm-Gg: ASbGncvtSsFotAalo/3s210HCEqi5KRfe1ka2hZvSYAelRTq7f32/BZqiXOE/6KFmAz
 KCw+ipEIxyQWQLIY21i6f8+oGepPgtjeUxc8u4nj9nHkOEMswEUSp06SJ3EczWQGMjivt1JsJko
 SHrzo/5BlGqkvef9KfQIoN4nYJ1xYJi44BVpZ43wg1HEVxxQxA/jlNYRLnfYkqMwJ1JljxkBskh
 vrOHQ==
X-Google-Smtp-Source: AGHT+IHLT+1EhLaT3bu32mIdNQEQRef1+B6NgFxQSUMzQXVyaMWMj/7mH5haukRWJU7ZixB7O+144Y6gyHOf1vKncZg=
X-Received: by 2002:a17:907:2d0c:b0:afe:63c0:2649 with SMTP id
 a640c23a62f3a-afe63c04d30mr437552666b.4.1756086280542; Sun, 24 Aug 2025
 18:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250805-drm-v4-0-94eaec01598d@gmail.com>
 <20250805-drm-v4-3-94eaec01598d@gmail.com>
In-Reply-To: <20250805-drm-v4-3-94eaec01598d@gmail.com>
From: =?UTF-8?B?546L6Imv5Lie?= <zaq14760@gmail.com>
Date: Mon, 25 Aug 2025 09:44:30 +0800
X-Gm-Features: Ac12FXwzSE2zxS8y6PyOaGjyBdjGU_uY8OxnqAzHE1RG7jBfGO_i3hWpq6MZILA
Message-ID: <CAKEtaPAvXPHsEF1SLHg_KATZVCyaAy4Cha_p65KQ6FTUUy4qow@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm: tiny: Add support for Mayqueen Pixpaper e-ink
 panel
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 25 Aug 2025 06:55:43 +0000
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

Gentle ping on this series.

I sent v4 on August 5, but haven=E2=80=99t received any feedback yet.
Any comments or reviews would be greatly appreciated.

Best regards,
LiangCheng Wang

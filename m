Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8743BAE0006
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 10:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0442010E9CF;
	Thu, 19 Jun 2025 08:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Csh8OR/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B4C10E9CF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 08:39:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F0D425C6495
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 08:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0F1C4CEF9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750322363;
 bh=Af1OBCdjmgbt/lD9KT32L5IXYHmC0HvCKLNQiW6fK9w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Csh8OR/pk9BFeNnwmvLfFJG2JwmWeRuYOUoDSa+zSj9lRB1ZY/XlsL5cqON4UBYfT
 ioVVAYqhvrTTZakzEiywyCQXZEcqZiTfWyccel4wCkjQfX3nM8Y1r//TP2rQrDIh63
 QUSKrx/IeUGfqXERYQNcTYfEZIU3c0+dCr4+OJE2xeIZk5+Y6iOwlP4LCKbcGzppg6
 YoBeAFYEidFfiV5gZwsYBXEexzL+0qcll7sNXfjMQ4sYlALzp8sr8t1hHYodFaiAkw
 eEAI4C12T8jRtDiKMcZltn2jtsqJKFJPASK52m27RswXlJ/2qWJwm/dCtoZKo/mpyn
 clP11XuDD/OmA==
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e740a09eae0so563155276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 01:39:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX8IfCL4n/iedHqIhRfuT4N22qlDBnkX2n0Q/ft06ZkN4J1iaCs2SGKE3FetotI/75Qt/i+VPuKQYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPJoZ/+N9BBwopyn+8NqRwcsiPeZ17VqRAFcB/y5qYAYckE9l/
 QRMj1n9ZPXh58pMsUex9XtYuis33YG8QYyG1/3B+CYLywWihv5gEfvxzfu/tP2PCW+O9sqziOlo
 ofV1QUksZXuGv0mRIdCIAtMZTalzfLmBWuWvFORzJYA==
X-Google-Smtp-Source: AGHT+IHFhbTPC3IHdAEhse776L10W8aRjQW3q5wXxAWG0QvKzfsbI08GKkjb4oJHnymnKzxYSdGNC0f44vXXp8PZN6Y=
X-Received: by 2002:a05:6902:707:b0:e81:838b:c58c with SMTP id
 3f1490d57ef6-e822ac0a614mr27592560276.20.1750322362356; Thu, 19 Jun 2025
 01:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-1-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-1-dc16cfe6fe4e@tomeuvizoso.net>
From: Robert Foss <rfoss@kernel.org>
Date: Thu, 19 Jun 2025 10:39:11 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5Q_az2zYGLhNxvxmpZdHXusE-Uxwe9N0nWobdGQSVjQQ@mail.gmail.com>
X-Gm-Features: AX0GCFtRCeI0XKT_8-8WC0wDHRHS1a_MhotfcVvZBvXr_sxNNlpYqYYLoNopHpg
Message-ID: <CAN6tsi5Q_az2zYGLhNxvxmpZdHXusE-Uxwe9N0nWobdGQSVjQQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] accel/rocket: Add registers header
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, 
 Robin Murphy <robin.murphy@arm.com>, Daniel Stone <daniel@fooishbar.org>,
 Da Xue <da@libre.computer>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
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

On Fri, Jun 6, 2025 at 8:29=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net>=
 wrote:
>
> A XML file was generated with the data from the TRM, and then this
> header was generated from it.
>
> The canonical location for the XML file is the Mesa3D repository.
>
> v3:
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Robert Foss <rfoss@kernel.org>

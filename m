Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC83BAB961
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1966010E287;
	Tue, 30 Sep 2025 05:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZB0fMYa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B3610E287
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:55:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 54436624A1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C6DC4CEF0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759211707;
 bh=xjANxMJTM9LPC3RWuEeyXQhzfMnAjgHK8NXmc9aojnI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZB0fMYa9XLkbh6rVUDgMHx3eQeX6PR4zSoPKI8u9xbuliqw9mfG4vwkZ3vND3le/Q
 JPQrWYdQUO6pxbODiHiLSkfo/nJLphrgwsstttU/by2x23vwH3kT6S396YvdyOhsVB
 AGVq2hZIajauw2YLR/W5NS9h5SfuUFqEkDUte8AakA9H1YkVpK7KD+/Qhqj+CSMPDX
 botGEtmtgW2kJrZLIhdPE9QJ/8oR6wIQp70d8BfB/FqU0tLY4nu96ob6hl/nkxp3Iv
 ZYPixFUDAaHATPyDWhq9Wx00NSCGQVkAwxGKvoJsiWHUYRlJhojrlM3Iyc+znkCn9W
 mL7tGx1KTXr5w==
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2570bf605b1so59601725ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 22:55:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWU3VGGijxdx4WND5v/W2ov+xhwn5sKSlHIx/7eWS9YlWWEOa97flOkvoh1u2pUxcLzZ+ZT6QZghAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycGujMd972zQTOLbkVVtVtWU7SaVUqzB0JnirHfEkMAYS8kuIl
 XSuUw9EF7vi/SGMUzfVaS6uTYy57LiNQcPCqzzdOSwN8W+6T8uTZKT6li81jnkix3Wa3WHypwSz
 xd2/8YZSnOTkHmvGeW1Gre96i7mM3Fps=
X-Google-Smtp-Source: AGHT+IGmdGRI0LMi5UqhtfOWw2y8t3L5Y8DIOORexgZS1OILavNgX8DdiClZ3me4wlwwJibUM+KIj1389jiCcZaA8L4=
X-Received: by 2002:a17:902:d2c1:b0:261:cb35:5a0e with SMTP id
 d9443c01a7336-27ed4a74481mr236897635ad.57.1759211706568; Mon, 29 Sep 2025
 22:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9@epcas5p4.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com>
 <20250930040348.3702923-9-h.dewangan@samsung.com>
In-Reply-To: <20250930040348.3702923-9-h.dewangan@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 30 Sep 2025 14:54:54 +0900
X-Gmail-Original-Message-ID: <CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com>
X-Gm-Features: AS18NWA-eQpZ7RgNI6Y84_mjkYb4V1iHJZQyw43DMe2SjRnOaTW2ugj0GBT0nqU
Message-ID: <CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_08=2F29=5D_media=3A_mfc=3A_Add_Exynos=E2=80=91MFC_drive?=
 =?UTF-8?Q?r_probe_support?=
To: Himanshu Dewangan <h.dewangan@samsung.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com, 
 ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
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

On Tue, 30 Sept 2025 at 12:56, Himanshu Dewangan <h.dewangan@samsung.com> w=
rote:
>
> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
>
> Introduce a new Kconfig entry VIDEO_EXYNOS_MFC for the Samsung
> Exynos MFC driver that supports firmware version=E2=80=AF13 and later.
> Extend the top=E2=80=91level Samsung platform Kconfig to disable the lega=
cy
> S5P=E2=80=91MFC driver when its firmware version is >=E2=80=AFv12 and to =
select the
> new Exynos=E2=80=91MFC driver only when VIDEO_SAMSUNG_S5P_MFC is not enab=
led.
>
> Add exynos-mfc Kconfig and Makefile for probe functionality and creation
> of decoder and encoder device files by registering the driver object
> exynos_mfc.o and other relevant source files.
>
> Provide header files mfc_core_ops.h and mfc_rm.h containing core
>   operation prototypes, resource=E2=80=91manager helpers,
>   and core=E2=80=91selection utilities.
>
> Add a configurable option MFC_USE_COREDUMP to enable core=E2=80=91dump
> support for debugging MFC errors.
>
> These changes bring support for newer Exynos=E2=80=91based MFC hardware,
> cleanly separate it from the legacy S5P=E2=80=91MFC driver, and lay the
> groundwork for future feature development and debugging.
>


No, NAK. Existing driver is well tested and already used on newest
Exynos SoC, so all this new driver is exactly how you should not work
in upstream. You need to integrate into existing driver.

Samsung received this review multiple times already.
Best regards,
Krzysztof

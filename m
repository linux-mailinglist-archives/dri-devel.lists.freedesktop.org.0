Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D84D73BAC9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 16:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A55B10E64E;
	Fri, 23 Jun 2023 14:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D7B10E64D;
 Fri, 23 Jun 2023 14:53:10 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-98273ae42d0so17806066b.0; 
 Fri, 23 Jun 2023 07:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687531988; x=1690123988;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1qSDE3rPwykp1shfj1zuf+dGomt2YGKeLvj9O4itJ0=;
 b=ir2q7PL8n+dGkKuupfkPhGG0KdUl/f121pjDy88yZPqJ052AlWnwyjrYiQq4DWJaZz
 KVeXog+AK9AOcWrpffZv/VLIG6AORAHyiBQTZpyZpe/JCnpUIZxdcWkEnwgPjIA0Hjev
 ytnOS8nw00mSA+VL06bhGe8e2bM1aaL8f7R0yl7RtQh4kPV9frWqL92lC3BApVd/CNvu
 m9nBewyaww7PfvLf9dY/spwW2I2Vrcmh+kMhyq6aaedbvEqmXeTYjZPc2M+Jpc0x0BYQ
 Ot9GN04Vwsp4ui7fyJCuQSAuAWK6czR96haj2fYziJeDxuQBc968CDWzpVvrF7i6UA/S
 hw6A==
X-Gm-Message-State: AC+VfDxSbsDKd9/E+/OCWHX1vb48aY6M5TYla5ftMfcJbQb3kSxOMTHD
 xU2ZuKDXBjD1ZRSyHkhBvAhweQPbA6B/phuQ6H0=
X-Google-Smtp-Source: ACHHUZ5lKngbPAW+7VngRAiWWJe0ho7IRCDTsQ/Y4uI+dieZpeESY0wwLG08AmNxxZUVhw6DGESa4zSWiOgClczXE2E=
X-Received: by 2002:a17:906:64cc:b0:987:115d:ba05 with SMTP id
 p12-20020a17090664cc00b00987115dba05mr17611355ejn.3.1687531988417; Fri, 23
 Jun 2023 07:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
In-Reply-To: <20230621054603.1262299-2-evan.quan@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 23 Jun 2023 16:52:55 +0200
Message-ID: <CAJZ5v0iqy0yMJP5H7ub67R8R6i42=TcS_6+VF-+fWrM-9tYFQA@mail.gmail.com>
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
To: Evan Quan <evan.quan@amd.com>
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, rafael@kernel.org,
 trix@redhat.com, lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com, mario.limonciello@amd.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, netdev@vger.kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, edumazet@google.com, christian.koenig@amd.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, johannes@sipsolutions.net,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 21, 2023 at 7:47=E2=80=AFAM Evan Quan <evan.quan@amd.com> wrote=
:
>
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Due to electrical and mechanical constraints in certain platform designs
> there may be likely interference of relatively high-powered harmonics of
> the (G-)DDR memory clocks with local radio module frequency bands used
> by Wifi 6/6e/7.
>
> To mitigate this, AMD has introduced an ACPI based mechanism that
> devices can use to notify active use of particular frequencies so
> that devices can make relative internal adjustments as necessary
> to avoid this resonance.
>
> In order for a device to support this, the expected flow for device
> driver or subsystems:
>
> Drivers/subsystems contributing frequencies:
>
> 1) During probe, check `wbrf_supported_producer` to see if WBRF supported

The prefix should be acpi_wbrf_ or acpi_amd_wbrf_ even, so it is clear
that this uses ACPI and is AMD-specific.

Whether or not there needs to be an intermediate library wrapped
around this is a different matter.

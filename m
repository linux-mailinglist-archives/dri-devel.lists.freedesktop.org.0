Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BAEA2499C
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 15:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCDB10E0EE;
	Sat,  1 Feb 2025 14:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J5d1jWEg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354E410E0EE;
 Sat,  1 Feb 2025 14:53:02 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id
 98e67ed59e1d1-2efe25558ddso3837841a91.2; 
 Sat, 01 Feb 2025 06:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738421582; x=1739026382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J+7fS67R+op/vYjNzIOD2dzLDP07VDSFwCfW680pIJk=;
 b=J5d1jWEg6miL8jt8ZR7MOoziwrSJYGawkdXLmVJSwWTMSdUxG4heK6L9/14n5Ant9Q
 XEq3ZhDwCslVqNIFhd+rEDgYp8kiW5L1napbG2rAAlR9jEToiF4gl+tW6czdhsSOvXLe
 7ixy1GAYEitc28pV22QNPQ/QPeXTN5OR/2mMFyHOIGv8tevIZPZN1HRcIoeyx7H/12nE
 Ia0qtqIkhxVRVRYFLVEjm5x2Wn45yvXN+6pwKYqbNnsebgRzzhgsBNeeJ5wiLKwhzaFC
 VLqsvXJAXmwv/aATEG48ZywaVk8oRnydUIkU5shrxG4oEs4576eiO6ay1P7aoTvqEvCn
 rTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738421582; x=1739026382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J+7fS67R+op/vYjNzIOD2dzLDP07VDSFwCfW680pIJk=;
 b=VwqY3g53xaohhsSn6RU3ydL4+tpU/fJ3t69484GXBTpTaG8d4PHWuKF09XZ773aior
 3jLPIIAnt3hOVgQFoSaCE7xXt75+dRu1S2CaD9r06upGthXhjkAzRbL+2V4o6HleP3JK
 b9G73pCl3VpFINGb5//ZEBPj5gifsFCjzTdMBUlIxL7qtWcVKk6Uar1LM9l17qOMVhfG
 0WBps/samPVl6neUxHOZTjttczrWOghdN1BDHyo0Z05qBU6tdkwsfjeEI/G4sDyMX3Lp
 qAfhTeq+YXB8eWiEOJR6Ld5hAeP/7UEX3Tj3m645C4wwfdEcfdd7xsX25zkuZofa7go/
 w8kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn039/8eQBRbqnYYfcnh34w9yB2koW+fxm+pwb3rXCEsi/3MUfDai9CpU35Giu0stLrzSzIjwlE8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFYL2y7ASY7+TjvA5563Bk1M2apZtUQrigpNSep7cgWmWmSz0q
 zblvh/nDSvNUdp6joHXGKi/Akge+53HL/2aILdE7+OZaxCtHO62oK3z9v+hhH54NuitURqvEfkm
 nQC69rzhqJdoR9EDjpOndpL94naHheAT93QI=
X-Gm-Gg: ASbGnctP1DSlHoZws/dHdpZZFZ6Hgn/qrG0tATu7lipl/3UzbPEPUNEkFPx6lPgtr4s
 hSMXHgHa2zHh1WeESavY7PnZk0XfW14ruODEB4sKLbXPbeFnSUJhEhkBtbin8jSc3/mq2YZE=
X-Google-Smtp-Source: AGHT+IFV22yvLRYxormIxZHgyNkbtLHupM9xP1Lu04swBwRcz2a6cDZQ9nY9ilkh2uKh/yPwgc1zvr9dqkqlO96oQ5g=
X-Received: by 2002:a17:90b:2dd2:b0:2ee:b6c5:1de7 with SMTP id
 98e67ed59e1d1-2f83abbd65dmr23507895a91.2.1738421581584; Sat, 01 Feb 2025
 06:53:01 -0800 (PST)
MIME-Version: 1.0
From: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
Date: Sat, 1 Feb 2025 14:52:50 +0000
X-Gm-Features: AWEUYZmuTEgVyALXrU3YpAwq-7zKlhhHrWI0ATI5HW79m8Lj3Hr5x7byeQBqW4g
Message-ID: <CANS+kgdeNyVWfLEcaVMMRO8wcviQkcBv8EdPY6UkE1TGNh9FRQ@mail.gmail.com>
Subject: [Question] amdgpu: mmhub_v3_0_2.c
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

Hello,

I was exploring the Linux kernel code and came across the following
functions marked with //TODO in mmhub_v3_0_2.c:

static void mmhub_v3_0_2_update_medium_grain_clock_gating(struct
amdgpu_device *adev, bool enable) { //TODO }

static void mmhub_v3_0_2_update_medium_grain_light_sleep(struct
amdgpu_device *adev, bool enable) { //TODO }

static void mmhub_v3_0_2_get_clockgating(struct amdgpu_device *adev,
u64 *flags) { //TODO }

I was wondering if these //TODO markers indicate that these functions
are still pending implementation or if there=E2=80=99s already a plan in pl=
ace
to address them. I=E2=80=99m relatively new to contributing to the Linux
kernel, but I=E2=80=99d love to help out if possible. If these functions st=
ill
need to be implemented, I=E2=80=99d appreciate any guidance on how to appro=
ach
them.

Additionally, if there are other tasks or pending work in the
AMDGPU/DRM area where help is needed, I=E2=80=99d be happy to contribute wh=
ere
I can. Any advice or pointers for a beginner would be greatly
appreciated!

Thank you for your time and for maintaining this part of the kernel.
Looking forward to your response.

Best regards,

Gonzalo.

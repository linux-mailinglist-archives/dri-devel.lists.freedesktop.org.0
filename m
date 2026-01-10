Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D0D0D943
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 17:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDEA10E1E2;
	Sat, 10 Jan 2026 16:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="HjtqOkDx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6917F10E1E2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 16:54:28 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-79045634f45so57902027b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 08:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1768064067;
 x=1768668867; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgFtFK+acLpuQAz2BzGRmGrNRWb9jmojhInoAcIgzv8=;
 b=HjtqOkDxZ3hIybnJESgdoUuLW7AhT1YG07ZZkgp04d2lMx8Hsm8sws7gLKyeZxlL89
 OxoRUiUvVMbEFZ1Y+yFN24SLN2Np2e3+h6hPVd4kWujVUpb0Urofgfgmei9uUn5AtVzw
 xV+fS8dJBveLPy0fiDs/rsv4CPU8woDPk9KFl8C8uAH78nKHrSIy9pwlBdkwxNWAKLXR
 AhxcSkn0fyDEnVlvk/Dj3Y07FbO6dl+GWqTIaQHO6Mqucx7m2+ywG+s40MUggH4ZGp/F
 7ZWyVcd99LRsqNF0Yn/TeggiLuyWjFo/731kD8Roob9NIK3kZID46iR6ILDoKGbIwqUf
 f05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768064067; x=1768668867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zgFtFK+acLpuQAz2BzGRmGrNRWb9jmojhInoAcIgzv8=;
 b=XScG+vbNLpTrtJCJA9GXiYLA+agZC9VoEy90L6ggiNfyV3pdncs41Cn32HUdZrej35
 MCOXejMjwSIvmEcdrVtvyyxbhVFYD4Kp+qz0cHeWfy3pSD5P9OQiJiQcpMrP+VQOgs9O
 5a3ZstP/Zjz8y2PrlAGb8GEvzjBLfCLHiKUSaqEO3FRxqKMASS6GBy52B47aNrPez+qn
 /BXmSthkMjtX8Ir9SjPlI0PDCeFQvCc5lS/9cI94Uj3hg0X2V12B7l/Ep/K+oQ5Fnmry
 FiuSSU8WsGWR3SuXBnW7m5+pxcUOUDb4gNDA7wML46XjB8byD1ZbMnQJOYxdeSerM9k3
 vlAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8tQV13eJx5bweg//llRHc7/SMDhFPdqwV4/eNVxsoqTgk2wkyn4iqO5o4oGHWxttx14K99B1a/4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGPDonR6XK+ebFSZVc54RwbA/n36nXQVy78sV5py9aSrrIGr1L
 vU0UObKt7GEWtQAISbSuQL7TxTfMjOn7/uP4A6XYlEERSz+ZTBcFe/S6OstM8fJoHwV2c6D+aAD
 mWq4/KWY=
X-Gm-Gg: AY/fxX5CWVYo+rA7UQgnkoy0Nfdtn6nKHZ3UkxnkpsxM2xPBhH0C0dxJ6uTvPXJK7+a
 iQTcYDBqtaqTBPOeejbJsfSzQt0i7WFikr/LZm/HvTnscxj2c2TZytww1HJgLS/U5QW1q93/mTS
 BGxWJ2oOTOSGGFFvSCk78BO7Ai8faqIe8Tve3lY9/HYxARJ1MrmLIZinEUNK7ddjYASj+eQMfRR
 MOoGDayHDP4BHCCicF33ztyAE/+2fj5rtBTUXFbX6zbaY96uhT1B7oP0SMqS5dgmjgg+Nz2wPTb
 79qwNhWsYLPfJJL1i9vluPP7XzRPOSMI3tf3cSvpZgcBHlN0O+VrFYX+lop+w/ws01+wzbob4c8
 0zhDXUjj2dVznGuVsDRC5vQHY3ISz/c+9Fl/CpN5HSuEPw5rhVeU2461z0cOxlwMDDhCMMG8zTO
 NFlF86KUtz9FIEyQoAaHgENPbGhse2fsRj7tM06L5p3kEg+PAjvg==
X-Google-Smtp-Source: AGHT+IFIl4Z//DYVwjIQgM3EqV/JfDiytV64ACCDM6KFLzJmo+mLe3Byy17FLZYfMqHxJD1tOyQydg==
X-Received: by 2002:a05:690c:c8f:b0:78c:2edf:5860 with SMTP id
 00721157ae682-790b572e820mr106763147b3.13.1768064067007; 
 Sat, 10 Jan 2026 08:54:27 -0800 (PST)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com.
 [74.125.224.49]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-790aa6a0538sm52653607b3.38.2026.01.10.08.54.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jan 2026 08:54:26 -0800 (PST)
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-6420c0cf4abso4755050d50.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 08:54:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSqElpV0o/33PQwv7Ps5FKprrr/cIuYoElDylTqOzJ/8SwEujRLgiaz5yRedIDN9AtnZKvZVYB3i8=@lists.freedesktop.org
X-Received: by 2002:a53:bdcc:0:b0:63f:b1d4:f9e3 with SMTP id
 956f58d0204a3-64716b3a7d4mr8056846d50.9.1768064066164; Sat, 10 Jan 2026
 08:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20251215-rocket-error-path-v1-0-eec3bf29dc3b@cherry.de>
In-Reply-To: <20251215-rocket-error-path-v1-0-eec3bf29dc3b@cherry.de>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 10 Jan 2026 17:54:15 +0100
X-Gmail-Original-Message-ID: <CAAObsKBmJDbDfegLP-yrO+ys5m1zyoDUe9KMQ8tHeRXxQGAdow@mail.gmail.com>
X-Gm-Features: AQt7F2rSDY8AwFu9wKOfOPB3fQ0feqjbIImAsj0T1FY9RvNW3OrnzYnknqJKAuw
Message-ID: <CAAObsKBmJDbDfegLP-yrO+ys5m1zyoDUe9KMQ8tHeRXxQGAdow@mail.gmail.com>
Subject: Re: [PATCH 0/2] accel/rocket: fix unwinding in error paths of two
 functions
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, Quentin Schulz <quentin.schulz@cherry.de>, 
 stable@vger.kernel.org
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

On Mon, Dec 15, 2025 at 5:36=E2=80=AFPM Quentin Schulz <foss+kernel@0leil.n=
et> wrote:
>
> As reported[1], in the current state of master (that is, *without*
> that[2] patch, yet unmerged), it is possible to trigger
> Oops/out-of-bounds errors/unbalanced runtime PM by simply compiling
> DRM_ACCEL_ROCKET built-in (=3Dy) instead of as a module (=3Dm).
>
> This fixes points 1 and 2 reported here[1] by fixing the unwinding in
> two functions to properly undo everything done in the same function
> prior to the error.
>
> Note that this doesn't mean the Rocket device is usable if one core is
> missing. In fact, it seems it doesn't as I'm hit with many
> rocket fdac0000.npu: NPU job timed out
> followed by one
> rocket fdad0000.npu: NPU job timed out
> (and that, five times) whenever core0 (fdab0000.npu) fails to probe and
> I'm running the example from
> https://docs.mesa3d.org/teflon.html#do-some-inference-with-mobilenetv1
> so something else probably needs some additional love.
>
> [1] https://lore.kernel.org/linux-rockchip/0b20d760-ad4f-41c0-b733-39db10=
d6cc41@cherry.de/
> [2] https://lore.kernel.org/linux-rockchip/20251205064739.20270-1-rmxpzlb=
@gmail.com/
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Thank you, pushed it to drm-misc-next.

Best regards,

Tomeu Vizoso

> ---
> Quentin Schulz (2):
>       accel/rocket: fix unwinding in error path in rocket_core_init
>       accel/rocket: fix unwinding in error path in rocket_probe
>
>  drivers/accel/rocket/rocket_core.c |  7 +++++--
>  drivers/accel/rocket/rocket_drv.c  | 15 ++++++++++++++-
>  2 files changed, 19 insertions(+), 3 deletions(-)
> ---
> base-commit: a619746d25c8adafe294777cc98c47a09759b3ed
> change-id: 20251212-rocket-error-path-f9784c46a503
>
> Best regards,
> --
> Quentin Schulz <quentin.schulz@cherry.de>
>

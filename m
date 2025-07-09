Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C06CAFE805
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 13:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2809B10E06A;
	Wed,  9 Jul 2025 11:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XQYb8/Yg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9DE10E064;
 Wed,  9 Jul 2025 11:45:33 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-236377f00a1so49545325ad.3; 
 Wed, 09 Jul 2025 04:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752061533; x=1752666333; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BmmE+ZvJPR6oGSAShFV2FgbxlwcSMnJ2ZYq+K0udWPw=;
 b=XQYb8/Yg+T2mLu/f2cnUDKtQT1MwVMcypZoC0wiMlsC4U56RC2PlP6ATMFx+kYeIzT
 OKHulALQYwIm6gEXQwp4QvOV46RqUgX/PqU2DCO2PV5IAkaduDyFZ4p0hwk/m3f/Ic9/
 uX35yxzvBaDsYmFjw1rrMXdZJad9LDKS72r+evjchJj0DKE6Si1kXQTy8tbBUK4s608w
 nAYGZXvePpTDGMCnv4+93wRXnUD3i1k6HFqpKYjo7GTpC/6a5u6M4Gk732vET0MAO41O
 1TNc2KiHthP7z7MwqvIXbX2DPs3SQEYTnkhOf86LLxIv1Lvl8kywrddj3KP+88QZ0ZF0
 NOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752061533; x=1752666333;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BmmE+ZvJPR6oGSAShFV2FgbxlwcSMnJ2ZYq+K0udWPw=;
 b=dBh+4gx6maeTreLQanRxzDg+eG4ZdzwBZYaoIAxe9bsASYQxqGUJw3T/dmQKggJNGb
 f/hNNI9Ka+403CeS+NpOha9spDul+T+L7OH0pdCglkgaFjqiAydlOTYvesMuS33rpxc7
 MFXEaGVy/+QPGwLIrRGkvnY7tVcsjAwYywjB7l9uLKvVb5CUEYdQB06cG3jLLaGtupBU
 PD5uTXmYob86CN7VurPgkIWo7QR0NWMlocpnXshiuWYLc7Xoq4zSDgyH93k2o5AjaVMt
 wlWdzeMVAT6G37BygrhD6aaK06Gjdx3rCR+AFOmiUAMoAfNXdg5AWoCDG8TSpHIt9MKo
 Bqtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUm8cvHo78E+690xx5A4MgAHOJm/g8QpLAoE5dmcrriuUzEy2iOThQHzSV2Cxc4gMUmMCCCF4VaIg=@lists.freedesktop.org,
 AJvYcCWKDGaHHy+A7ns4AyMYWddsfSfIqnlUuj6w9kj4y7F+DP1NYqL5L6tfkwj2sP7KnjczyIzu0yVTPQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBdj9q319QHGtNPTjPvxAEpAXGtu7eHrWAgMO+NE37o/X6/BWR
 S9hswMFxgf1MhkSoFb943HKT2QHTn8NKGQxRqPl85B/bnO5YJviKWsPC2Ei3+bCbhyEwY9h4goE
 3I0YPXwK5WPJoTGknfUTlAlz56prqBA==
X-Gm-Gg: ASbGnctOB28FLkGS6RnuPq78cZPkQ5PpH5yiymMuIo9PSH4GKJSZtlzLHFXDFQoEDXO
 wnzJ6nI83LXh9+6Ne8ILYu0LzE8oJeZngIeKR1pbj7JHdFxTDtIaUSXfUeH5t1UNpD6b3Bg956U
 1i0uZjV2xI74hG9oaLTzoyk7Yf+gMWekVtEY2LBXtbx5xFE73H2gk4JxqVMuhZRG7T74OFW+DqM
 aMU
X-Google-Smtp-Source: AGHT+IHsP2TAZOk9rsqB+paL+wHnXHKFH1crGCu1hgMUt07KQJCg8BJz7PPGw9RCEIV87AidDU1pWs8Cip8GPH1988c=
X-Received: by 2002:a17:902:ebc3:b0:236:93cb:48b with SMTP id
 d9443c01a7336-23ddb34434cmr36434895ad.44.1752061533265; Wed, 09 Jul 2025
 04:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <CALjTZvZgH0N43rMTcZiDVSX93PFL680hsYPwtp8=Ja1OWPvZ1A@mail.gmail.com>
 <aG2mzB58k3tkxvK-@audible.transient.net>
 <25642e5b-25ee-49b2-b08d-4c64fa2e505a@nvidia.com>
In-Reply-To: <25642e5b-25ee-49b2-b08d-4c64fa2e505a@nvidia.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Wed, 9 Jul 2025 12:45:21 +0100
X-Gm-Features: Ac12FXz0xyncJrPDgXwux4UGvTbFTmk_zafg_rpj26GR6Zjp2-JF_HWcaE2aOvI
Message-ID: <CALjTZvbwY=wLvGAJvFb7q9G038FNjR6jG5L3eEGJkoEd5xiP8g@mail.gmail.com>
Subject: Re: [REGRESSION] NVIDIA ION graphics broken with Linux 6.16-rc*
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: airlied@gmail.com, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi, Ben,


On Wed, 9 Jul 2025 at 02:15, Ben Skeggs <bskeggs@nvidia.com> wrote:
>
[snipped]
>
> Thank you for bisecting!  Are you able to try the attached patch?

Thanks a lot, your patch fixes the issue for me! Feel free to add my...

Tested-by: Rui Salvaterra <rsalvaterra@gmail.com>


Kind regards,

Rui

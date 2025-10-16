Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFF5BE139C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 04:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E003310E2BC;
	Thu, 16 Oct 2025 02:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UCZGgj7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA0310E2BC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 02:15:34 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-290aaff555eso1534625ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 19:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760580934; x=1761185734; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=67S2aIF/pfkOX5K2acGDT1zOvhxTeuM1fCJ9Zi55c+g=;
 b=UCZGgj7ag0J2IoczAniLhJYGvTcpu6hEdjKcSWsj0VMArnu4toKpwUC8Dl85qxnt2b
 ppgRbgm0bRJuL0SXqIq+TyWFJHpZ/wGlezwW3KK7FyPaA52QwCORxxH2Y6SaausgMqhR
 3KbLLheVMVeUfSXtFo8deFH8Vdfkw2rw1kh6izwx936oinQyCwIdeXnknxywd4YfXn8z
 aqrEnMD+XCXg4xM+G99mVP5+wLlErNw9pScvqFinkX4Lh8v35+8Yj57fKyS6dK1oAVkX
 Pq7vAenO0cvI9TuQejpQMTlwX6K6RIK6YP6jta+pO/TK2ZqLcy09hx3V4gIYlAtHAeEs
 XXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760580934; x=1761185734;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=67S2aIF/pfkOX5K2acGDT1zOvhxTeuM1fCJ9Zi55c+g=;
 b=AZMKTYxxCzoRQY16GHDWxB0osxhu1EGuYBzZWviBnuTg70/lJYpkgpKqBuuQkPy9ML
 YwczcFePQEpFAzVG2t7eSp6KFXXyH7SItJYgL5UNi8UvrAoCW3GmDxG37HpZ3K1z3dSG
 l0wl1edJ58DXADtbL33esq9x+4WCevgrXwlHhjeKVHff5AlloZig0X5ZUXnK0xA/TXpS
 1BOXarFwAzQC2O/UIR7TJI65rTlgECUorSOa2AlnmExKS6hv8LYQZlMGcDURATs266k8
 QeufrChWmkclLn0xzntj+Iu26dpC1AL9tKU7XWz37h4eNqZDK5fIlPlY73SBzAZP2aC9
 pB9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVace+5MamD8KMoZLdTk+9KCSu3yVTMEhpz4IA4UTvA0vbF6fOd9Y8sP7jGdzJgtUbXAbKqLuL420M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziBFnGY2T4a+hoH02pIW32RXM/EOPkkWtnkE/ewEuhnSMX1Mfp
 o1H9fUHnP+rWwWTY/N/+JwL97u/J2wAGkJC15/BgsBj6MNfD9ovs8cm4QBhJAiolfnQy24XuipP
 E+S9kpRRU6bX5C0xpSh4J3ZuWT7TJnas=
X-Gm-Gg: ASbGnctsNPqZyJzJozofE3eaFX/vbEgHpV6azTY1Pn1t6CNlPCB2frQZQ5Z6akAbgyo
 2ajZ/QDm2slIrCSxZbtpt94TpsGgmWpd3f0VFsCCM1BEQLb6rDmNJFp2UIRa0y688mCKp6xekEX
 R2MLLSNW9geCYianQxdpBsGrYAh7bf3QHXt0pp253a0E9VX3rI/hVmhZWaVDUH8nF9Nam3zipEP
 I0NHNeGseZA1UMbEZiqjWakrL2fDGjx3uiz6lcqBNmTICuyOvwKAH0ubQmI
X-Google-Smtp-Source: AGHT+IEvRoOtfZkD7JBaJ7rZGlNV110A7XDi8jf3vUgY9Fd8pd0a5HquzKeGR4HlB+RP5ldM64qTIlUt/S7CQGX+WI8=
X-Received: by 2002:a17:903:1447:b0:248:ff5a:b768 with SMTP id
 d9443c01a7336-29027356a2cmr375723705ad.10.1760580934134; Wed, 15 Oct 2025
 19:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251015183402.1649988-1-kriish.sharma2006@gmail.com>
 <aPA18fxQW398WHte@archie.me>
In-Reply-To: <aPA18fxQW398WHte@archie.me>
From: Kriish Sharma <kriish.sharma2006@gmail.com>
Date: Thu, 16 Oct 2025 07:45:22 +0530
X-Gm-Features: AS18NWD2IGlwVYDG7C9iI2e3l9CLdrdvxxJHaMKCdoRSM9GgL7yUi4oi3QL3np4
Message-ID: <CAL4kbRMQCMqnjLq6tXCuGXfGZWMAN+Jn-oQ0Ljzc_WLG3rUazw@mail.gmail.com>
Subject: Re: [PATCH] htmldocs: userspace-api/dma-buf-heaps.rst: fix block
 quote warning
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
 corbet@lwn.net, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Thanks for the review, Bagas.

I've sent a v2 with the corrected Fixes tag as you suggested:
https://lore.kernel.org/all/20251016020912.1653230-1-kriish.sharma2006@gmai=
l.com/

Thanks,
Kriish


On Thu, Oct 16, 2025 at 5:31=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Wed, Oct 15, 2025 at 06:34:02PM +0000, Kriish Sharma wrote:
> > Fixes: 1fdbb3ff1233 ("Add linux-next specific files for 20251015")
>
> The correct blamed fixes should've been:
>
> Fixes: 507211e3c7a1 ("Documentation: dma-buf: heaps: Add naming guideline=
s")
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E650B16B29
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 06:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F252110E46E;
	Thu, 31 Jul 2025 04:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gR8ZuPq+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AF810E46E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 04:27:13 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-615378b42ecso796794a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1753936031; x=1754540831;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vOzkQIMtT77JtLFwCoXJrtz9lY5XHa4KjUQ3NnuMov0=;
 b=gR8ZuPq+qoYbkwVtOEfZ7Q8YlYjdkSMcwG/8GJx9D17Rz1RjOqzJKRCl6LwIPcBK2j
 9lQ3Rpf55et6nTaA3aFiJcRsgkDi2n3CTpumQbOKupyWRzJJfGVNKxRVi+MQHc1MOaDy
 6hqJs202dbUwvId/xMrrXXDNcAr22sfucktbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753936031; x=1754540831;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vOzkQIMtT77JtLFwCoXJrtz9lY5XHa4KjUQ3NnuMov0=;
 b=tKgxVEh6o/sq7Y+cXnhESP6XUMhyIbiCy6nITdPrA/JP/0gRyWyX5IB7toReLxEE36
 LLbjZE1ueFBl6rLHvMWbYDr/C5TIpjAHnr6Pp7Mwf7QFpWoTheSkV12xK5RoQAR7RK47
 L3spIHSqxLXrGy/FVO4sHIUih2ijxKCwa9lDrvbQ9Pa5SdQIFFJ28nD0evfyn64Bq0FG
 HW2Jo1iPKAryf5xRd+FTPwrkToEYSsYHTCk1RsH5exd4R/nt0RpyUSi5LphrFvbBmokE
 HnPwM7g3yQT96MeQ/ZXbQBWHT1NhxyOU0+n16AyGpnusoF2zm9oawnafvcClKhNqJF7G
 Zx0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV12zQNU1V09burDjP3wloztbACdURX1+g/18NP0JS78cybCVpiZvr/W8uSlyl9hpjcvFynyxuhc/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4pSCScUAh3TlL91U6G4h3y5k2aFgxfX+2K4JiNdn9/uNZVMuf
 Gt1GtSFLQb4tQx79xC0Yz8ok4zZm40yPVHnwLHAx3P8ZcpS+PhicOGjsuoVFCPl32cNa2kUsilk
 QGdoz1Sg=
X-Gm-Gg: ASbGncuyC7KCUeGP3KMKqu2l0nkSkmJ9ntIwO1tmGWwI4jIUuGb8OF8T0sEVKpt9bFp
 qLSxp+37Qbu8pMaQlNYv5rkJ872dK7t96s7lv6VSzwuXXxI7aLjSUiDfrrvi59vMWVWcE5PK3ko
 ThIRAZKNR946C3bgnWn1baJEOVbTDjfLMsF6SHXNYUQazzNgN+eDTA1Df2DiUH+qREziG2TgVhP
 e7xgejGaATt2eCPE9nDgdXXKTdCPcTK+FzKFxwi9dyq0nC4meoYRodjnNVmzcLZy3H9w/d3esJ5
 hYOeYZVG1qbEUhyG+XuufxlQbsGirQIspK37snwc0VT5B27zBGoXRQgU1G/u2jkZg5IGYEyHaUS
 chHW2seffw6Fm5Ua7GQN/w0ms+3GK9shEwxaJtENR6WQ5nUhYtAsotNCqp3U4i5T8A6Jhsxo1nO
 ELyQRCqIc=
X-Google-Smtp-Source: AGHT+IHPxAzYidfwV8/y2y5xs4M8amKktbSAwoe1tShBfQ3vWOeUz4ACssTD1eInIs78yrBoseHr4A==
X-Received: by 2002:a17:907:971e:b0:ae0:a116:b9d3 with SMTP id
 a640c23a62f3a-af8fda92edfmr654504366b.60.1753936031289; 
 Wed, 30 Jul 2025 21:27:11 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766f9sm44467166b.24.2025.07.30.21.27.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 21:27:10 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-61568fbed16so656898a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:27:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWbUV6/H77pZF/SHWMDbIB/iKQeZmZvu4GYTpVqVpNxHDsQd+t8lA3XsQXteXG0el8vUu1u5nLLo0Q=@lists.freedesktop.org
X-Received: by 2002:a05:6402:358c:b0:615:adc4:1e66 with SMTP id
 4fb4d7f45d1cf-615adc425aamr803216a12.25.1753936030334; Wed, 30 Jul 2025
 21:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
 <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
 <CAPM=9tygJqtbmYzB5gktxp-7fBfv_9gNq9p9+SdZ6wiYE2-6PQ@mail.gmail.com>
In-Reply-To: <CAPM=9tygJqtbmYzB5gktxp-7fBfv_9gNq9p9+SdZ6wiYE2-6PQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Jul 2025 21:26:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=whB1X1c6rWbY34wZVGcnaY=yfPGLOtjd5h3mMDGV9Lbkg@mail.gmail.com>
X-Gm-Features: Ac12FXwre6RCORiPzhRedNV641CgtlP9IBscQhPSy4mzxEy7OfaBlZWlHvOOAQo
Message-ID: <CAHk-=whB1X1c6rWbY34wZVGcnaY=yfPGLOtjd5h3mMDGV9Lbkg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Wed, 30 Jul 2025 at 21:21, Dave Airlie <airlied@gmail.com> wrote:
>
> Okay I don't have an rx580, but I have an rx480 which is pretty close,
> but it is booting fine with your tree at least, DP and HDMI connected,
> so it's not widespread AMD breakage, anything in journalctl/dmesg?

The machine doesn't come up far enough to mount a filesystem - my
disks are all encrypted, I never even get to the "type your password"
thing.

So no logs.

The good news is that it's bisecting without any ambiguity. So nowhere
near as painful as last merge window.

Knock wood.

             Linus

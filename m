Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AFEA35BB2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB6310EC49;
	Fri, 14 Feb 2025 10:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sM89+/nn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9977D10EC49
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 10:43:42 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-308ec50eb3dso19956591fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 02:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739529821; x=1740134621; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=258ESUmkji2A70iQi0WVuGZY6DzAzC9+BBeqUcHI3MU=;
 b=sM89+/nnw0fhqGQottshI0dG+5g4SiZkDK1xiN3DufzDw+nCJekXVxB0eEltEwRZGA
 ZOX2fTPqHePT6AzHOoAs95HtOM0wCGHiSd+MfJCgExpZMkC8uBtXg2mvnKnytQgKc0v3
 fuYWY5UYpUhNKlpqWlFWFzeIYYnOscusEsadNg1wfK/vcK6s0MFny4yzgKGNsnv9BqIi
 IfiwzKQ+ywzqlJrKSVZGd3t7nOW0XddQ1g5vwHSQmc/ll65NQkLoao28uBtl+f4YuoXd
 c3oubR1txYct21oVgUYYOaqnwjt45rpEGzzCnNVD1n2yum0AEBKSAOudvrHx3PkZdZFx
 aEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739529821; x=1740134621;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=258ESUmkji2A70iQi0WVuGZY6DzAzC9+BBeqUcHI3MU=;
 b=ri4B6kJB7kFRXIIiVCcs1yV8Xzoh0jBzzwqEue66spgN8nzI7gWjPiRgVq+tl85J8T
 MNeq6l8CEGlH7JpJw+iQIPGRHaVUKg417k9uQwUXoRhZTKynSYUZwZoAVFvMaTVz53+h
 6FryZVnpnwTcDLSzL8MqxlFNYR+3JdozzQE3ZNtNF0ZYldG/3NwHSd2hJhTyz5sQnLh5
 OEspyFjydlotV1lJYV+0zQr61pKiIMXmSEKE+6e8J52QNhSkaKu1j+wHe/w295Xgs1qI
 9jwALJnd2qaSTAied1CQofjv/mTNsyUoyXcD/B5mowyadMFBv/fYTRU/JM454UwUbqT0
 kutw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtYxipXb7/+2nuTdFOmzDunnKs6fRe2WkEPFKNMOBFu9xEVO9rA7wY6AWJGNNBT3Wky5samSt8SUQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/thcpj5UMnLXbQgHvOGjSx6XhPKCjF2FJ9srvXGUJf1jIqJvw
 Qi8Rev7Xg0KOkMc82CuuYIy2FtV8slFYYfmbWoRNovyruwoQxBgkIIkWZvdH3k89wn+WF+sqq8A
 I2M9nyR/GsOi93t01wSg0e5sieHnxIrQArvSjEw==
X-Gm-Gg: ASbGncvaGnFW+ckuWYCcQotU9DU9GhQV8+jWzksL4N2zcTyKhtUk+0VdYtnJ+Ep11l6
 i6/EGaUG+PpnlTyUY6+x07z0xqll95dB1jNxGT0R/YASxV5gnP4f2i8nRRgoCVpCuywwySEEY
X-Google-Smtp-Source: AGHT+IHIrJlrERpgwzo5wAuMDjjakD4AlBHd/8GGQfZyq2/tG9XCbPSB3xq9CnfI5XcNnXqNyGNdI7PPACfZeC6FfKw=
X-Received: by 2002:a2e:be06:0:b0:308:fedf:8c12 with SMTP id
 38308e7fff4ca-30903630e55mr39608221fa.5.1739529820875; Fri, 14 Feb 2025
 02:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 11:43:30 +0100
X-Gm-Features: AWEUYZn045uEEhfW31xBwMEeZrHA-IrXYXkIgwYU0XEIBbh_Wqus8rfEf1lz-KQ
Message-ID: <CACRpkdZj2TtWh2CFb4f4DewO90C70e_3YdKr_DZYuQ6J4+z0Lg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpiolib: Make code more robust by using
 for_each_if()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexandru Ardelean <aardelean@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bartosz Golaszewski <brgl@bgdev.pl>
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

On Thu, Feb 13, 2025 at 7:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Instead of opencoding with long lines, use for_each_if() macro
> which makes intention clearer and less error prone.

Excellent patch series.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

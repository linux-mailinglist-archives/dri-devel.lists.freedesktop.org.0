Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592798325F8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 09:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD17410E999;
	Fri, 19 Jan 2024 08:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C6910E999
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 08:49:20 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc2501ed348so408543276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 00:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705654099; x=1706258899; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BhDXGzyPXV715cy+WNtJqPuL0E1aYaWoiHU1aAEw5Sw=;
 b=Q2dGe8gZhJQISCyeHbunTn2qbwlYW5bgpiagszAmYPnWVyfIdtibHpMahD8xiAluRM
 UgtKBXKDLnRYut9Rn9QfT45NZ/QWKAVhJoYW8p6i9mPyGtoz8THd91GIsHF7s7hvdnNy
 QvacNgR0Qdaj7tsk/Ush4vuF8aNSkqPY4BKzn6UAD3ny5bsKwLvus8jZf1orb7R7rhjA
 Vn4sKwZGYKc4v5FgB9xT1MuG14fY33m3Ozs0U4wbHlEQTb9ikaqtXoO4sdLM7uBQ6goK
 smRJleoftBiHFSW7PruKSJSUKNzbNjuGW3B6SMLaGxBNIKT4sJydVfKkTt1plRzOM9BH
 +n+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705654099; x=1706258899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BhDXGzyPXV715cy+WNtJqPuL0E1aYaWoiHU1aAEw5Sw=;
 b=kqZLqpI8YG8hjnveRbgM9ZKRrEQ9pgtyEM0Zl/AcLdkUNrpRmxaqZohSoDqkrA4JdB
 13LCIwHVZ+HCJcQFnBUYi9vKlu9zhc6ybVeMmiXfmJGAyhHt3pJ36A9w7vtam9UyYAKK
 4Fumn89da3bKw4szFHXTDVLP4d+2s3dUW+/qw47eAX0aWqfMp+as41vTx2hvohwPbuBC
 iqj3LN6KDWJUdRS+ajiezQo7/iLey8Ax5z17pt6SqEBgyo2RMDuSEDK4VKNzGVHcwPG8
 izecV5zaqPPGkcC3RHo64HwWKoRZBYg/vAj2l0w9BYklJTqoBLxEVFb+8mxpet1KEnjg
 3m5A==
X-Gm-Message-State: AOJu0YxR68aBYIU0DlzQnD3OoxjW6HcJqWvns8SSLt/S/W4+3jEYKbQV
 No5X7JHbkKFIuweI3VE/RHXqSOffkaHQ88Wbk68N2e3DDa68Td9vNa55Gy1FURFO3pfDhPkSNRn
 7+eFWxQea7bvN69Umz3hOLrQ1+tyEnuQ0QnYkJA==
X-Google-Smtp-Source: AGHT+IF88cG+WncmwGCjZW5ji71ZZSYIYdW1UlFjUZvVHBfh93nZW6jzoVh6/wt8z+AYZ5sFNPleDu0D+2abT8Xvrkc=
X-Received: by 2002:a25:9bc7:0:b0:dc2:3a0d:23c1 with SMTP id
 w7-20020a259bc7000000b00dc23a0d23c1mr326772ybo.49.1705654099618; Fri, 19 Jan
 2024 00:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20240118-ktd2801-v2-0-425cf32e0769@skole.hr>
 <20240118-ktd2801-v2-1-425cf32e0769@skole.hr>
In-Reply-To: <20240118-ktd2801-v2-1-425cf32e0769@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Jan 2024 09:48:08 +0100
Message-ID: <CACRpkdY72JLKTC=1agqHFzOPaTwBe2Y-OfCkeUUYGz13J-5r=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: add Kinetic KTD2801 binding
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-fbdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Karel Balej <balejk@matfyz.cz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Duje,

thanks for your patch!

On Thu, Jan 18, 2024 at 6:33=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Add the dt binding for the Kinetic KTD2801 backlight driver.

Maybe add some commit message?

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
(...)
> +  ctrl-gpios:
> +    maxItems: 1

First I thought this was inconsistent with ktd253, then
I looked at the datasheets and they really did change "en" to "ctrl" so
this needs a new name indeed.

With commit message added:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

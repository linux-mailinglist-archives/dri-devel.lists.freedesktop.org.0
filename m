Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA38B16B61
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 06:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D74110E6F7;
	Thu, 31 Jul 2025 04:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I2DCjokd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4046210E6F7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 04:59:06 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-61521cd7be2so683836a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1753937945; x=1754542745;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SDR+nXsB5Eofl7XYJqQlqomL2Y+bdQehNIv6f55HHF0=;
 b=I2DCjokd3N+JPTKyauOjP76HNXwye/JfUbaJi/I+ZOOA6u2GQiWRrdlkKR47gnH2qr
 SXCkCrT88dNhUeFK2PQ8QmZXDmloW6MmVJYpNWzPhGXzA3i5sSorn1iqxcYODx20gSEl
 uR0itgAPHP6d4ShdCIty4OK9OT2q5B4Db7QVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753937945; x=1754542745;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SDR+nXsB5Eofl7XYJqQlqomL2Y+bdQehNIv6f55HHF0=;
 b=COU14VJJjrofxv4dvf1zxxOC96/Q6R3IkPpJPrcoOqhG4KMA7L6hI6plGG8bEHJ/I5
 kZAhI8LdRXUp1pw7M3Fhf06cFngD2YjfwrzI6fclYpx2EQ6O9Uo7JuR1JukwUy9szrxn
 DXMJbTChRQl1IwxDXoamg9WHLr68+006eP8zOhsMs8EccFYlQcoi1rTf3SKoZXH0vyme
 y02SbWqynXEVGXQpuU/1nCPo07I0abigwLhbeXCTBJYl0Jt6yM1i2LQYT7WgBBGJmrXC
 MNKs6dlPquI2ctfQf74xbk9UZR+zb+zi1WRaUCCEERXm0fkx12FbYNS0AZFdH5XEk7tN
 8ePw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqz9NkB6CCbiSds+OMzu7fNMQQk5C0YKGfNuzJWk4JAigLrxrFlAbGKVg1+qJGwV9rpmjeQXl90o4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQmjsDFQ18o5x59y7rtiKzxg6VlKGVMho2d1r+M56QI7bPTS7e
 QFRp1LaTO9SkBJojrUhpe1BBPFWZkXNVkPTr3SJ/1UYY0fqEC0szdJWW/MeFSEKmTJeZ/LZJYoS
 Wo9auafo=
X-Gm-Gg: ASbGncsKFeRzDoAIpqa2DY3Qt3qFqvM36zhWShIqg8ZF+bDkvqpnnKdLwG90AjBZszU
 gHiY6CP7YGaw7FT1HhDVy3NnyC7745xto1JHTJpjy1/w2cRYrqHanLf98fVxPgqrNyvvnxs42ze
 rGrSK+VIHXjjp2n/T3VVGjkH0wpk1jqJEpcbgSIHZ2fOSM9c0Le6mqpwQg9M1ZMqH07nsZ4EDIa
 70UaeVJ0+8GE99qY/8VeCjizvMBA3TyCa9wZezB22AxLe/rZ5aa23qPePw4iL7H6gdSJvxw5NGL
 K43lInaAq7CrJIlk47mQCIypOG2/mQ3YnROAf2plALbssWWPpU/kH9u6Xt68C17ijphWLBLnJ1V
 CKzUWkEKiTHABfovWviaakZj4Q/bOIz4ft3yIk+gRK7DN6Dd01QuyLZ8miZ7ricWxfO+O8sbR
X-Google-Smtp-Source: AGHT+IGKqo81o1ejVkii/u7zezOfNB91g6AxtWOmSQKETMEGBkRgvigX0hNMfmKpwFBr7XUzJmU2jg==
X-Received: by 2002:aa7:c703:0:b0:612:dc41:c622 with SMTP id
 4fb4d7f45d1cf-61586eebab5mr4896047a12.9.1753937945054; 
 Wed, 30 Jul 2025 21:59:05 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8ffd595sm539151a12.48.2025.07.30.21.59.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 21:59:03 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-61571192c3aso585721a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:59:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUo1is4jk4aATJ/hgVSOvyG275+ZfDfMEUST1o99PMDORcM/ollG3TRT7B4uKoK3nfsu+SNPwwU3u0=@lists.freedesktop.org
X-Received: by 2002:a05:6402:27c6:b0:612:b67d:c2ae with SMTP id
 4fb4d7f45d1cf-615870b55cbmr6258831a12.16.1753937942860; Wed, 30 Jul 2025
 21:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
 <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
 <CAPM=9tygJqtbmYzB5gktxp-7fBfv_9gNq9p9+SdZ6wiYE2-6PQ@mail.gmail.com>
 <CAHk-=whB1X1c6rWbY34wZVGcnaY=yfPGLOtjd5h3mMDGV9Lbkg@mail.gmail.com>
 <CAPM=9tyb1mELymOJv62KJom4mGF0UBifbVqLJUFdS1C7Eeu3jg@mail.gmail.com>
 <CAPM=9tzDWmYBKQGB0ybDzhYHkg0p98_6PJA8OuPahRep8+QPvQ@mail.gmail.com>
 <CAHk-=whOb_ebQQbnXeqb8uXf32WA32nrL3=HQ2y8hBm9hFgVOw@mail.gmail.com>
In-Reply-To: <CAHk-=whOb_ebQQbnXeqb8uXf32WA32nrL3=HQ2y8hBm9hFgVOw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Jul 2025 21:58:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh+79KkMXsNqyPxeU+c5U2h-n13ko6J_QzwtjyYCKhrSw@mail.gmail.com>
X-Gm-Features: Ac12FXyKAfRuWqMYw2cQQob3MB0m_PufodiTRPWQuH_SVlJTpkXUQidf6jnttf4
Message-ID: <CAHk-=wh+79KkMXsNqyPxeU+c5U2h-n13ko6J_QzwtjyYCKhrSw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Dave Airlie <airlied@gmail.com>, Dillon Varone <dillon.varone@amd.com>, 
 Ivan Lipski <ivan.lipski@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Wenjing Liu <wenjing.liu@amd.com>
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

On Wed, 30 Jul 2025 at 21:48, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Well, it's one of these:
>
>   3f2b24a1ef35 drm/amd/display: Monitor patch to ignore EDID audio SAB check
>   aef3af22a456 drm/amd/display: Add definitions to support DID Type5 descriptors
>   d7b618bc41ee drm/amd/display: Refactor DSC cap calculations

d7b618bc41ee3d44c070212dff93949702ede997 is the first bad commit
commit d7b618bc41ee3d44c070212dff93949702ede997
Author: Dillon Varone <dillon.varone@amd.com>
Date:   Fri Jun 20 16:23:43 2025 -0400

    drm/amd/display: Refactor DSC cap calculations

That's the one that makes my machine no longer work.

This is a 5K monitor (ASUS ProArt) connected through a DP connection
to the Radeon RX 580.

With that commit, the screen goes black with no signal at boot.

Let me go see how painful it is to just revert it from top-of-tree.

             Linus

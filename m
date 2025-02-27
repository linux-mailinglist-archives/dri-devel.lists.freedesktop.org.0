Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F16DA49882
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A09110EC7A;
	Fri, 28 Feb 2025 11:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ld3wTpDH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BF310EADE;
 Thu, 27 Feb 2025 13:40:00 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30b8cbbac91so961611fa.1; 
 Thu, 27 Feb 2025 05:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740663598; x=1741268398; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0QqIj+Xj2KKd5yOn9wT3FKv7ilH/QlR+xG09MXlqr0=;
 b=Ld3wTpDHM4GT4VyPEzoEECli3JpCifiJ2iMYJQ8/vbvAMr7t+088atf8tGC9TuIxdq
 ti36blqijPBURLg2LXv+HztT/AxJ6fAeGau9RvvzUeyz8ueoNCz1H1KWj+xxPtp56gV3
 qURabzbpw8CIT1Z4FyHsM7XRoiHFqoxt83m5j4rtXJNzqYU8CdGxjSaf26CrLbOejQxF
 v56oaGKZxk1D4yCvipn4TaAx0/DswBqM6IU8Vd44Pgd7LIfh6vXDIWGV9rDZ3LIeztH4
 EU8jRUO4zSdp7R2dKYvxU5UaA5+6ZVG9eYfbzY9tK+9RzkzVC38jWE90wx38iX4EfaMo
 QXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740663598; x=1741268398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X0QqIj+Xj2KKd5yOn9wT3FKv7ilH/QlR+xG09MXlqr0=;
 b=HjKfN4fu4RXLPpIDRTxLjsSw/flOo8kRCSb8Ug0AGb/DkJiD7icCQASje8njAPlU9t
 5lkv8MyXFjiAxbzbviGX3XN/LL0vmZd8gxv42aThNTLmgAE89Kk1iI7KQJGZRQ0cvtjU
 YQUHOUmoz9X8hQ4t7UKDHgX4HWjFewccYEToGodIFPOB6Z0nOr8+F6aW5grb6jTa2eTH
 84yGsBALR77ratXLhj+MjscA5EQXMim1X6HUOczIlrCk/V3ppqGjwWMsHwi2YtVhGipI
 8vNTPXVY5B7a+/JbevJjOxA7k3EBaQagTWPZ60RI4MDWG5mi3Xbi68t9QN+lWxjITJPu
 MY8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbUL4rVkmgv2aGX0mvGWXGeito0q6ty2cgsBt/57nDfF1rka6InKnqPAm7mymdI5ovvAes9m4wJ8E=@lists.freedesktop.org,
 AJvYcCXiSTJDju24t4Kc2iDZM20Oo4YD4tpNHFMJdSLmCRr56YSm3GdPQLcMTpzu+jh6/kA36CWZP4FAmbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOJYRfjdLUpEZNwYlHSTf5dsiX7RQitO0Ny67N5d+4fZANhgD9
 T1xTYaYt8z10h2Ub2IyZuiUFkqCphvK+dj+frjWpytAdTbQNLvjlibLLXMXMZ89rEbKDKz+m6QF
 37C153a7gP0pTr5yT2oyl2dPH6Ag=
X-Gm-Gg: ASbGncvWIIaPzL02oeDy9WmJo1CTvKyGeY6MSYwA4JgvJs7wByVUvhoFVW74yr6/v4r
 K+j1vxqLtRy2qXZxsX6UoGBAvqU0ZzTq90Lq1k3AXc3IfgY04BFq69otJmuG5tfczygH/84h9c4
 sYEcjNI+q4u1vwsHSzMgK+DWjQtgedwXWOT7y4gG7P
X-Google-Smtp-Source: AGHT+IFv8UCQLBFW+HmySTIopoV3gqxaBg5wvtyqxsA9/SWPF9AXdxTyZjDvJBXPJMy/X/nEAbqTXjvKUANVm2PlmXw=
X-Received: by 2002:a05:651c:50e:b0:308:e54d:61aa with SMTP id
 38308e7fff4ca-30b8464a2bamr20649531fa.2.1740663598018; Thu, 27 Feb 2025
 05:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20250224-macos-build-support-xe-v3-1-d2c9ed3a27cc@samsung.com>
 <be5abg6u6wm62nhak7xrhtlkqxcekael6ztnkatwqxcil44x5y@p6yrbfingm4e>
In-Reply-To: <be5abg6u6wm62nhak7xrhtlkqxcekael6ztnkatwqxcil44x5y@p6yrbfingm4e>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 27 Feb 2025 08:39:21 -0500
X-Gm-Features: AQ5f1JrvujnQrNdPwimNUvnOfF-Py3f8kwIyufq_KgAHEzKnySZFBMMWJGb3ArY
Message-ID: <CAJ-ks9=gaxW2191c+K0E0MgjsQWLYoKxJZLxGb6RMbPRVHc4tQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v3] drm/xe: xe_gen_wa_oob: replace
 program_invocation_short_name
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: da.gomez@kernel.org, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Justin Stitt <justinstitt@google.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Klaus Jensen <k.jensen@samsung.com>, "Theodore Ts'o" <tytso@mit.edu>,
 gost.dev@samsung.com, 
 Barry Song <baohua@kernel.org>, Daniel Gomez <da.gomez@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 28 Feb 2025 11:42:15 +0000
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

Hi Lucas, chiming in here since I also care about building on macOS.

On Mon, Feb 24, 2025 at 10:05=E2=80=AFAM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> Is this the approach taken for other similar issues you had? Note that
> argv[0] and program_invocation_short_name are not the same thing. For
> this particular binary I don't really care and if it's the approach
> taken in other places, I'm ok using it.

Believe it or not, this is the only place that
program_invocation_short_name has ever been used in the kernel. There
have been numerous instances of:

#define _GNU_SOURCE /* for program_invocation_short_name */

but never any actual callers (that I could find in the git history)
other than this one.

> I was expecting you'd take the acks and merge it all through a single
> tree since you received push back on the need to build the kernel in
> macOS.  Is this the only thing missing and you'd want it to go through
> drm?

I believe the other patches have been applied or dropped. When I last
tested building allmodconfig this was the only issue I ran into (macOS
arm64), so I asked Daniel for this resend.

Cheers.
Tamir

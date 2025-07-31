Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAF0B175F0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 20:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EF510E2B5;
	Thu, 31 Jul 2025 18:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IRoSEmQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F8410E2B5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 18:01:48 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6156463fae9so4038755a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 11:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1753984906; x=1754589706;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zBdevn9NOXbIq7sAbU9V62KbXTYr+p1IlAZvGXkRgm4=;
 b=IRoSEmQzkt4H1DzVYXODRxQvg32M0ZiOJLhOJNf9GOl0S9g0bWVUG3vFs3ZaUH89kx
 i4P5NAj2Y6GydSgLS19XNSgWJ4rFA9eJuJenj7M+4ftrrAaGy7kj72Cn4nefsE9dPs1G
 2RuoO2gYCz8vW4qV2qXHxnXaaapSBARuLq1Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753984906; x=1754589706;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zBdevn9NOXbIq7sAbU9V62KbXTYr+p1IlAZvGXkRgm4=;
 b=nJXP/IPEfUorAp08rK48++/wdAfhHNZtih/XBYOjoY6Gc18gA/739N2JCUCz2jlApk
 rYza/T573SeVRmxoXCR0+VQ/9hPSXmlkJBrsgi/yBdWDoDF9yRx+kwmOHJKLBET9AtHN
 vxyriJiTN9Rwk+bclPuylZ8H5SG4xTrv6FuKyA8zKK0X31ZrxlsE02xwA+ecRzaDFO7h
 SpFSaX11cBedXD5hP74IhMClAa2RCAKTe/Q5WeKpY2+PZF97+XgdWAeyiVzIRI+I46cy
 iz2cbSLR0LKuwPaXI8HhsUI+VX8BCcLrIOKWgg6qYv35EaytAJbzZpppolHxr1dm96zM
 qM+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO+YBThHpF1kGAXj+pL61ohpwj1PhTyHrWKkT1G+TJIYOON9teP0VY6hLlfsyhRp/cOrUbgzX/eyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8DuXemUUB49wvdZ23J/YSCSzsIagLFYv0CYp9Db7DwqSPxWf/
 jeoAMfduDqNLTQa/NbZzdrKml+kokmrotAckLZ2RUCSkpsYKfMAB7wwlLEpX5+APZ5fgpRDkm0a
 Sk2ilVw8=
X-Gm-Gg: ASbGncvtv+iOP7ZkfPBFz/k6mYeF98gaMn/uFqPKCwdACIbu5qzQHVSOnbhERA55cHW
 nMiMEgieuKbMlBhGNnlXNnYK6snQ7Wa85Jcc0GQPM7wyiHSDRDNTOS96LqGXcQPNONDYHg6S1Zt
 xczgbySROelA/Z9/EYxkOcLScjTRI2Q2jk4XM7uPm1TFKpPQ9WI3uvnwXMTjH1KQ58D7TiOInXQ
 p0fCwdh5bzBgNdhUQWh/FNQ2sqJc+KnRJEy3bG9hzDYc9W0UWwyWfnVBnbxvIMU0kdPfsDYg5Ui
 99zUOp1hEDk5k/ue+qKKIPAu4wNp4SbfKioOyqhfYAHv55ZsrK+cQkoNxFvK1yzzKp32gWnJQMs
 jvZqVwPe2PUarK5Xkt+07wC46USliOhtTKx3zp4sZPoi2zgz/JtKHmuVjASAJjib/r+e4yAKe
X-Google-Smtp-Source: AGHT+IHLMxqzoY4pCMr8Cg2hNMOGqhiPp+srpvn1cwrr2yxkUCfeGIKl3OIyBI2Va9f7ZslfnvhcqA==
X-Received: by 2002:a17:907:d9e:b0:af8:fef0:9b23 with SMTP id
 a640c23a62f3a-af91be35c13mr329529066b.20.1753984906461; 
 Thu, 31 Jul 2025 11:01:46 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a243644sm148829466b.139.2025.07.31.11.01.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 11:01:44 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-61539e2065dso3679074a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 11:01:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU4pFZle7QYRwA42aGNyIJeWQDsIeAC437pcXGS4mcaaBKgywvtZ9l4gYjangIYLiIYUHqqiLi7fkQ=@lists.freedesktop.org
X-Received: by 2002:a17:907:2da2:b0:ae3:6dc7:1ac3 with SMTP id
 a640c23a62f3a-af91beb8135mr381488666b.15.1753984904167; Thu, 31 Jul 2025
 11:01:44 -0700 (PDT)
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
 <CAHk-=wh+79KkMXsNqyPxeU+c5U2h-n13ko6J_QzwtjyYCKhrSw@mail.gmail.com>
 <CAHk-=wgEGn0azq0n5BfWg4ZStrZYanLCX1a+quug7HKmjimhpw@mail.gmail.com>
 <CADnq5_NBM1Kso==+N=1xCjF+xiS7Vy4g47uvUN7sSWs8bontZQ@mail.gmail.com>
In-Reply-To: <CADnq5_NBM1Kso==+N=1xCjF+xiS7Vy4g47uvUN7sSWs8bontZQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 31 Jul 2025 11:01:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiN+0FBwxwj1UiKsfHgW=C_aWy20F6PPt5M_ACnfukehQ@mail.gmail.com>
X-Gm-Features: Ac12FXwl7rfbBqibQ1OmSqpipidlA-BS-3rGgWDujbCXe9i_iXdTe6-DKoidTfo
Message-ID: <CAHk-=wiN+0FBwxwj1UiKsfHgW=C_aWy20F6PPt5M_ACnfukehQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Dave Airlie <airlied@gmail.com>, Dillon Varone <dillon.varone@amd.com>, 
 Ivan Lipski <ivan.lipski@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
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

On Thu, 31 Jul 2025 at 06:09, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> I think it may be fixed here:
> https://patchwork.freedesktop.org/patch/663973/

Yes, this patch fixes the problem for me.

I don't know if it's due to the pointer validation (ie this part):

-       if (!dsc)
+       if (!dsc || !dsc->ctx || !dsc->ctx->dc ||
dsc->ctx->dc->debug.disable_dsc)
                return;

or whether it's the divide-by-zero that the commit talks about.

Should I just apply this directly, or expect a pull request in the
next day or two?

          Linus

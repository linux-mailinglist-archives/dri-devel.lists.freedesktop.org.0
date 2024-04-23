Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED29B8AF4C6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 19:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502141134E1;
	Tue, 23 Apr 2024 17:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2QMIxJOi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829DA1134E1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 17:01:05 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7d9c2096c29so285149239f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 10:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713891664; x=1714496464;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JLMRks9PdH+g104L81D287ju8A0NrozcbxbmvZl/Zoo=;
 b=2QMIxJOisQ+qMcyG/lWqenEQM4UejxlfbGMbQ/Q9MN88gJ/6BzZSpO3ddcLZ86FacP
 +tfWQk9Jxf0/fTErTH7B6X23SccPARatfMQekAMe3afgA/cj6KwJ9BlMI4ROanozXtns
 LD7oiKf7og7EvEQrjClPWsWntG6k65Pbv3sYM0UpKLQ33pn7gDBzjDq7DBahdcJpscsc
 9GS+EfD1jXs/2iXZ4UpeMKvPFYejYI9Pbr7cQXAJuyEeIi1H5oqYEF9ILDVRmI0jUtHD
 O16MlY40OTthxvWcWTr8UcXLigrA1RAGicpgh16tYsaJ+kbd/rDBAkrdQUgXj0kt9r0J
 4P5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713891664; x=1714496464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLMRks9PdH+g104L81D287ju8A0NrozcbxbmvZl/Zoo=;
 b=H5E1hh9N03OUMnsThBagQWKO4Bnn8i2bpXpX3x1QMzH0ag8JuSjNeC++lOXdVKl3k4
 rTx2svcR/KCLCA3bUJWhUHftT8jCu05UKr8iZs0Ej7NQYahjeK9SSyEOW5r2jlewBvhh
 pyBDLQR36d+irh7vMjuZXaSxQK8VzbEhEKpeoxIw2XxSHREpwEGaqEgDyfuUYM7efel/
 C1Z1ySZUV0ND67xuXFDerbNgp6U/R2b6zBH9Yo7TWyinnkbgBJ126rPHDv2KKQ3eWnWw
 UYwjMDDugNBP39ZtVB8CW9Is3VUOPxJqmC2mNu7C0INs3cKzmxZfgcbnMvvTZCDifl06
 UyMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhMYgfzvibA2KCWji4yBRjy+I2XnoRaWo7g2fOsXfPCCkM2fikaKlHmcnLhmsRp9OCsrtepeB72glKDIyo3ivXaCQ6elNefONpCYq1yM9E
X-Gm-Message-State: AOJu0Yxq5nTFCkqoaSUdXpNNNaxA2BX428Vi9Cw7KEZZC1JcqCTPk1wH
 ZGOTleZqCxaIZnI/jWAoQTkjRHf+J36D3auOI1kYo4esuzUAdgYdbIBjYO9Uda4Al78xfpqHAwn
 XAGvQy0zIkg74aQ6vOcXraPoPz/n0ubMXwCBF
X-Google-Smtp-Source: AGHT+IGcw1mE7GQw0RFfG3rYNhp3N2M96TVgZiM44ui1PYuC2rOp0yhfUgHlgGhehZWYsoHgBqII2uXkVaAYJ4TGtYU=
X-Received: by 2002:a05:6602:6b12:b0:7d5:de78:1d8 with SMTP id
 ih18-20020a0566026b1200b007d5de7801d8mr21123669iob.18.1713891664253; Tue, 23
 Apr 2024 10:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-8-panikiel@google.com>
 <09579b62-77fe-4ba4-b3a1-e3b17dff0188@linaro.org>
In-Reply-To: <09579b62-77fe-4ba4-b3a1-e3b17dff0188@linaro.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Tue, 23 Apr 2024 19:00:53 +0200
Message-ID: <CAM5zL5q7LJC8AmrtM7fH03zyvQug8k4WN4t2=Q-6jQBZAtYYEg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] media: dt-bindings: Add Chameleon v3 framebuffer
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
 ribalda@chromium.org
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

Hi, sorry for the long delay

On Mon, Feb 26, 2024 at 10:10=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/02/2024 17:02, Pawe=C5=82 Anikiel wrote:
> > The Chameleon v3 uses the framebuffer IP core to take the video signal
> > from different sources and directly write frames into memory.
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
>
> ...
>
> > +
> > +  reg:
> > +    items:
> > +      - description: core registers
> > +      - description: irq registers
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  google,legacy-format:
> > +    type: boolean
> > +    description: The incoming video stream is in 32-bit padded mode.
>
> Why is this a property of board DTS? Can't the input streams change
> depending on the usage? Who defines the incoming stream format?

The input streams are defined by this hardware module - there are
specific input lines for red, green, blue channels, h/v sync, etc.
However, there are two variants of this module which behave
differently - one has 60 input lines and outputs BGRX32, and the other
one has 192 input lines and outputs RGB24.

The "incoming 32-bit padded mode" referred to an internal bus inside
of the module, which I realize isn't very meaningful. Instead, I think
it would be better to have two compatibles, one for each variant of
the module.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9233086916A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 14:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B13C10E456;
	Tue, 27 Feb 2024 13:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="X+jVQEBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D05E10E456
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 13:11:40 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7c7c983157aso97673339f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 05:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709039499; x=1709644299;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udo8bD1gQZ0TgNyTOs65mIj8/NeIRI7TPXyi6M/72Q4=;
 b=X+jVQEBXWz0MTtUfYikiHxRhAzV/XJ3KC/fYsQ9aEqlgl6BNopL4ED7UzU+Tmeb689
 AsE3YMitMt+i2ZTg5CborjwzbqalsHPIhDfS4/TSSBMFL6bIN4LA52fWoGZyqY+DfEGx
 iJplMzfJ8+b5k6PZpkGHy1SnSwGa5kIa3HTF+7OthFBaFPCIptgfesb9Qu8/bCBk/5sI
 ovKEGzulLe5fi+p9poTKZ6j8ctuuQWTZjetKkQHM8hs4ZUswxFlkNndcksqVCN50H9XN
 a6V1PhxB/ZtX8xUNmGCl0gSx/dSAyEn3JOtE2oN04zobc5StsO2umRJgi0r7k1+2TLRu
 GWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709039499; x=1709644299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udo8bD1gQZ0TgNyTOs65mIj8/NeIRI7TPXyi6M/72Q4=;
 b=xIbVUebPClq3/jIum+wTlh7HcoGiabq2CQn0bVqe8rvca6F2u9VFwYmyqvm5+1BHM2
 wE2UaTUmABHK7Nth6cPzXJV9gv5jaBZl3bM/mTRinKscQd8can6XUS427qCPAgYcb9xT
 3HJRbFY1o90i+YZoDUt51sTAGPLA+ceUqM6q1cCdVVu7WURERRxVTym+A4inppsObvCU
 2oGBZLrg3XJMms7m8K7EHZt0Xpwz2/9B5BF05moJyf36eJwenbWUpXxpZ5+PxHvr+rSZ
 9WWAdyxaD8m0E80U12tz4L35MWak+c2Ysi4qI3mlfuo0Abt/+04pdvyXNa/LtTDmRPlc
 P7lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWT6dRh439krw6j3l4+MbELU+y6ULHD+ZIQXTBdMACWxDz6YwOqFozKRnv0ahw+FWQeQZ5DV5dKIuwK+M8qL1y7Un0Eiq3G6yODT34Ubz/
X-Gm-Message-State: AOJu0YwebScI75GYaZNyMMpF8gRZiUG4uU+9w2nKNOLlZYk2uYJ/3r/f
 NkeZO8IzIQ/5xOJ5yZmDS6mi95pxHhQvo3J+ltuBsIsn9dUM66wOWiXnKIOH1hB3GPXwl5nxYaF
 VKIYLRRLjBTPlchhrESCoFdN54Q/Uis8DKU26
X-Google-Smtp-Source: AGHT+IEbvZWYzJhRl38v/+RURp8VhVb+sc2/zv8znFskRMA/IxEBLb5NyDAoUgrrhIG+yRmDNWyZC23b3qgda22u2K8=
X-Received: by 2002:a05:6602:14c7:b0:7c7:e2c5:569e with SMTP id
 b7-20020a05660214c700b007c7e2c5569emr2368172iow.7.1709039499002; Tue, 27 Feb
 2024 05:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-9-panikiel@google.com>
 <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org>
 <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
 <e1fd8cbd-060b-4d15-8256-6d8dbba545da@linaro.org>
 <CAM5zL5qxBM1xQ__t86gxUKMy8O3BzoCe_vTFxxsqFq7mw4-8EQ@mail.gmail.com>
 <890afb05-1b19-47b2-bfd8-5f6de0caeda3@linaro.org>
In-Reply-To: <890afb05-1b19-47b2-bfd8-5f6de0caeda3@linaro.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Tue, 27 Feb 2024 14:11:27 +0100
Message-ID: <CAM5zL5rs4JyFznnWDLZP_2jwnX+yc+OwwOijGZGsQK+WtpiWKA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] media: dt-bindings: Add Intel Displayport RX IP
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

On Mon, Feb 26, 2024 at 6:29=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/02/2024 13:43, Pawe=C5=82 Anikiel wrote:
> >>>>> +  intel,max-stream-count:
> >>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +    description: Max stream count configuration parameter
> >>>>> +
> >>>>> +  port:
> >>>>> +    $ref: /schemas/graph.yaml#/properties/port
> >>>>> +    description: SST main link
> >>>>
> >>>> I don't understand why you have both port and ports. Shouldn't this =
be
> >>>> under ports?
> >>>
> >>> I put both so that you can use the shorter port property when the
> >>> device only has one port (i.e. no MST support). It would work fine
> >>> without it. If you think that's unnecessary, I can remove it (and use
> >>> the ports property even if there is only one).
> >>
> >> No, it is fine, but then you need allOf: which will restrict to only o=
ne
> >> of them: either port or ports.
> >
> > There already is an allOf below that says that ports is required for
> > MST support and port is required otherwise. Isn't this enough?
>
> Add both port and ports and see if it is enough.

Ok, I see. I tried and this seems to work:

oneOf:
  - required:
      - port
  - required:
      - ports

And that would make the if/else with port and ports below not needed.
What do you think?

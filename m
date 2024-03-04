Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7534186FFC5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 12:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09B810FFD7;
	Mon,  4 Mar 2024 11:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fHrbQlSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C9D10FFD7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 11:07:36 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a3566c0309fso548091666b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 03:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709550455; x=1710155255; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Wu1HQfAzXdwAMW97wtn2MyUT9kqXYE4x4WqJIu7nsOI=;
 b=fHrbQlSEciNve1PNNMZyVi+A1LPIOCSD7bCuin+X1o7TudiebLl5QrL7eYs/2LDxuS
 W6n/bpWvU93T+FnoNzT5d0TKIcOqFq8Pr7aGGR2KAsvLtSDnV9pyG92zfG48C45seZdQ
 Ir/8SVUOtYijljLRcYH7/6tUsr5kk5E9LReMbu+5/lW+3k8OkP+JJtm+1TglHygFt/QV
 VtaL5q+NHgzeU3W4fS3JLeAMAnJ2l5z1I6TMWKnyQTDONEDr51uuaZ1p1bhdpV6mBhRd
 1dITfQ3rt97ha96DPUcDW6z50pIE4mV6S+k28tj+LZiJf9THh8NueIKx6GWrDRxqacL4
 hcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709550455; x=1710155255;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wu1HQfAzXdwAMW97wtn2MyUT9kqXYE4x4WqJIu7nsOI=;
 b=SPyZe+2JzS5ak+JLt5Ql3/afW7QzFtwG+jLGvPRRSbbHSZOks+zy9RblA7s8orIfRR
 79raHdGvFAmYAHNh8dqbmYNAjdkQuEIkAsLpiRhZmn2a1QAs1oZK6xR6V7OPSbfWFq/0
 qzvokr1le+TBu8rRJG4p5XtRB+F55HbLSmo9sJ6NSAz8nFdoesgsbvEgxMtOwdBsQpqS
 W2tTd1KWia5d8Z1pS+476Ba1itT+3R4uT1Tuftk4OvQhcrNIXG7Pi5e/MQltAIDHeMYK
 L8GhQwVr74c0NuyP7eMnTQ/Gz45U+TvoEYW710ZT1d9shOfuhrSHDRLaxnhnLeoNKcKC
 qC5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBYzszt5o6D9AwXMhuqL6MWuReYBcCJbB1/82ZJEDCdhMJT53XUVERTLnfqZ7+37xAIrYxLXSQpYbdo1wDteKR3G1DSqxnwoo+XeAxGQMx
X-Gm-Message-State: AOJu0YyhdRNCGiice+kXZjDOery61qDcYDGVyhRxrsVsibQ+YpXYSug4
 PB7cpskWqQ34hGazHL1QnJLWN8I3+kjuT9dy73vcKX6to8ZVaDty
X-Google-Smtp-Source: AGHT+IHgDGK/BZFLZ4o0q5QlhX+iDooVzGPEucKa4H0749pnNAkElImYC6SGV1YXCUk8M8A4OsMdqw==
X-Received: by 2002:a17:906:3511:b0:a3f:ac2f:893a with SMTP id
 r17-20020a170906351100b00a3fac2f893amr5794723eja.73.1709550454470; 
 Mon, 04 Mar 2024 03:07:34 -0800 (PST)
Received: from ?IPv6:2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47?
 (p200300f6ef1b2000944ccbc71e1c2c47.dip0.t-ipconnect.de.
 [2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a170906265700b00a44dca5f9c1sm2512075ejc.100.2024.03.04.03.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 03:07:34 -0800 (PST)
Message-ID: <a8c3bddfb7a53682f23f4c99ce46e67ffc0213d1.camel@gmail.com>
Subject: Re: [PATCH v7 1/6] dmaengine: Add API function
 dmaengine_prep_peripheral_dma_vec()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Nuno Sa <nuno.sa@analog.com>, Vinod Koul <vkoul@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Jonathan Corbet <corbet@lwn.net>, Paul Cercueil
 <paul@crapouillou.net>
Cc: Daniel Vetter <daniel@ffwll.ch>, Michael Hennerich
 <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Date: Mon, 04 Mar 2024 12:10:58 +0100
In-Reply-To: <20240223-iio-dmabuf-v7-1-78cfaad117b9@analog.com>
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
 <20240223-iio-dmabuf-v7-1-78cfaad117b9@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
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

On Fri, 2024-02-23 at 13:13 +0100, Nuno Sa wrote:
> From: Paul Cercueil <paul@crapouillou.net>
>=20
> This function can be used to initiate a scatter-gather DMA transfer,
> where the address and size of each segment is located in one entry of
> the dma_vec array.
>=20
> The major difference with dmaengine_prep_slave_sg() is that it supports
> specifying the lengths of each DMA transfer; as trying to override the
> length of the transfer with dmaengine_prep_slave_sg() is a very tedious
> process. The introduction of a new API function is also justified by the
> fact that scatterlists are on their way out.
>=20
> Note that dmaengine_prep_interleaved_dma() is not helpful either in that
> case, as it assumes that the address of each segment will be higher than
> the one of the previous segment, which we just cannot guarantee in case
> of a scatter-gather transfer.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---

Hi Vinod,

Is this already good for you? I do not want to be pushy but we're trying to=
 see
if we can have this in the 6.9 cycle and Jonathan definitely wants an ack f=
rom
you before merging this in his tree. I've more or less till Wednesday so th=
at's
why I'm asking already today so I still have time to re-spin if you want so=
me
changes.

- Nuno S=C3=A1



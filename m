Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE80965A9C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3F810E857;
	Fri, 30 Aug 2024 08:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yA2Dm4jT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE1810E857
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:42:45 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-5dcd8403656so1047670eaf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725007364; x=1725612164; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFoJ8uGU6Wt+2B+a3U8PT9o5qr4L6h8Nf/lLSdsGyCQ=;
 b=yA2Dm4jTzqBLz31zc1DQGx6AjgCv88MviRrIHfrVDw8k9W+AjLN8DwMcpQj7LNaRQ+
 VcSq8OAAdpx585a2kfKT0df8YOznpdBoPC0Gd6cQvxTGF4mxgUJzpL6gCPkYHBIXtBge
 ZnCnTtyNC1vJC1U/NG9zZ+/Nl5i0vloCSusbJr+B55imjzSwQNJTIvw7L6IR3VhWbl6y
 WR3UcJTUnE9OROi9p2h42iIo2KBkCMzuU1wiIF/ny7v7y/u/u3LtmnQJm7w9SIVmIemd
 fV7cTTwIHIO+vlvKAvzb2ihpLMLQn0DpwsP5FZvkarGL2ffVqx5Zpj4iEcel9fuygR6h
 hYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725007364; x=1725612164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hFoJ8uGU6Wt+2B+a3U8PT9o5qr4L6h8Nf/lLSdsGyCQ=;
 b=XmzAOGaFo4cVuQ8trXDPuS6COeFMf3P0Mrexbc6RcN11fHnyLV7sEe1qXX+BAGfDkg
 TW/D3EKdSbHKvqIMEXX8YfcWm1M9MDYyNYBqnO9pwx4Vh39bm+s7QZhQyVbBvTf+oFsE
 n8UWjFBTDjD3MzHix1tHdhjRAnrI9QPmwHvyUBEkUUUEqn3upSVaQ2AgAyqfcKfSDEkk
 f0uCA/KOkAx63LMv0iJw8EN7JD22i0OnLOiXezykLMUPQXsnSPXt0aovFLoFiShEqFEd
 ukHMhomA8w0sLcqp8cwvYg8rWy7GOuqyd4oN5FQXpf0ffQvCf1Gq9q/3qHi3ycKk/QvT
 xK1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaT/Fh8G5zodyIUzFTzJcYydG+JABOa9uZikC2VyeVHN7Ojl9W9BRTKFGrrvEZvHzL7UCVJHzLu2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKEjhka0AwhMNmTb0tlv6ucmZecnjs8ETzKHGtGV4iMr8fgpGJ
 vqle/PJ4LIrrB4Z1+E/XN/VRj7qdMIccxmLf8k0BIq7hrBv1eNoykXpCVMkRuNV4aIv0TZkI94z
 1EkzNhxeOrCkEbEEsrxed4d0plkXrrYuHoCft2w==
X-Google-Smtp-Source: AGHT+IHBEq2kXBcob7OwHZwxMgPl68xRTiaqYdA20dFyB6L5ns13TYFSRrWJQJLVdlnc+h48Q+Hs/qXBirYHpgAHAeU=
X-Received: by 2002:a05:6820:2216:b0:5d6:ae6:a852 with SMTP id
 006d021491bc7-5dfacf28289mr1998086eaf.6.1725007364035; Fri, 30 Aug 2024
 01:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-4-jens.wiklander@linaro.org>
 <3bqb6mktkvbdl6h4eekad4mpjhyvzx7mjidhnanboygbwu2asz@6ros56bp6isd>
In-Reply-To: <3bqb6mktkvbdl6h4eekad4mpjhyvzx7mjidhnanboygbwu2asz@6ros56bp6isd>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 30 Aug 2024 10:42:32 +0200
Message-ID: <CAHUa44Fd-Eo5-CUfxDgCFpRVbJP0gzA7LX_-5=cBfBd8NxhpDw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] dt-bindings: reserved-memory: add linaro,
 restricted-heap
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
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

On Fri, Aug 30, 2024 at 10:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Fri, Aug 30, 2024 at 09:03:50AM +0200, Jens Wiklander wrote:
> > From: Olivier Masse <olivier.masse@nxp.com>
> >
> > DMABUF reserved memory definition for OP-TEE secure data path feature.
> >
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  .../linaro,restricted-heap.yaml               | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/l=
inaro,restricted-heap.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/linaro,r=
estricted-heap.yaml b/Documentation/devicetree/bindings/reserved-memory/lin=
aro,restricted-heap.yaml
> > new file mode 100644
> > index 000000000000..0ab87cf02775
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reserved-memory/linaro,restrict=
ed-heap.yaml
> > @@ -0,0 +1,56 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reserved-memory/linaro,restricted-h=
eap.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Linaro Secure DMABUF Heap
> > +
> > +maintainers:
> > +  - Olivier Masse <olivier.masse@nxp.com>
> > +
> > +description:
> > +  Linaro OP-TEE firmware needs a reserved memory for the
> > +  Secure Data Path feature (aka SDP).
> > +  The purpose is to provide a restricted memory heap which allow
> > +  the normal world OS (REE) to allocate/free restricted buffers.
> > +  The TEE is reponsible for protecting the SDP memory buffers.
> > +  TEE Trusted Application can access restricted memory references
> > +  provided as parameters (DMABUF file descriptor).
>
> And what is the difference from regular reserved memory? Why it cannot
> be used?

Good question. I need a compatible =3D "linaro,restricted-heap" to find
it, but it appears that's permitted with regular reserved memory.
Let's drop this patch. Thanks for pointing me in the right direction.

>
> > +
> > +allOf:
> > +  - $ref: "reserved-memory.yaml"
>
> It does not look like you tested the bindings, at least after quick
> look. Please run  (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.

You're right, sorry.

>
> > +
> > +properties:
> > +  compatible:
> > +    const: linaro,restricted-heap
> > +
> > +  reg:
> > +    description:
> > +      Region of memory reserved for OP-TEE SDP feature
> > +
> > +  no-map:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Avoid creating a virtual mapping of the region as part of the OS=
'
> > +      standard mapping of system memory.
> > +
> > +unevaluatedProperties: false
>
> This goes after "required:" block.

OK

>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - no-map
> > +
> > +examples:
> > +  - |
> > +  reserved-memory {
> > +    #address-cells =3D <2>;
> > +    #size-cells =3D <2>;
> > +
> > +    sdp@3e800000 {
> > +      compatible =3D "linaro,restricted-heap";
> > +      no-map;
> > +      reg =3D <0 0x3E800000 0 0x00400000>;
>
> lowercase hex
>

OK


Thanks,
Jens

> Best regards,
> Krzysztof
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FE67ED83E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 00:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD40710E00B;
	Wed, 15 Nov 2023 23:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8551B10E00B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 23:35:21 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1cc79f73e58so25355ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700091321; x=1700696121;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oek2kHOiJKwuGradh8KZUYYGEhpdoKxKkCGLT/Ex0Qs=;
 b=wwxx8LLjR2Dc49ZBi16HuIQSnqJfY404HFjvAb119Cto0KHFhPMCr7HPTtI7n+RYx8
 zdiu8F+qpUWJRYJIbhKrwsDFoguxc6YgckAeL3W1nOajSG9pBSJiqNXpy3rBihNmF8tH
 qaJfUhFHBvtLTnfGoOJpa9qGvGZ5b/91YT6gZbnVmjelsN3DAAW7/BYMAM5fq59Wvymc
 zrjTz7EXO8Iv8falQ2Alvu2Raj6+z1kt19jqheKbP8JMLnd1Nq5v9vAbjDm/ge4O/jv6
 APkogpjP5+zu7Su8padA70Jb4gXqrAlo5sK/E0gN11adTZ1KsULEFarP6xhL3yltX/w6
 Pogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700091321; x=1700696121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oek2kHOiJKwuGradh8KZUYYGEhpdoKxKkCGLT/Ex0Qs=;
 b=ljr0F/uwfcOEzQEu24Gx8Mojftld1wqWBXIARooP2YJaWJHQztIFOEm35/Ng8Yep0j
 mPwqkQ3OszV2J5tGcimmekIXz07Xwz3MEs9iW65MED8WS8WAYy5/DPTAcGFqQWc098Oy
 qC3CAtLdoSzH7P/ILpqeJOQMNDw7mCCXwQbloZF7J5hIVh/g19fC14Leqt7zDuYwHbN3
 p1K2A5IgIbnJpNuwo5TmzSMjqgN8IyoM89JxXPptoL5OJsOFNtfWOSKjseX+x3OmT+PA
 nAHwsXC70o995LULc7K97zAH85cHTr04yBhQzksTDz+hAKPH4nTuzr2Qpruqg16zC+1b
 ZvCg==
X-Gm-Message-State: AOJu0YzUxT8HBdmetQmTQh5CeZ2AaUjl/wS01FST5y41uMmfT7tjVHNL
 ewUme6eGmtyBHB7T38jqjAjGE5HTQxYL76+5nCCD
X-Google-Smtp-Source: AGHT+IGz9f/SLu5mPtYfVW8CPrScTnMxwCAhNmSPfXNU6OOHTiFkG39zGsXsGPkZucRS05i+dhBhg89vqZQYyDxclRo=
X-Received: by 2002:a17:902:f684:b0:1cd:fbc7:271f with SMTP id
 l4-20020a170902f68400b001cdfbc7271fmr66903plg.20.1700091320785; Wed, 15 Nov
 2023 15:35:20 -0800 (PST)
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com>
 <20231111111559.8218-7-yong.wu@mediatek.com>
 <0ccee72f-98ac-4a08-9253-9c22dad4d95a@linaro.org>
 <5d7b2458b8d1896ce575f4ed2d413f4e8eeb92b4.camel@mediatek.com>
 <3daaa2aa-61d4-40db-b36d-cd825a340d2b@arm.com>
In-Reply-To: <3daaa2aa-61d4-40db-b36d-cd825a340d2b@arm.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 15:35:09 -0800
Message-ID: <CA+ddPcM5CuiOs+JGGBtn7ea1vzwHvawyApa_wRcGWNLD=yrrnw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: reserved-memory: Add secure CMA
 reserved memory range
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

May I suggest the following for the device tree binding? (I'm not very
familiar w/ device trees, so apologies for any oversights, but trying
to process the feedback here and help move Mediatek along). This
should align with my other suggestions for having an MTK specific
portion to their secure heap implementation; which also means there
should be an MTK specific device tree binding.

# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
%YAML 1.2
---
$id: http://devicetree.org/schemas/reserved-memory/mediatek,dynamic-secure-=
region.yaml#
$schema: http://devicetree.org/meta-schemas/core.yaml#

title: Mediatek Dynamic Reserved Region

description:
  A memory region that can dynamically transition as a whole between
secure and non-secure states. This memory will be protected by OP-TEE
when allocations are active and unprotected otherwise.

maintainers:
  - Yong Wu <yong.wu@mediatek.com>

allOf:
  - $ref: reserved-memory.yaml

properties:
  compatible:
    const: mediatek,dynamic-secure-region

required:
  - compatible
  - reg
  - reusable

unevaluatedProperties: false

examples:
  - |

    reserved-memory {
        #address-cells =3D <1>;
        #size-cells =3D <1>;
        ranges;

        reserved-memory@80000000 {
            compatible =3D "mediatek,dynamic-secure-region";
            reusable;
            reg =3D <0x80000000 0x18000000>;
        };
    };

On Tue, Nov 14, 2023 at 5:18=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 13/11/2023 6:37 am, Yong Wu (=E5=90=B4=E5=8B=87) wrote:
> [...]
> >>> +properties:
> >>> +  compatible:
> >>> +    const: secure_cma_region
> >>
> >> Still wrong compatible. Look at other bindings - there is nowhere
> >> underscore. Look at other reserved memory bindings especially.
> >>
> >> Also, CMA is a Linux thingy, so either not suitable for bindings at
> >> all,
> >> or you need Linux specific compatible. I don't quite get why do you
> >> evennot
> >> put CMA there - adding Linux specific stuff will get obvious
> >> pushback...
> >
> > Thanks. I will change to: secure-region. Is this ok?
>
> No, the previous discussion went off in entirely the wrong direction. To
> reiterate, the point of the binding is not to describe the expected
> usage of the thing nor the general concept of the thing, but to describe
> the actual thing itself. There are any number of different ways software
> may interact with a "secure region", so that is meaningless as a
> compatible. It needs to describe *this* secure memory interface offered
> by *this* TEE, so that software knows that to use it requires making
> those particular SiP calls with that particular UUID etc.
>
> Thanks,
> Robin.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2C85B8C78
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A2610E963;
	Wed, 14 Sep 2022 16:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD1210E963
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 16:05:23 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id ml1so12114504qvb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=SOoPRVDf2Wqru23+CWe+xyZSfkeciLBT7O19755mw8E=;
 b=TJUgisxy1Ass//cR8NhmkOr+Wv2YCzzm1FeQ+GVowtxSU4WYaNXesAq0wW0saIo2WT
 ai9dp+tLqYFdLKBucao1TtSo8AVrC/6D2tqJtFGW+753ZiC0t5y3ms5TZxwQltx+8W3T
 ZeZGfULMY9PsdC68RViAR8PzhiVyyKv4eCxshYTMBgmnY8A5pwOpmne5XcgkWTHOe0v+
 UrllJamhc8dZpIN97ykTURsAAG3ajN4pO8eEsjgzs30smzUye1vxYxpKLwcRylbmWH1a
 qnWsrUwfVNfB+YegKzzr8SJfU9fUknbl+TrKhgWJ8ar8/l0KQNH/3C+904979STvzBzm
 vJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SOoPRVDf2Wqru23+CWe+xyZSfkeciLBT7O19755mw8E=;
 b=1n4WqOQJn/bAb6FWIkUqYxHiqGT4WC56Z5ouVc2HCeGTzvlUGL+5vu0dteAgzMbNyW
 2yY8WhtiReekoUTVye+eLFlJ1pse2S8xFhkUmxlcwZOoU+4WcrVsRy77SXpQVdRIsMFO
 J40vx41MZUQ3DgTKXdzhUrUYqn3cOeQGBcN/0G3yxvb11qlny3fYglEwD8pB5DTjdh4E
 X+katpxks7Vn5MILs2mZN92OPOL0HevfXrPy6lncpmtV83Hu7GDaJxxtgmqNP3N93axp
 Q/mJlbg16Sojcw98uS1Wyis5yel1hkTNJ9+BvOFIk+S8xdFJqwF91VQ/Svr5pV0eIaHB
 C7xA==
X-Gm-Message-State: ACgBeo1qgv7tDBWMDH2pqQpO4OmwsMjDTmIX3r8IkRO75B8K18WSzem8
 YHmR3sADcP38XJDFcw3+m1Q=
X-Google-Smtp-Source: AA6agR7tVDqgXf+tFX8Bxz9heEKs6QvsHU0fVfTQifZS+APuoT/oGczuwlMfk6TH9MRYaQNfC0WoCQ==
X-Received: by 2002:a05:6214:2521:b0:4aa:a4db:beda with SMTP id
 gg1-20020a056214252100b004aaa4dbbedamr31787504qvb.104.1663171521542; 
 Wed, 14 Sep 2022 09:05:21 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 bn32-20020a05620a2ae000b006b615cd8c13sm2073582qkb.106.2022.09.14.09.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:05:20 -0700 (PDT)
Date: Wed, 14 Sep 2022 18:05:16 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: reserved-memory: Support framebuffer
 reserved memory
Message-ID: <YyH7vGKVLoBrBusd@orome>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
 <20220905163300.391692-3-thierry.reding@gmail.com>
 <20220906142721.GA427176-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vz1N9iQ19WQDz3ja"
Content-Disposition: inline
In-Reply-To: <20220906142721.GA427176-robh@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vz1N9iQ19WQDz3ja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2022 at 09:27:21AM -0500, Rob Herring wrote:
> On Mon, Sep 05, 2022 at 06:32:56PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Document the "framebuffer" compatible string for reserved memory nodes
> > to annotate reserved memory regions used for framebuffer carveouts.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../bindings/reserved-memory/framebuffer.yaml | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/f=
ramebuffer.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/framebuf=
fer.yaml b/Documentation/devicetree/bindings/reserved-memory/framebuffer.ya=
ml
> > new file mode 100644
> > index 000000000000..80574854025d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: /reserved-memory framebuffer node bindings
> > +
> > +maintainers:
> > +  - devicetree-spec@vger.kernel.org
> > +
> > +allOf:
> > +  - $ref: "reserved-memory.yaml"
>=20
> Don't need quotes.
>=20
> > +
> > +properties:
> > +  compatible:
> > +    const: framebuffer
> > +    description: >
> > +      This indicates a region of memory meant to be used as a framebuf=
fer for
> > +      a set of display devices. It can be used by an operating system =
to keep
> > +      the framebuffer from being overwritten and use it as the backing=
 memory
> > +      for a display device (such as simple-framebuffer).
>=20
> I'm on the fence whether we need this. It doesn't really add anything=20
> because 'simple-framebuffer' will reference this node and you can find=20
> it that way. I guess a bootloader may not setup 'simple-framebuffer',=20
> but then it should probably not have this node either.
>=20
> On the flip side, better to have compatibles than not to identify nodes.

Yeah, I think given some of the comments that Robin Murphy had on the
iommu-addresses thread, having some compatible string to derive more
information from will be useful. I'm not sure if "framebuffer" is the
greatest choice, but it says exactly what this is, so if there are no
better suggestions, I'll stick with that.

Adding Robin in case he has anything to contribute on this side of the
discussion. In retrospect it might have been good to have more overlap
between the recipients of both series.

Thierry

>=20
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
>=20
> Use '/ {' to skip the boilerplate causing the error.
>=20
> > +      chosen {
> > +        framebuffer {
> > +          compatible =3D "simple-framebuffer";
> > +          memory-region =3D <&fb>;
> > +        };
> > +      };
> > +
> > +      reserved-memory {
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <1>;
> > +          ranges;
> > +
> > +          fb: framebuffer@80000000 {
> > +              compatible =3D "framebuffer";
> > +              reg =3D <0x80000000 0x007e9000>;
> > +          };
> > +      };
> > +
> > +...
> > --=20
> > 2.37.2
> >=20
> >=20

--vz1N9iQ19WQDz3ja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmMh+7oACgkQ3SOs138+
s6F0MRAAhE8m4MmJIOnrbVe0kXrLKVk0XeKADrZ9lN4WPHMWC9wyBJZebRPuSyr8
jzYQ5fbktFcNg06Hx2pHYOoj9izSd976mWBGP8xdlo2KGrWm1c1/xof4LG29cD3t
cnd139/2Dkq65dqTjQmp8PiHJAzhhPEwqTcy8cMhL/mmyhVeFl2MXC5jcU5ryU+/
AMMjKGpJ0wSqnC0n4DITZ0NImCq13SElE04OGAMSgT6uBgsjmcLwxvGS2a5+VgIq
MNURibL9v5VZ17/r2mCrr3ScGAtI/xM88flYi9joV8phQ4tVu4u2G0qESwoACjaG
gEdWJUceJB1pQIaZTZ5UJsvkUyRYoPhGSxAqiipmhfV9PLa/iaRs1peGGGKPGzvZ
ruh/wNRVgh9BMU7vym4foFMFb1Srcs7Z7SFowj/gxxb37r7JQ4k59NQGSj27uEw0
qbBO7YC0eGiIVKzC5UMdEOH/WtswBpX4HYGR3zDuVJn61i3HoctP+AxL3N66eMti
daMD2OVDSj2QhzOt28UxBKIRUuUFxp7puVzJxBnTgYO6enbdzADZOSypS+MqCV5l
fUuhy9JZelU8oxOBMrcdA7IJbFAKDWWQNZvcIYDVNcSmxxImlCp4WdOEKpRBGP6s
j+Xe6FA4zUNY220bnkqdrMrefNKgWgKCBNDGLARqv1yyOJRGTTY=
=GyHn
-----END PGP SIGNATURE-----

--vz1N9iQ19WQDz3ja--

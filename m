Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A8D601143
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 16:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C10D10E105;
	Mon, 17 Oct 2022 14:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942C610E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 14:38:58 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id q9so25532660ejd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 07:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=71UDum2d0oKTyyrYpYR53saiIHSJtCoCDLAXfJhuh0c=;
 b=YOUbjnCw6CQ+zeEfv3qNSDqY46R8PCIYzPoFfDBaZLucYbmypPvHxW50NxmaKxPp+v
 3b1jxUGzTfRuKl4tahTyQrJZPRpQymz4LQy+1mJPTPt0p3gIruNxRxFe4zdEu+P1ttLE
 2czHBIjRqa+BBLpesK3o5XgQGzymmWdILwZGmLFJoAaQ/KdzwOdvC1m4ySYZpxG41hqK
 6l6avz8Fz9BD9VC7lvW3Kpd0i+44l4U9PxGOf0f/gj+Z7hCCWpNJZsXzq2EPRZ5E50s0
 cQX7tqsZDolzzJ+UB91ZVbcB0YaGPWOqvF+vMcViRek0bcN/zWJSBfX9mN1kCwg1r/dx
 /2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=71UDum2d0oKTyyrYpYR53saiIHSJtCoCDLAXfJhuh0c=;
 b=IT6XhMcvcgo/N0XSItG1lAreGyTdL/yooMSik78LVIw9wPpTDCWXU1rmGH/nO2cp3A
 06vAKv8Ja8SFelPJv3y6LzsOOrtjpKaRjgOW1wsG9JnnU51GTS98RO45IXpVEbne1+iX
 iVxA3dosYb27crha4djBSnnyom8qoLHM0xc+wjmI8nStkhmoX1DLlKQq7emYl0+6Avwn
 DgthIznREKzQWHC6dmBTrPFagD+q0mJhwK6ZtopuyfG0khS1uU7EMpd9sqnLsTbJWItG
 aUkqAZRY4D3kMsf0HHt2TJryRRxHG2fAyaYiddSjcGyP5x9NOGiuYoOiQeuynRUji+nn
 FipQ==
X-Gm-Message-State: ACrzQf3xGPPO7qkvyELgUEeWDTGDmNdbvfOhv5lxE7tiyob9I/VGwtLQ
 KnYnp+8PnPukCve1vyZ7/4Y=
X-Google-Smtp-Source: AMsMyM5B/fqBSYUN5FBCtfdzvZ77V3Tlw079HWU+uo6zYZQQL2kTw4bk3X3MK0XWuUtGmtvWbsdpIg==
X-Received: by 2002:a17:906:dacd:b0:780:a90c:e144 with SMTP id
 xi13-20020a170906dacd00b00780a90ce144mr8882293ejb.153.1666017537079; 
 Mon, 17 Oct 2022 07:38:57 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a50ba82000000b0044eb5b922bdsm7434353ede.24.2022.10.17.07.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 07:38:56 -0700 (PDT)
Date: Mon, 17 Oct 2022 16:38:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: simple-framebuffer: Support
 system memory framebuffers
Message-ID: <Y01o/ktQGO430tc6@orome>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-2-thierry.reding@gmail.com>
 <44567457-2062-6e16-9a7f-c4ad23809ac9@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oU+6EXuFJR8wOBj7"
Content-Disposition: inline
In-Reply-To: <44567457-2062-6e16-9a7f-c4ad23809ac9@suse.de>
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
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oU+6EXuFJR8wOBj7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 11:37:37AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 07.10.22 um 14:49 schrieb Thierry Reding:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > In order to support framebuffers residing in system memory, allow the
> > memory-region property to override the framebuffer memory specification
> > in the "reg" property.
>=20
> What happens if both properties are present and they disagree with each
> other?
>=20
> I understand that the framebuffer is behind 'memory-region', but does 're=
g'
> still contain device memory?  Do we need to acquire ownership from within
> the driver?

The intention is for both memory-region and reg properties to be
mutually exclusive. I can't think of a scenario where you would need or
want both.

Note also the documentation for the memory-region property:

|  memory-region:
|    maxItems: 1
|    description: Phandle to a node describing the memory to be used for the
|      framebuffer. If present, overrides the "reg" property (if one exists=
).

Thierry

--oU+6EXuFJR8wOBj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNNaP4ACgkQ3SOs138+
s6H7iw/9HTbPf+ms8rkbXYj+BazFfadfC6vbV0zPNK0f5t1IYUC8Dk0MYIwjdCAN
KbSNIys+uh1EKjJeClsiJvSBLhrqrZVeVdqruxnLUx3kDYuIWvwJBcF4RJE/3SoG
wS2nU80/E4q56dTqRyMxMYfwM86fnAFm26TxZul0Oa4prNc7KV+ixrQKybszACLa
sAQ5F9FimcyngTFIspuT6v7a+rhS9H7uFjOKFQirfBw57aA7gsb2VMpH4UMOx77n
UA9xa9XqRU9M3A6DC/W80XikkbBAK6eOCHrFIyaIM69KPnrdLhu40BbcqS7ol8Jw
tkKRK3rO5FPQSGj1kV+oY9S8wE6p8lUl26Wh6HcLxZfIUH+SYP3AZ/TDIwX1LPiU
7ETTkD5UJZRoTXt36FFt7dwGEiBpmbAuKwsa+M1zlTi5mnzOlqNzxmP7T0XpnDKQ
QaF5wRp7yd+hrzrTOhq/XC4Nxih7dCDqG5Ige7EpY14NopzwXeiH0FKNXlq2Y0FD
CnbxXPCl+Eitf2M8bCkn0n43LjxLpxEqJLUeM0ZyZTzBzu39wx4J2nyZX5KMUsCK
lh3d1x5Z0nD99lNrIVlxPLwFkUw50gDwn3NiPcfzuAAOpmrcmpugtp3lMtIJ4hyf
F9KSI+8HNSGujTApANyy6mvp+T8buDgv9VoOd4A85RhJhNIprkI=
=jBYl
-----END PGP SIGNATURE-----

--oU+6EXuFJR8wOBj7--

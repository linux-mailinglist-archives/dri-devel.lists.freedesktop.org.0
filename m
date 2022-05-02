Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393A2517552
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 19:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534DD10E27B;
	Mon,  2 May 2022 17:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A052810E27B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 17:04:19 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k2so20326961wrd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IKIkKWLuV1OGwYFULnAsOkM2G0PGs69FkOVI5N/cNnw=;
 b=E00mffjDjTe6c/+9iDlEB1wdjEcT0U7DrFgxMpBPQJx9s+IQ4i+hMTICCKe1dASuRK
 vv17Che0ajGuui4mx+K4r1+z9SF2TndTWwcLkPj7BMuHQVSLA/G8SdWC1WOJcaezXcEO
 b/Tooz0sFb9G1wLn4RiJVFlcskkBXXUmyjKYwz7a9+TwyRGdWnAuwzUf0fCiUkO4ygoB
 YD8aLEPqcUpn/YjO2ONOe5YijCPdvSc8VQbjgldKdr1xt9IDzvQxyEeVTIAnEu+JSpYf
 STMZn12f6RylbjtgqkIXpQn6ujutZoG6Wz/zFfehbOoE6scGhaR9O9vV+mvz4mPPLlYt
 5d8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IKIkKWLuV1OGwYFULnAsOkM2G0PGs69FkOVI5N/cNnw=;
 b=NRd3I+8BI7o+FMiMObE5DGdhlxtW6/9dZhbuFmVlfdjJJes3j8/fAQSf7Kmw3tBuuS
 30mcYBDeQQCWpZNsUQhUFYSbBXtFA6D2x6ddf5U0RsL63PQDFOL8L6Y3/3T9erDPV2A7
 k+qyV0va5IRH6Be8K0gePCAT+My2vYgieEnKlIwGgqO7YDS0ijM+9AWj8NOtMpZK51Jx
 9bMpixvRYzgDUhW3xKg4+YVgFRMGfD4nDgmkpsGD/rqIUnMbxLTkT0Bn6EGw30DsBNUo
 S587rGEIiK/7XRo75Qbyp7Nt40J8yK/1x4atDwrpdnUhdme0UrG/PJxlHLkpcU3oyMQ0
 2SaA==
X-Gm-Message-State: AOAM532OM1bPWjD7oYOfTbLWkPy1DIW/z48goAwf0x1TTwb2qobuENmu
 vUmsohJ96nd3jg4WDFbH6u/5YAe3s/8=
X-Google-Smtp-Source: ABdhPJyY68uLuAzWuSiv8NzwPVrip8vAdDKoe4nwXxnPu/iAX4m8EhrXazWqZbj5vHpF7sAHIxdztA==
X-Received: by 2002:a5d:5885:0:b0:20c:7048:2951 with SMTP id
 n5-20020a5d5885000000b0020c70482951mr1354652wrf.28.1651511058007; 
 Mon, 02 May 2022 10:04:18 -0700 (PDT)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 k8-20020adfc708000000b0020c5253d8easm9375256wrg.54.2022.05.02.10.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 10:04:16 -0700 (PDT)
Date: Mon, 2 May 2022 19:04:13 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH v2 0/4] drm/nvdla: Add driver support for NVDLA
Message-ID: <YnAPDRZMc88cDdYS@orome>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <YmqgailZKIuY7zTZ@orome>
 <beacfd71-ebd0-7fde-187f-34b7a42a47de@kapsi.fi>
 <20220429032810.GA10104@chq-T47>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xESg3apyTC1nCRXH"
Content-Disposition: inline
In-Reply-To: <20220429032810.GA10104@chq-T47>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xESg3apyTC1nCRXH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 29, 2022 at 11:28:10AM +0800, Cai Huoqing wrote:
> On 28 4=E6=9C=88 22 18:56:07, Mikko Perttunen wrote:
> > On 4/28/22 17:10, Thierry Reding wrote:
> > > On Tue, Apr 26, 2022 at 02:07:57PM +0800, Cai Huoqing wrote:
> > > > The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> > > > which is integrated into NVIDIA Jetson AGX Xavier,
> > > > so add driver support for this accelerator."
> > >=20
> > > Hi,
> > >=20
> > > nice to see this work going on. For subsequent revisions, can you ple=
ase
> > > also Cc the Tegra mailing list (linux-tegra@vger.kernel.org) as well =
as
> > > the Tegra platform maintainers (that's Jon Hunter and myself). This w=
ill
> > > make sure that more people with an interest in this will see your wor=
k.
> > > Not everyone follows dri-devel, linaro-mm-sig or linux-media.
> > >=20
> > > Thanks,
> > > Thierry
> >=20
> > From a quick glance it looks like this driver pokes DLA hardware direct=
ly
> > which is not the intended programming model on Tegra hardware (there are
> > Falcon microcontrollers that offload task scheduling and synchronization
> > from the CPU). The hardware is also behind the Host1x bus so a simple
> > platform device is not sufficient.
> >=20
> > Was this driver developed against some platform with OpenDLA hardware (=
i.e.
> > not Tegra)?
> >=20
> > If so, we'd need to verify if the hardware matches the hardware in Tegr=
a194.
> > Also, this driver may not be ideal for Tegra platforms since we would l=
ack
> > the hardware scheduling and synchronization facilities. It is likely
> > necessary to have separate drivers for OpenDLA and Tegra's DLA integrat=
ion.
> >=20
> > Thanks,
> > Mikko
> >=20
> Tegra DLA seems to work with a slave coprocessor, the host driver just
> impelement message queue, share buffer, notification... The hardware
> detail of DLA maybe in the slave driver(not linux OS?).
>=20
> Sure, This driver just support for the SOCs or FPGAs that OPENDLA
> inside. I will change this kind of description "integrated into NVIDIA Je=
tson AGX Xavier"
> this driver dont support for Tegra directly.

Yes, I think it would be good to make it clear that this is not going to
work with the Tegra instantiations so that people don't get confused.

I think it would be ideal, though, if we could reuse as much of this
driver as possible to work with other instantiations. The only reference
to OpenDLA that I can find and which seems somehow relevant to this is
here:

	https://github.com/SCLUO/ITRI-OpenDLA

Is that the version that you're using? Or is the version that you're
using at least compatible with that one? Apart from that and the Tegra
instantiations, are you aware of any other derivatives that we need to
account for? I'm worried that this might fragment to the point where it
becomes unmaintainable in upstream Linux.

Even if this doesn't concern the Tegra instantiation, I think most of my
other comments remain valid. Things like global variables will get in
the way of multiple FPGA instantiations as well, for example.

You will also need to provide the device tree bindings for the
particular instantiation that you're working on. Typically this would be
identified by a vendor-specific compatible string for your particular
board, but if it stems from a "canonical" FPGA mapping, matching on that
compatible string might also be an option. In either case, when you send
out the DT bindings, please include the devicetree@vger.kernel.org
mailing list so that they can be properly reviewed.

Thierry

--xESg3apyTC1nCRXH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJwDwoACgkQ3SOs138+
s6HQBA/9G4mT1YRxO1XmbGtYRMlb5WwgJE5DE02upNSHm7Ixb2KSRxQqcdLPG/rQ
ip5zcasTrh9hLKISslL9+mRphslV8obFPSF9tDhQ/SINiIRM/9CYvI4vkr/qe38t
C6GU4tlQwn/IJIy1i4jaDVxdFEtQzXEAucfG1lLee1L46jYUpykk3cTKFCZM8xND
HTrWnKdCUsjb9it08g68ItVxkq2v5lG2HKT+j4LJeEA82i4iS34/H42QOyQ7yQi9
0CsRDMq/BC7Nu8bSCKzwMAp6FiO9ZSXBPb5Bvpy1gbZRKMX0OvQe2u0/wk2DI0zG
G70ioJZUh8lq7Dtx6TnFTaYskxKFipHfni4oBOMXD4GQJ9YPlPG5NMNTDPLvL+Co
OqwgDr3EFKee6efZwsJbzYF+2sculK4syW9OHZDvP8RuhqW2qCiWBBQxqj9SY/hB
LJ33BUv7iCer3fpSORrmmT2rNRzCw0xqiOWniofQTdKZUDtphrjwxW9wT+FbnFNw
/mrXZGsB8UY8sKQyhR3FDL74g6QYb9wrpq9mJ4jKD/Py3Yd00v00GjgeDHmb7V/d
weu2Nrx1NG83vW4rBqGd4qnOZbMQtEesVgaa3SYmH5lyJSzAnCB9QT5PPR3xL8o3
96I0sU2UqMHqWjCMqKFLD8886Oovi3Jo4uuXONTL95ZIDoScJaw=
=Kefv
-----END PGP SIGNATURE-----

--xESg3apyTC1nCRXH--

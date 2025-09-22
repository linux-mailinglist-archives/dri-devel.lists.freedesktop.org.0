Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC28B914B4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 15:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572BE10E49C;
	Mon, 22 Sep 2025 13:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="q7XVwUX/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic305-20.consmr.mail.gq1.yahoo.com
 (sonic305-20.consmr.mail.gq1.yahoo.com [98.137.64.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD6410E49D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1758546450; bh=0EfXqbK4DHTE0Z8e3N5vogNx54gJngPVVQY62jODgAo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=q7XVwUX/3uV6Rs+CP6Wm+HUOtA8AptmDwmrDBNnyhL8HcfiX6IapcuXqCcmzjGbXNpDJpEDx2bOCGIPbKKKLzDzsCSfewpbHfeBVZqfWjjCYIQIYkukPHq4omF4a0lauZUfTxT+jTY7Lt+6+z/51awJ23j2U08lEcsFuk77zpbQ9G/LTPMDqVYhW5i1JmW8GXBHvKtDHx33vyEkLuJY9v2VhIJXJk7z+HGkiPtwnbBYegpr1/ZOCKLu0tMUxbuu/9mSKpbrDqSbKOK7uGIvlphK7HTP2hHVd4vgmTosQkkjMFW0K9X9/jp2H3QA4XtxvEVot9ZquvyIv/hFjVbgepQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1758546450; bh=8nUHS3jqYhkBkL3t6jmEcWY2pa09EtZEaXjaisrZ/A8=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=IMZUBXgW3Vm6Zvjd8Mo6WMoQtOPaY9al2ufjMxEahZahiMNGY+0lTKnt/A3nw3tQoYyj8XhhtaqEP9vpCzw6vhM1t7c4iYIP+tUlgAz4wIucbzNukCE5fcPh9uRTZ/EF3KoOrR9l2vA2wacGwwoCMZshhfgwcsFaRauxzgjWX/PUD9tL4Z9BUTi/QZArU/yud2j9bMG6gAbAnbThlaRRDHPyXIeSWQCPjMCXiLbYFKRGECkV2C3BMcLOsG1SSx1mK7XqEXlSzldfSqUDFsshzvrjdeBF3d8i2k8BEax/GV8iExKYLqfx3a2tQzLCaMrFQXSkRiSbLZuq0wPnCUYfIQ==
X-YMail-OSG: uMjTQtAVM1kdo9eTdXKhlDzDjODgp6IjVE_Etyc3FC08mABxKOmkS0XCR0tnT5i
 75uGz58sIL2nshhxnKeFHqkwLkoAiIghJbLwMJ6_Je5C5nai2iam.OsDWnj42iI94_HITYi9FiRg
 hRyV3Dkk5vEppKQAhf3E77EIVhrKtbaLVRJhlWQGwbo1bq3zPxGQDqxQeuZkcGgMx0WRdhrBQN5r
 JdwuAoe3xLWLZgJOYSCJJi5_9FYJ8ou4q55uBPQ0QFq7JuBc9TrZNno_YoCqTj91qnMPf1kjYQxb
 UMXTJbJ0i34VSF6wV81CEhhRqDBiHuKQL9rQIu_W84H73RQpaR5Xt8f0BQiyJ1cbXLWB2Sk.fkEE
 wgycRvvIR6J5oGjOXCxL0Oshk778xfNTZX6Wmy2.q3VjZH250PwliqhEe71JujeBkKTa_8hc5wWZ
 zJ5yRx4U9kicXkPQjW.S6MJl5dBIRy5S7YDSVAnikDLgKbAAsueBIe.9E4SAk9I71nI7.IFY4m3q
 dPkzQnEQtn3aH_rGZrj_w2ovl.eMWvYZZhiw4OV9MOWuKu1xVpps3OYRrKrhZtjVDc_UURihhpGa
 nqJY2TZlQZBaA6g_4xBwVPGeldhtuOnWOxlZDVCk2a5muoIkk_NamNghMj7aCg7n3LNZVxmyCLax
 hIAilW.ckS2lnWfUd4upoqvCaLO9vRC.qttqq36HFvu0k86GEbS3N3ZMV3mdQiP1SGy46i.L9qda
 lTJfWVRKczjsEkIif.eaLMpKnsFzJh.ntgFWFCwDe1JE6M___HTZlKn5Xm_wtfBRO2pyiw1iRrQp
 J9f81m5VgJSMt69oefJWtlc5KrNiR4TavtFpm73WzNE3iuMusw0ZH7VlCi0p0YQs_rfvX1drnRpf
 cmzVtxQDjeQJtSIKyxGW5AUg36OFwd_IcI5gsHb.ke7M9g4YdUA7q_oOhCEn2AMGYDmuEQTHFy2f
 Gh2RBi5UufKqOwyjnbweYxUH_zR7ZPUFu9VEYbTMGi5jR_97FwjQCEpi8VJuZ7I.Ru9LzhT1OCRE
 .dLLK6WBYC8g0_n0FIHe7PXYHVJ3pit5nDvJDC9tWv1_1vyfgbRCzwA6FHG90QbHLALosl.NHmg7
 ojAcpgHTM2qi5GM2_i_O2.QZ_ysUwh0Ky2YGvF.i1JFQUVZmrK1kPoz8mGniSHGShtN833L0dgCQ
 EKepclSvvRvINplmIddvoXa.qUyC8kDSn93KFR1wjmkyoHEYoD2hi2SQ6wJ1jaTKhNjFTsi8nnq_
 QWpAdETMAmHEQjYdKZ.FIMFX9SAIbT6dJ0827NZa2FWWjRu65DKzw3S3aP4943.Gp6Kk6PwFleZR
 R_q20FxBec9Dx4s2o6bV1SbznqNVEKF3Sohjc30p1PnpD3ZimjbYg2_a6Sj0b9gTKq4BATZxxqRD
 ovC48RIEvKoEx6WinM9z25BvFOIk54P8flFJyDOi0iE2gG6b_foQBD5VChD4qc1Q2uEHw2FtG3bj
 SQ9JER9e65ggaPTRE.sSV.H0L_iun23.GQMqPHpcrQfF76g8CKaudNTREVPS0bxWvoxhPVUCmOoh
 FPEqVim5arNSdhLbuh43iBuzJ4wsY3WJnZr3hHEWCKSN.cehZa._AukzbqT14sfd2TloC95laect
 _lgJxgW90JWvOUr8b696qHbR3NPI5QN9bxnNqkEI39B9VpPVHDNHLTk6TKcK42nQ6toEGDbMkzxx
 j2XAF4nd6SA.3Rv1tpq9kX9rMo9dIi7g_E3vQKItY4MCYwKoUkX0Zy9Svtz.mRhnpIK9sKlrumE4
 uHr3BkQlR._GMBhzKPpgW3OwabgKLENNSA.yONqTN7dkuo1hPYsv77eMoyWZWzQquFsLRDOyMlCu
 oo5ifLT126E9kzb4sFzeFR3_GF34CdeCM.TG9Bm9VGwlPW687PL6N7C_OWhJ5h25FUQqm9OQoBKX
 HO2JmMAW1RRjlAfUqJZuJLy5w5QHJtU4qbfep46r7VSJ_5Dt8JBXvEPPNx4qSKmzOrysllotDjf7
 cGXKPntGHCuDJ977527BkfVm1uafp1J99Sjg7SDMPrZGcCGPcwUXA6rWH44f7jgfNlD_z4tTHaAD
 9yf1GkmjWwsWR25wR7R.Dkc4z6V2mNmm0YaN0dL.UQ8ggeKnzxAksoJWdkmLxqShkBY32O1liG29
 E9KKgK1IfiRRipPKrCIYFouseQd9jJvWkj40SG0aLJeE3FGuNoAQC30pR4TkCD2Gjg8LezrlrJH1
 ttKxVRxTKlTp_12foPKIhl.FkQYZ.13vI4QfAfKY0b_YOr.xCPUTiNLSQHg--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: fa94e19c-8fce-4d91-8c55-ef4cb44f0a34
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.gq1.yahoo.com with HTTP; Mon, 22 Sep 2025 13:07:30 +0000
Received: by hermes--production-ir2-74585cff4f-6d9mc (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID a37f67a5b94ace5596a44b3048a74291; 
 Mon, 22 Sep 2025 13:07:24 +0000 (UTC)
Message-ID: <b87337baa6bdb69354f368a5526a68f1cc5f701c.camel@aol.com>
Subject: Re: [PATCH] drm: gud: replace WARN_ON/WARN_ON_ONCE with drm versions
From: Ruben Wauters <rubenru09@aol.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 22 Sep 2025 14:07:22 +0100
In-Reply-To: <202509212215.c8v3RKmL-lkp@intel.com>
References: <202509212215.c8v3RKmL-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24425
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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

On Mon, 2025-09-22 at 08:47 +0300, Dan Carpenter wrote:
> Hi Ruben,
>=20
> kernel test robot noticed the following build warnings:
>=20
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Ruben-Wauters/drm-gud-repl=
ace-WARN_ON-WARN_ON_ONCE-with-drm-versions/20250914-235627
> base:=C2=A0=C2=A0 git://anongit.freedesktop.org/drm/drm-misc drm-misc-nex=
t
> patch link:=C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/r/20250914155308.2144-1-rubenru09%40aol.com
> patch subject: [PATCH] drm: gud: replace WARN_ON/WARN_ON_ONCE with
> drm versions
> config: x86_64-randconfig-161-20250921
> (https://download.01.org/0day-ci/archive/20250921/202509212215.c8v3RK
> mL-lkp@intel.com/config)
> compiler: clang version 20.1.8
> (https://github.com/llvm/llvm-project=C2=A087f0227cb60147a26a1eeb4fb06e3b=
5
> 05e9c7261)

Hi,

Thank you for catching this, I completely missed it. Since the patch
has already been applied to drm-misc-next I will send another patch to
fix this issue.

> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes:
> > https://lore.kernel.org/r/202509212215.c8v3RKmL-lkp@intel.com/
>=20
> smatch warnings:
> drivers/gpu/drm/gud/gud_connector.c:597
> gud_connector_fill_properties() warn: passing a valid pointer to
> 'PTR_ERR'
>=20
> vim +/PTR_ERR +597 drivers/gpu/drm/gud/gud_connector.c
>=20
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 580=C2=A0 int
> gud_connector_fill_properties(struct drm_connector_state
> *connector_state,
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0
> 581=C2=A0=C2=A0				=C2=A0 struct gud_property_req *properties)
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 582=C2=A0 {
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 583=C2=A0=C2=A0	struc=
t gud_connector
> *gconn =3D to_gud_connector(connector_state->connector);
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 584=C2=A0=C2=A0	unsig=
ned int i;
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 585=C2=A0=20
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 586=C2=A0=C2=A0	for (=
i =3D 0; i <
> gconn->num_properties; i++) {
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 587=C2=A0=C2=A0		u16 =
prop =3D
> gconn->properties[i];
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 588=C2=A0=C2=A0		u64 =
val;
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 589=C2=A0=20
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 590=C2=A0=C2=A0		if (=
prop =3D=3D
> GUD_PROPERTY_BACKLIGHT_BRIGHTNESS) {
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 591=C2=A0=C2=A0			val
> =3D connector_state->tv.brightness;
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 592=C2=A0=C2=A0		} el=
se {
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0
> 593=C2=A0=C2=A0			unsigned int *state_val;
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 594=C2=A0=20
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0
> 595=C2=A0=C2=A0			state_val =3D gud_connector_tv_state_val(prop, &connect=
or_state->tv);
> d00e57106c0d0c Ruben Wauters=C2=A0 2025-09-14=C2=A0 596=C2=A0=C2=A0			if
> (drm_WARN_ON_ONCE(connector_state->connector->dev, state_val))
>=20
> You accidentally deleted the IS_ERR() check so now this function is
> badly broken.

What I think happened was that on replacing WARN_ON_ONCE with
drm_WARN_ON_ONCE I had to find a drm device for the first parameter.
Since there was not one readily available I believe I ended up re-
writing this line, and accidentally left out the IS_ERR(). I will fix
this.

> 	if (drm_WARN_ON_ONCE(connector_state->connector->dev,
> IS_ERR(state_val)))
>=20
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13
> @597=C2=A0=C2=A0				return PTR_ERR(state_val);
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 598=C2=A0=20
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 599=C2=A0=C2=A0			val
> =3D *state_val;
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 600=C2=A0=C2=A0		}
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 601=C2=A0=20
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0
> 602=C2=A0=C2=A0		properties[i].prop =3D cpu_to_le16(prop);
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0
> 603=C2=A0=C2=A0		properties[i].val =3D cpu_to_le64(val);
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 604=C2=A0=C2=A0	}
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 605=C2=A0=20
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 606=C2=A0=C2=A0	retur=
n gconn-
> >num_properties;
> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13=C2=A0 607=C2=A0 }

Thank you for reporting this

Ruben Wauters

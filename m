Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8B54E9D43
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5AA10E6E1;
	Mon, 28 Mar 2022 17:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17C610E6E1;
 Mon, 28 Mar 2022 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ilMcPBjUCXJWeW2dVgPW5uEUuNJPkXASfjLKkiNNkIs=; b=T+m65BH3m8iNnGqfbRdiWmAMiA
 trFg2yKWGqWUm5wBcKzDvtyri4OXqPn53c9WSF/uTjShv6yV+tIVD/IXPNgqMaUoURo5vHhn4Yjq4
 VEksJMCVhNm5Etic2RzIDePf8s4cjoTReycG1WycSJfKINPR4mT1oINBgGKXQ4sgtWvX1p70ORkzE
 ZVf6vuMenbeaplCsUScybdMuwHL06NMP+alz/e3R9RkJrPNoDsN7hoecRXJPRLjv2FdwpFHZ9iHwO
 OZ4fBd90lGZzmGvnreKv6kmD1hEmRGvjBWO3AqlehAKFfk6ENC7uZ9AOXXxaSrNG02qtg+eDzxWgn
 5lK0Yesg==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nYt04-0006lu-Qv; Mon, 28 Mar 2022 19:17:52 +0200
Date: Mon, 28 Mar 2022 16:17:38 -0100
From: Melissa Wen <mwen@igalia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/2] drm/amd/display: detach fpu operations from
 dcn10_validate_bandwidth in calcs
Message-ID: <20220328171738.iu5peqfcled2psv3@mail.igalia.com>
References: <20220326202448.2046077-1-mwen@igalia.com>
 <20220326202448.2046077-2-mwen@igalia.com>
 <1586f68e-c635-482f-9399-2b027b766543@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nck3fakny2nfpihg"
Content-Disposition: inline
In-Reply-To: <1586f68e-c635-482f-9399-2b027b766543@amd.com>
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
Cc: sunpeng.li@amd.com, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Jasdeep Dhillon <jdhillon@amd.com>,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nck3fakny2nfpihg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/28, Christian K=F6nig wrote:
> Am 26.03.22 um 21:24 schrieb Melissa Wen:
> > dcn10_validate_bandwidth is only used on dcn10 files, but is declared in
> > dcn_calcs files. Rename dcn10_* to dcn_* in calcs, remove DC_FP_* wrapp=
er
> > inside DML folder and create an specific dcn10_validate_bandwidth in
> > dcn10_resources that calls dcn_validate_bandwidth and properly wraps th=
at
> > FPU function with DC_FP_* macro.
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  | 14 ++++++++++++++
> >   .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |  5 +----
> >   drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |  2 +-
> >   3 files changed, 16 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/dr=
ivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> > index 4048908dd265..1587a060b55a 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> > @@ -1141,6 +1141,20 @@ static void dcn10_destroy_resource_pool(struct r=
esource_pool **pool)
> >   	*pool =3D NULL;
> >   }
> > +static bool dcn10_validate_bandwidth(
> > +		struct dc *dc,
> > +		struct dc_state *context,
> > +		bool fast_validate)
> > +{
> > +	bool voltage_supported;
> > +
> > +	DC_FP_START();
> > +	voltage_supported =3D dcn_validate_bandwidth(dc, context, fast_valida=
te);
> > +	DC_FP_END();
> > +
> > +	return voltage_supported;
> > +}
> > +
> >   static enum dc_status dcn10_validate_plane(const struct dc_plane_stat=
e *plane_state, struct dc_caps *caps)
> >   {
> >   	if (plane_state->format >=3D SURFACE_PIXEL_FORMAT_VIDEO_BEGIN
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c b/dri=
vers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> > index e447c74be713..c25023f7d604 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> > @@ -764,7 +764,7 @@ static unsigned int get_highest_allowed_voltage_lev=
el(uint32_t chip_family,
> >   	return 4;
> >   }
> > -bool dcn10_validate_bandwidth(
> > +bool dcn_validate_bandwidth(
> >   		struct dc *dc,
> >   		struct dc_state *context,
> >   		bool fast_validate)
> > @@ -790,7 +790,6 @@ bool dcn10_validate_bandwidth(
> >   		dcn_bw_sync_calcs_and_dml(dc);
> >   	memset(v, 0, sizeof(*v));
> > -	DC_FP_START();
> >   	v->sr_exit_time =3D dc->dcn_soc->sr_exit_time;
> >   	v->sr_enter_plus_exit_time =3D dc->dcn_soc->sr_enter_plus_exit_time;
> > @@ -1323,8 +1322,6 @@ bool dcn10_validate_bandwidth(
> >   	bw_limit =3D dc->dcn_soc->percent_disp_bw_limit * v->fabric_and_dram=
_bandwidth_vmax0p9;
> >   	bw_limit_pass =3D (v->total_data_read_bandwidth / 1000.0) < bw_limit;
> > -	DC_FP_END();
> > -
> >   	PERFORMANCE_TRACE_END();
> >   	BW_VAL_TRACE_FINISH();
> > diff --git a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h b/drivers/g=
pu/drm/amd/display/dc/inc/dcn_calcs.h
> > index 337c0161e72d..806f3041db14 100644
> > --- a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
> > +++ b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
> > @@ -619,7 +619,7 @@ struct dcn_ip_params {
> >   };
> >   extern const struct dcn_ip_params dcn10_ip_defaults;
> > -bool dcn10_validate_bandwidth(
> > +bool dcn_validate_bandwidth(
> >   		struct dc *dc,
> >   		struct dc_state *context,
> >   		bool fast_validate);
>=20
> Just for the record: That's not really usual kernel coding style, but tha=
t's
> not topic of this patch set.
Yeah. I didn't change the code style to ease any version conflict managemen=
t.
>=20
> The series is Acked-by: Christian K=F6nig <christian.koenig@amd.com>

Thanks!
>=20
> And it would be really nice if we could make the DC_FP_* macros somehow f=
ail
> in the dml folder.

And if we include a kind of dc_assert_fp_disabled() in the dc_fpu_begin()
(DC_FP_START) - more or less the reverse of dc_assert_fp_enabled(). Does
it meet the `make the DC_FP_* macros somehow fail in the dml folder` ?
It is not restricted to the dml folder, but I think it would work
similarly... Does it make sense?

Melissa

>=20
> Thanks,
> Christian.
>=20
>=20

--nck3fakny2nfpihg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJB7a4ACgkQwqF3j0dL
ehwrzA//QJ6AXYIDEi3GqSLj5lCIMmah8UIxpKgnr8qwFlwj7C/PjnJyOTGe0snd
dTwfd7G0rsmfcYkS/YtqKT+/9Vbfv596xSNOBVAZoQxJ2+ffNdG854aKEM1Mx512
OL3X5/3oOb0uc6Z3xjOa2vYRc0RssXdUwvU6DaKFsAx2tYLN5M62E/k6WP83B1wR
hphGK3wj81ihN6hmyucmhvQI88eHCyayrTWKyUlDCjMUJFr+7A5F0jbbg73fahVQ
o73TCuuThqRT+Irp42o3/HmPsvyjaPhH1wnkfjsZeXBiw0FB8GkZmAYGPx4A5rXK
8b3OlT9jIQ99cLojzWh5voRWKZsQ9Tu0/HFIqayseg70d4I24zt8Sn9XtZTOVCvl
aFPQc3RUhKPjgbgb/1BUX9NPd+uB6Db8UdpcTM5vA+tf2rzpFFgIqbLfmM82fhkp
wjUDaI8iN0NVIkMy/BZ/t6DQ6BfYJCly3d68BDfpcNnlWl8EAqjW5X3LcEwaqtZ0
F96jQ6MbqhX9I6Xvn0rMVQQuyWGW6/cJzgCqq0UsKXg7SKJmqP4dtK6mrgP5RvVk
gTU9FjmowMVGuFiGN/i1QPHN8eCc0FVmFjs4/uEWWWkCFbjxJLu1VJmiMBLhUpun
XfyfThUfwoj//5unmAqYryRL4V3KRdluzAti6iDjLAzi5q+I8+M=
=jExT
-----END PGP SIGNATURE-----

--nck3fakny2nfpihg--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36DE23D343
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 22:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29E06E047;
	Wed,  5 Aug 2020 20:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770041.outbound.protection.outlook.com [40.107.77.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE63899DC;
 Wed,  5 Aug 2020 20:49:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlh4bKHdgaNloWu74gDB0tM02cohXF3qZT3uO9bcZXa3myQYRth34PsanvJsQCFGL0Bl8NlqG20Ncfzo9CrlH3vkDjiZUwMSNCkRPJhYs1d5WTvvseUCou6Q7uh7z6ZgufF27ZMa3IoXr6foPkt4PgjIVRQ2npkrSXFBvJwTEF10oPVSZpfN8bvH9brF+nMkEOYK9i4ZDQpibs9gR7FTGCNstvMocPsXmqOydFI3uKETS3/Itn0XdKdEaiqlmgmDFGT9EO6GicsKBaIdMxtO1YfUbPNGGJMPTqBm0tSJnk3qfQ2ZiTdvD/Z8h2Gq+7MD0zzLQ0nVKblAbf/9zXyRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yu7LqCfU5DhsKKtv634t2Z9Mddlnf9OWkRouQN72Ozc=;
 b=i7DBf9mWi2rjOT23JcpjYFhkkJlzWpYY24J2l758P3ljJQv2j6KMeJN//qa9lBlxDCD4/q92JFRWV8Eeudd0Us6dm1quc4SoD12GbJSkg0rPbq3u0//6YLWvG4O2WeAYSR1dVyudszNo5L1v/LXB00FOKzpwLL+ZPDHp0KxVDEtJGnEa/WRufYp21N3zfFY5LqvnpjqkEYjHpoLc6h5NRE5PYQfJw+NYzRx7eMwIsyBYwQTLHVJR5CpzSmFiLJKdGoguvvsomJA5GDnvmGl3Z6Rqd8Bywlhsi++JTq68y0oNoXtvXvv0W6CT60egBwPOVpaXRbVq12B/S75x8OaSjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yu7LqCfU5DhsKKtv634t2Z9Mddlnf9OWkRouQN72Ozc=;
 b=m3ABn6mPIacaymTWtUdFOIR3dmAXoiDVd2T86aeiLUtDITbmxkSvDZbjsh48DvQJhS5UNExDSbSGJHxurTkbi9DSfyevkPK5t95uRhykHHYWsMpROGONdtyXWr/3HYwNFLnvbpyC3qRVxOtS5X9GgtDqFkiWhh27PObt8VZXGKg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM5PR12MB1356.namprd12.prod.outlook.com (2603:10b6:3:74::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Wed, 5 Aug
 2020 20:49:01 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7%9]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 20:49:01 +0000
Date: Wed, 5 Aug 2020 16:48:58 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH 6/7] drm/amd/display: Drop
 dm_determine_update_type_for_commit
Message-ID: <20200805204858.lx4slf6m2glrroa3@outlook.office365.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-7-nicholas.kazlauskas@amd.com>
In-Reply-To: <20200730203642.17553-7-nicholas.kazlauskas@amd.com>
X-ClientProxiedBy: YT1PR01CA0099.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::8) To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60::80d1) by
 YT1PR01CA0099.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Wed, 5 Aug 2020 20:49:00 +0000
X-Originating-IP: [2607:fea8:56e0:6d60::80d1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b08bbd1d-2753-41df-7475-08d83980fb95
X-MS-TrafficTypeDiagnostic: DM5PR12MB1356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1356B300C16D10025336EAB6984B0@DM5PR12MB1356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +vnrxlybSGOfTrtB34wjh66Ng7wl9zrcfWXFP9DgXRydP4w+h4UDzvZ48YUSBxAa28GBLLE5WKOtpsZBHE5OCyB+p9tsTS7atjizCINy8rV3jmJ8K1gB19WaCDe0KXhaMZX6R+40BSbXM2QlZTbmdEaJzyIWnwBa7RpfK2s0lzUeP4VV4hoI5YWCEM3Vlp1j36ejl0tHebqxapZOqQyqmCqLTgL7rpOeh1xMCCAByyseOopOyL/YGQNezNPf+ZeGDXSZUmt5ipNVCKt9FhwtPs41RLx4IhXnChaMEptpmVCjGRgTQgyNPqV9003+Q2jFmYdOk5g3zwvDeYouierohjTnxak9y11CIkjG7/o4KGy263bAQxmZy/IgYd1S90bjKv0RzqeN/aWU4V+T9s/X1/xhHjb/r4o5/mmXZALTbgCZdimL1g+XNQIIgts8PI2FYeSw0xhvKJMeLDEWpK7XpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(7696005)(8936002)(8676002)(4326008)(450100002)(52116002)(6636002)(2906002)(30864003)(5660300002)(1076003)(44144004)(6506007)(6862004)(86362001)(9686003)(16526019)(55016002)(54906003)(186003)(21480400003)(45080400002)(966005)(66476007)(66556008)(66946007)(316002)(83380400001)(478600001)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: xBg6ilFzS936LFgSkZNG1WlhIlqgC6KKQ8rDBsokEF4aOi7Aa3k0c4nifs9l3KKl/2IVxi0yPvBB7J8L3A1YQ7KD2Tfk/4KNQowPzfROMYxo8tSmCZKBcpG4HfTmokKL/8vSW6Z79mtZ3NzdK7IntPX7wmu0MdDYlWpYRA3DJOi5mzUdy5h8BwB6B3oBnGSyu6twJTyCz09/q9ahV3jvNWD6V22BxaxxAEdkWTmytWloTph3vdhFEVsBR9lSsEXjQyealJXbdPfPLIVKK0CxFV95yNmou8HqKThvVGjXPKst6POvC9Txfe1myR0FTJSFrlS19jbF2wQIpoYt9UU1AJbtX6o9UaKf8MDkGlHDZ8UejAyDAzH2HUVIvnGr2rJL4Wx9ZgO2jgR62Xzktj+MlWCk0K5RH8MTxi12KeNuVHWbvJl1Wfts4CPccQhyW/YSCXAUm+YP6V89P0m+6/9T6Xsm9ZasEwth+EiWbhvci+YjLuHxm0df+kRDpPH5ezo1hGBORSX5axpEh7nawN1POryFKYKiCZ3QqNYns4jVoOT20dCxHJgMC07EOS5d2TWp9pBm4y1Yqt87NtXFRxlAaUPm8ch+IgfNP9X0WVMHqNHCSvT3a+r6SdkC9idnv3rYzqQFBpv6pDUG0CVkS8VVsvNKccCsG5Ez4rfACH9jrFGfUvsUBwhM+iZExauJmsVM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08bbd1d-2753-41df-7475-08d83980fb95
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 20:49:01.3762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kaSOx95sdD32Vc89Jeoadm0ZjrXKZa2CI1CIClKKkb1TXVd7wbyef6UJYgo19U/8c1I1uGKuRdlqGtKJDJiIxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1356
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1125664938=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1125664938==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="acsuqwaqbgakrtjd"
Content-Disposition: inline

--acsuqwaqbgakrtjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 07/30, Nicholas Kazlauskas wrote:
> [Why]
> This was added in the past to solve the issue of not knowing when
> to stall for medium and full updates in DM.
>=20
> Since DC is ultimately decides what requires bandwidth changes we
> wanted to make use of it directly to determine this.
>=20
> The problem is that we can't actually pass any of the stream or surface
> updates into DC global validation, so we don't actually check if the new
> configuration is valid - we just validate the old existing config
> instead and stall for outstanding commits to finish.
>=20
> There's also the problem of grabbing the DRM private object for
> pageflips which can lead to page faults in the case where commits
> execute out of order and free a DRM private object state that was
> still required for commit tail.
>=20
> [How]
> Now that we reset the plane in DM with the same conditions DC checks
> we can have planes go through DC validation and we know when we need
> to check and stall based on whether the stream or planes changed.
>=20
> We mark lock_and_validation_needed whenever we've done this, so just
> go back to using that instead of dm_determine_update_type_for_commit.
>=20
> Since we'll skip resetting the plane for a pageflip we will no longer
> grab the DRM private object for pageflips as well, avoiding the
> page fault issued caused by pageflipping under load with commits
> executing out of order.
>=20
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 199 ++----------------
>  1 file changed, 17 insertions(+), 182 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 2cbb29199e61..59829ec81694 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8542,161 +8542,6 @@ static int dm_update_plane_state(struct dc *dc,
>  	return ret;
>  }
> =20
> -static int
> -dm_determine_update_type_for_commit(struct amdgpu_display_manager *dm,
> -				    struct drm_atomic_state *state,
> -				    enum surface_update_type *out_type)
> -{
> -	struct dc *dc =3D dm->dc;
> -	struct dm_atomic_state *dm_state =3D NULL, *old_dm_state =3D NULL;
> -	int i, j, num_plane, ret =3D 0;
> -	struct drm_plane_state *old_plane_state, *new_plane_state;
> -	struct dm_plane_state *new_dm_plane_state, *old_dm_plane_state;
> -	struct drm_crtc *new_plane_crtc;
> -	struct drm_plane *plane;
> -
> -	struct drm_crtc *crtc;
> -	struct drm_crtc_state *new_crtc_state, *old_crtc_state;
> -	struct dm_crtc_state *new_dm_crtc_state, *old_dm_crtc_state;
> -	struct dc_stream_status *status =3D NULL;
> -	enum surface_update_type update_type =3D UPDATE_TYPE_FAST;
> -	struct surface_info_bundle {
> -		struct dc_surface_update surface_updates[MAX_SURFACES];
> -		struct dc_plane_info plane_infos[MAX_SURFACES];
> -		struct dc_scaling_info scaling_infos[MAX_SURFACES];
> -		struct dc_flip_addrs flip_addrs[MAX_SURFACES];
> -		struct dc_stream_update stream_update;
> -	} *bundle;
> -
> -	bundle =3D kzalloc(sizeof(*bundle), GFP_KERNEL);
> -
> -	if (!bundle) {
> -		DRM_ERROR("Failed to allocate update bundle\n");
> -		/* Set type to FULL to avoid crashing in DC*/
> -		update_type =3D UPDATE_TYPE_FULL;
> -		goto cleanup;
> -	}
> -
> -	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_sta=
te, i) {
> -
> -		memset(bundle, 0, sizeof(struct surface_info_bundle));
> -
> -		new_dm_crtc_state =3D to_dm_crtc_state(new_crtc_state);
> -		old_dm_crtc_state =3D to_dm_crtc_state(old_crtc_state);
> -		num_plane =3D 0;
> -
> -		if (new_dm_crtc_state->stream !=3D old_dm_crtc_state->stream) {
> -			update_type =3D UPDATE_TYPE_FULL;
> -			goto cleanup;
> -		}
> -
> -		if (!new_dm_crtc_state->stream)
> -			continue;
> -
> -		for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plan=
e_state, j) {
> -			struct dc_plane_info *plane_info =3D &bundle->plane_infos[num_plane];
> -			struct dc_flip_addrs *flip_addr =3D &bundle->flip_addrs[num_plane];
> -			struct dc_scaling_info *scaling_info =3D &bundle->scaling_infos[num_p=
lane];
> -
> -			new_plane_crtc =3D new_plane_state->crtc;
> -			new_dm_plane_state =3D to_dm_plane_state(new_plane_state);
> -			old_dm_plane_state =3D to_dm_plane_state(old_plane_state);
> -
> -			if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> -				continue;
> -
> -			if (new_dm_plane_state->dc_state !=3D old_dm_plane_state->dc_state) {
> -				update_type =3D UPDATE_TYPE_FULL;
> -				goto cleanup;
> -			}
> -
> -			if (crtc !=3D new_plane_crtc)
> -				continue;
> -
> -			bundle->surface_updates[num_plane].surface =3D
> -					new_dm_plane_state->dc_state;
> -
> -			if (new_crtc_state->mode_changed) {
> -				bundle->stream_update.dst =3D new_dm_crtc_state->stream->dst;
> -				bundle->stream_update.src =3D new_dm_crtc_state->stream->src;
> -			}
> -
> -			if (new_crtc_state->color_mgmt_changed) {
> -				bundle->surface_updates[num_plane].gamma =3D
> -						new_dm_plane_state->dc_state->gamma_correction;
> -				bundle->surface_updates[num_plane].in_transfer_func =3D
> -						new_dm_plane_state->dc_state->in_transfer_func;
> -				bundle->surface_updates[num_plane].gamut_remap_matrix =3D
> -						&new_dm_plane_state->dc_state->gamut_remap_matrix;
> -				bundle->stream_update.gamut_remap =3D
> -						&new_dm_crtc_state->stream->gamut_remap_matrix;
> -				bundle->stream_update.output_csc_transform =3D
> -						&new_dm_crtc_state->stream->csc_color_matrix;
> -				bundle->stream_update.out_transfer_func =3D
> -						new_dm_crtc_state->stream->out_transfer_func;
> -			}
> -
> -			ret =3D fill_dc_scaling_info(new_plane_state,
> -						   scaling_info);
> -			if (ret)
> -				goto cleanup;
> -
> -			bundle->surface_updates[num_plane].scaling_info =3D scaling_info;
> -
> -			if (new_plane_state->fb) {
> -				ret =3D fill_dc_plane_info_and_addr(
> -					dm->adev, new_plane_state,
> -					new_dm_plane_state->tiling_flags,
> -					plane_info, &flip_addr->address,
> -					new_dm_plane_state->tmz_surface, false);
> -				if (ret)
> -					goto cleanup;
> -
> -				bundle->surface_updates[num_plane].plane_info =3D plane_info;
> -				bundle->surface_updates[num_plane].flip_addr =3D flip_addr;
> -			}
> -
> -			num_plane++;
> -		}
> -
> -		if (num_plane =3D=3D 0)
> -			continue;
> -
> -		ret =3D dm_atomic_get_state(state, &dm_state);
> -		if (ret)
> -			goto cleanup;
> -
> -		old_dm_state =3D dm_atomic_get_old_state(state);
> -		if (!old_dm_state) {
> -			ret =3D -EINVAL;
> -			goto cleanup;
> -		}
> -
> -		status =3D dc_stream_get_status_from_state(old_dm_state->context,
> -							 new_dm_crtc_state->stream);
> -		bundle->stream_update.stream =3D new_dm_crtc_state->stream;
> -		/*
> -		 * TODO: DC modifies the surface during this call so we need
> -		 * to lock here - find a way to do this without locking.
> -		 */
> -		mutex_lock(&dm->dc_lock);
> -		update_type =3D dc_check_update_surfaces_for_stream(
> -				dc,	bundle->surface_updates, num_plane,
> -				&bundle->stream_update, status);
> -		mutex_unlock(&dm->dc_lock);
> -
> -		if (update_type > UPDATE_TYPE_MED) {
> -			update_type =3D UPDATE_TYPE_FULL;
> -			goto cleanup;
> -		}
> -	}
> -
> -cleanup:
> -	kfree(bundle);
> -
> -	*out_type =3D update_type;
> -	return ret;
> -}
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
>  static int add_affected_mst_dsc_crtcs(struct drm_atomic_state *state, st=
ruct drm_crtc *crtc)
>  {
> @@ -8737,8 +8582,7 @@ static int add_affected_mst_dsc_crtcs(struct drm_at=
omic_state *state, struct drm
>   * acquired. For full updates case which removes/adds/updates streams on=
 one
>   * CRTC while flipping on another CRTC, acquiring global lock will guara=
ntee
>   * that any such full update commit will wait for completion of any outs=
tanding
> - * flip using DRMs synchronization events. See
> - * dm_determine_update_type_for_commit()
> + * flip using DRMs synchronization events.
>   *
>   * Note that DM adds the affected connectors for all CRTCs in state, whe=
n that
>   * might not seem necessary. This is because DC stream creation requires=
 the
> @@ -8759,15 +8603,8 @@ static int amdgpu_dm_atomic_check(struct drm_devic=
e *dev,
>  	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>  	struct drm_plane *plane;
>  	struct drm_plane_state *old_plane_state, *new_plane_state;
> -	enum surface_update_type update_type =3D UPDATE_TYPE_FAST;
> -	enum surface_update_type overall_update_type =3D UPDATE_TYPE_FAST;
>  	enum dc_status status;
>  	int ret, i;
> -
> -	/*
> -	 * This bool will be set for true for any modeset/reset
> -	 * or plane update which implies non fast surface update.
> -	 */
>  	bool lock_and_validation_needed =3D false;
> =20
>  	ret =3D drm_atomic_helper_check_modeset(dev, state);
> @@ -8961,27 +8798,23 @@ static int amdgpu_dm_atomic_check(struct drm_devi=
ce *dev,
>  		if (!is_scaling_state_different(dm_new_con_state, dm_old_con_state))
>  			continue;
> =20
> -		overall_update_type =3D UPDATE_TYPE_FULL;
>  		lock_and_validation_needed =3D true;
>  	}
> =20
> -	ret =3D dm_determine_update_type_for_commit(&adev->dm, state, &update_t=
ype);
> -	if (ret)
> -		goto fail;
> -
> -	if (overall_update_type < update_type)
> -		overall_update_type =3D update_type;
> -
> -	/*
> -	 * lock_and_validation_needed was an old way to determine if we need to=
 set
> -	 * the global lock. Leaving it in to check if we broke any corner cases
> -	 * lock_and_validation_needed true =3D UPDATE_TYPE_FULL or UPDATE_TYPE_=
MED
> -	 * lock_and_validation_needed false =3D UPDATE_TYPE_FAST
> +	/**
> +	 * Streams and planes are reset when there are changes that affect
> +	 * bandwidth. Anything that affects bandwidth needs to go through
> +	 * DC global validation to ensure that the configuration can be applied
> +	 * to hardware.
> +	 *
> +	 * We have to currently stall out here in atomic_check for outstanding
> +	 * commits to finish in this case because our IRQ handlers reference
> +	 * DRM state directly - we can end up disabling interrupts too early
> +	 * if we don't.
> +	 *
> +	 * TODO: Remove this stall and drop DM state private objects.
>  	 */
> -	if (lock_and_validation_needed && overall_update_type <=3D UPDATE_TYPE_=
FAST)
> -		WARN(1, "Global lock should be Set, overall_update_type should be UPDA=
TE_TYPE_MED or UPDATE_TYPE_FULL");
> -
> -	if (overall_update_type > UPDATE_TYPE_FAST) {
> +	if (lock_and_validation_needed) {
>  		ret =3D dm_atomic_get_state(state, &dm_state);
>  		if (ret)
>  			goto fail;
> @@ -9063,7 +8896,9 @@ static int amdgpu_dm_atomic_check(struct drm_device=
 *dev,
>  		struct dm_crtc_state *dm_new_crtc_state =3D
>  			to_dm_crtc_state(new_crtc_state);
> =20
> -		dm_new_crtc_state->update_type =3D (int)overall_update_type;
> +		dm_new_crtc_state->update_type =3D lock_and_validation_needed ?
> +							 UPDATE_TYPE_FULL :
> +							 UPDATE_TYPE_FAST;
>  	}
> =20
>  	/* Must be success */
> --=20
> 2.25.1
>=20
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
=2Efreedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01%7CRodr=
igo.Siqueira%40amd.com%7C0b11d89281b84b13c2ba08d834c866ba%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637317382661579264&amp;sdata=3D0%2BiC8Fx2pHp5cC=
o2p5TovGSRrrbnYH867lad%2B5ZeXqM%3D&amp;reserved=3D0

--=20
Rodrigo Siqueira
https://siqueira.tech

--acsuqwaqbgakrtjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl8rGzoACgkQWJzP/com
vP+rVA/9GhZ4TvJAQFXgNCvtzJNbGCM6/IkG5YrxB20sWC6/JlVCdDTqVVtCJ538
Zp373TpqZg89FQm0vWGfJqylfDlrdOkWnKLdL1f4E2wh1Z63KFzGJEcelQMdumDo
jejJrN2U1fozMXvlenxaEBHuhiQ1Kn5vfpdq60QKnVaaUPittm346PehmbEU+XTc
hkvA8anQFWyJeF9Y0TJV9S3gJb5vDhAnArsfT2T/yf0O3xJ2tO06MjAWIDW8qCJv
Ol/WMVjvsix4ze+GKw8lcBoMrI4Ewc+pXn0G0XUPAnQlPPEDBrO5W57kDajljaU6
UmbrL9cVxWSY37OoSf0HACLsYQ6lUdJJD00r6uBtFrV7VbgNtBknSBEGDWVXfNKG
dGRA2o2z0DOH9hddTC0xrUYH9MpBSRS4+bskwTNlXvMGrwspXcWxbIysbTDl3b0g
NrjlACjfAJD4kNmq8Csj7fmoEI9y6Ax6O14npI5iuyXMWtmcoRBAffS1EYzuppnE
YJcQGm3V/nyimJfmYQGzSjkhNWPML2dnQqGUqJoHitbdo+CDw0OGex0B4v+h2wOD
Chvz1Df9MVjPoICna7y+whEwyhFsFwEzjmXiaEYTnAsIkSrYec3kHNbloM04B63q
+lNpCKIG7rMpXKDAuOK0sz9J59FZnUoonAGfdWL8tKXIKCd8ul4=
=iFZC
-----END PGP SIGNATURE-----

--acsuqwaqbgakrtjd--

--===============1125664938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1125664938==--

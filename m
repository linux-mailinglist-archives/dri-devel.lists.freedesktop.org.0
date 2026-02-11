Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD/sATCNjGn5qwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 15:07:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434841250FC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 15:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7801610E5C0;
	Wed, 11 Feb 2026 14:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="CyZ8c7wQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B395510E5C0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 14:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1770818858;
 bh=Ove3152/rOAawcpxeWCOveBkHcNtgUY9GmlkSgVIbr8=;
 b=CyZ8c7wQg1fTUD/p3Znz960QmSi9ZYDC9uGmzQB582nkwESmsVZRF+vsgmhppS6jzF5sDa97Q
 p1mRT/nn9uBaUvRfgObfjBWW4mLgK7/giP13QH86DCK3aDukwnUArDwUnzWDiZ26jSZJyebt2cV
 njeuk5YEpFLzzN6Uj6KOpDoJBvmAxI3Aj8vNVHuQgkktvOqNVHOM+4mLQHKvvx2y86okOgjEE14
 JMcn7feBYGCqEINcfn7Hd5329P7/xQaJUULeN/XBp5Vu/OKVYBS3l9ERod0eZteH45UD4AbupTY
 7e8kR8OulRUZ1vbXxq9MYyfGXDhsfTUbDGYmupqB67VQ==
X-Forward-Email-ID: 698c8d282138e558edd7a81c
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Wed, 11 Feb 2026 09:07:32 -0500
Message-Id: <DGC6W6ISK6DK.2B9VCFCGAJ2TH@ubuntu.com>
Subject: Re: [PATCH] amdgpu_connector: use struct drm_edid instead of struct
 edid
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Joshua Peisach" <jpeisach@ubuntu.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>
X-Mailer: aerc 0.21.0
References: <20260207200550.42315-1-jpeisach@ubuntu.com>
In-Reply-To: <20260207200550.42315-1-jpeisach@ubuntu.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jpeisach@ubuntu.com,m:amd-gfx@lists.freedesktop.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:mid,ubuntu.com:dkim,ubuntu.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 434841250FC
X-Rspamd-Action: no action

On Sat Feb 7, 2026 at 3:04 PM EST, Joshua Peisach wrote:
> Some amdgpu code is still using deprecated edid functions. Switch to
> the newer functions and update the amdgpu_connector struct's edid type
> to the drm_edid type.
>
> At the same time, use the raw EDID when we need to for speaker
> allocations and for determining if the input is digital.
>
> Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>

I think this patch actually has the wrong naming convention: should I
resubmit and say drm/amdgpu/connectors to be more clear?

> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 32 +++++++++----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  4 +--
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  4 +--
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  4 +--
>  5 files changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_connectors.c
> index d3e312bda..ab83b3a87 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -246,10 +246,10 @@ amdgpu_connector_find_encoder(struct drm_connector =
*connector,
>  	return NULL;
>  }
> =20
> -static struct edid *
> +static const struct drm_edid *
>  amdgpu_connector_get_hardcoded_edid(struct amdgpu_device *adev)
>  {
> -	return drm_edid_duplicate(drm_edid_raw(adev->mode_info.bios_hardcoded_e=
did));
> +	return drm_edid_dup(adev->mode_info.bios_hardcoded_edid);
>  }
> =20
>  static void amdgpu_connector_get_edid(struct drm_connector *connector)
> @@ -268,8 +268,8 @@ static void amdgpu_connector_get_edid(struct drm_conn=
ector *connector)
>  	if ((amdgpu_connector_encoder_get_dp_bridge_encoder_id(connector) !=3D
>  	     ENCODER_OBJECT_ID_NONE) &&
>  	    amdgpu_connector->ddc_bus->has_aux) {
> -		amdgpu_connector->edid =3D drm_get_edid(connector,
> -						      &amdgpu_connector->ddc_bus->aux.ddc);
> +		amdgpu_connector->edid =3D drm_edid_read_ddc(connector,
> +							  &amdgpu_connector->ddc_bus->aux.ddc);
>  	} else if ((connector->connector_type =3D=3D DRM_MODE_CONNECTOR_Display=
Port) ||
>  		   (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)) {
>  		struct amdgpu_connector_atom_dig *dig =3D amdgpu_connector->con_priv;
> @@ -277,14 +277,14 @@ static void amdgpu_connector_get_edid(struct drm_co=
nnector *connector)
>  		if ((dig->dp_sink_type =3D=3D CONNECTOR_OBJECT_ID_DISPLAYPORT ||
>  		     dig->dp_sink_type =3D=3D CONNECTOR_OBJECT_ID_eDP) &&
>  		    amdgpu_connector->ddc_bus->has_aux)
> -			amdgpu_connector->edid =3D drm_get_edid(connector,
> -							      &amdgpu_connector->ddc_bus->aux.ddc);
> +			amdgpu_connector->edid =3D drm_edid_read_ddc(connector,
> +								  &amdgpu_connector->ddc_bus->aux.ddc);
>  		else if (amdgpu_connector->ddc_bus)
> -			amdgpu_connector->edid =3D drm_get_edid(connector,
> -							      &amdgpu_connector->ddc_bus->adapter);
> +			amdgpu_connector->edid =3D drm_edid_read_ddc(connector,
> +								  &amdgpu_connector->ddc_bus->adapter);
>  	} else if (amdgpu_connector->ddc_bus) {
> -		amdgpu_connector->edid =3D drm_get_edid(connector,
> -						      &amdgpu_connector->ddc_bus->adapter);
> +		amdgpu_connector->edid =3D drm_edid_read_ddc(connector,
> +							  &amdgpu_connector->ddc_bus->adapter);
>  	}
> =20
>  	if (!amdgpu_connector->edid) {
> @@ -292,7 +292,7 @@ static void amdgpu_connector_get_edid(struct drm_conn=
ector *connector)
>  		if (((connector->connector_type =3D=3D DRM_MODE_CONNECTOR_LVDS) ||
>  		     (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP))) {
>  			amdgpu_connector->edid =3D amdgpu_connector_get_hardcoded_edid(adev);
> -			drm_connector_update_edid_property(connector, amdgpu_connector->edid)=
;
> +			drm_edid_connector_update(connector, amdgpu_connector->edid);
>  		}
>  	}
>  }
> @@ -311,11 +311,11 @@ static int amdgpu_connector_ddc_get_modes(struct dr=
m_connector *connector)
>  	int ret;
> =20
>  	if (amdgpu_connector->edid) {
> -		drm_connector_update_edid_property(connector, amdgpu_connector->edid);
> -		ret =3D drm_add_edid_modes(connector, amdgpu_connector->edid);
> +		drm_edid_connector_update(connector, amdgpu_connector->edid);
> +		ret =3D drm_edid_connector_add_modes(connector);
>  		return ret;
>  	}
> -	drm_connector_update_edid_property(connector, NULL);
> +	drm_edid_connector_update(connector, NULL);
>  	return 0;
>  }
> =20
> @@ -883,7 +883,7 @@ amdgpu_connector_vga_detect(struct drm_connector *con=
nector, bool force)
>  			ret =3D connector_status_connected;
>  		} else {
>  			amdgpu_connector->use_digital =3D
> -				!!(amdgpu_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
> +				drm_edid_is_digital(amdgpu_connector->edid);
> =20
>  			/* some oems have boards with separate digital and analog connectors
>  			 * with a shared ddc line (often vga + hdmi)
> @@ -1063,7 +1063,7 @@ amdgpu_connector_dvi_detect(struct drm_connector *c=
onnector, bool force)
>  			broken_edid =3D true; /* defer use_digital to later */
>  		} else {
>  			amdgpu_connector->use_digital =3D
> -				!!(amdgpu_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
> +				drm_edid_is_digital(amdgpu_connector->edid);
> =20
>  			/* some oems have boards with separate digital and analog connectors
>  			 * with a shared ddc line (often vga + hdmi)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_mode.h
> index dc8d2f52c..c4e025581 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -624,7 +624,7 @@ struct amdgpu_connector {
>  	bool use_digital;
>  	/* we need to mind the EDID between detect
>  	   and get modes due to analog/digital/tvencoder */
> -	struct edid *edid;
> +	const struct drm_edid *edid;
>  	void *con_priv;
>  	bool dac_load_detect;
>  	bool detected_by_load; /* if the connection status was determined by lo=
ad */
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/dce_v10_0.c
> index 61302204e..3346494c3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -1298,7 +1298,7 @@ static void dce_v10_0_audio_write_speaker_allocatio=
n(struct drm_encoder *encoder
>  		return;
>  	}
> =20
> -	sad_count =3D drm_edid_to_speaker_allocation(amdgpu_connector->edid, &s=
adb);
> +	sad_count =3D drm_edid_to_speaker_allocation(drm_edid_raw(amdgpu_connec=
tor->edid), &sadb);
>  	if (sad_count < 0) {
>  		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_cou=
nt);
>  		sad_count =3D 0;
> @@ -1368,7 +1368,7 @@ static void dce_v10_0_audio_write_sad_regs(struct d=
rm_encoder *encoder)
>  		return;
>  	}
> =20
> -	sad_count =3D drm_edid_to_sad(amdgpu_connector->edid, &sads);
> +	sad_count =3D drm_edid_to_sad(drm_edid_raw(amdgpu_connector->edid), &sa=
ds);
>  	if (sad_count < 0)
>  		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
>  	if (sad_count <=3D 0)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v6_0.c
> index 8f4b4c2e3..508cfe6a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -1265,7 +1265,7 @@ static void dce_v6_0_audio_write_speaker_allocation=
(struct drm_encoder *encoder)
>  		return;
>  	}
> =20
> -	sad_count =3D drm_edid_to_speaker_allocation(amdgpu_connector->edid, &s=
adb);
> +	sad_count =3D drm_edid_to_speaker_allocation(drm_edid_raw(amdgpu_connec=
tor->edid), &sadb);
>  	if (sad_count < 0) {
>  		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_cou=
nt);
>  		sad_count =3D 0;
> @@ -1346,7 +1346,7 @@ static void dce_v6_0_audio_write_sad_regs(struct dr=
m_encoder *encoder)
>  		return;
>  	}
> =20
> -	sad_count =3D drm_edid_to_sad(amdgpu_connector->edid, &sads);
> +	sad_count =3D drm_edid_to_sad(drm_edid_raw(amdgpu_connector->edid), &sa=
ds);
>  	if (sad_count < 0)
>  		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
>  	if (sad_count <=3D 0)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v8_0.c
> index 9d1853c41..3a6a22926 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -1271,7 +1271,7 @@ static void dce_v8_0_audio_write_speaker_allocation=
(struct drm_encoder *encoder)
>  		return;
>  	}
> =20
> -	sad_count =3D drm_edid_to_speaker_allocation(amdgpu_connector->edid, &s=
adb);
> +	sad_count =3D drm_edid_to_speaker_allocation(drm_edid_raw(amdgpu_connec=
tor->edid), &sadb);
>  	if (sad_count < 0) {
>  		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_cou=
nt);
>  		sad_count =3D 0;
> @@ -1339,7 +1339,7 @@ static void dce_v8_0_audio_write_sad_regs(struct dr=
m_encoder *encoder)
>  		return;
>  	}
> =20
> -	sad_count =3D drm_edid_to_sad(amdgpu_connector->edid, &sads);
> +	sad_count =3D drm_edid_to_sad(drm_edid_raw(amdgpu_connector->edid), &sa=
ds);
>  	if (sad_count < 0)
>  		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
>  	if (sad_count <=3D 0)


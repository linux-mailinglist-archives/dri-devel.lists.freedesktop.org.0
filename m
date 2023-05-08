Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5903B6FA39F
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 11:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A18C10E1CF;
	Mon,  8 May 2023 09:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10ED910E1CC;
 Mon,  8 May 2023 09:48:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gnk2Gh2zVBHpqKa02qIDVuCsYqijzIsDsYko/S+8TsEZBH28FaPzGta3hVSFJEgbZ5RYMDFEzuqLa0BoryIjU7BIlaYTnlbtC8jMHfIYzPRufOscT8//vtsBC6TJenb67z1a0RzkEMT8V8SFsq1RJikFLwkfrKqVqxRNpAGDvaaqQO49fSQO2fWaoM20iiB2M2/NRubxGizWlrJIAvKL645YOO43Jqi2thXXHlmiWlZJrNPZAna4Ep1di8YkINKMDGtI79SjqfJSqPe2izuiLvsw88fCRCaXc7hs7LLtgb2xwnXjEt/ETP/Lw3UZrv9dSiXKCPG9IK2yWqmZczEE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lc/0zy+FSqQI3daOAv4yOK7705Yt4kUSZb3YIMuxDEk=;
 b=bbNZKT/CvUm2AHFwoJZbdM5BOXFIQHeMau0WMD4rSgL6wkjPcqy/p11MfAxOo33eYoGb1WOhnouBsaAJzTEHWJdE+b/T38H16SBS+I7Wv3NT3vgbqZQpcfrHcyFjRkucxrT4tIu5LknyDR2M6SGR8FykQS9ATBhTG9kYYxnbVVYS4oSIJv9cUGbNLux5ZXiTafISsvm+Alp48KFbDXlxvYaLNRDtSklgTOvot5lXRL+shH8ZTA8W6RxArrTUIYOzXGjrD1xwG9AJAymXoJ0Kzd9dUzHkNulEi+a2xocbvozDFgpcVluE4zlum4fU0wgG36B5p5xwqP7iFacmMMIOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc/0zy+FSqQI3daOAv4yOK7705Yt4kUSZb3YIMuxDEk=;
 b=kmD98vA+T56i08Z4i6Pm+s0ZwodGgUVfbYpWXNcmcj7S1d0fK1m7EfL9/ICCBZrxA1Anyp2i54uDlkaDmUMZv5F4NBicYoPI3aWQ8bF+94j4gexKm1fgLW5ZCVeHnxxVhlgUuuUonnKHBK6OKtyko8DlUavtqzh6svZIqbosnUI=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by IA0PR12MB8352.namprd12.prod.outlook.com (2603:10b6:208:3dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Mon, 8 May
 2023 09:48:33 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::131c:69fe:91d8:db7d]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::131c:69fe:91d8:db7d%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 09:48:33 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "lyude@redhat.com" <lyude@redhat.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
Thread-Topic: [PATCH v2] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
Thread-Index: AQHZeNn8+E0QEEuY3UCLaVyy+/niaq9QMZbA
Date: Mon, 8 May 2023 09:48:33 +0000
Message-ID: <CO6PR12MB5489A03BAAE9F84E39352767FC719@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20230427072850.100887-1-Wayne.Lin@amd.com>
In-Reply-To: <20230427072850.100887-1-Wayne.Lin@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-05-08T09:47:43Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=b5dca29a-2972-4890-bed2-a4ad7e215fe7;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|IA0PR12MB8352:EE_
x-ms-office365-filtering-correlation-id: ba3f28ae-2e42-4797-0d5e-08db4fa96313
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rJKMrwOMwNy/3PHTtU638bxLNfQ3mGT1ZqZnyt1BzAEHzMVKSTuiOupJM6CamQknXHG6qjve/y3b94CQ4GZieNE1PduDzjteUhvryL/Kkr4wrKFvHkTomfRYoWSWgPGvZLr98+u/F7YIg8Qh5HZPzgkGB2FhVwKhheU4xtwOgd2OBOyIcAORSloQRIieAwx5kfNxu9H5ZYasyULQE/2ooqme1szWtpGmHEc03fdPks13lo8HAOqxYQC8qBa067gE4eDwIU5XIFceiBTztk72ZuCnlyc9M67ai1U4VaPw0QER1tsr6FSWTZLdTMVD7ioNcA5YdrgY+iFwuSvGOQ3fmYzrgEfCJ4QJpZueM9mjY9wTgmdFrDheYg1tYLALFe5ZxVXlZjKqwWHrKeLTZH9iIzQimhs04HmDZvEXH+tv8ET16vuw7vAaVJ+MV/faw4OmMZ/Rq11H0D7x96/HBmOImH8LHfEXtgXVbP0AQRenNK3zrOdwghLnpE79t8M2EjQDne7panvXC2mUUWKzmItDB+1tVdsvoewxbaX9NJBOSvGv1Q94eWY/wPGYXytJTmdkQg614mFrrJZs34vYahBqlE+kl7E+V0vRhmIAkE8XOrDF79bN+1Tth5hA8b+IU9A2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199021)(122000001)(86362001)(186003)(55236004)(53546011)(9686003)(26005)(6506007)(15650500001)(38070700005)(38100700002)(83380400001)(71200400001)(33656002)(54906003)(110136005)(66946007)(478600001)(66556008)(66446008)(66476007)(7696005)(64756008)(4326008)(8676002)(8936002)(316002)(52536014)(55016003)(41300700001)(5660300002)(76116006)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7OpuEZMvPNEPjFrRPfduWxyGeNYusYPDVhZTeZ3Wm3BKEOVGw/2gBmML7Nnl?=
 =?us-ascii?Q?2i6LX530MR5zPGC/e9TPn7qbcmwe122sDV5XKF+4BkZ2yFqnUJx+eS4DkYYa?=
 =?us-ascii?Q?OyW5lw+t/ZdXtlLOZrBaC8atxlILxpegU6CdLwktcKaoCsz+C7NtlWUwRvSQ?=
 =?us-ascii?Q?9TtistyVUKgFgdkEg/XJjnljZCDEHjBKUat/RO5PtCM0nt/NE6Iwfq7WQLtg?=
 =?us-ascii?Q?M//7DakzJVG+E4j//kN3RN2HaMMkn/T2+L+BawTJK3K00W3T759LytOFv+cg?=
 =?us-ascii?Q?mo7NIvciXfFPry5iE7B5HO0RpeCdMckHEBwt2aHvgj6rzstjM0B5sR3cgVR0?=
 =?us-ascii?Q?Q61Lgoa6UD7Cm7fP9yAksPwOdKPQR8Y67l8W/HMim4k+XVzhwFFmK1Ra2KMQ?=
 =?us-ascii?Q?SP4yqU/5JAEcVkytZ0f73RMUIDjWitT/rgDKSMfAolCAvyQ8BYNEtZ31GxNj?=
 =?us-ascii?Q?6ljkd5Wgzc5mnCjgyWrml4LvO5Cj/KmxqqtJTgrIxQGNfMkdVaYcd8ay7nci?=
 =?us-ascii?Q?1crSw0vne909/k7mYRgSNXfjtvEenMPVTYFx7gepzddaSHt+zgi/+YVg6RJX?=
 =?us-ascii?Q?/uEDjCD3yEyI1lRro3SoexYxUPmiWwweIQcJBCJQ5gyqa/gAtdpUF9NvEK5X?=
 =?us-ascii?Q?rGPHK8Ju/utYk3md5819WMuxrIAHOnDQhT+xpVEAWzt5jRqqL47OJhk8OdQP?=
 =?us-ascii?Q?4JfdsSZsr/1xUcWVZO4TZ14p7zcDxcinZn2MHePHi+fpCaUqJvhhRUpwUewU?=
 =?us-ascii?Q?tNZbje8HyUzhOosr5QKdgnENOvXfjD9oooj4SH64k8hwcJQy7gmCGWAQk/j3?=
 =?us-ascii?Q?tR5fO6AbEUkX49hRiVPXL+347IYyCNTflDgL7+ETsYVs+67a5y5UcZhsnWze?=
 =?us-ascii?Q?U5lnBTwNZhPQtYsZD18sJy8+0QPbABLN9HYszvbZhmjzpDgn5VabWT820okt?=
 =?us-ascii?Q?t0q+2gYHCUC00CGQiWbro9bzvAs6ZJpDTS31Zy4NxnU6zyV13s1s3UhH5ixE?=
 =?us-ascii?Q?kcC6CWSsgwPK7K8fziBgtit/EoWyCyhkd3zjN4ykZ2IIUORc5tyBdRM3DfjK?=
 =?us-ascii?Q?x2OWCTldjOTCUyyIMk5U0pPYeQewNxX/85yOYROoihgC91ItHLu/dL9y0u4+?=
 =?us-ascii?Q?fFZhrSbl9DqTTjieLaPQu/60GPVA4HyCzDy0NncjsmlKYGySxv6qnSIIGEpA?=
 =?us-ascii?Q?ZY2mF8+VSlefUdZl/acAE/erYMzvN+PVlCnsbOX1ey2DVHerYNv7VJkhhBXS?=
 =?us-ascii?Q?xULS9qVj2NwCKp0pqrtNg22g3r94DLOmxMtHpW/A+nITkji38EnZ99OGy2qu?=
 =?us-ascii?Q?K2haWJn5iwmyGquOoA1GfVROhutp6j3EGNyhJavYoPRurKs71pNOQAXegSv2?=
 =?us-ascii?Q?ghDywTPpk9qxUtXlqxQa+8Vww6uVMyMCYWSrZoXrem1fZotYKAmzyi3+c3Vc?=
 =?us-ascii?Q?M/P/2f3jTmcNZj4ygVHa5JBv/vL0z/OP+e8UqpUz+bFJf0zB+h5HBpeIqsL4?=
 =?us-ascii?Q?gvwFC8fQGKvvTlDpgjS/DPNZUMW44AKXsQDOEkkwwNhvIdUlXT6M6lZ3f/Yw?=
 =?us-ascii?Q?q3wd8ipckMz38YEAhz0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3f28ae-2e42-4797-0d5e-08db4fa96313
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 09:48:33.3165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bdsQtarM7g3E4x4Sbc0zfmdEXNANDAdVz6pPMr/TAze0C4/l6uU9Rk8lDrptgEUv1KKdDSXa8gPdaMadBYYGCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8352
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Hi Lyude and Jani,

Could you help to review please? Thanks for your time!

Regards,
Wayne Lin
> -----Original Message-----
> From: Wayne Lin <Wayne.Lin@amd.com>
> Sent: Thursday, April 27, 2023 3:29 PM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: lyude@redhat.com; ville.syrjala@linux.intel.com; jani.nikula@intel.co=
m;
> imre.deak@intel.com; Wentland, Harry <Harry.Wentland@amd.com>; Zuo,
> Jerry <Jerry.Zuo@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>;
> stable@vger.kernel.org
> Subject: [PATCH v2] drm/dp_mst: Clear MSG_RDY flag before sending new
> message
>=20
> [Why]
> The sequence for collecting down_reply from source perspective should
> be:
>=20
> Request_n->repeat (get partial reply of Request_n->clear message ready
> flag to ack DPRX that the message is received) till all partial replies f=
or
> Request_n are received->new Request_n+1.
>=20
> Now there is chance that drm_dp_mst_hpd_irq() will fire new down request
> in the tx queue when the down reply is incomplete. Source is restricted t=
o
> generate interveleaved message transactions so we should avoid it.
>=20
> Also, while assembling partial reply packets, reading out DPCD DOWN_REP
> Sideband MSG buffer + clearing DOWN_REP_MSG_RDY flag should be
> wrapped up as a complete operation for reading out a reply packet.
> Kicking off a new request before clearing DOWN_REP_MSG_RDY flag might
> be risky. e.g. If the reply of the new request has overwritten the DPRX
> DOWN_REP Sideband MSG buffer before source writing one to clear
> DOWN_REP_MSG_RDY flag, source then unintentionally flushes the reply for
> the new request. Should handle the up request in the same way.
>=20
> [How]
> Separete drm_dp_mst_hpd_irq() into 2 steps. After acking the MST IRQ
> event, driver calls drm_dp_mst_hpd_irq_step2() and might trigger
> drm_dp_mst_kick_tx() only when there is no on going message transaction.
>=20
> Changes since v1:
> * Reworked on review comments received
> -> Adjust the fix to let driver explicitly kick off new down request
> when mst irq event is handled and acked
> -> Adjust the commit message
>=20
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Cc: stable@vger.kernel.org
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++---
> drivers/gpu/drm/display/drm_dp_mst_topology.c | 35
> ++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_dp.c       |  5 ++-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  5 ++-
>  include/drm/display/drm_dp_mst_helper.h       |  4 +--
>  5 files changed, 45 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 1ad67c2a697e..48bdcb2ee9b1 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3259,10 +3259,9 @@ static void dm_handle_mst_sideband_msg(struct
> amdgpu_dm_connector *aconnector)
>  		DRM_DEBUG_DRIVER("ESI %02x %02x %02x\n", esi[0], esi[1],
> esi[2]);
>  		/* handle HPD short pulse irq */
>  		if (aconnector->mst_mgr.mst_state)
> -			drm_dp_mst_hpd_irq(
> -				&aconnector->mst_mgr,
> -				esi,
> -				&new_irq_handled);
> +			drm_dp_mst_hpd_irq_step1(&aconnector-
> >mst_mgr,
> +						 esi,
> +						 &new_irq_handled);
>=20
>  		if (new_irq_handled) {
>  			/* ACK at DPCD to notify down stream */ @@ -3281,6
> +3280,7 @@ static void dm_handle_mst_sideband_msg(struct
> amdgpu_dm_connector *aconnector)
>  					break;
>  			}
>=20
> +			drm_dp_mst_hpd_irq_step2(&aconnector-
> >mst_mgr);
>  			/* check if there is new irq to be handled */
>  			dret =3D drm_dp_dpcd_read(
>  				&aconnector->dm_dp_aux.aux,
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 70df29fe92db..2e0a38a6509c 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4045,7 +4045,7 @@ static int drm_dp_mst_handle_up_req(struct
> drm_dp_mst_topology_mgr *mgr)  }
>=20
>  /**
> - * drm_dp_mst_hpd_irq() - MST hotplug IRQ notify
> + * drm_dp_mst_hpd_irq_step1() - MST hotplug IRQ notify
>   * @mgr: manager to notify irq for.
>   * @esi: 4 bytes from SINK_COUNT_ESI
>   * @handled: whether the hpd interrupt was consumed or not @@ -4055,7
> +4055,7 @@ static int drm_dp_mst_handle_up_req(struct
> drm_dp_mst_topology_mgr *mgr)
>   * topology manager will process the sideband messages received as a res=
ult
>   * of this.
>   */
> -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi,
> bool *handled)
> +int drm_dp_mst_hpd_irq_step1(struct drm_dp_mst_topology_mgr *mgr,
> u8
> +*esi, bool *handled)
>  {
>  	int ret =3D 0;
>  	int sc;
> @@ -4077,11 +4077,38 @@ int drm_dp_mst_hpd_irq(struct
> drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handl
>  		*handled =3D true;
>  	}
>=20
> -	drm_dp_mst_kick_tx(mgr);
>  	return ret;
>  }
> -EXPORT_SYMBOL(drm_dp_mst_hpd_irq);
> +EXPORT_SYMBOL(drm_dp_mst_hpd_irq_step1);
> +
> +/**
> + * drm_dp_mst_hpd_irq_step2() - MST hotplug IRQ 2nd part handling
> + * @mgr: manager to notify irq for.
> + *
> + * This should be called from the driver when mst irq event is handled
> + * and acked. Note that new down request should only be sent when
> + * previous message transaction is done. Source is not supposed to
> +generate
> + * interleaved message transactions.
> + */
> +void drm_dp_mst_hpd_irq_step2(struct drm_dp_mst_topology_mgr *mgr)
> {
> +	struct drm_dp_sideband_msg_tx *txmsg;
> +	bool skip =3D false;
>=20
> +	mutex_lock(&mgr->qlock);
> +	txmsg =3D list_first_entry_or_null(&mgr->tx_msg_downq,
> +					 struct drm_dp_sideband_msg_tx,
> next);
> +	/* If last transaction is not completed yet*/
> +	if (!txmsg ||
> +	    txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_START_SEND ||
> +	    txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_SENT)
> +		skip =3D true;
> +	mutex_unlock(&mgr->qlock);
> +
> +	if (!skip)
> +		drm_dp_mst_kick_tx(mgr);
> +}
> +EXPORT_SYMBOL(drm_dp_mst_hpd_irq_step2);
>  /**
>   * drm_dp_mst_detect_port() - get connection status for an MST port
>   * @connector: DRM connector for this port diff --git
> a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 75070eb07d4b..9a9a5aec9534 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3803,7 +3803,7 @@ intel_dp_mst_hpd_irq(struct intel_dp *intel_dp,
> u8 *esi, u8 *ack)  {
>  	bool handled =3D false;
>=20
> -	drm_dp_mst_hpd_irq(&intel_dp->mst_mgr, esi, &handled);
> +	drm_dp_mst_hpd_irq_step1(&intel_dp->mst_mgr, esi, &handled);
>  	if (handled)
>  		ack[1] |=3D esi[1] & (DP_DOWN_REP_MSG_RDY |
> DP_UP_REQ_MSG_RDY);
>=20
> @@ -3880,6 +3880,9 @@ intel_dp_check_mst_status(struct intel_dp
> *intel_dp)
>=20
>  		if (!intel_dp_ack_sink_irq_esi(intel_dp, ack))
>  			drm_dbg_kms(&i915->drm, "Failed to ack ESI\n");
> +
> +		if (ack[1] & (DP_DOWN_REP_MSG_RDY |
> DP_UP_REQ_MSG_RDY))
> +			drm_dp_mst_hpd_irq_step2(&intel_dp->mst_mgr);
>  	}
>=20
>  	return link_ok;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index ed9d374147b8..00c36fcc8afd 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1332,12 +1332,15 @@ nv50_mstm_service(struct nouveau_drm *drm,
>  			break;
>  		}
>=20
> -		drm_dp_mst_hpd_irq(&mstm->mgr, esi, &handled);
> +		drm_dp_mst_hpd_irq_step1(&mstm->mgr, esi, &handled);
>  		if (!handled)
>  			break;
>=20
>  		rc =3D drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1,
> &esi[1],
>  				       3);
> +
> +		drm_dp_mst_hpd_irq_step2(&mstm->mgr);
> +
>  		if (rc !=3D 3) {
>  			ret =3D false;
>  			break;
> diff --git a/include/drm/display/drm_dp_mst_helper.h
> b/include/drm/display/drm_dp_mst_helper.h
> index 32c764fb9cb5..6c08ba765d5a 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -815,8 +815,8 @@ void drm_dp_mst_topology_mgr_destroy(struct
> drm_dp_mst_topology_mgr *mgr);  bool drm_dp_read_mst_cap(struct
> drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);  int
> drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr
> *mgr, bool mst_state);
>=20
> -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi,
> bool *handled);
> -
> +int drm_dp_mst_hpd_irq_step1(struct drm_dp_mst_topology_mgr *mgr,
> u8
> +*esi, bool *handled); void drm_dp_mst_hpd_irq_step2(struct
> +drm_dp_mst_topology_mgr *mgr);
>=20
>  int
>  drm_dp_mst_detect_port(struct drm_connector *connector,
> --
> 2.37.3

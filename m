Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357D11B6B8F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 04:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A100F6E427;
	Fri, 24 Apr 2020 02:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611416E427
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 02:49:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiLTCZNsuQlm5SNk34hFVEji3CU4+vooJ+rLi67Hvj3t2/AqGySDGDLtb1rwZTn/fqbKpvT26c6uXeyLdoRsODYcacOICrmX/g3cA/CYgYH07j25TDOWSD7Y1lvZWick94GtL4o4Kq3nmc13EoG1ORK3S93WbuJ/mC2ssk64I51qbKM1wDd55a0/XmKZmrA1ZMyphgoqOGLlajvXHIpPZywexfzH2QRcTskrRGfamctMZ72MpTnE3za0i020DbFwzd1Aw9lsKbZ9ijVbpUWl0i+3hKBlBkggaFw+oeankb62E0PZQ9mE4f1fQTMZH/9NrzT4POqjjej9yQu1x5qc4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1Eh/wcYd2PI01e68+Mn+FrUFc1LstPLzSGOYnOsOIY=;
 b=bUz1d4/KerDQ/aCwTTV58uiSk+36D5bcXQERwx4321x4CP575XBW8GLm543LbTYGfsFSnS+e/S7K1rxa8+hn/sElBJLaAqFg78a3Y93kLG18AGUZfCGh0WlzellSS7+z87yGboZF63C2S9RmcJso8h1SAJQTm6rIoqfO8m0d7T6lJN19k2MSIgIeYmVavNRUc0kGfewmF8hyYIB2MlUkAW+GYl9blQecsvK1g1B/OpdR7kTZDy9Gkcfz/4S3VYe9oepM7UPyjYBg3+rQ6qz8N6rE17fxN3hutZrhhKvHcP9a+2HxJTQvBmTeGX015aOCZyqPMFstckwfFtv8XVnl8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1Eh/wcYd2PI01e68+Mn+FrUFc1LstPLzSGOYnOsOIY=;
 b=KG/jkouojkssXtsWA1hFO6xvvLES/ufgMu/CJJBfsGMlgCsqkwlwbSTsn4GzEDT6GSYCTYNSh2MtCBAVYAsc6k35y23VZ9NZPHG52IKuOQgf7G4PkZc7hxstLDktKkLfA+NVU8yoemxZqQ367vcLD0kKAgghksAXPEM0voxWSjc=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (2603:10b6:5:218::21)
 by DM6PR12MB4372.namprd12.prod.outlook.com (2603:10b6:5:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Fri, 24 Apr
 2020 02:49:07 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::6db7:82a1:2663:81b7]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::6db7:82a1:2663:81b7%7]) with mapi id 15.20.2921.030; Fri, 24 Apr 2020
 02:49:07 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, Lyude Paul <lyude@redhat.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] Revert "drm/dp_mst: Remove single tx msg restriction."
Thread-Topic: [PATCH] Revert "drm/dp_mst: Remove single tx msg restriction."
Thread-Index: AQHWGY48HSsOJY8d6EGMg/CvryuUlqiG/RKAgACUNPA=
Date: Fri, 24 Apr 2020 02:49:07 +0000
Message-ID: <DM6PR12MB4137B19AF2E680FE57668515FCD00@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20200423164225.680178-1-lyude@redhat.com>
 <8fd4b3b0-388e-9856-4bfb-5d0bb36c257d@amd.com>
In-Reply-To: <8fd4b3b0-388e-9856-4bfb-5d0bb36c257d@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-04-24T02:43:58Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=c93b4f47-6093-43d4-9197-a15a537fcd9b;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.135.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ddc6563e-fd6a-4668-79a7-08d7e7fa0f0a
x-ms-traffictypediagnostic: DM6PR12MB4372:|DM6PR12MB4372:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB43724965F5AF4F6284D6D73CFCD00@DM6PR12MB4372.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 03838E948C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4137.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(316002)(66446008)(9686003)(64756008)(66556008)(66476007)(66946007)(55016002)(71200400001)(110136005)(54906003)(186003)(478600001)(5660300002)(76116006)(53546011)(26005)(6506007)(7696005)(81156014)(86362001)(4326008)(2906002)(8936002)(52536014)(8676002)(33656002);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U1HSp1tYs4yl42gffKMm6QiSpIn/geKSQ0hDOV4AwXNgrktZiOHezk5rdCiJNX7aCDqvxDy7kja7bdEd9MJ8FUy706AP6A8Km+FSgdwCumb9Y3zY5Ko/0dWmSEDKwo5AEaUrEQnCdGMY8JgNF3byl9YBBHpw0dMB0Ns8cR42UreU4Q+JSO3NUATXrVtqRmc+H58R+46pbJRn/1k6+7/YqpdlVxDYPEiWX4q9jlEfd9N/XKc15j038GWmMsGxOlqhyoD8GjptbKJL0cPtWvvkhpTwmw4CD2r1feQ8FFA288RtZUxceyD7QOkB/QDoQ7j9HiQy5uL0l3qES+YTv1D/8++iOW4W+mqAQWFNy/1r4W3ETLeF432x6OyrBKcLcU8Ur8r4M+d2oHT8filEVuXRnpYIu/iuKarpPNhBpjfaGt/DxBRX9MGIJG2Cw8lQFxkN
x-ms-exchange-antispam-messagedata: WeBf9+Iu7Rj2xMu0kPSBK4k+400E7M+1bRr+xA3tJiS4oNrDCfaXZ2t1D614NN70RieJ2uUrM4CmIm5ZXYvy03UPNBIfBQp8a3YXHbHrV95PPkylna5NIFpGuoIaTJdI8MaQZ7Q/peBdmOpBZjfxeQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc6563e-fd6a-4668-79a7-08d7e7fa0f0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2020 02:49:07.4975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KbknbTIhGvT1/l18NLXcgHS6IGnsAdcKH3MfnP90QgmQOr49068nEJUsXy4FdulNY+GVVMH95TEE4ciHznDS9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4372
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]



> -----Original Message-----
> From: Wentland, Harry <Harry.Wentland@amd.com>
> Sent: Friday, April 24, 2020 1:53 AM
> To: Lyude Paul <lyude@redhat.com>; dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>; linux-kernel@vger.kernel.org; Sean Paul
> <seanpaul@chromium.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> Lin, Wayne <Wayne.Lin@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
> Subject: Re: [PATCH] Revert "drm/dp_mst: Remove single tx msg restriction."
> 
> On 2020-04-23 12:42 p.m., Lyude Paul wrote:
> > This reverts commit 6bb0942e8f46863a745489cce27efe5be2a3885e.
> >
> > Unfortunately it would appear that the rumors we've heard of sideband
> > message interleaving not being very well supported are true. On the
> > Lenovo ThinkPad Thunderbolt 3 dock that I have, interleaved messages
> > appear to just get dropped:
> >
> >   [drm:drm_dp_mst_wait_tx_reply [drm_kms_helper]] timedout msg send
> >   00000000571ddfd0 2 1
> >   [dp_mst] txmsg cur_offset=2 cur_len=2 seqno=1 state=SENT path_msg=1
> dst=00
> >   [dp_mst] 	type=ENUM_PATH_RESOURCES contents:
> >   [dp_mst] 		port=2
> >
> > DP descriptor for this hub:
> >   OUI 90-cc-24 dev-ID SYNA3  HW-rev 1.0 SW-rev 3.12 quirks 0x0008
> >
> > It would seem like as well that this is a somewhat well known issue in
> > the field. From section 5.4.2 of the DisplayPort 2.0 specification:
> >
> >   There are MST Sink/Branch devices in the field that do not handle
> >   interleaved message transactions.
> >
> >   To facilitate message transaction handling by downstream devices, an
> >   MST Source device shall generate message transactions in an atomic
> >   manner (i.e., the MST Source device shall not concurrently interleave
> >   multiple message transactions). Therefore, an MST Source device shall
> >   clear the Message_Sequence_No value in the Sideband_MSG_Header to
> 0.
> >
> >   MST Source devices that support field policy updates by way of
> >   software should update the policy to forego the generation of
> >   interleaved message transactions.
> >
Hi Paul,

Appreciate for your time!
Didn't notice it on DP 2.0 spec before :)

Acked-by: Wayne Lin <wayne.lin@amd.com>

> > This is a bit disappointing, as features like HDCP require that we
> > send a sideband request every ~2 seconds for each active stream.
> > However, there isn't really anything in the specification that allows
> > us to accurately probe for interleaved messages.
> >
> > If it ends up being that we -really- need this in the future, we might
> > be able to whitelist hubs where interleaving is known to work-or maybe
> > try some sort of heuristics. But for now, let's just play it safe and
> > not use it.
> >
> 
> Sounds like the DP spec would need an addition bit to indicate actual support
> of interleaved messages by the RX.
> 
> Acked-by: Harry Wentland <harry.wentland@amd.com>
> 
> Harry
> 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Fixes: 6bb0942e8f46 ("drm/dp_mst: Remove single tx msg restriction.")
> > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > Cc: Sean Paul <seanpaul@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++++++++++++--
> >  include/drm/drm_dp_mst_helper.h       |  5 +++++
> >  2 files changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 21f10ceb3d6c..03a1496f6120 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -1205,6 +1205,8 @@ static int drm_dp_mst_wait_tx_reply(struct
> drm_dp_mst_branch *mstb,
> >  		    txmsg->state == DRM_DP_SIDEBAND_TX_SENT) {
> >  			mstb->tx_slots[txmsg->seqno] = NULL;
> >  		}
> > +		mgr->is_waiting_for_dwn_reply = false;
> > +
> >  	}
> >  out:
> >  	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) { @@
> > -1214,6 +1216,7 @@ static int drm_dp_mst_wait_tx_reply(struct
> drm_dp_mst_branch *mstb,
> >  	}
> >  	mutex_unlock(&mgr->qlock);
> >
> > +	drm_dp_mst_kick_tx(mgr);
> >  	return ret;
> >  }
> >
> > @@ -2789,9 +2792,11 @@ static void process_single_down_tx_qlock(struct
> drm_dp_mst_topology_mgr *mgr)
> >  	ret = process_single_tx_qlock(mgr, txmsg, false);
> >  	if (ret == 1) {
> >  		/* txmsg is sent it should be in the slots now */
> > +		mgr->is_waiting_for_dwn_reply = true;
> >  		list_del(&txmsg->next);
> >  	} else if (ret) {
> >  		DRM_DEBUG_KMS("failed to send msg in q %d\n", ret);
> > +		mgr->is_waiting_for_dwn_reply = false;
> >  		list_del(&txmsg->next);
> >  		if (txmsg->seqno != -1)
> >  			txmsg->dst->tx_slots[txmsg->seqno] = NULL; @@ -2831,7
> +2836,8 @@
> > static void drm_dp_queue_down_tx(struct drm_dp_mst_topology_mgr *mgr,
> >  		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> >  	}
> >
> > -	if (list_is_singular(&mgr->tx_msg_downq))
> > +	if (list_is_singular(&mgr->tx_msg_downq) &&
> > +	    !mgr->is_waiting_for_dwn_reply)
> >  		process_single_down_tx_qlock(mgr);
> >  	mutex_unlock(&mgr->qlock);
> >  }
> > @@ -3823,6 +3829,7 @@ static int drm_dp_mst_handle_down_rep(struct
> drm_dp_mst_topology_mgr *mgr)
> >  	mutex_lock(&mgr->qlock);
> >  	txmsg->state = DRM_DP_SIDEBAND_TX_RX;
> >  	mstb->tx_slots[seqno] = NULL;
> > +	mgr->is_waiting_for_dwn_reply = false;
> >  	mutex_unlock(&mgr->qlock);
> >
> >  	wake_up_all(&mgr->tx_waitq);
> > @@ -3830,6 +3837,9 @@ static int drm_dp_mst_handle_down_rep(struct
> drm_dp_mst_topology_mgr *mgr)
> >  	return 0;
> >
> >  out_clear_reply:
> > +	mutex_lock(&mgr->qlock);
> > +	mgr->is_waiting_for_dwn_reply = false;
> > +	mutex_unlock(&mgr->qlock);
> >  	if (msg)
> >  		memset(msg, 0, sizeof(struct drm_dp_sideband_msg_rx));
> >  out:
> > @@ -4683,7 +4693,7 @@ static void drm_dp_tx_work(struct work_struct
> *work)
> >  	struct drm_dp_mst_topology_mgr *mgr = container_of(work, struct
> > drm_dp_mst_topology_mgr, tx_work);
> >
> >  	mutex_lock(&mgr->qlock);
> > -	if (!list_empty(&mgr->tx_msg_downq))
> > +	if (!list_empty(&mgr->tx_msg_downq) &&
> > +!mgr->is_waiting_for_dwn_reply)
> >  		process_single_down_tx_qlock(mgr);
> >  	mutex_unlock(&mgr->qlock);
> >  }
> > diff --git a/include/drm/drm_dp_mst_helper.h
> > b/include/drm/drm_dp_mst_helper.h index 2d7c26592c05..96bcf33c03d3
> > 100644
> > --- a/include/drm/drm_dp_mst_helper.h
> > +++ b/include/drm/drm_dp_mst_helper.h
> > @@ -592,6 +592,11 @@ struct drm_dp_mst_topology_mgr {
> >  	 */
> >  	bool payload_id_table_cleared : 1;
> >
> > +	/**
> > +	 * @is_waiting_for_dwn_reply: whether we're waiting for a down reply.
> > +	 */
> > +	bool is_waiting_for_dwn_reply : 1;
> > +
> >  	/**
> >  	 * @mst_primary: Pointer to the primary/first branch device.
> >  	 */
> >

--
Best regards,
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

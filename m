Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F614E8F1
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 07:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A746FA75;
	Fri, 31 Jan 2020 06:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770074.outbound.protection.outlook.com [40.107.77.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE596FA75
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 06:52:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEcpRTzqAu4EzZpmTTNuBD8J/AE2oNRqyHCjvzcYa+iS/gvhjwbIUZ36QQs2AwsrDVCohQIvhT787JNDxO3oIQ0Du6sH9J8cUixECkZzc9jHMosVYO6GPD4xc7HP820ZkVuD4bp0dgVf5vkKsADOmVI8xOfNxsU8+RxeZXI97/ajMonPi4CGblCuvwFsMbjmm8rw6OpnQ2ULRi2VVtFzLagKQB1MGExCIKB9mTh/fzfoXIiWy3ucXOJz5WNRp/uMcaxmg1ZN2HWEd+NqIQdW7wSLNHL+SJ2OXxf5lJFPLTAzJ20wJs7S9xw0UX7WQmoSqsqN5AEgk2BZzjC0WauRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKGmfEFVVTA4GppOpbRRAvFXjZBdQ/99pPP4amGciKU=;
 b=AzoOjUtflFltJaQmKgRrKSojuoAl/FlP6A5YROO+XXlEwavSjlgUCk4z3vvYOE/BHFZukGlLMDv0iImgApr5R1CRGTH5XH4cDRSesP1MOofc8h5AMKgrN0/2VRLbAYLARyWLEtpDnTeeToVBe8FpXFzoTZ3wSlbM/G26NFMwHqMb2ovfo3W2bcCHiWeliSdjYh8Z+RDQM3+GQlaqwZJ90DyBciS1EhD6vPRGlgJgYm16f1uOerPszPuwgfyZvpw3Pkwz9TPgalkARdV+FEKAm9TgZZwyJc6s8Trn0gV7wRiOESQcRFTDew8CszAdspWKU7h39Q6JCELfMpxBBD3VMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKGmfEFVVTA4GppOpbRRAvFXjZBdQ/99pPP4amGciKU=;
 b=m9enIdGG8KM618wB+LWMWuM7xIUvjMFKTx15V9Y6dwHcLJ3/z2+anRkv1UZyp8HN1mCMS7A55SoUTL10YYHCzDsbA7ZVi09sq8GpQkhMMlXjBh2dwhEAsdu1dXRBUeriBFI+4BwSmtrRA9WQyksrGzP4Ha8NYMHJMgZzFhDeirA=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3388.namprd12.prod.outlook.com (20.178.30.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.22; Fri, 31 Jan 2020 06:52:32 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2686.028; Fri, 31 Jan 2020
 06:52:32 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/dp_mst: Convert
 drm_dp_mst_topology_mgr.is_waiting_for_dwn_reply to bitfield
Thread-Topic: [PATCH] drm/dp_mst: Convert
 drm_dp_mst_topology_mgr.is_waiting_for_dwn_reply to bitfield
Thread-Index: AQHV0Vz/lTSU5ZZbzkearP0fAkbEEagEYIwg
Date: Fri, 31 Jan 2020 06:52:31 +0000
Message-ID: <DM6PR12MB41370FD3ACA84114B26E20AEFC070@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20200122194846.16025-1-lyude@redhat.com>
In-Reply-To: <20200122194846.16025-1-lyude@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-01-31T06:42:47Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=b6468822-e034-49ef-ba8b-00006071610b;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-01-31T06:52:28Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: d74e6f03-1f34-4652-92a9-0000ba605691
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.134.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 84a657bd-5bf1-4bcb-84d3-08d7a61a253f
x-ms-traffictypediagnostic: DM6PR12MB3388:
x-microsoft-antispam-prvs: <DM6PR12MB3388501AEEA3D27B7478D7C7FC070@DM6PR12MB3388.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 029976C540
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(199004)(189003)(186003)(52536014)(2906002)(26005)(86362001)(5660300002)(66476007)(76116006)(33656002)(66446008)(53546011)(4326008)(81156014)(54906003)(478600001)(6506007)(110136005)(55016002)(66946007)(316002)(9686003)(81166006)(7696005)(71200400001)(8936002)(66556008)(8676002)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3388;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 76x8vwH50yqxce1APBlzgH2esPdUhHslQ9m1idFDInhxd6GnJ/DPKiqRf9v3GcwbdLi2aetukwL0Spgg4ulomGuHbuq8LyyFzJ6hqeQlevYvyVq7uoCw+fJGoRedlm3YaDoRaUZOTb8d26pG0jdnBtMm54FChgLDGi78nJ2XXFFDIusl8DnjjA6er/r11yGjYKwUcRyl1QcuXGtT2TAzqSB2XMZjDW0fVJxfM1YrJG3mwPSw8Oln0S9WOZ5QCq5BdCKzyaIbu7wWwD7lMD+jq+zl0+3Eu/LBOF0JA78uVFeVkLip27muyRw9lPBp9OVL7SwLxmz6/mtMybp7RSmQSSPfxI+uloedn91Be+ODAI1thQGyPa39wJ+ndvXmKIT5+1LP6iNI1d0jMqPTDl2oAPNVk94tzZHNiMMpHuz1h2htA8jM0kkHQU7ccvptJoKi
x-ms-exchange-antispam-messagedata: mAQzgwbDwDnwNB3YRSOPCjc3UX5llFu9fY7VJbj0i+K1zlpJBRW9YChMshj+B2jdSWCEYtorbqLd1oExllOF3raXpRjpUMka25xTlyqcJitMkD8GmeZ4VPO5lTRvfeNzuNNOt7voCywB2QLBFrsZ5Q==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a657bd-5bf1-4bcb-84d3-08d7a61a253f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2020 06:52:31.7199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRygC6qtkLTIFemjFolQqu+TLKV4zm6oRN9Xe1TMq4smDj4Ten2Al53ThxXHP1rWHiDZUavyYu8YsEKEUqNJow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3388
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>

Thanks!

> -----Original Message-----
> From: Lyude Paul <lyude@redhat.com>
> Sent: Thursday, January 23, 2020 3:49 AM
> To: dri-devel@lists.freedesktop.org
> Cc: Lin, Wayne <Wayne.Lin@amd.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>;
> linux-kernel@vger.kernel.org
> Subject: [PATCH] drm/dp_mst: Convert
> drm_dp_mst_topology_mgr.is_waiting_for_dwn_reply to bitfield
> 
> Small nitpick that I noticed a second ago - we can save some space in the
> struct by making this a bitfield and sticking it with the rest of the bitfields. Also,
> some small cleanup to the kdocs for this member.
> 
> There should be no functional changes in this patch.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> ---
>  include/drm/drm_dp_mst_helper.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h index bcb39da9adb4..58bbab3684b5
> 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -590,6 +590,11 @@ struct drm_dp_mst_topology_mgr {
>  	 */
>  	bool payload_id_table_cleared : 1;
> 
> +	/**
> +	 * @is_waiting_for_dwn_reply: whether we're waiting for a down reply.
> +	 */
> +	bool is_waiting_for_dwn_reply : 1;
> +
>  	/**
>  	 * @mst_primary: Pointer to the primary/first branch device.
>  	 */
> @@ -619,11 +624,6 @@ struct drm_dp_mst_topology_mgr {
>  	 */
>  	struct mutex qlock;
> 
> -	/**
> -	 * @is_waiting_for_dwn_reply: indicate whether is waiting for down
> reply
> -	 */
> -	bool is_waiting_for_dwn_reply;
> -
>  	/**
>  	 * @tx_msg_downq: List of pending down replies.
>  	 */
> --
> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A60849FBE3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 15:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4FA10E821;
	Fri, 28 Jan 2022 14:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA4C10E821;
 Fri, 28 Jan 2022 14:40:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qos+segvnmxFvyiBsu8lAMMkX3FzkPhpmljkJbBYM5McRi8N13Ck5UkQEML+vT8V6ai5ODFiru777rAS36kSnlBQeXvgTpk7txdEEwk1Hrv7aKvXmsULOzQvK5Pz8OlVr0/KSHVJvN0PLY3s/ztViYqQmfYUNjUbA4uCfMfbT0weNiai9M4uQAHElTi8kZiz/A9n8ZTFnw+ZF/Py4NSoD+fPqWwq4N9lhUxw0A4r3ATFXhLQvRpcXwTwW4nkf+IbWfxBquaAuN7c++0Spo06eiYFc3SaA6cai2QBF9PrtkFahSxATkb6YVovwP6E8z30q09NWZPJ35WWe4dc7kxg2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1HFg2iLEM47jx5sNbnHqrR1SUdLDGbcRP5UtLWcpZc=;
 b=ZijXHVMLKJhZk/DsSp2BpGmaYVgGc92AO0OmgQUjYUn2jQRLnpj0jnrFEqkdjy2LDBY104/9kIq7YVitjwNYsdsL4bS7tdWkGjYesX+cDoo4ob5YgDCWIFeu3gpTTlER+5810WlwitBrCCagIuleS4Wpap4y5fztBnTOrrqFmeaHFuL+ULLaavY4nSzKcuUd1uMaayERHvh2ZfBRWBFvnmiPCdjMgkEL/fY9AZnh4hOl/CETbJcK5rDfw/Qkqlr1cBl6KiB0AzE183GWdnb7ryeXzWd2soDSZp2/NoKpXiVddlZ5Cb7mPTx3m2nhJrA/N4mMiJ0UnOuzLAS4MVZ4ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1HFg2iLEM47jx5sNbnHqrR1SUdLDGbcRP5UtLWcpZc=;
 b=iMZvsP6xFC5SRxwMxQ4wGUhkrbOXXkTFoxSZb8XxobX7T2NqhoPlytvNy6wUz648UH72Jre4dDa2BFlLTDTIhFk4rZnFg3nG+HaH0bRRSJq3mMyVpefe8VS5U76EDC1aGyafegnVbYUCvELqCl/lMJTqVS35fwunXVN/w7jGIjs=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CH2PR12MB4821.namprd12.prod.outlook.com (2603:10b6:610:c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 14:40:13 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::99d4:4d4f:653f:61be]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::99d4:4d4f:653f:61be%6]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 14:40:13 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Lin, Tsung-hua (Ryan)" <Tsung-hua.Lin@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, "David1.Zhou@amd.com"
 <David1.Zhou@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "bas@basnieuwenhuizen.nl" <bas@basnieuwenhuizen.nl>, 
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "sashal@kernel.org"
 <sashal@kernel.org>, "markyacoub@google.com" <markyacoub@google.com>,
 "victorchengchi.lu@amd.com" <victorchengchi.lu@amd.com>,
 "ching-shih.li@amd.corp-partner.google.com"
 <ching-shih.li@amd.corp-partner.google.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "ddavenport@chromium.org"
 <ddavenport@chromium.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Li, Leon" <Leon.Li@amd.com>
Subject: Re: [PATCH v2 1/28] drm/amdgpu: fix that issue that the number of the
 crtc of the 3250c is not correct
Thread-Topic: [PATCH v2 1/28] drm/amdgpu: fix that issue that the number of
 the crtc of the 3250c is not correct
Thread-Index: AQHYE/m6wRt+syFjR0GBrKqdXutE2Kx4gd6W
Date: Fri, 28 Jan 2022 14:40:12 +0000
Message-ID: <BL1PR12MB514457FCE1C3FE36BFBC7510F7229@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20220128034701.17174-1-Tsung-Hua.Lin@amd.com>
In-Reply-To: <20220128034701.17174-1-Tsung-Hua.Lin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-01-28T14:40:12.383Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
suggested_attachment_session_id: d9df87c6-98ea-aea6-2ff6-030e611e12b6
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e5f10dd-e3d9-4a6a-fe5d-08d9e26c17b5
x-ms-traffictypediagnostic: CH2PR12MB4821:EE_
x-microsoft-antispam-prvs: <CH2PR12MB48213433760EA4B7F166F374F7229@CH2PR12MB4821.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RMxDP91jNsmTeAMhUBFrXVf2a7WAshUJFGUfSJXSWHfHjopOnbpSHUbSocu8m/v1/znDMx+bYaC/GqvKaAPvIxXBs60rDNSEoA3PfR3XHN1Ysyvn/Y1P2YQwM5w0jrjkCVQVe9qCxoQtu+zzrjMoIao5p4bRE2eAvNyD0tmQTXjspJljls+ybNEt7pYHZCW7f+/dz+Pu6dX6+yymLOvz8MIKuI1PHVGHWUbG97SuXkKXrlXRDe0Gvcb+T78vmKCy/QtzJsDsxZfS4K2HVhqj8/RvW3kGA19BGbI4HzaKTJ36hpnBl+OUTBQFXqecn1uS9UPBGkJzmFrzAGmSxTiBJACwErn4lCDYmn/VDf9rJC5jthXFxmscRtGseosAEL9JkG1t+A2LS1FyHq+vcSlUFX1zU8pVW+svbhg3vEWqLu3QxVl/Dn/L8wZ5sv9NBiiOdiJWYU2jrJl5a+Y8HT8d7IUWRgrZE2g90atL++yY2EvsJNNXC03v9RGmFt6syqcG9lmUOdczVQPoBWy7JQD7SVbmhgej5O+h3ma8eMid1L20kfw51yVhrELr3rQFRCLHF+5W4J69E/UPSybosMcbo0wnWxTBgQoraDZSaQRat+plw96+opR7LkYunoF8raDpuzn8EfYeuPjMHTf3nIOG3W9XGjNLCy5ayQVmx3m7kdLIZBWjlD8Xy8xmRDAOmW6c6k0AV6UmI7mpDa4uyqrpA7KoTw29cHSXUYsOcYzXvXA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(110136005)(9686003)(71200400001)(7696005)(508600001)(6506007)(53546011)(26005)(186003)(83380400001)(38100700002)(122000001)(921005)(6636002)(52536014)(38070700005)(7416002)(5660300002)(8676002)(8936002)(64756008)(2906002)(19627405001)(33656002)(55016003)(66946007)(66446008)(316002)(66476007)(76116006)(66556008)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vIx5ZRYUwJJtQO5+bTJrc9ltOI3wOvNHejz9sOHvqN1IPRGOCqbbrwk7pM3N?=
 =?us-ascii?Q?9ftLDW21ilKFQSliEBb4wamg8Rj0NNoubU3tCYNbmPQFeCZQicy7tYC/gzr7?=
 =?us-ascii?Q?BJ3noGEyr95hezWarfBUgxNNUuvbFYUpudvmOEPiyN5Ell4ek79bJlJxsEBh?=
 =?us-ascii?Q?N4c73OmIONgwjkJ23wTLyTeX2GQ4ftXfKmBZdpecYQ/C89TV4auOZ+4BG+eh?=
 =?us-ascii?Q?NKJ5TAYMq1VDxsrCP31B3L/QdptyGKjMH/boI28cMdfIZoWg69EPP/WnNSzk?=
 =?us-ascii?Q?mtMmyW02aAttGKEgiZK2w6e58PmwgOATyG6BO6DMcEjvX5ZCUFtBPtgLvPHo?=
 =?us-ascii?Q?yvhXfVjWtOWK7BqcoP9Fpg4SZnpyQPUxy1JOQZsaZmJS6EUBhyhre2PoKWL7?=
 =?us-ascii?Q?Cx42k/M9n+lelNUeRMmNnTD0fnsRjqpx+6IhssxRPSi9ieXvFghFFfPR68Fk?=
 =?us-ascii?Q?uK9nyjKQr79KI3hMWnZ30TTvUzdtRV5apsSsfUtW8jTmVPt7brl8xm3WrpKu?=
 =?us-ascii?Q?cSMPUgzoktfHUKWY+uyhLU2py0Z9zeCAHlfcqO4+zkB6S82SgvCRdC1f5Ogo?=
 =?us-ascii?Q?1zgYYlRdlcvDB6+qZhO893tvPY5ZfsqcdUWuPxTsPQwJjbvqenDhAH0JtFTN?=
 =?us-ascii?Q?MO99IwmS9PFKHNClxFFEAjwIEVBFG8MWEWQG0/V7bfmf5SHz6ieFlh1uszw2?=
 =?us-ascii?Q?Oxcgn/S7bMNzGGarTXSTXqqHE5+IneuSAkNXFaYnMDylf7ozTqoJzIcO0LtS?=
 =?us-ascii?Q?dIRaUcG+dQQnxyoP14EZRHFdsC0sTNhna+m9KAI1uBZYEHfUo+FL0Bq8kIMI?=
 =?us-ascii?Q?MS7C6VrzjEqqrKjygJR/lSZBY3ayyLyZMB2PqjHhmwUOUWqetWrEU+H8TUE5?=
 =?us-ascii?Q?3mF0wcTg73WcOhY1ceG4vZlLx+Iz1Y2TQNCo13DQ1UJCISpoiUt7QCbew2Ra?=
 =?us-ascii?Q?9ftp9BF888swgDx1XSlaWO4fQmQEiiZHDq/jlBWEvUsK3qe4Wa6yCDROCW7D?=
 =?us-ascii?Q?hdmJjOsLv3zhQAtw3yRdK2cQepx07OyMCR6DNSwzmT3lJi7kuip8LHyrE7m3?=
 =?us-ascii?Q?HQI3ldzJ1wCKftO/OCFKTu7lpe0kgnCIu5Z6Pm3BhH+EurJKjVNe3Ogcpvvb?=
 =?us-ascii?Q?/8EntAbmw5ob5X1MgB9HZbRSYf0fl/tEap5GSMXmF3vdLlbcTZ2st4fmtfXn?=
 =?us-ascii?Q?Vo389wPXsKcQwt2e0SF+twVenJ0ern5QdVxVspZZcw1hKW0OPk0HdOvTF6+1?=
 =?us-ascii?Q?VcWDjaKu4KYVzo6YIdhrNcPRDnq/1IYrLtktDd2RSGo1fS3yITbJ8N7SrNeT?=
 =?us-ascii?Q?bsQFrQhPQvzlVuCtCzhUcIX4GVpw0E1/dIOEIACJB5sGPZgeJESmXBSCrOkk?=
 =?us-ascii?Q?UGBL+jsH/eu0dDtSgBJA3jFVOrdvUNrkrL8Rq06hZDTutBqtWlKmZLKGyM1H?=
 =?us-ascii?Q?RBmpSbc+4pRtB6avrlfvYeDRw4yciet2vx6ngNiIwipC8zJfUPC7Kj0N3aTt?=
 =?us-ascii?Q?BFRs7CUc1xnoLDOWVqlp2MTF3dWgNaFObSfXFKNm5Afkd+WIRkmEn95SJge1?=
 =?us-ascii?Q?8P+BBEXwdEjgy7Q9IBkFO9JEld+2TlgFjUHhhTnszc7Ra65pU/NHl8+UGnnP?=
 =?us-ascii?Q?JacKhCFtuqTF7osWDn6nDLA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB514457FCE1C3FE36BFBC7510F7229BL1PR12MB5144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5f10dd-e3d9-4a6a-fe5d-08d9e26c17b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 14:40:12.9909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bNGqFPdCkHa1F8n3b2A+Qn9JLI+idrrQBpA+yBH/9D7QcJ93+Ri5vFxUVq2vRw0CaBwI+EUYQpzgt383dwrlKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4821
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

--_000_BL1PR12MB514457FCE1C3FE36BFBC7510F7229BL1PR12MB5144namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: RyanLin <Tsung-Hua.Lin@amd.com>
Sent: Thursday, January 27, 2022 10:47 PM
To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.L=
i@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christi=
an <Christian.Koenig@amd.com>; David1.Zhou@amd.com <David1.Zhou@amd.com>; a=
irlied@linux.ie <airlied@linux.ie>; daniel@ffwll.ch <daniel@ffwll.ch>; sean=
paul@chromium.org <seanpaul@chromium.org>; bas@basnieuwenhuizen.nl <bas@bas=
nieuwenhuizen.nl>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; sash=
al@kernel.org <sashal@kernel.org>; markyacoub@google.com <markyacoub@google=
.com>; victorchengchi.lu@amd.com <victorchengchi.lu@amd.com>; ching-shih.li=
@amd.corp-partner.google.com <ching-shih.li@amd.corp-partner.google.com>; S=
iqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; ddavenport@chromium.org <ddave=
nport@chromium.org>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedeskt=
op.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>;=
 linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; Li, Leon <Leo=
n.Li@amd.com>
Cc: Lin, Tsung-hua (Ryan) <Tsung-hua.Lin@amd.com>
Subject: [PATCH v2 1/28] drm/amdgpu: fix that issue that the number of the =
crtc of the 3250c is not correct

v2:
  - remove unnecessary comments and Id

[Why]
External displays take priority over internal display when there are fewer
display controllers than displays.

[How]
The root cause is because of that number of the crtc is not correct.
The number of the crtc on the 3250c is 3, but on the 3500c is 4.
From the source code, we can see that number of the crtc has been fixed at =
4.
Needs to set the num_crtc to 3 for 3250c platform.

Signed-off-by: RyanLin <Tsung-Hua.Lin@amd.com>

---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 40c91b448f7d..455a2c45e8cd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2738,9 +2738,15 @@ static int dm_early_init(void *handle)
                 break;
 #if defined(CONFIG_DRM_AMD_DC_DCN1_0)
         case CHIP_RAVEN:
-               adev->mode_info.num_crtc =3D 4;
-               adev->mode_info.num_hpd =3D 4;
-               adev->mode_info.num_dig =3D 4;
+               if (adev->rev_id >=3D 8) {
+                       adev->mode_info.num_crtc =3D 3;
+                       adev->mode_info.num_hpd =3D 3;
+                       adev->mode_info.num_dig =3D 3;
+               } else {
+                       adev->mode_info.num_crtc =3D 4;
+                       adev->mode_info.num_hpd =3D 4;
+                       adev->mode_info.num_dig =3D 4;
+               }
                 break;
 #endif
 #if defined(CONFIG_DRM_AMD_DC_DCN2_0)
--
2.25.1


--_000_BL1PR12MB514457FCE1C3FE36BFBC7510F7229BL1PR12MB5144namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;" al=
ign=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> RyanLin &lt;Tsung-Hua=
.Lin@amd.com&gt;<br>
<b>Sent:</b> Thursday, January 27, 2022 10:47 PM<br>
<b>To:</b> Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Li, Sun peng (Le=
o) &lt;Sunpeng.Li@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd=
.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; David1.Zhou@a=
md.com &lt;David1.Zhou@amd.com&gt;; airlied@linux.ie &lt;airlied@linux.ie&g=
t;;
 daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;; seanpaul@chromium.org &lt;seanpau=
l@chromium.org&gt;; bas@basnieuwenhuizen.nl &lt;bas@basnieuwenhuizen.nl&gt;=
; Kazlauskas, Nicholas &lt;Nicholas.Kazlauskas@amd.com&gt;; sashal@kernel.o=
rg &lt;sashal@kernel.org&gt;; markyacoub@google.com &lt;markyacoub@google.c=
om&gt;;
 victorchengchi.lu@amd.com &lt;victorchengchi.lu@amd.com&gt;; ching-shih.li=
@amd.corp-partner.google.com &lt;ching-shih.li@amd.corp-partner.google.com&=
gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; ddavenport@chromiu=
m.org &lt;ddavenport@chromium.org&gt;; amd-gfx@lists.freedesktop.org
 &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org &lt=
;dri-devel@lists.freedesktop.org&gt;; linux-kernel@vger.kernel.org &lt;linu=
x-kernel@vger.kernel.org&gt;; Li, Leon &lt;Leon.Li@amd.com&gt;<br>
<b>Cc:</b> Lin, Tsung-hua (Ryan) &lt;Tsung-hua.Lin@amd.com&gt;<br>
<b>Subject:</b> [PATCH v2 1/28] drm/amdgpu: fix that issue that the number =
of the crtc of the 3250c is not correct</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">v2:<br>
&nbsp; - remove unnecessary comments and Id<br>
<br>
[Why]<br>
External displays take priority over internal display when there are fewer =
<br>
display controllers than displays.<br>
<br>
[How]<br>
The root cause is because of that number of the crtc is not correct.<br>
The number of the crtc on the 3250c is 3, but on the 3500c is 4.<br>
From the source code, we can see that number of the crtc has been fixed at =
4.<br>
Needs to set the num_crtc to 3 for 3250c platform.<br>
<br>
Signed-off-by: RyanLin &lt;Tsung-Hua.Lin@amd.com&gt;<br>
<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++++++++---<b=
r>
&nbsp;1 file changed, 9 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index 40c91b448f7d..455a2c45e8cd 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -2738,9 +2738,15 @@ static int dm_early_init(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;#if defined(CONFIG_DRM_AMD_DC_DCN1_0)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_RAVEN:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adev-&gt;mode_info.num_crtc =3D 4;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adev-&gt;mode_info.num_hpd =3D 4;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adev-&gt;mode_info.num_dig =3D 4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (adev-&gt;rev_id &gt;=3D 8) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mode_in=
fo.num_crtc =3D 3;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mode_in=
fo.num_hpd =3D 3;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mode_in=
fo.num_dig =3D 3;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mode_in=
fo.num_crtc =3D 4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mode_in=
fo.num_hpd =3D 4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mode_in=
fo.num_dig =3D 4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;#endif<br>
&nbsp;#if defined(CONFIG_DRM_AMD_DC_DCN2_0)<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BL1PR12MB514457FCE1C3FE36BFBC7510F7229BL1PR12MB5144namp_--

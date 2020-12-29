Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC39C2E7186
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 15:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A14D89101;
	Tue, 29 Dec 2020 14:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4C68909F;
 Tue, 29 Dec 2020 14:54:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fy3zPyVHuJx8rLsjcfNcwrlSOSENQt7dhBdEJ6kXT6RTr+seJMREtm/HVHoAxs+RxrLy6PaFxDImWOB6aWFYvM+2wLfXgi6YoBYGwNCEbn6eRiHfvNB3WiijCGHMjpBGyliA1tOAxIAbrQKexhGDgrVOLVvxqykMZs15hNXJiMpNHgjO2Q+YCalEEEQpGiCy+MzKE5KhQD4063XZ/o9CfurkefdYW1w9hAZPJe7rjAYvWS+LKO8Z9wMtKEZBUUrELIcblxlvHZWGb+8vKDxwGK7jR1GhkB71brQXKgOqHp9FE2jyFmaaahQOK738HTaYDFzrpzpyqpS8G9HzAt66Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l36LdGe0jadREC7AZgmJvaVS0XvMLlsRv12qHPvh3hY=;
 b=R6VB/UzUT66Wt7mgnyXzmJlM4jzY2uMFVS8bDE/ibkEH5a5B3VKtH19VGOPlAq/S7PuhEzUY2ibu+YJSMSE1oeDdwojsDYi7S5g/t502peknPlqw0tc51zMWAI7jtPpmFp4gSUX7LtR+zsfof/8AJdD+bzlnuJQtYcO5InqkWzILJoZVb3mIsKKi/2ZJ1+R4HA9bW43+Qd1PpIoUs1PTolI7oIZeCvaXOA8NPTYc6NTrWHloBnRXbhYWg1jSsRfW7a1aRpKubfJ6DEpL+Znu1SjN2Q91I+PI4vQLc2CIY0VSsSyKBAUiyYDJG02SBhOY/4wNR8uPMNeIbuEjU+3afw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l36LdGe0jadREC7AZgmJvaVS0XvMLlsRv12qHPvh3hY=;
 b=x6YfyK9m5LBBB64owcxb442Q/glTo3z2jEfK8zotjLOxpBnN0lm6bQN1BnYtjnZiXa+6Yy33dFToe9yis6ZllfEKcn/2yEeVCiu7a7qRFlP/lgI+LnJ56KkJnejj3H6ZXrT1jSl0F6lLh3cOe5DRZkTo8sGV5/8fvA9eOEJKMdE=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by BL0PR12MB4995.namprd12.prod.outlook.com (2603:10b6:208:1c7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 14:54:47 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::fca3:155c:bf43:94af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::fca3:155c:bf43:94af%4]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 14:54:47 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH AUTOSEL 5.4 006/130] drm/amd/display: Do not silently
 accept DCC for multiplane formats.
Thread-Topic: [PATCH AUTOSEL 5.4 006/130] drm/amd/display: Do not silently
 accept DCC for multiplane formats.
Thread-Index: AQHW2NHkhN4MzVxT606iF0xiPNNptKoOMxwD
Date: Tue, 29 Dec 2020 14:54:47 +0000
Message-ID: <MN2PR12MB448885CD6421AD53DCF46EE8F7D80@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20201223021813.2791612-1-sashal@kernel.org>,
 <20201223021813.2791612-6-sashal@kernel.org>
In-Reply-To: <20201223021813.2791612-6-sashal@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=True;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-12-29T14:54:46.420Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=AMD
 Public; MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged; 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.78.241]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ae002fb2-925a-4498-6f0e-08d8ac09af70
x-ms-traffictypediagnostic: BL0PR12MB4995:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB4995FE91910899D1BD5E9D06F7D80@BL0PR12MB4995.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AfEa3GhsnaZbg06m8IJaW/s9ay49DGHxxYo49ASj5q+eXLOHi7VERwGBUBR0RiEiJs5oct9tnts8AJBYe/ubEwnqC86Z/VBl5jcsKihvTtqs9jxPMewIFsmJ924l2FhxzQ9h1vQijtS7i+xM8vBtoqWCOCK5tNK0o/sNp/S4EzLt3dtyqZ9if4ZxsUgvPHdxbVGc9DxUW/Z33U1+b86uqb4CI7DLRk42ujB0N+tgJKnsSB5MbnNj28HRRkxxaNiIBakY1W1KYOBSordeo4g1tOIK3edeupsFiysGqZbwKNAYdTREGHgmnDC8RNNvyR3kShpg/CKe7ALPxDhke08my4uuGmYC+fwUVzJVBJqDGHhO2eDvU9ay3uTz9fuAzavxYC9PGzj5BXonq/NEDt76xdftVreMfKSPp5JkrOeiXOE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(966005)(83380400001)(64756008)(5660300002)(9686003)(52536014)(66476007)(186003)(86362001)(66946007)(33656002)(6506007)(54906003)(26005)(166002)(110136005)(4326008)(8936002)(55016002)(66446008)(76116006)(71200400001)(66556008)(2906002)(53546011)(45080400002)(8676002)(19627405001)(478600001)(316002)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Tyi2E4eZgme9s155AUdeTgEI3+84Xokd4btc1lQcD+Ju2IA4rdnx8Bbe90bg?=
 =?us-ascii?Q?XbOSOD3FR/MiDs233UFlQ5fmFKDt8CIdmGWQLnpjR+wnGRPCBLO3k+k0jSlX?=
 =?us-ascii?Q?AQdSC3xkXVdmUV6DE4tVHIK0SOq6CK4LonTwK0klQlTx9bLhBM021xH6xfTx?=
 =?us-ascii?Q?KSh/QRmH47C+LoslWX2IuDNFUumvjhzefTOatEWWEzdNNMzQCPgBzzYYJa7G?=
 =?us-ascii?Q?yRVAoy/c1w4vmmRRIpVsGWa2GsTZQeybmpQgiZvSscZ7q7kGsHxZdD94/NqP?=
 =?us-ascii?Q?WF7e+qcUt3fOn+lrxGYHd5mJEl9NI10ZSrlXsezZ/kRVuu4l3PVgkYhf/W7L?=
 =?us-ascii?Q?0sZEzgGjnnSHsMlf22/1qb2CPPxdhfjLzg3PD4tX1jVDOk7h5O6MVujSlhvM?=
 =?us-ascii?Q?8h03EZ+1cXo6LuxU6OWr6VcteKii2Kq/k43ErtKGcXZBze0c3EIjYEfikk6z?=
 =?us-ascii?Q?lZsaQiq5YfhIZ4tmaET9Ubko1nSuCPCMYQe0psyqqYmHnPRyDsh8L4QtnDFO?=
 =?us-ascii?Q?L+umYdr9oVMiMDN/vsfFOyl5zGvV7QTFyRwgmnSlc/BNNfDNliOZOumh0reU?=
 =?us-ascii?Q?1lU4oVnrDWjWU0HOZsh0o4b8V3OEejy8G+eeXROdpH3hVVC9RYQkTHc99uSO?=
 =?us-ascii?Q?0QiKk12B3CyxEPZyN53K5JC0Xkl0fXPKr+b4JIkxBxmBZoSYBmm+kCptxYL1?=
 =?us-ascii?Q?bcIb3F7ovew/vT9dErHC42boYqiCQcW0n/C2mDQiQeHd7bTQIvhC2hdtrhJm?=
 =?us-ascii?Q?nVhD7Vdt7nuwnS+8MVf6IfNwo/sXUyNFTovaHzGtGlUOuyRxUN+d1tO3EZYK?=
 =?us-ascii?Q?eHqw4CYyRTCAvysQBAwpp7OAUqjIjvlLY2VHt4Dc900CvX9lMpFRHskwd1V0?=
 =?us-ascii?Q?KZ+GuqZUG352eiPPluikGtTnZ2Rvb2QVf7evU5pbEb8LPWK5a0G4sPQOZVhK?=
 =?us-ascii?Q?LlTIe6bIqx8I0Wnf/jYTeuFRgwoquzgvADL37KJDddg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae002fb2-925a-4498-6f0e-08d8ac09af70
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2020 14:54:47.0491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kK76bbo26yhhuPYjbImf7MeRwmXyrCNpcqGA+LZZM0IfxYBt7RFRepS1yHDW39c5FWECd8EHFIOq4UjZa1nS2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4995
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
Cc: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1910836727=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1910836727==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB448885CD6421AD53DCF46EE8F7D80MN2PR12MB4488namp_"

--_000_MN2PR12MB448885CD6421AD53DCF46EE8F7D80MN2PR12MB4488namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Public Use]

I don't know if these fixes related to modifiers make sense in the pre-modi=
fier code base.  Bas, Nick?

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Sasha Le=
vin <sashal@kernel.org>
Sent: Tuesday, December 22, 2020 9:16 PM
To: linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; stable@vge=
r.kernel.org <stable@vger.kernel.org>
Cc: Sasha Levin <sashal@kernel.org>; dri-devel@lists.freedesktop.org <dri-d=
evel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.f=
reedesktop.org>; Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>; Deucher, Alex=
ander <Alexander.Deucher@amd.com>; Kazlauskas, Nicholas <Nicholas.Kazlauska=
s@amd.com>
Subject: [PATCH AUTOSEL 5.4 006/130] drm/amd/display: Do not silently accep=
t DCC for multiplane formats.

From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

[ Upstream commit b35ce7b364ec80b54f48a8fdf9fb74667774d2da ]

Silently accepting it could result in corruption.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d2dd387c95d86..ce70c42a2c3ec 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2734,7 +2734,7 @@ fill_plane_dcc_attributes(struct amdgpu_device *adev,
                 return 0;

         if (format >=3D SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
-               return 0;
+               return -EINVAL;

         if (!dc->cap_funcs.get_dcc_compression_cap)
                 return -EINVAL;
--
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Calexande=
r.deucher%40amd.com%7Cfb9f2581393f494acd1708d8a6e905fc%7C3dd8961fe4884e608e=
11a82d994e183d%7C0%7C0%7C637442867044150000%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdat=
a=3DZYz1FjTl6SoWX1B91t0McdUai%2FzRF9C8uBmE%2BNQNod4%3D&amp;reserved=3D0

--_000_MN2PR12MB448885CD6421AD53DCF46EE8F7D80MN2PR12MB4488namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#317100;margin:15pt;" al=
ign=3D"Left">
[AMD Public Use]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I don't know if these fixes related to modifiers make sense in the pre-modi=
fier code base.&nbsp; Bas, Nick?<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Sasha Levin &lt;sashal@kernel=
.org&gt;<br>
<b>Sent:</b> Tuesday, December 22, 2020 9:16 PM<br>
<b>To:</b> linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt=
;; stable@vger.kernel.org &lt;stable@vger.kernel.org&gt;<br>
<b>Cc:</b> Sasha Levin &lt;sashal@kernel.org&gt;; dri-devel@lists.freedeskt=
op.org &lt;dri-devel@lists.freedesktop.org&gt;; amd-gfx@lists.freedesktop.o=
rg &lt;amd-gfx@lists.freedesktop.org&gt;; Bas Nieuwenhuizen &lt;bas@basnieu=
wenhuizen.nl&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;;
 Kazlauskas, Nicholas &lt;Nicholas.Kazlauskas@amd.com&gt;<br>
<b>Subject:</b> [PATCH AUTOSEL 5.4 006/130] drm/amd/display: Do not silentl=
y accept DCC for multiplane formats.</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Bas Nieuwenhuizen &lt;bas@basnieuwenhuizen.n=
l&gt;<br>
<br>
[ Upstream commit b35ce7b364ec80b54f48a8fdf9fb74667774d2da ]<br>
<br>
Silently accepting it could result in corruption.<br>
<br>
Signed-off-by: Bas Nieuwenhuizen &lt;bas@basnieuwenhuizen.nl&gt;<br>
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
Reviewed-by: Nicholas Kazlauskas &lt;nicholas.kazlauskas@amd.com&gt;<br>
Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
Signed-off-by: Sasha Levin &lt;sashal@kernel.org&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index d2dd387c95d86..ce70c42a2c3ec 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -2734,7 +2734,7 @@ fill_plane_dcc_attributes(struct amdgpu_device *adev,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (format &gt;=3D SURFACE=
_PIXEL_FORMAT_VIDEO_BEGIN)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!dc-&gt;cap_funcs.get_=
dcc_compression_cap)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
-- <br>
2.27.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D04%=
7C01%7Calexander.deucher%40amd.com%7Cfb9f2581393f494acd1708d8a6e905fc%7C3dd=
8961fe4884e608e11a82d994e183d%7C0%7C0%7C637442867044150000%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;amp;sdata=3DZYz1FjTl6SoWX1B91t0McdUai%2FzRF9C8uBmE%2BNQNod4%3D&a=
mp;amp;reserved=3D0">https://nam11.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;=
data=3D04%7C01%7Calexander.deucher%40amd.com%7Cfb9f2581393f494acd1708d8a6e9=
05fc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637442867044150000%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C1000&amp;amp;sdata=3DZYz1FjTl6SoWX1B91t0McdUai%2FzRF9C8uBmE%2BN=
QNod4%3D&amp;amp;reserved=3D0</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB448885CD6421AD53DCF46EE8F7D80MN2PR12MB4488namp_--

--===============1910836727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1910836727==--

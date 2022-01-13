Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1972E48D92B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 14:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6301124F4;
	Thu, 13 Jan 2022 13:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0711124F4;
 Thu, 13 Jan 2022 13:38:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ev/fScW7fkHwiUxcS7TCqX+b/aOnsUBGkHlYu9v5n0YmgGRO29uCtypw0GF6AMhAxOyaJT2T4LpwUEQB+AwlK8hBAYTbKwvDskc4kQxLFZ/SXgoeXw5cSt1REb7dmlqpNqdoPuoy1Qnm/UdKiaDQEBZHndt9YZRZxWRuCBuiaqXjTIm6wzky5f/SA1X2SaQ/oOH33WIXkqGBHOxEUMtJCEwwMNhJZEDMI9Y8PqZAkNlNLiR18I/fR0J3u6pFEIqX+znKDiJHbmOQtRAthhzRvIXGUY52F8i3Wer8pkEU0wOanvAcTjR5hKXRd9FpL1IKp65zh+qlr3S1tKz956UAtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPglWRqMAZ3hTMCF5nDYBijXc9N7/n7m3j3RzFw3oLI=;
 b=CM9pkiLkd6RZIOYM6vp1sT/BvVeZQYcKyyDki6uc0asxQ3OGprsTffuQ4duLU4grVP3OcG1n2ZEUYfG8Gi9maeqsJZtzyI8Edph/n7h3RASL3Gj4UnuecNIx+BO+QpGxokgS3iWMP59DPdsMZu5DMXspOYTirJw+lqSPrc+oRvBtZhzIa3UnGyZW4filicIKISacg//+vZyWZBocZZmSLFMBciQBZgZioT3C5LsVrJ0jZde/hJwkvGUQLYiQEAVCzPCqusbTEjJ6A+QXD5IxmnP9eoe/euq/zH9MRMHozX9acduKAvanx67TxYZ8/G/JQtr/zz0Ub2L0mn9aWfGEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPglWRqMAZ3hTMCF5nDYBijXc9N7/n7m3j3RzFw3oLI=;
 b=f4jo8RGiFCnX43nH+WETcWFxrVugGKYNanIUQm0tS8+wTcUPax1tPchlGUn2tO9ZKGpJBuQ1JDKh8HPhZY/EHG8wnVZIpU8siu6ebxcWZW9nFfyLwJvsNicxmJ+O53up+gO67m8DSNx3AyNUnn4syToTwppgiXyW6cm5ZV6IUv4=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 BL0PR12MB5011.namprd12.prod.outlook.com (2603:10b6:208:1c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 13:38:37 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::1500:4b8c:efd6:672]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::1500:4b8c:efd6:672%4]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 13:38:37 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Yang Li <yang.lee@linux.alibaba.com>, "airlied@linux.ie" <airlied@linux.ie>
Subject: RE: [PATCH -next 1/2 v2] drm/amdgpu: remove unneeded semicolon
Thread-Topic: [PATCH -next 1/2 v2] drm/amdgpu: remove unneeded semicolon
Thread-Index: AQHYCEzPNizi1d5FOkmtgDT5jd+N3Kxg9Qvg
Date: Thu, 13 Jan 2022 13:38:37 +0000
Message-ID: <DM5PR12MB246922D4EC5729F76E481CD2F1539@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20220113071132.70647-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220113071132.70647-1-yang.lee@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ada8f9f1-2ab1-44c5-4cd2-08d9d69a0096
x-ms-traffictypediagnostic: BL0PR12MB5011:EE_
x-microsoft-antispam-prvs: <BL0PR12MB50119DA03D762C615572F116F1539@BL0PR12MB5011.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yF8X4+3bxAxiPkgGkyCldyvczdblDVqzS5UTRVGIr8h2lyT92DNaK9y8D8LD+IMXdzWvftAAIYX11eD5rh2DGMxYHtKVMnmR14eW+scuXCnGSL9aX7i3xjaSRAViT4q+zKEi3I7T2DaKLmL/jQ9WZpKJ90TaeleBGgyyZWTztNIky+WW0/2J3Ivrd8oJ55hEzGg4KfBY8ipKnPb+elH2cIMD0S4PG6cAzFdQVD8B/UkoZQoOPT1ecLBEJB2OnTS0NYKAr9aj9uc5ksaN/5xgFzQJBb9hrVppqHjO8IyObLty4FbWITPAr+MGhINrO5Kx1TOTwvJBQHU2pWiZMIsb2Ej1mOg9AryGnDMjA53YCBPscbpTcZowcvPHvnI35sA5P/3QADJsh4+NRn6A+Nq2/QUeM49+J21sD2c1Ro11C646tQqkNir0hwP+S/Muhj83dkVbo1FxpN3qu9PrknBsLMYDIIMwEAeQHEMS337JEIsPUoYCkZPOLz9HOYsaHhknsTsYJIZv0wh80b0+1HtEpsi/UiP+w+nBBGf+Q+/7c4ODmc1lLq9JppmcWU67ufsksUp3BmEpVLpeT3iGyrngiMfnEhRgQLIj/UXVmhdiHxlmKG1HNRKujMTHqMztFUFE4Y77Zo4VJnZYI+G1fi8SKgdRqrXxiNn+6YpI4+ME+W2yKbBJaj3jMtq3OvDeGGcX3D3AtGK3WCXVahIMT2JYiA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(76116006)(66446008)(66556008)(66946007)(64756008)(186003)(55016003)(86362001)(26005)(508600001)(5660300002)(8676002)(33656002)(7696005)(83380400001)(53546011)(54906003)(8936002)(38100700002)(9686003)(38070700005)(2906002)(6506007)(71200400001)(52536014)(110136005)(4326008)(316002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IZoOPUfV5/U0CcmcpHjPWJivgIL1zfZbjNm3KMONmUdCofUrWh59vHS7A2i9?=
 =?us-ascii?Q?X82hihcia8kMrEUIvcSYj76cx5klnglot5TcCToPHPyAj5SQ2+bxvNlL3jbf?=
 =?us-ascii?Q?5cJCfcF7n2HduABElnF/jg70ZKgeUelEuvQA1r2FNNUAKZDDtwVBCcxCLctw?=
 =?us-ascii?Q?vQpkCZdi3Wwiw9bsujzZB7RxRFj7X/fFdmpF6tHKQ+Wa0qXK2iTaWuQtJ9ZN?=
 =?us-ascii?Q?Mne4Zr3U5aI2OY7mOR1tSnVvXzPTiTWXUJvKIR3YEvXSm7ejexNiZpzDjIqc?=
 =?us-ascii?Q?KJgeX8UdHZ7jWDcBcgjb38fpxUHupVEXHxpVvTIJKbRYl5YkHTnWFvTK2Bzv?=
 =?us-ascii?Q?GWKbi8t/vlIhiSYmfgs1T18tfcp5IL0i/EKRYjfOTgwS++GGkot/S4lm0reV?=
 =?us-ascii?Q?zZQUQ0XfxYpuxTo4PxhGHqIC98iVf+W8S42z2yIYyemqcx/Jgvu9Qo0WEsBN?=
 =?us-ascii?Q?70drH9m1mcvCuMtzi6P0et8pzXU0/S55bb8BzsySNIEKf7mURADkNFvN4vct?=
 =?us-ascii?Q?gG8lmPX0M7STQ+LlnkWT4NIEdIAiPYbjrf9HD6is3D3FWqQinqVJDz0ec8Z/?=
 =?us-ascii?Q?z/ok9o/3DzNaI8uNhzOUXJ/bKrcs48urdd58C9+2hwNxwcYPrTDDWkzj2Gim?=
 =?us-ascii?Q?DV1YVJ1lwl2RYDp9lUyUaozqa7n6Sp31NRPvVJ5WySiGljq6+gAryZ96GPlZ?=
 =?us-ascii?Q?pdPQ3oGFSQnLaQcdlaaWoGtU66uBgndBR0vhXNQmg7zCwZexr7H3t0VMBb+g?=
 =?us-ascii?Q?7mdqtqgv5GS9KbAqVJT140mqxMl8aKsZKwycZSDI9HT47bLzl9vtof14iYiE?=
 =?us-ascii?Q?MhMbVH+lR0IUcu3gRvCsVcXI1oXYTycbiWWvtsM4FwTxZ/dmZkqLHH8fAN5q?=
 =?us-ascii?Q?sqK15bRhSwrmlEQVHY2rbQcVX/DQV1Ehe4u3t25tibmxY9A2FqBl8HYnlf9c?=
 =?us-ascii?Q?4cR3YneUGpeLwNT95i52NAhNVWRjBMGBcGjNjH1S+SWfozQfrYTME5dbSvGD?=
 =?us-ascii?Q?uevV1//A/12e04KYbetWbTFPzcY47niMWBHPB20BPiXUomlQ/NY4KhgFlp2X?=
 =?us-ascii?Q?O/QsbHYPOEL8PaiMcBoGzdFMxslxc3iv1cmyyeN8dFf/hBzcHOmdbyq76J7d?=
 =?us-ascii?Q?mNy8/c2tvsprAXKd0b7gRehHF9cdp779fF0TuGVqMEvSnFbwxX6G7nfG9/RY?=
 =?us-ascii?Q?nQazNj7+ZCl6m6If5xiijEZWVtlksvQUgB+1lGG15+tOK20zH7Cqgsym0dJw?=
 =?us-ascii?Q?6OGNDZ3My2h0UbZNtozjtg23Vihg5o3hc+Rs5Uwf5B8Uhj+qlWBR9Z9GjjyF?=
 =?us-ascii?Q?+aeVkn9H96Cb7xRQcluq/dJypwzFIPT5tJaKabGymMxIFXpiKGhUpOmec/1B?=
 =?us-ascii?Q?rJEKBHKDJ5pMYr9NxcPdKaVZwqN79FbzHUe40/C/09US4oI4X+XVfktByjZi?=
 =?us-ascii?Q?6MnkeYC2qFdWGopq4bpM7/0RkUwVTL49dtcyZsYt9AryAmQZNMohwh7cqyNF?=
 =?us-ascii?Q?+FTFiNZ9RA9jplUBnuGjYbFEO1N+du9OFvGPqROJB/Y17R6xK2sFWHlKlGTq?=
 =?us-ascii?Q?Q7C3dS3unS/3Zv4nzE0hi4WVTVuRMRbVmRaAAMTVPnikcosRU2+LO3UxcbIm?=
 =?us-ascii?Q?yF5ujQPawR41r6eT+2qavYY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada8f9f1-2ab1-44c5-4cd2-08d9d69a0096
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2022 13:38:37.2012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wT8EWAhg7DP0Mn71z/kcgs6BGfDlS0Yz10MJxf8t8QLACC1dXmwvCQTfmOZT+dspSwv0YJxHjx6/vihM+5DBug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5011
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Abaci Robot <abaci@linux.alibaba.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is:
Reviewed-by: Guchun Chen <guchun.chen@amd.com>

Regards,
Guchun

-----Original Message-----
From: Yang Li <yang.lee@linux.alibaba.com>=20
Sent: Thursday, January 13, 2022 3:12 PM
To: airlied@linux.ie; Chen, Guchun <Guchun.Chen@amd.com>
Cc: daniel@ffwll.ch; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig=
, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; a=
md-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel=
@vger.kernel.org; Yang Li <yang.lee@linux.alibaba.com>; Abaci Robot <abaci@=
linux.alibaba.com>
Subject: [PATCH -next 1/2 v2] drm/amdgpu: remove unneeded semicolon

Eliminate the following coccicheck warning:
./drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2725:16-17: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c
index d4d9b9ea8bbd..ff9bd5a844fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2722,7 +2722,7 @@ struct amdgpu_ras* amdgpu_ras_get_context(struct amdg=
pu_device *adev)  int amdgpu_ras_set_context(struct amdgpu_device *adev, st=
ruct amdgpu_ras* ras_con)  {
 	if (!adev)
-	return -EINVAL;;
+		return -EINVAL;
=20
 	adev->psp.ras_context.ras =3D ras_con;
 	return 0;
--
2.20.1.7.g153144c


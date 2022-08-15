Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA2593089
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 16:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E604B3517;
	Mon, 15 Aug 2022 14:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B120691A6D;
 Mon, 15 Aug 2022 14:15:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btkq2GHZW64hjlLjoukJborBUZpXTYP76PcHhTlKvP5MyGLPbGvGuw9LHZtb8FOhXuWlJqxaWDMbkwgVKOI0tkIFvtE6jeUDow3Rt5C06CwKOL/CQukVmZvykT+xWwTLLYZlTzEddhqHwRgy2ATKdlmazrKeD7jMw2N4+ss5Pr7fnCqjU0h6vJ0iiPor1H137Dt5SSDYrl3aQ96ZfWimuZJ8LJfXvCoUpb6S6INv2dXyXQsSRx9tqCIFrUI8LRMWBX4gVNK5gm/tVE4m6eoLKpJHAT91ozReJwINSmymLthGXZEcdUWxGx1ZKbxwG0U0tZhDSw6mrPQM3VB/2PLgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xb8e6Ra2FCuG3msrZAuA2nNavwofwj6iVRkCwgiINx8=;
 b=cRgHPS38ASc4dk3Cxge0fhReGxv5imMj1dbc6lCHhAZOmL3/WcVbbKDIC05EmSweTtLRkOsBp8fWJa2sBs2qvX1RuxxZJjppOgR9fTPdS/8SPmVNNnbf6KsREdjFH6hOpyY9cpTI/P4tBVhKB23ePQFAmATys4J+ClJHym3aZ0VrQzgQ0cuurn5MvUI9C+F+1eEF6Rf0P17jtoIxl98s1NqiXlXsE0y139+fWXIIV9j+IpKajYevnNNQWwItce3+qGbv1/lo4hDF4KaO9DulcQZ3c3AkbUrXlrtuCiAkkyLdyctpy2LK918uXgETPNscgx81eioEOJdeK+mclIQIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xb8e6Ra2FCuG3msrZAuA2nNavwofwj6iVRkCwgiINx8=;
 b=IefYeyUnpTP9k2uAD7aXGfetaEnA4YCs+o5094xCbEgJVs1zanY2BZMCpcTE8YQvtGPgNpheB4pggP6HtW378YeCO7fb9fKzBIhfp6GPHwsrb+eHrmD9W2temB75V9cI8bNw6CKgLUmCL4LcS7GP44nFj6SVX6WqQVZtI1/YFrs=
Received: from SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12)
 by BN6PR12MB1476.namprd12.prod.outlook.com (2603:10b6:405:11::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 14:15:50 +0000
Received: from SJ1PR12MB6194.namprd12.prod.outlook.com
 ([fe80::bc88:3db6:f931:98fc]) by SJ1PR12MB6194.namprd12.prod.outlook.com
 ([fe80::bc88:3db6:f931:98fc%5]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 14:15:50 +0000
From: "Dong, Ruijing" <Ruijing.Dong@amd.com>
To: Khalid Masum <khalid.masum.92@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: RE: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Thread-Topic: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Thread-Index: AQHYsHTWuO318jhUpE6H84biXg/lfq2v+0Dg
Date: Mon, 15 Aug 2022 14:15:50 +0000
Message-ID: <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
References: <20220815070056.10816-1-khalid.masum.92@gmail.com>
In-Reply-To: <20220815070056.10816-1-khalid.masum.92@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=1ee40afe-175f-49ed-8d70-e0de6c1fa9d1;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-08-15T13:51:12Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec37b68c-2d74-465b-8f74-08da7ec8a7ef
x-ms-traffictypediagnostic: BN6PR12MB1476:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M2NX0+OYDGFVcvfffRKhILsEvMILezKBH0PXgU61khQILeTejHYVwzrJ1s/bY3F7XY3412xCrW1DpOVnlR27sdM4nGs4Rzzn/YEshJy7L+Kr+itl0E4XooK08OV5ltuUUtB9fSBAFK0tb5t9YbI9k2K0nzzIi7gv28i3Kz3KX2TTayTy3EPfuNdKyiKxwlniLYjwn+IEq2gy/tYOADgqwL42+HNrQajtHwPTl5oJF3wa1PcIFUWQg8HNFMtgGoOTTt/RvPqJ5RdNg3VGtnf7oYtQGrHg8v4+KRPD47guRtFtleKvl03mRfZjFX15jg6OK6FtmE6xU92LmSjpquD5BFA6WaAGvY5c4Wq5PD+AzuUZDxjvrcfFoAAcXUQUPv02r1QosW2xhZ9+b1Tn4g1sBMiYzdQCZddMjM9hzJt6+hFhQezQuvbfiDiiRVXUzExQrml73Oh95wT0VyQGCkfJqmDmW1J8kzFp0/7R3Z9+XXnBKo3u9RDfgC/5kTB2XP6pHdX2OHbv9m60aNJQV/B+s5GwEIfYxh8KHkvButv1z5vDZ4viJspRM7zi1QqKl8W9xVAHuwD42zhvlJIGlMd7fJGDSWq4rpP6teSRKYDD3dW2E5TfT4HHWYIS7tE1b7U1aDKllEcwfZ3M88jqNz5OHht4A2Gdfm3czeQKgP+zdljL7X5V3S8Pl8lle9jdETib9kwZGyoOlu9w0KUb9DKU292IdjkQvf2F5LVjpv3ciwHz9q/JmRNQyBQGZeE/x5elMTbV7+BGtzaJiucEXIosur7Bs/Rp5ihs71J9r1Zwdhg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR12MB6194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(54906003)(5660300002)(52536014)(7696005)(6506007)(53546011)(9686003)(41300700001)(86362001)(26005)(8936002)(71200400001)(66946007)(38070700005)(478600001)(66476007)(110136005)(8676002)(316002)(64756008)(66556008)(66446008)(76116006)(2906002)(4326008)(122000001)(83380400001)(33656002)(186003)(55016003)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YJ6jSFrBa5AwcpEstkwKivdikORk7p6srKSG3BlNEcdNUEhKVzHsdTuU95/h?=
 =?us-ascii?Q?N2YambKTQzJUkvxO7v+pfb0jp/GsH3Hk4JCZZ1D/KTCm8/GTN0+r9OSZwP2j?=
 =?us-ascii?Q?5xDDGOd9VlhYaMJ9WBWLPZHh8ZGkhEduW79kogDdeZrNyxbjzSavITIOj5xW?=
 =?us-ascii?Q?squxQUVGTeiWEwicyfBS+HGlHC8JuiY2H0JsrKM3hDTWKbeEgISooNjMHcM0?=
 =?us-ascii?Q?I4vqNnHNeV2oyAMhACW/kNunU3r/3IRcZaVDjCYotVDufWjAvDrd8qYGY75v?=
 =?us-ascii?Q?X5x41wLaI/1zZKfp6DQ0LbH4/FvGpl34xhVdcsstvfCaF6L38Z5WEGaiNEYT?=
 =?us-ascii?Q?CSPS9vqWMcD1OrJt/TmJTTUVWl1ONThjOaic9Lp85j2KaDbBqT0uSDIj4fBB?=
 =?us-ascii?Q?IR+k+bV6/qduBosTMJaFEQ2bc2gEuP2UG4f5vbv/ynnJG44gi/fq1vSUA2AS?=
 =?us-ascii?Q?4d2hw5KaaT2NCnn5MpSSVEIzOCBPRf3Q4/CB9e4Y3t4Nc6fXRdB30L0QrBXF?=
 =?us-ascii?Q?AJS/K73Gtu+jDXb2owRC3DxcRUmIYI+HrB+Fquv5uDIyTgshX00E8Llz/Eq+?=
 =?us-ascii?Q?A+CGB2sCvsTsGJG8bARCIgWAt5wFEvJtP66Fmig7pFbvNqAXcsw2+ENiXnVc?=
 =?us-ascii?Q?2RH7xBBY5sn7Uhl/LrsaX6T57W7ZzCDf8OXrV0XBqmiJ44N7Ypdz3JC2l0o0?=
 =?us-ascii?Q?LpJldXYjxJaAvvKs+yAS/IszBVs4dYY6Zev3KbDiov1KOg1cQvGr7m3TYn+E?=
 =?us-ascii?Q?gCeO0U8MMDDzFWdfc1wO8DYX0VOQdMLmeh/HXE3R1xg0+3NlOHobGVaEIpR/?=
 =?us-ascii?Q?l5AF7kxXn6WUKMCoa9LHHNJvGGVOAGN4uo9auYXvLsIPGkfxTPNyKOCfZy+A?=
 =?us-ascii?Q?AdvPIOpOE/WGk7heQLegoBn9R+5J+OsrF/QaJ6XSMCNp1VenGor0ZEWSiQf3?=
 =?us-ascii?Q?kMoEjqIn1wZWqaZVtGhqXzn+sjh7BSihI5AvjiH/jeWWYOpIFC3lMUbphF2E?=
 =?us-ascii?Q?5fL+8trwKzCjpt73xblmDp52RtWUr0haBic/7uJxLpjGPgbj6NpNw2WeHL72?=
 =?us-ascii?Q?/aa6rFqDyy50LlQtKt6jJPCvBcsLlhUEhhqiG7zrMUMfuZbyLSXOMmnb/z7s?=
 =?us-ascii?Q?IRQbQ88xzxRNJ4GynT/w3qyVpg2YV58Ve2mGDb+lK2GbNk2oRcEFWNSfD+Ff?=
 =?us-ascii?Q?2wbQ0A0oKJjR0O+FxvtjKtqb32vheONIuEODWS9QCe4ulZSKL9xaV1KjwBFu?=
 =?us-ascii?Q?Zm42oj7HgZEZcNVYr4tWFi9kKqlP7nS1OMhTtucSHG3SX0f/00+euURrHE1K?=
 =?us-ascii?Q?LgL1RLR/iqxMS909vadneKU5pyA/uJLKtxBkVOxGBqDxDMFJ26TEBArYb11a?=
 =?us-ascii?Q?i/yHhEn3EYB+1UvEnxtb8dLQzzLEaINsvEsnigW0KwUcyRo3PpA7BwbDW89X?=
 =?us-ascii?Q?nWdweUhJtec4acNAx5bO3L+aUGDzV0i8TAtzo9OASdVvOyacfq3nd5w2Wdwy?=
 =?us-ascii?Q?S7AAo6gAviB/CPB+UtQ/SybHeX4OTD+9m6rcN6vVqy5b5CGLLUSCV+AkALPg?=
 =?us-ascii?Q?0VJCwMRm5ugAEXyyDzE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec37b68c-2d74-465b-8f74-08da7ec8a7ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 14:15:50.1775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShQfY29Qw79jX08VlseZfkFpPngtuVgCZSrQwX4aKAaH3buTnsCjeUtyDA/QklFz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1476
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Jiang, Sonny" <Sonny.Jiang@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Sorry, which "r" value was overwritten?  I didn't see the point of making t=
his change.

Thanks
Ruijing

-----Original Message-----
From: Khalid Masum <khalid.masum.92@gmail.com>
Sent: Monday, August 15, 2022 3:01 AM
To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org; linux-kernel-mentees@lists.linuxfoundation.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <airl=
ied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Zhu, James <James.Zhu@amd.c=
om>; Jiang, Sonny <Sonny.Jiang@amd.com>; Dong, Ruijing <Ruijing.Dong@amd.co=
m>; Wan Jiabing <wanjiabing@vivo.com>; Liu, Leo <Leo.Liu@amd.com>; Khalid M=
asum <khalid.masum.92@gmail.com>
Subject: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in vcn=
_v4_0_stop

The value assigned from vcn_v4_0_stop_dbg_mode to r is overwritten before i=
t can be used. Remove this assignment.

Addresses-Coverity: 1504988 ("Unused value")
Fixes: 8da1170a16e4 ("drm/amdgpu: add VCN4 ip block support")
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/am=
dgpu/vcn_v4_0.c
index ca14c3ef742e..80b8a2c66b36 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1154,7 +1154,7 @@ static int vcn_v4_0_stop(struct amdgpu_device *adev)
                fw_shared->sq.queue_mode |=3D FW_QUEUE_DPG_HOLD_OFF;

                if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
-                       r =3D vcn_v4_0_stop_dpg_mode(adev, i);
+                       vcn_v4_0_stop_dpg_mode(adev, i);
                        continue;
                }

--
2.37.1


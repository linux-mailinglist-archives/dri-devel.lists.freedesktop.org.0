Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5855E5867
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 04:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A8010E0F3;
	Thu, 22 Sep 2022 02:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2055.outbound.protection.outlook.com [40.107.96.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E1010E0A2;
 Thu, 22 Sep 2022 02:11:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrpKtJFv1MGDPQAc/xb8FSTrKmSFZsqad8zLdrwnnIrdu/OR1Dc+WpjS9kzMv8nrsyxqIQ/mggj3qNXKAtUm9WsWkZuLPfHo/nDhSF+8aJw/vf24V50qp5THGLaoC8bNIF+8mAptwxU/DFsrRwa6t6gv0PP5w7birYSnUjPLee98D6vtKvPgzAAaeavb1ECleoqVoK/vj9cFDw//zb3ysoI98bftm5jiPo/dOD/eIQuaQbIUZbohrH/9mIi+ZLiUOptaOhMbDetP/g80sz8cmHtM8ZOgI0O0Cax6NwSZkuDeQDT2qWVj9mkU4iaZp4XS/6T2/NakdRjEupZWRUOisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHMT15LZxhIZUie8UncLLPRTGLhw3Qx6F7+kF4zKJZw=;
 b=m0E0FNC/HxLi+PhuLEPo4U+nQ4XhKt6ruc2U+QjT01eE/GtWdTI1EBNvBW0+ivL5lHojoEzUcDPTBDmaC/iqndhn7AWykmYx+rxkKDm3xQf/dxRo/G4HdlhKmZwbfReKFS7I4aUjw4I/MUUOxgVvWwRflnXrEf6VX6YeFUC7j05gnuPrC5TL1gOBk3pMhtOF5HUOKp1nKmnvc3IkqSkWZiWX62IkVszmmJ3gWFkOCg/h6TPFzLt8dM6D/FpMiS7KhFrVVGbo+GsMP4lPSAfNS+fPbzSgOJrd6loGC/AkGPEnErwTIj38/QWcIvl9BJSyLELk5A2hpSZBo6geoA2FHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHMT15LZxhIZUie8UncLLPRTGLhw3Qx6F7+kF4zKJZw=;
 b=k0PSarQKeWgL6EcN9BtIjEE8wckSbnXIXPHpJVl8u8aokqidhGQ8YpAgNrxI+4j5MOPOEpCkdYqndtVi1A/nzX27Kjd3XorDKcV8gzFbiHPjfd3ppneWp4zPIoskgwZSkUUULoBaj2bv/JxW0Ju6SBPUDVMsk02wR4eUrL6ehwQ=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 BL1PR12MB5729.namprd12.prod.outlook.com (2603:10b6:208:384::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 02:11:27 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::78b6:27fc:c590:d2c0]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::78b6:27fc:c590:d2c0%7]) with mapi id 15.20.5654.017; Thu, 22 Sep 2022
 02:11:27 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Li Zhong <floridsleeves@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v1] drivers:amdgpu: check the return value of
 amdgpu_bo_kmap
Thread-Topic: [PATCH v1] drivers:amdgpu: check the return value of
 amdgpu_bo_kmap
Thread-Index: AQHYziKAMtaMF6SWRk2Y7Yh4Qc99X63qtGNw
Date: Thu, 22 Sep 2022 02:11:27 +0000
Message-ID: <DM5PR12MB2469A1B22EF0441216E1B40BF14E9@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20220922012719.1676315-1-floridsleeves@gmail.com>
In-Reply-To: <20220922012719.1676315-1-floridsleeves@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB2469:EE_|BL1PR12MB5729:EE_
x-ms-office365-filtering-correlation-id: 11560900-9036-4db3-1dab-08da9c3fc1f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rRR1cIhcXcl0xAs7+xGSWpRn30afscb25pMhqxrIpW7dXOhnUDhlpH6qihTV9JPe5Q12tuLKzCnfeWEIFTt1EfLfSgx3bNpchB2qcRjnbp+A4mY0lwU7NQgbK6KSqFZ8lowCKNaaip0TSQjav7Jc5OAIWVjnsndyVV+uPfZh1K8RTBXlfTBSoeK8HzFqzb7yeN5c2e23uFB13GCc14HaiL4l8s+WMEfqRk/Whcyo8ks7PPfxj+mwuaD6xNIFvREmOiJusU3aMw3X8T5e/o8OIVP69E31E6SrnhIDdEsl9WqzLQ1MRJ9qwzuMnLL85s/VdxTieaZntbayPlDZ7vb0ccA0LxxW44djaZYF+TOhIa1mxIQbZuNCB8lzsofEXw8uA/nezZ/0zEit6oaEUNheQaEQ9TEzHk8U4fvo+WaneJHo0xmne2klHf+Ekskltw+10KzA2t2MNf2MjVL460eXPZTmFPm8LV5ZG1lpKf9o+H+ftdONuTEPDGPuyRSBDqUCHvFys6mbfR9bshUCoqXo2R/0+GPmkZ5vQj29Y8YbrudNQWrL6pgaIbLuJZECIC3+hE3E5VyiBgemt1y3SQoPsDeVhdkcHMOLdHIvIVC6GRttCYIYw3N1BUfvjSS57o9zgWdjyryf4JhIwFi/QFZDilPlL/swCgjcwuQkvtUj2YgJC+PihKdQDs/vi4/XIA0QFVEvnetOFbDReyvAP79wbmdAbavUWE6GxYMZO5eUa0xRdwUVGC1p0MCZh+nZt+FDdFw9OLpzrbdtgA1Z/efl9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199015)(55016003)(33656002)(38100700002)(122000001)(86362001)(76116006)(66556008)(54906003)(66476007)(66446008)(64756008)(8676002)(66946007)(41300700001)(4326008)(110136005)(2906002)(38070700005)(316002)(5660300002)(52536014)(8936002)(186003)(83380400001)(478600001)(71200400001)(53546011)(26005)(7696005)(6506007)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+ZihsZugTkmxS/WFyQ5u/ICWvR4e548/+TU2b9OVubrSHAu173NbWIvHQ1/J?=
 =?us-ascii?Q?HOGlU9JGC36g0sJwplHG5Oi3iSNiDwEw/bCNa1lSsTZhtaol6xDiEn9iofyE?=
 =?us-ascii?Q?tP3XKP2OUD9r6ITPn596NAbT/ud2NQbHnawKq8R+hXF2i/eNDBen/12go+tq?=
 =?us-ascii?Q?NZKrgmneWEAL8wc/Vg1NL7lnw7YlJgmIPDDauTgeRYRVgi9OxVIlE7nXEQtU?=
 =?us-ascii?Q?l1o5djc+5iakFzrgdQIUcWzwYryNKzmJNgTo/kdf+xox7JGGJzVyQX/YfI/5?=
 =?us-ascii?Q?30dSrL1XKFnoDaQOckUea1W4fi1TJhILBw2cujrj6FOjy6Df//v5vX8eg0gd?=
 =?us-ascii?Q?27GHqbteqrfDi1yvkpRtLa+Hy7GAnGSXuatdzAX1uM5FsMuI3Cy3SmA1K8Jz?=
 =?us-ascii?Q?x0ffasRY3lhx3yXbo4VKQn3SFXlmi+vwgO/VpFBxcWZyJM9ZNCVSFzLypMya?=
 =?us-ascii?Q?Sk2caV00jfkmonUUFNqvC/D3RevalaSp8lv1Xm6MZflBvPvHD9FKGU8Y55RU?=
 =?us-ascii?Q?0oB6V7HlKxys2lt1FAfaZy3qm0LPMASx1bi393hqYi7n80jXUDt+90kUmQBL?=
 =?us-ascii?Q?UZSVeAxweyesSHC6VsPOm4cv4nItx5I87mA0ayC8ldZxLCyUD7DpUuMgEWxK?=
 =?us-ascii?Q?MTsUo4M1BUCsXgo5f5IsiZEgrxyVzVelG5GxKAk65Ca5EvJtDCqvNm0XqIV+?=
 =?us-ascii?Q?YLjVIeTZdCyjad14cHSTLOkHZzSveftNYzxEbSKRoYdKZ9kkz/IAybG71/Kg?=
 =?us-ascii?Q?cPGRZ6cX86VRvouT7fseWOdvSb3VJ9OFE18Xw5xAKTSjGhQJxMDPhWRkJs3X?=
 =?us-ascii?Q?igYben6h4n1G6bVrfqhbIjqG94azRvSTh4+vFoo3w6Y9ttWbEcWX76MNkt2r?=
 =?us-ascii?Q?S2KPidVHjP/Tvz4un7XnKmDOG2S10S0KXp7hdydKP5ppQrBZ+KhsjnnZXtgp?=
 =?us-ascii?Q?53ZsWRo2Lo6HUxKB4vnCJY/YUkTAiKRGJw5r+wNXOZDD1Xq0hLj6KFljjLg0?=
 =?us-ascii?Q?ncP5d4nU7sd0ZU+bJhOonzY4jv5chzmpBPT40ztX2s3MJYYSaWVTYbhYmDnC?=
 =?us-ascii?Q?mr6vXVFgiyxT0jaYAmzVPxelTWp1hzAXD5Zby9tMdXXj47eyWAajI6XC5QUV?=
 =?us-ascii?Q?jm/j/JQnQ4OQO+l8gR5iS1GcS9k4GCKIkG6qSLgLw0W2ORz3jjxUq4z+pMh+?=
 =?us-ascii?Q?4uX3ljxTOg4QlXHaAnx22igQgGjRXWblVwg9ay5WkcpHHaB0Z4BvrAufbMR7?=
 =?us-ascii?Q?dm6mPQXMKItgfXpAc7Bmx6/z7+yVBMoI1lJi8o9TIp8j3ZXJby3yPOnhYI9z?=
 =?us-ascii?Q?0pqdHoTDG1bGiMAryabAeAkewHeGfMJi4NRTz0WrvFRsBjdwXyMa5pMsi6SC?=
 =?us-ascii?Q?JGmXbUW//8BI6lRwPmGkqSDP1Dk8s7fg9Lof8muvIJnpvXjTyrBsJBLSet/4?=
 =?us-ascii?Q?F7mcAZoFMn6UKGokSSuxcj2U8K1nON2m8SF7XrvoXec8X+voDytGt3s3mV8A?=
 =?us-ascii?Q?oblP7wFFkHFpPGJPwbsK+FDgD/4QBS6BTQZue8hV3P28ir+CBUxd1AWJbd+b?=
 =?us-ascii?Q?BdL5Lf0qzs86bnPpUcL3gIXpIs/dgTqf7whRT+Qv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11560900-9036-4db3-1dab-08da9c3fc1f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 02:11:27.6398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JTrkwhP26KCXj2h04eNWIQaNh/7RhynXxiZvLGW8OE+hZzgI/QXAt4L/TP/STNqxM+NLnSv18/tjS/TWJW5/8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5729
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
Cc: "jiapeng.chong@linux.alibaba.com" <jiapeng.chong@linux.alibaba.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "airlied@linux.ie" <airlied@linux.ie>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Powell, Darren" <Darren.Powell@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Perhaps you need to update the prefix of patch subject to 'drm/amd/pm: chec=
k return value ...'.

With above addressed, it's: Acked-by: Guchun Chen <guchun.chen@amd.com>

Regards,
Guchun

-----Original Message-----
From: Li Zhong <floridsleeves@gmail.com>=20
Sent: Thursday, September 22, 2022 9:27 AM
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
Cc: jiapeng.chong@linux.alibaba.com; Powell, Darren <Darren.Powell@amd.com>=
; Chen, Guchun <Guchun.Chen@amd.com>; Limonciello, Mario <Mario.Limonciello=
@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>=
; daniel@ffwll.ch; airlied@linux.ie; Pan, Xinhui <Xinhui.Pan@amd.com>; Koen=
ig, Christian <Christian.Koenig@amd.com>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>; Li Zhong <floridsleeves@gmail.com>
Subject: [PATCH v1] drivers:amdgpu: check the return value of amdgpu_bo_kma=
p

amdgpu_bo_kmap() returns error when fails to map buffer object. Add the err=
or check and propagate the error.

Signed-off-by: Li Zhong <floridsleeves@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu=
/drm/amd/pm/powerplay/amd_powerplay.c
index 1eb4e613b27a..ec055858eb95 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -1485,6 +1485,7 @@ static int pp_get_prv_buffer_details(void *handle, vo=
id **addr, size_t *size)  {
 	struct pp_hwmgr *hwmgr =3D handle;
 	struct amdgpu_device *adev =3D hwmgr->adev;
+	int err;
=20
 	if (!addr || !size)
 		return -EINVAL;
@@ -1492,7 +1493,9 @@ static int pp_get_prv_buffer_details(void *handle, vo=
id **addr, size_t *size)
 	*addr =3D NULL;
 	*size =3D 0;
 	if (adev->pm.smu_prv_buffer) {
-		amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
+		err =3D amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
+		if (err)
+			return err;
 		*size =3D adev->pm.smu_prv_buffer_size;
 	}
=20
--
2.25.1


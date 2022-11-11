Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E820A62561B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916A810E79F;
	Fri, 11 Nov 2022 09:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7A010E79F;
 Fri, 11 Nov 2022 09:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnAmLH1qhIUUbX2bHz6lpo+Jse9D0L6MGh47IMAXGgh5EsbDKB6A8+N263i0JMC4eeTBWNfOxAFROTmfWO5XDg3H5DkwCfZY2ZCM4SJ6UlIGD+n3u+ERxVWpB7RBS+sJKqlz2T3ruiGHfAa9eTNuWCNFgqlyPOuOLpPdMZpzmhk4eD2wLNTmLKofnxZbTdYhc2OWBBzuQO/sv3IZlIR/n9jC5ZfB1zJWYKAE7iTfCU07ZMb1JIfqvQHOvZ5mcUJK0b/33wvDxMQmDGxBf8KIkrSR9Bi0YaofviImU3HV78X5gZKj1xUOn3XM7WL/CNH+4eZtOuMoyTz8yghByQ3sYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysk6FZPA2Dl3cHPtdvzJ3qokvNNIWmkQkXmhWFu2Chc=;
 b=UkftvNfRlRVJaD5egFmyAOKi0+keOPRNqZ8p4KhDWgfpCHucIPdxG/qjV14POCjMfqqrwU47b0EUf23+Ijcaw4pAMm9bs+qnCFUBvQyYsBhfNUmboN2fR9L1hDKvB/FtEG0rGvg8qZ3bMUEsLz13F9M1NgT1t1/J9iPddXgN2ZquJiXVX/KT1zPN4/MXFlFiNoK0IAqxWqxWqH3KZV48gScfIxjHWpquD+nPjxI9jI4B1gDzWhT3HWltWmEMPhAxdSxiBz4Yregta9LJGv++mtgMZMvviXT71c22Q1viWS3eiBgg4BHuuxLxeHb8v3/GfvCREp022KCE+hqUFR+5dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysk6FZPA2Dl3cHPtdvzJ3qokvNNIWmkQkXmhWFu2Chc=;
 b=LDJePcU4C2QRPc+vJuzHpNaAI5k5oKVSd+MTpDcOeg3maNSn44pw00Kc27g3/4FZhAd4aepRhQ74NuVKgJ7+RuK4434EkZjualnldIW/12bG1b8JLcaR2D9ChSSpMHZydifKYyxT/0jZE3PHiCDo+xSpnOxOpO6QpptGhwXqiYg=
Received: from BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 by SA0PR12MB4591.namprd12.prod.outlook.com (2603:10b6:806:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 09:03:35 +0000
Received: from BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::8bd7:b65c:13f4:9b]) by BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::8bd7:b65c:13f4:9b%8]) with mapi id 15.20.5791.027; Fri, 11 Nov 2022
 09:03:35 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: Denis Arefev <arefev@swemel.ru>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] nbio_v7_4: Add pointer check
Thread-Topic: [PATCH] nbio_v7_4: Add pointer check
Thread-Index: AQHY9ao0+b8BxEO8PESymkR/B234tK45ay9Q
Date: Fri, 11 Nov 2022 09:03:35 +0000
Message-ID: <BN9PR12MB52576CD30DB9A3BA7E7F848AFC009@BN9PR12MB5257.namprd12.prod.outlook.com>
References: <20221111074121.23296-1-arefev@swemel.ru>
In-Reply-To: <20221111074121.23296-1-arefev@swemel.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-11-11T09:03:30Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=dc89fb22-28d0-4387-bc97-d398bc12b0d4;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5257:EE_|SA0PR12MB4591:EE_
x-ms-office365-filtering-correlation-id: f622a7f6-8687-4e61-af23-08dac3c39d46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 19rxdgZ9Wv2MAHyIvnzoJidHG2qW2e/StM2Ya53VZE/xRbmN30+eNjyQ7zrtVDDq1W4qXTPNqAitWqImjU7FATXW7fTSOdl0nLIPthH9rA54ry6CdabGntNy0yFkgPbhOBI8hs5yyZeA1G6Gg6kTgvCEsrNnmG4TS8TMbsLILhdx4hIJSfszvEqlJ+3LRa7Cgv9MmUNqxlh+J9NxFeObHMisEgDsad+V/xw9SLLs+ppuY26OTOvMxQvHxH/Z4d4H+l4kTWrmJwJoEM3e0GDumMZO1Hht/HvqPEqrRiPBjqbgtbhxXk3S5IFxLcxU+deWqaBbOHqia0us2wYBmvBFAbeklPB4UhMV6Wg0rZF4bbV3b0IXbXzxQRrrjwGiKNSXJBl2XJ2Wy/6wsP4mfU74Cqk9yKQNuF2aDd0e8gIpLPIy0bSw9AXbpolw/iF+IMWCcyy6aEJ+aElpeM+X7Rdj2Q55bsneqhhy2HUy3mypiaEXYoASlYIyC2l0PU5xWs+Hcdk68UnDFNgE+EK/SlPStrlHW8MTi/0T7YA/bCYaB0oCk4Omk9tD4s7SjU5UyqXLhg7PtLOL8AN8QXP1cxNHnUtN4x1/KYcIaGmeMLJruyKIUieHAPsmcDSX6Cc3Vf+LQGUfMYJ6M1vk0OmaSDSRqahv0OhUx85dbhOGshVgTEDtONaJ2OKTt5109eEtkI8ThjblhogEcmH1/qbbkzTdWeR9BzYcaHedkj6bssTEd5Ayo6H+l47r4ruXNDWkcRPLrG0CTerIXN7dcAsJVDgnZg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5257.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199015)(83380400001)(53546011)(26005)(186003)(6506007)(38100700002)(7696005)(110136005)(66556008)(5660300002)(2906002)(55016003)(9686003)(54906003)(6636002)(122000001)(71200400001)(478600001)(8936002)(4326008)(41300700001)(316002)(66476007)(76116006)(8676002)(64756008)(52536014)(66946007)(66446008)(33656002)(86362001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RgO6YSpdTJHvHiUJIQu+UUAZoWatdi3Xx2Mh3ozBRxVtWBdSxZGOcrge5Jot?=
 =?us-ascii?Q?UWaBAeng+TtFFBBOKT0pt09iBnKI3BZhCWcvmVHBninWRg7k7sNiMdtnzngM?=
 =?us-ascii?Q?EAp8Sk4pQvKmKsppzAGDGqcCV/v8pxKVk4+Q1v9NDS+g6two6I0xtpAqHYuE?=
 =?us-ascii?Q?un6MV5tBKoESzBVkKOLV99PGUUEZCqtu4054PPNETjX4WT6+b117XYRwiLkR?=
 =?us-ascii?Q?z+LtWV2+YQw8UQ8a7I6CXTfi11CiFii/kmL0Ki2/edGAD9ui+aSLcAlIoaAC?=
 =?us-ascii?Q?+0tf0G+Is3SYX2raX1CLjaBSFosYn3RWWHpGxm0waBo8Zg1VaGcKZ4zumJLn?=
 =?us-ascii?Q?O6uFnoHtex5oybeHIPGW6atUglPQEQO6LqH1DRNiof345dt3dH10azX4zoWw?=
 =?us-ascii?Q?vKAi4Motwf+jIcpJ35ycSoeBTEIkrXHavtTipvnMpb0iyrNIbJj1kMOrUf4R?=
 =?us-ascii?Q?gWvmsjR8fCwhuc3coHDrtCd9BQt7WPVpDFcBqecvh56mKGFoG5bOngVNldAe?=
 =?us-ascii?Q?YIEXlWktF1oYgqTzya72bkf+L8wh+qo6yCFWAPtea177B5Z9yBmcg8f0NcaX?=
 =?us-ascii?Q?vF6ArGnysOKJ09T+arQqowYWBQ8zWniIf1YZ2SwTsC6MbZAbSmI8/okvxC/J?=
 =?us-ascii?Q?9gOp4bh/63KQ8LwuGD+65z0Bbtc3VWauEDEuRGd3EiU3L7oPu4cabtx040eh?=
 =?us-ascii?Q?ydhueLwFzbF0v0uAQrUH9WKO1cLggJPIBp/Uxvbw0shnNfIF8QA2Ru7OI5B+?=
 =?us-ascii?Q?PV6Qea0Cr7w2khlEt/WlnqiiF0dzLKLTopImFKwDwdi+EBAjy0BQbtJpeaRw?=
 =?us-ascii?Q?yPyY0TZdM+kaVG5T5ok/0fylpliN+n3uHJwUAhyNnKHaFBR5F/3TK2iTTKwJ?=
 =?us-ascii?Q?KjhwtR51KB4rgsct4CAOWqxYlTz+kjVIiUYfvolYEGxb1Jf5kh7Iv68bZorP?=
 =?us-ascii?Q?Xkpl6WG8KzsXBOcH3dkbScIpI6AOa9RRcUEX3JMmP/9iMolK+PN/fG08OJn8?=
 =?us-ascii?Q?1lKI3hO0Bo/BTprOW1NGi6AOuIeN+fBiokC/uW6FKv0taXmlsd3RG8+Gld5b?=
 =?us-ascii?Q?fW/f6dyHYzkadJ0ysPqnXtTesyQIuEBi8bMIx4cSYw1SFx+7y+IxjCbHNTGO?=
 =?us-ascii?Q?8q9mkvo8cNWw0G5Qnl0xjY91JQQXs7PHabjb78SVS6ZY2sL4C8Pk01XslyTT?=
 =?us-ascii?Q?k6Bh4LRQqjgUQuR8+5LfcjP8daBOV0/reDtV6tppEeCyo3zHYUkoSFqe/f39?=
 =?us-ascii?Q?DJptzkoz6vR33tUtqfQQ6SqlNrRCPSKxRviH8h/OXTbXHx5f0M7BsYJMweMx?=
 =?us-ascii?Q?t4z7ujYgeZxoKYJzw/uRuxlqIZshGh0sFXE08SiPDtNQ4XrIzgo8FMhha9fg?=
 =?us-ascii?Q?+19PPAi6pP7mgln8iepjvDl641pt9DU2Ttmi6ko7l89PDZ5i9hh81UKHbJaG?=
 =?us-ascii?Q?YZrCSWqsVuJgRtz0991IUU00lQJkwvIsQU0HalXqPVbi2IOXZnIK4r9nyBlw?=
 =?us-ascii?Q?aLXsizNzo92ExBDiXSbUPsE0mucJaBTqnEbmPTW4tV0Ch/gPgdjb2vRdjsLt?=
 =?us-ascii?Q?wt1qqnNsJZH98pCgNHpyS6E8yIIBpx16Jx6nnu/D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5257.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f622a7f6-8687-4e61-af23-08dac3c39d46
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 09:03:35.0415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ePC4oo9hlJqXhU7dnMdMxR/baPiPmmCy1KyjAIpRg7DA8o7WvI9GOs3LLCY8CtLFjazKcqSZ/gMkvYllNeMFQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4591
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
Cc: avid Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Hey,

The patch does the right thing from coding principal perspective, but it is=
 really redundant check in RAS context.

The function is a hardware interrupt handler which is only triggered for sp=
ecific RAS event. When software receives the interrupt, the pointer of RAS =
context must be valid one. Otherwise, even the interrupt won't be enabled a=
t all...

Regards,
Hawking

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Denis Ar=
efev
Sent: Friday, November 11, 2022 15:41
To: Deucher, Alexander <Alexander.Deucher@amd.com>
Cc: avid Airlie <airlied@linux.ie>; linux-kernel@vger.kernel.org; dri-devel=
@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Daniel Vetter <danie=
l@ffwll.ch>; Koenig, Christian <Christian.Koenig@amd.com>
Subject: [PATCH] nbio_v7_4: Add pointer check

Return value of a function 'amdgpu_ras_find_obj' is dereferenced at nbio_v7=
_4.c:325 without checking for null

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/amd/a=
mdgpu/nbio_v7_4.c
index eadc9526d33f..0f2ac99de864 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
@@ -304,6 +304,9 @@ static void nbio_v7_4_handle_ras_controller_intr_no_bif=
ring(struct amdgpu_device
 	struct ras_err_data err_data =3D {0, 0, 0, NULL};
 	struct amdgpu_ras *ras =3D amdgpu_ras_get_context(adev);
=20
+	if (!obj)
+	  return;
=20
 	bif_doorbell_intr_cntl =3D RREG32_SOC15(NBIO, 0, mmBIF_DOORBELL_INT_CNTL)=
;
 	if (REG_GET_FIELD(bif_doorbell_intr_cntl,
 		BIF_DOORBELL_INT_CNTL, RAS_CNTLR_INTERRUPT_STATUS)) {
--
2.25.1

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6753C3E5BE2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 15:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EC589954;
	Tue, 10 Aug 2021 13:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213668914D;
 Tue, 10 Aug 2021 13:38:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROFUpHFo/lptgaxiOc5uWSG6lrXiH2+X1XrV3kGb+DGQOMnMuNBTfb21PTUk7QbhHxG37/nFlH+GV+p3Sb6ZU0Rfj42NTcMk8ZciQ192ABj12od33wA352aJ81zoyW3WjSdkrsNcPGXwpjT2EiqRetSD28JQerXOuk5ukWv1UzXgCOV8JiQcMqEL2lAihmpaSbnBT7fTnmXY+7D21ozJnHMnqk57c255SD5dEa6Pa3i8T8WFABhuiwpchXojGN87CjcW/GBzQMe5GvrLuhwQGrRxRAmXHcevuTqZh+Zmoy1A6kaonOtsuMAPeuBe4RBSKJGIeWH3AesSof51gbc5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK5HgIdMrmPsehlYvByn45BBh+0SB0cHqI6EuBDN6yE=;
 b=IDA53FUezfOnri8WsMH7iHj0J+Kk/CEFAKWI0L0OCSW+e+eAaE+sTD+YgVdxgHvaN0GGT7uiHlPqVmEn7gLtiCs9KeFOULlpVoWD4MHYxXi9NDkkEqMVEcgnuEoKP0MI1Hl2WMAOR2nTYazGjY8WdBLVJ5kZqPTOzDQsVs0NfSGOjYCgc/AXtfwEOFMYf0KJ1izhsXVvRNfzEnd4Qpo3UUTe6Sajx4ulxbI/HU+bYzIvKEBAFdJ4Www9WzJmE/mkQlDPpY7LMbpF9xTHxYRVcYDb/oHlxl2HCWRQHOiy0p/YzihgSeubVaE7fDPx0cpXvQB1dpiOgw9P1Gll7dFfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK5HgIdMrmPsehlYvByn45BBh+0SB0cHqI6EuBDN6yE=;
 b=bUajm5rG2jWNt2PzSK1BoQwj5uP/EYpRDi25D0r6+6wYXBXJFdsBwXXmSKjvq9KnTSCUj1UPlinnBJyCyzzflwVjFuvjWaCwZpgr2d0X2pgt5VFIf/m6ZOdkwjYXvyLiBVX7Yrn01rczNo3mv79gs4oxF6hWpO+KI5AwEJTsY6U=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 DM6PR12MB3578.namprd12.prod.outlook.com (2603:10b6:5:3c::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.19; Tue, 10 Aug 2021 13:38:23 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::453c:6ded:8973:744e]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::453c:6ded:8973:744e%4]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 13:38:23 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Tuo Li <islituo@gmail.com>, "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Cyr, Aric" <Aric.Cyr@amd.com>, "Lei,
 Jun" <Jun.Lei@amd.com>, "Zhuo, Qingqing" <Qingqing.Zhuo@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, "Lee, Alvin" <Alvin.Lee2@amd.com>,
 "Stempen, Vladimir" <Vladimir.Stempen@amd.com>, "isabel.zhang@amd.com"
 <isabel.zhang@amd.com>, "Lee, Sung" <Sung.Lee@amd.com>, Po-Yu Hsieh Paul
 <Paul.Hsieh@amd.com>, "Wood, Wyatt" <Wyatt.Wood@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>, TOTE Robot
 <oslab@tsinghua.edu.cn>
Subject: RE: [PATCH] drm/display: fix possible null-pointer dereference in
 dcn10_set_clock()
Thread-Topic: [PATCH] drm/display: fix possible null-pointer dereference in
 dcn10_set_clock()
Thread-Index: AQHXjeglZkZAXnMBCku6KnVHbqk3DqtsvJ3Q
Date: Tue, 10 Aug 2021 13:38:23 +0000
Message-ID: <DM5PR12MB2469A884396F6018F8437E22F1F79@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20210810092004.291429-1-islituo@gmail.com>
In-Reply-To: <20210810092004.291429-1-islituo@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-08-10T13:38:16Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=471c243a-90ef-480c-b3e0-ab721cc8f59c;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd03e364-6f94-4b13-2547-08d95c041ff2
x-ms-traffictypediagnostic: DM6PR12MB3578:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB357808B589DD47133B89645AF1F79@DM6PR12MB3578.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GulHyxHbtZsKABbXCQktixTEq+rLz4m6TPSN6pJ6SUtW8UWWRm7kZB4SI5M838BgIFRFjT0uaXy96V9dVDAoTJmvYhgtkLuRQ4XPpTAdVFPRya2qUj7LeLYuwuTF7LSEpg9wITdYxgXcF9nICwQLflGc7f/GEJcEQwPOI6cp+iufU8aAgOSs2TKQsuCcOkiOM2nJJNXIz+Jhholwrxak08RPYFWAXebRYV/guMVjARueyK145oE0HNS72UH1haZ0qp4qGWTsShK2mAf9Guu2I0GosO+RQso1Nf9yuO0OTH18mA2L+wbE1P0Nr9+f/jPlddLCkbWVqR/Amtbg/PwjDOUHzrYEmS3pH/hwopIU0tC4CRjXer3pIK3J9+YcpNYWSTngNVJyoUgTS7V6SPtl4p2LL7Ma5j5xw5u0v3GBE9NYHUzZxLO7IIJJ8SfCORuiuuf2CfXd7EvDIi2ybQXod7w5t4yqA7UMPklTn9bs4eiPgeRkFzvgYrVEGMYampIXaEIiMGl7ol00Sv7IcTclHmZ3ERnKWrBMutydnU3VSDa2p4oIlVmZPt4uIemRgA4DBIxK9uj7R42wTWHMUpzG+vB3kPYFUV4Vtjw8LY5UpGz8jG9Hhoc/DJPw1ba6STiCyGd3fawUbIcrMNVWs7YQKmaDzh+ZJCTaNY+Jsopwk6L+pRd2RgGZMOVewb0vyYuiqoj2jZsRfYWMnj9HM2v0i50kcBhGnECqep/NA+ka2ac=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(52536014)(110136005)(38100700002)(26005)(186003)(64756008)(316002)(38070700005)(66446008)(2906002)(76116006)(66556008)(66476007)(4326008)(54906003)(66946007)(122000001)(83380400001)(8936002)(9686003)(921005)(55016002)(71200400001)(86362001)(6636002)(478600001)(6506007)(33656002)(8676002)(5660300002)(7696005)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ns9Yh/lfYGUBU31baPejvx/bd7TIBt5hweYGQv68f0b43YdusBlwj3koqNqN?=
 =?us-ascii?Q?72mJDgvOTbn2q9kMKkRUmXW66De9kjL5BWf5SwaYSLmpzlwTqnGWm7j8ZEmk?=
 =?us-ascii?Q?eKqJxhukiFYQtd3kIY83kn8GdUBFbEI5LJg4g9a6nosmq8Mk2RwlSAL0rpfc?=
 =?us-ascii?Q?7v2sLOysuDgYLY9NXwS5bsoJnLef8IUpLRXN5T3ykdd/bgJ5jJk3v79Fj6Md?=
 =?us-ascii?Q?Magz82pG6d/my9uW5LNWSYJrBWkXpwAhnSqgS0JNAWSd/5tERyliWotzslsg?=
 =?us-ascii?Q?UNIJ3BSO8Cw8B4g5bidNy+RmjzPtBCRoJpBXKeb5+uaUH4TgrKEFD2x4JTZR?=
 =?us-ascii?Q?w4BSGD7EZ1ssu7w8HNIt9L68FEXr4RYUhjyLg3smCx/INcrVUUdI5hF/GNCl?=
 =?us-ascii?Q?t5WwFqY+ZkO3xXhKd9sHVAj9XyOTH6TsdgipTD8ICL8bu0KOKnaZwEcBLznl?=
 =?us-ascii?Q?v1+d4Sc06B4QUGCUqKfuJzKwtrMBrbNzLdm4bB5IlS2SFUtcCra0rAO0Qtvd?=
 =?us-ascii?Q?CSrkwQ41WNGYuEfe9ehXnN8Y4GZiJ6MUXVE1nGB3A/9eMrbi58IsJmE2eH57?=
 =?us-ascii?Q?B8ZdUJ/cliuW647DAo4EX44tLPGcpzRUx8jtUJYbdKd2pmpe6+nGee8/hs33?=
 =?us-ascii?Q?hdzsS8qI+qOTfYLx4ePwBUmaG+zHTGaKuMvn3QshM+kHmP9zOuG10iO9hYFv?=
 =?us-ascii?Q?PveVI4vFqlBBptO1Msgo9bLdfXp8X+4/QhQPQRHWYQV8U0HPutIDQsVg//WY?=
 =?us-ascii?Q?OihohBko/LPpzRbCJp+efiPjM8+uXAX1hoRrU9w0KjyNXe8eK8YZREZsxjEy?=
 =?us-ascii?Q?Y06/Fdgvjv1ZLzsZHNmm96zOzQyI09rZXV7a8MTiEc6FahaLFXG3xIDHE6+t?=
 =?us-ascii?Q?ESzEaRelDpwoYaUhzxgeerNTovOuptRj3QHLWuNwJQErmx0W30vWF+T4bzYe?=
 =?us-ascii?Q?6OtjAg9H1VaRkfInoKGXPi3OAv+VZLo25TJLerYp9Pp473xS1zjubjac3aHE?=
 =?us-ascii?Q?esv+MsAlKvKxeUyytMZ/YRNPLdksy/9IAK+WP+ywfCM1DcOtG7QFVnmtOB2W?=
 =?us-ascii?Q?bW/pf5cGBi/neR0jrdL7S7t2l6xUcBq5/BBBPPCnA/5x2UBi07FOs6vbDU3r?=
 =?us-ascii?Q?Vgi/bZ/dP1THF1zzMHKdLoA/Vfq6cEvQ8d8aWeGitpJYl3NEo+tVbezvsu4t?=
 =?us-ascii?Q?ZrKxj9ZrOWSFmBWXD/bySPFW0x4yHWpbRkQxILiDmdG5kds5Xd02E2E4IwhB?=
 =?us-ascii?Q?KHnhky5pKorgDngazGRTDvZMk4PFNq8Ykhm2gj1PsopctOjU6TG8wOW8L+ta?=
 =?us-ascii?Q?qVLbrrvUa99CNcN7E0OCwyfD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd03e364-6f94-4b13-2547-08d95c041ff2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2021 13:38:23.4183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WcxVqlFOIPLoeX1uKrKCHqxDw0BL5Kgka+Go66ZYyaRVJxr/FL63SsFS4k/ObojyLsI3FoIVw5bOnxhZJAV/xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3578
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

[Public]

Thanks for your patch.

I suggest moving the check of function pointer dc->clk_mgr->funcs->get_cloc=
k earlier, and return early if it's NULL, as if it's NULL, it's meaningless=
 to continue the clock setting.

....
if (!dc->clk_mgr || !dc->clk_mgr->funcs->get_clock)
 	return DC_FAIL_UNSUPPORTED_1;

dc->clk_mgr->funcs->get_clock(dc->clk_mgr,
 	context, clock_type, &clock_cfg);
....

Regards,
Guchun

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Tuo Li
Sent: Tuesday, August 10, 2021 5:20 PM
To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.L=
i@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christi=
an <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; airlied@li=
nux.ie; daniel@ffwll.ch; Cyr, Aric <Aric.Cyr@amd.com>; Lei, Jun <Jun.Lei@am=
d.com>; Zhuo, Qingqing <Qingqing.Zhuo@amd.com>; Siqueira, Rodrigo <Rodrigo.=
Siqueira@amd.com>; Lee, Alvin <Alvin.Lee2@amd.com>; Stempen, Vladimir <Vlad=
imir.Stempen@amd.com>; isabel.zhang@amd.com; Lee, Sung <Sung.Lee@amd.com>; =
Po-Yu Hsieh Paul <Paul.Hsieh@amd.com>; Wood, Wyatt <Wyatt.Wood@amd.com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org; baijiaju1990@gmail.com; Tuo Li <islituo@gmail.com>; =
TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] drm/display: fix possible null-pointer dereference in dcn1=
0_set_clock()

The variable dc->clk_mgr is checked in:
  if (dc->clk_mgr && dc->clk_mgr->funcs->get_clock)

This indicates dc->clk_mgr can be NULL.
However, it is dereferenced in:
  if (!dc->clk_mgr->funcs->get_clock)

To fix this possible null-pointer dereference, check dc->clk_mgr before der=
eferencing it.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/dr=
ivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index c545eddabdcc..3a7c7c7efa68 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -3635,7 +3635,7 @@ enum dc_status dcn10_set_clock(struct dc *dc,
 				dc->clk_mgr->funcs->get_clock(dc->clk_mgr,
 						context, clock_type, &clock_cfg);
=20
-	if (!dc->clk_mgr->funcs->get_clock)
+	if (dc->clk_mgr && !dc->clk_mgr->funcs->get_clock)
 		return DC_FAIL_UNSUPPORTED_1;
=20
 	if (clk_khz > clock_cfg.max_clock_khz)
--
2.25.1

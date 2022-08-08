Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC7A58C614
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 12:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C729564A;
	Mon,  8 Aug 2022 10:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC9493E53;
 Mon,  8 Aug 2022 10:02:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPTmr6DksH/FYWk7XNfOE8CuoZJ8gjtF9Wq0b4pYPW52MKy8uqXTRToUCpzWJIfKClbZ1I23vvQiqfayeqKx1iw8XY5De3R0FBRKzs/I+vAjfjyUKqnCgZnyEqlu9QKrwR4s4MUwc3nwdyP2u8L+r0i562ms0DL4PlYImoySNMzNSAQZCYChpX+B/Xdxm4wS+ZsbQypgnSoQ/WytgJ09WI57QK8VLywBtMLOC5jou0CECEj5sLuZPuqfj7yMnXrUpJvSdwvChw770yjqJsrUDh053NtN9OqDypcsqFCGfbz/T1DTvzkDfDVLFdiueXXdHrWrYvxQSQLoQSB84A8UUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UasBFavkM21Xx9KSaHRjvFjATsidym5Avw19r52yePw=;
 b=ogb2fk1VTnLoJtVjz8Yn1qID+X6GR3C/l/nxhyC/yZqZg1781EMcJt4LOmYXkEz2KBLCQPE0r0WNwp4PxSpen/lehS329ios1AVCP3x/V26wZ3VIHvX4AEMgvfQmq+bT5OmetjpPBUdF0byGIx1kiq4fmBvL+xcALdNRQnfYk87gpfXv5npL89xmyGKHRRm+A6VtimtN1N2NsCRAuRui5dJtQhlk0Yxdgr0i0n09DP2/EW36YjyCFVTo3u+3ORWB48GqZCkADgo6JAMXtesHxwEeilRFE62pGTNLLrGZiOGtNPUAL5VwVAH3xhsb3akhS/MgHCMbDZaR7U2i1ndMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UasBFavkM21Xx9KSaHRjvFjATsidym5Avw19r52yePw=;
 b=SPbgL2PM0tPzxn5DdSgv7p1KHMuoZgW/sgWhpuszPGBNZJ3Db2SEwRv7klU7S9yC6RS5AtMfgmLr+Sqjn7NvXF85lWojfYOxMkVSw9iZC7SnxHi2tQQK/blJy/Fn6Ygq2VpuSUD6mfrW97SpywGOsmnIXJSWzQxNnl7XqCENoK4=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by BL0PR12MB4705.namprd12.prod.outlook.com (2603:10b6:208:88::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 8 Aug
 2022 10:02:29 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::3931:6e19:485a:2c34]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::3931:6e19:485a:2c34%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 10:02:29 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [RESEND RFC 18/18] drm/display/dp_mst: Move all payload info into
 the atomic state
Thread-Topic: [RESEND RFC 18/18] drm/display/dp_mst: Move all payload info
 into the atomic state
Thread-Index: AQHYeqbgSVnUwi//gUS5WPmor4cgkq1votDQgC5W44CAByRbEA==
Date: Mon, 8 Aug 2022 10:02:29 +0000
Message-ID: <CO6PR12MB54896ECA603462858C9AFBA2FC639@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20220607192933.1333228-1-lyude@redhat.com>
 <20220607192933.1333228-19-lyude@redhat.com>
 <CO6PR12MB5489BAFF2DDCD67F8BDCD827FC819@CO6PR12MB5489.namprd12.prod.outlook.com>
 <848f35a693b26bfd15b3c6539eacd3e313dcd3a7.camel@redhat.com>
In-Reply-To: <848f35a693b26bfd15b3c6539eacd3e313dcd3a7.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-08-08T10:02:26Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=26ebe980-aeba-438e-b1f9-1f561de6995d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b8a4306-50c7-4934-08a2-08da79251aa8
x-ms-traffictypediagnostic: BL0PR12MB4705:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6p2NMfxIJ+8X8nLn+N3zq+Zebx0h8tDhyEEdEcAWPfZ6SH2hC+OJZie8HN4Y0eeWkiLjL+2l/CSJlxzwHMWLWMEssvQPekaFkvirY4KeXurqAbie87MxD6gKfN+r2MImpeVesBHgx+zPut0ACOGBDJ+tHbw1QfAbHmGd/XfB5bSczi8KElYx7CWX3yRGVI+RAZaJlrgTjfkd9CpW9m2oUvQE7+Jn4NaWvo1IQhZCH3I/lYT5+5UBZ1uOBpPQmhjAMH7XzOWzgLXiWvs5025Fafe6f+yJDL/Yp+ANBuKS+ZZkTirecB7CJi+7r8elqhKv1QINhrmzJbnpPFU8PvHi9pRetYf6OO15DJ0CQ78iRGlsDF9TlaSzSm1YBD1DNfhqGEzHal1RZuK0xgMg5MpsXjwKlFhjGf/eT86Jx4Lan8bena6iTyLe+LZ5/T7Gtm0/SYb44fZlHQ6MMJ10ySrpj55YlQA+S2tSAeIQvTiKs/eeeP6RXsq8BEpsU5xIUP9dkD9TmCht3VsWQA0Iaz0GbfK7frolYwtdPKxM7g8SVoykNLPUtzNv5PGVhU1yx5JJFm+l27vfI316ke9AqxwaLjEzS2+HJ0dxekQH9b4vvpQKCyTDSzDN+3qufE3YVZKAFejeL+pvW8uBpLMNlKAnYNd2/qC8OkOX5flg9uMC9CAuw9GKAAwASzOc104s8nXH/6Dn+ceHBTrddyB0w+WV4TUrhBdsUaW9eNrpG6EqZTy0g7V0HVwNe53W0HBFv/UmDKqCGOBDh+AbCHbY86eOJ67hL+r4wFOlIR0xxGRi+RDP58q1jDOSHLkF7vSwk4bH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(478600001)(2906002)(122000001)(83380400001)(33656002)(9686003)(26005)(186003)(66574015)(41300700001)(53546011)(6506007)(7696005)(55016003)(316002)(110136005)(38070700005)(8676002)(4326008)(66556008)(66946007)(76116006)(66446008)(66476007)(64756008)(38100700002)(8936002)(54906003)(52536014)(71200400001)(86362001)(5660300002)(7416002)(7406005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlJQQkphS2JPQXpzOEU3K2txWFRvRmswSE5PV2hLdVZURnk0ZzIrMnZhR2Ra?=
 =?utf-8?B?SnhKSTZCTVptUEpZV0RXOUtQUG9KMVBUR2pwTjFyWkJZeGtTTTRwSTR5V0JX?=
 =?utf-8?B?b3pQVjMyajk0RG9MQUV0RTNHU1dDc3oxWWR3b1lNcWJuNitOK0NiNjhKQUdy?=
 =?utf-8?B?dEI4S2ZYdWRaZ0QvbG1tODNjZExzWXRoOUNBMFMraFluMWJLM0NYV1NlYjZo?=
 =?utf-8?B?QnozUSt1QWp3OUNaYWtrcFR5WmpJRlhydmxUQ2U2UlFpR0FqYUFaangxVFVU?=
 =?utf-8?B?TitoOUZrQXJ2SFJWbzh3VXlqU2h6VW9uL25xTWVud01KRnMxOG9jZDFkcFZZ?=
 =?utf-8?B?VEgzQ0djcnh1R080MzFndVhMbFhmM2VkK3hhTmNUN2s5dXNaNHZGZ2ZTMTlB?=
 =?utf-8?B?cUFSTjVIZk9JV21ZUFFCYVNDSHFEYUFDWGQ1M2ZrOXMwZFJDV3dIbGMzb1h3?=
 =?utf-8?B?cWZCZzl1YWluSm1uTjZjYW9xQ3RTY2F2alRPcUZRaGxJOGkxNitJQ2kyQzVt?=
 =?utf-8?B?RWZBUmxTR2t4eDJncVNaUGN1UXA2QnQ3Zmt5Z1AwWUpmQXlBdHhBeVY2bE1O?=
 =?utf-8?B?QzlhMnliOFllUHlmbkkyZHRZdEs5aUpIV0d6dCtOQUFpVXB1UU81ZjErY1VB?=
 =?utf-8?B?UkdCZTFGcG9vSnBqdUQzZjI4emVsTG9DWE56dWhyckl2WW9aRUJuQnZ6M04x?=
 =?utf-8?B?T3hTU29PYnV2cmpPSW1xQnJ2WnZZOTlEb2NicGhuMkpjeHBTM21KLzB6TEI2?=
 =?utf-8?B?SU1tbEw2VEFab3MwSGoxN1ptMTFITHA3UE9xVFFBWkhsNVhrT3NrWndrQ3Ni?=
 =?utf-8?B?Uk05R1djVFp5RE82WHZoMkkwcEg5RDJ1bnVDR3pPSUpnY211eDVQN0crSEN2?=
 =?utf-8?B?YkE0K01sSGhpeDdWMmFhMmp1dEljeUNhN1Y3Q0ptSlBKVi9TN0ttZkFQbWhp?=
 =?utf-8?B?QXpqNnJNTzQ0YU5tbXZnVFhySHRrY1pKVmlOWXBJay9NUU5xaFNjU3BrWVd1?=
 =?utf-8?B?b09WTVZETXpNY1pCdFQ0ckVsNk56QWIxdHZXQ1FGYkI5elNtSlNlR3lPTEw5?=
 =?utf-8?B?MGYxbitSYTk4cVBERWhiazNjcmNkWHRVMDhhdSt0WFFhOWpGSGphbEJEaUJT?=
 =?utf-8?B?ZjlBanNDS3QrOWdXVXkvakhhZGF5K05SWGliQ1JHQ2hBdWt5RlI2NVZIMU0z?=
 =?utf-8?B?amlRSVNaelZWVWxoZjVvMGRqZlM3M1hPNW03Z3QwWmtXNklHaWQwWVMrbnlG?=
 =?utf-8?B?Y3RRS0lyWXBIcENsTmVIc1hWdkh3UzBSYUkzODBsajg1c1NUcmJhS2lkSUVr?=
 =?utf-8?B?ZlI1V2dRUmd0TkNzNDE4TmtmbzBndXFwdGc5RUJONTVxMTlaU0F2UGFYN0lp?=
 =?utf-8?B?S2FnZmQ0MGRGeENZRENudldXRU1hUmNzK214RzI3R1BoUFJlMDJSRHhBaEU3?=
 =?utf-8?B?V0tWN2hJTFBPZ25VU3c4S3YvM09LK1gxcHQ0dDBiUlQ0YmYydGd5d0MyL2RF?=
 =?utf-8?B?THdTSEd0T00rejJxcWdCUXNPU1JLYlRmQzAwWkVkdk9wMmZhNkVOQ0JablJw?=
 =?utf-8?B?cHN1STRGcEdTSlRhdW5hU3hwakd6TDFaVWVYS3ZmeUtNZm5tRUlVSXVzZkJm?=
 =?utf-8?B?ZGhDQ3U3cDNEWkhUQlhhVTQ4eitzV09EakkvTUZOdW9oVC9IdHdhMkFDL25r?=
 =?utf-8?B?a1Myb0FsMmJlbzF0RVpBVFpoS0Nwc2NCcjQveUNsU0xXM3RYeWZ5TzVVbkxi?=
 =?utf-8?B?WGRITGczQWM5ZFBuNTNxT1ppUHRidDJDY1Vidjgyck5VaEJWZVM4T1RKeHBp?=
 =?utf-8?B?T2pTTWRmL2dSSXRhaGpveGZDZHFiZVRNWXFuTlNZWDM5SmUxeWp5Tlp0aEhE?=
 =?utf-8?B?eU5MNUNvOXpWOTl3YmI5NFZWZjk3UzRuR0pQeVk1NEdkVmhEQU1kM1d4OVJW?=
 =?utf-8?B?L3p6aXdLZ2Y3SS9JTThkQjlmYi9GUGRtamFMcytzNU5tdHpYb1hFUHhaTTYy?=
 =?utf-8?B?b0FtUUtUOE9HYUtiZHhtM2tTTHpReHkwdEhqK2Y1MTNWcGorLzJNMHRZWE83?=
 =?utf-8?B?N2RyeEtMK1JGdmVoUFVoYkcxNzVPU2YrcHBFRE5zdFFIRVJxWkk1T3RZT2xY?=
 =?utf-8?Q?s7lM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8a4306-50c7-4934-08a2-08da79251aa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 10:02:29.3692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RYD0Iw1ousg4ijhY+rQrEZ7kPGHr6vjL5gG3DNdd66+WzRYRKB9C0EXZ0O0up71VrVpin7cisSjKOocI0o4e+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4705
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
Cc: "Chen, Ian" <Ian.Chen@amd.com>, Karol Herbst <kherbst@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?B?Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YQ==?= <jose.souza@intel.com>,
 open list <linux-kernel@vger.kernel.org>, "Lei, Jun" <Jun.Lei@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, "Li, Sun peng
 \(Leo\)" <Sunpeng.Li@amd.com>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>, "Shih, Jude" <Jude.Shih@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 "Strauss, Michael" <Michael.Strauss@amd.com>, Juston Li <juston.li@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 "open list:INTEL DRM DRIVERS" <intel-gfx@lists.freedesktop.org>,
 Luo Jiaxing <luojiaxing@huawei.com>, "Liu, Wenjing" <Wenjing.Liu@amd.com>, "Wu,
 Hersen" <hersenxs.wu@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Ma,
 Leo" <Hanghong.Ma@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Sean Paul <sean@poorly.run>, He Ying <heying24@huawei.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Li, Roman" <Roman.Li@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Claudio Suarez <cssk@net-c.es>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Colin Ian King <colin.king@intel.com>,
 "Kazlauskas, 
 Nicholas" <Nicholas.Kazlauskas@amd.com>, Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTHl1
ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCA0LCAy
MDIyIDQ6MjggQU0NCj4gVG86IExpbiwgV2F5bmUgPFdheW5lLkxpbkBhbWQuY29tPjsgZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPjsgWnVvLCBKZXJyeQ0KPiA8SmVycnkuWnVv
QGFtZC5jb20+OyBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgSW1yZSBEZWFr
DQo+IDxpbXJlLmRlYWtAaW50ZWwuY29tPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD47IFNlYW4gUGF1bA0KPiA8c2VhbkBwb29ybHkucnVuPjsgV2VudGxhbmQsIEhhcnJ5
IDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPjsgTGksIFN1bg0KPiBwZW5nIChMZW8pIDxTdW5wZW5n
LkxpQGFtZC5jb20+OyBTaXF1ZWlyYSwgUm9kcmlnbw0KPiA8Um9kcmlnby5TaXF1ZWlyYUBhbWQu
Y29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsg
S29lbmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBhbiwgWGlu
aHVpIDxYaW5odWkuUGFuQGFtZC5jb20+OyBEYXZpZA0KPiBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+OyBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBKYW5pIE5pa3VsYQ0KPiA8amFu
aS5uaWt1bGFAbGludXguaW50ZWwuY29tPjsgSm9vbmFzIExhaHRpbmVuDQo+IDxqb29uYXMubGFo
dGluZW5AbGludXguaW50ZWwuY29tPjsgUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPjsNCj4gVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT47
IEJlbiBTa2VnZ3MNCj4gPGJza2VnZ3NAcmVkaGF0LmNvbT47IEthcm9sIEhlcmJzdCA8a2hlcmJz
dEByZWRoYXQuY29tPjsgS2F6bGF1c2thcywNCj4gTmljaG9sYXMgPE5pY2hvbGFzLkthemxhdXNr
YXNAYW1kLmNvbT47IExpLCBSb21hbg0KPiA8Um9tYW4uTGlAYW1kLmNvbT47IFNoaWgsIEp1ZGUg
PEp1ZGUuU2hpaEBhbWQuY29tPjsgU2ltb24gU2VyDQo+IDxjb250YWN0QGVtZXJzaW9uLmZyPjsg
TGFraGEsIEJoYXdhbnByZWV0DQo+IDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPjsgTWlraXRh
IExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPjsNCj4gQ2xhdWRpbyBTdWFyZXogPGNzc2tA
bmV0LWMuZXM+OyBDaGVuLCBJYW4gPElhbi5DaGVuQGFtZC5jb20+OyBDb2xpbiBJYW4NCj4gS2lu
ZyA8Y29saW4ua2luZ0BpbnRlbC5jb20+OyBXdSwgSGVyc2VuIDxoZXJzZW54cy53dUBhbWQuY29t
PjsgTGl1LA0KPiBXZW5qaW5nIDxXZW5qaW5nLkxpdUBhbWQuY29tPjsgTGVpLCBKdW4gPEp1bi5M
ZWlAYW1kLmNvbT47IFN0cmF1c3MsDQo+IE1pY2hhZWwgPE1pY2hhZWwuU3RyYXVzc0BhbWQuY29t
PjsgTWEsIExlbyA8SGFuZ2hvbmcuTWFAYW1kLmNvbT47DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPjsgSm9zw6kgUm9iZXJ0byBkZSBTb3V6YQ0KPiA8am9zZS5zb3V6
YUBpbnRlbC5jb20+OyBIZSBZaW5nIDxoZXlpbmcyNEBodWF3ZWkuY29tPjsgQW5zaHVtYW4NCj4g
R3VwdGEgPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT47IEFuZGkgU2h5dGkNCj4gPGFuZGkuc2h5
dGlAbGludXguaW50ZWwuY29tPjsgQXNodXRvc2ggRGl4aXQgPGFzaHV0b3NoLmRpeGl0QGludGVs
LmNvbT47DQo+IEp1c3RvbiBMaSA8anVzdG9uLmxpQGludGVsLmNvbT47IFNlYW4gUGF1bCA8c2Vh
bnBhdWxAY2hyb21pdW0ub3JnPjsNCj4gRmVybmFuZG8gUmFtb3MgPGdyZWVuZm9vQHU5Mi5ldT47
IEx1byBKaWF4aW5nDQo+IDxsdW9qaWF4aW5nQGh1YXdlaS5jb20+OyBKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT47DQo+IG9wZW4gbGlzdCA8bGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZz47IG9wZW4gbGlzdDpJTlRFTCBEUk0gRFJJVkVSUw0KPiA8aW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4NCj4gU3ViamVjdDogUmU6IFtSRVNFTkQgUkZDIDE4
LzE4XSBkcm0vZGlzcGxheS9kcF9tc3Q6IE1vdmUgYWxsIHBheWxvYWQgaW5mbw0KPiBpbnRvIHRo
ZSBhdG9taWMgc3RhdGUNCj4gDQo+IE9uIFR1ZSwgMjAyMi0wNy0wNSBhdCAwOToxMCArMDAwMCwg
TGluLCBXYXluZSB3cm90ZToNCj4gPiA+ICtzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0Ow0KPiA+ID4g
Kw0KPiA+ID4gwqAgLyogRFAgTVNUIHN0cmVhbSBhbGxvY2F0aW9uIChwYXlsb2FkIGJhbmR3aWR0
aCBudW1iZXIpICovDQo+ID4gPiDCoCBzdHJ1Y3QgZGNfZHBfbXN0X3N0cmVhbV9hbGxvY2F0aW9u
IHsNCj4gPiA+IMKgwqAgdWludDhfdCB2Y3BfaWQ7DQo+ID4gPiDCoMKgIC8qIG51bWJlciBvZiBz
bG90cyByZXF1aXJlZCBmb3IgdGhlIERQIHN0cmVhbSBpbg0KPiA+ID4gwqDCoCAqIHRyYW5zcG9y
dCBwYWNrZXQgKi8NCj4gPiA+IMKgwqAgdWludDhfdCBzbG90X2NvdW50Ow0KPiA+ID4gKyAvKiBU
aGUgTVNUIHBvcnQgdGhpcyBpcyBvbiwgdGhpcyBpcyB1c2VkIHRvIGFzc29jaWF0ZSBEQyBNU1QN
Cj4gPiA+ICsgcGF5bG9hZHMNCj4gPiA+IHdpdGggdGhlaXINCj4gPiA+ICsgKiByZXNwZWN0aXZl
IERSTSBwYXlsb2FkcyBhbGxvY2F0aW9ucywgYW5kIGNhbiBiZSBpZ25vcmVkIG9uIG5vbi0NCj4g
PiA+IExpbnV4Lg0KPiA+ID4gKyAqLw0KPiA+DQo+ID4gSXMgaXQgbmVjZXNzYXJ5IGZvciBhZGRp
bmcgdGhpcyBuZXcgbWVtYmVyPyBTaW5jZSB0aGlzIGlzIGZvciBzZXR0aW5nDQo+ID4gdGhlIERD
IEhXIGFuZCBub3QgcmVsYXRpbmcgdG8gZHJtLg0KPiANCj4gSSBkb24ndCBlbnRpcmVseSBrbm93
LCBob25lc3RseS4gVGhlIHJlYXNvbnMgSSBkaWQgaXQ6DQo+IA0KPiAgKiBNYXBwaW5nIHRoaW5n
cyBmcm9tIERSTSB0byBEQyBhbmQgZnJvbSBEQyB0byBEUk0gaXMgcmVhbGx5IGNvbmZ1c2luZyBm
b3INCj4gICAgb3V0c2lkZSBjb250cmlidXRvcnMgbGlrZSBteXNlbGYsIHNvIGl0IHdhc24ndCBl
dmVuIHJlYWxseSBjbGVhciB0byBtZSBpZg0KPiAgICB0aGVyZSB3YXMgYW5vdGhlciB3YXkgdG8g
cmVjb25zdHJ1Y3QgdGhlIERSTSBjb250ZXh0IGZyb20gdGhlIHNwb3RzDQo+IHdoZXJlDQo+ICAg
IHdlIGNhbGwgZnJvbSBEQyB1cCB0byBETSAobm90IGEgdHlwbywgc2VlIG5leHQgcG9pbnQpLg0K
PiAgKiBUaGVzZSBEQyBzdHJ1Y3RzIGZvciBNU1QgYXJlIGFscmVhZHkgbGF5ZXIgbWl4aW5nIGFz
IGZhciBhcyBJIGNhbiB0ZWxsLA0KPiAgICBqdXN0IG5vdCBpbiBhbiBpbW1lZGlhdGVseSBvYnZp
b3VzIHdheS4gV2hpbGUgdGhpcyBzdHJ1Y3QgaXRzZWxmIGlzIGZvciBEQywNCj4gICAgdGhlcmUn
cyBtdWx0aXBsZSBzcG90cyB3aGVyZSB3ZSBwYXNzIHRoZSBEQyBwYXlsb2FkIHN0cnVjdHMgZG93
biBmcm9tDQo+IERNIHRvDQo+ICAgIERDLCB0aGVuIHBhc3MgdGhlbSBiYWNrIHVwIGZyb20gREMg
dG8gRE0gYW5kIGhhdmUgdG8gZmlndXJlIG91dCBob3cgdG8NCj4gICAgcmVjb25zdHJ1Y3QgdGhl
IERSTSBjb250ZXh0IHRoYXQgd2UgYWN0dWFsbHkgbmVlZCB0byB1c2UgdGhlIE1TVCBoZWxwZXJz
DQo+ICAgIGZyb20gdGhhdC4gU28sIHRoYXQga2luZCBvZiBmdXJ0aGVyIGNvbXBsaWNhdGVzIHRo
ZSBjb25mdXNpb24gb2Ygd2hlcmUNCj4gICAgbGF5ZXJzIHNob3VsZCBiZSBzZXBhcmF0ZWQuDQo+
ICAqIEFzIGZhciBhcyBJJ20gYXdhcmUgd2l0aCBDIHRoZXJlIHNob3VsZG4ndCBiZSBhbnkgaXNz
dWUgd2l0aCBhZGRpbmcgYQ0KPiAgICBwb2ludGVyIHRvIGEgc3RydWN0IHdob3NlIGNvbnRlbnRz
IGFyZSB1bmRlZmluZWQuIElNSE8sIHRoaXMgaXMgYWxzbw0KPiAgICBwcmVmZXJhYmxlIHRvIGp1
c3QgdXNpbmcgdm9pZCogYmVjYXVzZSB0aGVuIGF0IGxlYXN0IHlvdSBnZXQgc29tZSBoaW50IGFz
DQo+ICAgIHRvIHRoZSBhY3R1YWwgdHlwZSBvZiB0aGUgZGF0YSBhbmQgYXZvaWQgdGhlIHBvc3Np
YmlsaXR5IG9mIGNhc3RpbmcgaXQgdG8NCj4gICAgdGhlIHdyb25nIHR5cGUuIFNvIHRsO2RyLCBv
biBhbnkgcGxhdGZvcm0gZXZlbiBvdXRzaWRlIG9mIExpbnV4IHdpdGggYQ0KPiAgICByZWFzb25h
Ymx5IGNvbXBsaWFudCBjb21waWxlciB0aGlzIHNob3VsZCBzdGlsbCBidWlsZCBqdXN0IGZpbmUu
IEl0J2xsIGV2ZW4NCj4gICAgZ2l2ZSB5b3UgdGhlIGFkZGVkIGJvbnVzIG9mIHdhcm5pbmcgcGVv
cGxlIGlmIHRoZXkgdHJ5IHRvIGFjY2VzcyB0aGUNCj4gICAgY29udGVudHMgb2YgdGhpcyBtZW1i
ZXIgaW4gREMgb24gbm9uLUxpbnV4IHBsYXRmb3Jtcy4gSWYgdm9pZCogaXMgcHJlZmVycmVkDQo+
ICAgIHRob3VnaCBJJ20gZmluZSB3aXRoIHN3aXRjaGluZyBpdCB0byB0aGF0Lg0KPiANCj4gLS0N
Cj4gQ2hlZXJzLCBMeXVkZSBQYXVsIChzaGUvaGVyKSBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQg
SGF0DQoNCkhpIEx5dWRlLA0KDQpUaGFua3MgZm9yIHlvdXIgdGltZSENCkkgd2FzIHRoaW5raW5n
IHRoYXQgb3VyIERDIGp1c3QgbWFpbmx5IHRha2VzIGNhcmUgb2YgSFcgcmVsYXRlZCBwcm9ncmFt
bWluZy4gDQpTdHJ1Y3QgZGNfZHBfbXN0X3N0cmVhbV9hbGxvY2F0aW9uIGlzIG9ubHkgdXNlZCB0
byBjb25zdHJ1Y3QgYSBjb3B5IG9mIHRoZSB2aXJ0dWFsIA0KY2hhbm5lbCBwYXlsb2FkIElEIGFu
ZCBzbG90cyBjb3VudCBvZiBwYXlsb2FkIGFsbG9jYXRpb24gdGFibGUgZGV0ZXJtaW5lZCBieQ0K
ZG0vZHJtLiBJRCBhbmQgc2xvdHMgYXJlIG9ubHkgdGhpbmdzIHJlcXVpcmVkIGZvciBwcm9ncmFt
bWluZyBIVyByZWdpc3RlcnMuDQpJIHRoaW5rIHRoZXJlIHNob3VsZG4ndCBiZSBhbnkgc3BvdHMg
dG8gdHJ5IHRvIGNvbnN0cnVjdCB0aGUgRFJNIGNvbnRleHQgZnJvbQ0KdGhpcyBkYyBzdHJ1Y3Qg
c2luY2UgdGhlcmUgaXMgbm8gc3VjaCBjb25jZXB0IGluIEhXIGxldmVsLiBPdXIgSFcgc2hvdWxk
IG9ubHkgDQp0YWtlIGNhcmUgb2YgbG9jYWwgRFAgbGluayBhbmQgaXQgZG9lc24ndCBoYXZlIG92
ZXJhbGwgdG9wb2xvZ3kgaW5mby4NCg0KVGhhbmtzIQ0KDQpSZWdhcmRzLA0KV2F5bmU=

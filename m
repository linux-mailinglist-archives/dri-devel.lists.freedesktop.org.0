Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGivHuW0jWl96AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:09:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD40A12CDF3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B8E10E727;
	Thu, 12 Feb 2026 11:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ginzinger.com header.i=@ginzinger.com header.b="M0byNLLQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023137.outbound.protection.outlook.com [52.101.72.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEC110E725
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 11:09:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/vxRzDMwv6RFk35NzAkcyFtEJffrNRMgt0UaLEMx9s02DwccfzXCwG/oPgj3ynOV1gxLTE1UmuJuW7m6ZnJtEQm4WNi/GCFxfyVBEEYJnfZB8O5EZOSBFCWAvey3fJ3t5EU6cmM0bEypQEOgcQmNQNPx8/FWCeSKgLPseTe9GKGT1a1zTO9fzZwXB9PPXrEhEy/onPCJWETww6auHKy/U5Y4GDQMRGMGlYhxGb5DgoWeVrFjMofEk5UWjAMrZF/naRA3Ivi0zQ47aT+IDeqUecffFJso69XzQ4WMSap8sDm92zCEU5OdPpvCzU1tHPb4n2UJQA6AvaHOr5HjO/RgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIbLMn3ULjw+bYkHue1aUPF3iN3nplw4EEfzOTDv0xw=;
 b=N4bagLmGRFrPCLs4DPAl+cfx11KpYIEZxdBMc8gO1Xl4VvAKdlr8KUcE0c+8ZkShr5ywNlLPWJXxs5cJNiHM5tNxTHbEoA1iP76MuMhbKZ1GqIXsn9+nrgo33dvVGgFpmjUAigOOCxvk6UlYDU2/pnYvXyXI3UJ9pqhRCf8KcEVq9tWAYv2KNF2BN8ueJh+dhm55BVWztyxB6Zi0xD5dweK358CsF7HnxSSBVJmacdxELOPDP41W/fWR5iST7Fhlk3dpl0GFWXtDMs3rIM7qMKdKS/rgMYfAztKpsR6K9ZG+8kSPlbNqyUyDPdWXmLIkldtJGj5EP1YDVA94Hv0WjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=ginzinger.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ginzinger.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ginzinger.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIbLMn3ULjw+bYkHue1aUPF3iN3nplw4EEfzOTDv0xw=;
 b=M0byNLLQqUNaEDZAnYX5x/8kySh4EHNglo1iAOghcxbmB5Rmq0iQopsrKoqHxNHul0EbyhoIpelqOPoyb93gtomz3R+saa27ZEMu89BmLUVaQ3p7/WqA2E3dlji6QO3mBWhkuVG46I61xPSoNeMwkmePbkIt4t/vwYHE5jkZIEcbur+qRS2BHPFYaaC4KGqTzGbC8VuLfXgloihMWCKnIitBrcO816QICAiGZgJNNNAWRre+TcDCJa4R4TUK3F10yc/+/tJxogiPtMfED54Sz8LfaWBe6UEcWs66vAw660IGQM6SlqK7bMDYDl6xNbUlZBtP4eL4nbVaYkf5isa9hA==
Received: from AM8P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::22)
 by DU4PR06MB9594.eurprd06.prod.outlook.com (2603:10a6:10:56d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 11:09:15 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::69) by AM8P191CA0017.outlook.office365.com
 (2603:10a6:20b:21a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 11:09:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 11:09:15 +0000
Received: from GV1PR07CU001.outbound.protection.outlook.com (40.93.214.98) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Thu, 12 Feb 2026 11:09:14 +0000
Received: from VI1PR06MB5549.eurprd06.prod.outlook.com (2603:10a6:803:d6::26)
 by DBAPR06MB6664.eurprd06.prod.outlook.com (2603:10a6:10:18b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 11:09:10 +0000
Received: from VI1PR06MB5549.eurprd06.prod.outlook.com
 ([fe80::2c95:365d:522:dd25]) by VI1PR06MB5549.eurprd06.prod.outlook.com
 ([fe80::2c95:365d:522:dd25%4]) with mapi id 15.20.9587.010; Thu, 12 Feb 2026
 11:09:10 +0000
From: Kepplinger-Novakovic Martin <Martin.Kepplinger-Novakovic@ginzinger.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/imx: parallel-display: add DRM_DISPLAY_HELPER for
 DRM_IMX_PARALLEL_DISPLAY
Thread-Index: AQHcisBkNN48yJtn1kuDwghTkACIALV/CoUA
Date: Thu, 12 Feb 2026 11:09:10 +0000
Message-ID: <ee871abe652787e07129813ba4fa4597eca21ff1.camel@ginzinger.com>
References: <20260121102607.4087362-1-martin.kepplinger-novakovic@ginzinger.com>
In-Reply-To: <20260121102607.4087362-1-martin.kepplinger-novakovic@ginzinger.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: VI1PR06MB5549:EE_|DBAPR06MB6664:EE_|AM2PEPF0001C712:EE_|DU4PR06MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: ea8768c3-d0f7-4933-fce2-08de6a272897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?emtUWUV1S1pFSHZzZWVZaHBSbXlsNVBHTUpSd1F0NGZTVGpFL3N2TjMzZUVu?=
 =?utf-8?B?N0pWQ2lrZkJCYXd3WHh5VVFZaDZVTEY1dm5hK1VpR1BjaXc4RW9ZRFBZRmlu?=
 =?utf-8?B?RzgxTUdhcHpJOXlMTzNjKzgvYjRMU0UwbXZ5S1lYVUFyV1VrbGtselFzZXhn?=
 =?utf-8?B?azFJMWx6Zm9JYXg2UEpoSUhJSVhLMDlmNm0yUWh4UTVlUnU1VjVRMDNBdzlt?=
 =?utf-8?B?MC9nVXo5b0hlNS81UjlnKzFYZXRweEw2c0dvRzQrUThHbHBlK3dQaFhxOG1a?=
 =?utf-8?B?b2xSdWxUaDdrL1FLVm4vK0R6WnlQd3VVaW1yWjB1ZGtBT043ZWZ6Z1FlcTRu?=
 =?utf-8?B?b2tFYlcyVkpuY1ROY2dRRHB1cnk0c3BUS1A2Nm01K2VKYzRZMEJlYnBrMXNM?=
 =?utf-8?B?MDA0RUt2bWNEZ0NLOE5oVkd1UjlmbGxaMGk4QjZtY3JSOWk1M2wyWTE4UmtI?=
 =?utf-8?B?L2RBNlBQYUpuZzExTy94VWM1VWNpWDUzTU90Vkxrbkk5MDVuYWtONFg5T1hw?=
 =?utf-8?B?ZVNyNjNNMVd1WjlmN2d5dTZyUkxSK0hwbmhGWW5PY0lXODRRdDdyVlJVMmMz?=
 =?utf-8?B?NE9TWHlzdklSMFNrN1M2VXZOK21VRTZMK21ualpaOGZaeDYrczI0bi9xblVF?=
 =?utf-8?B?aks3Yi9LVzNSWE1DVjI0NUc4MWpNUFlwMVU1elphTFdMcGZyblM5c29pT21M?=
 =?utf-8?B?a1BGOUJHQXcvMmxNNWNFeUppUXlXUGRPT0RaajJIeEduZlkyU20xNUo3ZVl2?=
 =?utf-8?B?eEI5WG5IMGNTWXVyMEhJSk01bzlIMGRqT2JPVjN2VXQzMnlxUWcxZlhhQkV0?=
 =?utf-8?B?OVp3RzF6cElSUHRSWkhCUUQxd3lJUm9SQUQ4dHBSSURFSWdsalFOKzlHbkxE?=
 =?utf-8?B?dVVOVDlRMUdhNkhiaUU2ZGo3N2F4R3c3T3cxOG01ZEs4OTZuaGZKMkRGMDN1?=
 =?utf-8?B?b3JwY3Q0ZXoycVI3cjk5VDRvVi9MblptSlZ4VXJZbVhyanBsMGZXc2FpbXJu?=
 =?utf-8?B?V2tmUVE4Qmx5alV4Zm4rVzgwQ0pOTE56S2FzSjhiOXVPWGp5S3pKOWhDcGlM?=
 =?utf-8?B?MXh5ZCtOb21pTjRyekloVkJleXZJR0tiUml1c0dLSXNWM1MwY1pqblZucGNY?=
 =?utf-8?B?MWJobVlhUVZzcTRvc2tTaWNzcVhWWnY5c2I4OW51RC94MEZNSTZIdVdvbVVH?=
 =?utf-8?B?S1VNVFd2eG9UMTJ1bVJINGplaUMxcENlSUl2OWI3TGk4Mlp3OExuQ0lpcVNK?=
 =?utf-8?B?UVVrQzhEUWdpS1FmaE9WOERmWk9hR3JsM2E2YmVHU0RvVFY0akgwSmU1eTNa?=
 =?utf-8?B?OTlyMnEzUHRud1FsUktPelBLZGl3VW95QTc4QUk2Q0RiTS9Oa0tmMTZDWnVX?=
 =?utf-8?B?ZGJUZzMzUXEzeXdZcjkxMWkvaXVVTW51U0RWNHpvWVFpM2hjaTdqTlBLa2lZ?=
 =?utf-8?B?cVgvWHRGWEVqN3JYdi84eHBJUmdZRDVkeDNxQTNKV0lrMGwya2FxSUd4QUJD?=
 =?utf-8?B?MFFqZUpHTFprUWlyS1Bwd0dnYXpPc1RYdEN0eE03VnVBMllJWnVCWEQ0bU0z?=
 =?utf-8?B?WTBMbFc1YWV0eFVqcGJXZFlQU2R1SGxmWkpHQ0JpTThtakIrbnBnZmxTUTJs?=
 =?utf-8?B?RGZnUlhrSTRiUXFxT0h2Wis1RzZjc0FJeHJvMEVCVUpqTmlZdWdxdUVjZE9K?=
 =?utf-8?B?L0s1Q25wTEM1TWJKL0ZwM2lvQUR2L3dPVDB1WWVETjBjbFN1K0w3VkphcWN6?=
 =?utf-8?B?NXFpbXlUeTljNTAwVHRiK2FKREI1UWxZZXpuNHkwMlZaTUFtSDh4NDlGWWVs?=
 =?utf-8?B?bTYwZXBsUDRnb2N5N1UwNWx6SlBrMlV5ZXNhWjIzTlNaUlY3ZWFOdFVoVm52?=
 =?utf-8?B?QVA2Q3F3VjVEVXEvS2EzTWx0ak5tWHN2cWw4ckxCSlBkNVlKMEh5Uk9YN1Ft?=
 =?utf-8?B?RUVYeDY1YW94aGJDcDB5NzIwY0xEbnZjcjJPT1BVb1VZZ0F0cWF5RjRtMjEz?=
 =?utf-8?B?eG8xY2xWcTkvek5XRVNINEJsdTJ2QmM1RnBFYVM5aGY4RnJHZzU5WkIzLzVO?=
 =?utf-8?B?NGp0ZnhHazljbVhKQjkrbUkrK05yYTRGWlR5VmExVGJ5UndkY254ZjN2ZC9N?=
 =?utf-8?B?NDRvM3E2VmJicnNaMks3US91MXA1U05IUUhFN2Y4YUExVzhCVU80Mjh0bHBv?=
 =?utf-8?Q?kzMO5agtaQ7C2CbD1d+s9zo=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI1PR06MB5549.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <D87B9938A74AB2459E78D4C3550A2E97@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6664
X-CodeTwo-MessageID: a51315e5-5550-4d52-b971-e4844d416b51.20260212110914@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ef629554-8a1b-4a9e-e549-08de6a272610
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|7416014|376014|36860700013|35042699022|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3puOTNxUWhkTHh0SG5KR2VZZjdnNDQxMCtURGhLb2loaWpxT1prYnVHZU1B?=
 =?utf-8?B?QlZTTysveU0vQzlhaG92VnZTT05ZcS9hcURiYk5uMnN5L0xFcW5XbWVuTHhw?=
 =?utf-8?B?ZlYzaCtXblhaM2tkY3c0ZW5FMUFyVTNWT294ak1EWlVRY2dDNURkWWZNMnZU?=
 =?utf-8?B?TGJwMXR6TDdlTVUvRWhoUCtZbVBvQjZCbjB2bWlGYWtNcytFUlkxbVYwd2VY?=
 =?utf-8?B?L2I1Zk54UC8rYW1iWktZMlA3Ujh1cDNiV1lSVHl1cG1wVlA3ODcxdEp5V255?=
 =?utf-8?B?OW9HMUdFbHNhSUprek1PT2tvR2lsbVVySHJ2bUo1OEJZVXcweGxXM282M2Nr?=
 =?utf-8?B?dEFVK0NyOWdHZGozcnBkL0ZkemVmWUp3cWRpaWRBcUFyVW8wWVJ2eTVnbURT?=
 =?utf-8?B?Y2RZc2QyTUF5aU5lL3FvM0czaEZLZll6RXEyc2wyM1dVNFV0THhXa3BGL3Rn?=
 =?utf-8?B?Uk5XcmtrZElkaEJpeWdoN01mWU1FY090V0IyRmVPRThFbG9OQk13VTBxR1lD?=
 =?utf-8?B?NjNZL2cvY2p5Z3YwMTVqN0Y5bXlOSkZhS3MrOHJySjAyTXhrL3NDNm10eTdj?=
 =?utf-8?B?VTJEUHljOXZHZS9NazZzbnVKSGlFSTAraElyQkVNYWd4ckVCV1h1ajEzMVRm?=
 =?utf-8?B?alhOWTNHYUY1VGpTa3RNckI2c2RZSUJKaFlsTXhTOGNUQU9tY1dPQy9jQWNJ?=
 =?utf-8?B?bVIvV0tKQ210TS9GWUpCQ1gvL1ppVDd4bmJCcHZPZXFwT2w2MWVsSlRoK1pU?=
 =?utf-8?B?WlozT1lVemM5QjFrMTArdEhrUHRpaml2Sk0xMGZBYTc4NjhqeHdLY0dCR1cr?=
 =?utf-8?B?dWJMajkvcXFGalJIa2VYQXFnaXlZRWhFcXQzc2hVSHp6N1MwcStPMmMxSWxC?=
 =?utf-8?B?WVNVRUNZV2d4VVFEMlQyUXYvUkdvNkFEdHpid0h3UGdYVGJrSWUvVnJTalJW?=
 =?utf-8?B?RFlmUWViTkhmaXpFU2VudjdqZ01PbXlTUzA0R1QxcXU4azFMcXZsbkgwaG13?=
 =?utf-8?B?SDhOajhuYmE4aDh5aGlKa1hjM0VoVEhseGp6aTB0a3E3VzdjbHVOUEdWYi95?=
 =?utf-8?B?aFJWbmNJWWJIUjBpb3RqamdCbzhXT21FRjhUNm1JOE9lSlNCbG9adGNVZitm?=
 =?utf-8?B?b3NmMUxHQTVtZVRucTV0WFhXbGZZSUtuTVZ6OEppY0Q3M2F6VXpGRFEvT0pF?=
 =?utf-8?B?U2xwWUlhajRKL0pMUEVnRjIwam1SODlRMUFxZW5FZWpqbFllSXl6K1NNcU90?=
 =?utf-8?B?Z1Noc0hQVzRLQ000STUrTW1hQjdWaHI1RFF3L3RlN1hCeE1vUjZHZDNvZ2p4?=
 =?utf-8?B?THJUbWplZ3NjT1NaM1pkd2duQWVOZ1VYRk1laWRqWmY2R0dVczRMLzgvZUth?=
 =?utf-8?B?RkwrcVcwZmRxenU0WlRiMUcxaXFyN05XbTVwN1FQQmRWaHBpSW11UXRtS05r?=
 =?utf-8?B?bVFkUmYyUkFOcVE5MDN0ZFpjY1pRc3Boanl4YkhKRC9jQUxqSEZ3c1A4TlZz?=
 =?utf-8?B?cXgyZGlITGh0T3RnUzRZR1BZUFpBeEJhTXczODFFa3ZleW1zSmFNbWNNTjNp?=
 =?utf-8?B?bVRrSkUvMEJnRmRNdlFOamZBOXNFV1JmdlFVYVVCMWpaeEl2MXBDdlEzSGRy?=
 =?utf-8?B?VmhyUFN0cnB2TmVybGFZQXhabWx0ZVBocWZoMU1qa3dMZ2FVWDJNY3VnK2xr?=
 =?utf-8?B?TnFlYzNFWVRaUnJ4NE1oODZ5ZWY1cFRMbVg5dEk2emNHWlRIdEJMMGFwQTNI?=
 =?utf-8?B?ajVUWmwyNDYveGxjMis5emtDdGg2YXpnN2VYNFZtbkFzSk52TDVTcGhPQXhu?=
 =?utf-8?B?L2h1U0pkVWVDK2VFOGc0ZmQzc2ZhdlhaQTlFOXRwVVBYVENsWFBPZmR0Ymdu?=
 =?utf-8?B?d0ZHNlRHOGN6UWRYR292eXFqQUZOZzNQQW10WFlnanpkNGlERGhNdzQrbHlF?=
 =?utf-8?B?Q2NVTTFBK3VhVTgyWGd3aXlXNHRTNjRRcmdLQkVvcW9IT2xNNDE5WHQwcWhu?=
 =?utf-8?B?MGlZNklrOHdVNlU3akNMdWNaWXp1eXdwUGgveTd1K0krZ25hTGw5cENqd2Ni?=
 =?utf-8?B?WktQOFpGcmV1RzAxMXBOcWUxaXg2aktUYnczcWY5cWVid2V3SWFyTkU1a1cy?=
 =?utf-8?B?aGFYTE1hNUlBTithVkpKZm1SNkZia1lueFBxUktUdHdTNWtoNXRvenJVb3Fp?=
 =?utf-8?B?Z3kyOHdjUUJ5WEdTQXRGMXVUWlVCaWpKS2lxWHp5a3V3ajQ1Z3BDM0JLT1pn?=
 =?utf-8?B?M3duL0dpOU9SK0FYcjc1cEEvdzFnPT0=?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(7416014)(376014)(36860700013)(35042699022)(82310400026)(13003099007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: le3TieZQHaA3CgTFGTF68ypdsovuOni1pp3mMrsIUql8uVbdVMFggVvtpCnwFhw7Q/2y8+pOTJuAFuO6hLGQSL9vFeoLUuOnaMBICWHME2x8hYiCO5E0uksJgZaYU90OX4a5s66hjr5VmnPElGtibTN8tyXtKFrOvMCvTPyXAMPb+EgICrnsW+x33CHMLS5Ax3aJwx2gHlUfCqbsCEhAuOMs4tZMZCdOxsLDm86nlv6nSynro4dFrsBaZ2rAITScc12Q5+xhm2T0UHuTvnxsgCPkuHzcUgn4jxnpJTQ+jEg3yz62PI8Xq0hUj7mndk1uO0sOWojcPhNB36hN+oP6x8uBn93CDGNlKNuvLvkPxAkOAfAM9sHp5rFrpEqvHlALbUGBNxDihC9W6VzHyVld4Ng+vEGMf5+NF9p9CDWPbfV0584V5PktkdXITp7SmhIn
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 11:09:15.0172 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8768c3-d0f7-4933-fce2-08de6a272897
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB9594
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ginzinger.com,none];
	R_DKIM_ALLOW(-0.20)[ginzinger.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[pengutronix.de,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Martin.Kepplinger-Novakovic@ginzinger.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,ginzinger.com:mid,ginzinger.com:dkim,ginzinger.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Martin.Kepplinger-Novakovic@ginzinger.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ginzinger.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BD40A12CDF3
X-Rspamd-Action: no action

QW0gTWl0dHdvY2gsIGRlbSAyMS4wMS4yMDI2IHVtIDExOjI2ICswMTAwIHNjaHJpZWIgTWFydGlu
IEtlcHBsaW5nZXItCk5vdmFrb3ZpYzoKPiBXaGVuIEkgYnVpbGQgZm9yIGFuIG9sZCBpbXg1MyBw
bGF0Zm9ybSBJIHNlZSB0aGUgc2FtZSBhcyB0aGUgdGVzdAo+IHJvYm90Cj4gc2F3IGJlZm9yZToK
PiAKPiBhcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi1sZDogZHJpdmVycy9ncHUvZHJtL2lt
eC9pcHV2My9wYXJhbGxlbC0KPiBkaXNwbGF5Lm86IGluIGZ1bmN0aW9uIGBpbXhfcGRfYmluZCc6
Cj4gcGFyYWxsZWwtZGlzcGxheS5jOigudGV4dCsweGI4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
bwo+IGBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9pbml0Jwo+IAo+IFNlbGVjdGluZyBEUk1fRElTUExB
WV9IRUxQRVIgZm9yIERSTV9JTVhfUEFSQUxMRUxfRElTUExBWSBmaXhlcyB0aGUKPiBidWlsZC4K
PiAKPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gQ2xv
c2VzOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNTEyMjQxNzIx
LmpaZ2N3UmZyLWxrcEBpbnRlbC5jb20vCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFydGluIEtlcHBs
aW5nZXItTm92YWtvdmljCj4gPG1hcnRpbi5rZXBwbGluZ2VyLW5vdmFrb3ZpY0BnaW56aW5nZXIu
Y29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My9LY29uZmlnIHwgMSArCj4g
wqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2lteC9pcHV2My9LY29uZmlnCj4gYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYz
L0tjb25maWcKPiBpbmRleCBhY2FmMjUwODkwMDE5Li5iMjI0MDk5OGRmNGYxIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pbXgvaXB1djMvS2NvbmZpZwo+IEBAIC0xNSw2ICsxNSw3IEBAIGNvbmZpZyBEUk1fSU1Y
X1BBUkFMTEVMX0RJU1BMQVkKPiDCoAlkZXBlbmRzIG9uIERSTV9JTVgKPiDCoAlzZWxlY3QgRFJN
X0JSSURHRQo+IMKgCXNlbGVjdCBEUk1fQlJJREdFX0NPTk5FQ1RPUgo+ICsJc2VsZWN0IERSTV9E
SVNQTEFZX0hFTFBFUgo+IMKgCXNlbGVjdCBEUk1fSU1YX0xFR0FDWV9CUklER0UKPiDCoAlzZWxl
Y3QgRFJNX1BBTkVMX0JSSURHRQo+IMKgCXNlbGVjdCBWSURFT01PREVfSEVMUEVSUwoKcGluZy4g
YW55IG9iamVjdGlvbiB0byB0aGlzPwoKdGhhbmsgeW91IQoKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbWFydGluCg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC04B8BA9DE
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 11:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5313910E079;
	Fri,  3 May 2024 09:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ScBLbPYt";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="naCDcigG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4C810E079
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 09:28:58 +0000 (UTC)
X-UUID: 8fe67888092f11ef8065b7b53f7091ad-20240503
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=9VQWYVIk6DyTX8wTHXfzEShxIkiPi7i6+cyvvEOZ2YQ=; 
 b=ScBLbPYt7YWTXWVCJRVdbBE9ouchj4j+zsXPlDTXRZH6cf9KlCDjhPUPSaE7WliLbSn4y5WrtLoF5fSho+xnX7t8suE+EYpCu535SQpXHL/INEI/XGJnnvzKoelVYUV6naHPlKfbdLbR7Y66tv001h0PW6dPjeJPHuuuZiRty8Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:c7282845-ea5d-45bd-bfe0-c55c4cf7a710, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:9aa3a5fb-ed05-4274-9204-014369d201e8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8fe67888092f11ef8065b7b53f7091ad-20240503
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1587064719; Fri, 03 May 2024 17:28:55 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 May 2024 17:28:54 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 May 2024 17:28:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guh8X8wCsfdbA3bHBRApdoFtUikqs9oIsHITSlbyA/BlVdYCj0Z6aYRYEf9Bgxc+BroBOdBAVubqC1j2IrEElfmc0XKQjTry0dNhUvegJh4QOY7VR/Oidysy6oWYBUvayQngkbk3LLf5FlSXFZYIk3m5+vXFJo/PP30uO6wb6n6TA1rHPzb7YLbjB1a7tzhgCuBCEGzWYI+CmRh4SeWmnPvp6xPbs66R9fBazWLuzEoiv2gWoE/PikDcnFh/W7SRX5JntVr6n8uA7ViEaaOhTsOiHavKe8QCH3zWAsU39FIdNxmuZXUMsEMxjBfkvrE5jgtRAC21xSZCAUbtJh+Aag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqHrgozgjGfd9AyIS+8x1gOetNdtGcm1msUE4M4dlLw=;
 b=gyDlEQd2G4utgWXsW83A/ME42JsRuTI4HS9wwcZRg/ipfC9ONBHLsDk6rYW5bwBbFCiAc4GV58aw93/koOeG7rPxQMk353aXE/w2vIyCBenAnjkrTOvG7/M/hkupuEXL79Fa1KnonlbZ092kPTr/gS7KNmNB8vlp7bvKhjoL3xF7A9lxL9iXde0LIU5MPeKuU8RG7cmA0Fblcra29bDy/xp7KxaSvXXEz6Nr6XylUSlDrEDFW0nDRB3LpYW83f2aufIpyasuoZLfeav0wB7u0MEDijU1RvG4ttj0DeicLMGNL5DqCwCZRsPESntxhMSVDPbwvtYPGJ+T57orZnMTmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqHrgozgjGfd9AyIS+8x1gOetNdtGcm1msUE4M4dlLw=;
 b=naCDcigGMpWtx0kvSS4eFjXowtFd0XHkxy52SsCuc2qaZP0UZ74BVGmp8YmmxX5sTqqex9WLCIMM0XOyZJESN1CVuFPAyMhnugiGUqyaw5S/HKHgNYgb/0GgOrSITr1ibuHZk4mXnLBWqFlhj78FbaeLwWQroUyDG4PEqMfU6GA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8249.apcprd03.prod.outlook.com (2603:1096:405:1e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 09:28:52 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 09:28:52 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 12/18] drm/mediatek: Support "Pre-multiplied" blending
 in Mixer
Thread-Topic: [PATCH v7 12/18] drm/mediatek: Support "Pre-multiplied" blending
 in Mixer
Thread-Index: AQHanH0LyMy6O7cZrEyCT0yDlFAQQLGFP6OA
Date: Fri, 3 May 2024 09:28:52 +0000
Message-ID: <86db6c04cf2e3873232c93f8c7d33814a1a42edd.camel@mediatek.com>
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
 <20240502103848.5845-13-shawn.sung@mediatek.com>
In-Reply-To: <20240502103848.5845-13-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8249:EE_
x-ms-office365-filtering-correlation-id: 26c9b7aa-1966-491e-a614-08dc6b537225
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|7416005|1800799015|366007|376005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?RVpFb0MxL0tnNjVCZFBJZkw5Qm1GNThDQ0V1OUJwWk1KSjNSTEVZNFprbnZu?=
 =?utf-8?B?OWo1d1IrMGdRb3FuNS9jajJGNjgzTGgwNmNabGFjUEFxMC8yelBMVlRxLzIr?=
 =?utf-8?B?eHNOenB6V0tic04xUS9MQkw5NEllT1I3cVM4Y24xQUMvTHpIYUxsaHlOc1M2?=
 =?utf-8?B?NUVCMmxGajFCZXBRaWRDK0o1NFBWQnJVT1hPdnFPUlNWdGl4ZGpxVVJXU3dC?=
 =?utf-8?B?UUFsaVZlb1ljbXVzaUpTUDJ3SlZwaWFLTnBNZlk2OFJiQndoZUNQV25NN0R3?=
 =?utf-8?B?ZGpIRkpNQjJCVW8zUnZZS0sySDgxZjV1ZkVmUzJBSkx6QnlZOUdUQkNhZHlM?=
 =?utf-8?B?clZoaU1rS3FtZFZBaWNmMnBCcnRwMHk0aENUcGtIRjhUSmRRZG8xcStYc0hm?=
 =?utf-8?B?M3dWM2o0Yy8yOWtnN3VYcGFVQnNoVW9jNGxhNXZhemI0ekNoT1A4MHdiOHdt?=
 =?utf-8?B?MjQxVk9FKzk1UzNPZlduNEdkejRsd2t1ckpIdWJwT00vRjg0dFMraWloTlRw?=
 =?utf-8?B?QTB0cUtuYVFDVG56L2Z5Z2hqNjhBYWRnMlRjdThydEs2dGQ2cHVZNkx2RDFa?=
 =?utf-8?B?ZzJDN0o3SW9TbGJHRTY1T0REVTdCVnlCNmJVcnAzZFhRMWdkMW1mbG5nTnVo?=
 =?utf-8?B?NlVMek50L3NtZnVjRFY0M3hMY0xGMEt2UnBIdHdNWkVlbWF1NjZySTNaV1VU?=
 =?utf-8?B?WmRBUWJvUUJheFB5UElSRXI4T0FBQTk1TU4yVU5ONlFjd3dlTldEQzB5ZXlY?=
 =?utf-8?B?RmR0N3hQdjJJcmx3WnVFbDNaSHJRT3F0a0V4YXhIU2kwY1hQenlKQS9tY0I2?=
 =?utf-8?B?bWtzbmNUVVpMT0UxUE1mNFZocTYvYUpCY0hicTVZWEx6NGJ1cG9nUHJiamkv?=
 =?utf-8?B?NDQxMFlnZ0NoTE00N3p3ZnM3cUpualJEYmlFN0VsMDNXSkFZZWVmWFVuc0xN?=
 =?utf-8?B?eGJYT0xsT2RwNGdVODVzSk1LcWJmcGgrWTBFVEIzS24vb0FGQTBkcFJoWEVJ?=
 =?utf-8?B?NXdXQkxZRkp5Qi9XamRkeFJES2cxRDFsa1U2aFV0YjRLYzI0SG0zWUdYREtW?=
 =?utf-8?B?ZDZiMk5UdWtIbWZEYW9maDhIeDdFaUdicjZFZjJ4YXpUU29tdFRmdG9Yb3kw?=
 =?utf-8?B?MEc1WlNJNDNHK3haVWlYV2hiZThDc1VFVDVTTTViRXRIKzV4dVlHMDUwTHBZ?=
 =?utf-8?B?RVA1b1dsdktXazFUMmdXeXBhRlQwZnFMcjhiYUE2NStjNXFsZXFxaUxnZ05n?=
 =?utf-8?B?RTduengzM3RTaUR6ZGw4dUEwWTRDZzB3ajIxdHFkdzBVWGJaOXVSTjlVemRS?=
 =?utf-8?B?L3IxaGtWekw3bkl2SmVRQVIwR1duRzVGa0NkZDgzOTNaQ2tNUm8vcFhwZnF4?=
 =?utf-8?B?MlJtVXA0UmJqSFBlZHA5ZkMraUZ0N0R5VEVCT2I4QzRQb0V1dExxSkNFZFZy?=
 =?utf-8?B?blBBd0ZRY3F6eFBaTjBySkJHNU50dTZZNEZ2MnhmUWd0T1lRdFF5dnN4Rm8z?=
 =?utf-8?B?Q1FnUE8zNTRZQ0VVK2M4ODdzRllvdkltME9iMFQybGpRSGFtWGQ1em1pY3V3?=
 =?utf-8?B?QmtYQU9MaldkbWRHSWhKWXJYUzlPdDhURXhJN2lsWFNGeDRwd21xY25adXc3?=
 =?utf-8?B?SDhqaDRwSkh6OXo4c01DSVNINC92Mk5ld1ZVblhaeEFzTVduRzlUc3N6K25T?=
 =?utf-8?B?SSt1Y3IyT2lkbXp6U0Q5bU1oREx5aVZrdnVMdmlVNTF5R3Z6MjlSaGtqalFP?=
 =?utf-8?B?Tk9TZ2xlRUFWK2JOSGhwV05manlSZFA3ZG5yUjBYY0VMZUgwRW1pdEF5ZS8x?=
 =?utf-8?B?bXY5bXpwcHhZd0lXNWNvZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(366007)(376005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TW9ndUNMbnZQNXlna2tzbkUxd0VCN29WZ2tXRGxaSVZMWi9heHcrN2VISE02?=
 =?utf-8?B?OWh2MG9LbEtwVzVKano0MTRrZENobG9wK0pqd1lycXJtcmE1QkpNZEFGY054?=
 =?utf-8?B?cCtGNFd6ZUhWK3psYkZiWGZhd1pmdk9rT2pWSk5jR1hTWTJ2aHBlSkZ4c3U4?=
 =?utf-8?B?YVdjbzg0UXN1VERCNGs5bHBYSVlXMEhKUUFkZUM5ckpqeTB3STBuZ3ZvRGdN?=
 =?utf-8?B?ejFwY25wTkNVN2RYemp2VlQ1K1J1ZG1DVXd1ODkrSm9jdFhGYWRGRGlyVjlP?=
 =?utf-8?B?Z0o2blJwOW1GUzh6YTJzdVVYR1VTR0luMjdQVSs5aUw0ZEVMVVJzKzZmUEdK?=
 =?utf-8?B?NW9PdjVxK0JObk0rNkZRbjJ2RzZrUGo3WjRHd3kvQU5KMlluYlN4SXpMS1dF?=
 =?utf-8?B?eGowUkRoVm1kZFY4SnoyRVFnTFBuUm1wU1N1ZEtFVzh0TWNvQS9Xc1dRdC83?=
 =?utf-8?B?MzVpTjNpYnBVOGZPTTlicE5jOGd3K1dVVDlHTWNQbVR1emV3U2JYN2oxcjFM?=
 =?utf-8?B?R1NmS2greENlZnBSbU80ZFBKdStvTlNqUFhCUTFnNU5CWHlSdWZVNGxQeExs?=
 =?utf-8?B?NEJkckNJbDU5aXhLZFNGTmV2SUNvVlEyQmtwK2lpcmlybHpzL1ZteHpzZklK?=
 =?utf-8?B?dE9kbVBYSzFRTHI0ZGpRbHgvT2wvTjVGU1JzbE5VM05SRk0xRUNSMUZCRHov?=
 =?utf-8?B?dVRSWUJORGpjWm9PUExJUlE1NUFOcmtrR3lXTklBUXQxMkJIK0RWNXZ4d1hl?=
 =?utf-8?B?RFppSUNIVlUycGpFa08xOEpxMEUrRWtJdGNiMXR1WllIcHRJMHIxcEpNNThO?=
 =?utf-8?B?bWt5UWJMNTIvWkRxTXc5emp6bEN2VjBhNGM0SjF0ZTJEUWFPaGd3TnlmYisr?=
 =?utf-8?B?L2V4WU5RSUh3ZzZPUk45YWFNTnljeXZnQ2l1UEYyeU1QQzEzNG5DWmlpenox?=
 =?utf-8?B?eTJka2RoQ01rRzJ4QU9FSXlvYjFOalZLOW1SVFljK0R3MlAwZktKaVRCQ2or?=
 =?utf-8?B?MjB5cVZyN2xrK0ZIMmphRTJzbU1jd1VFa1BMNEsvcTVaTmJqSE5UM0J3OTR3?=
 =?utf-8?B?TnowbDgxaDhqY3huUUZBYlZPMlVhVEVPTVc5MGNRaWtSOE9uUFlMSU5ZVllr?=
 =?utf-8?B?VldHV0lVa2NkOWJkL1pLQWF0MHU5amhaYUErSVU0dVVHdy9ZaHdVdkpmZjJp?=
 =?utf-8?B?RVVXaTVkbGhRN1BJOUo1VFZ3WW9TTGlYcFRNSkF5ZXR6d0J3eWVSRW5OY3M3?=
 =?utf-8?B?eUYwT2tZajJPWE9BMFNJWUtmb0lMZDF0eDV4Mm1OM3hnYzhRZGo3cjNDRDFO?=
 =?utf-8?B?SEVrckFEMS9Vb3BpS1hSZjBhUFBBWEYrVDAwRlZPNm5uZVpWUHJjd2tPTkxm?=
 =?utf-8?B?L3Rxcm9IZko1a2xraHpwcXJBV3pPanV3SndJdnRtOFBGdjdLTy9pbFhBZ2ZU?=
 =?utf-8?B?elVCZ09qQWMvdzlDNit6YWVMRFBxQnZKT3d6N0xSdUd3VUI2a3lENUJkQWhj?=
 =?utf-8?B?OHFFMzZDTktjOGFKU1BOS2ZCN0QxS09BSzhPSEJYMkNrNVZQbTU5YlpHMSts?=
 =?utf-8?B?bGJqcGg0eGtia0pXVFBiVmNLOSs0TmxHRXBPRUJBeGxOYm1RR1J1MzBBU0VC?=
 =?utf-8?B?ci93OHBFVy9LN2lrK0tIN21ES0VCYmxCd0haN01kWmJHNlE5bGxzeVFpUlVw?=
 =?utf-8?B?RlI3M3BwRkNwN3RRbmduSGtNVVRnNCtZQ3RtWjJXT2NuOTB6bGFkV0VIT2ZX?=
 =?utf-8?B?ek1HMjVBQ0dlV2d4MmpGUHRzQ1l4ZjdYa05lSWlab3ZNckdyM3V4cmR1RDhE?=
 =?utf-8?B?K3N3NnZzcU5xd21wTGgrQ3MxeXV6YzMwMkY3YkJ2TFJnV01haklZeXptd2JM?=
 =?utf-8?B?Qkc5dWxlQ3dlMXJBeTc2NkFxa0FLenBHUk03TUVwc0NBM0d0L1pEb05QRWRP?=
 =?utf-8?B?UnNJVGJoQjRBUFpJeTdOL2hCV2VIWHhrTkpYTTJZVTAwbXRtK295TzZCaHFi?=
 =?utf-8?B?aXFIUXVxZlpjOUtkZkc2azRMMTErMWVrMFRlYjhjMlJBMm5NeWVBWGxwdEZx?=
 =?utf-8?B?UTZ6WGtpLy9LTlEvNFg3ckxXYVpqbzZOazljNWl4Vys0L3lUamJsV0grRHhx?=
 =?utf-8?Q?yNvBnchu+rNJ3a+fR2qbxSpl7?=
Content-ID: <D94B6609AB3EF74E999117C043D9F78D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c9b7aa-1966-491e-a614-08dc6b537225
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 09:28:52.0679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EgqhOd+zfJsm/+TyHrGa3ZJVYf80X/njr5rzw3lVH0kH5f6NOurIubxtCly94SWMopN0cHsA5s+VOS/aZUi6sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8249
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1240955668.809445247"
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

--__=_Part_Boundary_002_1240955668.809445247
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUaHUsIDIwMjQtMDUtMDIgYXQgMTg6MzggKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU3VwcG9ydCAiUHJlLW11bHRpcGxpZWQiIGFscGhhIGJsZW5kaW5nIG1vZGUg
aW4gTWl4ZXIuDQo+IEJlZm9yZSB0aGlzIHBhdGNoLCBvbmx5IHRoZSBjb3ZlcmFnZSBtb2RlIGlz
IHN1cHBvcnRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcgPHNoYXdu
LnN1bmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZXRoZHIuYyB8IDE1ICsrKysrKysrKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19ldGhkci5jDQo+IGluZGV4IDUyODNlMDk5M2VkNjUuLjRmMDQzYmUyMWVlMzYgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCj4gQEAgLTUsNiArNSw3IEBADQo+
ICANCj4gICNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPg0KPiAgI2luY2x1ZGUgPGRybS9kcm1f
ZnJhbWVidWZmZXIuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2JsZW5kLmg+DQo+ICAjaW5jbHVk
ZSA8bGludXgvY2xrLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvY29tcG9uZW50Lmg+DQo+ICAjaW5j
bHVkZSA8bGludXgvb2YuaD4NCj4gQEAgLTM1LDYgKzM2LDcgQEANCj4gICNkZWZpbmUgTUlYX1NS
Q19MMF9FTgkJCQlCSVQoMCkNCj4gICNkZWZpbmUgTUlYX0xfU1JDX0NPTihuKQkJKDB4MjggKyAw
eDE4ICogKG4pKQ0KPiAgI2RlZmluZSBOT05fUFJFTVVMVElfU09VUkNFCQkJKDIgPDwgMTIpDQo+
ICsjZGVmaW5lIFBSRU1VTFRJX1NPVVJDRQkJCQkoMyA8PCAxMikNCj4gICNkZWZpbmUgTUlYX0xf
U1JDX1NJWkUobikJCSgweDMwICsgMHgxOCAqIChuKSkNCj4gICNkZWZpbmUgTUlYX0xfU1JDX09G
RlNFVChuKQkJKDB4MzQgKyAweDE4ICogKG4pKQ0KPiAgI2RlZmluZSBNSVhfRlVOQ19EQ00wCQkJ
MHgxMjANCj4gQEAgLTE1Myw3ICsxNTUsNyBAQCB2b2lkIG10a19ldGhkcl9sYXllcl9jb25maWco
c3RydWN0IGRldmljZSAqZGV2LA0KPiB1bnNpZ25lZCBpbnQgaWR4LA0KPiAgCXN0cnVjdCBtdGtf
cGxhbmVfcGVuZGluZ19zdGF0ZSAqcGVuZGluZyA9ICZzdGF0ZS0+cGVuZGluZzsNCj4gIAl1bnNp
Z25lZCBpbnQgb2Zmc2V0ID0gKHBlbmRpbmctPnggJiAxKSA8PCAzMSB8IHBlbmRpbmctPnkgPDwg
MTYNCj4gfCBwZW5kaW5nLT54Ow0KPiAgCXVuc2lnbmVkIGludCBhbGlnbl93aWR0aCA9IEFMSUdO
X0RPV04ocGVuZGluZy0+d2lkdGgsIDIpOw0KPiAtCXVuc2lnbmVkIGludCBhbHBoYV9jb24gPSAw
Ow0KPiArCXVuc2lnbmVkIGludCBtaXhfY29uID0gMDsNCj4gIAlib29sIHJlcGxhY2Vfc3JjX2Eg
PSBmYWxzZTsNCj4gIA0KPiAgCWRldl9kYmcoZGV2LCAiJXMrIGlkeDolZCIsIF9fZnVuY19fLCBp
ZHgpOw0KPiBAQCAtMTcxLDggKzE3MywxMiBAQCB2b2lkIG10a19ldGhkcl9sYXllcl9jb25maWco
c3RydWN0IGRldmljZSAqZGV2LA0KPiB1bnNpZ25lZCBpbnQgaWR4LA0KPiAgCQlyZXR1cm47DQo+
ICAJfQ0KPiAgDQo+IC0JaWYgKHN0YXRlLT5iYXNlLmZiICYmIHN0YXRlLT5iYXNlLmZiLT5mb3Jt
YXQtPmhhc19hbHBoYSkNCj4gLQkJYWxwaGFfY29uID0gTUlYRVJfQUxQSEFfQUVOIHwgTUlYRVJf
QUxQSEE7DQo+ICsJbWl4X2NvbiB8PSBNSVhFUl9BTFBIQV9BRU4gfCAoc3RhdGUtPmJhc2UuYWxw
aGEgJiBNSVhFUl9BTFBIQSk7DQoNClRoaXMgbG9va3MgbGlrZSBwbGFuZSBhbHBoYSAodGhlIHdo
b2xlIHZpZGVvIHBsYW5lIHVzZSBzaW5nbGUgYWxwaGENCnZhbHVlKSwgbm90IHJlbGF0ZWQgdG8g
cHJlLW11bHRpcGxpZWQgYmxlbmRpbmcsIHNvIHNlcGFyYXRlIHRoaXMgdG8NCmFub3RoZXIgcGF0
Y2guDQoNCkZvciBubyBhbHBoYSBmb3JtYXQsIHlvdSBjaGFuZ2UgdGhlIHNldHRpbmcuIElmIHRo
aXMgaXMgYnVnIGZpeCwgYWRkDQpmaXhlcyB0YWcuDQoNCj4gKw0KPiArCWlmIChzdGF0ZS0+YmFz
ZS5waXhlbF9ibGVuZF9tb2RlICE9IERSTV9NT0RFX0JMRU5EX0NPVkVSQUdFKQ0KPiArCQltaXhf
Y29uIHw9IFBSRU1VTFRJX1NPVVJDRTsNCj4gKwllbHNlDQo+ICsJCW1peF9jb24gfD0gTk9OX1BS
RU1VTFRJX1NPVVJDRTsNCj4gIA0KPiAgCWlmIChzdGF0ZS0+YmFzZS5mYiAmJiAhc3RhdGUtPmJh
c2UuZmItPmZvcm1hdC0+aGFzX2FscGhhKSB7DQo+ICAJCS8qDQo+IEBAIC0xODksOCArMTk1LDcg
QEAgdm9pZCBtdGtfZXRoZHJfbGF5ZXJfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gdW5z
aWduZWQgaW50IGlkeCwNCj4gIAltdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCBwZW5kaW5nLT5oZWln
aHQgPDwgMTYgfCBhbGlnbl93aWR0aCwNCj4gJm1peGVyLT5jbWRxX2Jhc2UsDQo+ICAJCSAgICAg
IG1peGVyLT5yZWdzLCBNSVhfTF9TUkNfU0laRShpZHgpKTsNCj4gIAltdGtfZGRwX3dyaXRlKGNt
ZHFfcGt0LCBvZmZzZXQsICZtaXhlci0+Y21kcV9iYXNlLCBtaXhlci0+cmVncywgDQo+IE1JWF9M
X1NSQ19PRkZTRVQoaWR4KSk7DQo+IC0JbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCBhbHBo
YV9jb24sICZtaXhlci0+Y21kcV9iYXNlLA0KPiBtaXhlci0+cmVncywgTUlYX0xfU1JDX0NPTihp
ZHgpLA0KPiAtCQkJICAgMHgxZmYpOw0KPiArCW10a19kZHBfd3JpdGUoY21kcV9wa3QsIG1peF9j
b24sICZtaXhlci0+Y21kcV9iYXNlLCBtaXhlci0NCj4gPnJlZ3MsIE1JWF9MX1NSQ19DT04oaWR4
KSk7DQo+ICAJbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCBCSVQoaWR4KSwgJm1peGVyLT5j
bWRxX2Jhc2UsDQo+IG1peGVyLT5yZWdzLCBNSVhfU1JDX0NPTiwNCj4gIAkJCSAgIEJJVChpZHgp
KTsNCj4gIH0NCg==

--__=_Part_Boundary_002_1240955668.809445247
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMDUtMDImIzMyO2F0JiMzMjsxODozOCYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1N1cHBvcnQmIzMyOyZxdW90O1ByZS1tdWx0aXBsaWVkJnF1b3Q7JiMzMjthbHBoYSYjMzI7Ymxl
bmRpbmcmIzMyO21vZGUmIzMyO2luJiMzMjtNaXhlci4NCiZndDsmIzMyO0JlZm9yZSYjMzI7dGhp
cyYjMzI7cGF0Y2gsJiMzMjtvbmx5JiMzMjt0aGUmIzMyO2NvdmVyYWdlJiMzMjttb2RlJiMzMjtp
cyYjMzI7c3VwcG9ydGVkLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7
SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20m
Z3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19ldGhkci5jJiMzMjt8JiMzMjsxNSYjMzI7KysrKysrKysrKy0tLS0tDQomZ3Q7JiMzMjsm
IzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsxMCYjMzI7aW5zZXJ0aW9ucygrKSwmIzMy
OzUmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYj
MzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCiZndDsmIzMyO2IvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7NTI4
M2UwOTkzZWQ2NS4uNGYwNDNiZTIxZWUzNiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2Ev
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQomZ3Q7JiMzMjsrKysmIzMyO2Iv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQomZ3Q7JiMzMjtAQCYjMzI7LTUs
NiYjMzI7KzUsNyYjMzI7QEANCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyOyNpbmNsdWRl
JiMzMjsmbHQ7ZHJtL2RybV9mb3VyY2MuaCZndDsNCiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMy
OyZsdDtkcm0vZHJtX2ZyYW1lYnVmZmVyLmgmZ3Q7DQomZ3Q7JiMzMjsrI2luY2x1ZGUmIzMyOyZs
dDtkcm0vZHJtX2JsZW5kLmgmZ3Q7DQomZ3Q7JiMzMjsmIzMyOyNpbmNsdWRlJiMzMjsmbHQ7bGlu
dXgvY2xrLmgmZ3Q7DQomZ3Q7JiMzMjsmIzMyOyNpbmNsdWRlJiMzMjsmbHQ7bGludXgvY29tcG9u
ZW50LmgmZ3Q7DQomZ3Q7JiMzMjsmIzMyOyNpbmNsdWRlJiMzMjsmbHQ7bGludXgvb2YuaCZndDsN
CiZndDsmIzMyO0BAJiMzMjstMzUsNiYjMzI7KzM2LDcmIzMyO0BADQomZ3Q7JiMzMjsmIzMyOyNk
ZWZpbmUmIzMyO01JWF9TUkNfTDBfRU5CSVQoMCkNCiZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7
TUlYX0xfU1JDX0NPTihuKSgweDI4JiMzMjsrJiMzMjsweDE4JiMzMjsqJiMzMjsobikpDQomZ3Q7
JiMzMjsmIzMyOyNkZWZpbmUmIzMyO05PTl9QUkVNVUxUSV9TT1VSQ0UoMiYjMzI7Jmx0OyZsdDsm
IzMyOzEyKQ0KJmd0OyYjMzI7KyNkZWZpbmUmIzMyO1BSRU1VTFRJX1NPVVJDRSgzJiMzMjsmbHQ7
Jmx0OyYjMzI7MTIpDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO01JWF9MX1NSQ19TSVpFKG4p
KDB4MzAmIzMyOysmIzMyOzB4MTgmIzMyOyomIzMyOyhuKSkNCiZndDsmIzMyOyYjMzI7I2RlZmlu
ZSYjMzI7TUlYX0xfU1JDX09GRlNFVChuKSgweDM0JiMzMjsrJiMzMjsweDE4JiMzMjsqJiMzMjso
bikpDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO01JWF9GVU5DX0RDTTAweDEyMA0KJmd0OyYj
MzI7QEAmIzMyOy0xNTMsNyYjMzI7KzE1NSw3JiMzMjtAQCYjMzI7dm9pZCYjMzI7bXRrX2V0aGRy
X2xheWVyX2NvbmZpZyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwNCiZndDsmIzMyO3Vuc2ln
bmVkJiMzMjtpbnQmIzMyO2lkeCwNCiZndDsmIzMyOyYjMzI7c3RydWN0JiMzMjttdGtfcGxhbmVf
cGVuZGluZ19zdGF0ZSYjMzI7KnBlbmRpbmcmIzMyOz0mIzMyOyZhbXA7c3RhdGUtJmd0O3BlbmRp
bmc7DQomZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO29mZnNldCYjMzI7PSYjMzI7
KHBlbmRpbmctJmd0O3gmIzMyOyZhbXA7JiMzMjsxKSYjMzI7Jmx0OyZsdDsmIzMyOzMxJiMzMjt8
JiMzMjtwZW5kaW5nLSZndDt5JiMzMjsmbHQ7Jmx0OyYjMzI7MTYNCiZndDsmIzMyO3wmIzMyO3Bl
bmRpbmctJmd0O3g7DQomZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2FsaWduX3dp
ZHRoJiMzMjs9JiMzMjtBTElHTl9ET1dOKHBlbmRpbmctJmd0O3dpZHRoLCYjMzI7Mik7DQomZ3Q7
JiMzMjstdW5zaWduZWQmIzMyO2ludCYjMzI7YWxwaGFfY29uJiMzMjs9JiMzMjswOw0KJmd0OyYj
MzI7K3Vuc2lnbmVkJiMzMjtpbnQmIzMyO21peF9jb24mIzMyOz0mIzMyOzA7DQomZ3Q7JiMzMjsm
IzMyO2Jvb2wmIzMyO3JlcGxhY2Vfc3JjX2EmIzMyOz0mIzMyO2ZhbHNlOw0KJmd0OyYjMzI7JiMz
MjsNCiZndDsmIzMyOyYjMzI7ZGV2X2RiZyhkZXYsJiMzMjsmcXVvdDslcysmIzMyO2lkeDolZCZx
dW90OywmIzMyO19fZnVuY19fLCYjMzI7aWR4KTsNCiZndDsmIzMyO0BAJiMzMjstMTcxLDgmIzMy
OysxNzMsMTImIzMyO0BAJiMzMjt2b2lkJiMzMjttdGtfZXRoZHJfbGF5ZXJfY29uZmlnKHN0cnVj
dCYjMzI7ZGV2aWNlJiMzMjsqZGV2LA0KJmd0OyYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7aWR4
LA0KJmd0OyYjMzI7JiMzMjtyZXR1cm47DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyYjMzI7
DQomZ3Q7JiMzMjstaWYmIzMyOyhzdGF0ZS0mZ3Q7YmFzZS5mYiYjMzI7JmFtcDsmYW1wOyYjMzI7
c3RhdGUtJmd0O2Jhc2UuZmItJmd0O2Zvcm1hdC0mZ3Q7aGFzX2FscGhhKQ0KJmd0OyYjMzI7LWFs
cGhhX2NvbiYjMzI7PSYjMzI7TUlYRVJfQUxQSEFfQUVOJiMzMjt8JiMzMjtNSVhFUl9BTFBIQTsN
CiZndDsmIzMyOyttaXhfY29uJiMzMjt8PSYjMzI7TUlYRVJfQUxQSEFfQUVOJiMzMjt8JiMzMjso
c3RhdGUtJmd0O2Jhc2UuYWxwaGEmIzMyOyZhbXA7JiMzMjtNSVhFUl9BTFBIQSk7DQoNClRoaXMm
IzMyO2xvb2tzJiMzMjtsaWtlJiMzMjtwbGFuZSYjMzI7YWxwaGEmIzMyOyh0aGUmIzMyO3dob2xl
JiMzMjt2aWRlbyYjMzI7cGxhbmUmIzMyO3VzZSYjMzI7c2luZ2xlJiMzMjthbHBoYQ0KdmFsdWUp
LCYjMzI7bm90JiMzMjtyZWxhdGVkJiMzMjt0byYjMzI7cHJlLW11bHRpcGxpZWQmIzMyO2JsZW5k
aW5nLCYjMzI7c28mIzMyO3NlcGFyYXRlJiMzMjt0aGlzJiMzMjt0bw0KYW5vdGhlciYjMzI7cGF0
Y2guDQoNCkZvciYjMzI7bm8mIzMyO2FscGhhJiMzMjtmb3JtYXQsJiMzMjt5b3UmIzMyO2NoYW5n
ZSYjMzI7dGhlJiMzMjtzZXR0aW5nLiYjMzI7SWYmIzMyO3RoaXMmIzMyO2lzJiMzMjtidWcmIzMy
O2ZpeCwmIzMyO2FkZA0KZml4ZXMmIzMyO3RhZy4NCg0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2lm
JiMzMjsoc3RhdGUtJmd0O2Jhc2UucGl4ZWxfYmxlbmRfbW9kZSYjMzI7IT0mIzMyO0RSTV9NT0RF
X0JMRU5EX0NPVkVSQUdFKQ0KJmd0OyYjMzI7K21peF9jb24mIzMyO3w9JiMzMjtQUkVNVUxUSV9T
T1VSQ0U7DQomZ3Q7JiMzMjsrZWxzZQ0KJmd0OyYjMzI7K21peF9jb24mIzMyO3w9JiMzMjtOT05f
UFJFTVVMVElfU09VUkNFOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7aWYmIzMyOyhz
dGF0ZS0mZ3Q7YmFzZS5mYiYjMzI7JmFtcDsmYW1wOyYjMzI7IXN0YXRlLSZndDtiYXNlLmZiLSZn
dDtmb3JtYXQtJmd0O2hhc19hbHBoYSkmIzMyO3sNCiZndDsmIzMyOyYjMzI7LyoNCiZndDsmIzMy
O0BAJiMzMjstMTg5LDgmIzMyOysxOTUsNyYjMzI7QEAmIzMyO3ZvaWQmIzMyO210a19ldGhkcl9s
YXllcl9jb25maWcoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsDQomZ3Q7JiMzMjt1bnNpZ25l
ZCYjMzI7aW50JiMzMjtpZHgsDQomZ3Q7JiMzMjsmIzMyO210a19kZHBfd3JpdGUoY21kcV9wa3Qs
JiMzMjtwZW5kaW5nLSZndDtoZWlnaHQmIzMyOyZsdDsmbHQ7JiMzMjsxNiYjMzI7fCYjMzI7YWxp
Z25fd2lkdGgsDQomZ3Q7JiMzMjsmYW1wO21peGVyLSZndDtjbWRxX2Jhc2UsDQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO21peGVyLSZndDtyZWdzLCYjMzI7TUlY
X0xfU1JDX1NJWkUoaWR4KSk7DQomZ3Q7JiMzMjsmIzMyO210a19kZHBfd3JpdGUoY21kcV9wa3Qs
JiMzMjtvZmZzZXQsJiMzMjsmYW1wO21peGVyLSZndDtjbWRxX2Jhc2UsJiMzMjttaXhlci0mZ3Q7
cmVncywmIzMyOw0KJmd0OyYjMzI7TUlYX0xfU1JDX09GRlNFVChpZHgpKTsNCiZndDsmIzMyOy1t
dGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3QsJiMzMjthbHBoYV9jb24sJiMzMjsmYW1wO21peGVy
LSZndDtjbWRxX2Jhc2UsDQomZ3Q7JiMzMjttaXhlci0mZ3Q7cmVncywmIzMyO01JWF9MX1NSQ19D
T04oaWR4KSwNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsweDFmZik7DQomZ3Q7JiMzMjsrbXRr
X2RkcF93cml0ZShjbWRxX3BrdCwmIzMyO21peF9jb24sJiMzMjsmYW1wO21peGVyLSZndDtjbWRx
X2Jhc2UsJiMzMjttaXhlci0NCiZndDsmIzMyOyZndDtyZWdzLCYjMzI7TUlYX0xfU1JDX0NPTihp
ZHgpKTsNCiZndDsmIzMyOyYjMzI7bXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCYjMzI7QklU
KGlkeCksJiMzMjsmYW1wO21peGVyLSZndDtjbWRxX2Jhc2UsDQomZ3Q7JiMzMjttaXhlci0mZ3Q7
cmVncywmIzMyO01JWF9TUkNfQ09OLA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtCSVQo
aWR4KSk7DQomZ3Q7JiMzMjsmIzMyO30NCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0t
dHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50
aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29u
dGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50
cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVy
d2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlz
IGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGll
bnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywg
cmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRh
Y2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lw
aWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZl
ZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRp
YXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNv
cGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlv
dXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFp
bCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_002_1240955668.809445247--


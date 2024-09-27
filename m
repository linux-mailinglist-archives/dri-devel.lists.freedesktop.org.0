Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE39987C62
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 03:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19D910E12D;
	Fri, 27 Sep 2024 01:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="sUJqLRVT";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="d8hpo8UD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B542D10E12D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 01:14:49 +0000 (UTC)
X-UUID: e0a6e8e67c6d11ef8b96093e013ec31c-20240927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=1a10AXEVk3QbXrnIEar5Z80vYHvS9NTCbgaUnAEcsbY=; 
 b=sUJqLRVT9PWTOXj1RBCZlRb/Yli3h9EMeYcuNIk8JhShvtQ0Kf6URjfWTYlSaFeIAzeFld26apuHLAwVpnH4eHc24INlzIrN2KjAYI4+olEe3Ou0tgaQ2KsW9QuzQ0eHotkTLJL+nCAZrorw0BeKHORTjB/6qfPMqD1e68arovc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:528e2f17-cf95-421c-90d7-1f05ff0896f6, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:ca98d5d0-7921-4900-88a1-3aef019a55ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e0a6e8e67c6d11ef8b96093e013ec31c-20240927
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1924740589; Fri, 27 Sep 2024 09:14:43 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 09:14:41 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Sep 2024 09:14:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agQpmIMnsJhV52hB/PtpUJW0vOPhw0qHcIOuUqpjHVyrrWArN3mG/qS8RzAbPk1rcsD0WOC8ODXZnf22kUNqpOy5gUbkDW1FOmt0GFRdQ9N0BRH8JSN9XGfeMoL8XBJrsI3imILUyIUc/elgmf8MJlO5le+YRxq19ANMhOvP8IvyfamN2IWr8s3YZIsiHvifeqzOuVT7DAXrUTpFHaOWZPXazhK7Edeg/mOqK4rF3EEmRD3pF7O9RzdSLT7FTnpvqAU301DpPSILtp57OOQFLXtb5OAeu9mDr6YFk+xWuN/ATNkw5NHzJd8eYA3CYZKrIPc7BDbf7TQzaHaN6GAWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoTuxENmtYl9zXquoQMcSfeJpHCbSDMyxxlo46V75i0=;
 b=kX6GQenVnmGkD3TZfT/g0+JUQvqq8il9D5PHTFyLvh27USinAKnrP5Gf9GKOOdDxqrj8ylORiDXFKwUIcmMtz5XKZD8SFqrqPmahyBwj9ynxtfYaeah+YK7qwko7bVPdbuLfklaO5IypLzSjh0WyEYzAemWXbmMYT0jBmKlajmLix+OYEIRMqj+Od8EEc2B2GRdH2JC/g3Ye3SonEeVCcoPem7/IOmncIlIADGGGN7KtajyVDu7wE34Tmw1cxYJSJ7WomOmJC6RVz69+v6tzrzLMIrKRV6ykc2jmWzBfgZVWlwOGGWi/JHNo13hwK+xbgvzkEHge5oyNQpk0HdB+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoTuxENmtYl9zXquoQMcSfeJpHCbSDMyxxlo46V75i0=;
 b=d8hpo8UDPKflb9d90Y7BTAIYrvbHXTweLdggFZrr2WLUdiR5aNTCw5EPumpjII9JmOiSc8LU7tW9DwtJdr5Byn5xMvElcS2fM16M7smkscWQ+ERDi0T3b9NzTqP7WGcZ3M5ko+QoQc4j081H56Xa3HlxXDbUrWWyGHmqc8lnGro=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7721.apcprd03.prod.outlook.com (2603:1096:400:41f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 01:14:38 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.8005.017; Fri, 27 Sep 2024
 01:14:38 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 1/3] drm/mediatek: ovl: Remove the color format comment
 for ovl_fmt_convert()
Thread-Topic: [PATCH v7 1/3] drm/mediatek: ovl: Remove the color format
 comment for ovl_fmt_convert()
Thread-Index: AQHbD/4dMxSpCUfOskmRwZSC6CQUirJq1UCA
Date: Fri, 27 Sep 2024 01:14:38 +0000
Message-ID: <5746a0ed795922315d4264b1e5300fdb9acffa37.camel@mediatek.com>
References: <20240926102238.24303-1-jason-jh.lin@mediatek.com>
 <20240926102238.24303-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20240926102238.24303-2-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7721:EE_
x-ms-office365-filtering-correlation-id: 64b495e1-7ed4-4e7a-4e91-08dcde91c1f9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TitLcmtUaTlUWVVVYVFNZ2V3dmJ3VVRwcVlpUk9sUk1uNUpad2xOQmtvWkVK?=
 =?utf-8?B?N216Uzl4VlAwazFlRG1PSDhTTkI1WGRWSnRGVlpaam1TWldZK0t2bGVNNHA5?=
 =?utf-8?B?cWl1dUdaTE9uQ1lDeFFsZ2Y1WHg0Ym5wWCtoK0IyV2JmSmk5cU5PZGdFaWgx?=
 =?utf-8?B?dFJMTzFaN2RqSHg1L3FvVEVYSlp6UTVyTEQyNEhZN0NzY1IzV2grdS9yTG56?=
 =?utf-8?B?bm9hOXhOaG40cHJzSWFsODBsNW10R3hTZUpHdGJBOVVoemV4ODJ3WFFiTmpj?=
 =?utf-8?B?bVRudTh0UjN0L0t1b2lGUTBidXlEaDhiSjNDWnNVeFJFTUp2eHd1U3Y1dm1o?=
 =?utf-8?B?Vm5pMkhiK0FCT3BGMitOUjE4NVo0cmJBUmVYdmM3a3RyWU85SXpMVkVHQVJF?=
 =?utf-8?B?MGxRN3R1R25VQS9yMFpCdWY2Y1RWa1JIUUc2eDJlUUVBakNoano3Qk54amdz?=
 =?utf-8?B?WkxxTko0ak9OWDA5akxYVVdDYUxBUk9uUmF3MGlBdnZWSG9icUFBU2o0NWlX?=
 =?utf-8?B?RzZ5dWd5V0JDY25GazYwMHgxNEN0MjBlZzI1eGp1NEpWZ1ZyYm9MMzhqKzc3?=
 =?utf-8?B?Nis0Z2R1ZFJYNjBYOGZhRFFXZnd6NGRrQjJseDhrZGdoQkdaakd1clZ3SUxP?=
 =?utf-8?B?cFVYQ1VsUmJaVzZvM2FhaU5vMUlkSzFSUUFtV1VvcWZrTitoN1ZYTzA0c2FS?=
 =?utf-8?B?VnAyKzFNVEE1ZDNGbWNSTklBRkpucFJ2a0ZQQ2J4dzRBOWtLMlcwWExqTnVE?=
 =?utf-8?B?RkJtbEVQY3VKUC9mUUdrMW1jaDVVTmNNMVZoSUVGS2dwUDhDMllNZWVWaS91?=
 =?utf-8?B?L3ZxTjJoZkVDaTNVa21LdFYxek4zUWw1ZXp6ZFJ2WTY5L2pzTlJSTHpBb0ZX?=
 =?utf-8?B?a05oeWxFUktZdlhYZDVHdFUwY0h1T2xoeTBTWVpvZTZ2V3pQb2hyVXY4ajBE?=
 =?utf-8?B?TmkyWVFDbzhDZ29GQVNpRmdTa3JQdDNPbDZwZVRrUlpNUUlITUJkWHpTVHdD?=
 =?utf-8?B?b2RRdkRybFdtb1h6RzhnV0ZtTzhNK2xQWGhLeXFaTTdXZzFMRVpHZThySHUy?=
 =?utf-8?B?YVJkUkdQZmIvOEFhS2czMVYyNnE0V1Y4R04wRllTRWR5S014eEoxNDVUaUlQ?=
 =?utf-8?B?N0llZzdDSGQ0M25mekZSMkQ0RjJKREdHZXdtTXZHVHlMaU9xRjdvdi93SkdQ?=
 =?utf-8?B?Sng3emFWMHpxR29LQWRBTE9VdnYwOTZORkgya2NMYm5uZXNKczI3ei9OcnBl?=
 =?utf-8?B?MWFSbUpEQ1YxVWlCc2s3UlpuWHRQQnZMZkg5aklnV2ZVNyt5MDZpMTE1cGNE?=
 =?utf-8?B?cUJneXM1NWVHZUZXUDg3UFVLZVBmODc0bGZaaHphK0Y4bnF3WHhsUUJibUU4?=
 =?utf-8?B?YnRJT2hDbGQxdHhPN3hEeGNxZmprejU0TWRwZlNDZnRGQWhpQW5OYkwvK0t0?=
 =?utf-8?B?Rlo5eUdNRzFNWDJPOVJrWG03elpEbWprSUlpTFVpWUZINjNkY0orVjY3Z28r?=
 =?utf-8?B?cjhsMDhxdDNmUXpramZrbGhSZ1pyZE1GWVcrYlNFMHVTNXI2QVBrNmN0NXph?=
 =?utf-8?B?TnJENmN6czVjZUxkN09ld0dQd1RkbndrUjBBQjNORlhOa2ppV3ZVeU9PTlJv?=
 =?utf-8?B?UmFmL1ZrblRkMFpBQ1VMUUhzWG5GZVRNaU9SOXVJbFdkZmcrZ0pVZWdXaUNW?=
 =?utf-8?B?aHJmZzJYWXRzbTNBdUMyOC9odDhzZGgxemhlb2tLQnlDSzdIWXp1R0RCa1FG?=
 =?utf-8?B?dzhzMUxIQ2N0Uk9BRUJNbE9rc3JucllUZE05L29BM2JIZHNBVUh1Y0RuWG1u?=
 =?utf-8?B?TFBIV2VjZlhRMmwxdXRPQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm5kTEpBTWs1TUF2SnV3bGxiRHEvZlBLZUhRb0duNERQcDlEdUVTL1hsMk8r?=
 =?utf-8?B?azJxOGJQY25pK2kvUW9EZTUxZ1pYWklmckl2cGdiTWxoRllnUFdEOThXbTcr?=
 =?utf-8?B?Uk9qVGo5WSsxYnp1NTdrRDJEVVp1MmJtNWIxYWMyMWZOVWVBQlVVQ2xVaW5G?=
 =?utf-8?B?RDNyeGpnNWl3K1NNanhvb2JISExBKytDRFdMV3IvdVZ3Mk5nVWl6NGphQlo2?=
 =?utf-8?B?SHVrUFE4ZEN5aDhJRUI2d1VEZjlUMUhBSFpYV2p3UXNqUjhleGZjZ3lJQXgr?=
 =?utf-8?B?R2NyVlJJcE1RYnN5OEQvVWZ5VmFJVUJrUnk5U0R4c3hDR1JlRGlReWRBanpv?=
 =?utf-8?B?aVNXQ1ZZYmF3RUFYMVB0eW43cWZreURrVXB0dFB2Z1lvdHIxckM0SVVMR2x6?=
 =?utf-8?B?d0VUSGtzV3pGSklmOHNDSzV5TnEzenh6c214OE91S2EyblEyQlkxdXFiOFR4?=
 =?utf-8?B?VWVzQnNncmNuRHQvKy9YVWtrT1YvQmgzaDEwbVUvZ1lWSFFxTHlLaXNleXR2?=
 =?utf-8?B?S1R6WVRZMVFoS1lFYng1SkhSYnVQTWNqQXhsZGllb0FXZDlQenNBdkczRHQx?=
 =?utf-8?B?Z3FRNS8waVNQRVU1Tm1yUGc2b09yNmRXTUl1R0NkdWVIUHJQRWN5bDdHQmtW?=
 =?utf-8?B?OWpTS1BCZXNLa2hhVTE4MFBYak5meCtlTVA0MFhUL0kraUFSS0NYOElBVWNP?=
 =?utf-8?B?d1B5YjBEM0VZeWVxcmEwNy9tSEVTelRXVUJJWEp1NDhtbUE3OTlVbzVIYW1K?=
 =?utf-8?B?QXN5TzJXUk9GRkZSWGErYmJXcDJEWWhyVDFMMXY2WURoRGQ0THZmUmhyOUs0?=
 =?utf-8?B?cWJOcnM3UFM5SlpOa2RWMHhYY1cxd0o5eHhpa05tOHJIOEhmeGFOdXhmYUVr?=
 =?utf-8?B?dWl0YWpjVElrZHRkckh4VDY3NjY1aTAxaUtiYzNmVktCQWZFeGRjazdGU0dH?=
 =?utf-8?B?NlRFVzZKcHQ1Z2E5RnlTUHlTN1BMRlU2ZUUvc2t6dlQvQWNpc0hDWkVMcUNw?=
 =?utf-8?B?c2NVTDQrdHAxblg3RUpVSDJBWlpvSjJYdyt1UkxURndPTjdsZllMTmVhMlFB?=
 =?utf-8?B?WnFKRlZsQy90L3dCWGJ3Ky9kUnh1NEtqS3FMWTdrVzVlRE0xRlNBUUErTnZU?=
 =?utf-8?B?M2VxblhBOFh0dHRncmNWWm5jU25GL3VkWEl0UnR2QW5pS2s4RFFIQ2ZVdUlW?=
 =?utf-8?B?QnFUc2pWWmd6KzNhTFV1eHB0d0FIMWlpTVY3Tk9lY2NBTXpxbmdpcHEyZDRh?=
 =?utf-8?B?VnNHdWk5T2wyRjZ0RzZLVFNMck5WZlpSY084RWFhTkFPazNFRk1MYXEwMW81?=
 =?utf-8?B?WGQ3QzRMaVo0UDhPOTNVRDFNNzhnVkJYaFM5YTBtR2JlK2NTOWlwRzRoajdX?=
 =?utf-8?B?TmQzSzQvUkczS0pWMk5MZGFDVDlYOFJhSlJGSnQ1dlVmcDVsRFZJbzFjekk2?=
 =?utf-8?B?K3VUaGk0K09idnRrQTdGbkZuMDZhVFFnMXBhQ3Z3Sk1id3p3VWhNaVBlNHRh?=
 =?utf-8?B?MVpJOXBjbktFR0V4Q3dqMXFyOXpTeHNMb3FTOTdWVmV3eTVTc0pmaUZGSDVG?=
 =?utf-8?B?UmRzVmVlZkVaNHpNaUZwWC9HNFFPUlIzRERYRU5wQXBMQ0Uwck9mVlhxb3dn?=
 =?utf-8?B?YlJ5TzJXY2NLdGFYdTMwVEI0NGRBbHRLTWpUUWpQUzhRblNvUXZab3dJcUc3?=
 =?utf-8?B?UXFCU3ZmdU9lYlZUc2tpYWNNVjFrbW95NFI5NU5RWWY0MXZVSVVLS0ZMOHRE?=
 =?utf-8?B?VUpHQXl1WGxLSTdlMVpzbWNTdHRlMDlBeE50QTM1cHducWUrV0x1QXBidGJT?=
 =?utf-8?B?QkJzZUZDNis3ZDFqa2JycTFOeGprNkxEd3BJU2c0Yk5PdUdkTjVPd05wc1E1?=
 =?utf-8?B?akdCU2psNUI2R2pXcjRlUTFNMXFORFJmcmNGSGJFZi80dGY0TkkyT2FkWkxz?=
 =?utf-8?B?cW9QSFJ0VlM1enZmbzRIeW9RQWI4ZC9ERXRsT3ZQTmJEa25uWEdoV01JeVBy?=
 =?utf-8?B?UnhxcFoxakxkOUUxRlhqRW1WQ1JpcGl3ajZuZzhKc2Fndk9Xc0MzOVlWMXgr?=
 =?utf-8?B?eE1xR284Mk9VRjRKdk1zZGE2MXJ4Y2xXY3NWNC9ZeGpBN2NNOFhKVU8wUnJ6?=
 =?utf-8?Q?X63/XNHJuqgTmKPRI0h7XBk9E?=
Content-ID: <20D1295F6F53114696BCB4A0FE8A65F9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b495e1-7ed4-4e7a-4e91-08dcde91c1f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 01:14:38.5298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jO4qho35HnUqltj18AsCDY2PYK0DGcRWFCixFGY80uz/XzqE7QtOwvbyexgtYgYA4h/gaHhvTH5wZ2jN3tcO3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7721
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.978300-8.000000
X-TMASE-MatchedRID: 9zTThWtzImsOwH4pD14DsPHkpkyUphL9Fk73i4rVVIGPaLJ/Ca3ST9zD
 hHEbpyKJbdJAvGIAvFbnU7CCEjbK3wtrOhDKumbSQ4srjeRbxTZMkOX0UoduuX5h6y4KCSJcrWv
 A11V1iKktIcNCL+1lT8oRp4xvRGy/SReiLCvBHECV9hHQSQP5WlPgO2JKQydYBqAOEFOvViSjxY
 yRBa/qJRVHsNBZf9aRAYt5KiTiutkLbigRnpKlKZvjAepGmdoOycS6Ue2KT2IkdzO9FDnzIELPg
 ZP3Zuce5FXjt5gUQGs1tlhgxN6YZSG9euVtnCmM6ZUH8MVT5d8x8C3niAqRBML/jhJtP8FMtYKm
 gy/hRHp6myquVNZbsaCSvkH5b0KNAxBSRrPbDo+vZrXn/T4fmw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.978300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D005D49A6E156CB2E35BE920F1DFB25AC3898A5AC1E619056DD09413B8DFEE5F2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1412115091.600229593"
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

--__=_Part_Boundary_003_1412115091.600229593
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBUaHUsIDIwMjQtMDktMjYgYXQgMTg6MjIgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gU2luY2Ugd2UgY2hhbmdlZCBNQUNST3MgdG8gYmUgY29uc2lzdGVudCB3
aXRoIERSTSBpbnB1dCBjb2xvciBmb3JtYXQNCj4gbmFtaW5nLCB0aGUgY29tbWVudCBmb3Igb3Zs
X2ZtdF9jb252ZXIoKSBpcyBubyBsb25nZXIgbmVlZGVkLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUg
PGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gRml4ZXM6IDlmNDI4Yjk1YWM4OSAoImRybS9t
ZWRpYXRlazogQWRkIG5ldyBjb2xvciBmb3JtYXQgTUFDUk9zIGluIE9WTCIpDQo+IFNpZ25lZC1v
ZmYtYnk6IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCA1IC0tLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gaW5kZXggODliNDM5ZGNmM2E2Li40YTRiYzI3YTY3ZjAgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gQEAgLTM4OSwx
MSArMzg5LDYgQEAgdm9pZCBtdGtfb3ZsX2xheWVyX29mZihzdHJ1Y3QgZGV2aWNlICpkZXYsIHVu
c2lnbmVkIGludCBpZHgsDQo+ICBzdGF0aWMgdW5zaWduZWQgaW50IG92bF9mbXRfY29udmVydChz
dHJ1Y3QgbXRrX2Rpc3Bfb3ZsICpvdmwsIHVuc2lnbmVkIGludCBmbXQsDQo+ICAJCQkJICAgIHVu
c2lnbmVkIGludCBibGVuZF9tb2RlKQ0KPiAgew0KPiAtCS8qIFRoZSByZXR1cm4gdmFsdWUgaW4g
c3dpdGNoICJNRU1fTU9ERV9JTlBVVF9GT1JNQVRfWFhYIg0KPiAtCSAqIGlzIGRlZmluZWQgaW4g
bWVkaWF0ZWsgSFcgZGF0YSBzaGVldC4NCj4gLQkgKiBUaGUgYWxwaGFiZXQgb3JkZXIgaW4gWFhY
IGlzIG5vIHJlbGF0aW9uIHRvIGRhdGENCj4gLQkgKiBhcnJhbmdlbWVudCBpbiBtZW1vcnkuDQo+
IC0JICovDQo+ICAJc3dpdGNoIChmbXQpIHsNCj4gIAlkZWZhdWx0Og0KPiAgCWNhc2UgRFJNX0ZP
Uk1BVF9SR0I1NjU6DQo=

--__=_Part_Boundary_003_1412115091.600229593
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKYXNvbjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMDktMjYmIzMyO2F0JiMzMjsxODoyMiYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4m
IzMyO3dyb3RlOg0KJmd0OyYjMzI7U2luY2UmIzMyO3dlJiMzMjtjaGFuZ2VkJiMzMjtNQUNST3Mm
IzMyO3RvJiMzMjtiZSYjMzI7Y29uc2lzdGVudCYjMzI7d2l0aCYjMzI7RFJNJiMzMjtpbnB1dCYj
MzI7Y29sb3ImIzMyO2Zvcm1hdA0KJmd0OyYjMzI7bmFtaW5nLCYjMzI7dGhlJiMzMjtjb21tZW50
JiMzMjtmb3ImIzMyO292bF9mbXRfY29udmVyKCkmIzMyO2lzJiMzMjtubyYjMzI7bG9uZ2VyJiMz
MjtuZWVkZWQuDQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVk
aWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0ZpeGVzOiYjMzI7OWY0MjhiOTVh
Yzg5JiMzMjsoJnF1b3Q7ZHJtL21lZGlhdGVrOiYjMzI7QWRkJiMzMjtuZXcmIzMyO2NvbG9yJiMz
Mjtmb3JtYXQmIzMyO01BQ1JPcyYjMzI7aW4mIzMyO09WTCZxdW90OykNCiZndDsmIzMyO1NpZ25l
ZC1vZmYtYnk6JiMzMjtKYXNvbi1KSC5MaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsu
Y29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9vdmwuYyYjMzI7fCYjMzI7NSYjMzI7LS0tLS0NCiZndDsmIzMyOyYjMzI7
MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzUmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3Bfb3ZsLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7ODliNDM5ZGNmM2E2Li40YTRiYzI3YTY3ZjAmIzMyOzEw
MDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9vdmwuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYw0KJmd0OyYjMzI7QEAmIzMyOy0zODksMTEmIzMyOyszODksNiYjMzI7QEAmIzMy
O3ZvaWQmIzMyO210a19vdmxfbGF5ZXJfb2ZmKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYj
MzI7dW5zaWduZWQmIzMyO2ludCYjMzI7aWR4LA0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO3Vu
c2lnbmVkJiMzMjtpbnQmIzMyO292bF9mbXRfY29udmVydChzdHJ1Y3QmIzMyO210a19kaXNwX292
bCYjMzI7Km92bCwmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2ZtdCwNCiZndDsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtibGVuZF9tb2RlKQ0KJmd0
OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjstLyomIzMyO1RoZSYjMzI7cmV0dXJuJiMzMjt2YWx1ZSYj
MzI7aW4mIzMyO3N3aXRjaCYjMzI7JnF1b3Q7TUVNX01PREVfSU5QVVRfRk9STUFUX1hYWCZxdW90
Ow0KJmd0OyYjMzI7LSYjMzI7KiYjMzI7aXMmIzMyO2RlZmluZWQmIzMyO2luJiMzMjttZWRpYXRl
ayYjMzI7SFcmIzMyO2RhdGEmIzMyO3NoZWV0Lg0KJmd0OyYjMzI7LSYjMzI7KiYjMzI7VGhlJiMz
MjthbHBoYWJldCYjMzI7b3JkZXImIzMyO2luJiMzMjtYWFgmIzMyO2lzJiMzMjtubyYjMzI7cmVs
YXRpb24mIzMyO3RvJiMzMjtkYXRhDQomZ3Q7JiMzMjstJiMzMjsqJiMzMjthcnJhbmdlbWVudCYj
MzI7aW4mIzMyO21lbW9yeS4NCiZndDsmIzMyOy0mIzMyOyovDQomZ3Q7JiMzMjsmIzMyO3N3aXRj
aCYjMzI7KGZtdCkmIzMyO3sNCiZndDsmIzMyOyYjMzI7ZGVmYXVsdDoNCiZndDsmIzMyOyYjMzI7
Y2FzZSYjMzI7RFJNX0ZPUk1BVF9SR0I1NjU6DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+
PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZp
ZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBj
b250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1l
bnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3Ro
ZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQg
aXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lw
aWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5n
LCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0
dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJp
dGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVj
aXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZl
ZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRp
YXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNv
cGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlv
dXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFp
bCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_003_1412115091.600229593--


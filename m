Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B7F993EC5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 08:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C355810E467;
	Tue,  8 Oct 2024 06:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="WWEXc3tZ";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="tcHXaKNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A579310E467
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 06:40:08 +0000 (UTC)
X-UUID: 26dd3010854011ef88ecadb115cee93b-20241008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=gd4Lm4Xv4UEIBEvzTb0BK6OphzxhkzHEoBaWP6EC7vY=; 
 b=WWEXc3tZtMsjhfNd0LFdXwe6NngJ02vcVQGtKT6YYvsCayZjMJYiq+unJw4TIheiVBK1EjxV6q8N3Eq0BUbPOyiprzZNmWL9jnAI5N03CM+myaqLpTkKY/j3mKPTKO+Zm79/aFmI0vZgw2f7GGu7ebLsydeErhSNBWZ7+DtVGEk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:84660ebf-29e4-4b83-b0f8-2e2f4a9e82b8, IP:0,
 U
 RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:1
X-CID-META: VersionHash:6dc6a47, CLOUDID:1ecee964-444a-4b47-a99a-591ade3b04b2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 26dd3010854011ef88ecadb115cee93b-20241008
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 407609611; Tue, 08 Oct 2024 14:40:04 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 8 Oct 2024 14:40:03 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 8 Oct 2024 14:40:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8Zt4TYJYW8vxq6ug3pLsieadq7C+uatbE7W17JdGNiKdHisT0OnGBaKzZNkfmRjwDi3tlAgMTrjDJX0aw+TSDEYfDl0CGc4s7K8IikcCgNzz8GcYN+triypNXKsbpOOv556Wy9jBHcdDF+k0nMAWkSPPPz8qYFXmYKqWXqb47c+vKSuizRoPtIO/LduPg36mtHXyccL5d4CMfDrl4MFtY+WGVh1xTrjszBsDUV1SvNkoqw5uYPaxetMbTYNIlAoIIq5Q15eXIZeXQ5/5CSWRBR211k3xhwDw6WWcfS6Eass2KWXvbOrb/Hqq9J41g6Wu0j5rbAS6ZAS+nJVcO9YhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUyqRbIsaShirLRbcR7bQc35KDgNuqRE+hBK54gg4ag=;
 b=MH3hlxH3Vcbqg8kIrAcSs+ovhpUgD064uEzhijca3n2zaYXA/I/+xm2q9MOlTl09kovStt8Fyu/YIGSVLcfqJ3VfyGOrEUVB7VvFXRQmOwum0qkmEA5wdoffvE2d+QipxChGPdJ7spCUGuQrvpIoeoXH1eGZX7s/tcHnFOMdFXEFVB0pU2EEA1wNzK9caYTi+OeKWh32ChGidqFho6Fef3VnBrgFyhRwgjjn4wuAhnT5pWoziSUh3bbUYJlPrT3KJ9Y9KCFxApwkDhOFy0bflFxjzP4tOr/2LkhSumlvm1WACBryXVGYahluP7/LUgC8V9LZ58XHele4v0LFgBxwdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUyqRbIsaShirLRbcR7bQc35KDgNuqRE+hBK54gg4ag=;
 b=tcHXaKNG16NkNgptEK6a/P6WNM/9zoYqagdDvWGI0VRC1asdxKRiDJa6sxKROCkByH2cKEL/evInyVvZiUMLjtBfNDwY3ABXoTUxk+oiRPf7gtW3Pk64Vb5xPTD/ErOZzVyFnJYgsN2KDT8f0nSAcUH6sTc1ja6MeLU3x9ttUrQ=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB8739.apcprd03.prod.outlook.com (2603:1096:101:219::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 06:39:59 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 06:39:58 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "wenst@chromium.org" <wenst@chromium.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "yassine.oudjana@gmail.com" <yassine.oudjana@gmail.com>, "me@adamthiede.com"
 <me@adamthiede.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v9 0/5] Fix degradation problem of alpha blending series
Thread-Topic: [PATCH v9 0/5] Fix degradation problem of alpha blending series
Thread-Index: AQHbGIbPprSa7Zs96kep4XBv9/NGLrJ8QFwAgAAoXwA=
Date: Tue, 8 Oct 2024 06:39:58 +0000
Message-ID: <4fab69e70fa267034fe2b5184ccd1ccd16a1d921.camel@mediatek.com>
References: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
 <CAGXv+5GzmWhs1ZiNtty1eH2h9n7bw-EeAdZQvXaBLMUA5cUuzg@mail.gmail.com>
In-Reply-To: <CAGXv+5GzmWhs1ZiNtty1eH2h9n7bw-EeAdZQvXaBLMUA5cUuzg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB8739:EE_
x-ms-office365-filtering-correlation-id: 3f288de2-a49d-40c8-9620-08dce7640776
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?M0orOGlBY01jeitRWHRQNmI4RzBVaFJ5ZG9oNDBrT1N5ZXhUQ3VBVmtaY3d2?=
 =?utf-8?B?Ny8wM0FTY3RWUlNYbVRyaW1LN29tLzlLUTdRVHE1RTQwZE56UER2SklmVkF4?=
 =?utf-8?B?dTd4Z290anNiQjkweVpIUHNuNmRNWk1uL1NYaWJJNzJBaVpCOEVZMWVwT3Z6?=
 =?utf-8?B?eUJub2lnRG0wTEQzRmg3YkRPTU9qL2d1WmhJUFhzRjVYUnZSOHRFN0V3OG5R?=
 =?utf-8?B?OFNDVFczbzQweVA3UXhsdVlUVEdxbkF6cnFZZ3Q4dnYxTDRjZDJHT3NHanlu?=
 =?utf-8?B?aG4yMVZqT0V1NkEzTkxlK2VUZEdZWmpQckR6YVhtMVN0M2RNYWdDMHQwTEFZ?=
 =?utf-8?B?TFRlaENRTTFIOVY5V2hoRmtUZ0JpeXcvRDd3WVhpeHdOYzU1Y21zRlo2M3Ix?=
 =?utf-8?B?UmRPQmExWnk2c0dKeFl3cDM3SWU3eXlvOW1tTXJyS0U2cFNOdmVhREJQdjJX?=
 =?utf-8?B?dXZnRkJzTEtRY1hYa003LzBLb0hMV0JmeHNEc0lEZ21YTlFNeTRRbWlwdloz?=
 =?utf-8?B?YzJqUGVTaGp5ZDFidlBFZkV4QlFyUzNRVGUyTkFVSzdxdi82NE5CRzRiL0Jo?=
 =?utf-8?B?TGVreGdZblFHbXBRNUZKalFJRXV6VFM3NG5Mc0Q4RE5XTC91US85cnhPTlhR?=
 =?utf-8?B?ak1JdWhDd0xtSzQwcHJ0c2hIVTVCclkvVUsyMkZlUG15cCtEMTlyZVVTTlVj?=
 =?utf-8?B?MDhDZlF2dWJvMk1lS2JxdFhwOW9lUTVYbjdhNitwVFRsWFl3VDQvUlkzK0o0?=
 =?utf-8?B?SXk3RmRSSHYxZjN6dXFKdlVtVTJReHBiYmhDYlNmUERjZ0ZsS01GUkQyM2Y4?=
 =?utf-8?B?dVg5Q1VZME9IakFDQUNxY254K3E5YTdIYVMwS3hWamY2VlNnQ3E0ZUpxZW9t?=
 =?utf-8?B?dlo5eDJSYmVCS2ZrQllxQmpJTklXM3JsYk9PblMvSElmS2JFMC9iNXFuWDBq?=
 =?utf-8?B?cUVKTVhTTG5VSGxmKzRuQTI1T0xpdXU4a1YzRUMzUndFQng3OVo4aE1NSFlu?=
 =?utf-8?B?VzltRTlaeTFHWHNlM1I5UlkwMEhCcjc1Qjd0cy9vZFVUdU1nbkhUQTJrUjVP?=
 =?utf-8?B?dTlnU0dBTi9uN1hsQWU1ZEFBVXE0aDNyUklaYko1SzJ0WnFJOFFwSVkvaHBH?=
 =?utf-8?B?dWlobzFwdDZPRlZBS3JaejRaN2FlZHBNK0VzKzdEREhwdnc2RlZxZk5CUmdF?=
 =?utf-8?B?OXduMS9LVHE1NFhIWFZCRlB1c1RDOHI1Y2JZckxJTXNsZytmc01IZU15dWVZ?=
 =?utf-8?B?QVh5ZzdRRFRQd0QwRHhIaW1EcXdTNjNXcnJSMDcvUFRWL1lzSWFYMDZ3WUtx?=
 =?utf-8?B?SVA5anU0dUpKdGFGYmdJL3lhMm9jTUI0RHV0UENxckYydlJjZktGWm1DQzha?=
 =?utf-8?B?ek5xUEVLZ2pmRjBxNEdIc2tvV1JXaG1xK0hpN3IvWmRoN05yK2Vnb2hSOVRy?=
 =?utf-8?B?N3dtOE05K3BMT1VtR2MxL04wQWZrVGtsbit0L1ZhZGZ0UjRldWJTUDFrb1Vn?=
 =?utf-8?B?REtFTmRrclRHbUJKbGZ6SmlSTDhwbGVNR2pvT2tmUzBEV0syNWMrOEljeDhH?=
 =?utf-8?B?WDdKN0YvM3oraDdJeTJsTEt4dlExTk5WK203c1pFb3E1eGg1cmdBSGZlN254?=
 =?utf-8?B?SE9UYmpoaWJHb1Q4cnBjS1lUTXZuaEVOcjRxNm42eDZTZUVDNTVWZXZSWkZB?=
 =?utf-8?B?eUhiQktTMGZrbCtyVGlQOVRReFZWRTNvS0pqMlMvcnVwMzdJTm4yV2MwSU9K?=
 =?utf-8?B?Qm5zMGdNYU9ncVNwL05iYmNmZm9DalhTeVpEODNWMlZkL1BnclFodnpLb24y?=
 =?utf-8?B?dEg4elQyUFFCdHNDU1JiUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3pVSVBWTzY5U3hQdnhmb2h5cHJENjc4dXZJeGNOcXdWZmkrSVcyUUxoNEFM?=
 =?utf-8?B?NVp2WUowOTFMT04zdGNjYkhrUVJ0R3NMdktXMTZNUDZrM05sVXpiKzQvbjMz?=
 =?utf-8?B?REJ0VmZlc20vYUs4dmE1UERDUFl0WGFVTE5kbTJEb2EvMy9DWVBHQzNlQWVm?=
 =?utf-8?B?cHdHN3JmN0NNTnRaTCtDZng4cm9nSzBLZzUvSEovUWdST0FyQmZ5WnVhcmlZ?=
 =?utf-8?B?ZGxhOEp1MExiRU9ZTGhiL2JyQ21CTGJzL3F3NXR3UUtWY2c1RmgzWWQrQU1q?=
 =?utf-8?B?Z2JtdzZuRGY1TnU0REFEdmpOTTRuZk1kelJ2QUplOVpDc2V2cFc4SUUrY2Zq?=
 =?utf-8?B?cjJGRno4cEI3RnJNUkhOb1FiejNRNS9uVThjbzROVk1JeE1yM1h1MU4raUFx?=
 =?utf-8?B?eThRK29VUDNYaDJvbVI0d0c0MmVGZGJQaTZiclRPemxvVUtxNkdkTGRqSm1S?=
 =?utf-8?B?cWg3NUpLRE1kemdSVU1yQlp4eWV5MisyVXcyRW9iR1hRb1hhSllXVHZMRDVm?=
 =?utf-8?B?QjRLdFYvK2NWWlduQUZUWENReVhrZE41d3UzTGZ5MGJkVXdxNHBrUVJ5RG5T?=
 =?utf-8?B?WVREVXJOWUZaa0JqSFVHeHF4b09WWDdudUVuVG1HTDJYRXdyajlkb2JkQ0NR?=
 =?utf-8?B?dmQxNU1lT1ZoNk1vdkEyV1NOaFB1UXUrWnY4djBEMlhEeHYxMmI0VnpFcTZP?=
 =?utf-8?B?NjVrS3UxbkJ0NXpRTk1mWW52b01PTHBuTzR3L1RJOVdzVjBGcHFCU0gxTlRu?=
 =?utf-8?B?UXdQc2hNM2tPaWF2Qmw4cHpGQmVLakJBbXdvTm5jSUsvQ2ZwRmlJbUxzRWdv?=
 =?utf-8?B?L1pZNVo5ZlZpWTJoenkzL21TM0F2QVYwVS9DWUpJditWU1ZsSnhhVHkwRnZO?=
 =?utf-8?B?bUJkZ2EzRXBmMUxORnVYSjhYY2kyOU1wdDNsbytQUHcyR29WNXpBcEd5Q081?=
 =?utf-8?B?eDM3aGlKM2NTZzZudFhSY09hQzdiRzdlTkZrYURpVGhjYzY1U2VCUXZ5NjYz?=
 =?utf-8?B?RnM5NStVYjdvNG1NVitoYXhlaHJwYlV5QTZPb2U5T292N3BmT2RQeDBmZkJ1?=
 =?utf-8?B?QnRsUkR1c2d4TldYUldtTXd5T2hoMjlXS04wZTNzQWNaNnJnY2hnSFA0b0lq?=
 =?utf-8?B?SExnNGVrTElBeDZ4R0pCQ0VLbEVzeW9jNGJjay9PSmxxQklYQTk2QmlBUENT?=
 =?utf-8?B?N2g3c0RKTGNwQ0xLUW9OL2JUMThTREp2VUQ1bTBxNGZIZkZLWG5hbFVTUzhp?=
 =?utf-8?B?WU52OVVBTk5XTmJXWTdsa3QyNjdHbE5XdGswb0cvbnBKYlZNaFhpMTAybElX?=
 =?utf-8?B?WGJsZWVNVVlFRWpxenNnbUpPV2JPb0xRY255bFdUWG45ai9ydE0wSzlnNlVZ?=
 =?utf-8?B?N05sQmFXakx2bG9ZUFdtY0h3ZnhENWpLTkJWK29HMFF6RjRvZGFzZm5aNDJB?=
 =?utf-8?B?RmJxZ3JOQWZiaHJDMDNjVXRjZXAyUGhBY0RhbHh4WGRFZm9jYm1ZNnFxeFoy?=
 =?utf-8?B?NGxtbzJia3FCcWJFeHQzL1ZQMzA5RWJTQVgvVVBFaEtkbFQ1WXBLQmp4YW55?=
 =?utf-8?B?dmhTdU5lZnpKQVRqWndRYlMrOE1VbjQxeEVldkNNQVZVcFFvVGJIS0RBVU9o?=
 =?utf-8?B?UVRGYU50VlEvbW5NbkhMS2N0QmUyYmhLdzIra1R1YWZpMkhVczZOcnBrbTFF?=
 =?utf-8?B?Q0NtVUNkNjhtMUpqTlBCM3RZQ0pGMGg1T3FWY0ZuUDY1QU9ZWHN4UkNDcXdK?=
 =?utf-8?B?REpjbUYyNVVjMEIwR3dWMXNXOUdBYWs2V3I4YlNCODVWdktWNWdjZXNDUkgv?=
 =?utf-8?B?blFXK0hyWTZBcDYzVTQ5ZGlqVGhWU2xSMnNubm5KaWxBRzg0YlJhRFZrMmZU?=
 =?utf-8?B?dmV1TUE4dzJ4Sm9Ld3pFTmw5d3daRGFSWUt5cmVlUkJGbm1kbU9BZG5uYXR2?=
 =?utf-8?B?UzlQZnpxRm1FMXA2UUJ0WFdEdDVTbFhDaGNBT3VVQnNScDFNZGQ5Y3lHdmVD?=
 =?utf-8?B?NnFFRGhjZlVQSWtNQlk0clM5cWplNkZjbThIY2RkMVBOUzlmSHk2dGtDeWl1?=
 =?utf-8?B?T1NkbFl6NEFxRWZad1NUV0VieVpnMDBVZXJEVVpkaTE2QVpVcWMzWmdxRmlU?=
 =?utf-8?B?MU93MlFFbGk3QmFSSTIwazhqRHVqU0tVWlBiejdFU28xNTA5b05WbTlFTEJm?=
 =?utf-8?B?NlE9PQ==?=
Content-ID: <F5BFFF74920E9145A75A4A0F29BAF3DD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f288de2-a49d-40c8-9620-08dce7640776
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 06:39:58.7181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 39wP50NfWv+HQZHHXEXoaZLNd9f6NizvJ+VmQTEsFGdF+Q3OmTbxj5Q3SEXjLfNC/cNCb4jKFKIt3oeD37WQx5tDfdsjCx3Ml58XljLAdY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8739
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_776446377.2084714196"
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

--__=_Part_Boundary_002_776446377.2084714196
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI0LTEwLTA4IGF0IDEyOjE1ICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiAgT24gTW9uLCBPY3QgNywgMjAyNCBhdCAzOjAx4oCvUE0gSmFzb24tSkgu
TGluIDwNCj4gamFzb24tamgubGluQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBTb21l
IFNvQ3MgZG8gbm90IHN1cHBvcnQgdGhlIGlnbm9yZV9waXhsX2FscGhhIGZsYWcsIHdoaWNoIGJy
ZWFrcw0KPiB0aGUNCj4gPiBYUkdCODg4OCBmb3JtYXQuIFNvbWUgU29DcyBkbyBub3Qgc3VwcG9y
dCBwcmUtbXVsdGlwbGllZCBwaXhlbA0KPiBmb3JtYXRzDQo+ID4gYW5kIGV4dGVuZGluZyBjb25m
aWd1cmF0aW9uIG9mIE9WTCBwcmUtbXVsdGlwbGllZCBjb2xvciBmb3JtYXRzLA0KPiA+IHN1Y2gg
YXMgTVQ4MTczLg0KPiA+DQo+ID4gRml4IHRoZSBTb0MgZGVncmFkYXRpb24gcHJvYmxlbSBieSB0
aGlzIHNyZWllcy4NCj4gDQo+IFRoZSBzZXJpZXMgZml4ZXMgdGhlIGRpc3BsYXkgY29sb3IgaXNz
dWUgb24gTVQ4MTczLiBUZXN0ZWQgb24gSGFuYQ0KPiBDaHJvbWVib29rIChUZWxlc3UpLg0KPiAN
Cj4gVGVzdGVkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnN0QGNocm9taXVtLm9yZz4NCj4gDQoNCkhp
IENoZW4tWXUsDQoNClRoYW5rcyBmb3IgeW91ciB2ZXJpZmljYXRpb24gOikNCg0KUmVnYXJkcywN
Ckphc29uLUpILkxpbg0K

--__=_Part_Boundary_002_776446377.2084714196
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjQtMTAtMDgmIzMyO2F0
JiMzMjsxMjoxNSYjMzI7KzA4MDAsJiMzMjtDaGVuLVl1JiMzMjtUc2FpJiMzMjt3cm90ZToNCiZn
dDsmIzMyOyYjMzI7JiMzMjsNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7
UGxlYXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVu
JiMzMjthdHRhY2htZW50cyYjMzI7dW50aWwNCiZndDsmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVy
aWZpZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0
OyYjMzI7JiMzMjtPbiYjMzI7TW9uLCYjMzI7T2N0JiMzMjs3LCYjMzI7MjAyNCYjMzI7YXQmIzMy
OzM6MDEmIzgyMzk7UE0mIzMyO0phc29uLUpILkxpbiYjMzI7Jmx0Ow0KJmd0OyYjMzI7amFzb24t
amgubGluQG1lZGlhdGVrLmNvbSZndDsmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0Ow0KJmd0OyYj
MzI7Jmd0OyYjMzI7U29tZSYjMzI7U29DcyYjMzI7ZG8mIzMyO25vdCYjMzI7c3VwcG9ydCYjMzI7
dGhlJiMzMjtpZ25vcmVfcGl4bF9hbHBoYSYjMzI7ZmxhZywmIzMyO3doaWNoJiMzMjticmVha3MN
CiZndDsmIzMyO3RoZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7WFJHQjg4ODgmIzMyO2Zvcm1hdC4mIzMy
O1NvbWUmIzMyO1NvQ3MmIzMyO2RvJiMzMjtub3QmIzMyO3N1cHBvcnQmIzMyO3ByZS1tdWx0aXBs
aWVkJiMzMjtwaXhlbA0KJmd0OyYjMzI7Zm9ybWF0cw0KJmd0OyYjMzI7Jmd0OyYjMzI7YW5kJiMz
MjtleHRlbmRpbmcmIzMyO2NvbmZpZ3VyYXRpb24mIzMyO29mJiMzMjtPVkwmIzMyO3ByZS1tdWx0
aXBsaWVkJiMzMjtjb2xvciYjMzI7Zm9ybWF0cywNCiZndDsmIzMyOyZndDsmIzMyO3N1Y2gmIzMy
O2FzJiMzMjtNVDgxNzMuDQomZ3Q7JiMzMjsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtGaXgmIzMy
O3RoZSYjMzI7U29DJiMzMjtkZWdyYWRhdGlvbiYjMzI7cHJvYmxlbSYjMzI7YnkmIzMyO3RoaXMm
IzMyO3NyZWllcy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhlJiMzMjtzZXJpZXMmIzMyO2ZpeGVz
JiMzMjt0aGUmIzMyO2Rpc3BsYXkmIzMyO2NvbG9yJiMzMjtpc3N1ZSYjMzI7b24mIzMyO01UODE3
My4mIzMyO1Rlc3RlZCYjMzI7b24mIzMyO0hhbmENCiZndDsmIzMyO0Nocm9tZWJvb2smIzMyOyhU
ZWxlc3UpLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtUZXN0ZWQtYnk6JiMzMjtDaGVuLVl1JiMzMjtU
c2FpJiMzMjsmbHQ7d2Vuc3RAY2hyb21pdW0ub3JnJmd0Ow0KJmd0OyYjMzI7DQoNCkhpJiMzMjtD
aGVuLVl1LA0KDQpUaGFua3MmIzMyO2ZvciYjMzI7eW91ciYjMzI7dmVyaWZpY2F0aW9uJiMzMjs6
KQ0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+
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

--__=_Part_Boundary_002_776446377.2084714196--


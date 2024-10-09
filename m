Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C5995E33
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 05:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C7D10E071;
	Wed,  9 Oct 2024 03:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="OABDKq5f";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="LukT+Uex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6743D10E071
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 03:34:40 +0000 (UTC)
X-UUID: 67403d1485ef11ef88ecadb115cee93b-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=+4uhpjs34rk3PSlTPkJtsX5YF93PSTZ7gfxj2J1jyJw=; 
 b=OABDKq5fv5Go+AUm+3xOr7HUYpofE8I2LzjfQxQywPFcwTalMUEsCE5fOXbEn9a2QxivAXZezOoxQ5qvE7MJ2nZCIX45Qr91aoPYLtrb8YxtC6eH9rZsqD9Rda4dOyLkqFhrlPMkxSn2PopmFt74fiB7JfXKDw/rbz5gXBM6QxU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:4a88c1e3-63c4-401f-a128-1b1f0ac87c26, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:268f8226-5902-4533-af4f-d0904aa89b3c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 67403d1485ef11ef88ecadb115cee93b-20241009
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1019316902; Wed, 09 Oct 2024 11:34:34 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 11:34:32 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 11:34:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFmrQ2NoOZlYZZGWrjWAOPFJL9eoZJmsEaZV4TIxylFK7LUjtNAhKbU+CM4JM9sMBQCSeDd5PAsBILRP0SmiLojDGc0ZPyVJGE3BHasSRtjCcrKR/UFx6QwiDncTDT6aJY1XIeXym/ZSDOnRrVHR1C79deinMFCcDS9fl5n3QJxoi9hBABVtxp6uPrkdyFgpl4wzBpIqZrcuhn+6/6sCDxAQVL+9g6MgbEqImsrnZPUY5YerXI5uLn36SBzW8iSIcgewViY6EBfB7GO+blK6iQn4yrTCqLDKAmplui5Tlcct2FtONnFBQNLshhecThSrtL8/EPCgF87XIsiw8syxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcjxcsHm8PcPk7y5SXhvaDnPnaHLqC/6g6tNO3KldnY=;
 b=dukqbzlVwEcvS3CracUo2WyJcjX5ewlZ8ExorB4Q8zboN1QVQH6hEAr6e9ltZggVPIr8sH9XxuCl6YJKTMEdVVKV8u3j56QigX4ODb6UpV0aOODzy4x0gfBzhn3/V6OSVQEsN2UDjocGQT0nF2u5E6LXuxWeq5tAAf4Ysd4HCB3fLZungLEK05JQUsJlwAmdMGTUp9IpVZL1xS2D2Ds05QKF9UaqZJ9fzOx/evy+Cgkopqs0tFE4asXRSPvgrdsAlliRUDHBNnGHSvuZMVglrRwK/gMKoQTev/72REeKoD1BgeMIvMqbTQQyyOeCIy2WAgFDovsjGb9OpH3UB7A0KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcjxcsHm8PcPk7y5SXhvaDnPnaHLqC/6g6tNO3KldnY=;
 b=LukT+Uex0BZ2W10rnkGJ5dGaMkURo3G756S25FRLrSrCz9eelOedzMcONrAEVrJc7amcow/s/1OrSGMKXsHygB194FGT2y9YER8YA25erEEms5+PNJOsso+Av5Xpw3XFxaRpZQqky9QKnXBOC5sLrH1/XNAAvwbL2I0E13HZUpI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB8089.apcprd03.prod.outlook.com (2603:1096:400:44e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 9 Oct
 2024 03:34:29 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 03:34:26 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "Markus.Elfring@web.de"
 <Markus.Elfring@web.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "me@adamthiede.com"
 <me@adamthiede.com>, "yassine.oudjana@gmail.com" <yassine.oudjana@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
Subject: Re: [PATCH v10 4/5] drm/mediatek: ovl: Add blend_modes to driver data
Thread-Topic: [PATCH v10 4/5] drm/mediatek: ovl: Add blend_modes to driver data
Thread-Index: AQHbGU3tM6whzm5cYUeJ97ziSj4X47J8gjWAgAFDdYA=
Date: Wed, 9 Oct 2024 03:34:26 +0000
Message-ID: <09159834fb362b2e6b3aaee70b4321c07d37601c.camel@mediatek.com>
References: <20241008064716.14670-5-jason-jh.lin@mediatek.com>
 <0116377a-cbf1-45d7-b961-4ef0198ad8d7@web.de>
In-Reply-To: <0116377a-cbf1-45d7-b961-4ef0198ad8d7@web.de>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB8089:EE_
x-ms-office365-filtering-correlation-id: e6ecb43d-13af-49b0-328e-08dce81346a4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?S0J6Y2ViZ3NlQmJqeStONU41SUpjcHArOFVEcW96R1o5MmgrNFFucFdVbDNj?=
 =?utf-8?B?NFNqdmdJQ1JLcElKTjVDR2puNndlaExMVkFlbGZhRm9YZldPOFlkYVQ2eDd5?=
 =?utf-8?B?UW96R0FOL1hVUDdYYy8vUzBBM1RScVRmZjBnSWdjdnlZM0JuMXBFa1R6cTN2?=
 =?utf-8?B?eC91d0s2Qk9yV0pZSklTSWdBZmg5YkNQbDFkeW91Nmt5eHpTcm9UaS90KzIx?=
 =?utf-8?B?N1N0eGE3TG1kNTE1TWtuTC96VG10YXM5a3FPQ1BtV0w3eU9ieG1IdHYySVcv?=
 =?utf-8?B?MUNvMUw0YnJnS21vZlNOTUJUa0VsalJvSENHbW8zWldOSURUL3IxL2txZVJC?=
 =?utf-8?B?cmdWNHorN3FhWUNLZGtPVDRTK25WZ0hjSkloNm5oWEdiUUJmcUU1Q3dpaDdm?=
 =?utf-8?B?N2NRK3l0UXd0MnVmS0w5eFJIODV3VUNsT2FuQnM1ZTErZWdvWFVDQjJUSGNt?=
 =?utf-8?B?bGVtZXE0c0J4K2t5WWVEdFZ3TzJUdnhVREQrdThRY2o5b21Oc1BpTENiVVkr?=
 =?utf-8?B?cTZSR2lZS01SRGJnZlRLM1B1K0tyRkI1ZDQ3MzFCM1ZDVVFMYTUyR09nSTVQ?=
 =?utf-8?B?dDlNYnczYWJ0MUc5RUNJN002alE5ZGpFZ2hyNldLN1YvMmRTVFNPWUE1MGdj?=
 =?utf-8?B?VXNUNGZRWVg0NnkyNmFqYkJtYS9Zbk82TXUrZmRTSHdxQlorVXNmcDNOSmRN?=
 =?utf-8?B?OHVVK3ByR3RacmxpTkVlTG9sZlZyTUtCWEZoK3NoT2RqdmQxUXRvemh1b0Fm?=
 =?utf-8?B?UXMwU29ENnZpN3FGd1NQbWMyejdBU2FMcGVzMTNEc3U2RkVDQmxENDlDSGlM?=
 =?utf-8?B?Vm9IclYwZWdTVm0rNDg2Smp6QVFKQlRmQldVeStFUzZHV3R0amhUQUNPdko4?=
 =?utf-8?B?Z0tBb2xlYlNLSDVRaHUvSkt2VldVVnU3RFNZQjcza0hwWExhVzR4MzVIL044?=
 =?utf-8?B?ekdkRFgvODlOK0JyK3R6SHlMb3hSYVVDcmJKKzZVdlNPNm00WkxQMzVsQTBo?=
 =?utf-8?B?S3pNTGFsRmRDNlRaZ3NFRFRiQzFma2kyWU05ZXlVNjdGS2tnV1NwQ3Rnc050?=
 =?utf-8?B?ZW5ZYUFPTDlleDFOeC8rb1RBblAxMS9uNTlTQ242WWJGZ3NZSzduc3pJeEJr?=
 =?utf-8?B?dEFXdFZ2RGF1ODB5Z3V3NmJQZC9Fd1ZHYVYvR2hMN2RJQ0RMVlUyZjU3Uzdx?=
 =?utf-8?B?dlBwQjdxTHp3R0hCRlUzUTVHUFJpcVlxVUZPUTJLTGp6YUNvMjJOS1VIdU1w?=
 =?utf-8?B?ZlBYRndab2NXSE9pNlVrYXl6V0x4VFJzZnVMZHZyVVNGbXlIZjBhS1I1ZElE?=
 =?utf-8?B?Ti94MHZpaHNTeEdDcVdxR3IxRFJpOG40SllLK3c5SWRhUmNHL21TajMxQjg5?=
 =?utf-8?B?U3FIZktyZ1hCTHRQdll3UE8xd0xyTWJFNDh1UTBQR3k3QWVBNEU1YmNhVXZ2?=
 =?utf-8?B?SGZzQThrNmVFbCtaSTJab1BVUDFXTEdTNDVESmhhWTdlUGdoQWNlbVUwNDNG?=
 =?utf-8?B?aGJ4ckI2RW0rWFF2ZHJ4bEllS3kwSVp0SFRuUGt5UzUzSTY3LzlwNEZIVEJx?=
 =?utf-8?B?YWVWM3VSSDJzcGtwR1ZvQXUyQ2dFcjlud0ZvaTMreTVMQTlBcEtUNmwxM2Nm?=
 =?utf-8?B?ZGp2U0xhbGhtbTRLSG9SMGtFVEVMWnArcjJ3c3h2bWNhTUhHZ05OZFZnOTl2?=
 =?utf-8?B?WnVWeUk5bkZHQTc3ZmpxUE5KbitTRU5SL3pnSGtwOU94ZDNubmJYeUdhUDZ0?=
 =?utf-8?B?Qmlxdmw3dy9TVFBTcjVaOSs2WW5NczNFNDdlVjMxeEZySm1VYVMyWGtXa1dP?=
 =?utf-8?B?MHNtejhhVGo1K0xqWW5QQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmRGY2JFSHFTcnVFRjhFNEJ6a2hKek1MN3daZCtqaWt2TktPSmN0RzM3ZXlQ?=
 =?utf-8?B?eXp0RU1FQXIxTmlrOEYxN1JPTjBBR0QraXptdW9RMGVCZ0YzRE1EZ1h2eFVs?=
 =?utf-8?B?UDdQai9sL25GdjdKRjZpdUd5a0g4aVkrWk1DdkhmL3pQOTVFd3ZhVHhSM0Za?=
 =?utf-8?B?YWNHQnpKRkZ4alo2b3BjWWFhNEJKSEtMMTlhTG95Zk1hSzRBR050SEVrWWRh?=
 =?utf-8?B?OHlETElmVUFyYW5nWEdmUUNleDhKTXMzRG5VYjJ6ejlBTjFCeERCTWpOTjd5?=
 =?utf-8?B?Q0phaVg2T3V2dDJKQ1pySnd5R3E3SzQ3cmdmVkdGTkFsK0IxNzRZckpIS3Bw?=
 =?utf-8?B?Vm9YZFVmR2hJYW0ycUFhandnZkVtQ1NTYzVMWUNpaGEwT2lpZ291dys3WDlh?=
 =?utf-8?B?RzdyM05CZHFVSkw1TktqcVQ5b0lYc2Rpa0dKNEF4SUNVaFhyampqZEVVZUVp?=
 =?utf-8?B?Q0ZPalBnTndLQlY3c2hZY243QWYydDQ2N3g3MmJQZlQvY2tZdG9wZ1l3aklm?=
 =?utf-8?B?dldiNjA4KzdvRjk4MzFrOE1yTTFGWTZUWUdENTd6a1UwN3YxNm1aRS9tVC9Z?=
 =?utf-8?B?Z2htTzRIQ1ZVQ25qbFJaYjQvNFAvK2hnT2xmN3I3VnJNRTAxVlkvc24vRGZk?=
 =?utf-8?B?dmx3RlpRNDFZcGFVaGhvQmI3eTJoNlRsMVRwNnVQZ25vL2d3dFpseGVlYWZr?=
 =?utf-8?B?UmRLbTVCc055dVJFSG5tOTk3SmRNZFBRbXAzQTFTSEEwTnN5MmJRdkR2UVFE?=
 =?utf-8?B?VE1BT2J2Q1dKL3pNWHR1bm84R2hsQzVMVWkwMEJhd2xQdlFwZGlhU1pqZWtZ?=
 =?utf-8?B?eUNGSlJxZlhkKzlERExPQ2hiZmp4MTEzNmlnZ0VYY3Jyc3JEaTJyQmZuUjNW?=
 =?utf-8?B?SVlLS1BKMWpBN1ZERFVJYnAwLytUdkYxS3ArKzh3dURRVy9nalR5MGh4OUV6?=
 =?utf-8?B?c2FwcWlTVEpnK2Q2OEowMFQvMXVKempsNGpOaUo5T1RWeTdwV1ZzSjdoQUpn?=
 =?utf-8?B?c3Y1UmNkY3JVSVZkazVERUI1czVSVUQ0ZVdYL1V0SUlhcVFhbEIrK08xaG5k?=
 =?utf-8?B?M0luVThRWGF5eDJxakpKdnpKK1pTRW5SUWFrdGlncW41Mkx2MFhjMlZWdkFF?=
 =?utf-8?B?SCtJdXNpeUwvdEkvZG5FcFBHRU5qQUlZQm5VNWphZE9yWkU1aVNwcnVMdURt?=
 =?utf-8?B?UExSaE9FMWVHSzdkY0NmZXh0YnhTYjdobTdjUFVRNXcvWHR4a1lVcjl6RHo1?=
 =?utf-8?B?b2tFdWtHek1aQWlLVDhONXd4K0pReFVIMTRGcGFLZ3BXZjJKTklzZnVxNTY3?=
 =?utf-8?B?bzYvbXFQNkU1ZW1KaUFTTDVxTGt2dEtKQzk2U2xrOGlZdGFYT1lxZktHcmxK?=
 =?utf-8?B?cDRYRzRObkhjdGVOaU5mV3FGdDQwUlVOelZITG1zencvbFNIUWFCOC9FSERL?=
 =?utf-8?B?cDdWOS9ncXdQMmh1VE5TRDlhSWhhNWk1dFJ4QTIrS2pBS2hPU3RabjI0VTU1?=
 =?utf-8?B?UVJ2OGszRTVneGxEdnBRQnZtK0RUOEhXUjZNeHFZYmZ3bnhEVi8yMklXL3hm?=
 =?utf-8?B?VVNwMlNEd1doMVZjYlF4VUkzTm1UVE5jZWN0ZlhUaGpqK0k2VUhVR2lrTTlk?=
 =?utf-8?B?UVlUNmpUOUI4YTgycmFIZG5UUkU4S20zdStYOXZEaXI0R0pCY2haR1ArTVpu?=
 =?utf-8?B?NUgwZFlqY2lTZUIvdG5PWm9LOGRIWXZZaDVVRGI2RXFpb0tuRmxiR1JKNlZK?=
 =?utf-8?B?cFRqdVY2K0dEaUNxTHNtYWdJdDJ4SXZ2VThhTzIrcm45YW8xRFNYL1JRSDNv?=
 =?utf-8?B?ZnIyV2RYeFdvZVpiUDFZVWhHUEpNYnYzNVVJVWJMWThYN3dxeTNlajRBUFg1?=
 =?utf-8?B?S1lDbVpYK0tSdGt1RmVWdGFjcURjUEE4eitOeGRhTkxmZ3VOM09zdUdpZUJu?=
 =?utf-8?B?dkcyUFRBbE5nbVZzT0pDbEV6TzV5M2dyTmszYjFpQStRNXFNalpad3FKMG94?=
 =?utf-8?B?MkFWNG0zd2JqV2grNldPT3Q5RE1zT0Zrdjl3NTVRNlB2c1RzeSthR24xckFK?=
 =?utf-8?B?UUJjTHNRbldOZWFFdFdJY2tqeStCVzUwckxrb2NwLzhEYnB3Wk9GTVdLWW5N?=
 =?utf-8?B?WFBwOXFmWUdpMTBLRFQxU0haYkhMbHFOWDJWSndTRXJISnNLaXkycDE3WGw4?=
 =?utf-8?B?RVE9PQ==?=
Content-ID: <CF77444EBC21A14183EBB7081A26097B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ecb43d-13af-49b0-328e-08dce81346a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 03:34:26.6932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDukYuzMXJUgdlnP/P1NKT0UZgYqkr87fGBAmCB1QMPNJ70SyEO0fryuYHawi8AH0ZxON5voZthm9pFhZLRNsg+4nx5f9Z4NImj3mGOckWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8089
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.339900-8.000000
X-TMASE-MatchedRID: +c13yJDs900OwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
 qIY+/skQkABPgKBt/0rbaVyalxbpdIpsQeZV7e/ebc297PAGtWYfN1sSaNSB9QnnMzd3ORpBK33
 GICKuN//VhspasWP6qJGTpe1iiCJq0u+wqOGzSV07qnMAZEGUXNmzcdRxL+xwKrauXd3MZDUD/d
 HyT/Xh7Q==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.339900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 277F09208F2EBFE75AEB75A6C928DCBEC332A6652F2B79B945F8BEC5B4079D372000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1622516037.1032744859"
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

--__=_Part_Boundary_004_1622516037.1032744859
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI0LTEwLTA4IGF0IDEwOjE2ICswMjAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToN
Cj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3Ig
dGhlIGNvbnRlbnQuDQo+ICDigKYNCj4gPiBwcmUtbXVsdGlwbGllZCBpcyBzdXBwb3J0ZWQgaW4g
dGhlIGN1cnJlbnQgcGxhdGZvcm0uDQo+IOKApg0KPiANCj4gICAgICAgICAgICAgICAgIGZvcm1h
dCB3b3VsZCBiZT8NCg0KSGkgTWFya3VzLA0KDQpibGVuZF9tb2RlcyBpcyB0aGUgZHJpdmVyIGRh
dGEgdGhhdCBkZXNjcmliZXMgdGhlIHN1cHBvcnRlZCBibGVuZCBtb2RlDQppbiBjdXJyZW50IHBs
YXRmb3JtIG5vIG1hdHRlciBmb3JtYXQgd291bGQgYmUgYW55IG9uZS4NCg0KVGhpcyBzZW50ZW5j
ZSBpcyBkZXNjcmliaW5nIG10a19vdmxfZm10X2NvbnZlcnQoKSB3aWxsIGNoZWNrIGlmIHRoZQ0K
YmxlbmRfbW9kZXMgaW5jbHVkZWQgQklUKERSTV9NT0RFX0JMRU5EX1BSRU1VTFRJKS4NCg0KUmVn
YXJkcywNCkphc29uLUpILkxpbg0KDQo+IA0KPiANCj4gUmVnYXJkcywNCj4gTWFya3VzDQo=

--__=_Part_Boundary_004_1622516037.1032744859
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjQtMTAtMDgmIzMyO2F0
JiMzMjsxMDoxNiYjMzI7KzAyMDAsJiMzMjtNYXJrdXMmIzMyO0VsZnJpbmcmIzMyO3dyb3RlOg0K
Jmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMz
MjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29w
ZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2
ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQom
Z3Q7JiMzMjsmIzMyOyYjODIzMDsNCiZndDsmIzMyOyZndDsmIzMyO3ByZS1tdWx0aXBsaWVkJiMz
MjtpcyYjMzI7c3VwcG9ydGVkJiMzMjtpbiYjMzI7dGhlJiMzMjtjdXJyZW50JiMzMjtwbGF0Zm9y
bS4NCiZndDsmIzMyOyYjODIzMDsNCiZndDsmIzMyOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtmb3JtYXQmIzMyO3dvdWxkJiMzMjtiZSYjNjM7DQoNCkhpJiMzMjtNYXJrdXMsDQoN
CmJsZW5kX21vZGVzJiMzMjtpcyYjMzI7dGhlJiMzMjtkcml2ZXImIzMyO2RhdGEmIzMyO3RoYXQm
IzMyO2Rlc2NyaWJlcyYjMzI7dGhlJiMzMjtzdXBwb3J0ZWQmIzMyO2JsZW5kJiMzMjttb2RlDQpp
biYjMzI7Y3VycmVudCYjMzI7cGxhdGZvcm0mIzMyO25vJiMzMjttYXR0ZXImIzMyO2Zvcm1hdCYj
MzI7d291bGQmIzMyO2JlJiMzMjthbnkmIzMyO29uZS4NCg0KVGhpcyYjMzI7c2VudGVuY2UmIzMy
O2lzJiMzMjtkZXNjcmliaW5nJiMzMjttdGtfb3ZsX2ZtdF9jb252ZXJ0KCkmIzMyO3dpbGwmIzMy
O2NoZWNrJiMzMjtpZiYjMzI7dGhlDQpibGVuZF9tb2RlcyYjMzI7aW5jbHVkZWQmIzMyO0JJVChE
Uk1fTU9ERV9CTEVORF9QUkVNVUxUSSkuDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7JiMzMjtNYXJrdXMNCg0K
PC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioq
KioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioq
KioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3Nh
Z2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJv
cHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3Vy
ZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQg
b25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRp
b24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNp
cGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElm
IHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVs
aWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxl
YXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMg
ZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNj
bG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFu
ayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_004_1622516037.1032744859--


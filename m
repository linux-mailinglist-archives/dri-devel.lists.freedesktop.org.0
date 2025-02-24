Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7AFA42119
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEA510E418;
	Mon, 24 Feb 2025 13:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Ari9/ynu";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="LImIbOfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C580E10E051
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 05:31:52 +0000 (UTC)
X-UUID: a5094dbef27011efaae1fd9735fae912-20250224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=4BEuNXMqsiOHcejFkGdbV0pe+5goIDQO6bUKSnu9QhI=; 
 b=Ari9/ynuCufpQ2tluHsQhwbdPNSGvCb2V0RB+Q4oO632P0xa53IUzDlYeisj5zQeZmLvLj0qiXq/As/ersnymP6jGIbMAfTVjXp2Z1G523TN38EEf5hMCDi2PMVxUpOoRvqUjdnh5dtG+1JS0qJdag+xhevMTO1znFbpRycjspg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:61f8cbe7-86e2-4fb4-9178-ec6056b17949, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:a91879a4-5c06-4e72-8298-91cabc9efadf,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a5094dbef27011efaae1fd9735fae912-20250224
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 495754367; Mon, 24 Feb 2025 13:31:49 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 24 Feb 2025 13:31:47 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Mon, 24 Feb 2025 13:31:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcy1/QBia5S57igybGqwRzfVFun+w1D9ye/QUxUj1lH9oU4IpymGljc/Vf//4hhOmQCYC4a8SA15QDX++cv1sq5hlkMmULCEPtQYfLm9wOIL3OfFAuwAi58qhs5bnpnf6YXQecJvpvOIpbubUUdcDp/DrfP+PD8KmjqTaGd4BOE9w767w5vIWJLCgn2FYwK0TeC3Ztigg2PEpIbUIjXxdHbaw8TqaOJXnQROC/HdA/oVjFLKgBeRJSmIJPzpPCYsyh+TmoBq18lw9X2JUGGublrAA94PVoyevQ/u7kwDvpusNjRltuku6Ai6KXhyw8pEm50WbJ1wfbCPBwRN59Txhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y45W03jKSj5dKbw3qHSoM3q2fYHu/VzHlChPw5qleds=;
 b=llKmSWwXjVC4owX2/IYF5HwWm/CZNVIvVqqc+iRhgiT+RV38X6PyyNpF2jwaSgyycVh34+sjI8H21lNn0eRZgqNJ10QDykR0tJz1MiIJhwfuAu0/08IxTfiQIytYm0dvCTwKUbZyATuGFEeJrSHYB8kCyZqcgzr+8o35yXIPzOTKVftas+4chhkqlHjY+jvP62Dqk9cSdwxnvTzU93PU4g1R+8vHS42Bu1pIFz0p4xkA1TmSahsWq/j7qwcqD/QTwHdWtirfOK8M/iJdYvDLsXRxxR0LhYF2M4UjijAhBq3pcubA8Goqaou4OeuZZg42emAVeOH90r7oFZvq6bbXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y45W03jKSj5dKbw3qHSoM3q2fYHu/VzHlChPw5qleds=;
 b=LImIbOfh5ZFuYJILKolCXAcBysn2THaIy6Gwxr7ra5trwD7lzS/Exlw7UWo++bqMS9y1g7I/LfPMTuSSwjzUinXSC+ahcVFytsmkfMihnlJEYq0/ptiYnB67Ftjx4hNB2q4gJuHNfWDBbTvHAJR11KWJUZx8W64avl8lle7KAR4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7742.apcprd03.prod.outlook.com (2603:1096:820:e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 05:31:45 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 05:31:45 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "treapking@chromium.org" <treapking@chromium.org>,
 =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
 <yongqiang.niu@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/mediatek: Fix config_updating flag never false when
 no mbox channel
Thread-Topic: [PATCH] drm/mediatek: Fix config_updating flag never false when
 no mbox channel
Thread-Index: AQHbhnsWG0BWDKW8EUeRuC1fH33kkLNV7dEA
Date: Mon, 24 Feb 2025 05:31:44 +0000
Message-ID: <5255301c4520a625144debb9daacdd62ce7dd2cd.camel@mediatek.com>
References: <20250224051301.3538484-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20250224051301.3538484-1-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7742:EE_
x-ms-office365-filtering-correlation-id: c6df6b9e-ca97-4da7-2fc2-08dd549486d4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RDJVRTdIUzRJZ29TdDJmSnZJOWpXZHl2SHhWcW9nMktVdGNIY0lEdFI3aVZn?=
 =?utf-8?B?N082eG1HODRsaS83NFhMKzY2aE9uVHNaUjdjc3RkZ2EwZlVkSGs4akJpbkNv?=
 =?utf-8?B?NE16Zi8vZjRaNkw3ai9XdmV6WDVBRlFCaXlsMzRNTGF3aDdqb2R5cWg4ejA0?=
 =?utf-8?B?MmNiRXBCOTh4YzZPcktmck1wS0xhWXlsVDVKYmtYMmZ5OWhwK0w4bDFJK3Bi?=
 =?utf-8?B?ZEhKeTRmcmhhWm1ZWGdLN0JVN3M0MUhyMytyT3hBT3ZZeEpEanlTNHlpS3FJ?=
 =?utf-8?B?YXhCYkhKYURsSVA3dHY3cjExQkhObGlOSlRON3VqeVpVbC8wSFhQWTVGSGJI?=
 =?utf-8?B?UytGREFhRUVGemhTamNoYkx2dTRLVzZwOTh2WWNjbzFaVldGSkllVC9GRjh5?=
 =?utf-8?B?RFAvZnBTUERqOGJLVzdIRTZIcGZYSVpRMyt1VjlyUkoxQnpiUUxNb2EzTHNY?=
 =?utf-8?B?T3BPMys3QTFjS3pGZ1pVODBHc1BlWUFLYXhUYTVzYW5JTkxnQkIwMG9sc2lP?=
 =?utf-8?B?eTJ6OEcvenREd0lZdXU1TS9qWDVnYzZyTVQ2WUlKa1VuamNYZDRkMk1rbVEx?=
 =?utf-8?B?Qm5KaG5rbUFSNlp3MWZTWFI0QUUxemZrRTdjRUxHVldMMFMwRC94S3lqVDZt?=
 =?utf-8?B?Z1lGRjRLRVFSZ3JUOGtkRmpTdmhLZjdHaTVNSkUxbjRnbTlNdnM2VHp4eUFW?=
 =?utf-8?B?Zi9IZXRSSEswUEpHOEZ5dDI5Q0lMeWNWUno5NTU5QjdJYXJWSVBSNmN0WWYw?=
 =?utf-8?B?U3pTRS9nZGU1UFB0a1ZoQ3FpOWVCdkkxeXJrRHluNWVRdGYwejNpNTZ4bzBj?=
 =?utf-8?B?MHQ2VngrdGtvNGNEd3BSL05jRllxaENBNXV4alBBZnJ5TDlPcTZhV2Q3NjBV?=
 =?utf-8?B?VXpndG9DRXJ4d0FnaUl3WFNCN29KUVM0d25NOUp4cVlFTS95ejZZbm9QZlhV?=
 =?utf-8?B?TmVLZUJFS25qajlFSmRzUHRqOS94cXA1WnZvOHF6ZWo4aVYzd01ja0c0dFVh?=
 =?utf-8?B?Nnp1dnNZRkhmYStVcnJSS25FK0JGdU9jOXZXd1QyYkJkYVg4OE0wSnNFWEtQ?=
 =?utf-8?B?KzdMbDhrLzRQTnVmN3pVM3FGekQxMDVHWUxlMUp0RUlQWTRNcDJKeU5oejFF?=
 =?utf-8?B?d3gzaElET0lsMlo4U3NhS0lPeXpkdmRpYmhHNTJOc25IMk5zQkVOZHZQQ0JK?=
 =?utf-8?B?Y3AzMmtyWFM4eG9yb2d6WVpDQk1yNUk1cWNxelhiRmg2eDBvemFBUERtRmRQ?=
 =?utf-8?B?OHAxWi81YlBhL0FCdSt4SFNFejVVNnh2aWxTRlIrSDZPTkNCbXM1Y1BGdGhH?=
 =?utf-8?B?bW10a2NpRHlxYStWcmlaMEtzeVNoUmw1TE1CLzZOU09jTzNDV2x3d0t1MEww?=
 =?utf-8?B?QTJXYm1yNEVyUmZtVWZKT09XSEZZUWpGVFNVSjViQ05hSnZZOTM1TzFhVHE4?=
 =?utf-8?B?N1ZnY3pCUER2MzM5UVA0ckRYNlBpQzdWeGtYbmtVMGRjQWFPOGlicnppaUdU?=
 =?utf-8?B?aGU1TlRwam1YYnJvcUlHbW91Rm10MlBwdk9ta2s5Rlcyc2gwWmFqa2o5dzFk?=
 =?utf-8?B?OGc4OE9JbHVrMDVUM0ZMdmNESFQyc0txR00wMXkrNTF1SnBmMVB0WWpncmo5?=
 =?utf-8?B?bkNIdkoraTVCaDBXSE16aDJjNy9aL2Z0U2FMdXo3cUhmd1ZzM2RDcjNvcld0?=
 =?utf-8?B?enEvZmt5cm9meXNub0JNc0Q0dkEvVU9mQ2pwbXhORzd5M28vOWcyTlA1amts?=
 =?utf-8?B?alk3V1lVcFlLcDc0NG1FUDJuM3Q2LzkyZFNLUUFTb0xicUJIQUx3L3B5WXZO?=
 =?utf-8?B?VVpxcTJ1VnBKRDVWMUd2TnhXNXlZQVVidEwzQ2hvQzBEeC8xNWlCeDN6d1ZR?=
 =?utf-8?B?WGk0RngzTndxMHRJSHpTSjFlYXpzVjQ2V2FGclBsT2h2WWdPdTc2Q3psTlFo?=
 =?utf-8?Q?vUswf00+UQ0MnTsxbvDDssbbmC5gu5MF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnVyRys3SkJrY1Q0cUJVK3B6YkFQbUU2aTYzK2FWdVphNHRkT3F3NTdUbkM1?=
 =?utf-8?B?ZXhXVm9BYW5kcHFlWDRSb2Z1N0ZoWmt3UnVXMjZLM1kraGN4YTMzelViQWVD?=
 =?utf-8?B?RkRBamQ0VVlnaldKQmZqMFNmNDdod2xPUXlkWHJPUEw5MnBXVjdTVU5JUm13?=
 =?utf-8?B?V25QYW1iT0xUaGlsWW5RYnNLUXFHZkhoZnZHZFBwK2xjZkxQTlRLT0xud2Na?=
 =?utf-8?B?Z3RVME96RGhKT0xNR1hEOGMyVU4xMTFRbnFlY0hLam5HOWFBUkFtemhhMXNC?=
 =?utf-8?B?L1ltNE0rOG1oWkM4KzBkcnFmU0dHWmc5YXFkcDhPS2hpY2lPaDVCRTNiNWhX?=
 =?utf-8?B?RkpqZXRjaS9heWVwVWVTUVhxY1JUbEs3L3NsM2dlRnhjLzZLb1UwYkdCV0xN?=
 =?utf-8?B?MUdTU2JLSUh6WFZCMC9CTUk1NGI5TjNaNGVib0Y3QzRqOHZ5ODNZckwrTURT?=
 =?utf-8?B?YXY2R0ZoYmdNOWczdE81Q1RIeFNuSExtV1BxNDVBU0VaRkFhTzNtdGNja0tE?=
 =?utf-8?B?YmRiLzdPNHlZRkhFMUd0eVNIK3FXUmpVbDVEQkt2SnlYU3MvVWZ0d2ZWYzI3?=
 =?utf-8?B?Y1BscUk5Qjh6V3RDN1VrdnV4MWtSN2RWcW1JTmlXbi9QdkhzaDhsK29MYVhh?=
 =?utf-8?B?NWI2akpaVWl0SHRwRTdneEZpWmhYTWM3UmdKdGlZL0xzQVNhSld0OHNkR3lp?=
 =?utf-8?B?ckovN0xON2VlK2VQSWV1T2NkRTVFaUY1RUkzTmF4eWZJRkU3RFpPOEFsR0hG?=
 =?utf-8?B?YmdYb1BoYlN5VDBTeHRxOWF3ZnNrVVFsaHBWVGRrUUFaWCtkYy9ndis3dUxW?=
 =?utf-8?B?dGd5TDVvRGJ4ZGpCSkhvTllScUUxeGZQaTYxSnlhTVNMbkFiVUtiaDA5RzVC?=
 =?utf-8?B?MWRoOC9KWUhMOVRHcFZScHA3aVI5VGRGU3dndnBzZTk3Tk9hdVU4YlZRdHdO?=
 =?utf-8?B?ZGZhamk4cUJkakdCNFFmQnMrWTNuTUZRMXI5TTA0TW5JSUVTbUltTk0zcEI5?=
 =?utf-8?B?ckUzUU1KbHNheEdyN094Ky9Dd3p0M3VTdDViKzhyaStoY2M4UDd6Qk9yZGsw?=
 =?utf-8?B?SXRXdTNtZVVpUmFVQlZ0VzhxaXdJbFcxaHM4dTMwb0srQkVSZzdFUDIvYXVF?=
 =?utf-8?B?TkNkU1ZnRWF5emp4cUJ3OE9NWEtUNHZyN3hDeVo0WkFtVVNrUTJUcHJBSW9R?=
 =?utf-8?B?NkVKTERZTmo0L1cxWXBBM2pjRFBzNWJWRUtnM2UvZWo0QmxrMGJJY0ZkOW1F?=
 =?utf-8?B?RmVHWmFQK0NvazBNNC8wK0lGc1k3VzNmRC9WV2NOZWNaYi9qWHkzMnZnbDha?=
 =?utf-8?B?em5VMGFxUy9mbEw4QjRPV21tTHlmZTVYdjJNT1dJWWl4RXNhY2VuUEJNeEdI?=
 =?utf-8?B?dnZwTlN4QTdZUWQ4S3cwTTlML2x3MzNTcGE1SVE4OVJ1OFB2aFZnNnRzVExX?=
 =?utf-8?B?d2wrZXEvZXZ3WFNkZi9HU1RaVEpJVzRuUytPN20xaVZETVNFMVVtNkV2TCtv?=
 =?utf-8?B?NVhEd1EwVWQzclA3aXdDZ2Z4bUtxQmVWbGwxMnZ0TmEvaFdCQ1Q1R2c1YXov?=
 =?utf-8?B?QmhMd3hLcElUUElTNzJTNk1kK3lWWlMramxOc3RKSkNab2t6TjNya3MyWm10?=
 =?utf-8?B?RjBJV0pJMThKMGRXVnFTRm1GUC90OWgzeU9WaWtFTExzZUNnam9mVkhXdWZh?=
 =?utf-8?B?STZGT3pueTNETU0wZnhZRlBBdStsWmtSSllFUlpmV1NFbXdJK0RjaEVicGZo?=
 =?utf-8?B?NFhZU280UEpIZ0hRVVRGWXlHVnNqNVpxN0QzRGY4UnBFaXJWUUtiSEZIcUFj?=
 =?utf-8?B?RjA4SGRzNklQaFowZ0tjTnFtSnB5TFNIc0FueE9UanhLK2RnbE5WV0xlVkhn?=
 =?utf-8?B?UldKYkd4eTJUYnNtRE8xemFIMFlETTYxNmxMZVdJZkVxMXo4akplMlVOb3ZZ?=
 =?utf-8?B?eVBoMGdaYkFPQThZc2dQYXJlei9oN0g4d2dTcmhsYThmSGNBTnAyN2MyUUFJ?=
 =?utf-8?B?eXIxdVJoTE1obThtYkpxNm41MUZXclQrRDF2aThvMmlFMGN5K21iK3gramlL?=
 =?utf-8?B?TUJNYjgybnRXMm5mRmFFMlZ1Z012b0FYS3RPNGJiL0VITHFxa3ZQaVN6eW8z?=
 =?utf-8?Q?Fj6chuEx5qKVYt0g1bau3n+x1?=
Content-ID: <770A20B1982AD8408BE8AE59B297B10C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6df6b9e-ca97-4da7-2fc2-08dd549486d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 05:31:44.9812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GJPx4aJB9qnplFyoX3DM6u/GCYM7YoPz3efavG5Cg+nc36AaDEOyQlVhMEYPGDS+k7jF9dU8cDH4Um+pBOoobQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7742
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1698447057.1946106253"
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

--__=_Part_Boundary_005_1698447057.1946106253
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTAyLTI0IGF0IDEzOjEyICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IFdoZW4gQ09ORklHX01US19DTURRIGlzIGVuYWJsZWQsIGlmIHRoZSBkaXNwbGF5IGlzIGNvbnRy
b2xsZWQgYnkgdGhlIENQVQ0KPiB3aGlsZSBvdGhlciBoYXJkd2FyZSBpcyBjb250cm9sbGVkIGJ5
IHRoZSBHQ0UsIHRoZSBkaXNwbGF5IHdpbGwgZW5jb3VudGVyDQo+IGEgbWJveCByZXF1ZXN0IGNo
YW5uZWwgZmFpbHVyZS4NCj4gSG93ZXZlciwgaXQgd2lsbCBzdGlsbCBlbnRlciB0aGUgQ09ORklH
X01US19DTURRIHN0YXRlbWVudCwgY2F1c2luZyB0aGUNCj4gY29uZmlnX3VwZGF0aW5nIGZsYWcg
dG8gbmV2ZXIgYmUgc2V0IHRvIGZhbHNlLiBBcyBhIHJlc3VsdCwgbm8gcGFnZSBmbGlwDQo+IGV2
ZW50IGlzIHNlbnQgYmFjayB0byB1c2VyIHNwYWNlLCBhbmQgdGhlIHNjcmVlbiBkb2VzIG5vdCB1
cGRhdGUuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0K
PiBGaXhlczogZGEwMzgwMWFkMDhmICgiZHJtL21lZGlhdGVrOiBNb3ZlIG10a19jcnRjX2Zpbmlz
aF9wYWdlX2ZsaXAoKSB0byBkZHBfY21kcV9jYigpIikNCj4gU2lnbmVkLW9mZi1ieTogSmFzb24t
SkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jIHwgNSArKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfY3J0Yy5jDQo+IGluZGV4IDU2NzRmNTcwN2NjYS4uY2ZjNDg2NzI5NmI4IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KPiBAQCAtNjIwLDEzICs2MjAsMTQgQEAgc3Rh
dGljIHZvaWQgbXRrX2NydGNfdXBkYXRlX2NvbmZpZyhzdHJ1Y3QgbXRrX2NydGMgKm10a19jcnRj
LCBib29sIG5lZWRzX3ZibGFuaykNCj4gIA0KPiAgCQltYm94X3NlbmRfbWVzc2FnZShtdGtfY3J0
Yy0+Y21kcV9jbGllbnQuY2hhbiwgY21kcV9oYW5kbGUpOw0KPiAgCQltYm94X2NsaWVudF90eGRv
bmUobXRrX2NydGMtPmNtZHFfY2xpZW50LmNoYW4sIDApOw0KPiArCQlnb3RvIHVwZGF0ZV9jb25m
aWdfb3V0Ow0KPiAgCX0NCj4gLSNlbHNlDQo+ICsjZW5kaWYNCj4gIAlzcGluX2xvY2tfaXJxc2F2
ZSgmbXRrX2NydGMtPmNvbmZpZ19sb2NrLCBmbGFncyk7DQo+ICAJbXRrX2NydGMtPmNvbmZpZ191
cGRhdGluZyA9IGZhbHNlOw0KPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm10a19jcnRjLT5j
b25maWdfbG9jaywgZmxhZ3MpOw0KPiAtI2VuZGlmDQo+ICANCj4gK3VwZGF0ZV9jb25maWdfb3V0
Og0KPiAgCW11dGV4X3VubG9jaygmbXRrX2NydGMtPmh3X2xvY2spOw0KPiAgfQ0KPiAgDQoNCg==

--__=_Part_Boundary_005_1698447057.1946106253
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMDItMjQmIzMyO2F0
JiMzMjsxMzoxMiYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjt3cm90ZToNCiZn
dDsmIzMyO1doZW4mIzMyO0NPTkZJR19NVEtfQ01EUSYjMzI7aXMmIzMyO2VuYWJsZWQsJiMzMjtp
ZiYjMzI7dGhlJiMzMjtkaXNwbGF5JiMzMjtpcyYjMzI7Y29udHJvbGxlZCYjMzI7YnkmIzMyO3Ro
ZSYjMzI7Q1BVDQomZ3Q7JiMzMjt3aGlsZSYjMzI7b3RoZXImIzMyO2hhcmR3YXJlJiMzMjtpcyYj
MzI7Y29udHJvbGxlZCYjMzI7YnkmIzMyO3RoZSYjMzI7R0NFLCYjMzI7dGhlJiMzMjtkaXNwbGF5
JiMzMjt3aWxsJiMzMjtlbmNvdW50ZXINCiZndDsmIzMyO2EmIzMyO21ib3gmIzMyO3JlcXVlc3Qm
IzMyO2NoYW5uZWwmIzMyO2ZhaWx1cmUuDQomZ3Q7JiMzMjtIb3dldmVyLCYjMzI7aXQmIzMyO3dp
bGwmIzMyO3N0aWxsJiMzMjtlbnRlciYjMzI7dGhlJiMzMjtDT05GSUdfTVRLX0NNRFEmIzMyO3N0
YXRlbWVudCwmIzMyO2NhdXNpbmcmIzMyO3RoZQ0KJmd0OyYjMzI7Y29uZmlnX3VwZGF0aW5nJiMz
MjtmbGFnJiMzMjt0byYjMzI7bmV2ZXImIzMyO2JlJiMzMjtzZXQmIzMyO3RvJiMzMjtmYWxzZS4m
IzMyO0FzJiMzMjthJiMzMjtyZXN1bHQsJiMzMjtubyYjMzI7cGFnZSYjMzI7ZmxpcA0KJmd0OyYj
MzI7ZXZlbnQmIzMyO2lzJiMzMjtzZW50JiMzMjtiYWNrJiMzMjt0byYjMzI7dXNlciYjMzI7c3Bh
Y2UsJiMzMjthbmQmIzMyO3RoZSYjMzI7c2NyZWVuJiMzMjtkb2VzJiMzMjtub3QmIzMyO3VwZGF0
ZS4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5j
b20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Rml4ZXM6JiMzMjtkYTAzODAxYWQwOGYmIzMy
OygmcXVvdDtkcm0vbWVkaWF0ZWs6JiMzMjtNb3ZlJiMzMjttdGtfY3J0Y19maW5pc2hfcGFnZV9m
bGlwKCkmIzMyO3RvJiMzMjtkZHBfY21kcV9jYigpJnF1b3Q7KQ0KJmd0OyYjMzI7U2lnbmVkLW9m
Zi1ieTomIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsu
Y29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfY3J0Yy5jJiMzMjt8JiMzMjs1JiMzMjsrKystLQ0KJmd0OyYjMzI7JiMzMjsxJiMz
MjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MyYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzImIzMyO2Rl
bGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2NydGMuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzU2NzRmNTcwN2NjYS4uY2ZjNDg2
NzI5NmI4JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2NydGMuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfY3J0Yy5jDQomZ3Q7JiMzMjtAQCYjMzI7LTYyMCwxMyYjMzI7KzYyMCwxNCYjMzI7
QEAmIzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2NydGNfdXBkYXRlX2NvbmZpZyhzdHJ1Y3Qm
IzMyO210a19jcnRjJiMzMjsqbXRrX2NydGMsJiMzMjtib29sJiMzMjtuZWVkc192YmxhbmspDQom
Z3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjttYm94X3NlbmRfbWVzc2FnZShtdGtfY3J0Yy0m
Z3Q7Y21kcV9jbGllbnQuY2hhbiwmIzMyO2NtZHFfaGFuZGxlKTsNCiZndDsmIzMyOyYjMzI7bWJv
eF9jbGllbnRfdHhkb25lKG10a19jcnRjLSZndDtjbWRxX2NsaWVudC5jaGFuLCYjMzI7MCk7DQom
Z3Q7JiMzMjsrZ290byYjMzI7dXBkYXRlX2NvbmZpZ19vdXQ7DQomZ3Q7JiMzMjsmIzMyO30NCiZn
dDsmIzMyOy0jZWxzZQ0KJmd0OyYjMzI7KyNlbmRpZg0KJmd0OyYjMzI7JiMzMjtzcGluX2xvY2tf
aXJxc2F2ZSgmYW1wO210a19jcnRjLSZndDtjb25maWdfbG9jaywmIzMyO2ZsYWdzKTsNCiZndDsm
IzMyOyYjMzI7bXRrX2NydGMtJmd0O2NvbmZpZ191cGRhdGluZyYjMzI7PSYjMzI7ZmFsc2U7DQom
Z3Q7JiMzMjsmIzMyO3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFtcDttdGtfY3J0Yy0mZ3Q7Y29u
ZmlnX2xvY2ssJiMzMjtmbGFncyk7DQomZ3Q7JiMzMjstI2VuZGlmDQomZ3Q7JiMzMjsmIzMyOw0K
Jmd0OyYjMzI7K3VwZGF0ZV9jb25maWdfb3V0Og0KJmd0OyYjMzI7JiMzMjttdXRleF91bmxvY2so
JmFtcDttdGtfY3J0Yy0mZ3Q7aHdfbG9jayk7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyYj
MzI7DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXst
LT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioq
KioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRp
YWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRp
c2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNv
bnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNz
ZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5n
IG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5k
ZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3
ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWws
IG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9y
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8g
dGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QN
CmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24u
IFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_005_1698447057.1946106253--


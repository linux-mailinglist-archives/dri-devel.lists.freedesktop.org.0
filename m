Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C7A8C9AC5
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 11:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC1510E144;
	Mon, 20 May 2024 09:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="QruHKwPV";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="J8MCBiYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B627E10E144
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 09:54:07 +0000 (UTC)
X-UUID: e1e1bcda168e11efb92737409a0e9459-20240520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=sCelUKyh6wBR4O5Q4YiuDfbQeiFXLdBTWweVJspiPP4=; 
 b=QruHKwPVmv4eqviqc4aaYxaObZRDuAKAtfdhmhJSPaxLHd2g1PzRFuJBQkQ3pRPV4y15WuM+Tsa9akWnGYjf1/s9i9Q6c2U7Vl9b51Vn2vXABuUnHSKwBdUeOhpremXc8ewIauMIyIbYWpY0gILG1+Gm3ak8T6BMOPe5ZBlSkTk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:049ea749-d108-4eb6-b214-ce0cfae286fc, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:5355fa92-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e1e1bcda168e11efb92737409a0e9459-20240520
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1822606998; Mon, 20 May 2024 17:54:00 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 May 2024 17:53:55 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 May 2024 17:53:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPSyMpa8pXlE7tfUD4iZydai3CgyaYoXQ4nvwEK7wlTGw4ZP2HBst+587pK7LBaAlhVg2f0GaNDZ+aHFfJtqY9BugmYz9wDlMN/cnabmR/QyLOYNMSRxp8FE/jAwWgeEPJoLkY+xkuh/X06pB7SBcRlsFdL8nC/lW55HKDcK6rrJQDy80NF6CHd8U7kSk1TB47ilvJQpZqaFp9j7CV4disnjt1TzBhKiL+oMb0FucciuMFr1E36kH5vl43ZNiAwbpS8X3KNPLY3lxEzrIckOssxskyXptQUrQLgncpw3XnRXOtDWoulZ2Uvs1ID1udekNTY1hZcTRJAstV2ikptfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCelUKyh6wBR4O5Q4YiuDfbQeiFXLdBTWweVJspiPP4=;
 b=P/vu/EyYxVCSX7LPrkTjmZLD1ihk6EhCc1yLRLAupWLguNp+gb88WQVTZX1PFapxozbnHDJVZGW6kANnPoakFVZcHmugmorwapaod8h07/YeLUu1cDW37L9GSABOfGiP44WEgAh5DAkbsTjxbfqy2TMztxT/RLEoN4Wt6fwCrxoiazm/4CU/FW5m64KAQQZWdmGRScWzvoMG9c+7JsZHM5bZ+pOigKdvTlyYzMZuKxJIWspUG23l6ke9FamB7WlEiZe21QKfWIIzyJW7pxN4HcgVyy64l0RqG/lVR9NaLvXgpV0mxPAo8rZmusoUuDz5u7c694DKZfBtvvTM0Fdtqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCelUKyh6wBR4O5Q4YiuDfbQeiFXLdBTWweVJspiPP4=;
 b=J8MCBiYBB4Af12bk2vAZ+VsxmMf9QXE3tqFPvId3p4qCRcp05QRSn4pAR4YrdKg3zpHwP/ngvDVR66FEUlMuVoZKRNqyIbOnBCiLr6fLylsM2y4x6jLiWv8qyJ8BW1TU7Yj93b2gp0WLPdPrkKCSq0skfAeI9AijaoqqI/c7DCU=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 TYZPR03MB7954.apcprd03.prod.outlook.com (2603:1096:400:465::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16; Mon, 20 May
 2024 09:53:53 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0%4]) with mapi id 15.20.7611.013; Mon, 20 May 2024
 09:53:53 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jstultz@google.com" <jstultz@google.com>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "quic_vjitta@quicinc.com"
 <quic_vjitta@quicinc.com>, "willy@infradead.org" <willy@infradead.org>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "robin.murphy@arm.com" <robin.murphy@arm.com>, 
 "contact@emersion.fr" <contact@emersion.fr>, "logang@deltatee.com"
 <logang@deltatee.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "jkardatzke@google.com" <jkardatzke@google.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "joakim.bech@linaro.org"
 <joakim.bech@linaro.org>, "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, =?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?=
 <youlin.pei@mediatek.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Thread-Topic: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Thread-Index: AQHaprp4GpnKuiAAR0GKSJ5cgg3gt7GZogmAgAZHvwA=
Date: Mon, 20 May 2024 09:53:53 +0000
Message-ID: <8dc83d5f7eb6c1127b320e23fa0c4c909abd700d.camel@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
 <a1d91cee-e2e4-4310-a9b4-984626144ab2@collabora.com>
In-Reply-To: <a1d91cee-e2e4-4310-a9b4-984626144ab2@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|TYZPR03MB7954:EE_
x-ms-office365-filtering-correlation-id: 642aff7a-a432-487f-715a-08dc78b2c223
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|7416005|376005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?ekZESG1ramRLcU05VXRXaEZQZ3pJTy9NS0RKY3RPeENkZkhQenpVdGdDS1U5?=
 =?utf-8?B?bUFCT3E5Q2owTnV1LzViQ2lZTHNoeGpLekIrODc3NjhveitOQTNUSWZCNEtD?=
 =?utf-8?B?eWFuaGVWOWpJZHFjaVRLdEdUamxTOEpDbG5UYmRTRkRBNnlGdHo2aDVXZEtt?=
 =?utf-8?B?ay9RK0Y3M0dmUUQ5L3BIN3pMOVdDTVlTbUV3Y0pFN0ZCNCtFRHZVNGd4dHNP?=
 =?utf-8?B?bnhvZk0ybFBHM0NndVo1Q2FzNTFOL3VheGI0Wi92SzFsY1c2c3VtakNJR0Fr?=
 =?utf-8?B?bDFsUndRZ2V2VjBPQ09pZzMzMFU2KzR5RUo3eGZKVmU5V3VMM1hlWnJ6azMy?=
 =?utf-8?B?Q1Y3M3VuN000ZVRHR2NCK0FSYU1oWnF2Q2V1UTJqMWJlWENVUTRMMURMVmFm?=
 =?utf-8?B?ak55SHM4eUZaVVRodjdRRVlJS3BLVTZrR2YxUzBaYUEwQ0Urc1JQNHVHUllT?=
 =?utf-8?B?ekdjem95ZVU5d2VDWjRxeWh0VTdPQ1F5dDBNcENORFVFakRCMjJqZ25OUGRn?=
 =?utf-8?B?dFVjWFFWcjdNUGJSVHkxc0ltRDRjZEpIQkY5T1E5V2Fyd3RNUUIrdlVlS0FY?=
 =?utf-8?B?eTJpdVdibC9GZzgzR3VaQUlTNUJHbk9ZNk90V1lTN0tldkorVHgxMlV6Y0p5?=
 =?utf-8?B?cGlSRzRlQkZWT0VDdFRuWGVnVk1WQkZ0LzFWdk8yMW41N1NROEdHTEFnZGZV?=
 =?utf-8?B?ejFVaEtIclZKSjJkb1cvSjVqTWVBdEI5dHYwTVNCUW1YZWlVbnVQc2NkSGFi?=
 =?utf-8?B?ZlR4UHBrRFBBa1hEUWRnaXluak1FRGhYRWQzTjQ1alRSVlFGa0FVd2V6blY2?=
 =?utf-8?B?TVBTTmdBMERqTVdWSTdPZlNWdklvdCtILzMza2NKNDBpLzdTcW9iMTZPVlJu?=
 =?utf-8?B?RFJSWDhEalZhaFFtL1R6RDgyZVlJVDVaKzRYS1NoRzEzMWY5MW9IajJHZTFo?=
 =?utf-8?B?b1FqYjMxbi9yZXN0akRZNktuQ09KVlhzaWNVaVBWdnlDWFYvNFh0N3N1dnVF?=
 =?utf-8?B?K05CbGNKK1V6cnFUTmxxRGFQeEJwcXZlK1lzQ0pLN2d5U0R5ejBlMXZHT1hy?=
 =?utf-8?B?dENVczVPaEpQQlBIK3N0WXhvM1pPZ3FsTEVLL09HYlZDUnZpdzlsaUEyTHBz?=
 =?utf-8?B?cEZDTytEZGhHNlRwbnRDYnBOdTRRU0ZUNGFOdGF6dXl4WVdMRC8yKzJNSjEw?=
 =?utf-8?B?T1I5U0ROU05TQ05YNURicUFFOWRJdEdsVi93T2lQYUZBa1hzSWZFQW0rY0h5?=
 =?utf-8?B?ZXZqK0xweEQvOGcxVDhnSDhuVDV1YjZRKzNFVmc0ekVBN1RxV3VlbStqWit1?=
 =?utf-8?B?dnJKNU0wMkR4V0F4cW8vUEkzcGJrNjRtZTlXNW45L1puZFpUcmpNMnJlb0g3?=
 =?utf-8?B?dEFSTCt6WkxmdG9ZVUg3L1NaVVo2K05QMHZTc2F0TkMyajZDdnRpbjlSZ2Fs?=
 =?utf-8?B?OXpBWFRCWDI0SWJXTlpDMnFWTTBaQWlNTTRZMVhVS2pndktraWFsTEIweXUr?=
 =?utf-8?B?cG9lcUpyMWhJOCtpQVRSSFVScHFrOXdhRElQc0hlSUszZ1VIV0p2Tk5BU0o2?=
 =?utf-8?B?UkR4NXdoQ012Qy8vQm9oQnhFVW9mczJrRHJZcUx1bkc5WmpDZWNLZGVhaHJW?=
 =?utf-8?B?YlFyRjF2OE5jd2FCYm5wMlZZS0dKRHZEN0VwWEc0eDVYR0NFUU5nMEwyM2dx?=
 =?utf-8?B?dEVRbStiZm9HN1ZxMjNjc2h0VmJnOWFWbk5jL1NPaDZURCtIRzBsRnpMeDZv?=
 =?utf-8?B?UGc5Q1NmcG9xYWVVUmcxTmVOeEsxUWEwVUkrSERSaGRnSlJCV0ZYOTFuamhv?=
 =?utf-8?B?SzVCOVNLRHNDb1JiNWZyZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0JHaUpNSHAyMGFQZnh2ZEh4Y3d3RnFJSGhDd1ZiZEhETXNmYm81Yk1jcU5n?=
 =?utf-8?B?ajJ1VzRTM1FKZnlRNDV1VWNpdnBXczNieWVRZU9QMkFTc3pLNzFDeVFqQnNo?=
 =?utf-8?B?aGpKMktRR1NhNFg2L3Y0V0ZJWUZnTXA5eWJVOHdBWFVHTWw3YVJVSjFRb3dj?=
 =?utf-8?B?UnBsQ3NqSkdLSmFBbmJuNTViaHVrU2xrTVAwQVdWaEZrVkRXNnlia2lyOWJ5?=
 =?utf-8?B?UVFuYVhRd1pwLzVnendnZTYrZGRURDAwamc4NGM1cGJiMi9odnEwak85VEw4?=
 =?utf-8?B?RFVwV0l4Mk53bWoxaHlaK3lNWW16anlBTzl0NDBkTklCM1dqZDZLZlNwVlZ6?=
 =?utf-8?B?ckV6OW80M1l4TXp4TVVuTU1ORHBtQ284aEdyK1RLUHlqUTN0SGtLRGcvajRE?=
 =?utf-8?B?cnEvM1pSRDJ1SE5mVTkyL0UyZk1KZkprRGVKNXVjVEVWOVpSdVZDWkFQRXpr?=
 =?utf-8?B?ZHlUUDBmNEdISVJKakR4eUwyY3ZGTVVOTiszdEJiNkppNzFEUHREOVV4bXRr?=
 =?utf-8?B?dXRjcFE1MkRnc1RwVC9MRVEybjFkRnhsK2lYWWxsd2M1OE5zK2dhazQvRjJC?=
 =?utf-8?B?NzJuc214SGIvUko2cis5aEdtM2Eza1M2eGs4dGNXN2x6ejRKNmVCUXFuaDFV?=
 =?utf-8?B?dDJBdDNyb1UyRVVlVVMvWlMyemlQSm5MVjNwdkxudktYcUZzd2hhRUdtSllO?=
 =?utf-8?B?SmNWVHkrOXJHUXJLSXJFNXlXcHNzbkgrWmI3T1kxc296WkRZNUl6ZnNGbWY0?=
 =?utf-8?B?TEhQc3RCcFJKS0lZUmNCVFR2alNnQ280eDZBS0swTXgxMHNpdnZEUml4aTlp?=
 =?utf-8?B?TkFBeDRrUHJ2Tml5a092a3duTGQ5SGVVaVo0YXFPWHFNQU0xY2JkN2luU2VY?=
 =?utf-8?B?TEJMbkZoQkRsOVRiYXliLyt6TW1RNHk0MGJ3eHN3WEpXalBFQktPY1lRSlpa?=
 =?utf-8?B?NXNpazVFVFpiVkZBSld1VFZrNldCZHdTdXdBbStoWVZWdjlLcW1LZWZRR0Zs?=
 =?utf-8?B?VW4zRkRnWWNwRmJxazZkdE02T3pVY282QmpiQjNra2JEYWVQUEpwZyt2SlVj?=
 =?utf-8?B?UTJxc0VHK0hNTm9FeVJhc3ZpTW1UWERGY09RVG01SU5tL3pYUlkwbWpRVmQ5?=
 =?utf-8?B?MlZHSGtyQm5qK0hLN2FYaWFoMXVQZVRyUlBnT1RLUnhtWVVVbXdEVkZQQnlI?=
 =?utf-8?B?WkdLWjJyRmtiY1BRNFFPQWxXalZJS3FPdFBNbUIzcUhwMjN5S1V3SFlqTGxO?=
 =?utf-8?B?Nm42VnU2bFRYRHl4WlVNQlk1cnNSanRzOGZIdXFzaC9KZUU3blZ1VmNBOUV5?=
 =?utf-8?B?Q21WZXlud3IxR2tUR1YzMXVBbmJiK1E0UnNjbW5sTmV6NG5idUdEZnRKMHVP?=
 =?utf-8?B?WXVueWR2eVVXajBXbVltVkM0YnUxZmpoMUYyeWRST2NIVHY5ZndGUmZVcGRm?=
 =?utf-8?B?WkdhZkgyOGRXMUtjcHl4VjlrVGxQc0R4bFcxUFVUOE50MTM3VnFaR2tMRzR4?=
 =?utf-8?B?VytyaUFlR0k5UXRGbXpGemVmaVFzb0Mra0hBV2cvQUJETlN6Y0x6cEg0dWsr?=
 =?utf-8?B?akVRVFRmT2xaMERXcFYvQXAzOS9mOWlVNHJjSUxEbk9uVEZUYlBMVWFrSkN3?=
 =?utf-8?B?YU03UDJMNmtGcERWUksxbHM4d05FZ3dWdE5HUSt2QXJUMmt0SHFRTVlQazhw?=
 =?utf-8?B?OWtNaXZySWMzNVVJK3JjMGZiRnd4Yy9VbzRpajBlWnpSTjJYWEgzQk8vN2dj?=
 =?utf-8?B?RHVNeWg0cys4eUN6bndBUEpMTDFPelRUb2pQUVhaemZEaWZkZkF5cHVNck1a?=
 =?utf-8?B?Skw0cytNVFQ1ZXFjc1NXMjcrd0gwenRNejg1NWdPM2lCaWh2dEc1UENNWk5D?=
 =?utf-8?B?VGhYYmsvRW42L0tFT1c0Z0YwcEJMalpXQ2orcURTS1UycTI4dm5YOEdWV0FY?=
 =?utf-8?B?V2ZYMnVmSkhZWXpjdW01ekEzUVY0VjBRZVl1d0k0WDNmWEZKdE1PakoxT000?=
 =?utf-8?B?c3pUVFpnSjI0b0FiOFJQUDdKY0s1VVZ1a2dIYmphZngwYUR1WDZZdzBnd0dX?=
 =?utf-8?B?cEs4dHdtNDdBQk11VEM1NWNFekI5NU41cDNPZDg0NVI2amtCdnd6UTBNbWFT?=
 =?utf-8?B?bDc3aWpXUVFoekVPRjlCcEFoVHMzUEQ1SDk3MkM1VDNWaGVUWW5pOEdXVjdT?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23BDB1FE0782DD43A71B0AF4A852ED9C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642aff7a-a432-487f-715a-08dc78b2c223
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2024 09:53:53.5847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XEI0/TrQvHLByRisw0owgM+rHkZ/C5uRUJjb+KMWFWy5wPMinRAzG3TN5/8cb7d93VY16O6DmOsyZTNX03zwqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7954
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.850500-8.000000
X-TMASE-MatchedRID: h20DFeLkM8/UL3YCMmnG4kD6z8N1m1ALjLOy13Cgb49qSjxROy+AU2yd
 bY7xfgXY6sXZNj31W+8TpKsAqp00eXAvdl/gU+kWsyNb+yeIRAqFXSyuOiq3HyJ8zskw0dbrmnE
 k8Dlkh75OFu8ssjxG80IozxQvujgLDHlMveoJOATmAId+2bAQwrfoYZ/CMuhlmyiLZetSf8n5kv
 mj69FXvEl4W8WVUOR/joczmuoPCq1KpHWt+/tSJcE/31g5aLIucxruO6E8TL1BW8hw/W1SFN6f/
 AQwxw/ZQwymtxuJ6y0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.850500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7BA43EADDFEB26955ED12F75ADCDF8CB75B3225DDAFDFC34505184BEB3E86BC22000:8
X-MTK: N
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

T24gVGh1LCAyMDI0LTA1LTE2IGF0IDExOjU5ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTUvMDUvMjQgMTM6MjMsIFlvbmcgV3UgaGEgc2NyaXR0bzoNCj4g
PiBJbnRyb2R1Y2UgYSBGTEFHIGZvciB0aGUgcmVzdHJpY3RlZCBtZW1vcnkgd2hpY2ggbWVhbnMg
dGhlIG1lbW9yeQ0KPiA+IGlzDQo+ID4gcHJvdGVjdGVkIGJ5IFRFRSBvciBoeXBlcnZpc29yLCB0
aGVuIGl0J3MgaW5hY2Nlc3NpYWJsZSBmb3Iga2VybmVsLg0KPiA+IA0KPiA+IEN1cnJlbnRseSB3
ZSBkb24ndCB1c2Ugc2dfZG1hX3VubWFya19yZXN0cmljdGVkLCB0aHVzIHRoaXMNCj4gPiBpbnRl
cmZhY2UNCj4gPiBoYXMgbm90IGJlZW4gYWRkZWQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
WW9uZyBXdSA8eW9uZy53dUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gICBpbmNsdWRlL2xp
bnV4L3NjYXR0ZXJsaXN0LmggfCAzNA0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc2NhdHRlcmxpc3QuaA0KPiA+IGIvaW5jbHVkZS9s
aW51eC9zY2F0dGVybGlzdC5oDQo+ID4gaW5kZXggNzdkZjNkN2IxOGE2Li5hNmFkOTAxOGVjYTAg
MTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9zY2F0dGVybGlzdC5oDQo+ID4gKysrIGIv
aW5jbHVkZS9saW51eC9zY2F0dGVybGlzdC5oDQo+ID4gQEAgLTI4Miw2ICsyODIsNyBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgc2dfdW5tYXJrX2VuZChzdHJ1Y3QNCj4gPiBzY2F0dGVybGlzdCAqc2cp
DQo+ID4gICANCj4gPiAgICNkZWZpbmUgU0dfRE1BX0JVU19BRERSRVNTCSgxIDw8IDApDQo+ID4g
ICAjZGVmaW5lIFNHX0RNQV9TV0lPVExCCQkoMSA8PCAxKQ0KPiA+ICsjZGVmaW5lIFNHX0RNQV9S
RVNUUklDVEVECSgyIDw8IDEpDQo+IA0KPiBJIHRoaW5rIHlvdSB3YW50ZWQgdG8gd3JpdGUgKDEg
PDwgMikgaGVyZSA6LSkNCg0KQXBwYXJlbnRseSwgeW91IGFyZSByaWdodDopDQoNClRoYW5rcy4N
Cg0KPiANCj4gQ2hlZXJzLA0KPiBBbmdlbG8NCg==

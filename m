Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04999B241D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 06:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3625910E334;
	Mon, 28 Oct 2024 05:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="USJSvg5f";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="inny4BeE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AF310E334
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 05:25:54 +0000 (UTC)
X-UUID: 177ad7f094ed11efbd192953cf12861f-20241028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=KJKxDjGMKQDyer8ZFQeFESdLk9jdqVTvfCSzSWbCnjw=; 
 b=USJSvg5fDE3SGo3wIaxKjmHoHrjPFp77Sy0WGGLNHWTTUOCIN2rFsxkiCbQlwjmr4Xk6XgLrCDHPvFJaAWxY2M/Qfjh73pUUgtnZcDwbhHwvwS63EKG6O1FfOTh2HpckxbmjxGaXb70UGDqkq55xFpYMfTbhSjxYXf4lnvd8aWM=;
X-CID-CACHE: Type:Local,Time:202410281320+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:16d739f4-71e7-4b45-98e2-8a227fb7be9e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:9850342e-a7a0-4b06-8464-80be82133975,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 177ad7f094ed11efbd192953cf12861f-20241028
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 537191637; Mon, 28 Oct 2024 13:25:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Oct 2024 13:25:48 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 28 Oct 2024 13:25:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C85UJZGHccUbAvOuJUFnd05YY+hVEXvAbmS42uABxnM4eEhoC4JPOO/MDuVsqukufa2Ioie+rljqU7RkN5fDhM8ihrZUlE3usm90Vx0Q6SUACswWSLP4k0zordFIQSGB8bSCpkV/hOm/A42u+GtBUZRtTjp3yHdoT+AQPXyjGfdXq9+xtW93UmJUbn5m5Lb/U2EO29zYErdX/UEPzMN+mRA44O5sCbCrCXftVpzk3NDghBh5gAv9nGny5qZb66nWR5yi5kRHv5+yQOzuAOJkKc1ELElPmfaql6VzcG4qkoh+Nj62qNjIKH7HkqxPLzRjmEIqCPUOJc5YYqueWNdFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTr10uYgFguXGzgawNSgAycW0bOcEzhzqKqPImrOmXo=;
 b=u52L+/VZG+EYuyJ4ABpLhaBrEzsB58ax4F4A2mX+jOxc7naf0/KUH5A7DqXZgxGf0US7Xh/ara3un2I1Wqtxoip9//NybQPRYSnaXCGr2hsKyLUWhgupYqt6tJzAzaVszmKTJrtfPaoZeRv+0Q129l+tZtzq5Q7KfEz57PCW6nMwNZcdj0DtFhg69zQyRW1jvWbUCnUMZzqfKOfGNYDGABsN6ZBCrvLZvX1goR6yS4A4PI+Hd4rkB3JJJomfpmhZuJfT6JhiQ5rt075m/8mGpLkwKkAt1QhJ8V9+N/AFGEago5IrxgOj//EClRjaRpnNLxaH1v9GZCi6WJvNfflAhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTr10uYgFguXGzgawNSgAycW0bOcEzhzqKqPImrOmXo=;
 b=inny4BeEi61/Zq0RZg93Dwa11J1lsrlG1ninpVcz1rmFZWAjgniLdjwFRpOBvK+5xHdJjuf2uLkepT4YsP8Q5/kWZH/iRKji+LKD3/4Xo/Z9jnSp3DSe9SxZjssLQKy4ooxT6bSINeUEo22TFHr9AS/17j7CmreDRug/G7R4M3c=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8158.apcprd03.prod.outlook.com (2603:1096:400:471::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 05:25:43 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 05:25:43 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
 <Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
 <hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
 <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 08/10] media: platform: mediatek: add isp_7x state ctrl
Thread-Topic: [PATCH v1 08/10] media: platform: mediatek: add isp_7x state ctrl
Thread-Index: AQHbGj2y1UKRq3h+wU6S0U6tpTQ9lbKbvcmAgAABZoA=
Date: Mon, 28 Oct 2024 05:25:43 +0000
Message-ID: <6ebd023637e80bf24662975b61cd37077a251797.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-9-Shu-hsiang.Yang@mediatek.com>
 <1e6d50edc8c14313cdf2bd1b9d33e94e88ed2770.camel@mediatek.com>
In-Reply-To: <1e6d50edc8c14313cdf2bd1b9d33e94e88ed2770.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8158:EE_
x-ms-office365-filtering-correlation-id: 3fb61f1d-d3f0-4dcf-d01d-08dcf710f836
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eWhEMnZJRlZmZDZXR1dlMmVQSWNPSHdIK2dEN3NrQ0tkZjVLaS9xVUdJeW9G?=
 =?utf-8?B?ZGZnalBEYVFHSGRYellEV0VEeUsrVG1lVDBLVFhNcGJRcFBZM2JsbFBtQ2x5?=
 =?utf-8?B?L1c3aDNWUGZnV3FFUTIvVENrWEMyNXVRVnRIK2R6NEVGNmc2WjdPZmZKSlVK?=
 =?utf-8?B?YXREQWRWbUY5Tk42MkNFdDh2TS93ZkZ6TFBUelMzVkV6TTVEdHRpaHVIMHpZ?=
 =?utf-8?B?RUNIUEs1WGNFdG5xa1UyU2QweThaY2hoVDg1YWk0UEZuV0dnalJwVGNuYWRw?=
 =?utf-8?B?TFVuSWNxcElmdjlVNk1OeUJ1TnpPbzdEdURwMFExYzQ0bFZsTWh1TkVvcFZ1?=
 =?utf-8?B?WkhDUUhwcmxtR1BnNWtTYVdOR1FXbTJsblVybFQ3K0tIS0RGS2JvQ2NLdEtm?=
 =?utf-8?B?elpxeCtIbCtLN0IwTmpId0ZiMStmc2k2RCtxcTNXWldYdWtPazEvRFVlTUxG?=
 =?utf-8?B?Q2dTK056VCtsQldZTVlaUmZERVd3MVFIb1h5SjhEczQ5S1Y5Sy9Nek8vRFFJ?=
 =?utf-8?B?YkpOMUpRWlJZVi8rUDZ3VDBWcnc3R2dFZ1NhWlpVQ3NjNXgwbisycFBtN1NE?=
 =?utf-8?B?RzkyRmtXZkl3Z3dTeFJudnZjaGg1LzRiWVoxR3d5Z2xJUEM4QUtUbjdrcVJl?=
 =?utf-8?B?N1lQdm5vc3VWNzhuSkRHUU05WE5EVFB5dWdEanJnOUJrdlRRaW1DQlJXOGtB?=
 =?utf-8?B?ZGgwdnJnVm4zOUtYUWprQlkrYklLbS81WmlONDNsVkVJVU9ERjk2UHVnelcx?=
 =?utf-8?B?UnFrZ0hFMXBKYmZqRUJsUlJDdWxTZ2xpTHF0MnZJYzgwSTJNMkFPLzkvV2tR?=
 =?utf-8?B?dXNIdm16TitwVFgwQ3FnNXhkODVNNU9SNGd6bmtEUDQzaFBTeGxjd091QTVx?=
 =?utf-8?B?ZENJSHVRdjZkK1BPcjhHQUZERkFKaW85VUpPVFJvNVhrTWt6c28vTUlhaWpx?=
 =?utf-8?B?RXpqQ3VSTVRtaks5V0RTZ2hSYko2M0x2N3ZySFBtZ2NZcyt3S2VnMGFINWRR?=
 =?utf-8?B?dUEvbUp5am9UdUdpZnRrME9URUE2cnVWQlk5bHF2N0VIWUV3Z2M0MHlXb0do?=
 =?utf-8?B?cHJnK1NEaExCaytPTWhpZEgxRmFNTVVuWW03OXVra0pteEJiYkZTREpSZk0y?=
 =?utf-8?B?QzdmTGM2L0VBUVBEczF4TFVjMFIvZ0Q1eXIyUmlNYkZPRUxQbHRFRTBEdTZh?=
 =?utf-8?B?dlVUd2tJSkoySHVWbXBRaEFwYkl6SzdFMU1iU3NoNkIrd2s0NFlRU2Q1Q1Bn?=
 =?utf-8?B?N0hPc05pZjBZWlM0RDUzbFNqMzRGc1dPcTdWeUZSVVFtZFFaSlE0YmNpMnBm?=
 =?utf-8?B?aUwySzBPMUsreWVLSFYrZjVrazlrNWVVMU1sMlp1YzB0NUdNSU9hbU9Tb1hB?=
 =?utf-8?B?OS9GUjliTEdNcHFIRVdCMll6eFVPSUZpYkYyWm9Jb2hzQ2dodlpoWm1NeFpw?=
 =?utf-8?B?Q2xwNXFOd1VEYzhvVWxROTc5eS9UeHdWSDBrNzNMNVI2MUxBTGdMeUxIamJH?=
 =?utf-8?B?bUx4eFhka1RMSkhZUkNidERwQkU1Q0R0VUNCUkc5alNBRURvcVA1RmYxUlYw?=
 =?utf-8?B?VEp3N3lHd2M2bWw0VEwzSkpLaVl4MG9MZzE1QW1EallKNnBTb09kSjh3YlZn?=
 =?utf-8?B?NDBydmtqRUxPYVUvYm9yUUhDUlNYeURRNk8weG9qTlFvTFFCUlRKUEEwTXZX?=
 =?utf-8?B?ZkFld1pTc05uNllWWjV0Z0JmMndtb3dQSzdwWmpkUmdkbGtNRHVmeVFDa212?=
 =?utf-8?B?NHcrbmh2SXdycVRYdHpRSjlYSGJHSkUvV2JWUVJuN0w4U0l6d1MxQ1dtcEZR?=
 =?utf-8?Q?0ft1jRZ4gRO9UAmSaw+VQnb8I+nuTh7B55knY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2Z0VU81SzREZjIzKytwbjhvRnUyNFdvNnJCT0V1aG1OZWUzVzNNTnBmYkds?=
 =?utf-8?B?NnREajk0eXJaSU1jYzFOY24vV2JlYkl2TGRGbk5UdnQ4MURNbkhQMFhPbDRB?=
 =?utf-8?B?OFBMTVdhbUFSWEU4UW43d0dsZXdEa2s0MnY4eHhmTFM4RXF1UDhONlJvTTRw?=
 =?utf-8?B?L3lJcm9XbDBEQ0lKd1BTcm01YjhTU05Xdjk4c3VZMm9yRGFyNVJSOWFBWHcx?=
 =?utf-8?B?dnFGQllrbldUREpMTFlVTjdrNnRjSWp2ODdwMHkyTFQwZ1hyQnU1UkltTjhB?=
 =?utf-8?B?eWU0OXJlZTczWTR1UjFEdU5MeGNxVU9sc0l4Sm0yRE5ZM0NhZVV1eGpZZVc2?=
 =?utf-8?B?UnhsSUlLK1c4dUxoZGpVRDhtcFJuWjVxSk9ubEoveE1zeUpNUE5xcW9JaDR6?=
 =?utf-8?B?SjdxM3FwbXFvNjlNMngvTlV4Y0d4Q0x0Q1dMdHBNcUh1SDNGbHFrZWRwSXgy?=
 =?utf-8?B?cjlrTnBUUmhPQm83a2ZKZW0xNThablpwT1cvZXg4Y0UyaHFnZ0JzSHJtT0ZZ?=
 =?utf-8?B?eDZJR1RqVkJMZ0NybEFIeittZ0MwZENPakNEV1l3TU5kbGN6VEFlTXcyWkdI?=
 =?utf-8?B?TG1EUlZWN2x6QWdqYmE3a3pzVkVzcFBRUThaVG1jZkdnNGhDRS9wODQ2SERK?=
 =?utf-8?B?Zkl6VDBoRDBBa1JkVVpNckQrLzkyV2NmR3AreGladjZmcTNlOUJwT3E2WEdm?=
 =?utf-8?B?dG9NOVpacVNQcXFwWjdwVEx2LzVIVHAwV3FuTmlsUXZaSjdlNWJoMnhwTGls?=
 =?utf-8?B?T2Q0a1lEM1ZLUGgzblg0Q1hMNWlhOHVrTm9PdndnR0VlR0VhK0NhdFNOMXo5?=
 =?utf-8?B?azVGZk5ObHpyNStWNVMvUTdncGZnNk5KdldlUHZkUVVvV25PT3JNTGpxSXNo?=
 =?utf-8?B?UzJoeGJveGxIMjFvd2JMUUdLT2RGSjNmdzlyRGthNXV1dXFvY0NraklQUklF?=
 =?utf-8?B?cG1XdGtyKzlJblZoMldJSFlxdlF2dWFzNlVRZGVNRWhlcklCbnQvdXdKS21O?=
 =?utf-8?B?SVpqYnNtK3F5L2dKZTZPYklxSmhFRmIydVh1QU53c05iV28xK0ZtM1kyNjJp?=
 =?utf-8?B?cGhFZi9seitybWZoVkQyNXEvbFJzNEVwNHRqdXZ3bm5qMm5pNWJuQ0xGdTdi?=
 =?utf-8?B?Z1ZNbEZYVDV5UlR6Z2syaXZCdzdpRkVDQ3pCeS9lZzdQK2w5RDR2SWVGRmJZ?=
 =?utf-8?B?Tlo5Q1lHWjQzUmg0S28wVTBKaXF0U3NrN1RjK09iaHZyY3Z5SGhFKzRuYU03?=
 =?utf-8?B?dk9ZMG5pU2N4QzBsMGtuZ2c5enZacnRVY3J1RkZoT0xKK2txdEl4S2lIQklV?=
 =?utf-8?B?dmQydWFwVHZseDJpRzJqNjdHcUtUUlM3WTJJN2ZYemNNRHZUU3lWck95amhz?=
 =?utf-8?B?cjZhQ1J6aUV0YzZ4eWNneTNrZCtVRk4za0t3NmV3SnI4MmpXQ0FNamxJbys2?=
 =?utf-8?B?ZHUralgyQkxCUnFhak9wcEtkaDB2T1VyODFtZzRxWmNCQmQvQzlmV2JWdjlO?=
 =?utf-8?B?UnFMeTlEZytZZzh3VnpaaS9hSUFQN3FFRC9qVDBSZlo5QjZ4ZVJkSll5ZDFl?=
 =?utf-8?B?T3h0ZWZTVHhVQm9Ubmo1OXQ3RFQ2SGYvRmlKcjVhMjBiTUdCUWRVTzNJWlhJ?=
 =?utf-8?B?anBJKzdaUGhkeHhVNTJ0MHhnMC9CajdzV3BISFF4RVlNUGpMT0FrSWJpNXlU?=
 =?utf-8?B?WkVuZjYwOC9USzJJWmZ3eGhnQXRFOEI2eTRHakx6dnc5TncxRlFRT0Fua2hL?=
 =?utf-8?B?MlZmbU16K1h3VUFOL2tDYjNZRlBsaVlhWmxMZ0hQWklycGVKYjVuYmhvTjRC?=
 =?utf-8?B?NTl0VFFCdWFFeG83USt1UUdvRmpTdDVxTHNSU2NtRXFJZ1FpSzVMSm1FYTBO?=
 =?utf-8?B?WmE0NmVvR2JJSEhqSVUrNFkxdE9mZkZiNE1IYlRKN3VMcWE4MVR2bGNtNkhT?=
 =?utf-8?B?MDRUbm96U2sweFdQZTZwSFNNZjJRRnUwUldHUS9NOEdTWW5yR0ZQUWl2dmd2?=
 =?utf-8?B?SlJwdld1UkUxMDY4SEora1FNeTFVMkc5eFFpLy84Y0owTlNFSitubzJ5TG5o?=
 =?utf-8?B?TGU2ZUpNZmJmNU1zUkRJdHBCMlJxYVZVZnRyMEhYMDR6b0Nhb3ZQR29Ha3Qw?=
 =?utf-8?B?WXZmVllvM3NYcWtrVHVoUmR6MGgwcW8xT1pzdEU2Y0JPVEc4QXAzV0ZlenA3?=
 =?utf-8?B?VEE9PQ==?=
Content-ID: <234C7C009C4B15429E900B8DD53FED2F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb61f1d-d3f0-4dcf-d01d-08dcf710f836
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 05:25:43.5445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bUDJ3S7t9GeeiJAyLTbq24ZGCGAO0L6BhKACrqL83oZYvTNIO4q9+IUOiDxhYO8C88amqF1ZSnlqaRmcDzhDuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8158
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.736200-8.000000
X-TMASE-MatchedRID: 7ySqCuYCpfj4OiVTWoD8RCa1MaKuob8PC/ExpXrHizyX0aNVfPpyq/Ax
 2yQOAW2940NH+QBQ1HKMyv4sRvPuVBFetKpHyMm5z5rIW0RbS5gc5VtPyiEZ4XvsbfoZixUTVSd
 AA6mVeIbMAS+aj7ouPI3/d0NuPcI1QkfxbJAyTm6eAiCmPx4NwMFrpUbb72MU1kTfEkyaZdz6C0
 ePs7A07QKmARN5PTKc
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.736200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 03373147F6518987C2EA55CFAEAD4A4B82C312F1B8ACB3EF836462776FDE56292000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_681201754.1951275999"
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

--__=_Part_Boundary_007_681201754.1951275999
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI0LTEwLTI4IGF0IDEzOjIwICswODAwLCBDSyBIdSB3cm90ZToNCj4gSGksIFNo
dS1oc2lhbmc6DQo+IA0KPiBPbiBXZWQsIDIwMjQtMTAtMDkgYXQgMTk6MTUgKzA4MDAsIFNodS1o
c2lhbmcgWWFuZyB3cm90ZToNCj4gPiBJbnRyb2R1Y2VzIHN0YXRlIG1hbmFnZW1lbnQgYW5kIGRl
YnVnZ2luZyBtZWNoYW5pc21zIGZvciB0aGUgTWVkaWFUZWsNCj4gPiBJU1A3LnggY2Ftc3lzIHBs
YXRmb3JtLiBTdGF0ZSBtYW5hZ2VtZW50IGVzdGFibGlzaGVzIGNvbnRyb2wgb3ZlciBJU1ANCj4g
PiBvcGVyYXRpb25zIGFuZCBldmVudHMsIGRlZmluaW5nIGRpc3RpbmN0IHN0YXRlcyBmb3IgcmVx
dWVzdCBoYW5kbGluZywNCj4gPiBzZW5zb3IgY29udHJvbCwgYW5kIGZyYW1lIHN5bmNocm9uaXph
dGlvbiwgZW5zdXJpbmcgZXZlbnQgcHJvY2Vzc2luZy4NCj4gPiBUaGUgZGVidWdnaW5nIG1lY2hh
bmlzbSBlbnN1cmVzIHN0YWJsZSBvcGVyYXRpb24gYW5kIHRpbWVseSBkYXRhDQo+ID4gY29sbGVj
dGlvbiBkdXJpbmcgYW5vbWFsaWVzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lh
bmcgWWFuZyA8U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFtz
bmlwXQ0KPiANCj4gPiAraW50IG10a19jYW1zeXNfaXNyX2V2ZW50KHN0cnVjdCBtdGtfY2FtX2Rl
dmljZSAqY2FtLA0KPiA+ICsJCQkgZW51bSBNVEtfQ0FNU1lTX0VOR0lORV9UWVBFIGVuZ2luZV90
eXBlLA0KPiA+ICsJCQkgdW5zaWduZWQgaW50IGVuZ2luZV9pZCwNCj4gPiArCQkJIHN0cnVjdCBt
dGtfY2Ftc3lzX2lycV9pbmZvICppcnFfaW5mbykNCj4gPiArew0KPiA+ICsJaW50IHJldCA9IDA7
DQo+ID4gKw0KPiA+ICsJc3dpdGNoIChlbmdpbmVfdHlwZSkgew0KPiA+ICsJY2FzZSBDQU1TWVNf
RU5HSU5FX1JBVzoNCj4gPiArCQlyZXQgPSBtdGtfY2Ftc3lzX2V2ZW50X2hhbmRsZV9yYXcoY2Ft
LCBlbmdpbmVfaWQsIGlycV9pbmZvKTsNCj4gPiArCQlicmVhazsNCj4gPiArCWNhc2UgQ0FNU1lT
X0VOR0lORV9TRU5JTkY6DQoNCkNBTVNZU19FTkdJTkVfU0VOSU5GIGlzIGFsc28gbmV2ZXIgc2V0
LCBzbyBkcm9wIGl0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiA+ICsJCWlmIChpcnFfaW5mby0+aXJx
X3R5cGUgJiAoMSA8PCBDQU1TWVNfSVJRX0ZSQU1FX0RST1ApKQ0KPiANCj4gQ0FNU1lTX0lSUV9G
UkFNRV9EUk9QIGlzIG5ldmVyIHNldCwgc28gZHJvcCBpdC4NCj4gDQo+IFJlZ2FyZHMsDQo+IENL
DQo+IA0KPiA+ICsJCQlkZXZfaW5mbyhjYW0tPmRldiwNCj4gPiArCQkJCSAiTVRLX0NBTVNZU19F
TkdJTkVfU0VOSU5GX1RBRyBlbmdpbmU6JWQgdHlwZToweCV4XG4iLA0KPiA+ICsJCQkJIGVuZ2lu
ZV9pZCwgaXJxX2luZm8tPmlycV90eXBlKTsNCj4gPiArCQlicmVhazsNCj4gPiArCWRlZmF1bHQ6
DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiAr
fQ0KPiA+ICsNCg==

--__=_Part_Boundary_007_681201754.1951275999
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjQtMTAtMjgmIzMyO2F0
JiMzMjsxMzoyMCYjMzI7KzA4MDAsJiMzMjtDSyYjMzI7SHUmIzMyO3dyb3RlOg0KJmd0OyYjMzI7
SGksJiMzMjtTaHUtaHNpYW5nOg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtPbiYjMzI7V2VkLCYjMzI7
MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lhbmcmIzMy
O1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7c3RhdGUm
IzMyO21hbmFnZW1lbnQmIzMyO2FuZCYjMzI7ZGVidWdnaW5nJiMzMjttZWNoYW5pc21zJiMzMjtm
b3ImIzMyO3RoZSYjMzI7TWVkaWFUZWsNCiZndDsmIzMyOyZndDsmIzMyO0lTUDcueCYjMzI7Y2Ft
c3lzJiMzMjtwbGF0Zm9ybS4mIzMyO1N0YXRlJiMzMjttYW5hZ2VtZW50JiMzMjtlc3RhYmxpc2hl
cyYjMzI7Y29udHJvbCYjMzI7b3ZlciYjMzI7SVNQDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtvcGVyYXRp
b25zJiMzMjthbmQmIzMyO2V2ZW50cywmIzMyO2RlZmluaW5nJiMzMjtkaXN0aW5jdCYjMzI7c3Rh
dGVzJiMzMjtmb3ImIzMyO3JlcXVlc3QmIzMyO2hhbmRsaW5nLA0KJmd0OyYjMzI7Jmd0OyYjMzI7
c2Vuc29yJiMzMjtjb250cm9sLCYjMzI7YW5kJiMzMjtmcmFtZSYjMzI7c3luY2hyb25pemF0aW9u
LCYjMzI7ZW5zdXJpbmcmIzMyO2V2ZW50JiMzMjtwcm9jZXNzaW5nLg0KJmd0OyYjMzI7Jmd0OyYj
MzI7VGhlJiMzMjtkZWJ1Z2dpbmcmIzMyO21lY2hhbmlzbSYjMzI7ZW5zdXJlcyYjMzI7c3RhYmxl
JiMzMjtvcGVyYXRpb24mIzMyO2FuZCYjMzI7dGltZWx5JiMzMjtkYXRhDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtjb2xsZWN0aW9uJiMzMjtkdXJpbmcmIzMyO2Fub21hbGllcy4NCiZndDsmIzMyOyZndDsm
IzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO1NodS1oc2lhbmcmIzMy
O1lhbmcmIzMyOyZsdDtTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7
Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1tzbmlwXQ0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsraW50JiMzMjttdGtfY2Ftc3lzX2lzcl9ldmVudChzdHJ1Y3QmIzMyO210
a19jYW1fZGV2aWNlJiMzMjsqY2FtLA0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7ZW51bSYjMzI7
TVRLX0NBTVNZU19FTkdJTkVfVFlQRSYjMzI7ZW5naW5lX3R5cGUsDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsrJiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtlbmdpbmVfaWQsDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsrJiMzMjtzdHJ1Y3QmIzMyO210a19jYW1zeXNfaXJxX2luZm8mIzMyOyppcnFfaW5mbykNCiZn
dDsmIzMyOyZndDsmIzMyOyt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsraW50JiMzMjtyZXQmIzMyOz0m
IzMyOzA7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrc3dpdGNoJiMz
MjsoZW5naW5lX3R5cGUpJiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrY2FzZSYjMzI7Q0FNU1lT
X0VOR0lORV9SQVc6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrcmV0JiMzMjs9JiMzMjttdGtfY2Ftc3lz
X2V2ZW50X2hhbmRsZV9yYXcoY2FtLCYjMzI7ZW5naW5lX2lkLCYjMzI7aXJxX2luZm8pOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7K2JyZWFrOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2Nhc2UmIzMyO0NBTVNZ
U19FTkdJTkVfU0VOSU5GOg0KDQpDQU1TWVNfRU5HSU5FX1NFTklORiYjMzI7aXMmIzMyO2Fsc28m
IzMyO25ldmVyJiMzMjtzZXQsJiMzMjtzbyYjMzI7ZHJvcCYjMzI7aXQuDQoNClJlZ2FyZHMsDQpD
Sw0KDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsraWYmIzMyOyhpcnFfaW5mby0mZ3Q7aXJxX3R5cGUmIzMy
OyZhbXA7JiMzMjsoMSYjMzI7Jmx0OyZsdDsmIzMyO0NBTVNZU19JUlFfRlJBTUVfRFJPUCkpDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0NBTVNZU19JUlFfRlJBTUVfRFJPUCYjMzI7aXMmIzMyO25ldmVy
JiMzMjtzZXQsJiMzMjtzbyYjMzI7ZHJvcCYjMzI7aXQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1Jl
Z2FyZHMsDQomZ3Q7JiMzMjtDSw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrZGV2X2lu
Zm8oY2FtLSZndDtkZXYsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsmcXVvdDtNVEtfQ0FNU1lT
X0VOR0lORV9TRU5JTkZfVEFHJiMzMjtlbmdpbmU6JWQmIzMyO3R5cGU6MHgleCYjOTI7biZxdW90
OywNCiZndDsmIzMyOyZndDsmIzMyOysmIzMyO2VuZ2luZV9pZCwmIzMyO2lycV9pbmZvLSZndDtp
cnFfdHlwZSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrYnJlYWs7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
ZGVmYXVsdDoNCiZndDsmIzMyOyZndDsmIzMyOyticmVhazsNCiZndDsmIzMyOyZndDsmIzMyOyt9
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrcmV0dXJuJiMzMjtyZXQ7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KDQo8L3ByZT4NCjwv
cD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioq
KiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpU
aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGlu
ZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHBy
aXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBs
aWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUg
ZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJp
YnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90
IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--__=_Part_Boundary_007_681201754.1951275999--


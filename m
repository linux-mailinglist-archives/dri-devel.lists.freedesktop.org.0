Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9828092DDC7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 03:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89D210E741;
	Thu, 11 Jul 2024 01:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Lo11YrCh";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rnaGffTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7D110E930
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 01:14:20 +0000 (UTC)
X-UUID: e40365383f2211efb5b96b43b535fdb4-20240711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=gRsKyijO1W3u/TGRxCrAnqFLWToqMcfpIPPARA/OiZI=; 
 b=Lo11YrChrSKU8N1uvqm/kK5xPxIh93VDuy7FGCHU3HQFaVRRZzVSH7vgB6Bpgy+/RsAQVMhGqhdUvi3GW+G1oP54iRpINMHtiK0PqFHPI9Ds5B+fvdKwZQlIq4bI9sSUb1QL2H/VCQoeRNL9QoIH6mUhAgAWf4vvbrVdCEXP+Ek=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:38d11a23-5114-47ff-8992-c551b6e38091, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:ba885a6, CLOUDID:00e94f0d-46b0-425a-97d3-4623fe284021,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e40365383f2211efb5b96b43b535fdb4-20240711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 506541755; Thu, 11 Jul 2024 09:14:15 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 11 Jul 2024 09:14:15 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 11 Jul 2024 09:14:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JL+GzJzTBTHvpWCZYmPao0CjAK5UwfCrQ8HPfWi+AM9iYpnbUSwsg1PAFstzDu/AmSYpzOCycaKpfzWOCpMX/7Ucmi4ozVl0RZWDLXp10JKzIjVM0sX5Qvvw8UnFaZe3wLv5nk0QeRGh7m72Y7i5gFaK+s60aPANvT+Km6Vm1loIym/GzaxrfnuM7BmjKyoeYdBGd+uRIoEqnvEuJ/+7xjiquHlSnvBaIx9pNpf+ZYcN/RX4ZngpO+j439W+yOdo8dp3c3aHqI+LSTc8z5kXiDA+Ott8eQdnEjR8LXg0mPrIHvcO9aM9JBDrO51gG6hF4r8ztwYJ8qTIN/fSX6yZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W282FoKDcUyGBgo7JlLHFT59OnFM4sf2NLojC3MqrwA=;
 b=apYvVKpfH6EW9+g2H8H1sGbmPaddL6Jg6Wj3rV0I3T+vGJcBkd9/pQwEXquXUc+vQyjRrzvoX55newRa9Q/bj/IsmEvaMVIVv95pFtXUeEFsi4APVH5ZEJbA4T3OI11L7071El+s+cAwwq8RUbVztFVhsdeKdMao4rtZpNE+9mW60VBKn26WOCZzW7WfjlSux/A0jPVpD2Q7CcWMtW+wsGyDjWL9LKmcQR/Jzc3kMQNPCLgXLJoBouYJour1urTr6ixry58pIDDg7WxVvLXUhTTcfu2hLYmqEBziOtXVFa88FIM2mY3KMXEuGObo0FucbAa9pxpS/MCds7Q4++c55g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W282FoKDcUyGBgo7JlLHFT59OnFM4sf2NLojC3MqrwA=;
 b=rnaGffTG5s1gJiQq7h4kyoJu3VT9/86RvLHOV/UrJVfmQzz78egYiKR7t4KbaUUr1FjvmC0dta29rJ1N/kCDwKUXtj/V14IISRB2psND7Xry7EeGO0W9dP79AfcwQjZ5ER3DfW/rpuc9NaKLEoH0NX10/UgYMl6dL1Hfbt59Ylk=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB8079.apcprd03.prod.outlook.com (2603:1096:101:16b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 01:14:12 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 01:14:12 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Thread-Topic: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek, gce-props.yaml
Thread-Index: AQHaTmLiMoH4NLRf/EqMjmvpP6g6fLDoqeqAgMG1PoCARq8SAIAAH6SAgACUoAA=
Date: Thu, 11 Jul 2024 01:14:12 +0000
Message-ID: <5336f2a151463314dc3ab9ec8b7aa7dac9853667.camel@mediatek.com>
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
 <20240124011459.12204-2-jason-jh.lin@mediatek.com>
 <f91d3ac1-0a7d-4ca2-bf0f-c5e471c2f6bb@collabora.com>
 <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
 <CABb+yY2_oJ_AC2w5AgHMBvqFDeyaUq9BLczqY8JhLFPDnfzY_Q@mail.gmail.com>
 <CABb+yY3ddp6Ex50yh3hZn2aQcEULvmFfd99xb7ZNVnTPn7=mUg@mail.gmail.com>
In-Reply-To: <CABb+yY3ddp6Ex50yh3hZn2aQcEULvmFfd99xb7ZNVnTPn7=mUg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB8079:EE_
x-ms-office365-filtering-correlation-id: 33f836a1-2142-479a-8de6-08dca146c5f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Qm4wR2xpYk9zQWd0YTVxWmI1bndhVFBIZ3lRZjkwZ3ZZdlZDWjh6bHo3VTAr?=
 =?utf-8?B?UzJHanl6bTJ2K0IvWjBWVnBBQ2NkbGsvb0h3eGpENmx2amxlaWhzUnFIVXFn?=
 =?utf-8?B?dTBxUmI5UGljalI4YmZ6dCtwZktVQjU2NnVIWWpBWVQ5VGE0d09mci96SXhr?=
 =?utf-8?B?bzA0ai96S2xUZ0dtc2lQZFVZQmMxalcvNzFBQlZiVjNzbi9XMEVUMUN2a25G?=
 =?utf-8?B?VUZNODRYakpzNGFvV0xpQ3MzaXgxbmxrTmFWWHVzT3dOUjk1dHEyK0VBYVQv?=
 =?utf-8?B?a2xlTFJwQi9EMzY4WVA3RFM5TFYveE9LUC9kSHl2Vkc4Qkh6a25WL25JOFgw?=
 =?utf-8?B?UWlSaUNCU1YvMVBVdFd6ZUIvUHB5MGQ2akxpVUJsaU4zbVloMlIzbjhaSXdp?=
 =?utf-8?B?NmczQ3B4WDNBTm42bTVhTTcvMnJwZVpWaEZLS3lkR2EvUWt6RFpBMEhVYjdU?=
 =?utf-8?B?TzEvaTcydStPOW5UMk1PRTJKNWovWS96aE1TNXpjdlZwd1NPQjV5K0V6TElZ?=
 =?utf-8?B?U1JsZUZoZjR3MTVYaEc3dUxIcGFTVmJDWVh0SnI5SW9DVDZlcEo0YW9ueEVp?=
 =?utf-8?B?T2ptYXkzNkY5UUpZNSs1TGRPQVlqRWdJYTlRUzg3ZzdHV2FxblB5QlYyaXJa?=
 =?utf-8?B?K2k4TmZWcDZIL3IzWElLb2lBVVdPU3lPdzRUNGtGYnd2UktuVi9jR2xkZ01z?=
 =?utf-8?B?anI4dS9mZldnN3VneTFtWXVaTnArVWJnS1ZxaWtZTnFpWTljT290RVBZNG44?=
 =?utf-8?B?WUhrckpkRFJOQ2ViQ1A2SXVtVUdHSm1lc24xNmV4R2dydFh0aE9xTy8vaEls?=
 =?utf-8?B?N2pyU2tsQUxQdFdMWUM1TUVsMTJya2Q4NVNPZE10dXRRd1UwR3VJTXNxdHNX?=
 =?utf-8?B?ZWxtWis3MUhBRXkyN3l2c0o5QXhESnVwejRtaHlOL2dqS1IvZkJ0UlQyWGVW?=
 =?utf-8?B?cE9URUc4ZDZvblR5Z2M1S2x2SEhqTTJ5dUFHVHllS3dYNTdvV2tidTByUVBK?=
 =?utf-8?B?T1d5cFE2VUl2Uzc1MW1HWVZwanJzZWlvdGNBZG5obnZOTHlCdW9qWlN2TkNw?=
 =?utf-8?B?d0tHbE5jZEFLUzFOSXdnTDA3aUp1d3NVZC9WWU9BNUlOMktQOW03RHhCUHNC?=
 =?utf-8?B?Y1lMQ2dxbDBIbDUwSDNueE5HKzNWUncxbDFuVEpRcVVxRmR6Wnhsa2J1LzVi?=
 =?utf-8?B?cnkwM05XTC80UWs0NUZySExINU1BRTZ3MENjZmExclBRd1FUZktEcFEvSmpF?=
 =?utf-8?B?aFd5MElNNUttM1VsTGZxVmxURVJhRTQ5OHl5c29GQ2FSZnJUd2FkNUI4anEv?=
 =?utf-8?B?azFoK2NJTHo0U2RMbmlDMVFnbUNMYzRwa3NQMnVFTUIwNWVzUUtidklBY2NX?=
 =?utf-8?B?RXBzeUVvVnNSOGJhbjBrQmZxcXZ2SzNtVm8vbkloNDhHVk9uaGZ5VUV2dEJn?=
 =?utf-8?B?Mzc5K3M3YjVMUnBPVDVUSCs4TVlkNms3Ym5LMTh1QXBnMnB2ckN3VElnNWw0?=
 =?utf-8?B?eHd0VUo0TnBUKzB2cjhrcG1uYzdIRkpzaDdESVZ6STFmK0xhbGxaT2hnZ0sx?=
 =?utf-8?B?VDQyZnUrQ1BmZGdWeS9rZCtYdEE0dkxDQzZkRVFiSGpqMEcxc2xtUERRMVlY?=
 =?utf-8?B?dGxrelZJVkdCRjlVdkZsc2FiTmN0Slp5OFBDRk5nQUVocVdUbDB2STAwZ2FO?=
 =?utf-8?B?R2NrWGdFaEZkT2tIVDhXRDhxeVc1cENQY3NtU3ZOaVVVNzdSVmNuNnRoTnNN?=
 =?utf-8?B?TDJUcW1GY3NFRzYyWFhFdzk5MnhDdTRYVTZJUHFhVm9iV2lYeVlXZUFLWXUy?=
 =?utf-8?B?cENtMml5QVI5bFd5MGRyYmpRV3M5NnBCbE84cnBRSEladE5wMkoydUJWWnhV?=
 =?utf-8?B?eWQwd28zdktVS0FZbi96TWFtWjF3QmNxcTN4dnpBUERGQkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTJuaWtJRGxndkhDc0pWdWFkTmIrYStqNUdSYkFoblJ3VTNsSk95YTNhcnBH?=
 =?utf-8?B?RFhaVzdNTmgxS3BGSm83UWhIWGcvUUlEVG11cklaTkZZZDJ3MWhibDJKclNX?=
 =?utf-8?B?T2tEVGc2MGxRbnpSUVVYYUFaaUlIWHdWODNjc0p3SXhIVXhRVFdFVVlKdk5u?=
 =?utf-8?B?bWVSclRPNXFzUFF4aS9iOE5paEYrV2RqYW02T1JtMU9TaXp2RzV3MWQzSnlQ?=
 =?utf-8?B?THNTMUoyNjhuTnJmdlBqVDZza0ErMTV4amJ1a1ZsTGZtMlpydXZXc3UxV2lD?=
 =?utf-8?B?elBzR1pZT1Nqa2hMMXd1N0toazNIYU16T3Q3YlVDRmRuOVBqSzJ1ZWFpOVps?=
 =?utf-8?B?dFY4aUtKNWk5YklzbVdrR0w0MG1uMVJRY1RCRG8yWnI2eG9XMlY3a1BMbG5X?=
 =?utf-8?B?dllWL0hJTXN2ZlR5d3pJVU4zaE5temlwK1VrcS9TK1hNK0N3UjJxMzVWbVNx?=
 =?utf-8?B?dU1oaXRoYW9VUFkvVHZhQnJUSndseE9VKzN4Y1A2eVhWdFgrSWF6OXVnZmxI?=
 =?utf-8?B?b0pBa01kZFpDV2RsMzFBMU8xWlJJVUg3MEo2Q1Q5V1V2dEs1N1RobE13VWFE?=
 =?utf-8?B?S0pIUVVMZE1kbm5Mbm1MTnVnMVl2VjQyMmsxVThLK2xIL0VFNUVCSU9ZRWta?=
 =?utf-8?B?d2J6bkZYcE4xMXpWRlFSVXAwMTgyUTFwREZHODRVeFcvNk1CMVh5ZGRVTW05?=
 =?utf-8?B?dTRoT3prSTA2bmNrNmVXQUJqNG45K1lRdDAxSG1SRUVscTVCN0s1bEVvNEsw?=
 =?utf-8?B?NUkzY2hqbXcwejgzZyt4V1FxSTg4Si9CbVJTeGY5ZTN5UStqZm10bEpqb25j?=
 =?utf-8?B?U3hFSjA1SFVEWkc5c1ROcW8xNTRIaTM4dlhRTHBHQ1EzS3U0TkNvWnoxVEV0?=
 =?utf-8?B?UGU1R0xVbkEwY3YyaWJTc3NNdi9TYnpwRURqR3RiTVNPTUZlNXVuTjhuaDI2?=
 =?utf-8?B?SUNJbHpxcUhaWjBCeXhtdC9oeUtpcUdkK0UzZXRkTmMzMFBMYng3TTR2Rm90?=
 =?utf-8?B?amhBU0NDUGRtTDBsT0doTTNqcWVVYldFZThqOVBYaWdzbDRRd1Y0YlR5WFA3?=
 =?utf-8?B?eXZkS3Q2NnJuNGRWRUdLNWd6ZFZPZjJqZ25BeHozZDdLK0pyUFBsWkNNdmZK?=
 =?utf-8?B?VU1zTGJuVEtLd0phZTRqRXRsTk1PR0xwQm5kZ0lJRkc4UkZMU1hSSWFtaXF1?=
 =?utf-8?B?cXR5VnNVYzVRUE8wYnFFckxiVHQ1SGJxUjQ0YkViUmFWS2htMFNHN1I2U3V0?=
 =?utf-8?B?Wjdha0hSYy9xQThDdHFxT09kbDNkM2w4NGM0SExiSlh5RHlFa1NncHJvaTgw?=
 =?utf-8?B?eVBKUWoycjZUbWl4NU9taVM5NFhPV21tWkdkaVBtaDBzclEyM1JaeWU1SjFz?=
 =?utf-8?B?QUo3MUM4blRHdXpWbDAyUSs5MC9KVkRSejluNjJyTURjR2RKV1E3U1VvNGU2?=
 =?utf-8?B?NW9BbXVlQ2hxd2ZaZUEwbnlGc0d6cXQrYkNnQlowWEFNVmM4cm5vL2FkODhU?=
 =?utf-8?B?eHY2SzhEd2xJVmZrZGF4dlZZckZLSTgrbHVqazcxNVlmdGlCcS9IZ0JhTmRI?=
 =?utf-8?B?VGpmTi9DKzhWUjcxbWN4R25BSDNjdnY2NHVUM05RRDdLNk83Wm1ObHpIN3Z3?=
 =?utf-8?B?VjBlNTVnQnJIRUZKZURlenJTQ2svZ1Z5U3VvT1A4eVFXZ1pwV2tud3pxTVl4?=
 =?utf-8?B?ekh1NTBWS281Z2dNVURwSk1TL1NvQ1R2OFpkeWFiOC8wVVBvQlByNWxyT3Nj?=
 =?utf-8?B?d0JMckpKZ0o3STY2amZXM2JHa3dNMzF5R1ZqY0p0aXpheWREejdhdGVqcnds?=
 =?utf-8?B?cXR4NmhsbXJwbHNuZTZyM2Y3N0taYmFYTDJiTlphNW1nME1DNFJCRmpHVmpi?=
 =?utf-8?B?dENWUVJFWlROanRuOHRibC9NZ0k0RWw4L1grQ1l5cU5EYTFhREUwU2RNS2NU?=
 =?utf-8?B?ZEJIMjZPQmJaWGVtRERwaC9seHRIcCtxRlhkNGxrZnVUbXJIVHFBWDJGR3c5?=
 =?utf-8?B?VVVIL1IyRHRzNkUxVkhqMEtxZmlKS3N5ZlYwUHFmSmRrUkd0a3QzZjlJOWM1?=
 =?utf-8?B?NHZxUWl0dVlwcSt6TGllb2gySDVSQkNOc2lLL25UblVJTmswTjA2NFRBYWJ6?=
 =?utf-8?B?UlRTNmdoMHdEcit2VWJ6c3pVZS95L0VsOUdLWm14Y1dBVTRDZFdUZTBpTmdT?=
 =?utf-8?B?TUE9PQ==?=
Content-ID: <D2DF3A9566787A4BBCE66E4FB13A7B62@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f836a1-2142-479a-8de6-08dca146c5f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 01:14:12.0800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vHfoqNDTwLNT1pN7Y+3aGEfwfqPz6SbAMZ1gR5veFzwlVrTdAYtn8/HDWhLosE8xQX3LUSGPgyZ/LRKQCt4B7N6SRybdFXLxI5ShF85+Wb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8079
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1983972083.1512803850"
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

--__=_Part_Boundary_002_1983972083.1512803850
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI0LTA3LTEwIGF0IDExOjIyIC0wNTAwLCBKYXNzaSBCcmFyIHdyb3RlOg0KPiAg
CSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gIE9uIFdlZCwgSnVsIDEwLCAyMDI0IGF0IDk6MjjigK9BTSBKYXNzaSBCcmFy
IDxqYXNzaXNpbmdoYnJhckBnbWFpbC5jb20NCj4gPiB3cm90ZToNCj4gPg0KPiA+IE9uIFN1biwg
TWF5IDI2LCAyMDI0IGF0IDEwOjA04oCvQU0gSmFzb24tSkggTGluICjmnpfnnb/npaUpDQo+ID4g
PEphc29uLUpILkxpbkBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEhpIEFuZ2Vs
bywgSmFzc2ksDQo+ID4gPg0KPiA+ID4gQ291bGQgeW91IGhlbHAgbWUgYXBwbHkgdGhpcyBzZXJp
ZXM/DQo+ID4gPiBUaGFua3MhDQo+ID4gPg0KPiA+IFBsZWFzZSBnZXQgaXQgcmV2aWV3ZWQgYnkg
RFQgbWFpbnRhaW5lcnMgLi4uLiBSb2Igb3IgS3J6eXN6dG9mLg0KPiA+DQo+IEkgc2VlIENvbm9y
IERvb2xleSBsaXN0ZWQgYXMgYW5vdGhlciBtYWludGFpbmVyLCBzbyBJIGFtIHBpY2tpbmcgaXQN
Cj4gdXAuDQo+IEJUVywgSSB3YXMgbm90IENDJ2VkIG9uIHRoZSBvcmlnaW5hbCBwYXRjaC4NCg0K
T2gsIEkgc2VlLi4NCkknbGwgY2hlY2sgaXQgbmV4dCB0aW1lLg0KVGhhbmtzIGZvciBub3RpY2lu
ZyB0aGlzIHBhdGNoLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCj4gDQo+IC1KYXNzaQ0K

--__=_Part_Boundary_002_1983972083.1512803850
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjQtMDctMTAmIzMyO2F0
JiMzMjsxMToyMiYjMzI7LTA1MDAsJiMzMjtKYXNzaSYjMzI7QnJhciYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1Bs
ZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYj
MzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3Zlcmlm
aWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsm
IzMyOyYjMzI7T24mIzMyO1dlZCwmIzMyO0p1bCYjMzI7MTAsJiMzMjsyMDI0JiMzMjthdCYjMzI7
OToyOCYjODIzOTtBTSYjMzI7SmFzc2kmIzMyO0JyYXImIzMyOyZsdDtqYXNzaXNpbmdoYnJhckBn
bWFpbC5jb20NCiZndDsmIzMyOyZndDsmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0Ow0KJmd0OyYj
MzI7Jmd0OyYjMzI7T24mIzMyO1N1biwmIzMyO01heSYjMzI7MjYsJiMzMjsyMDI0JiMzMjthdCYj
MzI7MTA6MDQmIzgyMzk7QU0mIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyOygmIzI2NTE5OyYjMzA1
OTE7JiMzMTA3NzspDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmbHQ7SmFzb24tSkguTGluQG1lZGlhdGVr
LmNvbSZndDsmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0Ow0KJmd0OyYjMzI7Jmd0
OyYjMzI7Jmd0OyYjMzI7SGkmIzMyO0FuZ2VsbywmIzMyO0phc3NpLA0KJmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Q291bGQmIzMyO3lvdSYjMzI7aGVs
cCYjMzI7bWUmIzMyO2FwcGx5JiMzMjt0aGlzJiMzMjtzZXJpZXMmIzYzOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7Jmd0OyYjMzI7VGhhbmtzIQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0Ow0KJmd0OyYjMzI7
Jmd0OyYjMzI7UGxlYXNlJiMzMjtnZXQmIzMyO2l0JiMzMjtyZXZpZXdlZCYjMzI7YnkmIzMyO0RU
JiMzMjttYWludGFpbmVycyYjMzI7Li4uLiYjMzI7Um9iJiMzMjtvciYjMzI7S3J6eXN6dG9mLg0K
Jmd0OyYjMzI7Jmd0Ow0KJmd0OyYjMzI7SSYjMzI7c2VlJiMzMjtDb25vciYjMzI7RG9vbGV5JiMz
MjtsaXN0ZWQmIzMyO2FzJiMzMjthbm90aGVyJiMzMjttYWludGFpbmVyLCYjMzI7c28mIzMyO0km
IzMyO2FtJiMzMjtwaWNraW5nJiMzMjtpdA0KJmd0OyYjMzI7dXAuDQomZ3Q7JiMzMjtCVFcsJiMz
MjtJJiMzMjt3YXMmIzMyO25vdCYjMzI7Q0MmIzM5O2VkJiMzMjtvbiYjMzI7dGhlJiMzMjtvcmln
aW5hbCYjMzI7cGF0Y2guDQoNCk9oLCYjMzI7SSYjMzI7c2VlLi4NCkkmIzM5O2xsJiMzMjtjaGVj
ayYjMzI7aXQmIzMyO25leHQmIzMyO3RpbWUuDQpUaGFua3MmIzMyO2ZvciYjMzI7bm90aWNpbmcm
IzMyO3RoaXMmIzMyO3BhdGNoLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7LUphc3NpDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6
dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0
eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkg
YmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpl
eGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5k
ZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4g
QW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5p
bmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRz
KSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBt
YXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9m
IHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUt
bWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5
IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiAN
CnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVt
LCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkg
b3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_002_1983972083.1512803850--


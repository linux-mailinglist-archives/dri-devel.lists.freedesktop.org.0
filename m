Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680AF9D3223
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 03:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E7110E021;
	Wed, 20 Nov 2024 02:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="qUXbziRP";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="EHsnA1S/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DE210E021
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 02:21:55 +0000 (UTC)
X-UUID: 3268a2b2a6e611efbd192953cf12861f-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=lSRWeQVW1q4XTeXv+LxQPsxsV5peYA8B1tz8HDhvEKI=; 
 b=qUXbziRPULGPkYKi41m4Im50XIEVCdlZ1zI6kfXJPVO4sVFrQ/dlhgpvmEwme9ZbQQkNQ/VG2IgtqXzRwv/Ng0P0D71PV0+u3ooS6fLsQJqaGs5i7hWdpY0FSczdwh/4pSaXuyO8CXqvQQoPfe4HUBJgZUIY/M+rEyz+4qKiGgA=;
X-CID-CACHE: Type:Local,Time:202411201021+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:97b95537-44b3-4a81-9764-47796f8de94f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:791d7da0-f395-4dfc-8188-ce2682df7fd8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3268a2b2a6e611efbd192953cf12861f-20241120
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1640547622; Wed, 20 Nov 2024 10:21:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Nov 2024 18:21:47 -0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 10:21:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHT0scbkzRrYPC0pFxVy4Jxc5coqcQyG7PRk3gFZdvMAva/xPSHPinq6tLwE5e7/kx55UYpBU0V0v7uoplr2Upfe2LUuSXdOeokz/Uj5bHsdZM/fgHKYBXpiniK7UlmDtcFjuex97enfuP4/bQUG203KuXzUjgScbRlfYDpM4GoQNfti2ZcEGSff9+SShVmjsehnaiNPkQBxo/RgankW2v+vhpiH2Sru9ZbYTskSwL+wYcBmQf+oF26vgBNU7a4X2r8VQQzgz1iW1KJGEdGXHrXPMR4eTTCEoqnFpGkgjo0WTdNnMFtULBdbxZfKFBmwHlFLc3E5LEiIOJ1tegSIGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLx88LHlbgEaHUn3yx/VJ31TfhvgjwVkHa0uvZIgEBM=;
 b=k0AOVPBxcnXB2hbr/c7PV9U1Xx5povYwTxgDeom/qMVeQTUiBRFhWO8+oUV7ehg14TdWcc0CF7pzt9V91iD1PgS1igUFY282541XEfrHomy1xGh1uBkdud/hPiE3toTLohpTFtwchyMWawQLqbWoUrGsBbKHI1ju5JEdRzY88mJucP791wCcTLqBwA8zjIEZLJAi/8hLK98YRM6jkXcF7dp9wBIVP9+yp3XcBPbtSD7ejYzdBQZllRWujJb/VQng/T8QmsEdJRt7N5s9HLHTLSidpG6polwYxm2Ot96fth1o8Lsz2eK6dgNlKwlUf/fRBHgUxNBJExJ2YTywEGn9qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLx88LHlbgEaHUn3yx/VJ31TfhvgjwVkHa0uvZIgEBM=;
 b=EHsnA1S/4IHFxnfGzIfDdM1flxOu7iz3w5pLfOB1NzoA+WuvMvWa0F9kZydQnxtxWNY5zOGujdTTgjnu5r/iYq8paWlje7PLS88K1Om2QsQnu5XIZ57zgVBNJlqPG0vEF5c9Z0DIm+nCx1kX/YmyGGAlaqH5fundw0M57TOmtWY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by OSQPR03MB8673.apcprd03.prod.outlook.com (2603:1096:604:298::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Wed, 20 Nov
 2024 02:21:44 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Wed, 20 Nov 2024
 02:21:44 +0000
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
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbK/sWaA
Date: Wed, 20 Nov 2024 02:21:43 +0000
Message-ID: <16f46f30852c771ae8f787eb6abaa6c92ea3c5f3.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|OSQPR03MB8673:EE_
x-ms-office365-filtering-correlation-id: 3f743cbc-9ee1-4461-63fd-08dd090a139c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aFY3VXJtVHpDalNzVGJPVjh1bzBRRW9UcmtQZE9sQ1dmY2lRaVVFVlB5cTBN?=
 =?utf-8?B?ODRvUlJVeXlnUzFyY2loeTJDZkxpUU9zYmVlU1psQm1qLzVlbyszRC8yb2Z1?=
 =?utf-8?B?WlRLbVc0L2MwS2YzWU5Vc25IVml6M3pocFUxaHd2U3RXb3p1ajd1S0NsdlpH?=
 =?utf-8?B?aUJaQ2YvNFNUejBEYWNtWEdwc3JkNXNEdGcybkVKdWVxdlcrTk5uYXZTN1RP?=
 =?utf-8?B?VVp2a1BmZFJUcU1pR2l0a2pnOTliQzZCMDIxZ2hDaDFidzlFdFVQaCtTMG5T?=
 =?utf-8?B?R2FPbmdsSm91a00wdEMrYkhmR21xenhTdXFBUFhkeG9lMTlmeEtZRllURk9z?=
 =?utf-8?B?S2ljbEcvSk5iZWJZakh3R0pIcUsvSEkzTWFrZC9WRkRzbGFSUVJuTmJKdVQz?=
 =?utf-8?B?anUwZTNCYjQvamgwYSs0NWp5QjRHYmsyNGVWajdVOVUrbnJRVUdpZlI3VFov?=
 =?utf-8?B?U1haV2dzN1lGOEN3WC9uUFg0NXpLdXNWNFUwWW5LV0dsY0FIc1l1dko5YUFv?=
 =?utf-8?B?emtRTjV2QTdUQ3hMemR1TnRUS2FSaTVKYnBSVG1tcFpxMVRIenBwM2hyUjdu?=
 =?utf-8?B?aFJpZGEweVF3MDRGcDVwTWVlaDZXZ3kvMk4xZWxBZ2VMUi9oRjlpZmtDRjlj?=
 =?utf-8?B?WXp4MFdXamx3Q1hJMzMvUys3R0orZE9GNXZMN3Z1aFJJZTJpSlhra000V0FO?=
 =?utf-8?B?TUFJR2ZTRmxGYVo0NXlZL01oVEZDNWdLcTBKdEZVODEzbHZNM202T051VlYx?=
 =?utf-8?B?VzZITHdiayszVVJwS3Q4QXZ6TVUyNTAvMVJPMkkyV0ZnSjZrZHh1cENyd2RE?=
 =?utf-8?B?T2ZLd1FKWVE0cUxNVnhmSWZKSWt1TGtIeHRaeTZIUnk5TTBvdTRXaCtDNHNy?=
 =?utf-8?B?QUpHdDhwY1ZnQloyY25FV0FudXk4eFFWUjVVbDkwVDlzcU8vU1JIVlc2eGt6?=
 =?utf-8?B?MmdxdHFSSHJPRUdORWRKZU83ekFxWmtkRlVlN2ZuYlRJU3MrS0kvWFFXQ2Uw?=
 =?utf-8?B?cVMza29wVkl1Z1ZrcVFiRHF5Ynl5cUJ4bGRvQUpxOERMdlZEYzFMVmlZb2Jh?=
 =?utf-8?B?S3dPdUd1TS9hT0JMUlMvVXBISnA2WklONmVXRXU2aWIvSXZCWnZjdTU5Nld6?=
 =?utf-8?B?U3NKS2p2ek0raWtwOThqTEpZdGRkYkVQN3hvMzhIaVM1MU94K01ybmh5N2Fj?=
 =?utf-8?B?bW5VTFgzTkJ0QWs2NGp3VEdabXJTaWNFS2FjRHgydjlYVnJ6ZkVZOU52Wlgr?=
 =?utf-8?B?bm04dDJMdmNaTjN2a3J1d0M5L0RhOWxJMk1nbVYrc212WEdnSnVBci9FaUli?=
 =?utf-8?B?VlM1U1FieXQ0cStYTXczYjdzcWxKQjJhSjhOcmFxNlVRRytJOHlVdUJmWnR6?=
 =?utf-8?B?bGtmZWVleEtneFdEWXlabkZuOGc3R2ZCeDd3ZDV5Q2Y3TG9ZK3dFcCtKT2ZQ?=
 =?utf-8?B?SFNqKzU5aGJXaXljcFpMZnNjS2Evc0I2eFRtWWVkYmREQStwN2MyUzkxclFy?=
 =?utf-8?B?cy9uVDFWZjdRSHlrMXB4N3B5MG5lSXRxZ0x3cURGL0owMlpBMnQwNmZ4dDhN?=
 =?utf-8?B?ckN6YXdja0NtYnpMQlpvUytlSmhYb2FGeE81TzcxWGdhWnk3dUdRb2syMGdK?=
 =?utf-8?B?ZUYwSFNxc2NUcTRIT2NUY2xselFIL093ODNnVHNETW9JV3AySWtlVDlObHdy?=
 =?utf-8?B?aVU1UGNmZ2ZuQ3dtcFJ1ZlZrL041ZElOLzRDQ0txUHpkZ2JPRk1YS1dZV0hN?=
 =?utf-8?B?amRlcHFUdzByUGhPUU0xMjNjMmZWVXlycWVWYVR4eTluaEZ5ZEpzUHBpdGtW?=
 =?utf-8?Q?fZo7Q5CeWghSOKdjuCDIWrQLGKUB6c9bHg3Wc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUZ1V2h5SmM4UGNPcll6NGVtQUEvWU12Zm9VNmVvNFF1RE8zWnF1Q1h0OHcv?=
 =?utf-8?B?eklSSCtHR2tXYW1KaGI3VXk2Q2FUM1VxVDFhdmdLMWdqT3FHRTlSQ1owWFcz?=
 =?utf-8?B?YU52Qm1MOThLRHNnd2xGVGxUSzNCQlA2NGhDNlpxVXQzbWVTSmZYdXNMNERq?=
 =?utf-8?B?NThmSkZEazhwREx2TysvSG13THhkMGlybU0vQUwzNnZCRGhPcEZvNHcrLzJP?=
 =?utf-8?B?SmpoKzBoTHNHeDFtMlNYeDlWTUMvb2I3dk8rZC9CdWRpSFY3S3RVTjUwRExa?=
 =?utf-8?B?QXlmamF6NlBETmVYd0RGenZaQ3hrYWIvV3I3Q3ZmcFQwa09aeWxpUW5CekFZ?=
 =?utf-8?B?b1ZZSGZCRzMycVBMRG9qM2o3NHN5eVF0S1Zlb21PZXR6NG5UVk5nbXNvbUtD?=
 =?utf-8?B?aHIwTGlyZHlQcjJuR1ZjazV0UU5WZWxJKytpNGpYbVIrOTZ3cTF3YzBQRU4x?=
 =?utf-8?B?cll0Q2trVGFlS3o3alNDbVJ1VlF3Ty9sc2t2OGplck9LbHIrLy8yY0ZZZWhU?=
 =?utf-8?B?cnJ1QWdlUkFFUnVCWHc2ME5ZQWtESVQ5akJjczdHTEV3RnBndlpxZ0dkd0hN?=
 =?utf-8?B?WkRFeHFHaHl0R25XMDJHYTF1QVdkUHZERDJkZzk1MjQ4RFJLeDNNVWlFZXBv?=
 =?utf-8?B?ZTdwRDJ5QlhhMy9MbnJQbTM4cDExQnNwektGQVZaN05Xa2VXcjUyeEpKenVy?=
 =?utf-8?B?c3c2VDJYc1BGTys1VU5vUVFKNjE5TVhZWlhFZkw2dE5ZaTVMR1g1WkhaS2Ro?=
 =?utf-8?B?SDMxSlB4VHA3SzJobVZ1TEQwME1RRlI0UUs5M2Z3OTFLMjF4aUIrbHVBdXFQ?=
 =?utf-8?B?aEd6YTJYWkV6bWZWTmZGdGQzc1dMOEJ4alZxTHFXY0pFRnI4VzNTNjVYemNm?=
 =?utf-8?B?alBhY1ZUUCtpdmlUSEkxZUNPTWcwMXF4SUw2RUJaSVBxa0k5OHVXRitxWFNB?=
 =?utf-8?B?bVBDeVgxR1dsKzBTdTE1VUF6UHA1RGViVWR5VTl0bjBqcGIwQ2FYU21mL1FR?=
 =?utf-8?B?K01ISjdEU0FKZE5FeWhrTDJZQWh6Yjh6SjJqWm5kNWMrNE5Rd04wUnNSRUpa?=
 =?utf-8?B?c1djZ1FJVDZuZjRHY0JLWFNPSS9qMTFmMnBEYVVUVG1vLzJjditwdXhMcHIz?=
 =?utf-8?B?REdMZHFGSGxtenFxWVZtU21JNHd3cGhGN2h1WS9VZzR0dE9jb3V1S2MwRU0r?=
 =?utf-8?B?eXdiVEhScmJCOTg2eXN2b2lVVi8rWW4xSFJZWVdoLzRMWGpDRWxVejRyK1pD?=
 =?utf-8?B?ck5UM1ZkTW40Z2F0clJtK0J2QUpkblg4VkdnNnFKRnlOTG1ORlh4NE02SEJF?=
 =?utf-8?B?aTdQV203V3h3U2tJUlRMaTNnc1RXU2I1b3laNzhKK2d1UmdHdGxERWV2dzR2?=
 =?utf-8?B?Nk9RVDk4WjJXUy9pNnhjclZTdXM2T2NhdWM5WWVwbEFIYklzK3lwVktUVzQx?=
 =?utf-8?B?MkdhUkFCVVQ1aFg4YitmR2NGVjI4dEVLK3pJUm5zSVA5cUZrVGpZRE1pK3R3?=
 =?utf-8?B?QVVtSDhndmI3QTFkTHlya0Z1UGtXQmdQOHNSUWhlZjlMTE1BVDFnNGpSTTA0?=
 =?utf-8?B?WEZiNTN5aU1aKzZBMG5ISHkxS0hYcFhUekI4YmRzT2kzb3BDZDFIY2NMbUVx?=
 =?utf-8?B?cmRydXB6Vm5VY3VNdDhZOVJZT3ptVE1HbkZOdm1rcnNENTBmQllBZU11Tndv?=
 =?utf-8?B?ZTNyOGVzRmNMZTF2a09wZ3oxUnB1a1ZmeVF4bFFTUitwQjREUW5FVVUzblNJ?=
 =?utf-8?B?V295d0VpWjdkcjFxNlJjTlZNYjNCRXNnZm5FWVdULzBlSG5oUk9oZHhDOU5a?=
 =?utf-8?B?VXRMT1BCdUZ0dDZkaG9ZS3hCc2dOQmQ0N09OOG1wTHVpTkljeWdBVDE3eTJ1?=
 =?utf-8?B?aHNGYmpTRzFDOHNHQnh4V0sxOGJUdk5pUVNqRFg1Mmoybi9HUXl0V2FuR0pp?=
 =?utf-8?B?aDlBbDhBQkZxbDBtWVRwZXNGT1BaeXBNTCtoSXdFbFBPUDd2ajNsNXgyVFEw?=
 =?utf-8?B?VEhDaWVrZUx0aTF5ZWNyYTJEWVlBOWp5aTNmVjJYKzh2a05wZDBaUm5lVWFh?=
 =?utf-8?B?aU1nU0d0UXpmUk45MXpOb25URFR3c3hKTzJiSnhwb0luWFBkV2FzQ0ZUV3JX?=
 =?utf-8?Q?LhCNmg0ryb4HVcGEY7nPPhhiZ?=
Content-ID: <7B29EF5660CD1B42AFBF681CE7693F50@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f743cbc-9ee1-4461-63fd-08dd090a139c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 02:21:43.9667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vLmBKEL1q7JZjhigyS0jVxlA+mMyAjE0W3g8od7ybhIoV5TPyxi4CIG3fRYXCYnXtQoUHjTxP5MYWK0jvq1sYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8673
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1891130268.2124338892"
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

--__=_Part_Boundary_001_1891130268.2124338892
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKw0K
PiArZW51bSBtdGtjYW1faXBpX3Jhd192aWRlb19pZCB7DQoNCkl0J3MgYmV0dGVyIHRvIHVzZSAn
c2NwJyBpbnN0ZWFkIG9mICdpcGknLg0KVGhlIGludGVyZmFjZSBpcyBwcm92aWRlZCBieSBzY3Au
DQppcGkganVzdCB0cmFuc2ZlciBkYXRhIGJldHdlZW4gbXRrY2FtIGFuZCBzY3AgYW5kIGlwaSBk
b2VzIG5vdCBjYXJlIHRoZSBkYXRhIGNvbnRlbnQuDQoNCj4gKwlNVEtDQU1fSVBJX1JBV19JRF9V
TktOT1dOCT0gMCwNCg0KRGl0dG8uDQoNCj4gKwlNVEtDQU1fSVBJX1JBV19SQVdJXzIsCQkvKiBS
QVdJX1IyICovDQoNCkRpdHRvLg0KDQo+ICsJTVRLQ0FNX0lQSV9SQVdfUkFXSV8zLAkJLyogUkFX
SV9SMyAqLw0KDQpEaXR0by4NCg0KPiArCU1US0NBTV9JUElfUkFXX1JBV0lfNSwJCS8qIFJBV0lf
UjUgKi8NCg0KRGl0dG8uDQoNCj4gKwlNVEtDQU1fSVBJX1JBV19SQVdJXzYsCQkvKiBSQVdJX1I2
ICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfSU1HTywJCS8qIElNR09fUjEgKi8NCj4gKwlNVEtDQU1f
SVBJX1JBV19VRkVPLAkJLyogVUZFT19SMSAqLw0KPiArCU1US0NBTV9JUElfUkFXX1JSWk8sCQkv
KiBSUlpPX1IxICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfVUZHTywJCS8qIFVGR09fUjEgKi8NCj4g
KwlNVEtDQU1fSVBJX1JBV19ZVVZPXzEsCQkvKiBZVVZPX1IxICovDQo+ICsJTVRLQ0FNX0lQSV9S
QVdfWVVWT18yLAkJLyogWVVWT19SMiAqLw0KPiArCU1US0NBTV9JUElfUkFXX1lVVk9fMywJCS8q
IFlVVk9fUjMgKi8NCj4gKwlNVEtDQU1fSVBJX1JBV19ZVVZPXzQsCQkvKiBZVVZPX1I0ICovDQo+
ICsJTVRLQ0FNX0lQSV9SQVdfWVVWT181LAkJLyogWVVWT19SNSAqLw0KPiArCU1US0NBTV9JUElf
UkFXX1JaSDFOMlRPXzIsCS8qIFJaSDFOMlRPX1IyICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfRFJa
UzROT18xLAkvKiBEUlpTNE5PX1IxICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfRFJaUzROT18yLAkv
KiBEUlpTNE5PX1IyICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfRFJaUzROT18zLAkvKiBEUlpTNE5P
X1IzICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfUlpIMU4yVE9fMywJLyogUlpIMU4yVE9fUjMgKi8N
Cj4gKwlNVEtDQU1fSVBJX1JBV19SWkgxTjJUT18xLAkvKiBSWkgxTjJUT19SMSAqLw0KPiArCU1U
S0NBTV9JUElfUkFXX01FVEFfU1RBVFNfQ0ZHLAkvKiBBbGwgc2V0dGluZ3MgKi8NCj4gKwlNVEtD
QU1fSVBJX1JBV19NRVRBX1NUQVRTXzAsCS8qIHN0YXRpc3RpY3MgKi8NCj4gKw0KPiArCS8qDQo+
ICsJICogTVRLQ0FNX0lQSV9SQVdfTUVUQV9TVEFUU18xIGlzIGZvciBBRk8gb25seSwgdGhlIGJ1
ZmZlciBjYW4gYmUNCj4gKwkgKiBkZXF1ZXVlZCBvbmNlIHdlIGdvdCB0aGUgIGRtYSBkb25lLg0K
PiArCSAqLw0KPiArCU1US0NBTV9JUElfUkFXX01FVEFfU1RBVFNfMSwNCj4gKw0KPiArCS8qIHN0
YXRpc3RpY3MgbWF5IGJlIHBhc3MgdG8gRElQICovDQo+ICsJTVRLQ0FNX0lQSV9SQVdfTUVUQV9T
VEFUU18yLA0KPiArCU1US0NBTV9JUElfUkFXX0lEX01BWCwNCj4gK307DQo+ICsNCj4gKy8qIFN1
cHBvcnRlZCBiYXllciBwaXhlbCBvcmRlciAqLw0KPiArZW51bSBtdGtjYW1faXBpX2JheWVyX3B4
bF9pZCB7DQoNCkRpdHRvLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArCU1US0NBTV9JUElfQkFZRVJf
UFhMX0lEX0IJCT0gMCwNCj4gKwlNVEtDQU1fSVBJX0JBWUVSX1BYTF9JRF9HQgkJPSAxLA0KPiAr
CU1US0NBTV9JUElfQkFZRVJfUFhMX0lEX0dSCQk9IDIsDQo+ICsJTVRLQ0FNX0lQSV9CQVlFUl9Q
WExfSURfUgkJPSAzLA0KPiArCU1US0NBTV9JUElfQkFZRVJfUFhMX0lEX1VOS05PV04JCT0gNCwN
Cj4gK307DQo+ICsNCg0K

--__=_Part_Boundary_001_1891130268.2124338892
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dXRpbGl0eSYj
MzI7ZmlsZXMmIzMyO2ZvciYjMzI7dGhlJiMzMjtNZWRpYVRlayYjMzI7SVNQNy54JiMzMjtjYW1z
eXMmIzMyO2RyaXZlci4mIzMyO1RoZXNlDQomZ3Q7JiMzMjt1dGlsaXRpZXMmIzMyO3Byb3ZpZGUm
IzMyO2Vzc2VudGlhbCYjMzI7cGxhdGZvcm0mIzMyO2RlZmluaXRpb25zLCYjMzI7ZGVidWdnaW5n
JiMzMjt0b29scywmIzMyO2FuZA0KJmd0OyYjMzI7bWFuYWdlbWVudCYjMzI7ZnVuY3Rpb25zJiMz
Mjt0byYjMzI7c3VwcG9ydCYjMzI7SVNQJiMzMjtvcGVyYXRpb25zJiMzMjthbmQmIzMyO1NDUCYj
MzI7Y29tbXVuaWNhdGlvbi4NCiZndDsmIzMyO0tleSYjMzI7ZnVuY3Rpb25hbGl0aWVzJiMzMjtp
bmNsdWRlOg0KJmd0OyYjMzI7MS5IYXJkd2FyZSYjMzI7cGlwZWxpbmUmIzMyO2FuZCYjMzI7cmVn
aXN0ZXImIzMyO2RlZmluaXRpb25zJiMzMjtmb3ImIzMyO21hbmFnaW5nJiMzMjtpbWFnZQ0KJmd0
OyYjMzI7cHJvY2Vzc2luZyYjMzI7bW9kdWxlcy4NCiZndDsmIzMyOzIuRE1BJiMzMjtkZWJ1Z2dp
bmcmIzMyO3V0aWxpdGllcyYjMzI7YW5kJiMzMjtidWZmZXImIzMyO21hbmFnZW1lbnQmIzMyO2Z1
bmN0aW9ucy4NCiZndDsmIzMyOzMuRGVmaW5pdGlvbnMmIzMyO29mJiMzMjtzdXBwb3J0ZWQmIzMy
O2ltYWdlJiMzMjtmb3JtYXRzJiMzMjtmb3ImIzMyO3Byb3BlciYjMzI7ZGF0YSYjMzI7aGFuZGxp
bmcuDQomZ3Q7JiMzMjs0LklQSSYjMzI7YW5kJiMzMjtTQ1AmIzMyO2NvbW11bmljYXRpb24mIzMy
O3N0cnVjdHVyZXMmIzMyO2ZvciYjMzI7bW9kdWxlJiMzMjtzdGF0ZSYjMzI7bWFuYWdlbWVudCYj
MzI7YW5kDQomZ3Q7JiMzMjtjb25maWd1cmluZyYjMzI7SVNQLg0KJmd0OyYjMzI7NS5NZXRhZGF0
YSYjMzI7cGFyYW1ldGVycyYjMzI7Zm9yJiMzMjtjb25maWd1cmluZyYjMzI7aW1hZ2UmIzMyO3By
b2Nlc3NpbmcuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTaHUtaHNp
YW5nJiMzMjtZYW5nJiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbSZndDsNCiZn
dDsmIzMyOy0tLQ0KDQpbc25pcF0NCg0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2VudW0mIzMyO210
a2NhbV9pcGlfcmF3X3ZpZGVvX2lkJiMzMjt7DQoNCkl0JiMzOTtzJiMzMjtiZXR0ZXImIzMyO3Rv
JiMzMjt1c2UmIzMyOyYjMzk7c2NwJiMzOTsmIzMyO2luc3RlYWQmIzMyO29mJiMzMjsmIzM5O2lw
aSYjMzk7Lg0KVGhlJiMzMjtpbnRlcmZhY2UmIzMyO2lzJiMzMjtwcm92aWRlZCYjMzI7YnkmIzMy
O3NjcC4NCmlwaSYjMzI7anVzdCYjMzI7dHJhbnNmZXImIzMyO2RhdGEmIzMyO2JldHdlZW4mIzMy
O210a2NhbSYjMzI7YW5kJiMzMjtzY3AmIzMyO2FuZCYjMzI7aXBpJiMzMjtkb2VzJiMzMjtub3Qm
IzMyO2NhcmUmIzMyO3RoZSYjMzI7ZGF0YSYjMzI7Y29udGVudC4NCg0KJmd0OyYjMzI7K01US0NB
TV9JUElfUkFXX0lEX1VOS05PV049JiMzMjswLA0KDQpEaXR0by4NCg0KJmd0OyYjMzI7K01US0NB
TV9JUElfUkFXX1JBV0lfMiwvKiYjMzI7UkFXSV9SMiYjMzI7Ki8NCg0KRGl0dG8uDQoNCiZndDsm
IzMyOytNVEtDQU1fSVBJX1JBV19SQVdJXzMsLyomIzMyO1JBV0lfUjMmIzMyOyovDQoNCkRpdHRv
Lg0KDQomZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9SQVdfUkFXSV81LC8qJiMzMjtSQVdJX1I1JiMzMjsq
Lw0KDQpEaXR0by4NCg0KJmd0OyYjMzI7K01US0NBTV9JUElfUkFXX1JBV0lfNiwvKiYjMzI7UkFX
SV9SNiYjMzI7Ki8NCiZndDsmIzMyOytNVEtDQU1fSVBJX1JBV19JTUdPLC8qJiMzMjtJTUdPX1Ix
JiMzMjsqLw0KJmd0OyYjMzI7K01US0NBTV9JUElfUkFXX1VGRU8sLyomIzMyO1VGRU9fUjEmIzMy
OyovDQomZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9SQVdfUlJaTywvKiYjMzI7UlJaT19SMSYjMzI7Ki8N
CiZndDsmIzMyOytNVEtDQU1fSVBJX1JBV19VRkdPLC8qJiMzMjtVRkdPX1IxJiMzMjsqLw0KJmd0
OyYjMzI7K01US0NBTV9JUElfUkFXX1lVVk9fMSwvKiYjMzI7WVVWT19SMSYjMzI7Ki8NCiZndDsm
IzMyOytNVEtDQU1fSVBJX1JBV19ZVVZPXzIsLyomIzMyO1lVVk9fUjImIzMyOyovDQomZ3Q7JiMz
MjsrTVRLQ0FNX0lQSV9SQVdfWVVWT18zLC8qJiMzMjtZVVZPX1IzJiMzMjsqLw0KJmd0OyYjMzI7
K01US0NBTV9JUElfUkFXX1lVVk9fNCwvKiYjMzI7WVVWT19SNCYjMzI7Ki8NCiZndDsmIzMyOytN
VEtDQU1fSVBJX1JBV19ZVVZPXzUsLyomIzMyO1lVVk9fUjUmIzMyOyovDQomZ3Q7JiMzMjsrTVRL
Q0FNX0lQSV9SQVdfUlpIMU4yVE9fMiwvKiYjMzI7UlpIMU4yVE9fUjImIzMyOyovDQomZ3Q7JiMz
MjsrTVRLQ0FNX0lQSV9SQVdfRFJaUzROT18xLC8qJiMzMjtEUlpTNE5PX1IxJiMzMjsqLw0KJmd0
OyYjMzI7K01US0NBTV9JUElfUkFXX0RSWlM0Tk9fMiwvKiYjMzI7RFJaUzROT19SMiYjMzI7Ki8N
CiZndDsmIzMyOytNVEtDQU1fSVBJX1JBV19EUlpTNE5PXzMsLyomIzMyO0RSWlM0Tk9fUjMmIzMy
OyovDQomZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9SQVdfUlpIMU4yVE9fMywvKiYjMzI7UlpIMU4yVE9f
UjMmIzMyOyovDQomZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9SQVdfUlpIMU4yVE9fMSwvKiYjMzI7UlpI
MU4yVE9fUjEmIzMyOyovDQomZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9SQVdfTUVUQV9TVEFUU19DRkcs
LyomIzMyO0FsbCYjMzI7c2V0dGluZ3MmIzMyOyovDQomZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9SQVdf
TUVUQV9TVEFUU18wLC8qJiMzMjtzdGF0aXN0aWNzJiMzMjsqLw0KJmd0OyYjMzI7Kw0KJmd0OyYj
MzI7Ky8qDQomZ3Q7JiMzMjsrJiMzMjsqJiMzMjtNVEtDQU1fSVBJX1JBV19NRVRBX1NUQVRTXzEm
IzMyO2lzJiMzMjtmb3ImIzMyO0FGTyYjMzI7b25seSwmIzMyO3RoZSYjMzI7YnVmZmVyJiMzMjtj
YW4mIzMyO2JlDQomZ3Q7JiMzMjsrJiMzMjsqJiMzMjtkZXF1ZXVlZCYjMzI7b25jZSYjMzI7d2Um
IzMyO2dvdCYjMzI7dGhlJiMzMjsmIzMyO2RtYSYjMzI7ZG9uZS4NCiZndDsmIzMyOysmIzMyOyov
DQomZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9SQVdfTUVUQV9TVEFUU18xLA0KJmd0OyYjMzI7Kw0KJmd0
OyYjMzI7Ky8qJiMzMjtzdGF0aXN0aWNzJiMzMjttYXkmIzMyO2JlJiMzMjtwYXNzJiMzMjt0byYj
MzI7RElQJiMzMjsqLw0KJmd0OyYjMzI7K01US0NBTV9JUElfUkFXX01FVEFfU1RBVFNfMiwNCiZn
dDsmIzMyOytNVEtDQU1fSVBJX1JBV19JRF9NQVgsDQomZ3Q7JiMzMjsrfTsNCiZndDsmIzMyOysN
CiZndDsmIzMyOysvKiYjMzI7U3VwcG9ydGVkJiMzMjtiYXllciYjMzI7cGl4ZWwmIzMyO29yZGVy
JiMzMjsqLw0KJmd0OyYjMzI7K2VudW0mIzMyO210a2NhbV9pcGlfYmF5ZXJfcHhsX2lkJiMzMjt7
DQoNCkRpdHRvLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7K01US0NBTV9JUElfQkFZRVJf
UFhMX0lEX0I9JiMzMjswLA0KJmd0OyYjMzI7K01US0NBTV9JUElfQkFZRVJfUFhMX0lEX0dCPSYj
MzI7MSwNCiZndDsmIzMyOytNVEtDQU1fSVBJX0JBWUVSX1BYTF9JRF9HUj0mIzMyOzIsDQomZ3Q7
JiMzMjsrTVRLQ0FNX0lQSV9CQVlFUl9QWExfSURfUj0mIzMyOzMsDQomZ3Q7JiMzMjsrTVRLQ0FN
X0lQSV9CQVlFUl9QWExfSURfVU5LTk9XTj0mIzMyOzQsDQomZ3Q7JiMzMjsrfTsNCiZndDsmIzMy
OysNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0t
PjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioq
KioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWls
IG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlh
bCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlz
Y2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29u
dmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3Nl
bWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcg
b2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRl
ZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdm
dWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwg
b3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0
aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0K
ZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4g
VGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_1891130268.2124338892--


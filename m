Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEFC95ACF4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 07:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B4210E716;
	Thu, 22 Aug 2024 05:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="siKLzp0+";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="S+7EmOxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077E010E716
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 05:39:47 +0000 (UTC)
X-UUID: ec5956d8604811ef8b96093e013ec31c-20240822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=YVdnLpE1WFrOfRnJHiwfaQsV08dgoilfwQr2G5z+U9Q=; 
 b=siKLzp0+IZlTd9VqFmrulnfDFG2EUmvXrtyQD6waOgHcX2dd4VImNjirBvEP+IvNbCqPziy50V0+xCfaVdF+E09ejOTKlW/yjXBhU5itDF817MomqQgxTuGM5HmAHLZHZ+HUnzZuSTQskSoHU+dIdqofLxg0nmhV7fAu/gz9M34=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:e732f853-ee22-4d7c-b421-60163e581083, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:7b74bfbe-d7af-4351-93aa-42531abf0c7b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: ec5956d8604811ef8b96093e013ec31c-20240822
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 13840035; Thu, 22 Aug 2024 13:39:39 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 22 Aug 2024 13:39:36 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 22 Aug 2024 13:39:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJX+inIsUyJGXnYMEZRUJjrxVk/Vazsmr/ru84zc4+v5Q2hCmu9XhbmtzA4Ubr1eCEEB2tgLOgySoKZZ0Q8mQQqBg1FXE6z8eaVlKYMvNHu3WKPe6+uwTSJiVL+15WxmpVR1LQLqJEWSdaY6pG3Lc0rw/D2xmkC4wWjWxOoqI9oQTcCMVVWxOmGEF5u2oc312JAuRo9kcRVZOywIDI1Wz8ftWfhjQZpL4x2JU22da4ILU8oEHHC7K3xAbMuv/8jAFPUTKoOcgbfwZzHauxw9U1LqbKfkk11UJ7Z9Jf3dL53vOaIVK0dJgp6aaHlOqscXzKyU0yP70opISTMa/ehawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRVChF+FzHifV/7cTXg3dfCX0Ck9rhqsb/Q2WJYD2s4=;
 b=LGmXwamTxvUaKwx/ny6g2hyqzijBs26wnnHuW9GpvBqmDZCbH8qZOv0jAzupwIhJ552k9sRhiGYjjNaJqZitOVNkoHYYlsOYrcQfbPxcuQAKk+eN4gkH03i8kZ9hQa8KIQsGlBEOEjeGeai7Kyaxuz1++xuofq7Nf5EyDoCEobONbsqOi7vl/C0DGbaW+3BliZzUQlVxngcygu8VycdbIPlcQlaQEvh+Ik2wLcHKt1kXin3LFhNoVvkWHw/dJPVnZGedKuYgbEZeuFDWxo8bexo1+6iLEn/1d6pW8DjfFei4QRbsKkTm+RFhLIKftfwgES7ewOMXqAC0jfMYbIENpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRVChF+FzHifV/7cTXg3dfCX0Ck9rhqsb/Q2WJYD2s4=;
 b=S+7EmOxRFWjcIC1TV7PvJZ+1DDk+XKKOqrWcfGJnVhcWojS61JANjF8CDOZjJBOZTTethoA8uEE/69B6mCXNWVHwRKFvmbj7/xsnGi2ihcpf4EbbBkxV3lCcRjCP9443i60P7rNBGJoEDZaX/do102d9VNxojkHkNGLkL6PnBGQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8743.apcprd03.prod.outlook.com (2603:1096:101:201::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 05:39:34 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 05:39:33 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>
Subject: Re: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Topic: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLIzOB2A
Date: Thu, 22 Aug 2024 05:39:33 +0000
Message-ID: <54d1940f7bf76d1e8bb5cdca14a8182ddb886014.camel@mediatek.com>
References: <20240608120219.21817-1-mac.shen@mediatek.com>
 <20240608120219.21817-3-mac.shen@mediatek.com>
In-Reply-To: <20240608120219.21817-3-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8743:EE_
x-ms-office365-filtering-correlation-id: c49bfd40-96cd-4371-1abc-08dcc26ccd5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NC9ZK1VQM2ltUjFCQndSZEtPN2IrM3IxbE1iQ1NnRzRZcXFiRXpBQmZiMFNs?=
 =?utf-8?B?a1NoN01sZEdscTVJR3FjQlBVNmVXaTN3U0pSS3I1SllYSkRTeWVyLy93ZlJO?=
 =?utf-8?B?U3h2VEcrcEUxOTBtSjF3cHBYZ1FDaW5PQkhEVy81NkwzMTdac0FWL3pjekF6?=
 =?utf-8?B?WmVMeVZ6YVV3ZWFxdU5PN0M5cC94dWx5eXVSZWh2YkRMenFBaFRJVjg5MnZL?=
 =?utf-8?B?bDdTVFpMbEg2Q3NhcHRFYTA2TlpXUkVQNDN1RjRSSml3YVBpQlMvWWM5VnhT?=
 =?utf-8?B?R042WmtUU1NHbGJNNDRHR3p3VWx0akQvQ1MvSU53ZFVRMy92bUJOVTh6QlNU?=
 =?utf-8?B?SUt6VVFzdjQ0NkYyc0dlaVZrak04d29iN0k3djBEUXRCNTkvYzdYVGR4UWMz?=
 =?utf-8?B?WmswaTBXczdCVXp0YkZnMTNOQ3Z0amU2cWZGMFdNbEdEczZqYzFIRlY3NDE2?=
 =?utf-8?B?dUMyK0U2VjdaaUpJak9VQWVDcjhKeHRxdGhIZ1doM1p6YTVBVzFZb3hVQWRy?=
 =?utf-8?B?aWV2T0EvSmhrRXh3YVJyZUcwek1MRW11K2dweHlXWDRxUVByeEFpVzF0NWFr?=
 =?utf-8?B?OWhEck43NmYyREZ2bGM4b2ZOblBaS3N1UDg0eXN4cGV1bTIxRWdvakE3Rjk2?=
 =?utf-8?B?bjJMM1I4MzBCUUtMemFDNTJxamhyN3pNRG5YaFUxY0Jxa3h3cXNCZFBKRlgv?=
 =?utf-8?B?UGJuUFYvS2dZTTN2TFp1MjN6enY5L1ZPR3B6S0tGSDJZSUZ6cXdjTUZjZ1Y5?=
 =?utf-8?B?c0hCNkR6ZmN0R2ltZU03RzA0NWV3VjBQaXJZMFhaL0JuakFULzJyOG1TcnFJ?=
 =?utf-8?B?RlptMjdrYTJ1Z0F1bk4vVW5Cd0U2Y3Z5cituekVvaWJRT2pwc0UrQjI3SE5q?=
 =?utf-8?B?SisyYXZwUWU0LzRtTWJyaFdlK21LK0dkSkhOZXhnZlMzaGZjanJtY01XUHZ1?=
 =?utf-8?B?UjkrdG5XVUlNWnNxWlZLbmFwQTI0cHVqdkRxOVQ2dWdtdWdoMUtKa0tJN3A5?=
 =?utf-8?B?REdoWFpNUFM1WkpUL3RtR0Z2cGprVzFzOWpSUDNUS3Y4bWZmUlgwbmFqOTg1?=
 =?utf-8?B?SG1XdXdzVGxmMXcyL3I3eUF2Yzh5L015NTRReXlrOHRTSFdlUWlHWTRUaStn?=
 =?utf-8?B?MzJ5NGZLQ0FWNjgvdTNVcEJiNlorWkU4aVhVMVNFczFjbTgrcG8vTHdUMU51?=
 =?utf-8?B?RmI2Sjh2VWFkTUlaK3FHMTF0dm1zb0ltdWpodXhsZVRjMjlhWHZnSXkrdzhG?=
 =?utf-8?B?TmpVN0E0T2VKM2p0d0FuREExT0NkTVNVMGY1cFpsYXBITnJZcnMzZTlRbzBK?=
 =?utf-8?B?R29YQXArWHMranJhOGYwZG1TU1BIU2FPK2ZqQzR4RmR3QmF1OC9OMTEyVk93?=
 =?utf-8?B?Titmb1Z5Yk9abTdqdFJSY1l5S2JJMnhXeGN1SGxqOWhRS1ZKamozVHh3bFdj?=
 =?utf-8?B?WVZIR3VlUzI1Q2E3K1pMNzBYdDVoc2pvdEprVEdkd1RjZmk4Z01meXZ6TXVm?=
 =?utf-8?B?b2JHMUI2cnl3dVdNWUxQUURWUTlXOFc4azV6NGNOdlpOY0YzbmpMbXpWcmJF?=
 =?utf-8?B?MFNwa2pBS2Ruem1ha1FkWEZ4M1FTTjlZZlMrTzJHOGFvNkZDRzkzSnpCMUdH?=
 =?utf-8?B?cWhZY2plSTJWUUZ1RTBxemZIZHlsdEJneWI0OHY1VVVMdWpBRVIwcitIam9B?=
 =?utf-8?B?VUorcU55NFM0YXhVYU9GUkFkUmxPTTladXl3NHNSUE9neUk2K2UwZUxpdS9Q?=
 =?utf-8?B?OVJiRzM1YWRZVmtuSFFHU1VHenRwckV4c1RjbFZjWThjZVRhRjhoMGJLYlU5?=
 =?utf-8?B?eCtjdDFEVjZFM0h2UzNlZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUJ2TXlwK002RlhGM2UwMGxtam5yWWVueUE5aWtDVlFYK1M4cTA1ekpWekk0?=
 =?utf-8?B?L1ZsYjNLVFh1R2I4NnJxZkJiektZaEgwZkI5M3BBTmorN3hwL042MjhPcEQ3?=
 =?utf-8?B?SElJeGY3RkUwNVBndVROVTgxOEtxM3FtSXN1UlRmemVSaWpnMWVSZVg0ZDl3?=
 =?utf-8?B?WWdCMHRmb2pkSFBTa3UvSEZHaVJPMHFHRFhxdmlRVnp4N2JTRUN4ZjdVYmpB?=
 =?utf-8?B?d2I0NG96V1hSMlFtSFNHZ280djVRdmJralNQTmJaU3E1cU0vTGVZR3BGVWdW?=
 =?utf-8?B?dWlWbzZJSTlRYTdvem1lM2Z4S2ZaLzBHMzR2U3E2MlVZSGJkcFh0emRRM25p?=
 =?utf-8?B?c3kwNXhNR1pJTnVvYVEvQ1JOVXlxNTFpVUxHb1VUZ1lyMmxMdkhQcGhGQlJI?=
 =?utf-8?B?bWpkU29YTEE2QWgxQ1NtU3hXOFlBZlVCa05BUVRZcE16YW1yMHFUOGJBWGFC?=
 =?utf-8?B?dlJyVVExNE53VjV1WXp3SldoSWxqTHdndnRyaE0rNkRQdlNTaVJUSjBCaW9h?=
 =?utf-8?B?RUNVK3RBdjJ0dnk5dG9iNVUzc25xbGNTM3h6WTF6c0tIL1VXZFQxYWFHUGxU?=
 =?utf-8?B?VW1qMzhleTB1bE5tM1NmOE83b0xNTWFLbDZsVE9FWERsYktuVk1XRnJXTnhh?=
 =?utf-8?B?eFJiN21xdWVUUm5HcWV4YXdHeVZYWFVTTmMvamxGQzVwaHk0enhYMGh2R0FX?=
 =?utf-8?B?UVFEUnpOOGowdnIxdWcyTmtBNlk3WVRTcTRyUDUxaWdyTldqZ3NGc2g3UjNu?=
 =?utf-8?B?enR6R09zWEhGSnhMT1VMTVdWNWIyeXVpNVJpQzIwNmxqdmxyNnoxSUZqSFhM?=
 =?utf-8?B?S2JQV1UralJ1a2VUWC9DcXRyRktJcHBJWU55bzlib1lpRzFBVEZLVUdSc0Fj?=
 =?utf-8?B?SURjTVArZmJIMXEwaGFhd245SEZqNW1zekU3M216VjZaM3ZYRzRwQkl4NTJ2?=
 =?utf-8?B?bTdLMnQ3c2FxNWtadEhPZW9TV1AxU3VtU3BoZ2VwNit4WlgvanlqYnJDdFk0?=
 =?utf-8?B?WnM2OGRuWlY2ZmxqSFY2U05MUU9NUWpKRkloejlDdkFSc0RSbTlsRk1oN1BY?=
 =?utf-8?B?YlJLc05RaGVNRWt1MnhkR1EyRmNoSFBHVG9BYXFzRitxaTdLcXAwMnVRN24x?=
 =?utf-8?B?OFZmQ25BdC8rRlZGeVpzTzlORnJjSWxrNHN5ZzJkL3FiUUZVcGo3QmtWYnFj?=
 =?utf-8?B?UlBud2hlN3gvS0hjbXVCYVpMN3l5V0V3MGRibTNGcjVxN202MzMrL1h2UmEy?=
 =?utf-8?B?R3VkMnFpdjFEWnZhS0EySWkyQnRJOGY5N2JNVUYzbk15ZXdyQ1B3YUlXMHJx?=
 =?utf-8?B?OTc3LzNFKzRBdjN0bENKazBtb3FQckg5WVp6NFZmQ2Y2QjJSa3JiK2pISnpC?=
 =?utf-8?B?SU5vTDJ6aDA2ZCtNNHc5OEVrUzFsaDEwSG9lbU1EUFpVdXlBUS9Rd2s0d0FD?=
 =?utf-8?B?akdMYXFobHM1U0JXWWVSVnFHM01qSjEvQTNCTFpwbXZpYWVUQjJhQ1BRS2Yy?=
 =?utf-8?B?YnphbVNuN2RsSUVSZkp5ZUhEcjAxTTl0R1pkck5nb1Y0T2lqTi9nNGl3cHdT?=
 =?utf-8?B?UDYwMmdHYUVOSDg2MWxnNlpKTHh3VUgwbytwc3hXM1B5SzhBRTdtSjVTeWVZ?=
 =?utf-8?B?c1FlVlk5RmJjUVFIZDN3MEVSYU9YcG5pT0NZQlJCTDhnOVcvTXhVZCtyRENv?=
 =?utf-8?B?NHB6UmhTenNBR2JHbG50NXU3eDlzNkdXV0VydThOd01yNnNmWmtnSXMya0Zl?=
 =?utf-8?B?eDhxenVoQW1oMm1TWnU5Z1k1eFpjb3AvUy9CR0lCTTNEb2p6eDZBTkZZQjNP?=
 =?utf-8?B?K3ZGWDV1M2tLc3RWbkNZRFdGRDY4SWdmVng0RmFEQkxxa1dYdG5OUElNMkpR?=
 =?utf-8?B?azJVTlNVWkw4WWw0bzMyQllKa1BvaHozbFRnREtWMDZnMzJ3SnV3eWZZRkJV?=
 =?utf-8?B?eEd0aEJTQmwrTCtPWllaTXVKRnpVc3ZjYS9taEF0ZytidzFmOThQcjA2Z2dV?=
 =?utf-8?B?TUJEN09HdXN0Y3dZN05CVnhPODFBU1l5dFZ0QnA4bXFPOVpYczQxMmw3RkYw?=
 =?utf-8?B?NUhuZVMvakRBSmlCcGJ2MElwS3JoSkpzV2ZDTjNhZFJjMXJMZXNLUE5xWWEv?=
 =?utf-8?Q?F8Dxok+Z4zy7lwnMUUvJWnqGa?=
Content-ID: <D0D65883BE511042897016DB88028695@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c49bfd40-96cd-4371-1abc-08dcc26ccd5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 05:39:33.6909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGXexvI6/RPjkiFQUAs48QCEhruMBJXwp6ndFEQere3RivmF9aBxQe0PS7L5lUQ1NsbHa+dPHeVFigbVy/vHUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8743
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.229500-8.000000
X-TMASE-MatchedRID: nVQUmLJJeybPaPH51LTU5Ca1MaKuob8PC/ExpXrHizxXA7rTaHAw771A
 /V6RVDjDMqtZwXDJcJxiPmy8WTo67rNUVnqixiMOGVyS87Wb4lzSv+oK79xjnUYvSDWdWaRh8ha
 W4U9IrFpRUHsj/YINIP1/2RbvJIzKvYtt39hpnmNIcJTn2HkqsX0tCKdnhB58pTwPRvSoXL2y5/
 tFZu9S3Ku6xVHLhqfxWBd6ltyXuvsi/ZNJbTN45ymg6lJh7yHE+swYuf+kAJBdMPax/FQYv5c8/
 O+GVXSzd/HtG+CkAqwfHtRigc6eVGIVeydjaqXvSnQGMyakHij8DYAMxfNdesTcZRBQ3ORlx7TA
 T/418tn4dFDMTTdqtlRjIYeif4m6ftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.229500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E3E8C08AE2276C1F9F901FCD8D352A4DE7050A6BFA019596FE66A8F36F6CB61C2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1109115686.1193033379"
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

--__=_Part_Boundary_006_1109115686.1193033379
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gU2F0LCAyMDI0LTA2LTA4IGF0IDIwOjAxICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSByZWZpbmUgdGhlIGZ1bmN0aW9uIHRvIGdldCBz
eXN0ZW0gdGltZQ0KPiAtIHJlZmluZSB0aGUgZmxvdyB0byBkbyBIRENQIHdpdGggY29udGVudCB0
eXBlIGFuZA0KPiAgIHByb3RlY3Rpb24gdmFsdWUgd2hpY2ggc2V0IGJ5IHVzZXIgc3BhY2UNCj4g
LSByZWZpbmUgdGhlIGZsb3cgdG8gdXBkYXRlIGNvbnRlbnQgcHJvdGVjdGlvbg0KPiAtIHJlZmlu
ZSB0aGUgZmxvdyB0byBkbyBIRENQMi54IGF1dGhlbnRpY2F0aW9uDQo+IHBlciBzdWdnZXN0aW9u
IGZyb20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRla19fOyEh
Q1RSTktBOXdNZzBBUmJ3IW1kNnhVaVlOODhEMlltRVRzOEZRZ2FFeE0yekg4UzFTbUFFVTlHUmNo
d3BOc1hPeURGdWwzemlWS2hScENKYWo4UmNuLWd2TS04MDFydW5qd0EkIA0KPiAvcGF0Y2gvMjAy
NDAyMDUwNTUwNTUuMjUzNDAtMy1tYWMuc2hlbkBtZWRpYXRlay5jb20vDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBtYWMuc2hlbiA8bWFjLnNoZW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBd
DQoNCj4gKw0KPiArc3RhdGljIGludCBkcF90eF9oZGNwMnhfd3JpdGVfbGNfaW5pdChzdHJ1Y3Qg
bXRrX2hkY3BfaW5mbyAqaGRjcF9pbmZvKQ0KPiArew0KPiArCXN0cnVjdCBtdGtfZHAgKm10a19k
cCA9IGNvbnRhaW5lcl9vZihoZGNwX2luZm8sIHN0cnVjdCBtdGtfZHAsIGhkY3BfaW5mbyk7DQo+
ICsJc3NpemVfdCByZXQ7DQo+ICsNCj4gKwlkZXZfZGJnKG10a19kcC0+ZGV2LCAiW0hEQ1AyLlhd
IEhEQ1BfMl8yX0xDX0lOSVRcbiIpOw0KPiArDQo+ICsJcmV0ID0gZHJtX2RwX2RwY2Rfd3JpdGUo
Jm10a19kcC0+YXV4LCBEUF9IRENQXzJfMl9MQ19JTklUX09GRlNFVCwNCj4gKwkJCQloZGNwX2lu
Zm8tPmhkY3AyX2luZm8uaGRjcF90eC5sY19pbml0LnJfbiwgSERDUF8yXzJfUk5fTEVOKTsNCj4g
KwlpZiAocmV0IDwgMCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXJldHVybiAwOw0KDQpU
aGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBvbmx5IGJ5IGRwX3R4X2hkY3AyeF9sb2NhbGl0eV9jaGVj
aygpIGFuZCB0aGlzIGZ1bmN0aW9uIGp1c3QgZG9lcyBvbmUgdGhpbmcuDQpTbyBtZXJnZSB0aGlz
IGZ1bmN0aW9uIGludG8gZHBfdHhfaGRjcDJ4X2xvY2FsaXR5X2NoZWNrKCkuDQoNClJlZ2FyZHMs
DQpDSw0KDQo+ICt9DQo+ICsNCg==

--__=_Part_Boundary_006_1109115686.1193033379
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtTYXQsJiMzMjsy
MDI0LTA2LTA4JiMzMjthdCYjMzI7MjA6MDEmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7Q2hhbmdlcyYjMzI7aW4mIzMyO3YzOg0KJmd0OyYjMzI7LSYjMzI7cmVm
aW5lJiMzMjt0aGUmIzMyO2Z1bmN0aW9uJiMzMjt0byYjMzI7Z2V0JiMzMjtzeXN0ZW0mIzMyO3Rp
bWUNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93JiMzMjt0byYjMzI7ZG8m
IzMyO0hEQ1AmIzMyO3dpdGgmIzMyO2NvbnRlbnQmIzMyO3R5cGUmIzMyO2FuZA0KJmd0OyYjMzI7
JiMzMjsmIzMyO3Byb3RlY3Rpb24mIzMyO3ZhbHVlJiMzMjt3aGljaCYjMzI7c2V0JiMzMjtieSYj
MzI7dXNlciYjMzI7c3BhY2UNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93
JiMzMjt0byYjMzI7dXBkYXRlJiMzMjtjb250ZW50JiMzMjtwcm90ZWN0aW9uDQomZ3Q7JiMzMjst
JiMzMjtyZWZpbmUmIzMyO3RoZSYjMzI7ZmxvdyYjMzI7dG8mIzMyO2RvJiMzMjtIRENQMi54JiMz
MjthdXRoZW50aWNhdGlvbg0KJmd0OyYjMzI7cGVyJiMzMjtzdWdnZXN0aW9uJiMzMjtmcm9tJiMz
Mjt0aGUmIzMyO3ByZXZpb3VzJiMzMjt0aHJlYWQ6DQomZ3Q7JiMzMjtodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1l
ZGlhdGVrX187ISFDVFJOS0E5d01nMEFSYnchbWQ2eFVpWU44OEQyWW1FVHM4RlFnYUV4TTJ6SDhT
MVNtQUVVOUdSY2h3cE5zWE95REZ1bDN6aVZLaFJwQ0phajhSY24tZ3ZNLTgwMXJ1bmp3QSYjMzY7
JiMzMjsNCiZndDsmIzMyOy9wYXRjaC8yMDI0MDIwNTA1NTA1NS4yNTM0MC0zLW1hYy5zaGVuQG1l
ZGlhdGVrLmNvbS8NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO21hYy5z
aGVuJiMzMjsmbHQ7bWFjLnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltz
bmlwXQ0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtpbnQmIzMyO2RwX3R4X2hk
Y3AyeF93cml0ZV9sY19pbml0KHN0cnVjdCYjMzI7bXRrX2hkY3BfaW5mbyYjMzI7KmhkY3BfaW5m
bykNCiZndDsmIzMyOyt7DQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdGtfZHAmIzMyOyptdGtfZHAm
IzMyOz0mIzMyO2NvbnRhaW5lcl9vZihoZGNwX2luZm8sJiMzMjtzdHJ1Y3QmIzMyO210a19kcCwm
IzMyO2hkY3BfaW5mbyk7DQomZ3Q7JiMzMjsrc3NpemVfdCYjMzI7cmV0Ow0KJmd0OyYjMzI7Kw0K
Jmd0OyYjMzI7K2Rldl9kYmcobXRrX2RwLSZndDtkZXYsJiMzMjsmcXVvdDtbSERDUDIuWF0mIzMy
O0hEQ1BfMl8yX0xDX0lOSVQmIzkyO24mcXVvdDspOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3Jl
dCYjMzI7PSYjMzI7ZHJtX2RwX2RwY2Rfd3JpdGUoJmFtcDttdGtfZHAtJmd0O2F1eCwmIzMyO0RQ
X0hEQ1BfMl8yX0xDX0lOSVRfT0ZGU0VULA0KJmd0OyYjMzI7K2hkY3BfaW5mby0mZ3Q7aGRjcDJf
aW5mby5oZGNwX3R4LmxjX2luaXQucl9uLCYjMzI7SERDUF8yXzJfUk5fTEVOKTsNCiZndDsmIzMy
OytpZiYjMzI7KHJldCYjMzI7Jmx0OyYjMzI7MCkNCiZndDsmIzMyOytyZXR1cm4mIzMyO3JldDsN
CiZndDsmIzMyOysNCiZndDsmIzMyOytyZXR1cm4mIzMyOzA7DQoNClRoaXMmIzMyO2Z1bmN0aW9u
JiMzMjtpcyYjMzI7Y2FsbGVkJiMzMjtvbmx5JiMzMjtieSYjMzI7ZHBfdHhfaGRjcDJ4X2xvY2Fs
aXR5X2NoZWNrKCkmIzMyO2FuZCYjMzI7dGhpcyYjMzI7ZnVuY3Rpb24mIzMyO2p1c3QmIzMyO2Rv
ZXMmIzMyO29uZSYjMzI7dGhpbmcuDQpTbyYjMzI7bWVyZ2UmIzMyO3RoaXMmIzMyO2Z1bmN0aW9u
JiMzMjtpbnRvJiMzMjtkcF90eF9oZGNwMnhfbG9jYWxpdHlfY2hlY2soKS4NCg0KUmVnYXJkcywN
CkNLDQoNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0
bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENv
bmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlv
biBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFj
aG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Ig
b3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4g
SXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJl
Y2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50
aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyAN
CmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQg
cmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNl
aXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1t
ZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxs
IGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9t
IHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUt
bWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_006_1109115686.1193033379--


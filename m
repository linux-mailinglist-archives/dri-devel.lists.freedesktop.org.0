Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E787493369F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 08:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACD010E94A;
	Wed, 17 Jul 2024 06:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="QJaEVrRB";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Era01nIX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12C210E94A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 06:06:10 +0000 (UTC)
X-UUID: 9df824a4440211ef87684b57767b52b1-20240717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=6S+XukoQxhKwpLAhUx3f8MFFweZrZ6c80ZBaqCafdtk=; 
 b=QJaEVrRBLooDvZQpd/NbxW4+vdj2Pn7xR/HMJLWBf1zFrP5zDm+Ocw26FPZLJ15S469ZP8HlHOlMxrGdrgj/EnLfaBKLHNO6QIzicIBh0X8gioF67TqrUAvpoDHzjhFJbHA1zoeGhmG+Vm89HF8rSXgfC9ajBGOm2r+9BT8mnOY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:29352191-8884-4274-a175-b50dcd066675, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:ba885a6, CLOUDID:ba016545-a117-4f46-a956-71ffeac67bfa,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9df824a4440211ef87684b57767b52b1-20240717
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 92772001; Wed, 17 Jul 2024 14:05:50 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 Jul 2024 14:05:51 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 Jul 2024 14:05:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REhAOktVgzZjGpF6I69k782eOL8BCThfzcea/3gidFBVuAg8Jl/eNmL6GO8mgKjG8OW1bmvw1aXGxXk0ZgwCMPkBIjOzEnL1uiNg2He5e3ZHotuPC1ks5HCA+XQYefJxBjDnOUtS9LkCu3UMkjiQzXz0EXCr4eKIQNKezGi1/iBccpmuk+JzFbMn/JVyHqKZ2UaZnVbFnc5X4EzWpEIDLizFDastenYb6NeKp4fL10qClsvun0K3+8Xh3eP8Uw6um1qOJypKiGZsFjXf/UxSGRHWDF7fwkFscr3Oc/CrmuEzTN4wFZMBO9DaL+Qo1LVB9tGgZnX5x6CkJ5wskx7IfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26DAAH8oq7H7Fn9zVByt3HQ/aVnhxokBjn4s6EBcID8=;
 b=YZrbIAUZI+RzbbPFSDOIH85+ygeFb845DtQqFEkzrr7s8V7s/EcYST6jKXWj7p4NKp4+Usrde3A0zzmmvbGRCXUwz8uW0ph2zoSYLbZWeldhhQ+PrwsahETgqi4TI9smptCM1y7n2FnuQ4OxofCBphXvCORzbfdo7H0xph58+ITO11xc8B3Ni/+Aj4458TfqDxoNb67uF7OExn1koUCAPUy5+4MVQvB6pfeMMnKkDpySHkqfWQecHvrH2OVaaqQ24EtPa8lnRCN8mwTeafRHQGtpxeR8Rok7WOVPbc7cFaKkmn/mjPqBlXpfPfbeWVX1ZmifjoWkXX8exwW+KlFomg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26DAAH8oq7H7Fn9zVByt3HQ/aVnhxokBjn4s6EBcID8=;
 b=Era01nIXp2KuYqQXUfWdxV42HWg9EkJTauRwt5HvgSimHnChYKmFMeHBK1rqKF9WZ8Umk9CA/VkGnEbjXhXcPON0GImU0XBPt1X+PhddncA50hLppFS4wI+LZaeCSnu5/rBFytnuQRFyzHNDqI4E0N4qH0yaOHLqNuusv6jX76c=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8100.apcprd03.prod.outlook.com (2603:1096:990:37::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 06:05:49 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 06:05:49 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "shawn.sung@mediatek.corp-partner.google.com"
 <shawn.sung@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v4 4/5] drm/mediatek: Support "Pre-multiplied" blending in
 Mixer
Thread-Topic: [PATCH v4 4/5] drm/mediatek: Support "Pre-multiplied" blending
 in Mixer
Thread-Index: AQHa2Am6qPAC07KkSEyHU+8BkQQ5L7H6bqkA
Date: Wed, 17 Jul 2024 06:05:49 +0000
Message-ID: <821bba3487d4433db05d8ed6817075b63ba4243f.camel@mediatek.com>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
 <20240717-alpha-blending-v4-4-4b1c806c0749@mediatek.com>
In-Reply-To: <20240717-alpha-blending-v4-4-4b1c806c0749@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8100:EE_
x-ms-office365-filtering-correlation-id: db8a7fec-9f9b-4c31-2e1a-08dca6268196
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QTAxbm9yQ0ozL1VFRUZvMlJoNFgvZGx0N0ZLK1lOVVJLNlArc0JBWnM1eDJL?=
 =?utf-8?B?MjBOOTJsazRyVVZoc0Jzc1VPTWM4em1td25CNG5GdlVDOGRlOTZqRTRyRDEv?=
 =?utf-8?B?UjZXcHZCNjJDZ1FvMU5sT1BzZGtyUkNpTzllVjRCQkxnQlhHQkVvRDc0bThj?=
 =?utf-8?B?bmZFZzY5MldVZXdkYlRCekZWWXZyUnRrVDlYSmxRZ3lFY2VRVGhUcU4xcEFH?=
 =?utf-8?B?S3Ixb1owcTAzWlVCS1BjYVpRRTVUSC9sK0FyQUtqbEFBTXdBQjJoMTVuWU1M?=
 =?utf-8?B?ZDNOQVgwdUZhSHRwVWYvQklHeHRCZExrUzBLQlNUM290eVdoZzloMXgzU1BS?=
 =?utf-8?B?eE5qYThVcXdDa0Z1TGg5YzJ5b3pKSTNYYndJclAxZWVHUnpld08rUGc0YVps?=
 =?utf-8?B?NmRuaFU4YmVodk9EclVFU1BLK0dQeThBaXZ5U2VuU1BDNGNTZE9WbExhd0Nq?=
 =?utf-8?B?R0p4ZDJMallncWxaUFFlN3dQZGlGYUdvQVpvKzN4S1JIVHErZ1VZQTFOUzdT?=
 =?utf-8?B?aXlkWlZ4bVpnU2MzVi9MK2pMVHlUYUg1dnZmd1cybThiNTErS0p1SklmVFAv?=
 =?utf-8?B?VzUxYmJVWCtzMlg3OE9JL0RBcE53OVY0TXd0ZnVtZEhOc0J3YkF5M2x0SWd2?=
 =?utf-8?B?OVpkZkxBVm0rV1Q1V1hDSEh1ZmMyZ3JVeDh2cnRpMFpHZUFIWjRDWXV6T2ZD?=
 =?utf-8?B?cGJJbSthL3QrcG9iTndVdnNHV3QvdnlNSVpMcWc2L0w2OGVqVThGdmlZZVJF?=
 =?utf-8?B?UndKalYwUnZXbm5DZDNiOHNEUTdDbWtTVHNZYm9zUzFDMC9RWFdnT01TdGZE?=
 =?utf-8?B?eXhiUEVqeEtiVmsvck1WSllpaHZzV09qcHdHRThQaEs4cEVxSzFiRG1nUURV?=
 =?utf-8?B?dmpTN1NaV242MENHTDUzL2tCUE9QVktFOWtHdDM5NVV4bzUvZ1hFdDltRmt2?=
 =?utf-8?B?QUZmSVplNllxczJ2S0ZEVmUrYndYeXp5T2prQi9sbVJzbVZGcnVsY21WSHhk?=
 =?utf-8?B?QXBWQTdsVnl0S0xDb2V6cXpQREZjeVByMUs1UEowR0Y4OTNnSCtNaFhUc3Vi?=
 =?utf-8?B?em1naStYKzdoTHd3SEVCVW5JRjZ5UjhLbENobFJ5U2owZHFMMUExWU90U0dH?=
 =?utf-8?B?UEs2enRud2x4QmJaYzVJWHVpMVZxOEljQzlGMWhHMHh4Q1VpK1JHdTNlMWU2?=
 =?utf-8?B?dHFVa3c2N1ZrdkJFMWRvbUdGV1pzY0VMckZ6L2l0K01qMnM1NGlBaXpkR2Z4?=
 =?utf-8?B?ZW1xS1NvaVR0L2R3Z2xNVmNjOU5mZG5JUjdaQStZTmFUbVZaYVE2WmptQVBr?=
 =?utf-8?B?SVRjb2VsRmJMS2xzK1NUeElrcG9DL3hHbWs5QlNUQ2VKZkJKOVBxYmNFWWUx?=
 =?utf-8?B?eVJXbkFxMUhpUTVGakdvRGwwaC9NR3FMWm80YnhpQTFlRjdKM3hGZjF2bGN3?=
 =?utf-8?B?R1o3ZWlMUThmWmVVQzloS2N6ek9iMHZtdE9xNGZaUGZBMXY2bUhnQ2t5U1gx?=
 =?utf-8?B?MEhqMUlZVFhwMXBtaGMzS21QTlVzR21xdW4zcnFzcGR1ZWF1ZlpySlM3bUVu?=
 =?utf-8?B?SXZqV3VmVVY0Q09oZTZGODlIMHRwSW9CTVNaMHBtYWRrNUhFbDAzdTB2Wmcv?=
 =?utf-8?B?bFpOckZmamF3SWNQaTFTajVobXlmUkJwc3ByRFRvVCtmVEd6dkFCbWUxM3Zz?=
 =?utf-8?B?NUhmb3ZMdEQwS3M0VEExY2NPemVKQ21RcElveWgwWjZzRllPQStOS0NycTc2?=
 =?utf-8?B?ZDRYS0x5QTQyMzR1eGNOV3V0dXhBTUlIVjhXOEtnNGdEdi9TQlppQzZaalVV?=
 =?utf-8?B?eFZ0R2JzMDRRRDBvNzUyU0N3QndROVcwaHAxN2JuQkVKMFJPM05CcEU3SzZE?=
 =?utf-8?B?OXFVT1RSTGJqSFJDM1YxeGRJOENRUFcvTWJQV0I1M3lOOUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ektZQS85U3REVkIyVWVMR3FiWENtRTNwaGV4S0V1WUJEMDZZRVh6NVdqRUFm?=
 =?utf-8?B?dUNFdkNJejV2aHg4Y2M2eWtKUDFENEJXQmhxQTIwVVZURVhlUC9vWTIrQXM5?=
 =?utf-8?B?OTlWSDJJQVduRXl4RmFwYzVGK3pPY0t6MnZiQWQ2cm1QVVV3YVZsRFBhSFNt?=
 =?utf-8?B?ZVI2WEFQQWpkTGlSbTYzZGsrL2kzZEU5S2VXd3NFZk9MaHBUSmlPN2RKMkJD?=
 =?utf-8?B?dHowQWZjZ3UrZ0t6SWlxcDlFRytYNUw3VUtyV3p5OWo0dkZFZXRHUFZBWWJq?=
 =?utf-8?B?SmhvTlhjclZodDF2YUMyUkJpT3V3bTRXZW5BMnBudmtuejE4d3RQRWxISDRx?=
 =?utf-8?B?eG11QnFSbWhHMFZOektKbEpUOEZURVYxOG84VG41MGtTZjRPclJYVFpEenJU?=
 =?utf-8?B?UlFFL2lCc2o3eDhKeVFhS0RkcXFGUm1rbzV2TFA3Vmp5WTFNREx1ckJCb2Vk?=
 =?utf-8?B?TUI1Q0g5WXRvbVFnSFZtbjRKdU4wZU1FS1pEYndWZlE0QWwrb3NKNklnWTRW?=
 =?utf-8?B?ZnExSDA2VmN4YUFsREF2bmlVWDg1V2ZhdGhuUHVTcW5KQ2xLc0JYc3AwbVlt?=
 =?utf-8?B?dmQ3b2JSTlVZSnRnMjdoMWRuRUdMdkQxSnFDUjFidUdOenNVSWFQUG9wWkVn?=
 =?utf-8?B?Zllqb0RTTlY2cm5OZ3d3bmVrZ0xOSHFhQk9PVlA0R3FldVluSzFBRy9nWGdq?=
 =?utf-8?B?TDVKTkVTaS9PNDRWOUwxZTBra1gxYmRkU1llY2NqclBzaG9HQjZLK2wwckor?=
 =?utf-8?B?RHo3dzhzU3ZicDloQzQ1dVZ2aVNXS1dsd010QktiYW4vbm1HMzNqRFlJdzAw?=
 =?utf-8?B?ZGV3RnlTZVpwM01HdjZXRDJiYmtQRkRpTk1CNU5DenFmbUpzKzEwaFNkeFNC?=
 =?utf-8?B?K3BscWVhQ0k2RmU3UVhuU05YYlRsWnp3b1ZnZERhbFZHR2FtNVdERjNXaTVy?=
 =?utf-8?B?K3Z2S3BRZ1puTytjTEdSUjM3cmxjc242SHhwam0vM0RkckZ2dXNjQUpKeGpt?=
 =?utf-8?B?cndodjc4KzdHazVhMC9EdzY5MXFkckFTUHpQL1dkbFpKOGtIeGdxTnVPWHVk?=
 =?utf-8?B?d1N4Q2VPVGV6OUFweTNtZEVHMG5oMDdvOVZKcUhwY0tvNjZ0VHE0UzNMdWtO?=
 =?utf-8?B?MXpWenVDTVpYbXoyQnhpdGNOZFBTR08wdEc1d2R5RFRWK0R0UWk1bjJkVzZK?=
 =?utf-8?B?ZWgvL09qenViakVBbS9iZHkyMDRYRzhWZ3FGSC82cldFTnNnWjhvbmNxNEkv?=
 =?utf-8?B?OVlvd3F1S0JnZDkrU1NvUWdUbHFMQTVhM2xlbGQ3bkVWSWp4QU1acTBBcC9M?=
 =?utf-8?B?dzBpS1hiZWY4YVd4eTdPWXhKUDQ5ckpjdnZpejEvd1lHUlhLQlRpenB4WVdJ?=
 =?utf-8?B?RzlQYjRyYi83YzRySnJvSXgvMTYvRlhBdlhxd2N5OVh6RVU0NjRGTnVURDNm?=
 =?utf-8?B?SVZnRXRzdGF4bXdORGZTNXB0ampPOWtGYTBlZ01FckdHeU9BQ1dKZHRIa1Uz?=
 =?utf-8?B?UFpSa3JXMm9SVmlaQlNOMW9aZ0RhdmNzc1BXR1I1ZlR3WGVHelN4bWpsaHRO?=
 =?utf-8?B?YzA0c2g5a1FGS085ZDRPSDM4SVdENFhVNG8zTUZwNjlHNUljUEFOS1BSOWdu?=
 =?utf-8?B?Z2NLYW5Kd2wrekNIeUZSelU0dy81TUNvVm94c0JUZ2t2eGpnRVFXaDY4eTR5?=
 =?utf-8?B?VnpnaWpZUnFMQ24waXFieDlXbFV3QTRSc2VmRDE5K0tRZXZ2NHAwQjR5aFBm?=
 =?utf-8?B?cW5ZVWM2cHRNUHpLemZqSFB4OFRxSDJoa2d0NTk1T3lsSzFkdWdEMW1EbmJr?=
 =?utf-8?B?cVJ5SU9CMkt5SDJQSzQ1bi9ub2Y4ckg0bmZ6R3B4dE9ZVXQ2aGVPcXVMOG9R?=
 =?utf-8?B?Q0NpYS8zdlFZOTlWVUtzWkJKaWZhU3ZkODkrU2tneTlzeVVCV1hXamlhUmFV?=
 =?utf-8?B?T05EcFRWY2VYOGVFaFc4M0VCT3g5V2N2TThjZnBZSDdhQW5vL1g5MnNORSsv?=
 =?utf-8?B?eThMSFh1ZkppQk0xbzlZTXVuTjNWTDExbG44d2hFVnZBWEVUQkh6bUlSVXBL?=
 =?utf-8?B?THpnbjV6TDFZSVJtTDVkTmVlTnkyWlE4TnU2ajM2WWY3bFRsT3A0Uk0zNkpL?=
 =?utf-8?Q?O942NHem+GZDlU8SwxUqmf3lc?=
Content-ID: <1D5177F1A134314CB260A7F15A3ED688@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db8a7fec-9f9b-4c31-2e1a-08dca6268196
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 06:05:49.2727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TY5NYMn6Ki8X5nyFQAnQi8S00hqehpNLrFOo2qjQEbeUUjDhEP1DMhAGTXlNl2ekS4Bm071ZZZ80GodcVtS5Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8100
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1566696639.2036006895"
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

--__=_Part_Boundary_004_1566696639.2036006895
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBXZWQsIDIwMjQtMDctMTcgYXQgMTM6MjQgKzA4MDAsIEhzaWFvIENo
aWVuIFN1bmcgdmlhIEI0IFJlbGF5IHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQ
bGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhh
dmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIEZyb206IEhzaWFvIENo
aWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiANCj4gU3VwcG9ydCAiUHJlLW11
bHRpcGxpZWQiIGFscGhhIGJsZW5kaW5nIG1vZGUgaW4gTWl4ZXIuDQo+IEJlZm9yZSB0aGlzIHBh
dGNoLCBvbmx5IHRoZSBjb3ZlcmFnZSBtb2RlIGlzIHN1cHBvcnRlZC4NCj4gDQo+IFRvIHJlcGxh
Y2UgdGhlIGRlZmF1bHQgc2V0dGluZyB0aGF0IGlzIHNldCBpbiBtdGtfZXRoZHJfY29uZmlnKCks
DQo+IHdlIGNoYW5nZSBtdGtfZGRwX3dyaXRlX21hc2soKSB0byBtdGtfZGRwX3dyaXRlKCksIGFu
ZCB0aGlzIGNoYW5nZSB3aWxsDQo+IGFsc28gcmVzZXQgdGhlIE5PTl9QUkVNVUxUSV9TT1VSQ0Ug
Yml0IHRoYXQgd2FzIGFzc2lnbmVkIGluDQo+IG10a19ldGhkcl9jb25maWcoKS4gVGhlcmVmb3Jl
LCB3ZSBtdXN0IHN0aWxsIHNldCBOT05fUFJFTVVMVElfU09VUkNFIGJpdA0KPiBpZiB0aGUgYmxl
bmQgbW9kZSBpcyBub3QgRFJNX01PREVfQkxFTkRfUFJFTVVMVEkuDQoNClJldmlld2VkLWJ5OiBD
SyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lv
YWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRl
ay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jIHwg
OSArKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19l
dGhkci5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQo+IGluZGV4IDgw
Y2NkYWQzNzQxYi4uZDFkOWNmOGIxMGUxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2V0aGRyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19ldGhkci5jDQo+IEBAIC0zNiw2ICszNiw3IEBADQo+ICAjZGVmaW5lIE1JWF9TUkNfTDBfRU5C
SVQoMCkNCj4gICNkZWZpbmUgTUlYX0xfU1JDX0NPTihuKSgweDI4ICsgMHgxOCAqIChuKSkNCj4g
ICNkZWZpbmUgTk9OX1BSRU1VTFRJX1NPVVJDRSgyIDw8IDEyKQ0KPiArI2RlZmluZSBQUkVNVUxU
SV9TT1VSQ0UoMyA8PCAxMikNCj4gICNkZWZpbmUgTUlYX0xfU1JDX1NJWkUobikoMHgzMCArIDB4
MTggKiAobikpDQo+ICAjZGVmaW5lIE1JWF9MX1NSQ19PRkZTRVQobikoMHgzNCArIDB4MTggKiAo
bikpDQo+ICAjZGVmaW5lIE1JWF9GVU5DX0RDTTAweDEyMA0KPiBAQCAtMTc2LDYgKzE3NywxMSBA
QCB2b2lkIG10a19ldGhkcl9sYXllcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25l
ZCBpbnQgaWR4LA0KPiAgYWxwaGFfY29uIHw9IHN0YXRlLT5iYXNlLmFscGhhICYgTUlYRVJfQUxQ
SEE7DQo+ICB9DQo+ICANCj4gK2lmIChzdGF0ZS0+YmFzZS5waXhlbF9ibGVuZF9tb2RlID09IERS
TV9NT0RFX0JMRU5EX1BSRU1VTFRJKQ0KPiArYWxwaGFfY29uIHw9IFBSRU1VTFRJX1NPVVJDRTsN
Cj4gK2Vsc2UNCj4gK2FscGhhX2NvbiB8PSBOT05fUFJFTVVMVElfU09VUkNFOw0KPiArDQo+ICBp
ZiAoKHN0YXRlLT5iYXNlLmZiICYmICFzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEp
IHx8DQo+ICAgICAgc3RhdGUtPmJhc2UucGl4ZWxfYmxlbmRfbW9kZSA9PSBEUk1fTU9ERV9CTEVO
RF9QSVhFTF9OT05FKSB7DQo+ICAvKg0KPiBAQCAtMTkzLDggKzE5OSw3IEBAIHZvaWQgbXRrX2V0
aGRyX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpZHgsDQo+
ICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCBwZW5kaW5nLT5oZWlnaHQgPDwgMTYgfCBhbGlnbl93
aWR0aCwgJm1peGVyLT5jbWRxX2Jhc2UsDQo+ICAgICAgICBtaXhlci0+cmVncywgTUlYX0xfU1JD
X1NJWkUoaWR4KSk7DQo+ICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCBvZmZzZXQsICZtaXhlci0+
Y21kcV9iYXNlLCBtaXhlci0+cmVncywgTUlYX0xfU1JDX09GRlNFVChpZHgpKTsNCj4gLW10a19k
ZHBfd3JpdGVfbWFzayhjbWRxX3BrdCwgYWxwaGFfY29uLCAmbWl4ZXItPmNtZHFfYmFzZSwgbWl4
ZXItPnJlZ3MsIE1JWF9MX1NSQ19DT04oaWR4KSwNCj4gLSAgIDB4MWZmKTsNCj4gK210a19kZHBf
d3JpdGUoY21kcV9wa3QsIGFscGhhX2NvbiwgJm1peGVyLT5jbWRxX2Jhc2UsIG1peGVyLT5yZWdz
LCBNSVhfTF9TUkNfQ09OKGlkeCkpOw0KPiAgbXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LCBC
SVQoaWR4KSwgJm1peGVyLT5jbWRxX2Jhc2UsIG1peGVyLT5yZWdzLCBNSVhfU1JDX0NPTiwNCj4g
ICAgIEJJVChpZHgpKTsNCj4gIH0NCj4gDQo+IC0tIA0KPiAyLjQzLjANCj4gDQo+IA0K

--__=_Part_Boundary_004_1566696639.2036006895
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1dlZCwmIzMy
OzIwMjQtMDctMTcmIzMyO2F0JiMzMjsxMzoyNCYjMzI7KzA4MDAsJiMzMjtIc2lhbyYjMzI7Q2hp
ZW4mIzMyO1N1bmcmIzMyO3ZpYSYjMzI7QjQmIzMyO1JlbGF5JiMzMjt3cm90ZToNCiZndDsmIzMy
OyYjMzI7JiMzMjsNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxlYXNl
JiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMzMjth
dHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3Ro
ZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7JiMzMjtG
cm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRp
YXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1N1cHBvcnQmIzMyOyZxdW90O1ByZS1t
dWx0aXBsaWVkJnF1b3Q7JiMzMjthbHBoYSYjMzI7YmxlbmRpbmcmIzMyO21vZGUmIzMyO2luJiMz
MjtNaXhlci4NCiZndDsmIzMyO0JlZm9yZSYjMzI7dGhpcyYjMzI7cGF0Y2gsJiMzMjtvbmx5JiMz
Mjt0aGUmIzMyO2NvdmVyYWdlJiMzMjttb2RlJiMzMjtpcyYjMzI7c3VwcG9ydGVkLg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtUbyYjMzI7cmVwbGFjZSYjMzI7dGhlJiMzMjtkZWZhdWx0JiMzMjtzZXR0
aW5nJiMzMjt0aGF0JiMzMjtpcyYjMzI7c2V0JiMzMjtpbiYjMzI7bXRrX2V0aGRyX2NvbmZpZygp
LA0KJmd0OyYjMzI7d2UmIzMyO2NoYW5nZSYjMzI7bXRrX2RkcF93cml0ZV9tYXNrKCkmIzMyO3Rv
JiMzMjttdGtfZGRwX3dyaXRlKCksJiMzMjthbmQmIzMyO3RoaXMmIzMyO2NoYW5nZSYjMzI7d2ls
bA0KJmd0OyYjMzI7YWxzbyYjMzI7cmVzZXQmIzMyO3RoZSYjMzI7Tk9OX1BSRU1VTFRJX1NPVVJD
RSYjMzI7Yml0JiMzMjt0aGF0JiMzMjt3YXMmIzMyO2Fzc2lnbmVkJiMzMjtpbg0KJmd0OyYjMzI7
bXRrX2V0aGRyX2NvbmZpZygpLiYjMzI7VGhlcmVmb3JlLCYjMzI7d2UmIzMyO211c3QmIzMyO3N0
aWxsJiMzMjtzZXQmIzMyO05PTl9QUkVNVUxUSV9TT1VSQ0UmIzMyO2JpdA0KJmd0OyYjMzI7aWYm
IzMyO3RoZSYjMzI7YmxlbmQmIzMyO21vZGUmIzMyO2lzJiMzMjtub3QmIzMyO0RSTV9NT0RFX0JM
RU5EX1BSRU1VTFRJLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1
QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMy
O0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDthbmdlbG9naW9hY2No
aW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYj
MzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5j
b20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19ldGhkci5jJiMzMjt8JiMzMjs5JiMzMjsrKysrKysrLS0NCiZndDsmIzMyOyYjMzI7
MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzcmIzMyO2luc2VydGlvbnMoKyksJiMzMjsyJiMz
MjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2Ev
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jJiMzMjtiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzgwY2NkYWQzNzQxYi4u
ZDFkOWNmOGIxMGUxJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCiZndDsmIzMyO0BAJiMzMjstMzYsNiYjMzI7KzM2LDcm
IzMyO0BADQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO01JWF9TUkNfTDBfRU5CSVQoMCkNCiZn
dDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7TUlYX0xfU1JDX0NPTihuKSgweDI4JiMzMjsrJiMzMjsw
eDE4JiMzMjsqJiMzMjsobikpDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO05PTl9QUkVNVUxU
SV9TT1VSQ0UoMiYjMzI7Jmx0OyZsdDsmIzMyOzEyKQ0KJmd0OyYjMzI7KyNkZWZpbmUmIzMyO1BS
RU1VTFRJX1NPVVJDRSgzJiMzMjsmbHQ7Jmx0OyYjMzI7MTIpDQomZ3Q7JiMzMjsmIzMyOyNkZWZp
bmUmIzMyO01JWF9MX1NSQ19TSVpFKG4pKDB4MzAmIzMyOysmIzMyOzB4MTgmIzMyOyomIzMyOyhu
KSkNCiZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7TUlYX0xfU1JDX09GRlNFVChuKSgweDM0JiMz
MjsrJiMzMjsweDE4JiMzMjsqJiMzMjsobikpDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO01J
WF9GVU5DX0RDTTAweDEyMA0KJmd0OyYjMzI7QEAmIzMyOy0xNzYsNiYjMzI7KzE3NywxMSYjMzI7
QEAmIzMyO3ZvaWQmIzMyO210a19ldGhkcl9sYXllcl9jb25maWcoc3RydWN0JiMzMjtkZXZpY2Um
IzMyOypkZXYsJiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtpZHgsDQomZ3Q7JiMzMjsmIzMyO2Fs
cGhhX2NvbiYjMzI7fD0mIzMyO3N0YXRlLSZndDtiYXNlLmFscGhhJiMzMjsmYW1wOyYjMzI7TUlY
RVJfQUxQSEE7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsraWYm
IzMyOyhzdGF0ZS0mZ3Q7YmFzZS5waXhlbF9ibGVuZF9tb2RlJiMzMjs9PSYjMzI7RFJNX01PREVf
QkxFTkRfUFJFTVVMVEkpDQomZ3Q7JiMzMjsrYWxwaGFfY29uJiMzMjt8PSYjMzI7UFJFTVVMVElf
U09VUkNFOw0KJmd0OyYjMzI7K2Vsc2UNCiZndDsmIzMyOythbHBoYV9jb24mIzMyO3w9JiMzMjtO
T05fUFJFTVVMVElfU09VUkNFOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KChz
dGF0ZS0mZ3Q7YmFzZS5mYiYjMzI7JmFtcDsmYW1wOyYjMzI7IXN0YXRlLSZndDtiYXNlLmZiLSZn
dDtmb3JtYXQtJmd0O2hhc19hbHBoYSkmIzMyO3x8DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7c3RhdGUtJmd0O2Jhc2UucGl4ZWxfYmxlbmRfbW9kZSYjMzI7PT0mIzMyO0RSTV9N
T0RFX0JMRU5EX1BJWEVMX05PTkUpJiMzMjt7DQomZ3Q7JiMzMjsmIzMyOy8qDQomZ3Q7JiMzMjtA
QCYjMzI7LTE5Myw4JiMzMjsrMTk5LDcmIzMyO0BAJiMzMjt2b2lkJiMzMjttdGtfZXRoZHJfbGF5
ZXJfY29uZmlnKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7dW5zaWduZWQmIzMyO2lu
dCYjMzI7aWR4LA0KJmd0OyYjMzI7JiMzMjttdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCYjMzI7cGVu
ZGluZy0mZ3Q7aGVpZ2h0JiMzMjsmbHQ7Jmx0OyYjMzI7MTYmIzMyO3wmIzMyO2FsaWduX3dpZHRo
LCYjMzI7JmFtcDttaXhlci0mZ3Q7Y21kcV9iYXNlLA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjttaXhlci0mZ3Q7cmVncywmIzMyO01JWF9MX1NSQ19TSVpFKGlk
eCkpOw0KJmd0OyYjMzI7JiMzMjttdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCYjMzI7b2Zmc2V0LCYj
MzI7JmFtcDttaXhlci0mZ3Q7Y21kcV9iYXNlLCYjMzI7bWl4ZXItJmd0O3JlZ3MsJiMzMjtNSVhf
TF9TUkNfT0ZGU0VUKGlkeCkpOw0KJmd0OyYjMzI7LW10a19kZHBfd3JpdGVfbWFzayhjbWRxX3Br
dCwmIzMyO2FscGhhX2NvbiwmIzMyOyZhbXA7bWl4ZXItJmd0O2NtZHFfYmFzZSwmIzMyO21peGVy
LSZndDtyZWdzLCYjMzI7TUlYX0xfU1JDX0NPTihpZHgpLA0KJmd0OyYjMzI7LSYjMzI7JiMzMjsm
IzMyOzB4MWZmKTsNCiZndDsmIzMyOyttdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCYjMzI7YWxwaGFf
Y29uLCYjMzI7JmFtcDttaXhlci0mZ3Q7Y21kcV9iYXNlLCYjMzI7bWl4ZXItJmd0O3JlZ3MsJiMz
MjtNSVhfTF9TUkNfQ09OKGlkeCkpOw0KJmd0OyYjMzI7JiMzMjttdGtfZGRwX3dyaXRlX21hc2so
Y21kcV9wa3QsJiMzMjtCSVQoaWR4KSwmIzMyOyZhbXA7bWl4ZXItJmd0O2NtZHFfYmFzZSwmIzMy
O21peGVyLSZndDtyZWdzLCYjMzI7TUlYX1NSQ19DT04sDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO0JJVChpZHgpKTsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjst
LSYjMzI7DQomZ3Q7JiMzMjsyLjQzLjANCiZndDsmIzMyOw0KJmd0OyYjMzI7DQoNCjwvcHJlPg0K
PC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioq
KioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioN
ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVk
aW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwg
cHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFw
cGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRo
ZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0
cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBu
b3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhh
dCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVs
ZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0
dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29u
dGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3By
ZT48IS0tfS0tPg==

--__=_Part_Boundary_004_1566696639.2036006895--


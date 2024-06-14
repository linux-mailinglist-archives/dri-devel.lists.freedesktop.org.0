Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4B190832A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 07:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9485510EC2B;
	Fri, 14 Jun 2024 05:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="i0wrRVnn";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="gK7eLwAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E46E10EC2B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 05:06:14 +0000 (UTC)
X-UUID: ce735c362a0b11efa22eafcdcd04c131-20240614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=SxKhwCYubyMCukopask70ZjPSvhx0IZ/VN+4NIGN/C0=; 
 b=i0wrRVnnFr79z7Y88Gb+bH+WD/4itClUCy2o0FcpsG60UxLgaFZnx1ynrIiMjsPR7TXS9FKUWWQjLc3msFzVlQ2y4iJxWqjoUyTS2Cbhf6tZAdVj6tqnNipF+vKfHeWpAhrIWKJCf4B5IfygoalW2DYZ6r78kYgDLmC4KwpbMB8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:9373e322-48d5-47d3-ba92-11b1c0df548d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:f0c59044-4544-4d06-b2b2-d7e12813c598,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ce735c362a0b11efa22eafcdcd04c131-20240614
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 572527086; Fri, 14 Jun 2024 13:06:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 13:06:04 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 13:06:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdETd7ks6jqQYtMln2urRI7/OIyaSieJg3DSjhOcpMN04JPZ68za2K1P2AqcO2vXraDOwh48lJIkZoWGgxpmvc8fHluhpn0Nqsk1a+aL0X76CSDbqvylwAh3UQB10VFD5L/YDrwbpFcY3Qv4vh/XlB2UsYCRcW+8wKAiVgbukQT2AncTkV9rZKujxlidOrjZj3WyXzsaGGgN2h6AI78St/NvKY7Ui9+Ic8qanjc13mM6RbLf00eRiQ5LAUBXB8+LUe9FVG2R2iODYIlldYJQ9dQVRZ3aQiOa9RBcwRKzx5tP4FJlVYX4yJ+7BqnXoqTR4Bqn9q9dcDJbJ0uUH2PnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucySeOl309ykIazsGuTMWTkrcewZ5yTDU/mEZdeA7+A=;
 b=XbYIHAOL3ssAGFpoVx54kmbVMtIlH58ktty9DX2leDskCZA/skObetCazhfeCUsXtz7oh2FYbfMvBpNKPzJgb2HSewTwLgry8wn3dij5peTKGWqt//Bob/lZaUiqoaroSW4kN8BYyDbtDTIpol6XXEGF1KvmPth9JidNdsKuAyQ09Z8sMsNq97eAnmv15XupGfOx6aKfuYwt8KlQ5WSssG9iRZLbvj6iCAYR3DB6K6eVfDnbwCjeXreqAw+8wa/0ZcN+WUsscnVrg4WsFMKpEyUfcsYj4vGHvbrUuV4sLOg1XIZSJ+VPPOxfQDyWXrhoaK2JTCJ4dOfHkarYV95p2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucySeOl309ykIazsGuTMWTkrcewZ5yTDU/mEZdeA7+A=;
 b=gK7eLwApnny3/YjNWcPLK8daIXJVLz6riDDoc3n9PfF6W8u/kUEi7HRmRBoYixYyCW/mBJkJrFm3ud7R5U8XxVTHZbXeIDjiiMTkYZNdSQPeYcqb7FXuk7eGIKPj4UIWUXY136SLwFZuN7XpicV18At2UOO96M3kd6M0hJCpF5M=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7228.apcprd03.prod.outlook.com (2603:1096:400:343::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 05:06:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 05:06:01 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v9 12/21] drm/mediatek: Support DRM plane alpha in OVL
Thread-Topic: [PATCH v9 12/21] drm/mediatek: Support DRM plane alpha in OVL
Thread-Index: AQHavgUwUjWmf4SgFkWk/4MtihynnLHGtQ+A
Date: Fri, 14 Jun 2024 05:06:01 +0000
Message-ID: <efd946d5d2670e5f71175cb2c8179998e769fa7e.camel@mediatek.com>
References: <20240614024620.19011-1-shawn.sung@mediatek.com>
 <20240614024620.19011-13-shawn.sung@mediatek.com>
In-Reply-To: <20240614024620.19011-13-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7228:EE_
x-ms-office365-filtering-correlation-id: f3478bbe-4aa5-423b-8b44-08dc8c2fafb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230035|1800799019|366011|7416009|376009|38070700013; 
x-microsoft-antispam-message-info: =?utf-8?B?dEJwZ1RyM3pickdScUZFUC80ZDRMSkVtckR6ZGwwTjhTeEdnaDVQQy9MM3ZY?=
 =?utf-8?B?VTFldEJzRG9uc01nT3BQRFJ2T3RRNTNtYlVXVWZpNm1aWHdFZzZPZytySkY1?=
 =?utf-8?B?N0NCdjJ2Q01IWk9yZnBjcTdReFYxeFliNkFTeWdnaG9uZnRLR2MwZ0JYRG4r?=
 =?utf-8?B?NGZLM2xoa2JVdHUwZC9HN3V6S1RaeitzKzZmVkI3ZHZtK2Qrekk5WXF6dUtn?=
 =?utf-8?B?N0gwL0pDbUNZZzFBS3RpVzVNVExGU01wYmhrc2p5eW9wZWEyT0RhcithNVNh?=
 =?utf-8?B?MVd6RnZiUWZqYWJJbXlZU21ITjEzdkl1QnJpSHg1eGJIZTJqbFZ2NXRmZW1E?=
 =?utf-8?B?d084eDJYRkdNTXBZeU1IaXo2eE44QzByQ0tqdzVubXJBN3JCQzcweHRhN01u?=
 =?utf-8?B?elByNElQdC9nY09LTEYwTE5NNDQ4aitrUFoyd0pYSE5SY0Q0REpORWR3TE1S?=
 =?utf-8?B?cUNGbUpyQnVBSjFERHR5RG9lbUNncGZRaFZtVUh4aUdwWkRlNkx0RW92K203?=
 =?utf-8?B?NnVoZWFza01Ic2pNN1Z6QmM3R0pmU2o2cGlsM0puODFvR1A2SXRsandjSC9L?=
 =?utf-8?B?YzZvT2dadGtWWXNpbDRlVDhYcUNUM3BTYmxNVVBIYkdMbktGNGwyR1FjZ3J2?=
 =?utf-8?B?V1dOWVZ3N1RGRjBmRmwzcUZtcm1XYTFndTJRNzluTlZScGorcWlpbWh0dXl6?=
 =?utf-8?B?UmlNdERCaEUvNUoyT3FhNHprRExma1pMUWhpWWx5RThtekErYWFMcStxK3hn?=
 =?utf-8?B?RTNMYlE3WkJCbmlvNXc4ZDFrTU4wbkptTXFDN2lnNzcxcGNKdVNCYWRnZzdD?=
 =?utf-8?B?ZzBoNFQyb3BxWXZqamZxTjNnVnJBdmk5VjJRY3FOSjFmcHZtZ3JReU5sZVp4?=
 =?utf-8?B?V1VyZlpuL3Ezd0RGbHAwbGdVaDVwYng0ZG5BVkhIZGZSSzZndHNnbms2aFV5?=
 =?utf-8?B?aFp3eDN2SElpR2dPdG9Kc3ViSE1qVTB2V2hlMjNwbnkwMEcrL2tla2JKR2Nu?=
 =?utf-8?B?WlMrV0ttSHFwaUZXc1lWUWJia000UW9LRTBpVkVGMWRYWHBGQjF4c3RuZmE3?=
 =?utf-8?B?eDYyUk9IVTZweUJwY0lZMzdWclVsK3o0YmQ4S2NHb2t1cXlmNTJQcTN1Slk4?=
 =?utf-8?B?UEh0RG50ZWJmS05GRlNNTW9BN1N2NnB5WFo2U3d4NEl2WVZ4cjcxRnhFUUlB?=
 =?utf-8?B?TVBOWDZ2d2FaZmxEbGo5dVBDQURlRGZwY2tlSjROWFJxU0RZbjJ4bVlwdjV6?=
 =?utf-8?B?b0E3Ylp4MWNJUER4MXgxeFlWQUdtSnNBRmNyM2x6WUk1cXhsblRYQ3lCNjZx?=
 =?utf-8?B?QjhiclBEZWdyOHFHbW96YzFzNVJEdzhVWjdFcGJnNkRhM3RERERMZkx1WU93?=
 =?utf-8?B?ci85Z2d0R3l0NDMxdi9zOWtIeXlaQXlKcklRKzVmSkR3YVVVSWVMNnE3alEz?=
 =?utf-8?B?a01yUzBRdjJKR1VWNmNBU05pSWFHbUhLR3JCeGdOeDZFRzNHUUhxZk9aU29F?=
 =?utf-8?B?VVdwWTE1SlZkVE1KY0cvK2dYODZUc0JUTXdGVFV5MHNsM2Q0MkJrRmx3QWlu?=
 =?utf-8?B?bENjenVoM0g3N2FJaGd3d1B1a1FYQmUycS9Wd2lHSm04Vy9sVUhVNEQvcGJh?=
 =?utf-8?B?U3ZxQjlVMnlmYkQvWmNUa0h2WFFlRWZwb2hUUXRDczQ3dml2ejdkTVF0YWwx?=
 =?utf-8?B?UC8vZ2FPT3FpblFNbXFpR3hoMnFyWldFd1JzcHpsdWFpSVovTGxhemc4OU96?=
 =?utf-8?B?QXZNQzlTTzNDNDZiSjRhK3hnTzh6ZEFiVStkQVU3aW1zdUNIMzYxODRKMHdu?=
 =?utf-8?Q?PFIceQaANcOesRGxwEMlStpVvDCJWJlIm+Xgw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(7416009)(376009)(38070700013); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGxBamNiTi9CeGJwUytTWkY4UTlROUlZeVhpWkticmJ5RWEvTVF3K0RuSndN?=
 =?utf-8?B?K2M5cGhLbkxWYW94c200U29vWTlSamd5SXVnTktJZU9Kckx5VnpUWFJhcCtI?=
 =?utf-8?B?QytMMk40MWpTcXFNV0grVmZHeXFzbGpiNXZWdVNLTDcycHpUSmhhOWdQYnd3?=
 =?utf-8?B?MGZxU0dFSW5lWTNITnRvanZiWTJxbjRwY0lxRi9Od1hzU0VFbjNTaDJPL0Z4?=
 =?utf-8?B?L2R0MkNXb2QwZkhSaG84TU1aZXRlbnpyb3FrdG95YTU0a0hvSGVDY2pjY3BK?=
 =?utf-8?B?RWFWQ3dQdGJPRVhUaTZlR1BMWit0WWVOWTJGQ2FZTVlqcTZSUnNMRWZFMWJs?=
 =?utf-8?B?QkNMNTJvV05Kc1BOU0ZKZHVmNTMrOXBJNFVKc1RjTTBaQ0RjN1IxT0VKbzFr?=
 =?utf-8?B?U3JpQWlJWElyWU1CT3ZwTnFQc3Vrc0ttejlZbXRpc1VWQWpXTm45SUZRYmZE?=
 =?utf-8?B?emowaUFSVkdLRVRTTU5pQklVbjVhTjAyWUo1dnFOUGpQaGM1b1ZlRGhsY3Rq?=
 =?utf-8?B?TkhnY3NGdHZHTERsRkxaci9lY2NmMlJwdUxlZXB5WFh0NVBKdXl0SktUUDRu?=
 =?utf-8?B?NUhTUUFhQXNzMmp5d0xhb05Xb1Buekw1R0hDVHFTZ1dkeWh4bmxJUEZqd0Vn?=
 =?utf-8?B?U2VKODhlRlpOWms0LzFCVU5KbVpJbFgrc3Q1cklyQnR2WVQ5eVBLb2JGa3dZ?=
 =?utf-8?B?MXNPbGdUQnZmZklQdzlPdnNpS2hlVS9jZ3BBendmWEpFTFJHQ0xoSkJyS0xr?=
 =?utf-8?B?bURLMTByTkkybU9ZMldUNFB5T1lIV3dsQm8vVzFDbzdnWnJ0amZTOFhuNVFO?=
 =?utf-8?B?bmpNZ1NRcHp4ZzlsaGo4YUxIZUlYUjdwMnRUNHp4UmdncE90enZUVDNqZmpm?=
 =?utf-8?B?aEtnMFZJQkFobklGdXJ2cTJzRzBKdzM5czlVUHhyQ1ZmT2JnRkExUnRGUjM4?=
 =?utf-8?B?RG9RTXYxeGxlSUtjR1Z4dkp6NFlodDhFcXRlNVZWTkJsQVZxajNldkY4SndO?=
 =?utf-8?B?U2ZTdWk4bnRKWi9jOHhabkY3T3B1bVFZMTJ6aGcrdWdZTWJvMTZXV1hSRDVM?=
 =?utf-8?B?K3c4dHl6YnlBQ1JhaVlmREN1VHVXMEw4ZzNCaGYxb2JvdEFsY2dKcUlOcDBP?=
 =?utf-8?B?MFNDdXh5MnNPMUhscFBoQkpEc1ZFWU9RT01zZnlHcmcvN1JiU0JGV0N6VFZ5?=
 =?utf-8?B?YXlkY01UUkRycUpRbm56VThGdkU0bzd3MXd2WWRzYXo4UTlwVzZpNGRWQm1u?=
 =?utf-8?B?RXZ0U0tTVTlLZE1HMGZKclNPSWVIMTlSLzhqZmVLYTMzaXpmTU9nY1pnalBs?=
 =?utf-8?B?R0xMQUZ4MTNmbkNnZmNxRXNnMUVxVFVBNW9LOHJvcmZqQXp2SWg0N0hHYUJD?=
 =?utf-8?B?Uk9MUVRQaXc4OHArbmFadHg3Skc0Y1l3Rmxja1djWExGNDY5S1VwV1JvVW5m?=
 =?utf-8?B?UGFycGZ5QVJNZ2JOaHZqT1Eva2tLM2hSdXNHYVdhSVJiYXBRR0l5dWxVNWdE?=
 =?utf-8?B?ajhqQ0dsL1VZcTRHWFRjYlIzK3p1TGQwNCtqUVRpa0xZU05pZTlhTEllOTJt?=
 =?utf-8?B?UmdMWXZCOTI5U1NnVDA1RnNSb09tblJNQXlvRTVra2UvaG5vam1jZFVPQ05W?=
 =?utf-8?B?TzFOTmhkMDNCM3FGTG9hVXhIZmMrU2VBblNEY1JJemNVbE40OEVXS2wwNnpR?=
 =?utf-8?B?bFgzQmxHQUpMbE5wWHkvc2FRQ3RhZnFKeUZHRnJmUXRDQlRhU2Z5c05LV0pz?=
 =?utf-8?B?WEt2REN5ZnZ3WDMyVHhFZ1RZZ2lIL2V2bHROdVFPYmZFL3hDZFNFNVdlRWhq?=
 =?utf-8?B?OVZmY28yTE1BU29sNVBudGszY1hwdFRhWjd5eUxRQXM3dnR0ZzN2T0daTHFu?=
 =?utf-8?B?Z0x5TVZwdGtURll0WEs5eUUwcnl0NDBZSmpkK0llT29WdFlOTEhxVzYzaUN6?=
 =?utf-8?B?T0hlcXozVmlZelRrWTFmR2ZXWkhuSFJKby9la29xYjJlaUJlYkhiT01GcE9D?=
 =?utf-8?B?M0dva0YvWDhKMzA5L25sOHZvTEx2dnVqTk00ajZwZkxrWEQwZ2NHRUFrZU9s?=
 =?utf-8?B?MDIzenZNWDJYcXljMktHT2s0VnJzNnEwT2QrNXpRbEs3OEJnaEJMb21oMDFS?=
 =?utf-8?Q?D8uZu9IpP0ObR7Pcvzp67pHg7?=
Content-ID: <030FFF7829F79043BA590BA7E4CB0057@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3478bbe-4aa5-423b-8b44-08dc8c2fafb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 05:06:01.8581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v0jOHmWoO5iSekMMTmvDwUjqhPEXgaG5SNjwUba7axTW7zYv6e7xTaUzesy8cpMK2ARQnIXKv+fWvNQX5O7mOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7228
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.296000-8.000000
X-TMASE-MatchedRID: fgYTp5XatxYOwH4pD14DsPHkpkyUphL9X4GSJGyYc34E6M1YtcX6vHIu
 7Bbf4TXto5qw/iFKtvbzrL9jlOCHAYpsQeZV7e/esTcWkxuDrdIcZR50t08gUZsoi2XrUn/J+ZL
 5o+vRV7yhMIDkR/KfwI2j49Ftap9EOwBXM346/+zk7A0hRZdfWcWnLlSjL7qOayhrqw8PUufJ6D
 qCXQNFPA0c8VMY8DaU
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.296000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 85EA8A7E6AC1D591D1959A3A946056B5D117D9572B3094056252CE9887CF68E92000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1381485655.1945938299"
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

--__=_Part_Boundary_003_1381485655.1945938299
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBGcmksIDIwMjQtMDYtMTQgYXQgMTA6NDYgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU2V0IHRoZSBwbGFuZSBhbHBoYSBhY2NvcmRpbmcgdG8gRFJNIHBsYW5lIHBy
b3BlcnR5Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwg
NiArKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+IGluZGV4
IDE5MjNiYmQ5NjAxNC4uMjMxNmQ0YTZkY2E3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bC5jDQo+IEBAIC00NTAsOCArNDUwLDEwIEBAIHZvaWQgbXRrX292bF9s
YXllcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgaWR4LA0KPiAgCX0N
Cj4gIA0KPiAgCWNvbiA9IG92bF9mbXRfY29udmVydChvdmwsIGZtdCk7DQo+IC0JaWYgKHN0YXRl
LT5iYXNlLmZiICYmIHN0YXRlLT5iYXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkNCj4gLQkJY29u
IHw9IE9WTF9DT05fQUVOIHwgT1ZMX0NPTl9BTFBIQTsNCj4gKwlpZiAoc3RhdGUtPmJhc2UuZmIp
IHsNCj4gKwkJY29uIHw9IE9WTF9DT05fQUVOOw0KPiArCQljb24gfD0gc3RhdGUtPmJhc2UuYWxw
aGEgJiBPVkxfQ09OX0FMUEhBOw0KPiArCX0NCj4gIA0KPiAgCS8qIENPTlNUX0JMRCBtdXN0IGJl
IGVuYWJsZWQgZm9yIFhSR0IgZm9ybWF0cyBhbHRob3VnaCB0aGUgYWxwaGEgY2hhbm5lbA0KPiAg
CSAqIGNhbiBiZSBpZ25vcmVkLCBvciBPVkwgd2lsbCBzdGlsbCByZWFkIHRoZSB2YWx1ZSBmcm9t
IG1lbW9yeS4NCg==

--__=_Part_Boundary_003_1381485655.1945938299
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO0ZyaSwmIzMy
OzIwMjQtMDYtMTQmIzMyO2F0JiMzMjsxMDo0NiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1NldCYjMzI7dGhlJiMzMjtwbGFuZSYjMzI7YWxwaGEmIzMyO2FjY29yZGluZyYjMzI7dG8mIzMy
O0RSTSYjMzI7cGxhbmUmIzMyO3Byb3BlcnR5Lg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtI
dSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtT
aWduZWQtb2ZmLWJ5OiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24u
c3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jJiMzMjt8JiMzMjs2JiMzMjsrKysrLS0N
CiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzQmIzMyO2luc2VydGlv
bnMoKyksJiMzMjsyJiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYj
MzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jJiMz
MjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KJmd0OyYjMzI7aW5k
ZXgmIzMyOzE5MjNiYmQ5NjAxNC4uMjMxNmQ0YTZkY2E3JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0t
LSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCiZndDsmIzMy
OysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCiZndDsm
IzMyO0BAJiMzMjstNDUwLDgmIzMyOys0NTAsMTAmIzMyO0BAJiMzMjt2b2lkJiMzMjttdGtfb3Zs
X2xheWVyX2NvbmZpZyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwmIzMyO3Vuc2lnbmVkJiMz
MjtpbnQmIzMyO2lkeCwNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMy
OyYjMzI7Y29uJiMzMjs9JiMzMjtvdmxfZm10X2NvbnZlcnQob3ZsLCYjMzI7Zm10KTsNCiZndDsm
IzMyOy1pZiYjMzI7KHN0YXRlLSZndDtiYXNlLmZiJiMzMjsmYW1wOyZhbXA7JiMzMjtzdGF0ZS0m
Z3Q7YmFzZS5mYi0mZ3Q7Zm9ybWF0LSZndDtoYXNfYWxwaGEpDQomZ3Q7JiMzMjstY29uJiMzMjt8
PSYjMzI7T1ZMX0NPTl9BRU4mIzMyO3wmIzMyO09WTF9DT05fQUxQSEE7DQomZ3Q7JiMzMjsraWYm
IzMyOyhzdGF0ZS0mZ3Q7YmFzZS5mYikmIzMyO3sNCiZndDsmIzMyOytjb24mIzMyO3w9JiMzMjtP
VkxfQ09OX0FFTjsNCiZndDsmIzMyOytjb24mIzMyO3w9JiMzMjtzdGF0ZS0mZ3Q7YmFzZS5hbHBo
YSYjMzI7JmFtcDsmIzMyO09WTF9DT05fQUxQSEE7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7JiMz
MjsNCiZndDsmIzMyOyYjMzI7LyomIzMyO0NPTlNUX0JMRCYjMzI7bXVzdCYjMzI7YmUmIzMyO2Vu
YWJsZWQmIzMyO2ZvciYjMzI7WFJHQiYjMzI7Zm9ybWF0cyYjMzI7YWx0aG91Z2gmIzMyO3RoZSYj
MzI7YWxwaGEmIzMyO2NoYW5uZWwNCiZndDsmIzMyOyYjMzI7JiMzMjsqJiMzMjtjYW4mIzMyO2Jl
JiMzMjtpZ25vcmVkLCYjMzI7b3ImIzMyO09WTCYjMzI7d2lsbCYjMzI7c3RpbGwmIzMyO3JlYWQm
IzMyO3RoZSYjMzI7dmFsdWUmIzMyO2Zyb20mIzMyO21lbW9yeS4NCg0KPC9wcmU+DQo8L3A+PC9i
b2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVE
SUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGlu
Zm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55
IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxl
Z2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJs
ZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2ln
bmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlv
biwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRp
bmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmlj
dGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBp
bnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBo
YXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5k
ZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55
IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVu
dHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9m
IHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19
LS0+

--__=_Part_Boundary_003_1381485655.1945938299--


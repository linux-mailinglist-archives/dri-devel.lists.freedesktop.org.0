Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A0D9B42C4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 08:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E533110E5B0;
	Tue, 29 Oct 2024 07:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="KBy5eyff";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="R+MdWIj7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D489010E5B0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 07:03:26 +0000 (UTC)
X-UUID: e0e99c3095c311efb88477ffae1fc7a5-20241029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=c+djJg4Rov3NHZd3Y53qZqWFJGbX0udy2CTnOPR0QPY=; 
 b=KBy5eyffRdzAGj+OZIDB6xrEUBNb5fhhE/oGG+n73ppHJV5EqMlA+j+1TN37iQgnvQl4uUkWM9E/SjVjc+2V1O5di/3Kd1Uqgtt+ine+hchnaN1xXID9rZGh+/8DO+QcIXFbeN2aubFTbJRua0Fq4Tgd6ra86BYg8WCObnGYY0w=;
X-CID-CACHE: Type:Local,Time:202410291447+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:c8a807a7-3cbf-4639-bc48-1bc8ff1c16c5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:91de3407-7990-429c-b1a0-768435f03014,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e0e99c3095c311efb88477ffae1fc7a5-20241029
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1030859002; Tue, 29 Oct 2024 15:03:19 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 29 Oct 2024 15:03:18 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 29 Oct 2024 15:03:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnybjN+3Eyt2OtLNEQ913emcP9nPLw1V4f+LIEjro8STuC5Skx267AzJZXF/iJHbksaoSd4S4P812VUupb4UvDJ1ctoAZEFObGDyEZfJRf9Emn7KZp97RNu2T14HNNf4H+sdJ6kfG/wMd4ahZ83DvQo4xpwXoFw5pqbra4ZJ/KyEWZsh0SUiL5nRKuEl++ZZaGdI6q+X7AgbSM0QujnZ/Ol+Y18FlRmxinI7xKnW3jaW8mMML+UERnRapp8MVWkPAu44K9ETRPkET0XioajsZyxd3UH29krAMyHQ6AYB+ONxqly6OCmYJp1TlElLRnZg50+0xUnNervVtqKmpe6PvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fl4k9U2claVJ3MMHJELeCJaz8ierVqCIxsFrG6iSwfY=;
 b=HNFLpe1AQMIIOiY5s3VcrV/TbT6TstgyJIB0QSS01IoAuACtALJIKzvl/A01kl99wC9MkQrH4oAbDFtflfSgmH9T7FXkmMtmqThYU49DmaoTRfbBnFiLKqkdGCMZqDRLch0ZtYOuzt/sctaE2+r38TB7yf7qx1Aa2WHo5OKsuouzlFXxLyx1EHjKW1OUYTuV1AxT2/yiyIXgvwjQOggMh/tTupdgsAmHOuukoGJqhz4HsaF3isL9toGyeTdITeGPIsA8SuS6I+wlBSORA6wsETKTzTkmwalCTMlUUuAT3katsqKL7l2WdlQP3fzJTiGZkQPsQMn2jCdatoB/T4nm7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fl4k9U2claVJ3MMHJELeCJaz8ierVqCIxsFrG6iSwfY=;
 b=R+MdWIj7z7hzf8AfVz69/31FxC3FMZb/DBbQbiOrDJSj2gG/WkyikLqC0f8yCXYilT7YoZQ7PcG3HedizZwtGl3KTEgrlRdN6UnYixgIGpC2tCdNQliFqVoeK4RyoZrXTChH1EETf7oR5ok/NjUBFQqURzYlacx72B+6KdMIaUk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7663.apcprd03.prod.outlook.com (2603:1096:101:139::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Tue, 29 Oct
 2024 07:03:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 07:03:12 +0000
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
Subject: Re: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys unit
Thread-Topic: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarKdbLsA
Date: Tue, 29 Oct 2024 07:03:12 +0000
Message-ID: <3757822556f581a6e79a6f6572bb6445c0f1d147.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7663:EE_
x-ms-office365-filtering-correlation-id: 80763cdf-6764-4b51-4102-08dcf7e7c0ba
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Rk1rTzhNUDZYOXBkdWg1SVFFTlZpYW81ajVLR05kUlEyOUNkNGhORTUvbTlB?=
 =?utf-8?B?NUtycjQrNGNSS3pWVlBrL2JiUFgvc2RZaUlVWG95a0hwcHZGQW1qajN5cVYr?=
 =?utf-8?B?aUc4V0RhcFkxOE85MVd6dlRtQmdzbnVVb3BvdDZXeXdBRGl5dnczZDdLYlZw?=
 =?utf-8?B?VGQxMThSSkNOUGhDSXB6MFJEMGZGR1dDRlRDRXdldEZWRGpnS0drLzR0cVhj?=
 =?utf-8?B?aDl3bk5BMXFCWWVNZVlEY3JmdWpGSHI4dTNVVjdYWnpsS0ErdmxoazkzbEl3?=
 =?utf-8?B?Wmp2MEhHZ3MwUzdPSHhGaVFBYXdONDhjUWhSVHdpNmhHR053RnV4aTJEVHY5?=
 =?utf-8?B?WXRsNzR5S1hYOTRNQTZvaHFCcWJyL2Y3MWpLYWFhSW9rTnNudVpQS29lN3lN?=
 =?utf-8?B?VFFKa21Bc2NOVVVOL0s0ZGxvRTdCVUtBbXc1V0trNVBZRDRDbDY0SHdaT2hL?=
 =?utf-8?B?cmJRbDE2V1lqdVJpUTZybFBoZkhJVlAxRTRPazBtdkRkMW15L1pibFJSY2Er?=
 =?utf-8?B?TVlYcGJhWnY3Rmh3S0ZNemNkR2NjRVFtUlNSZDJJbFhES01na2FBY3d5bTdS?=
 =?utf-8?B?cTUwd2pRejUybFUzTEtPY1g0Q0xab1lFc3Z0eWl3K0VVNkVWZ3JSNVF0K2Jw?=
 =?utf-8?B?ZDY2WnZhakM2bTNUelFzR3pvWGcxeE12R3BVS1BZS1c3OUlBZjUySzFTS0Nq?=
 =?utf-8?B?OVd4VXNhcXk3T2V6R0M0S2ZtRDNqaHNMZmlkREducDhUVTVNZEpBcldUTTJt?=
 =?utf-8?B?cUwzTm9nUjl1cmNxZmxhNTR0OVJPSWJNWGRETXFndlpseWhkb0NnNE5YdkhI?=
 =?utf-8?B?NS9aTkpNdG5zVXd5a3NvaGVvaUhFVTUycU5EbGJKSktYR0pSZFJPZjdRMjNN?=
 =?utf-8?B?aVhJVFMzQUt2NFFMSXpJQlZZRDVnYVFvOHg0Qi9QUld0dnhjV3hXTzhRa2s5?=
 =?utf-8?B?Y0xzSitQTTBIMXJGS0FNYzlUYTN2Y0F2T3dQd3ZYbkQwMGNCc0xxZGZ0cmYy?=
 =?utf-8?B?a05PWGJVaCtRdWNRS2d4c0ZMVDE0akNUQzNLVXRkQ0szWmFDTGYxRjhzZVNa?=
 =?utf-8?B?SjNrTkd2TENsSFVHS1pDZ2R5MTZPcDY0bnlYSU01S2xqYTdRc1g2b1hObk5k?=
 =?utf-8?B?WDM3YlVOSFl6M3c0QmVnK0N3TW1nK3ZXaTFxMmt1YkttTWJJR2hiNzY4cktM?=
 =?utf-8?B?RnA0Y0Jtc1JhWE5nZU5RWGpwMmR4NEI0ekgwcm8wOEdYZ2VtMWlZczU1T1N3?=
 =?utf-8?B?Y1FVcC9KaE5rRUk0S0NWYTdhRzhvaVdjb2h0c3NRTXMwS09ZMkZJNFhUS2dQ?=
 =?utf-8?B?TVRIQVhHNG1iOHd6R3J3VHpXa0wydThTcDNrQ2RpL0l4T2pFVFkxdTRGTWVJ?=
 =?utf-8?B?ZElDdEdrNUNSbkhQK3lENDJKZDJybGVPQ1YvQnpoYmN1ckJJTmFPdnJTMTE0?=
 =?utf-8?B?MGsvNTJzeHZNTzl1K1F6WmdxUzhMNlhTWm1RZ2ZXa0ZhczljQXExeEppU3hO?=
 =?utf-8?B?N09zRnZPU2lKaEc2bENkSmxGNFZnZFM2cXRmRStTR0VQOWxwTm1Xb1B3WEFH?=
 =?utf-8?B?UFBidURuRTlFNHNjdklHN01jZUdZVXNCMWNEcTlPU1kwNE8wNENNUDBQU1ZJ?=
 =?utf-8?B?MjBVWVZPNnZOZnVjS29WNW1BTWd6OUZmNEpJdm9Kdzd5endUVHRVZGVGbHlT?=
 =?utf-8?B?amhCd0lKYkVJNFVVNlNGYXo5bUthY1BqN0FhdXRlOFBSbkV4cWwyNnFNaDB5?=
 =?utf-8?B?SWRpd1hzd0FIVklWMmNzVWdjQndtWE5HVGU1QmU3TFcraFBMajIzRndGdDk4?=
 =?utf-8?Q?dcc13rLz5erXOOTW0W+tBmdNNhpeo+7vVgXvg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azRyVWRaUlpvTFJIZVN2eXFNc3ltL3o1Um9HOVZscC95YUtQUHkzRGxqZFVx?=
 =?utf-8?B?UU05MFQvNTI1UlQySjZQVHZhUDlFNzdSb3NrR3VidGdvWi9FMXNnRDRka1h0?=
 =?utf-8?B?VmlCaUs4SkRacFE4eU9wUzJlZk9kYWhadmhOQkkwZ1Zia3pMNk9KTHMvMWZI?=
 =?utf-8?B?b2hERzNkcGg2dHlxUVJKQzZNK3NXQlB1RXJHZ1FrUEZJeGdNTlBmV0s2blZh?=
 =?utf-8?B?bUlFNXh3N1RYRkN1ZVVYYWxCdGFlU1A1ZU5tdXdiQWRkaUwwRXNtWWpBNVhD?=
 =?utf-8?B?Y3Ixd0Jud2doN0VFVEtjdW9BdmhnSFAxNXk3TldSSWdobGIxZms2TGRkZ3hh?=
 =?utf-8?B?TURjdmJKVC9VeVlkWWZtS3U1VDhnQVJKTSthM01PdGxHam1ZM0JSbVVuNWZI?=
 =?utf-8?B?RHNLVDFFRUI4MGdCb1grdlFtWHNpQ3Fvc2hTUGtlMnVWUzEvSHFCeEJKL3l1?=
 =?utf-8?B?T1UxejdCRUNjRkpVTG5kTTV1MGVrSStEcDhOTVJMSWJBcWJNc2JOblBvZlFL?=
 =?utf-8?B?UkxWenBldXdCTG1lK3lJT01rUUNBcDU5WWFHc09pSW1oUVp2bVZPYkNBK1V2?=
 =?utf-8?B?MTNNbCt0Z2VCdlhuc2dleTVLWVNSYTMyWjZ4T3B5Q3pBTU5uMEwwc1pOekVL?=
 =?utf-8?B?Q1dnK1I4T3JraWt1Q1VFM2FrbjF1L0xPQkFTL1dXdnZlemlaOFlpd3ZqNEtH?=
 =?utf-8?B?SUdVR1UzSUN0WG83RHBhTTAwVmJ6TlRoS1VQMlJHMU9XRXJnRE1vaGFKbjdD?=
 =?utf-8?B?WlYwbEhEMWZWVVJ3ejd5UXFFaEhCRHJpbzJEaVFZdno2Y3h3TVMwSDNYUkRK?=
 =?utf-8?B?SU1QOE5lRXpOR1BhRnpNcjh0UnpsVXJUZVkzeEFXMmxwaUVZdEM2TkJvdmxu?=
 =?utf-8?B?dmpJS3VGbWFpbjc2QXFSN0pvSVpKK2ROS2dYL2IwakVLSHRtOUNNY1Y1aTZV?=
 =?utf-8?B?ZzRYd2FOVzFJWllZZUtYNm9pSFk2Wm5aS2ZGZENWWTVTSkpiU2ovOTRzOUVr?=
 =?utf-8?B?WE5OQ05jN0NhRVRvWkY4elJsdkRHSHNUdmFqQlNJQzRBU2ZlZWx2MkF1V1NT?=
 =?utf-8?B?UTJreE5jdTk4UENPeWJ4SFlBc3loQkNHOEVYMllrcS9UQlJsK1RuM1ZrSXRi?=
 =?utf-8?B?ZVhQQzhpMUtlQlhLSVpEbHd1OVE3UWcvWTFyYThIa0MyalpXQlBGbDViSTBB?=
 =?utf-8?B?ZmhXKzF0WStQbGJBcHZOeVlhUmN6bU83R0cyYVoyOWswNmxNTk8rQ3p3Uzlk?=
 =?utf-8?B?QnVTcHlMaVF5SEIxdVZPeFRDNlhRQk43UEpNa2Fsd3doaVpUN1I1Zm1ZVHVI?=
 =?utf-8?B?dUhuVE5kUXhKbVFNRGJpeGNHQnMxeDZiZzVIamNnOXlCbTNPajhvZlJTejE4?=
 =?utf-8?B?K2k2bHRLWG9HVlM1Mm1CTVNPZjRpOEpoMjZqeE5oN0NlNTZGdXdUb2ZkVzFw?=
 =?utf-8?B?N1FOTFNuK1lBaXhWb1dPSlI1dUpPZ2t5em5jT2pFTi9nZndoeE5oNFRDQ2tj?=
 =?utf-8?B?WnJOMjIrWC9ISlI4bERKdGpEd2JiS2pjL0pXRm9DSWJueWs5ME5xRS9Ccll4?=
 =?utf-8?B?aFNjMFQ4WmF6TVA4bUpzMjNETUc0endtN09xLzhkWDc1ekE0aVE5eDE3UFd4?=
 =?utf-8?B?SnpJWURBZDloaFRENDhJOWNXcDNFN3NNZTBVNm1NdFM4TjdVMGQvdjYzS21w?=
 =?utf-8?B?YlEvVkNVVlh0TEZEWWdIczdwd3NZclNQMURvTUxtRGFzUWFlQ3lYV0E5TW8v?=
 =?utf-8?B?bVpPTzhJQkZ2bzFrU0FjRitkRjBqZmRpTit4eHZaM3ZhS1RFRExheDU4dmk1?=
 =?utf-8?B?b3hSNDFsd0N4TytQaHR2bGhJMHpnS3BPbnRobWxLR0N6VS8yay8zN3lxZmlR?=
 =?utf-8?B?WkZBblNmRWMyOWpNcjBOOFZRVmFQZ2FseHlid1ByOURLZFNYSTRZTDZiUlpx?=
 =?utf-8?B?eUFFR2pvRmRIYkdXMjR5V3lzZHpNTjNjR3RjNVRhZ1ZUVVpXcnAvZXc1c2Jy?=
 =?utf-8?B?aUcvT2ZtcjloZ1JvNEhoaGJkK2plZTBuRmFucHhSODRRbHJhRTNGR3BlS0lV?=
 =?utf-8?B?NnNLbE5YbDlzNW5mL3Y1UFhCdW9KVEVDQ0tEZnZaYnJMSzkxNU1ORjBkREhx?=
 =?utf-8?B?N0U1RURIUC9JbXRrMm41b3FUZUJoY29xT3IwbEFvV3lSS0VzcnFkWkllV2kv?=
 =?utf-8?B?YVE9PQ==?=
Content-ID: <425A18FB6505FE49844590A92F656900@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80763cdf-6764-4b51-4102-08dcf7e7c0ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 07:03:12.2230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: on9QpNjkfB1C+eX0G6XOYlydpK+36FVCIHdXZM3By/l66ZzA6yZPAzU0c2C+Rz0e1Kbp55pcRnisP8461NxN8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7663
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1081863208.1355973614"
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

--__=_Part_Boundary_009_1081863208.1355973614
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSB0b3AgbWVkaWEgZGV2aWNlIGRy
aXZlciBmb3IgdGhlIE1lZGlhVGVrIElTUDdYIENBTVNZUy4NCj4gVGhlIGRyaXZlciBtYWludGFp
bnMgdGhlIGNhbWVyYSBzeXN0ZW0sIGluY2x1ZGluZyBzdWItZGV2aWNlIG1hbmFnZW1lbnQsDQo+
IERNQSBvcGVyYXRpb25zLCBhbmQgaW50ZWdyYXRpb24gd2l0aCB0aGUgVjRMMiBmcmFtZXdvcmsu
IEl0IGhhbmRsZXMNCj4gcmVxdWVzdCBzdHJlYW0gZGF0YSwgYnVmZmVyIG1hbmFnZW1lbnQsIGFu
ZCBNZWRpYVRlay1zcGVjaWZpYyBmZWF0dXJlcywNCj4gYW5kIHBpcGVsaW5lIG1hbmFnZW1lbnQs
IHN0cmVhbWluZyBjb250cm9sLCBlcnJvciBoYW5kbGluZyBtZWNoYW5pc20uDQo+IEFkZGl0aW9u
YWxseSwgaXQgYWdncmVnYXRlcyBzdWItZHJpdmVycyBmb3IgdGhlIGNhbWVyYSBpbnRlcmZhY2Us
IHJhdw0KPiBhbmQgeXV2IHBpcGVsaW5lcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lh
bmcgWWFuZyA8U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0K
DQo+ICtzdHJ1Y3QgbXRrX2NhbV9kZXZpY2Ugew0KPiArCXN0cnVjdCBkZXZpY2UgKmRldjsNCj4g
Kw0KPiArCXN0cnVjdCB2NGwyX2RldmljZSB2NGwyX2RldjsNCj4gKwlzdHJ1Y3QgdjRsMl9hc3lu
Y19ub3RpZmllciBub3RpZmllcjsNCj4gKwlzdHJ1Y3QgbWVkaWFfZGV2aWNlIG1lZGlhX2RldjsN
Cj4gKwl2b2lkIF9faW9tZW0gKmJhc2U7DQo+ICsNCj4gKwlzdHJ1Y3QgbXRrX3NjcCAqc2NwOw0K
PiArCXN0cnVjdCBkZXZpY2UgKnNtZW1fZGV2Ow0KPiArCXBoYW5kbGUgcnByb2NfcGhhbmRsZTsN
Cj4gKwlzdHJ1Y3QgcnByb2MgKnJwcm9jX2hhbmRsZTsNCj4gKw0KPiArCXVuc2lnbmVkIGludCBj
b21wb3Nlcl9jbnQ7DQo+ICsNCj4gKwl1bnNpZ25lZCBpbnQgbnVtX3NlbmluZl9kZXZpY2VzOw0K
PiArCXVuc2lnbmVkIGludCBudW1fcmF3X2RldmljZXM7DQo+ICsJdW5zaWduZWQgaW50IG51bV9s
YXJiX2RldmljZXM7DQo+ICsNCj4gKwkvKiByYXdfcGlwZSBjb250cm9sbGVyIHN1YmRldiAqLw0K
PiArCXN0cnVjdCBtdGtfcmF3IHJhdzsNCj4gKwlzdHJ1Y3QgbXV0ZXggcXVldWVfbG9jazsgLyog
cHJvdGVjdCBxdWV1ZSByZXF1ZXN0ICovDQo+ICsNCj4gKwl1bnNpZ25lZCBpbnQgbWF4X3N0cmVh
bV9udW07DQo+ICsJdW5zaWduZWQgaW50IHN0cmVhbWluZ19jdHg7DQo+ICsJdW5zaWduZWQgaW50
IHN0cmVhbWluZ19waXBlOw0KPiArCXN0cnVjdCBtdGtfY2FtX2N0eCAqY3R4czsNCj4gKw0KPiAr
CS8qIHJlcXVlc3QgcmVsYXRlZCAqLw0KPiArCXN0cnVjdCBsaXN0X2hlYWQgcGVuZGluZ19qb2Jf
bGlzdDsNCj4gKwlzcGlubG9ja190IHBlbmRpbmdfam9iX2xvY2s7IC8qIHByb3RlY3QgcGVuZGlu
Z19qb2JfbGlzdCAqLw0KPiArCXN0cnVjdCBsaXN0X2hlYWQgcnVubmluZ19qb2JfbGlzdDsNCj4g
Kwl1bnNpZ25lZCBpbnQgcnVubmluZ19qb2JfY291bnQ7DQo+ICsJc3BpbmxvY2tfdCBydW5uaW5n
X2pvYl9sb2NrOyAvKiBwcm90ZWN0IHJ1bm5pbmdfam9iX2xpc3QgKi8NCj4gKw0KPiArCS8qIHN0
YW5kYXJkIHY0bDIgYnVmZmVyIGNvbnRyb2wgKi8NCj4gKwlzdHJ1Y3QgbGlzdF9oZWFkIGRtYV9w
ZW5kaW5nOw0KPiArCXNwaW5sb2NrX3QgZG1hX3BlbmRpbmdfbG9jazsgLyogcHJvdGVjdCBkbWFf
cGVuZGluZ19saXN0ICovDQo+ICsJc3RydWN0IGxpc3RfaGVhZCBkbWFfcHJvY2Vzc2luZzsNCj4g
KwlzcGlubG9ja190IGRtYV9wcm9jZXNzaW5nX2xvY2s7IC8qIHByb3RlY3QgZG1hX3Byb2Nlc3Np
bmdfbGlzdCBhbmQgZG1hX3Byb2Nlc3NpbmdfY291bnQgKi8NCj4gKwl1bnNpZ25lZCBpbnQgZG1h
X3Byb2Nlc3NpbmdfY291bnQ7DQoNCkkgd291bGQgbGlrZSBzY3AtcmVsYXRlZCB2YXJpYWJsZSBo
YXMgdGhlIHNjcCBwcmVmaXguDQoNCnN0cnVjdCBsaXN0X2hlYWQgc2NwX2RtYV9wcm9jZXNzaW5n
Ow0Kc3BpbmxvY2tfdCBzY3BfZG1hX3Byb2Nlc3NpbmdfbG9jazsNCnVuc2lnbmVkIGludCBzY3Bf
ZG1hX3Byb2Nlc3NpbmdfY291bnQ7DQoNClNvIGl0J3MgZWFzeSB0byB1bmRlcnN0YW5kIHRoYXQg
c2NwX2RtYV9wcm9jZXNzaW5nX2NvdW50J3MgbWF4IHZhbHVlIGlzIDIuDQpPbmUgYnVmZmVyIGlz
IGN1cnJlbnRseSBkb2luZyBkbWEsIGFuZCBhbm90aGVyIG9uZSBpcyB3YWl0aW5nIGZvciBkbWEu
IEJvdGggYnVmZmVyIGFyZSBxdWV1ZWQgaW4gc2NwLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArDQo+
ICsJc3RydWN0IG10a19jYW1fZGVidWdfZnMgKmRlYnVnX2ZzOw0KPiArCXN0cnVjdCB3b3JrcXVl
dWVfc3RydWN0ICpkZWJ1Z193cTsNCj4gKwlzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqZGVidWdf
ZXhjZXB0aW9uX3dxOw0KPiArCXdhaXRfcXVldWVfaGVhZF90IGRlYnVnX2V4Y2VwdGlvbl93YWl0
cTsNCj4gK307DQo+ICsNCg0K

--__=_Part_Boundary_009_1081863208.1355973614
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dGhlJiMzMjt0
b3AmIzMyO21lZGlhJiMzMjtkZXZpY2UmIzMyO2RyaXZlciYjMzI7Zm9yJiMzMjt0aGUmIzMyO01l
ZGlhVGVrJiMzMjtJU1A3WCYjMzI7Q0FNU1lTLg0KJmd0OyYjMzI7VGhlJiMzMjtkcml2ZXImIzMy
O21haW50YWlucyYjMzI7dGhlJiMzMjtjYW1lcmEmIzMyO3N5c3RlbSwmIzMyO2luY2x1ZGluZyYj
MzI7c3ViLWRldmljZSYjMzI7bWFuYWdlbWVudCwNCiZndDsmIzMyO0RNQSYjMzI7b3BlcmF0aW9u
cywmIzMyO2FuZCYjMzI7aW50ZWdyYXRpb24mIzMyO3dpdGgmIzMyO3RoZSYjMzI7VjRMMiYjMzI7
ZnJhbWV3b3JrLiYjMzI7SXQmIzMyO2hhbmRsZXMNCiZndDsmIzMyO3JlcXVlc3QmIzMyO3N0cmVh
bSYjMzI7ZGF0YSwmIzMyO2J1ZmZlciYjMzI7bWFuYWdlbWVudCwmIzMyO2FuZCYjMzI7TWVkaWFU
ZWstc3BlY2lmaWMmIzMyO2ZlYXR1cmVzLA0KJmd0OyYjMzI7YW5kJiMzMjtwaXBlbGluZSYjMzI7
bWFuYWdlbWVudCwmIzMyO3N0cmVhbWluZyYjMzI7Y29udHJvbCwmIzMyO2Vycm9yJiMzMjtoYW5k
bGluZyYjMzI7bWVjaGFuaXNtLg0KJmd0OyYjMzI7QWRkaXRpb25hbGx5LCYjMzI7aXQmIzMyO2Fn
Z3JlZ2F0ZXMmIzMyO3N1Yi1kcml2ZXJzJiMzMjtmb3ImIzMyO3RoZSYjMzI7Y2FtZXJhJiMzMjtp
bnRlcmZhY2UsJiMzMjtyYXcNCiZndDsmIzMyO2FuZCYjMzI7eXV2JiMzMjtwaXBlbGluZXMuDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTaHUtaHNpYW5nJiMzMjtZYW5n
JiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0K
DQpbc25pcF0NCg0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX2NhbV9kZXZpY2UmIzMyO3sNCiZn
dDsmIzMyOytzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldjsNCiZndDsmIzMyOysNCiZndDsmIzMy
OytzdHJ1Y3QmIzMyO3Y0bDJfZGV2aWNlJiMzMjt2NGwyX2RldjsNCiZndDsmIzMyOytzdHJ1Y3Qm
IzMyO3Y0bDJfYXN5bmNfbm90aWZpZXImIzMyO25vdGlmaWVyOw0KJmd0OyYjMzI7K3N0cnVjdCYj
MzI7bWVkaWFfZGV2aWNlJiMzMjttZWRpYV9kZXY7DQomZ3Q7JiMzMjsrdm9pZCYjMzI7X19pb21l
bSYjMzI7KmJhc2U7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdGtfc2NwJiMz
Mjsqc2NwOw0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqc21lbV9kZXY7DQomZ3Q7
JiMzMjsrcGhhbmRsZSYjMzI7cnByb2NfcGhhbmRsZTsNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO3Jw
cm9jJiMzMjsqcnByb2NfaGFuZGxlOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3Vuc2lnbmVkJiMz
MjtpbnQmIzMyO2NvbXBvc2VyX2NudDsNCiZndDsmIzMyOysNCiZndDsmIzMyOyt1bnNpZ25lZCYj
MzI7aW50JiMzMjtudW1fc2VuaW5mX2RldmljZXM7DQomZ3Q7JiMzMjsrdW5zaWduZWQmIzMyO2lu
dCYjMzI7bnVtX3Jhd19kZXZpY2VzOw0KJmd0OyYjMzI7K3Vuc2lnbmVkJiMzMjtpbnQmIzMyO251
bV9sYXJiX2RldmljZXM7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrLyomIzMyO3Jhd19waXBlJiMz
Mjtjb250cm9sbGVyJiMzMjtzdWJkZXYmIzMyOyovDQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdGtf
cmF3JiMzMjtyYXc7DQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdXRleCYjMzI7cXVldWVfbG9jazsm
IzMyOy8qJiMzMjtwcm90ZWN0JiMzMjtxdWV1ZSYjMzI7cmVxdWVzdCYjMzI7Ki8NCiZndDsmIzMy
OysNCiZndDsmIzMyOyt1bnNpZ25lZCYjMzI7aW50JiMzMjttYXhfc3RyZWFtX251bTsNCiZndDsm
IzMyOyt1bnNpZ25lZCYjMzI7aW50JiMzMjtzdHJlYW1pbmdfY3R4Ow0KJmd0OyYjMzI7K3Vuc2ln
bmVkJiMzMjtpbnQmIzMyO3N0cmVhbWluZ19waXBlOw0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRr
X2NhbV9jdHgmIzMyOypjdHhzOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7Ky8qJiMzMjtyZXF1ZXN0
JiMzMjtyZWxhdGVkJiMzMjsqLw0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bGlzdF9oZWFkJiMzMjtw
ZW5kaW5nX2pvYl9saXN0Ow0KJmd0OyYjMzI7K3NwaW5sb2NrX3QmIzMyO3BlbmRpbmdfam9iX2xv
Y2s7JiMzMjsvKiYjMzI7cHJvdGVjdCYjMzI7cGVuZGluZ19qb2JfbGlzdCYjMzI7Ki8NCiZndDsm
IzMyOytzdHJ1Y3QmIzMyO2xpc3RfaGVhZCYjMzI7cnVubmluZ19qb2JfbGlzdDsNCiZndDsmIzMy
Oyt1bnNpZ25lZCYjMzI7aW50JiMzMjtydW5uaW5nX2pvYl9jb3VudDsNCiZndDsmIzMyOytzcGlu
bG9ja190JiMzMjtydW5uaW5nX2pvYl9sb2NrOyYjMzI7LyomIzMyO3Byb3RlY3QmIzMyO3J1bm5p
bmdfam9iX2xpc3QmIzMyOyovDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrLyomIzMyO3N0YW5kYXJk
JiMzMjt2NGwyJiMzMjtidWZmZXImIzMyO2NvbnRyb2wmIzMyOyovDQomZ3Q7JiMzMjsrc3RydWN0
JiMzMjtsaXN0X2hlYWQmIzMyO2RtYV9wZW5kaW5nOw0KJmd0OyYjMzI7K3NwaW5sb2NrX3QmIzMy
O2RtYV9wZW5kaW5nX2xvY2s7JiMzMjsvKiYjMzI7cHJvdGVjdCYjMzI7ZG1hX3BlbmRpbmdfbGlz
dCYjMzI7Ki8NCiZndDsmIzMyOytzdHJ1Y3QmIzMyO2xpc3RfaGVhZCYjMzI7ZG1hX3Byb2Nlc3Np
bmc7DQomZ3Q7JiMzMjsrc3BpbmxvY2tfdCYjMzI7ZG1hX3Byb2Nlc3NpbmdfbG9jazsmIzMyOy8q
JiMzMjtwcm90ZWN0JiMzMjtkbWFfcHJvY2Vzc2luZ19saXN0JiMzMjthbmQmIzMyO2RtYV9wcm9j
ZXNzaW5nX2NvdW50JiMzMjsqLw0KJmd0OyYjMzI7K3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2RtYV9w
cm9jZXNzaW5nX2NvdW50Ow0KDQpJJiMzMjt3b3VsZCYjMzI7bGlrZSYjMzI7c2NwLXJlbGF0ZWQm
IzMyO3ZhcmlhYmxlJiMzMjtoYXMmIzMyO3RoZSYjMzI7c2NwJiMzMjtwcmVmaXguDQoNCnN0cnVj
dCYjMzI7bGlzdF9oZWFkJiMzMjtzY3BfZG1hX3Byb2Nlc3Npbmc7DQpzcGlubG9ja190JiMzMjtz
Y3BfZG1hX3Byb2Nlc3NpbmdfbG9jazsNCnVuc2lnbmVkJiMzMjtpbnQmIzMyO3NjcF9kbWFfcHJv
Y2Vzc2luZ19jb3VudDsNCg0KU28mIzMyO2l0JiMzOTtzJiMzMjtlYXN5JiMzMjt0byYjMzI7dW5k
ZXJzdGFuZCYjMzI7dGhhdCYjMzI7c2NwX2RtYV9wcm9jZXNzaW5nX2NvdW50JiMzOTtzJiMzMjtt
YXgmIzMyO3ZhbHVlJiMzMjtpcyYjMzI7Mi4NCk9uZSYjMzI7YnVmZmVyJiMzMjtpcyYjMzI7Y3Vy
cmVudGx5JiMzMjtkb2luZyYjMzI7ZG1hLCYjMzI7YW5kJiMzMjthbm90aGVyJiMzMjtvbmUmIzMy
O2lzJiMzMjt3YWl0aW5nJiMzMjtmb3ImIzMyO2RtYS4mIzMyO0JvdGgmIzMyO2J1ZmZlciYjMzI7
YXJlJiMzMjtxdWV1ZWQmIzMyO2luJiMzMjtzY3AuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMz
MjsrDQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdGtfY2FtX2RlYnVnX2ZzJiMzMjsqZGVidWdfZnM7
DQomZ3Q7JiMzMjsrc3RydWN0JiMzMjt3b3JrcXVldWVfc3RydWN0JiMzMjsqZGVidWdfd3E7DQom
Z3Q7JiMzMjsrc3RydWN0JiMzMjt3b3JrcXVldWVfc3RydWN0JiMzMjsqZGVidWdfZXhjZXB0aW9u
X3dxOw0KJmd0OyYjMzI7K3dhaXRfcXVldWVfaGVhZF90JiMzMjtkZWJ1Z19leGNlcHRpb25fd2Fp
dHE7DQomZ3Q7JiMzMjsrfTsNCiZndDsmIzMyOysNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9o
dG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBD
b25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1h
dGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0
dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwg
b3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3
cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVk
IHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHBy
aW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0
cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBw
cm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5k
ZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZl
IHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIg
DQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFu
ZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMp
IGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRo
aXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_009_1081863208.1355973614--


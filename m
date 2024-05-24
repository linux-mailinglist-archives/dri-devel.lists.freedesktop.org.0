Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE178CE0F7
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 08:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993D810E0F6;
	Fri, 24 May 2024 06:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Xwr7LXwS";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="oSajkaYO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE2C10E0F6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 06:21:13 +0000 (UTC)
X-UUID: cdf4ceba199511efbfff99f2466cf0b4-20240524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=kPvDicj8mUsK+MV6DhDYSkisBmhqD10LZbYH74bXv3Y=; 
 b=Xwr7LXwSqYXKtj9Gb+iW31HFjJb5VcH8ckObrl2gc3I8VdX73Sv+IdByaujiy/7Lq1KTvwHiM0lW8YwLqT3GX8UAMWdH3rGvj13L1i9Wg1bgxTT76mLu59ZjlDCqvVCL9qwRntQTnsPAAvLODVMyzqmmSmimn4l8OH4JI/vWxWc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:93cbb996-ee4c-4b06-a87e-3c3f78feec14, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:f967c287-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: cdf4ceba199511efbfff99f2466cf0b4-20240524
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1875889998; Fri, 24 May 2024 14:21:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 24 May 2024 14:21:05 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 24 May 2024 14:21:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPAri1j4FFLtX/5T5PsTztbqh4RDuL5gKQ+7cf4bEM0uQBkQRcnbgxdl2u4EIogx7+ZZvaGXbUY4AWxUaRQSm8TvLnJsMwDpzjs1N47rlxWILMlO56IrmHLGJHmTQHScsebQSvB6yohIGflWt0NWBHctUv6NMPN0bkZhzqknLRIXR0XuYLnXwbSaWlozEeWtMBJ3pmiOvgc6YmtQ0ZSx5QTSrL7OQAW/ZAryi2Gmph8B3TzNoi7J21B9CM8ZnZlmIIOUKC+KPiJ8rMU1iJBp3hnakicrKhwiS46d5CwqXxp+NI0XlrXlA+5dzIPlzuG0rDFcD66gwk6tbDWvI/FpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMT+VGTSNtENK7R9XZalIGb9wat7uw7cdeXTNKqorvA=;
 b=XirrgTNySWwRrH55DuyDQByf/i55O3YTDW71vGlRsIuh9wfttxKmApazTkRqgffC4utXFTUpW1EfuRmC+Ctjzgw7CBOuYMSII0TN/fwbZJ3GVB30z48cXERdfooF4frtFbKA2MWy+9ZtThrrNk1DAL3ZsCXbRNX1S/VTWi6/DGWpNMgzj3hiuxH13RcZ0R7gvW0xFp/7AT/o+Jp9CKOAIFgiI87/BIOAHeURwjUGE81RQeirrLfIHQdHy+PbdhxH0PkSKtL0t1e9f0dxaQe3AqrEBPsn+R5wlS19hMCiv9h+0qcetLGNgp3jZPzUA09KOyGoIvUQgp2ZvlfYiF/lUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMT+VGTSNtENK7R9XZalIGb9wat7uw7cdeXTNKqorvA=;
 b=oSajkaYO7GzyIG2fO9o+S9rcasNOKh7AYPQP2NITOza9OmEOoYXj1jaMZ9ufzQjfUKsujgpE9TyDoDwx7/Gm/Pu/DUpKiPr8l9ubqTJi3YQM7Z8iqmIOCBIZ7yXNJhvX67PGtmjnuAFTDfAqTIQFUrnClSSRttDshHw32eCxskM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6728.apcprd03.prod.outlook.com (2603:1096:400:216::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17; Fri, 24 May
 2024 06:21:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 06:21:02 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "mripard@kernel.org" <mripard@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "amergnat@baylibre.com" <amergnat@baylibre.com>,
 "robh@kernel.org" <robh@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "will@kernel.org"
 <will@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 04/15] dt-bindings: display: mediatek: dither: add
 compatible for MT8365 SoC
Thread-Topic: [PATCH v4 04/15] dt-bindings: display: mediatek: dither: add
 compatible for MT8365 SoC
Thread-Index: AQHarQ/H9gSdWVtoOECvTWy2hWyF7LGl6viA
Date: Fri, 24 May 2024 06:21:02 +0000
Message-ID: <5f6ddd5b37a7dc4b5efb7c19c63e84d3b25b3d29.camel@mediatek.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
 <20231023-display-support-v4-4-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-4-ed82eb168fb1@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6728:EE_
x-ms-office365-filtering-correlation-id: 03e9f745-dbce-49b4-a19b-08dc7bb9af86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|7416005|366007|1800799015|921011|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?YUorVFN3cTBlZWJSaEZ2ZmczejRoNzc3RkxtSVo3aEkrb3JmSGdpTEhtRTY5?=
 =?utf-8?B?RGdNLythSG9EV0Z3MWUyd1NTUVFyR2xUbkViM2pGL2xwYjRIQTByZnZhMWZr?=
 =?utf-8?B?VTVNMklnR2svM3IyVW4yMk5XaHRMUFZ1cTBQT1lFK0FXR00zVWFENHgyczc1?=
 =?utf-8?B?SXZxZHpHZElsZStBSTlGTmt5L0l1T1N6TmFhVGxLR2haQVNnY1BIMnJyQ0Jy?=
 =?utf-8?B?L0JJZ1pLTi9OTGtJdlVZaUFuKzdQaldka3dlSldpV2VVT2JUeEptMGYwYzRG?=
 =?utf-8?B?dVh3aEtTb0VGNDJMeWxScFVoTTlSMi9WN1ZrV3VqekM4UlV3Wi9aUFNWVmtJ?=
 =?utf-8?B?NFJkSWprK2cyQzNTSmt2dWFKcFJlMHFaVWdaRkdkVDRzVFdvcXFUOEl0akpN?=
 =?utf-8?B?bDgxbVEvTXZtcTZwT0RXZ0o5T1NUZ04rWUdMMWN4OG9ZMnhTNVZzbElRSkJU?=
 =?utf-8?B?d2dyL3FYcVdsQ0xEQjB5bTNsanlwRWFuMVhmRXdOSzRrb2FHZ25PY3IvREgr?=
 =?utf-8?B?cVhLdXV3RkxodjJRQ3AzbEFRMEE3QlM3S253bnhQUndHSW9UckJKVlJpaUpo?=
 =?utf-8?B?dVM5U210MjJUUitybVRGRmRiTVF1K1M1bSthSDJ6VmsxNWhFM2ZNYUdwNm43?=
 =?utf-8?B?aGZIU1lTTUg3NStnVFhUOUx2SlNUcHVUcVVYT0RvWU9pVmR5TloxdTNtSXJw?=
 =?utf-8?B?S2gzSk1BcnRZNEkxRFVEVmtEek9iSEdCY0VmV0QrUzFHSEE1UDd6Wkg2TXFp?=
 =?utf-8?B?eHJHRUtvMmRvb0lVWDdQR3NGV1pmYzFJbFE2UzRGUEhCWXZNOUpETW8veUdt?=
 =?utf-8?B?UDN3c0RMU2cwbmZNK2hIVk92Nk92dTRZdS9PcW9kaXRWd1dzdzZVN1hPaldn?=
 =?utf-8?B?TDJueW4ydlRlVVNBbEhyM25LbElkNUNMRG1nVnZBTWVpOVUrVFc1M3AvNXNr?=
 =?utf-8?B?MmMxK0hhV242VGl2ajNOZllNbVZJZk1HU2F2NWJobXJoY2pxUVI0MTF1TTRp?=
 =?utf-8?B?YjhtQVVwd2k4OVNpOXo3a25yNGdNVjV2bGJjVWk2alhaS1A4d3ZuMzdPd3pM?=
 =?utf-8?B?YzB2NVA3SC9JU21hSGxOSUJ2WFhxMlBEbDdqUG0vTUxEeVp6ZktHNXE2eFFW?=
 =?utf-8?B?ZlA5TjdLemFXOGliT3dBcGZPWE4vTWpXS29jZkZrRlRlNEhPVGNkZVMzcUdr?=
 =?utf-8?B?UFVVL3crY2kyRW53V2tKOG41cnJoZmVSQVB4dlVoSWQzRWRtNlVJQ3NnMHF6?=
 =?utf-8?B?L0R3ZktxbUxwZ3RJT1BRUEN4QTl3U3ZUTm9VM255U0x2Y3ZBNmZ6anV1Y09h?=
 =?utf-8?B?T0o0WXEwWVhPdkJCOXFrZWJQa3JyNWVRZmdrNlhUOGZyOTZJUzk4Q0RnbU5B?=
 =?utf-8?B?QTc3aGRGanlTZTkzdHBidVU2TGhDS3JBemJHR2ZKNXlMbXRDME1ZUjVqQ2ht?=
 =?utf-8?B?SU5sS2puWVZ2YlZxTmptSDBIODBabE1RSXdMRDBLTnFHbEI1TzNuVFFVVFFW?=
 =?utf-8?B?NklmcEJFbVViaEdIbmJvVzlKTEcvV1ZvU0NxallmaWx0MWY0VFU2QThtUk1T?=
 =?utf-8?B?MXhMcDlYMzJuUEdsOGcxZmdMOWpxdWZsd3hQK0Zvb01BcFhrZ0lMOElWVzdv?=
 =?utf-8?B?R3MvZVVFV0lsWkNMdTFkNThXTTNzaFlwd2Zad1ZZVVAyRGtueitIeDQ2Tjh6?=
 =?utf-8?B?UHdUWTFuM3c2SHNhdGc4UTVLcEhZUEV0M3VzU2FDbWZhMFErZEQ4SkM0M1Yw?=
 =?utf-8?B?ejZPejRvWUlCOUtsR1N3NUdjS0tJZXU4RXBmUXRmYjVrYzRsQnNoTys3RnVP?=
 =?utf-8?B?NnY5bDFteXBYcGZIK2lVQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(366007)(1800799015)(921011)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmZoUTdoYmtiR2lDMTlVUmpCU1czVDBpSHhtZDRZSmRNQlZwQ0dURm80cGxQ?=
 =?utf-8?B?cW1HaGtkM2lvb0JacC9XcU95eUpURExUdDJOc0t3U0hoblE2ck9VSWoyWDEv?=
 =?utf-8?B?MkdBSHJwUUdYU1JyUEdyWENVVW5lMHZlK1RiVHV1QjFycUtmcEt5SElycmtQ?=
 =?utf-8?B?SzJEVnZFSUoyVkZuZ25xSURBZ1JoSlZoTzRabEFxaTlTNG5FaXRUTmNtQk1n?=
 =?utf-8?B?MGpEZGJ5OU5FaWJvYXF1dFBXbjRQTEhyZFhhT3hmUU5TMVZGcUNHS1IxeTN4?=
 =?utf-8?B?WTJUenB4MEU1azBSM2VrM1YvVWRFMjNlcEhYUVllcG0zK3NxbFgvNUU3VmV2?=
 =?utf-8?B?NlZmb3lWc2I3K3R1RXd0NEdHczBiRnFBUjNwVGp4bmhneVVJREcyQTJ4QUxl?=
 =?utf-8?B?UW5zYkVMckRYeisvNGpGTVlGS3dUcnlRbXBXUXVmdlVqblA2MGRmUFlvb1hT?=
 =?utf-8?B?RlRWRVIrbkJTL1hHdGtUTVVUazJ0SjlVU3loV1NUOXFuMjlpTlhkVGhUVHFD?=
 =?utf-8?B?aVdDQlRTZTh2OUVBTWRUQ1Y3VXNzbC82VnRGK3FJUC9qRVFGWUlhakx1cHZH?=
 =?utf-8?B?UTVaN1lBT3ZsUkRESUFsMU5lZ1N0bWlEY1cwOTY0V3hmMm1LemkveGNjbjZP?=
 =?utf-8?B?R1l5a2NRR1N6cWtsbDJJNFFBWnU4REdFOTV6WWRKekd5YkJlYVhkbE94V3VL?=
 =?utf-8?B?WDJQZGdtRlU3b2l4eFl6dWdKcXRsbmNIWmo0VjlrMngwVEhHSm9VNUQrd2ww?=
 =?utf-8?B?UGZSVmM3eWU5a0pmV0tqdmJzb3FVeWVsQ2lFRWRmVkJZY3pGLzNscEIyNVdy?=
 =?utf-8?B?WkZLV3FkRmJNUWZjcWROK1RWZWpPa3RSZ0YxNC9ORG5iTVI4Q2k1aUNnSC8r?=
 =?utf-8?B?RitkeFV6QTRJM05uRUZraXNFNURXUENlQ1M0RWRLdVJ1MHByVG5DNVJXVzJp?=
 =?utf-8?B?ZWc0NmtRejVzT1ZEaHZEaTJ5MStRWFgyYStPVnkrOXZOZHFiYUx3dUNNWFpl?=
 =?utf-8?B?QnlyOTRMQ1J6aXN1RWJCUVN0S3RXZWw1Q01wd20yZzVHQzREbVBtUVhHK2lM?=
 =?utf-8?B?QTF1RFVHWUVzUTlkdldvVjlyTnk1KzZ4aFFpWUFBeWxYa3c3YkNpSzVtSW5N?=
 =?utf-8?B?LzhsUUFpUkZDbFFUSTJWZTJhcUhsSGhVMDYyYnJVN0ZKNktUWTVBREZvWU95?=
 =?utf-8?B?RG4xRmpjazJLMmFxRVcvai9sdTU0cVVydDA1MDhrbHFMekVLbVdxSXE0ZFhQ?=
 =?utf-8?B?cUJneDRQWVhRVzBhSFNXM3pXSGliTS9FVXJ5L1lnSFMwNWxBV2pnNThvd29q?=
 =?utf-8?B?SXdNT0hQNzIvOFcyV3hpbG5WTGNXRys5Wld5dGloRWVvd1RVaC9JaHFDQi9T?=
 =?utf-8?B?ZFRzdzJnSHpZMW5NeDdoYVlkVldIQTNsOS90QUlNc3hPU2NIc0h5OWN3ZUlO?=
 =?utf-8?B?c2tMbzFkRUR4dkVPYThybThUSmhSb1dSODl6M1h0M2NndHZtdFExN1J4Tndu?=
 =?utf-8?B?UzN0WG9yL0w3RlhTaDZxT09pYTA1OVhWWVQxWFlOWXREZzNULzBtY2VSNS9O?=
 =?utf-8?B?OHAyVk5USTBSYUNpajJEdC9OMFNhcjYyaXFsRzhBdUNibllydFdXRVUraVhL?=
 =?utf-8?B?V2lZaVlybVVvYlBBdGJrOFJjdjNRbWFaYytoTXpyVEdONTA1QXRrUDdQYTJi?=
 =?utf-8?B?N3FEQUhEQkxJN3hNVmlwMFYzMG8vWGFjL0xEM3JNUjdmb0tvQTV2TGZGU0ta?=
 =?utf-8?B?aDZPNTFCZ2lpa0k0OFNUUEdOUlhhZ09GY2srdWU4UDFjeHh4TWtkSFhERm9l?=
 =?utf-8?B?elc0WndBc3hkQnRwNWMzOW1hUDg2Q3NuUGxiSFhtUnpQYlh1alNlZnBnWHhB?=
 =?utf-8?B?ZEVFdStsWlNmRzU4aE5wZ20wV0t6aysrQ1kzQ01JK0JkWnBtTitBaGJZSFRW?=
 =?utf-8?B?dE9hM0xJOFZRa29CdjhjMEpFMzBEeU1paHNhOGNBYUlxZ0JyeWNsR21RVmZK?=
 =?utf-8?B?UFYxWHFyUXcrSndJc0EwNmZEbkJaUGFXMWZjWDN3bHlPSVJqNVU5bHR3c2VJ?=
 =?utf-8?B?aFhsUmw2MVpBWERpNEl3a3BOa2dQckN4VHdUc3A3NzF4SGJXUzEwWEhaUHVD?=
 =?utf-8?Q?8mZLizUFxwxeyHN/nVYx9u/TN?=
Content-ID: <196B03864C804D44A18C14851546ECC7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e9f745-dbce-49b4-a19b-08dc7bb9af86
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2024 06:21:02.3701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mKB5gtLjbhZUi1tICz/9hy/koFz800eLuk0qglcCv6MwBq/kQ9UzkhZ6q2EZWNPXGXCNDy7RQP9PN3hkVc5gFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6728
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.037300-8.000000
X-TMASE-MatchedRID: pBwXUM+nCwsOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
 qIY+/skQkABPgKBt/0qAvh/bpK+BVAOHW1v+xYUcGVyS87Wb4lxh59nsX2QuC3REeOro/O+v6BX
 hOTEsTTHi8zVgXoAltj2Xsf5MVCB1t7DW3B48kkHdB/CxWTRRu25FeHtsUoHuIV2x2rnpResrmq
 qzh6gqllawkVYnxQqUD9aWEG/btdBfCOKFKuVYGg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.037300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 17539C3D8A1AF457532C39148AE5D638155ACACE7CEB770F1A0D46A42C3E262E2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_825381278.1413657208"
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

--__=_Part_Boundary_006_825381278.1413657208
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFsZXhhbmRyZToNCg0KT24gVGh1LCAyMDI0LTA1LTIzIGF0IDE0OjQ5ICswMjAwLCBBbGV4
YW5kcmUgTWVyZ25hdCB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlm
aWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBEb2N1bWVudCB0aGUgZGlzcGxheSBE
aXRoZXIgb24gTVQ4MzY1LCB3aGljaCBpcyBjb21wYXRpYmxlDQo+IHdpdGggdGhhdCBvZiB0aGUg
TVQ4MTgzLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiAN
Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFJldmll
d2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxy
ZWdub0Bjb2xsYWJvcmEuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgTWVyZ25hdCA8
YW1lcmduYXRAYmF5bGlicmUuY29tPg0KPiAtLS0NCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpdGhlci55YW1sIHwgMSArDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxk
aXRoZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLGRpdGhlci55YW1sDQo+IGluZGV4IDNkNGFiM2Y4NjI5NC4uYWJhZjI3
OTE2ZDEzIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXRoZXIueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXRoZXIu
eWFtbA0KPiBAQCAtMzAsNiArMzAsNyBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgICAgICAgICAgICAt
IG1lZGlhdGVrLG10ODE4OC1kaXNwLWRpdGhlcg0KPiAgICAgICAgICAgICAgICAtIG1lZGlhdGVr
LG10ODE5Mi1kaXNwLWRpdGhlcg0KPiAgICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5NS1k
aXNwLWRpdGhlcg0KPiArICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODM2NS1kaXNwLWRpdGhl
cg0KPiAgICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4My1kaXNwLWRpdGhlcg0KPiAg
DQo+ICAgIHJlZzoNCj4gDQo+IC0tIA0KPiAyLjI1LjENCj4gDQo=

--__=_Part_Boundary_006_825381278.1413657208
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbGV4YW5kcmU6DQoNCk9uJiMzMjtUaHUs
JiMzMjsyMDI0LTA1LTIzJiMzMjthdCYjMzI7MTQ6NDkmIzMyOyswMjAwLCYjMzI7QWxleGFuZHJl
JiMzMjtNZXJnbmF0JiMzMjt3cm90ZToNCiZndDsmIzMyOyYjMzI7JiMzMjsNCiZndDsmIzMyO0V4
dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxlYXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGlj
ayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMzMjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMy
O3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7
dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7JiMzMjtEb2N1bWVudCYjMzI7dGhlJiMzMjtkaXNw
bGF5JiMzMjtEaXRoZXImIzMyO29uJiMzMjtNVDgzNjUsJiMzMjt3aGljaCYjMzI7aXMmIzMyO2Nv
bXBhdGlibGUNCiZndDsmIzMyO3dpdGgmIzMyO3RoYXQmIzMyO29mJiMzMjt0aGUmIzMyO01UODE4
My4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5j
b20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7QWNrZWQtYnk6JiMzMjtSb2ImIzMyO0hlcnJp
bmcmIzMyOyhBcm0pJiMzMjsmbHQ7cm9iaEBrZXJuZWwub3JnJmd0Ow0KJmd0OyYjMzI7UmV2aWV3
ZWQtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7YW5n
ZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7U2lnbmVk
LW9mZi1ieTomIzMyO0FsZXhhbmRyZSYjMzI7TWVyZ25hdCYjMzI7Jmx0O2FtZXJnbmF0QGJheWxp
YnJlLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXRoZXIueWFtbCYj
MzI7fCYjMzI7MSYjMzI7Kw0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYj
MzI7MSYjMzI7aW5zZXJ0aW9uKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0
JiMzMjthL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLGRpdGhlci55YW1sJiMzMjtiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpdGhlci55YW1sDQomZ3Q7JiMzMjtpbmRl
eCYjMzI7M2Q0YWIzZjg2Mjk0Li5hYmFmMjc5MTZkMTMmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0t
JiMzMjthL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLGRpdGhlci55YW1sDQomZ3Q7JiMzMjsrKysmIzMyO2IvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGl0aGVyLnlhbWwN
CiZndDsmIzMyO0BAJiMzMjstMzAsNiYjMzI7KzMwLDcmIzMyO0BAJiMzMjtwcm9wZXJ0aWVzOg0K
Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7bWVkaWF0ZWssbXQ4MTg4LWRpc3AtZGl0
aGVyDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjttZWRpYXRlayxtdDgxOTItZGlz
cC1kaXRoZXINCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE5
NS1kaXNwLWRpdGhlcg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjttZWRpYXRlayxtdDgz
NjUtZGlzcC1kaXRoZXINCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjtjb25zdDomIzMyO21lZGlhdGVrLG10ODE4My1k
aXNwLWRpdGhlcg0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO3JlZzoN
CiZndDsmIzMyOw0KJmd0OyYjMzI7LS0mIzMyOw0KJmd0OyYjMzI7Mi4yNS4xDQomZ3Q7JiMzMjsN
Cg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJl
PioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioq
KioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1l
c3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwg
cHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xv
c3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5
ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWlu
YXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2Yg
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCBy
ZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwu
IElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3Ig
YmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwg
cGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRo
aXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChp
bmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpk
aXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBU
aGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_006_825381278.1413657208--


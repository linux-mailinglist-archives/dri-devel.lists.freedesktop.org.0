Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53920904857
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 03:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B66D10E0EC;
	Wed, 12 Jun 2024 01:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="hrxtmTll";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="GYwpFZbV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A1110E0EC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 01:22:33 +0000 (UTC)
X-UUID: 3aaf7848285a11efa54bbfbb386b949c-20240612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=6H+Qi7UBsfNa6Ofu9hgi1F+i7ZCg/UATadyjQjP0n6g=; 
 b=hrxtmTllmPJYfIWueAg/DI/v/CzjxD1MwkVfIgHWChMuCs0NGZlExWIYjg0rhLrwiEj3PAmB3pRyXtQ4ogu5Y+UTo5h0MmTtQRDVtnPTgT1YCt04/0bgkz3Iyd4IdYq+15ci5gDlBOrOOs34wjr2M1XWXfziQVflIgBsd6HQuXE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:d3a27bc1-b810-45a1-b76d-2d4258c7aad5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:53197988-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3aaf7848285a11efa54bbfbb386b949c-20240612
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1154630320; Wed, 12 Jun 2024 09:22:26 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Jun 2024 18:22:25 -0700
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 12 Jun 2024 09:22:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fp6OIDwTfb5TmZsWmfuLHBVK7y9xvd7GWYreIJoyxbh9BbVCfN2BiJ5CKZUxRoFZz5xTW3DZVNf4OpS5trckDKkZbUNX4jZC9g/JHeqEP5thsOFUSbbvy+3MK6NO/b8kKhqjT3wh041F6zsZ2My6mLChO8/7LydmSlgVQoe8eWQNGYdHXJJBvE/vbYbVfK7VV4bxVaxrQ4L3FAE4N+pNo2fce6nXF/Oviggr7dIjkoVzUrJRpKI/oIPTJFfL8L48T+slMe7gI1nTX+Drl8J1rg24BLCKJ5gRvxY2O93xE1FpucbrDPrnmxYtaL3vZlpkSkpcFDJPcJz6cicKHNt6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VctdGSIgw8zVzah+jXLCfENk4eOca5ZT5Yqf7XIiO88=;
 b=CYtwNtWvpUVw4nDD8JG57toEVCKlS+AbXC2DQSXXEw+72EsBj5yQE7t0Gtm3ylYXtyvSSaHt7gQvJ2AZ1n/weRkQ1Xj/rcOIhg1QU8b+cEWlVklJLYHyrTnjl9nJD3kn3Lasifh4LSYDzcJlTXLZXh2YdQxTIoyWdFhLI5/Mxsf5y40kcjUzqMTuD/zl5ht/IzVNqfDUFQ5Ea7wfyqTpzO+4vPulxoHi5bQ7uwvrCWLtRPsGzX8HSlYrE6/VqVhfSGKoPdESFr618BPE8J3emkCGi/gezhJj6Kcq1qeUfIyi21T4oNfDJ1Ikqbw6ntXkI6B3/gPSYIMMQLcrRM0kkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VctdGSIgw8zVzah+jXLCfENk4eOca5ZT5Yqf7XIiO88=;
 b=GYwpFZbVMUVkGF8acm/mMprCzuaFVSpe12BxsuHBIcm9kg4Vote345Ap0JINSQVi6fZAa0oJDmeoDdD8AkVOfm2Vyqn7VRc7iFNYwgxuYPNyiw3jNvDhBPkoPkSxY53mZ42swLpOWp4BYfIhhJuvnNabSigMOthU9wiRREQSnmM=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by TY0PR03MB6654.apcprd03.prod.outlook.com (2603:1096:400:210::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.16; Wed, 12 Jun
 2024 01:22:23 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%5]) with mapi id 15.20.7677.014; Wed, 12 Jun 2024
 01:22:23 +0000
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
Subject: Re: [PATCH v8 14/16] drm/mediatek: Support CRC in display driver
Thread-Topic: [PATCH v8 14/16] drm/mediatek: Support CRC in display driver
Thread-Index: AQHat/PH8mziL+xpxE6Xbq1BFRhh6rHDXgsA
Date: Wed, 12 Jun 2024 01:22:23 +0000
Message-ID: <bfb9375a4338b12a729bccf2254cb3f1cfa62a17.camel@mediatek.com>
References: <20240606092635.27981-1-shawn.sung@mediatek.com>
 <20240606092635.27981-15-shawn.sung@mediatek.com>
In-Reply-To: <20240606092635.27981-15-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|TY0PR03MB6654:EE_
x-ms-office365-filtering-correlation-id: 427ef648-a544-45a8-c8db-08dc8a7e1ca0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230032|376006|7416006|366008|1800799016|38070700010; 
x-microsoft-antispam-message-info: =?utf-8?B?MEtCVlQxSUFCYnFhU2NubjEwTHZPcWY0ZGhnODdXbHlxeUhuVFpCZDBiRTZ2?=
 =?utf-8?B?TXhOMUpyUmF0SGwrK29sbmN6UEE2bTA3Q04xRjJpOGlmZ00yNEhXVjMxUHA3?=
 =?utf-8?B?cGxVOS83NFE3c2RhYUR2Vjc4WFloekdQZDRsWkVVVk4wY0lOQVhabkVVTDJF?=
 =?utf-8?B?YyswS3IxYS9HcHUzQWNkZGtzWHJpWkgrc0I4RkFyNW1GM1hGMTc0czZhTk9P?=
 =?utf-8?B?SEkyZy9Xa0NjMGluUm1HclUyQW1PVkhiOEduY0RkSGZldXdhZzZWTUJ2b243?=
 =?utf-8?B?SHlFVDBHcXNHSlhNU3U3Tm9qZDNzSE82UjNVZkN5bldJQk5XM2NvamhuaFpq?=
 =?utf-8?B?VCtLWXRjOWZabE1Kc2o1cFpzNGwyaTdQZGsvTWlXd0RSN0Vjbm1PMEJ4M25N?=
 =?utf-8?B?ZnNBWDRxUFpGb0JWRHN2VnFlVk4zVVJESVZraDdPNThEYmlRMjFvOExRMm1Q?=
 =?utf-8?B?aXBmNE1kV0xhREprQjZhU0VaQnNmR3pIQWM4K2ZhTTRQeWd3SUg5VkR0VFZJ?=
 =?utf-8?B?YmpacktFbkk3THJIWGVkSFdhSEFGM2J3YU1rN3dMN084ODdHcnBhOGhueGdG?=
 =?utf-8?B?TzJqYXIxNlA2TEx5NGwxOUNYSDgvOStHbzJBWDZCci9nWlRnWlVoR3VJMDBV?=
 =?utf-8?B?NnNEZkFVNGgycGNBNFZZN2NZbFBKZmo2elpQdEgwdm5FVjZzbjFYejNTYWtk?=
 =?utf-8?B?WVc5VytBeUg1SGloVUovNC9udmNXeDViWW5XaERvZHJXaTV3T05IOXNUa0JV?=
 =?utf-8?B?enhVQWRaNGx3RGptRzlJTzY2akZ5b24rRXUzdFZqNUhCVnpBNm1mR2VwcnBI?=
 =?utf-8?B?djRHOHE3NkN4aCtvd1NzR0J4b3I5S2dsSjZNeEFOS3czb0FFZFhTVllxbFUr?=
 =?utf-8?B?Z21nVmI2dzgxT2pneDgrMjYxazBmbmtpREphWGx3ZkJreGRJTXV4bzJzUEpz?=
 =?utf-8?B?d0FhTm4vSlFjTWJMTEcrakVZeGE0V1VWaDJVakkyVlNMekwxWjZTblU1MGpa?=
 =?utf-8?B?WHR2cGMvdXVkNVJBNkdodVluYmpGRnZqYWRKRmo5Tm1GZWFYZVY0ZFlQajIz?=
 =?utf-8?B?Q09CUEdhNnhiRzUwaC9xSHQyOW1qci92N0ROdHJzancrMWxDbWVyV0owSTEx?=
 =?utf-8?B?TjdJRFpJbncwL2lIM0g1OXdPZHpCR05OOXdFbCtTd3huVllBQ0cvZVVCdFQ5?=
 =?utf-8?B?ckJITCt1SkpMWkozN3BSblo4QnNUS2hRRzE3cHhzakt5YTIwTGtyWlRHWU0x?=
 =?utf-8?B?aTk5NDlDOUFjRTZBL0tGSHROS0FzTVJxaWMyVEE0NktyTEpYR0lVNFE1RjBI?=
 =?utf-8?B?b2RpT3F1OU9SU0JEcXhNVW5uK2dMY0huM0l4R29STXRrV0RoVUx0LzhqRTJ5?=
 =?utf-8?B?bUc0N3I4a09QK3RuMU5NSFRpQ1VVTGk2Q0JyQW5KaXFJcUlIR1FpVEZOM2lK?=
 =?utf-8?B?aEozb3JZV2FOTnV5OTQ2cW90SDZSU2FZYlExV1lBTENTSm54dk84MGpVei9O?=
 =?utf-8?B?b2JXazlYU1JnV1FObXVZaCtTWmRYUW90RkR6MWV3M1pUeDdzMERFNGRsSk5r?=
 =?utf-8?B?SGNNUnRmUjZHZEdKNk9qdGNFd2xWS1hlTUxMT2JURGkvc2tYV3J3blhHTVhr?=
 =?utf-8?B?RWN3M1VCSWc5RFZEQ1BSZXlSSWt4c3YyeDZWY0VHSExMVnhGQ0laNURwU0t4?=
 =?utf-8?B?b0YzZCtjM1B2RE50UDNIQ2RQcGpRWm1XbFlMSWIwOGJGbUdsdFExa3IvNHF0?=
 =?utf-8?B?K1UxQ1QrRk82emhkalJ0b042aGNKem9ubll6VEdsNWVlRURPQnhQQW9KbHZu?=
 =?utf-8?Q?nQTO/dv1l+LB/W6HrcQaa5nAKuFj/uCBCcQvU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(7416006)(366008)(1800799016)(38070700010); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djkweXQ3LzFjN25pRGJvK1p1WXFwR3FjNmxTMTFOU2NLT0FXTkJkU0ZkOFNF?=
 =?utf-8?B?MEZaOGowMGd4VG16S055V1I1YlBPRWc4dGhXa1hkeVJQSnZ6WlRzdXBOVVdS?=
 =?utf-8?B?U21PNmNKakVCbjZkNHF4RGFuNm9uM0xMK3lIREx1ZXYrRGpNaVBqTnJyeFVN?=
 =?utf-8?B?clJ6OGV1eWIrV2txL2ZRc29CMUd2S2lKdFNnMUcwZlNaVVVMRzdNSURnZmxL?=
 =?utf-8?B?ZUF1OHFnUmJVdzFXZ0R4RE92enlNMlg0TUcwREd6MUxySHpFRFR6Yy9UajZH?=
 =?utf-8?B?TE11cjdxdlA0azdTODArZTA1TVJiVEhvcWp5YVJ6UHRwWVpCb0VBUjNMcW4z?=
 =?utf-8?B?Nk96QVJvQ3M4dWJZcXFSMm1yck5mU1JORjR0VnR6blRPNTFRd0FwT3V0d0dr?=
 =?utf-8?B?SW9ObnIvcTkvVXo2bE9MN0pNRlVaSDF0aGp0aVdQQTRmZHRIYkdxbjBudEFq?=
 =?utf-8?B?RVZUa2xtVHJXOG9pSVkxNmsvRlE0ckE2UTk2Zlk1R2ZoYk9kK0RiNGYvR3Y1?=
 =?utf-8?B?WXhYUGdKYlM3blJxUzFpWkl0WXdMNC9wVmlZblFCWUJ3NlV4ZlhqSkhvRW5z?=
 =?utf-8?B?VWZDV3B6aUJkb3gzV2RPTHFLRS84aG1uZkdEWU1xK2tSVHpaL1BnOXpEa1k0?=
 =?utf-8?B?RTVqSTlYSzhEOUhRZ29YU1ZGalFTaFdHUjJKSTlxTHBMbG00YzJ6WFZtZ2xk?=
 =?utf-8?B?VzEvQzl4dGtQbkU2UnViWDl4OU9hcjdCQjZCQlgrRkh5OWlseHRoT1pZMUxv?=
 =?utf-8?B?TmpNZFpxK1RLRzJXM1FHakNvMjhHWWQyN0V0bTYrbG94M1crM2pEWGU3Z3Zj?=
 =?utf-8?B?WG00YnlURytWT2YyV3JmSGZsM0pSVUFEUEhaOXNza2hwWVNsQ0hadkZGMytq?=
 =?utf-8?B?djlpZGszckFmK2RoYzNvTWF2L0RLTXJNYWZmZUNsTVU4eEVmMkNqNEVNakZk?=
 =?utf-8?B?ZzNUSUtzZGZXdHRHUTZ3OTVuUEQ5MHR6WHg3NUhaREJreCtvRk94WURGNHNY?=
 =?utf-8?B?Tmt4alpDQm1BaDRuMXArbjVhcTdzZXdIQnQ5d2FLTTB3eWpkeGh6Z2cwU1Bx?=
 =?utf-8?B?Q3NFTmgzYUpOaCtuNWtvbjJMMmVENHpZdmZTVWIrRTc1QlB3dkpzSUZyUnZi?=
 =?utf-8?B?b0YyMVpwQjA5dkh1amRwb0YwL2V4WVlWSkMwR2RXWURCbVVmZ1prQnN5K3Zm?=
 =?utf-8?B?OSs4S0JLdXVYdU1KaUJVdGhkRlQ3ZmZldWVQNHJWRWpuS0U4VkpySDQ3MVdp?=
 =?utf-8?B?UnVLKzVXUkxFYmVoOGJpYnFzM0JqUzhlRzFGbzR1bkNVZXhoeVZMQk1pcUEr?=
 =?utf-8?B?bUt0eU43aXptOVIweDYwOUcwV1p5NGtNK0JDWk5hYXN4Qnk2eFNnaWkxMklT?=
 =?utf-8?B?VytMTDB5SzlsWDVrekcvd3lSd1VueTNScURKWkdVZDl4dFFnZ3d2bVF3MElR?=
 =?utf-8?B?REpyS2pQU0tZSGx3RXdTWkNQTTFNaTgxWDVuenU5c0dYVFYzbys0RFV1Wk55?=
 =?utf-8?B?M2VKVVFxVXV5SXkycmg1TSsrZW4rUHpXRXNCWHY3bW1BM2s1Z3Bka0NjR0M0?=
 =?utf-8?B?aVlIL0ZjWm44WEkvZnlXWVRUUGZiSzhSN3BoNEhoTDZrQlpmemMxNzhaZnRY?=
 =?utf-8?B?d2J4UUc0YkpBZ3UxaDA3Y1VLUERiRWhBMlV2RW1IQkVoYVVOWUowNU9VcSs2?=
 =?utf-8?B?NEErdmYrTTRXeGVRRWdNRTIzcS9KMFczRHltdDNZN1h5aksyVWdKT3llU20y?=
 =?utf-8?B?UVVKWXJqbm51Tkx6Y2lFUkswUWdKQk10ek9jZHk5SFpuVUxjYTc5NURGTU9w?=
 =?utf-8?B?ZjdpNHVUVWVRWDVoTXJtSkNHcmZjcDdPMmJwL3llUDNNc2sxTGdCSEoxNGVL?=
 =?utf-8?B?YXZEVElpWWZmUG03d3lhRTY5SHdKczY5US9BVCtzMWV4aVViYU5xRkNrcWxO?=
 =?utf-8?B?SVA4R2QxYXM2d1JCZlVJVXhhdjFEMzdVcFFEczgrbkNBa0NydHNKbG9pckhy?=
 =?utf-8?B?NDR5RW5tM1BEWlIzT0RWRWRVRm5KdytzRUlJZUlZM0tpdUxMK0NFTlhQeUJJ?=
 =?utf-8?B?ZkVTbWdoeG02L1pMU1VhTG1rL3FnaUpEQUZjMVI3SlJVWjgrRktkUFZIYlc4?=
 =?utf-8?Q?6bb3DqnTACanyH6YxMVKVKASo?=
Content-ID: <70931C057B795D4B91ED9955EF1BF3A1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427ef648-a544-45a8-c8db-08dc8a7e1ca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 01:22:23.0262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BgRG3SKGp7rx5ugN6hpq+KDUw7S84az7i01fgFQw1uYZV+Dc/fvtKro6H1rTg2i5icy6jIlXQafJ3d4QG5/kWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6654
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_428821155.121217372"
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

--__=_Part_Boundary_006_428821155.121217372
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUaHUsIDIwMjQtMDYtMDYgYXQgMTc6MjYgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gUmVnaXN0ZXIgQ1JDIHJlbGF0ZWQgZnVuY3Rpb24gcG9pbnRlcnMgdG8gc3Vw
cG9ydA0KPiBDUkMgcmV0cmlldmFsLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4g
U3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiANCj4g
K3N0YXRpYyB2b2lkIG10a19jcnRjX2NyY193b3JrKHN0cnVjdCBrdGhyZWFkX3dvcmsgKmJhc2Up
DQo+ICt7DQo+ICsJc3RydWN0IGRybV92Ymxhbmtfd29yayAqd29yayA9IHRvX2RybV92Ymxhbmtf
d29yayhiYXNlKTsNCj4gKwlzdHJ1Y3QgbXRrX2NydGMgKm10a19jcnRjID0NCj4gKwkJY29udGFp
bmVyX29mKHdvcmssIHR5cGVvZigqbXRrX2NydGMpLCBjcmNfd29yayk7DQo+ICsJc3RydWN0IG10
a19kZHBfY29tcCAqY29tcCA9IG10a19jcnRjLT5jcmNfcHJvdmlkZXI7DQo+ICsNCj4gKwlpZiAo
IWNvbXApIHsNCj4gKwkJRFJNX1dBUk4oIiVzKGNydGMtJWQpOiBubyBjcmMgcHJvdmlkZXJcbiIs
DQo+ICsJCQkgX19mdW5jX18sIGRybV9jcnRjX2luZGV4KCZtdGtfY3J0Yy0+YmFzZSkpOw0KPiAr
CQlyZXR1cm47DQo+ICsJfQ0KPiArDQo+ICsJaWYgKG10a19jcnRjLT5iYXNlLmNyYy5vcGVuZWQp
IHsNCj4gKwkJdTY0IHZibGFuayA9IGRybV9jcnRjX3ZibGFua19jb3VudCgmbXRrX2NydGMtPmJh
c2UpOw0KPiArDQo+ICsJCWNvbXAtPmZ1bmNzLT5jcmNfcmVhZChjb21wLT5kZXYpOw0KPiArDQo+
ICsJCS8qIGNvdWxkIHRha2UgbW9yZSB0aGFuIDUwbXMgdG8gZmluaXNoICovDQo+ICsJCWRybV9j
cnRjX2FkZF9jcmNfZW50cnkoJm10a19jcnRjLT5iYXNlLCB0cnVlLCB2YmxhbmssDQo+ICsJCQkJ
ICAgICAgIGNvbXAtPmZ1bmNzLT5jcmNfZW50cnkoY29tcC0+ZGV2KSk7DQoNCkl0IHNlZW1zIHRo
YXQgeW91IGNvdWxkIHJlZ2VuZXJhdGUgY21kcSBwYWNrZXQgZm9yIGNyYyBoZXJlLiBTbyBjcnRj
DQphdG9taWMgZmx1c2ggYW5kIGNyYyBjb3VsZCB1c2UgdGhlIHNhbWUgbWFpbGJveCBjaGFubmVs
Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArDQo+ICsJCWRybV92Ymxhbmtfd29ya19zY2hlZHVsZSgm
bXRrX2NydGMtPmNyY193b3JrLCB2YmxhbmsgKyAxLCB0cnVlKTsNCj4gKwl9IGVsc2Ugew0KPiAr
CQljb21wLT5mdW5jcy0+Y3JjX3N0b3AoY29tcC0+ZGV2KTsNCj4gKwl9DQo+ICt9DQo+ICsNCg==

--__=_Part_Boundary_006_428821155.121217372
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMDYtMDYmIzMyO2F0JiMzMjsxNzoyNiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1JlZ2lzdGVyJiMzMjtDUkMmIzMyO3JlbGF0ZWQmIzMyO2Z1bmN0aW9uJiMzMjtwb2ludGVycyYj
MzI7dG8mIzMyO3N1cHBvcnQNCiZndDsmIzMyO0NSQyYjMzI7cmV0cmlldmFsLg0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMz
MjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCg0KW3NuaXBd
DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7K3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2NydGNfY3Jj
X3dvcmsoc3RydWN0JiMzMjtrdGhyZWFkX3dvcmsmIzMyOypiYXNlKQ0KJmd0OyYjMzI7K3sNCiZn
dDsmIzMyOytzdHJ1Y3QmIzMyO2RybV92Ymxhbmtfd29yayYjMzI7KndvcmsmIzMyOz0mIzMyO3Rv
X2RybV92Ymxhbmtfd29yayhiYXNlKTsNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO210a19jcnRjJiMz
MjsqbXRrX2NydGMmIzMyOz0NCiZndDsmIzMyOytjb250YWluZXJfb2Yod29yaywmIzMyO3R5cGVv
ZigqbXRrX2NydGMpLCYjMzI7Y3JjX3dvcmspOw0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX2Rk
cF9jb21wJiMzMjsqY29tcCYjMzI7PSYjMzI7bXRrX2NydGMtJmd0O2NyY19wcm92aWRlcjsNCiZn
dDsmIzMyOysNCiZndDsmIzMyOytpZiYjMzI7KCFjb21wKSYjMzI7ew0KJmd0OyYjMzI7K0RSTV9X
QVJOKCZxdW90OyVzKGNydGMtJWQpOiYjMzI7bm8mIzMyO2NyYyYjMzI7cHJvdmlkZXImIzkyO24m
cXVvdDssDQomZ3Q7JiMzMjsrJiMzMjtfX2Z1bmNfXywmIzMyO2RybV9jcnRjX2luZGV4KCZhbXA7
bXRrX2NydGMtJmd0O2Jhc2UpKTsNCiZndDsmIzMyOytyZXR1cm47DQomZ3Q7JiMzMjsrfQ0KJmd0
OyYjMzI7Kw0KJmd0OyYjMzI7K2lmJiMzMjsobXRrX2NydGMtJmd0O2Jhc2UuY3JjLm9wZW5lZCkm
IzMyO3sNCiZndDsmIzMyOyt1NjQmIzMyO3ZibGFuayYjMzI7PSYjMzI7ZHJtX2NydGNfdmJsYW5r
X2NvdW50KCZhbXA7bXRrX2NydGMtJmd0O2Jhc2UpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2Nv
bXAtJmd0O2Z1bmNzLSZndDtjcmNfcmVhZChjb21wLSZndDtkZXYpOw0KJmd0OyYjMzI7Kw0KJmd0
OyYjMzI7Ky8qJiMzMjtjb3VsZCYjMzI7dGFrZSYjMzI7bW9yZSYjMzI7dGhhbiYjMzI7NTBtcyYj
MzI7dG8mIzMyO2ZpbmlzaCYjMzI7Ki8NCiZndDsmIzMyOytkcm1fY3J0Y19hZGRfY3JjX2VudHJ5
KCZhbXA7bXRrX2NydGMtJmd0O2Jhc2UsJiMzMjt0cnVlLCYjMzI7dmJsYW5rLA0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Y29tcC0mZ3Q7ZnVuY3MtJmd0O2Ny
Y19lbnRyeShjb21wLSZndDtkZXYpKTsNCg0KSXQmIzMyO3NlZW1zJiMzMjt0aGF0JiMzMjt5b3Um
IzMyO2NvdWxkJiMzMjtyZWdlbmVyYXRlJiMzMjtjbWRxJiMzMjtwYWNrZXQmIzMyO2ZvciYjMzI7
Y3JjJiMzMjtoZXJlLiYjMzI7U28mIzMyO2NydGMNCmF0b21pYyYjMzI7Zmx1c2gmIzMyO2FuZCYj
MzI7Y3JjJiMzMjtjb3VsZCYjMzI7dXNlJiMzMjt0aGUmIzMyO3NhbWUmIzMyO21haWxib3gmIzMy
O2NoYW5uZWwuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrZHJtX3Zi
bGFua193b3JrX3NjaGVkdWxlKCZhbXA7bXRrX2NydGMtJmd0O2NyY193b3JrLCYjMzI7dmJsYW5r
JiMzMjsrJiMzMjsxLCYjMzI7dHJ1ZSk7DQomZ3Q7JiMzMjsrfSYjMzI7ZWxzZSYjMzI7ew0KJmd0
OyYjMzI7K2NvbXAtJmd0O2Z1bmNzLSZndDtjcmNfc3RvcChjb21wLSZndDtkZXYpOw0KJmd0OyYj
MzI7K30NCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0
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

--__=_Part_Boundary_006_428821155.121217372--


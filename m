Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0649A90832F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 07:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11EB10EC2E;
	Fri, 14 Jun 2024 05:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="bPvIcCYM";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="g28u8WMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7714910EC2E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 05:11:41 +0000 (UTC)
X-UUID: 92dc9ede2a0c11efa22eafcdcd04c131-20240614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=4W+9sLzYNNRPK5BjL8R+rn+bUqJaEa8tLpMbt294stQ=; 
 b=bPvIcCYMSFdKODwQpSV/q0WbcKUEywaXYCsREGdSesmjof1yKDtfbvkwpc9NZsZlZm7i+53anrjsEDb9ZGiE2SxH04CX37P6qYxYvdRXRYRXKRHLLHMZKU20tDcqpkAlHb5pTynJO1p1tHWtb36jAdKuRd/eyHX5H4h1mFO2SyE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:a12c1b95-7e19-49fe-a6a5-58a59e47fda8, IP:0,
 U
 RL:0,TC:0,Content:8,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:8
X-CID-META: VersionHash:393d96e, CLOUDID:41729388-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 92dc9ede2a0c11efa22eafcdcd04c131-20240614
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 105574909; Fri, 14 Jun 2024 13:11:36 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 22:11:35 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 13:11:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/bDu3+GpeimrNlDIbtJE6PY4hsnzt6XwHS9FE0UMQTuNi/zl0gbexZPCAV5k5pngOTaQXa7cYVVYEYasCyNXkg1DpEuGDbGsF+D66fkDJQPgRtXCj+V2KjnV0DZBm30i9b8bde1GmcphknEhzTHSSlfKUM18RuJZ9WrsXPTzvMzrjQ5siHPzIDgzOkOnO/nPzLEDSrWN47TjHAWxHSJnpGMLW5adqfhljteOJBM6eiAKdISkz041uVwQz9zwzrR9NbxRI6kzFlmRl8i04TqVY0o/CHolhxR2nkDWXIT9rASbMidttjY3Gdyhsnqdpt9AF+VLeOyBXnyWPZPMH7NVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJDVH2ikNo5fS/b55ZA/Ly3lBF5wUGZLy83YZGOXrlY=;
 b=ctDpFy27e6cVNrfaA8mWAukm3zKz4qgXxO6HJenxMMnVHU4x9vFql+YsiMWOhmrvVVSE/7USldn7XVYm5SBZCbC9bGhkuIanPcFNGLF441JcjTThU+Tcm2DBNyRst0jhIvC9Vjg8U3SNZYFeKJhRzM7ycPmt6KA3Ehulw/Pala7a2CfqskDQffUW11iupJ9YDf6L035yFIg4HhtRDF/7rU+Qo/ByIX7vuXjZ2J26PeTn3nbQSR610MJqUgqrCDbOtv1FIlNhre/gUNKupm7ZlopRwcjp1DPO005P7blQKENakgl+C5NQme8WAqZe30t2OYN5/hoA3FW1R5zgMU1OOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJDVH2ikNo5fS/b55ZA/Ly3lBF5wUGZLy83YZGOXrlY=;
 b=g28u8WMbmla/JFPnveQM3IqKXCe0c6+/eQ9aZVXXwqJJ4DjA4p4Cb97j34oORrLV/aT/nkWuxdGefh2x4Lch18sFkOjTvGp6n0ceeXjUa1qC+TK+HXCxRF16dl5JO3Mate5A1b68xfpjxmnHP4p5lqd83IbljKr137zrTvx1gTo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7241.apcprd03.prod.outlook.com (2603:1096:400:289::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 05:11:33 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 05:11:33 +0000
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
Subject: Re: [PATCH v9 14/21] drm/mediatek: Support "None" blending in OVL
Thread-Topic: [PATCH v9 14/21] drm/mediatek: Support "None" blending in OVL
Thread-Index: AQHavgUwtcyw6YNYRUC2+jxLzyTemrHGtpkA
Date: Fri, 14 Jun 2024 05:11:33 +0000
Message-ID: <b8d8c595db96225d4a3f2c743175f5a9a45a281c.camel@mediatek.com>
References: <20240614024620.19011-1-shawn.sung@mediatek.com>
 <20240614024620.19011-15-shawn.sung@mediatek.com>
In-Reply-To: <20240614024620.19011-15-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7241:EE_
x-ms-office365-filtering-correlation-id: f5cc3943-7b7d-4536-dfb7-08dc8c30753d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230035|376009|7416009|366011|1800799019|38070700013; 
x-microsoft-antispam-message-info: =?utf-8?B?eFhldllWeHY4STJoaGpPVVJUd1N6d2YzUTFSNWdFVUpScDVqdWJGSFBuMXls?=
 =?utf-8?B?aTg1Vjl3dkNuRVNEWGt6ZWtwaGFsZzhmZDVhYTBHbjV2QUNKSVN0bEtROVpp?=
 =?utf-8?B?Ni85UW9BY3BraG5JUGsxR20wR1MrRzJvZHRRR243dFcvRGxVcmNGSDlOWUFL?=
 =?utf-8?B?djk4ekJtQ0V5M1hGOWJ3LzJNRThtVWU0WGtwQ05NeGRFYmFTVFZ6OUFjT0lr?=
 =?utf-8?B?TlpZajhsdlYrQkpRVlVVZ2p0YXNxSE1UdTB6REpON1lzbkNyRGFhTW02RGhh?=
 =?utf-8?B?MW41NWpERmZrOVA0UnBSN1dHa1JjeGI0ZVdhbWp2dGNxUG4zL29ZQ1lXNjdG?=
 =?utf-8?B?YllNRlhTcFJ1cG9ZdjNUOUdkTjdqL0tpTXcxUTV5bnVNblBQa0w0QTFXNEZ0?=
 =?utf-8?B?aVZyTXBDMVNieFpNVHB3ZDNJZTJJNVdkNW5pZnp5OWdveG8xT3N2S3kyblJn?=
 =?utf-8?B?L2FxZS9tb2VLWU10YTY1UXNmR2lHWWgzcUdLSjlmdDZvSmt0cWV4ZDBTQk8w?=
 =?utf-8?B?d0ZmWHgwV25jOEoxeVoxYjFIWWVNOXNpMkNIb0FMWTBMR3FlSTlMcCtLSDR3?=
 =?utf-8?B?YnBKWkE3cHBzS2pON3o5OG9JTk5pYTZzd2Z6anJqM3pMZmU4T29ka2NDTUpF?=
 =?utf-8?B?NjZucEk3TmZnWmNseEN3UUp3Q2dpOFhIby9sbFdYQzRQaktXNmpjRUdnSWV1?=
 =?utf-8?B?NTRuZEc1QkhUTGwyNUFLTVBSYWxJR0xGcFJSUUpxekFVVTNUZmVFb29HRElR?=
 =?utf-8?B?Q2RqQ1lOWUcyd09CY0RqVWlYWTE5OFVaU0VTb3VST2dSWmpQNWRLRUZVeGo0?=
 =?utf-8?B?V0hQRXgvL3FYSkJJUTh5NCtwR29oVVlSUU1UUDc0eGcvNXdGNytBKzdNSFR5?=
 =?utf-8?B?RmI5aFBSNGY0bVJLeWZ1ZGdFR3VjQklLbnB1REdTZTNuV0k5RUh3Yk11enhv?=
 =?utf-8?B?RUlOOENOa09VYk5zQThxSHhCamljaFVEUGtJaFN0cWdnTDhXQnZFMmYwTVBI?=
 =?utf-8?B?dW9jOHBXSllSYWwvWVVvVUtCYno3V1YwU3p5MnVneDNxZ2VDZEJqMUU0U0x3?=
 =?utf-8?B?bFNvSnJyQ010c0hKa3JKNHllYXJqS25IbktReEdrV2JkU2xIa2VDOTFyb2s2?=
 =?utf-8?B?NE5jazJ3REdZMklQZnhIaVB5bEY2R3hiV1VkN0c3anF1T3g3RHAxRjVvcys0?=
 =?utf-8?B?c2JJSEh6TllHaUJNQVUzbXdQMXNTUXI5Q1JLeGNGWHo2WWpKZ2VLMFRBZkdw?=
 =?utf-8?B?bS84OW40MzNyUHZydkRWcmxFUzlDUk82YThWQjVFY2lmT1ozVUxKRDlzVHlU?=
 =?utf-8?B?WG5hWDkrdVMyd3hUcE05Y3dVdmZtS0FEamhWMUNzbTNCMGQ5RSttdTM4dEo5?=
 =?utf-8?B?NHdWaWlGa3REQUROT24ySFFOSEZzK2N2V3NjWUpVeGhIVEsxVGpVa01mVXhs?=
 =?utf-8?B?QXpBTVFoU2VHRmorS08yUFIzTEI5aVdFRkVPN2pzZTd2cW1lV3VsY2o0QTRO?=
 =?utf-8?B?eGtyRnNaKzdSL2M1bXI5Um01aDlyaGJndm8wK1lsTC8zWTQ2YmYxRzZHQnJw?=
 =?utf-8?B?QXpNVzhGQzN5bUY0aG5CNnFFbStKUm9sWGJBelhvb1poL3RvUHAwVFZUYzZK?=
 =?utf-8?B?SmJnNG15aU1uNkZCbnBSbFc3RFpsUWNMU1pvb241VE55ckpCK255ald3YklN?=
 =?utf-8?B?YjgyamhhVDJpc0pYUy9BV1dZdGpaVEtHeW8wZGhuZ2hEYVRYQWphN1Y1ZHdl?=
 =?utf-8?B?QmJtZEFROTFCQVorMFhWc3FvSGNBTThGNjB1SVU2R2pnbnZveHNzS3RBM1J6?=
 =?utf-8?Q?ogZIQOOtgoOODT/eN7ARu79uArerXSctS0+nk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(7416009)(366011)(1800799019)(38070700013); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2pZTmxEaTlrRDJvUzM2K0ZGTGExV0FMK2JreSt3THRLVzlCdjJwZHRZQkNi?=
 =?utf-8?B?TS9MUEZRUmhBOXlNVnk4RWJuM0Qra0tvblZXZlZWSU56emN4ZWVFSVE0YjdE?=
 =?utf-8?B?SThzNzU1L0kyektzMmMxZ1FlU1Q0WFgyRUhNcXdIVlBpWUYrY2ZDY05GR3h5?=
 =?utf-8?B?d1k5TW5yMHUzQ01ZQXRyWUlKMGl4YXdMUTNZYWdqcjd2WjUvSWZ5R1N2ZmdO?=
 =?utf-8?B?YmJwMk9Wam5lRUpQS3RKdTJHVXU2RmVqZG45dDNTaFR6bEJ4cFFPLytqTnBD?=
 =?utf-8?B?ZDY5bjVVbEJ0d3VBNDE3MHQ1TEJHeG9DZ0NmNzdaNFRkZnA4ZFpjeCtpS2g2?=
 =?utf-8?B?THVwWGhuZldEWGJRZ0pHNkhFSkFid0p4MVlhdXYzQ1I5MjFTbkcyRXBCVzRp?=
 =?utf-8?B?Z2xEcVJHeEtKR1Q4YnY2OVUwU0s3SmNhUWhCOEE2eHladzVoRjN2ekNpb2ZR?=
 =?utf-8?B?MEdQQUpGamJzQjJtR3plLzhGM3QxMHgrUG1KcXhRNDU2aXdVekpZaXhuV3BB?=
 =?utf-8?B?NVl2bzFSVVBPR3hsTzU3M0wvNEtWUjRGd3VoYmNjaVBHZnlPc2gvd3lqSmh1?=
 =?utf-8?B?Q29OUzR6cmxGTVBrOWltenJMNkxLNnk0N1pCc05IMEw1ZmsvS2REM2E2U1Z1?=
 =?utf-8?B?bHFMaFhqRkRFaXRaaHp5a0l6ZUFsdTJ3eVl6bjFVRXY4OTFGcnB1cnNMT29l?=
 =?utf-8?B?RzIyNjVRa2llRVQycGFmUTJRMmF4UjBzeWhwaTRjL0NEbEE5SSswQStBNXky?=
 =?utf-8?B?YXI1UnFNbUZPZTBxMzVub29tbjFiMUFkNU5vYmVyVE5taXptZFhrelEwOFM1?=
 =?utf-8?B?bVdSSkNtbUVrRytzK3JQenFDZ3puVXRvNnZESnF6WktoUFE3ZHhBUm9TWGM3?=
 =?utf-8?B?SGE1c0hIWDVYaUsyaitCbzJ1V3FzN1Z3dzFubU9QNkRwdkpSYU5hSDJ0bS9t?=
 =?utf-8?B?bytoWkVLZEErNXZZVVJRSTlNLzVUUEgveHlnZ25OQVJtZ0Q4U1VxazlPYnhp?=
 =?utf-8?B?ZzJUeVRuVEgzNEdOL29MQ2JCeGN4NE5LSFQrTmRZNTA2U2I2cHF1eHhuNWY5?=
 =?utf-8?B?STlFV25HNk5rM2E1Sm9pbXFROGNMOUc2WGNHa0UrVGhOUzFzYmNkUXRNck5F?=
 =?utf-8?B?TG5Kb1ZvR1pZSkRwL0NFWjhZc1ltSUJDaDlmUEVQZjJ6WEFYTFc0YXB4VGR5?=
 =?utf-8?B?M0Mvc1lCdGc1Qngwd3VVandraURoQlZ5ZzFXT25leFlIUjRocXdQdXM2TEQr?=
 =?utf-8?B?Ky83UDl5NmdUaXo1c2t1T05tRUpCbFVoRno4cWZJd0ZkL1NiZzYwRGhXay9h?=
 =?utf-8?B?aVhvWmE1WFRNUlA5OC9EZVVhOTk4NjFSMFhvM0IxMzZhRUsrWW82ODRhQlJr?=
 =?utf-8?B?UVg2R3BGL1Iwd2c3TGZuYVFQb3Jnc1k1L0tDK2Mzams5N0FlaVdZTVpMVTFR?=
 =?utf-8?B?WERqMlQxSGs0TDJaN3VEb0h4RTd3bEtpWDZtdVFuczdHak1DOHB0MjJkbjYy?=
 =?utf-8?B?a3V5Z0VtN3g2c1QrNnFkaGpmRTNhQWVJSlVtdllGcDkwQVBiQzZ2bEJRMUFC?=
 =?utf-8?B?cWovUDcvLzBqNWxHM01Ydi9TRU1Iamc0TEtUYWcyQnJ5aFMweVV1V0lUWjYx?=
 =?utf-8?B?ekZ3TklEZHNvd0hVM0l0bkNUNGhHWVltd3NvWHBYYXBacjRxN3k4Vi9GdUhl?=
 =?utf-8?B?TDVPRnRmUHJ4RTBsVmltbitQREpNMFkvQ2tVV29LbjlMYTFUakR2dGpCcHBE?=
 =?utf-8?B?YmpyalR1Ukp3NzJEaFk1RUNOa1JIWGk0VXYrdEYxeHg3bU5CYjdOcmRvU3Qy?=
 =?utf-8?B?Z1hnaU5QUzhiYURka00zcTBCTUY3UW9ZU1pWaFJqQ29QanNnOUFJdHB6Y1h6?=
 =?utf-8?B?TVFWZjNsYmhPd25ybmhkZGhDU3V0QkJRQ1U5NHd1bHRGVFo0ZDMvWkhuMFYv?=
 =?utf-8?B?WXZyeThpRUdsY3NUMlhvdGRRZU9DQXRiUjJuc2pXdzJCQVBnZkhlVkw0RVcr?=
 =?utf-8?B?L0JjOGJYcjI4WlhOOUU5dldMb2xpRVBTSVcrdmk2MU05K21jaldDSDlLbTR4?=
 =?utf-8?B?dWViSmlxaS95VXZ4SEpsaGtVV0tnRXlNdzlJdE5ZR29mMlR0bDFWNXdQdTJQ?=
 =?utf-8?Q?ZxTKcP/Zo/OukJpqjuqPP8oWp?=
Content-ID: <9E709B96263B2C4096CDD85A6D790D5F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cc3943-7b7d-4536-dfb7-08dc8c30753d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 05:11:33.2978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDZump/BMyV88EGlyOjDa/11isedlRtfJZKDKj+cZv/OUukLBUiZ65jZZLKM+TQ2xruwmuhh4ThoxJWQzhNp2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7241
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1134179333.1826001124"
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

--__=_Part_Boundary_006_1134179333.1826001124
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBGcmksIDIwMjQtMDYtMTQgYXQgMTA6NDYgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU3VwcG9ydCAiTm9uZSIgYWxwaGEgYmxlbmRpbmcgbW9kZSBvbiBNZWRpYVRl
aydzIGNoaXBzLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRl
ay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5j
IHwgNCArKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+IGluZGV4
IDIzMTZkNGE2ZGNhNy4uNjU2NzgwNmNmNGUyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bC5jDQo+IEBAIC00MzEsNiArNDMxLDcgQEAgdm9pZCBtdGtfb3ZsX2xh
eWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpZHgsDQo+ICAJdW5z
aWduZWQgaW50IGZtdCA9IHBlbmRpbmctPmZvcm1hdDsNCj4gIAl1bnNpZ25lZCBpbnQgb2Zmc2V0
ID0gKHBlbmRpbmctPnkgPDwgMTYpIHwgcGVuZGluZy0+eDsNCj4gIAl1bnNpZ25lZCBpbnQgc3Jj
X3NpemUgPSAocGVuZGluZy0+aGVpZ2h0IDw8IDE2KSB8IHBlbmRpbmctPndpZHRoOw0KPiArCXVu
c2lnbmVkIGludCBibGVuZF9tb2RlID0gc3RhdGUtPmJhc2UucGl4ZWxfYmxlbmRfbW9kZTsNCj4g
IAl1bnNpZ25lZCBpbnQgaWdub3JlX3BpeGVsX2FscGhhID0gMDsNCj4gIAl1bnNpZ25lZCBpbnQg
Y29uOw0KPiAgCWJvb2wgaXNfYWZiYyA9IHBlbmRpbmctPm1vZGlmaWVyICE9IERSTV9GT1JNQVRf
TU9EX0xJTkVBUjsNCj4gQEAgLTQ2MCw3ICs0NjEsOCBAQCB2b2lkIG10a19vdmxfbGF5ZXJfY29u
ZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IGlkeCwNCj4gIAkgKiBGb3IgUkdC
ODg4IHJlbGF0ZWQgZm9ybWF0cywgd2hldGhlciBDT05TVF9CTEQgaXMgZW5hYmxlZCBvciBub3Qg
d29uJ3QNCj4gIAkgKiBhZmZlY3QgdGhlIHJlc3VsdC4gVGhlcmVmb3JlIHdlIHVzZSAhaGFzX2Fs
cGhhIGFzIHRoZSBjb25kaXRpb24uDQo+ICAJICovDQo+IC0JaWYgKHN0YXRlLT5iYXNlLmZiICYm
ICFzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpDQo+ICsJaWYgKChzdGF0ZS0+YmFz
ZS5mYiAmJiAhc3RhdGUtPmJhc2UuZmItPmZvcm1hdC0+aGFzX2FscGhhKSB8fA0KPiArCSAgICBi
bGVuZF9tb2RlID09IERSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkUpDQo+ICAJCWlnbm9yZV9waXhl
bF9hbHBoYSA9IE9WTF9DT05TVF9CTEVORDsNCj4gIA0KPiAgCWlmIChwZW5kaW5nLT5yb3RhdGlv
biAmIERSTV9NT0RFX1JFRkxFQ1RfWSkgew0K

--__=_Part_Boundary_006_1134179333.1826001124
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO0ZyaSwmIzMy
OzIwMjQtMDYtMTQmIzMyO2F0JiMzMjsxMDo0NiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1N1cHBvcnQmIzMyOyZxdW90O05vbmUmcXVvdDsmIzMyO2FscGhhJiMzMjtibGVuZGluZyYjMzI7
bW9kZSYjMzI7b24mIzMyO01lZGlhVGVrJiMzOTtzJiMzMjtjaGlwcy4NCg0KUmV2aWV3ZWQtYnk6
JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYj
MzI7Jmx0O3NoYXduLnN1bmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMz
MjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyYjMzI7fCYjMzI7
NCYjMzI7KysrLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MyYj
MzI7aW5zZXJ0aW9ucygrKSwmIzMyOzEmIzMyO2RlbGV0aW9uKC0pDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9vdmwuYyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCiZn
dDsmIzMyO2luZGV4JiMzMjsyMzE2ZDRhNmRjYTcuLjY1Njc4MDZjZjRlMiYjMzI7MTAwNjQ0DQom
Z3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5j
DQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jDQomZ3Q7JiMzMjtAQCYjMzI7LTQzMSw2JiMzMjsrNDMxLDcmIzMyO0BAJiMzMjt2b2lkJiMz
MjttdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwmIzMyO3Vu
c2lnbmVkJiMzMjtpbnQmIzMyO2lkeCwNCiZndDsmIzMyOyYjMzI7dW5zaWduZWQmIzMyO2ludCYj
MzI7Zm10JiMzMjs9JiMzMjtwZW5kaW5nLSZndDtmb3JtYXQ7DQomZ3Q7JiMzMjsmIzMyO3Vuc2ln
bmVkJiMzMjtpbnQmIzMyO29mZnNldCYjMzI7PSYjMzI7KHBlbmRpbmctJmd0O3kmIzMyOyZsdDsm
bHQ7JiMzMjsxNikmIzMyO3wmIzMyO3BlbmRpbmctJmd0O3g7DQomZ3Q7JiMzMjsmIzMyO3Vuc2ln
bmVkJiMzMjtpbnQmIzMyO3NyY19zaXplJiMzMjs9JiMzMjsocGVuZGluZy0mZ3Q7aGVpZ2h0JiMz
MjsmbHQ7Jmx0OyYjMzI7MTYpJiMzMjt8JiMzMjtwZW5kaW5nLSZndDt3aWR0aDsNCiZndDsmIzMy
Oyt1bnNpZ25lZCYjMzI7aW50JiMzMjtibGVuZF9tb2RlJiMzMjs9JiMzMjtzdGF0ZS0mZ3Q7YmFz
ZS5waXhlbF9ibGVuZF9tb2RlOw0KJmd0OyYjMzI7JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtp
Z25vcmVfcGl4ZWxfYWxwaGEmIzMyOz0mIzMyOzA7DQomZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMz
MjtpbnQmIzMyO2NvbjsNCiZndDsmIzMyOyYjMzI7Ym9vbCYjMzI7aXNfYWZiYyYjMzI7PSYjMzI7
cGVuZGluZy0mZ3Q7bW9kaWZpZXImIzMyOyE9JiMzMjtEUk1fRk9STUFUX01PRF9MSU5FQVI7DQom
Z3Q7JiMzMjtAQCYjMzI7LTQ2MCw3JiMzMjsrNDYxLDgmIzMyO0BAJiMzMjt2b2lkJiMzMjttdGtf
b3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwmIzMyO3Vuc2lnbmVk
JiMzMjtpbnQmIzMyO2lkeCwNCiZndDsmIzMyOyYjMzI7JiMzMjsqJiMzMjtGb3ImIzMyO1JHQjg4
OCYjMzI7cmVsYXRlZCYjMzI7Zm9ybWF0cywmIzMyO3doZXRoZXImIzMyO0NPTlNUX0JMRCYjMzI7
aXMmIzMyO2VuYWJsZWQmIzMyO29yJiMzMjtub3QmIzMyO3dvbiYjMzk7dA0KJmd0OyYjMzI7JiMz
MjsmIzMyOyomIzMyO2FmZmVjdCYjMzI7dGhlJiMzMjtyZXN1bHQuJiMzMjtUaGVyZWZvcmUmIzMy
O3dlJiMzMjt1c2UmIzMyOyFoYXNfYWxwaGEmIzMyO2FzJiMzMjt0aGUmIzMyO2NvbmRpdGlvbi4N
CiZndDsmIzMyOyYjMzI7JiMzMjsqLw0KJmd0OyYjMzI7LWlmJiMzMjsoc3RhdGUtJmd0O2Jhc2Uu
ZmImIzMyOyZhbXA7JmFtcDsmIzMyOyFzdGF0ZS0mZ3Q7YmFzZS5mYi0mZ3Q7Zm9ybWF0LSZndDto
YXNfYWxwaGEpDQomZ3Q7JiMzMjsraWYmIzMyOygoc3RhdGUtJmd0O2Jhc2UuZmImIzMyOyZhbXA7
JmFtcDsmIzMyOyFzdGF0ZS0mZ3Q7YmFzZS5mYi0mZ3Q7Zm9ybWF0LSZndDtoYXNfYWxwaGEpJiMz
Mjt8fA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7YmxlbmRfbW9kZSYjMzI7PT0mIzMy
O0RSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkUpDQomZ3Q7JiMzMjsmIzMyO2lnbm9yZV9waXhlbF9h
bHBoYSYjMzI7PSYjMzI7T1ZMX0NPTlNUX0JMRU5EOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMy
OyYjMzI7aWYmIzMyOyhwZW5kaW5nLSZndDtyb3RhdGlvbiYjMzI7JmFtcDsmIzMyO0RSTV9NT0RF
X1JFRkxFQ1RfWSkmIzMyO3sNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0
ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5
IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBp
biB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBi
ZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4
ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRl
ZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBB
bnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmlu
ZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMp
IGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1h
eSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2Yg
dGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1t
YWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkg
cmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0K
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0s
IGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBv
dGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_006_1134179333.1826001124--


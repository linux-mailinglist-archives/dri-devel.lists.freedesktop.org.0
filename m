Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228C38C9996
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 09:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D8B10E09B;
	Mon, 20 May 2024 07:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Za1n5Idg";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ifpQRn9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0404310E09B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 07:58:26 +0000 (UTC)
X-UUID: b8e3fcae167e11ef8065b7b53f7091ad-20240520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=HcMyxMIfNhsvzF93z3B5yaVFLwYV3FKqaTq+tWpRsHw=; 
 b=Za1n5IdgTHpfNuvrBgf4ilC2kEGgecWB4fTyYz39w5Ye0/zz7KcUn7hMMEhdCNdILIoBh3gS059Tsz51s4Mx9vasaHGgKFfraxT1JI+WjUwzTQbq2YedQT48hpxQrjUTdwaB7hE+UUJwj+lkXR6qhNsSe28XnP3jlbBZfapLsAY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:0e027fde-6513-446f-8757-420871a6ff78, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:670c9287-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b8e3fcae167e11ef8065b7b53f7091ad-20240520
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1564585218; Mon, 20 May 2024 15:58:19 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 May 2024 15:58:18 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 May 2024 15:58:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a06y7pGe3bBTueOlyGuD1Urfr68CqL7s1wnzbHho1XJYZzP6cUUpbxVus3mJqPQVmQnnZr25WjhciLYOEf+1lmGmWMVB4EaEI8RghJw628cfkVxXgJMWqdjKQ5DZRacZW/FKK63dm7T86o58sZe0LZQC0XV/PsgqKwEnF3fazMDc/ErQ3bBrJBM19f8CgZLUT+pdkx0uZ0Lljg6wCTdFqm2oOHweA527rC0PwAs7EUef/B+0zxhcVUw9VJv49YQK8MsXbRFGcJGVObtjZIb28yWQB+waxkvsQqKZQrye/QjehgMTBtwAxSEe0zLICeC6gg/MRvj3Z3WNhYY9QGvJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcMyxMIfNhsvzF93z3B5yaVFLwYV3FKqaTq+tWpRsHw=;
 b=G5YI2s9mhM4d4ReCtNz4j/MvaqxIVUgobqdah/q9jkxfRmTIyu95bfEcHttfVWOMDLr40NMgJf6l9hG1AtCn3Ej82LdakkGYQCsBbIjlxl/lNKICuboBW9XPvoMozSsXpKCI0kG7kVynHgNtK8MigeZfDi8vcVl61FimA9Zi/zABfZG3Cgi795enQen2h98MBWe03V7aHVKjm6SPf8VYo4IhUfv/gv5XHo8ENDib5+ag8ckZF6RT+bR+C/hjTsoEUXP11G+OGkuFI1DWPcrNDRMSF/UG03eiaN5/oZANpjRNtIObST2GI2TlyNWaA/L9HifZZZUcmEPXjxc5Pewtsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcMyxMIfNhsvzF93z3B5yaVFLwYV3FKqaTq+tWpRsHw=;
 b=ifpQRn9nYbH1DM7b1xlrMLV9mQXe+kz8UAcRpy/Ijat0YoKmJJXUT1qdHDPWJ6a/JaPDaogDQqWKLYJOTcdhGI2jR7hza832Xgfs1dhd28J0oaYab0IKraKzYtxbihFKvhWU9vXFPJ8+VdunGS/f3jX2l5z9eNDDQmFLkPxzxnY=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 TYSPR03MB7652.apcprd03.prod.outlook.com (2603:1096:400:42d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16; Mon, 20 May
 2024 07:58:16 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0%4]) with mapi id 15.20.7611.013; Mon, 20 May 2024
 07:58:15 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jstultz@google.com" <jstultz@google.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "quic_vjitta@quicinc.com"
 <quic_vjitta@quicinc.com>, "willy@infradead.org" <willy@infradead.org>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "robin.murphy@arm.com" <robin.murphy@arm.com>, 
 "contact@emersion.fr" <contact@emersion.fr>, "logang@deltatee.com"
 <logang@deltatee.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "jkardatzke@google.com" <jkardatzke@google.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "joakim.bech@linaro.org"
 <joakim.bech@linaro.org>, "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Thread-Topic: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Thread-Index: AQHaprp4GpnKuiAAR0GKSJ5cgg3gt7GZhXSAgAZEBQA=
Date: Mon, 20 May 2024 07:58:15 +0000
Message-ID: <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
In-Reply-To: <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|TYSPR03MB7652:EE_
x-ms-office365-filtering-correlation-id: b74eb424-c341-495d-40df-08dc78a29ab2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|376005|7416005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?dEhReWtWaUdTcWZqN2EwZ2ZSUEkrdDlRanZsbysxY0ZNbk9VV2VMQlJpRkVC?=
 =?utf-8?B?ak5tY1FiL3dXdEgwRjRHbEpVeFcvdHl2MngzOHJJenN3a3FicFU2YUw1UEI5?=
 =?utf-8?B?VllRekk0WEo2OThNT2RsQW9vcVdQeG92SitQQVE3QXMveFZTemYvQnVTN0VH?=
 =?utf-8?B?amZGNUNFMDVUUzBVZDBGQmdqeHl1VmMvVVZOOGJUZzlib3ZkdlBJUHI3QVpi?=
 =?utf-8?B?U2FybDkrL0lWRXhnKzZuSU5pTVRGa3Fzc056alRHaVYyMkppUWRaaWVsL2Ju?=
 =?utf-8?B?NzZsTWZWQzZtNjRndDJpUDllR0NXaG9CQWsxUUx0UkFpWTFHRHZKcVNxODE2?=
 =?utf-8?B?NGttQVNjdjdIaGJYRDRRT2o3ZW9iS0ZrbzdLd1VXOGl5RnJoL3BlL2pwSDdH?=
 =?utf-8?B?SHFmMkpPSElXeWZCOWUyWHRVMjhiUTJaNXZWOW1qMURYUWpJR2VJbFpBMjBp?=
 =?utf-8?B?RVdJWGZ1YlZTSHZYUVBSeFVUWk9jNTErYUY3TkVtUEMxbzVWQkFZSnRoNFE1?=
 =?utf-8?B?U3g4ZnIxc3NDNFFBNVpEd0VZek9VaGpjMnBlOU9MbWJYc3plckhEdStVeER2?=
 =?utf-8?B?cnNSQXlkVHpEeFBRN1A1Q2RjQm0rZHpobXo3bXBPMUxCTjBSNVNHTkFud2RN?=
 =?utf-8?B?L3ZzakM4bTEzYjBOWTMrUEwrQWNpaWNuUDJtaVZnZ0xGQlkwUGtBT0ZFZXU1?=
 =?utf-8?B?em5oTHYrZWFmSVNnR2o5WHhQODRabUZ5QTRSYkFKZDVielR2L0FzMnFhZGow?=
 =?utf-8?B?ZnRJUW5ScGN0R2o4NGU5U0Q5NjBEbDdHSDE4TGZDc0lKaFVrd1ZyQ2RBRWc3?=
 =?utf-8?B?SDhvQUNJSXQwWW0xQmN4d1MxWGlETWZzS3FVRmUybWRVUEF3c3YwTDBrM1VO?=
 =?utf-8?B?MFp3MFRiS3dsRW1NZWlUR1A5Z1BpNGZPck5JTGsyWTk4NUpNRDIrNDVrbTJZ?=
 =?utf-8?B?VjZDQUdSaW1HK09VMFJMeFdaYXdZVWZMa3lyWVVqcWU2QVpwNjdFeUw2SHJ6?=
 =?utf-8?B?Rng3bzFLekV6d293M3YwR0N1MDc0Z0JyT3pwZ0ovNjdYbUo4NUFyOU1FbTdP?=
 =?utf-8?B?cHo2RlFrVThOUGFncUxrY21NTkprUFREejVxU1J2OTR1NzluOXZCYkw2Snkv?=
 =?utf-8?B?LzRPdDB3d2pxNUJUOG02b3F3MlNRUEVvV0lPWlpsWTU4Rll2MFg3Ti9naEpD?=
 =?utf-8?B?ektvN0ZTYUk5L1h6eDEwSnk2blByQjhURTlmQnZUSmpMMHRCakpNWmRZUDk3?=
 =?utf-8?B?VlVDUXhzMnNDMDVReVc3MVJNMVQyMHlLWDJ4bVZBdFhJUWFLeHRuMzBjUlRa?=
 =?utf-8?B?NXJFRzBzWWg0anZwUk5zR0s2T1I5RmRVZDZHVWlXTi9zSWtuSWZzb2Jjb3g1?=
 =?utf-8?B?WmtRcXlkU0FkeFJvU0xydHVLcjYzVXJwZ0haejV0Z09BNXV2T1pKTUJEbTZW?=
 =?utf-8?B?cXFVN0xSdzdNc05sOGNMT0RDS21VeW9nbWNvVVdnRDNianI3U0dRWDRaZ0Zt?=
 =?utf-8?B?Qld1ODhKc29sTG1sWXROVE1iTjA4QXBxT2lUL052elFtb0cvekVqV2ZYb0Zm?=
 =?utf-8?B?V1FjZXpQNFUvN2FheVcxNU14TVQ1WTNmY2NacjB2RHlDSWNtaWpJMUlJZTgy?=
 =?utf-8?B?UjhUV0F5SDhKUS94bURSeWpDWmFlMGNjV1VYenBFK2ViUU03Ti95cS90N0Jt?=
 =?utf-8?B?L3RiL1c1NUU0aDFrYUhiNzJJenQ5bTFLNS83cFpUaUZjQW5URGxxa3dueXNK?=
 =?utf-8?B?c2VGRUhkSHcybzE3cFJ3WDkzcjc5ckt2SUN0dVNNNmY2ZWZyUDZzMXB0UHlq?=
 =?utf-8?B?ZjgwNjNqVXJBbW5NcXJVUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Um0zb1hrUmU3dkFRVVByaEh2ODVVTjVzZGxNU0dqcEdOZE4zNmZkNnJka1Za?=
 =?utf-8?B?eXFhMmNJVTAzMTNHTHlMM0dNa3hha2ZmS200NkdGQlhUOStsTWxjdDB3Z3NC?=
 =?utf-8?B?MWpVeWp1TlBBR3ErYXZaWUdpakFWZ1RNYlhMQUFlanhVNUQ3ZDYxTkxSQ00y?=
 =?utf-8?B?NXRwc3VleENkcDBJdUFWR3V5Y0JjZUFwSHRKNkxSWUswUEV5S3lIQzZOcWQ4?=
 =?utf-8?B?K0pBMFpyMUF6Y0c4VGtPbXFrdEJkaSs2WHF3aVlWR28wS0tHYnlxSFBDR3d1?=
 =?utf-8?B?NWVVOW9iMmNpUkExSC9PSTExa1FJNTdFaFM1RHM4RUtjVDVOSms1Q01xaTdu?=
 =?utf-8?B?MXZ6Z0lZYS9acVMvM0FucjFJaWhRVGVrRjFWalZNVXNJK0I4V3NFSjBDN1Jj?=
 =?utf-8?B?NDFDSi9PU0IvZ3BoVUxUZ0hZbGtMbFg2KzU5SDJMTTV5S1pNTFk5R2hWR1Fi?=
 =?utf-8?B?SGVyd25YT3JhUDZRYzhMTjRkenRPV2pXcjMzRzZXVzJZdmFhU09OZFZPRVdv?=
 =?utf-8?B?Z09RZDV1ZzNxN3VBdlFYZUxyajlCMXRxeUpjcDdVZ09lT3cvR3ZrQ0xjblgv?=
 =?utf-8?B?TVpzR1NTK0trOHV0WkdqUkliVENDYnhqVmdVQUUyRDE2eGs1dnVJbzlKNzNW?=
 =?utf-8?B?OE9kbDNwcklvSmkzNndqdWdRV05nbVB2MDFENzNuQzNha2V4UzlWL0F4aVFZ?=
 =?utf-8?B?OTZHaVFHSEZsYXRmQUg1QnJFdXNUNEJqdUVLUCs2MFFleGVody9pY1p5eFBL?=
 =?utf-8?B?NUlFV094L25sS3FwbDRIc0pWZk04SHNzSGpTckQyWUJwaFhaeHZDTGVESGFC?=
 =?utf-8?B?L0UzK09tcHhhdGJjdldGQmtNcEhlQW9Fd1NQSE03bnJLaEQ1ZTBzcU1kRlNp?=
 =?utf-8?B?T09GY3NmS2tKUVYxYjJsVmY5Z2xDL3cwRW0wRkVackkwSXlJWnJjWFBnMHZx?=
 =?utf-8?B?L1ZzdVVnZ3ZET3BSbnFPY2VmTzVzU0NaaVpqRUIrcDcvNm5yR3FlRE0xWTly?=
 =?utf-8?B?TGxERnlVT0ZaVW42U2FwRmxnTGRPOGUxaVZMVEpqcUN2cGY0NFd6QkFybGtN?=
 =?utf-8?B?TG1ZdllQbWY0Zmg3UGJaaHJKcXhBRkoxY0NqeW5nRmVxak5GVVliTHFaRDVn?=
 =?utf-8?B?cnNCS2tqT0R5TVI4YmFUdUNXT3Zrb2JnMnQ4NmZ4dmtqeTFFT3dvbGFaQjVx?=
 =?utf-8?B?YTUvL1krT1NmMy96VzF2aXlpME5saHB3ZEFudU1TR1hDQ2lrUlBxSjZBbGgw?=
 =?utf-8?B?RWNkckdjVlF3cVJaL3dGV1VsRWpHQmVwZ3lIQXVGRnVDdEJTVmlWc0xSUHJQ?=
 =?utf-8?B?Y0VOTERsckVzbGdIWWRkckIvazBzZTJTa3dTM2syL29GWTlHeUpIRmR2U2Ny?=
 =?utf-8?B?eG9tR1E5RlRoSGYzNiszMXlnbDZlQTlQK3Z6YlhBWEtITkpyN0tNR2hVays0?=
 =?utf-8?B?bFJEL2hTdWxkMkUvakF3NXMwU0JDZVhVZzJUSzVTdW5veGJQLy9Kd1gxaitF?=
 =?utf-8?B?eGh1MjVjaUYyQXVvTzJZUHllSVJvOGtTWUo3SkxqQ0crcTd5cHdkbWxDdHR1?=
 =?utf-8?B?ekJTOWczQTdTcjVSdTFvT2xacyt0TTJGamJ2UTM0ZVplWGYrUkw4UDVhOFJF?=
 =?utf-8?B?cUZlazZXVFNES1RsUnM4aW9RMW1vMWZFQ0FiczdtYUl3aGE4cU1BU1pFZnpm?=
 =?utf-8?B?RjlNbnUwYk5yR2l1Tjl3SGZkQ0NUMjgxTy9DckJ1eER0VldDQzJwSFNxY0Rs?=
 =?utf-8?B?MFhVUkhqNkEyVEk4MXpYV2creHFuYmRzRmUwYkdMRVFGME1CQ24yMDZQelR6?=
 =?utf-8?B?Zmx6Q3RHNGxpc2VEUnBWUnBYeXZaaTdySXBIVGFHd3phdDBiSndMR1Q3RDI4?=
 =?utf-8?B?Z1pwVlBuTzFqYit0dnJKdndwQ0l4S0l2QmVhNTI2b1JhVWN5eDZzcWYxSXlB?=
 =?utf-8?B?TzdMUFlTRG1INk5KMndUUWZRbkZYckVLRW9tcWh6V00ycVFoSEd4aHY5TEN0?=
 =?utf-8?B?ZVNOdHY3cWt0RmdYWmxWTFVoaXIwS3VCS0ZpVm9yMEhPTTk4R05WR1lBYnkv?=
 =?utf-8?B?NURGREI4UCtJMnpldmEwTFRQc1FzWVd5SzZpalE5RmpaQVZ2U3hrRVBScnR6?=
 =?utf-8?B?R0wza1hvK2g5aGdPNGwxVUk3UGlOTlQzbWtwWnhic3lPOHgwNmYyYWVOaDdX?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67EC1FAE66A2EC4495302695250CB95C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74eb424-c341-495d-40df-08dc78a29ab2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2024 07:58:15.4827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mr+zJ5XKPIyiV7tIhKxO2n6MGEVj8XZYjJD5XCDiF0SdW18kpM4DGulScH8hxQWIxLpgHI2tt5gC5VYHI4Wy9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7652
X-MTK: N
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

T24gVGh1LCAyMDI0LTA1LTE2IGF0IDEwOjE3ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gIEFtIDE1LjA1LjI0IHVtIDEzOjIzIHNjaHJpZWIgWW9uZyBXdToN
Cj4gPiBJbnRyb2R1Y2UgYSBGTEFHIGZvciB0aGUgcmVzdHJpY3RlZCBtZW1vcnkgd2hpY2ggbWVh
bnMgdGhlIG1lbW9yeQ0KPiBpcw0KPiA+IHByb3RlY3RlZCBieSBURUUgb3IgaHlwZXJ2aXNvciwg
dGhlbiBpdCdzIGluYWNjZXNzaWFibGUgZm9yIGtlcm5lbC4NCj4gPg0KPiA+IEN1cnJlbnRseSB3
ZSBkb24ndCB1c2Ugc2dfZG1hX3VubWFya19yZXN0cmljdGVkLCB0aHVzIHRoaXMNCj4gaW50ZXJm
YWNlDQo+ID4gaGFzIG5vdCBiZWVuIGFkZGVkLg0KPiANCj4gV2h5IHNob3VsZCB0aGF0IGJlIHBh
cnQgb2YgdGhlIHNjYXR0ZXJsaXN0PyBJdCBkb2Vzbid0IHNlZW0gdG8NCj4gYWZmZWN0IA0KPiBh
bnkgb2YgaXQncyBmdW5jdGlvbmFsaXR5Lg0KPiANCj4gQXMgZmFyIGFzIEkgY2FuIHNlZSB0aGUg
c2NhdHRlcmxpc3Qgc2hvdWxkbid0IGJlIHRoZSB0cmFuc3BvcnQgb2YNCj4gdGhpcyANCj4ga2lu
ZCBvZiBpbmZvcm1hdGlvbi4NCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBJIHdpbGwgcmVtb3Zl
IHRoaXMuDQoNCkluIG91ciB1c2VyIHNjZW5hcmlvLCBEUk0gd2lsbCBpbXBvcnQgdGhlc2UgYnVm
ZmVycyBhbmQgY2hlY2sgaWYgdGhpcw0KaXMgYSByZXN0cmljdGVkIGJ1ZmZlci4gSWYgeWVzLCBp
dCB3aWxsIHVzZSBzZWN1cmUgR0NFIHRha2VzIG92ZXIuDQoNCklmIHRoaXMganVkZ21lbnQgaXMg
bm90IHN1aXRhYmxlIHRvIGJlIHBsYWNlZCBpbiBzY2F0dGVybGlzdC4gSSBkb24ndA0Ka25vdyBp
ZiBpdCBpcyBvayB0byBsaW1pdCB0aGlzIGluc2lkZSBkbWEtYnVmLiBBZGRpbmcgc3VjaCBhbg0K
aW50ZXJmYWNlOg0KDQpzdGF0aWMgYm9vbCBkbWFfYnVmX2lzX3Jlc3RyaWN0ZWQoc3RydWN0IGRt
YV9idWYgKmRtYWJ1ZikNCnsNCglyZXR1cm4gIXN0cm5jbXAoZG1hYnVmLT5leHBfbmFtZSwgInJl
c3RyaWN0ZWQiLCAxMCk7DQp9DQoNClRoYW5rcy4NCg0KPiANCj4gUmVnYXJkcywNCj4gQ2hyaXN0
aWFuLg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0
ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgaW5jbHVkZS9saW51eC9zY2F0dGVybGlzdC5oIHwgMzQN
Cj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5n
ZWQsIDM0IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L3NjYXR0ZXJsaXN0LmgNCj4gYi9pbmNsdWRlL2xpbnV4L3NjYXR0ZXJsaXN0LmgNCj4gPiBpbmRl
eCA3N2RmM2Q3YjE4YTYuLmE2YWQ5MDE4ZWNhMCAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L3NjYXR0ZXJsaXN0LmgNCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3NjYXR0ZXJsaXN0LmgN
Cj4gPiBAQCAtMjgyLDYgKzI4Miw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzZ191bm1hcmtfZW5k
KHN0cnVjdA0KPiBzY2F0dGVybGlzdCAqc2cpDQo+ID4gICANCj4gPiAgICNkZWZpbmUgU0dfRE1B
X0JVU19BRERSRVNTKDEgPDwgMCkNCj4gPiAgICNkZWZpbmUgU0dfRE1BX1NXSU9UTEIoMSA8PCAx
KQ0KPiA+ICsjZGVmaW5lIFNHX0RNQV9SRVNUUklDVEVEKDIgPDwgMSkNCj4gPiAgIA0KPiA+ICAg
LyoqDQo+ID4gICAgKiBzZ19kbWFfaXNfYnVzX2FkZHJlc3MgLSBSZXR1cm4gd2hldGhlciBhIGdp
dmVuIHNlZ21lbnQgd2FzDQo+IG1hcmtlZA0KPiA+IEBAIC0zNTIsNiArMzUzLDMxIEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBzZ19kbWFfbWFya19zd2lvdGxiKHN0cnVjdA0KPiBzY2F0dGVybGlzdCAq
c2cpDQo+ID4gICBzZy0+ZG1hX2ZsYWdzIHw9IFNHX0RNQV9TV0lPVExCOw0KPiA+ICAgfQ0KPiA+
ICAgDQo+ID4gKy8qKg0KPiA+ICsgKiBzZ19kbWFfbWFya19yZXN0cmljdGVkIC0gTWFyayB0aGUg
c2NhdHRlcmxpc3QgZm9yIHJlc3RyaWN0ZWQNCj4gYnVmZmVyLg0KPiA+ICsgKiBAc2c6U0cgZW50
cnkNCj4gPiArICoNCj4gPiArICogRGVzY3JpcHRpb246DQo+ID4gKyAqICAgTWFya3MgYSBhIHNj
YXR0ZXJsaXN0IGZvciB0aGUgcmVzdHJpY3RlZCBidWZmZXIgdGhhdCBtYXkgYmUNCj4gaW5hY2Nl
c3NpYWJsZQ0KPiA+ICsgKiAgIGluIGtlcm5lbCBpZiBpdCBpcyBwcm90ZWN0ZWQuDQo+ID4gKyAq
Lw0KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2dfZG1hX21hcmtfcmVzdHJpY3RlZChzdHJ1Y3Qg
c2NhdHRlcmxpc3QgKnNnKQ0KPiA+ICt7DQo+ID4gK3NnLT5kbWFfZmxhZ3MgfD0gU0dfRE1BX1JF
U1RSSUNURUQ7DQo+ID4gK30NCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBzZ19kbWFfaXNfcmVz
dHJpY3RlZCAtIFJldHVybiB3aGV0aGVyIHRoZSBzY2F0dGVybGlzdCB3YXMNCj4gbWFya2VkIGFz
IHJlc3RyaWN0ZWQNCj4gPiArICogICAgICAgICAgICAgICAgICAgICAgICBidWZmZXIuDQo+ID4g
KyAqIEBzZzpTRyBlbnRyeQ0KPiA+ICsgKg0KPiA+ICsgKiBEZXNjcmlwdGlvbjoNCj4gPiArICog
ICBSZXR1cm5zIHRydWUgaWYgdGhlIHNjYXR0ZXJsaXN0IHdhcyBtYXJrZWQgYXMgcmVzdHJpY3Rl
ZA0KPiBidWZmZXIuDQo+ID4gKyAqLw0KPiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgc2dfZG1hX2lz
X3Jlc3RyaWN0ZWQoc3RydWN0IHNjYXR0ZXJsaXN0ICpzZykNCj4gPiArew0KPiA+ICtyZXR1cm4g
c2ctPmRtYV9mbGFncyAmIFNHX0RNQV9SRVNUUklDVEVEOw0KPiA+ICt9DQo+ID4gICAjZWxzZQ0K
PiA+ICAgDQo+ID4gICBzdGF0aWMgaW5saW5lIGJvb2wgc2dfZG1hX2lzX2J1c19hZGRyZXNzKHN0
cnVjdCBzY2F0dGVybGlzdCAqc2cpDQo+ID4gQEAgLTM3Miw2ICszOTgsMTQgQEAgc3RhdGljIGlu
bGluZSB2b2lkIHNnX2RtYV9tYXJrX3N3aW90bGIoc3RydWN0DQo+IHNjYXR0ZXJsaXN0ICpzZykN
Cj4gPiAgIHsNCj4gPiAgIH0NCj4gPiAgIA0KPiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgc2dfZG1h
X2lzX3Jlc3RyaWN0ZWQoc3RydWN0IHNjYXR0ZXJsaXN0ICpzZykNCj4gPiArew0KPiA+ICtyZXR1
cm4gZmFsc2U7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzZ19kbWFf
bWFya19yZXN0cml0ZWQoc3RydWN0IHNjYXR0ZXJsaXN0ICpzZykNCj4gPiArew0KPiA+ICt9DQo+
ID4gICAjZW5kaWYvKiBDT05GSUdfTkVFRF9TR19ETUFfRkxBR1MgKi8NCj4gPiAgIA0KPiA+ICAg
LyoqDQo+IA0KPiANCg==

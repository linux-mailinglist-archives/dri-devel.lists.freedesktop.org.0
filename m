Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E59DB44D7F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 07:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0691110EB1E;
	Fri,  5 Sep 2025 05:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="dxWzgh7H";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="TcGOu4Bb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94C810EB1D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 05:28:52 +0000 (UTC)
X-UUID: 31ec32c48a1911f0bd5779446731db89-20250905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=fSHE0xPzRPCHs32qHGGZ5QXU2YxfG6bg9oz5IbMhJSA=; 
 b=dxWzgh7H75/3+ClECDtPjZS5bgZNq9GK6yrUuBP/tiplQhUkg0LPHbVajoq4vBuySC9zwksBhuHDI65upFs1dmjOWqwKBzFAU4Z2OFXCo2i0v6BVpc/lM/lCzqigDp7wOAQ756AxG/osHBRECLO92OUtPqIJiWb7f/O7CSrUZeE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:2e66c080-c6ad-4d68-b941-767e8c1ec002, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:58f87584-5317-4626-9d82-238d715c253f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 31ec32c48a1911f0bd5779446731db89-20250905
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1862366119; Fri, 05 Sep 2025 13:28:46 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 5 Sep 2025 13:28:42 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 5 Sep 2025 13:28:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPwZoDspm+UQCTr1BBa4jgmwta+NQOfRcSWqJjIifGu7tkOYSZXOBdqxDvl7FrLEB9GnGWWWdkE1H9q3676RHIxsn3R5+Ab5n81mugzbfPadd7pdEDmlQO5VEc0nEtHvMUg7PHFwtjimiakmSvtNwFpwzhV+esoZJ7AVd4SFXOpASQ743ItDHuMPXzPuxntiSbuuvemIZyUr5YjELv7KzJGfFbJmcwt4tzW5HThde5CDtkXRwTtiF8Tvz9byyY47N1bkt8LFWKi1v40zwS+RwWBRZnyAnHXj3NrIdjGqxXoB7Z4wODNb/dYAwKQHQfiOSbT53fUKYV4XQ/C+gQlEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=023WG4va3fur4zSS5yDV57gNUj6cTxrp6QugRpRn0wY=;
 b=mxcsACQYcyb3zkF1q2VxGJFq7GYNR9dbTOzcgZ10RLjnbYz16JOa5AsTkOJqZvpKpTF732ppUIZzDpnNBwcoftlga2dp5ZciQqQQQUgZ0YjE9og6FdbR29T5N7nN4kWGWue806eshkIBdzFBlUoyts7uak5Fr4WccNzqJm7i8f8W0hg+1lFS+yriEaFGD2CADrExf72R6gq3CnxQrvA8cUZbZ14qODOAxy6uSDoMFYyoEuhAMlm5P1751eBDtdgoP0UHpJ9yUYbMO9Jy740AiTf6AFDkXXH1SA/J67rhgLTxGW+FYZ8DSmw5o+DmLTcdfN73F9sOBUlrNMXIskUFXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=023WG4va3fur4zSS5yDV57gNUj6cTxrp6QugRpRn0wY=;
 b=TcGOu4BbPqMs6UQw8nKWfyHatwviT8maopsoo34Gwpvl9IrgbWYmft4rLPJWHFjaxwUuovf7o/Nyjv5Ktq/qqea30/IX4DqNN3042FosToPbNGa7A7obQte62dItpF0jV6vMfUTUAyQ1KyA30KXnAZS1KopY1iKKtREEu9ne0vI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB7239.apcprd03.prod.outlook.com (2603:1096:400:277::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 05:28:42 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 05:28:42 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?WmhlbnhpbmcgUWluICjnp6bmjK/lhbQp?= <Zhenxing.Qin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>,
 =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
 <yongqiang.niu@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 =?utf-8?B?SmFycmllZCBMaW4gKOael+ijleWTsik=?= <Jarried.Lin@mediatek.com>,
 =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/3] drm/mediatek: Add pm_runtime support for GCE power
 control
Thread-Topic: [PATCH v2 2/3] drm/mediatek: Add pm_runtime support for GCE
 power control
Thread-Index: AQHcGMYMSpygRsMhJUunkjVQrGYbjLSEGlSA
Date: Fri, 5 Sep 2025 05:28:42 +0000
Message-ID: <1479834ed116744a089e08ff6ce217f06a02ed62.camel@mediatek.com>
References: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
 <20250829091727.3745415-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20250829091727.3745415-3-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB7239:EE_
x-ms-office365-filtering-correlation-id: a009cb3d-8b20-483d-1dc3-08ddec3d13a4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RmhsWkFYSHdHelErOEtmL0NGd3NzWU5OaERPcXQxQWo3VUJlRkZNeVFrbmI3?=
 =?utf-8?B?UUsrQWQ1cHpyUkpnTWFSRHFzMStrbDkwYllSMUttdXdIWXlucU5aalRCQ2w3?=
 =?utf-8?B?V2RQTUxVMS9NQlY4ZUFPVVdkcXVYaHpGUVM5WnZzMHlsc01GSjE3eGp3dWJJ?=
 =?utf-8?B?RzFYY28yN1c2Y2s5bzJiL3ZIcVkzcTkydDVpUlF2TmlvSlIwV3dwUlloS29F?=
 =?utf-8?B?NjgwaWs3dWtpTnQyanIxUk11TjZqa3hod2NORjFKdE8wNlhidWpManA4dnNE?=
 =?utf-8?B?MXFzMmt0eitHTExzWFJXSkVCMGNFZUdvc25wVmtORlBkd25tVmlzbml1Q3E4?=
 =?utf-8?B?NFFocE9rejdLRElhWkhxZzVQRmp0aFR2c3VJekNWR0dFSDE5Q0hQMFA4dDFC?=
 =?utf-8?B?ZWlPM0tLYjVKQWZ5ZUxNZlRqOGJrNzJma1BMRWZ4ZzhsVFVIOGhnY0xndys2?=
 =?utf-8?B?Z3krSUVmWUx6U3N0YVRWVTl3SjVJWkk3ZWs3QjN0cTBmWlRFb0RGMk9qSE9p?=
 =?utf-8?B?eDR6a0lCSkVwa0xhaCs2UC8rb3JFU2lsVGc0VEgzN3BoRmFXdElTaEJqYXg1?=
 =?utf-8?B?RVZqenpER04wbFRMbUxBTTllQ0trQVlIb3B4a2dWWHE4SHlvNUtuMjE2d0pL?=
 =?utf-8?B?QWtKNFl6NGl2ejRUbnl3T2F2cHFGWFJ1dDJ6UVliU1IzNFV5RGM5RjdkQnVN?=
 =?utf-8?B?TE5yM1hyeEZpZHlxM1JvTlo1L2FFaWtZS3RJUVB6bFlOdm5ya1BZZnVMZzUv?=
 =?utf-8?B?ZEszYnI3bjl5eHpKVVNiNEdrV3F5THFmT2hvMStKWmd3Mnd1d3NBeHpHaFdV?=
 =?utf-8?B?RDFpQ1FNak9pdkowZE1WaU9GcCtaZU9OSTVaM0c1ZHpzNndReGRMZE0vUjJZ?=
 =?utf-8?B?VVAySWMwcHRWZDRzMHJOREUxODVTU09tSE1ndkY3NWJXbUFJOGVpd0kvS09B?=
 =?utf-8?B?TzJMR0ZZRlRRM2JNMVhlaU1lNGlnOHdETjFjZDhlM2RFMEVHSjJpU0szK254?=
 =?utf-8?B?dVk3anVrQm5Hc3MrZ055WXFmRzNFVk5mTHBTa0RaQWFTSEw3OUZSOEdVR2JE?=
 =?utf-8?B?TEtqTFp5TEk0aVMxQmJTdXZ4Rm82ZWh3L3JwNFI4eVN6OFdzNGVQYkt2NFFK?=
 =?utf-8?B?My9La3Nvdm93L0YyRldML1gyVytla3RiQ21SV2RhUUE5eVBMa3hpRFVJb1Jw?=
 =?utf-8?B?bzExbUZrcDdvd0ZaTHpyN3dZVE85QjFDNHB5dFlHYi9hL2dQYTFGQjVtdmpX?=
 =?utf-8?B?WWRRdVZEOGlmWGV5eVJLeEVlYWhKaGh4YTAvaGVMakNaNDZ4cmhNeXVKTXkv?=
 =?utf-8?B?MSsvTWFzbC9qQTR1NnJsTmlpdkNuR2QwcHdGZmh4VzFMQzdQTmczME9DZHh1?=
 =?utf-8?B?cGFOc1VmN2hwdzhDVHY0UGpJcXpYQkNHaitGNGE5am1ETFFHbHd4Zk5PTjMy?=
 =?utf-8?B?NEhGUEdhM3g0eDdMdmI5WWNidTU5QjF3N0NnaTgvb09BYVZpVkdYOW5PVUtU?=
 =?utf-8?B?YkxTejZYNys1Q2NaRFc2NTArb2M5QkdMeXZvRHFtNzhWcWc4S3lYWHByb0l4?=
 =?utf-8?B?U1RETVAvQ1AxY1Y1b0NLZFhmU0o5VElVMVhuODI0T3V1T1BFZ3gzQVpaOERL?=
 =?utf-8?B?OXVQNi9td0R1M2gwMlF0OUN4aUFkNzdoY0p3L1VFYWVra3IxYjdoelFyNi9h?=
 =?utf-8?B?SWhISGFGcjBxcEJXWUtjVVljdnBqTVdZUXM3bi9tb2V6TUZtK2h1QlczYk5u?=
 =?utf-8?B?SEE3aUplUFlYNUZoU0ZUQ21HR3ZvYmUvNVJRUldzM0d6RU1tbGJRV3E5SFIz?=
 =?utf-8?B?aE5xNjQ3ejVyVHNaZnk4ck8rNFBnUmx3eTlzWGNxU0F4cE5GVW1sTjluNTVv?=
 =?utf-8?B?emU2NmM2SzlKZFBSTHc3RmE5aHdVTmV1dllVbVpQSFRtWkxMMzJkVnZBSGN1?=
 =?utf-8?B?V1owcGlMdnZ6YTVNbWxKWHgzQm8xelRGdkI4aFRubzJmd1c2OVNPNER3Y1Q1?=
 =?utf-8?B?ZkFCYUs2VkhRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(7416014)(376014)(366016)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UENYWGIyMkxJcHhGcERxL3VhY0ZKVmRCUFdFN3Vwc0Rqc0E4R3ljZkV6Nks2?=
 =?utf-8?B?TnMyWXpCaXJrL1gyTWlEcmpwVzYrVUJYYmZiakxUN1YvdUpOQ2ZNeGltOU9j?=
 =?utf-8?B?S3I2b1YzbDdFREpTcG4wcmdCYjlRU1c1UHFIQkxFeTFpbGtoOHJFSHhQNTJh?=
 =?utf-8?B?NUpjSkpEMjU5QlpkbFZjYi9paUk3RFJualEvV3hsRkhPRWlQWHNUR0laM2V6?=
 =?utf-8?B?MTBRdXI2NFpjSlhIcTBOdXQ3bzdnYTgxOFYxelllTytDb3NrU2NvMUpnTVdZ?=
 =?utf-8?B?Ymd3WDVXalN4d0RaSlU2N00vOXdaZ2Z5MitRQXRWOFdXV2Z6a3Nlc3hoYm1N?=
 =?utf-8?B?bTVlSXlra2h6b1MrL2ZqY1ZEUXBpalNzMEx0bFFud0RIRE1PTmJMQ2tVV2di?=
 =?utf-8?B?SmlQa21PWGV6ZEd6VUtCTEVzbzhSa1oraDhDb0ZBRzBTeDVRdGF0OXgramN0?=
 =?utf-8?B?WFhkYWd5UmExR3hKVWJPZzNIbjBvRHY5SDRXNE9zWjUyTTJDcE1pWXViV3A1?=
 =?utf-8?B?MFJvb3V4eGQ3WU9JdTdrMGViSi9jWlZPYjFnZG1NWUgrMDRCSzJyclAwVW14?=
 =?utf-8?B?cklrYzcyYm5XYkN1WVQ3OU10SE1nVldyaWFsbEhiYjZtakExMmZVaTlBQmEx?=
 =?utf-8?B?bFNkYVY2a2pKVC9zOFJpa0VEbWNnQzQ2Q1FOMXQrUGtudE1LWHFFMjJ5UlNy?=
 =?utf-8?B?U0FzL2k2Um5PRGJMUllQcUlma0x2SE9zSi9UVnc1dDdGWnFQS3F1MTdITHdV?=
 =?utf-8?B?SEdWWUtvdHBxcSsvZVdMaXFZK3NuTktiM2NFRWdjSnZWd2tQUGM3MEQ3Q0Uy?=
 =?utf-8?B?Ky9SbHhDTytSRmloQmFOTXJWZmhUVEZINFUxQ1p4bjkyQnlCU2dnT1gzWGc1?=
 =?utf-8?B?eFlQYTdBSnhadjBDRXRhZ1dpVXRvRkwzR0JxVXVJSGtQTnJJdE43bFlhWmJz?=
 =?utf-8?B?SzZaNWdwV295RVNNYUZuTWNVNTIvajVOamk3TlAzaDU4UG5lMHNucDNwU2w5?=
 =?utf-8?B?dVpSMUwzeVhtZE5NRHZ1Yml5YTkrd0xGRi9kUUNhUUd2cHlXaCtCR1F0UHI5?=
 =?utf-8?B?RE9hR2tTSjY5OU9Vb2RXUkpmeFo5N011aUNhQ0ZFNjNld1VwSDFOenJZcGk1?=
 =?utf-8?B?cHFiSjdqd1diSE5sb01xaG1ZelRjMVRzM2ZZSWdnbkZCR0ZSRFlxTjNDZ3lm?=
 =?utf-8?B?U1BEaFBYemJ3OVF3Mk52WWpFeS9xR3NYeUhhNVhlUUNaQi94SkJ4Q04wSEFL?=
 =?utf-8?B?dVplVW5kcHVjZ1d1QzhaSW5tMjVDNENSc0s5Q0ZMUXkrVmx0RmRWZ3RWNDdE?=
 =?utf-8?B?TFNzQkV6aGFQWm8vbmVqRVF6cWEvZUdtaDk4RXRtNlRSRGZsempIR3BEWGd6?=
 =?utf-8?B?ZzBHc3dHYjlPcTlrMVAvL3ovSEhtbmhHYithUS9vbC9sZGNleml3RkExcnFP?=
 =?utf-8?B?VUY1SGhtOE9NRW85N1N2NDJ0eUxBVGJvUXJkR0ZCWWlaU0ZkczVTQ3kxalFX?=
 =?utf-8?B?RTZjRGd3ZWpWV3hNaXJIbEp4b1hCbmNtR1JUWjJKVVhGV1hTNG5Sc1RaT1pZ?=
 =?utf-8?B?WUl1aHllamsvNU4xNjFuMU52M3YxcG9FelZZbEZIcFBLQnRpZW93Vm5CSStZ?=
 =?utf-8?B?cFpJTVh1QU9yRnZ6WCtRYXIzekhpelptUWRxWmc2MElqR3pHQUliZkRNMVpL?=
 =?utf-8?B?WHNERm9Iak1LZEZka0ZPOGdya09DNTd0Y0JabzNRRllMdFRnU2dkQlJEcmo5?=
 =?utf-8?B?eHBpdVBGVWN0SDJPL2hGUWtIRk1pM0xNSXNEL1dPaXpFaUxRWUswM2djMHNv?=
 =?utf-8?B?WCtuUEJKOTBXV3ZLR2pjMTdMRVhZcEZkUnRtMVBud0dwbS9ienZNNE5BbEMv?=
 =?utf-8?B?aG1rdFVPREtBYzRWSjNJVGxMWFJoS2dmakxhckpabzAwV3N0Q29wcE5rOTVD?=
 =?utf-8?B?M1Rxa1h6dnRtamZuTEVNWE8xVTRzTnp0bzZ5WHhMdTRLS3ZtcU9LVWRDV1BB?=
 =?utf-8?B?TTZVTDlsS1Vya3pWSkVEQnRlSnJ6cWlSRC9Eejk3Q2pOcDZWaDBWSzNWTFhM?=
 =?utf-8?B?Yy9uV2Q2SEp4MTllOEtjT1lUTVRoekF4eDhVNmN0aERjTTlScTNrRVhBeGE2?=
 =?utf-8?Q?l7DitPAJ/n9tsbXEyJZAFjuv7?=
Content-ID: <DC913EBAF5886445A3AE82AAD83746B4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a009cb3d-8b20-483d-1dc3-08ddec3d13a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 05:28:42.2723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lqlYpp56Ymc/eSC+Se+sRV5naWrBnD+d+H64lVAMiXRkLyLXx/X+mxUHwwUzwejcIQCsCEjr+PyNcnDOo1sZrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB7239
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_448897325.1832495948"
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

--__=_Part_Boundary_009_448897325.1832495948
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI1LTA4LTI5IGF0IDE3OjE1ICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IENhbGwgcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpIGJlZm9yZSBhY2Nlc3NpbmcgR0NFIGhh
cmR3YXJlIGluDQo+IG1ib3hfc2VuZF9tZXNzYWdlKCksIGFuZCBpbnZva2UgcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQoKSBpbiB0aGUNCj4gY21kcSBjYWxsYmFjayB0byByZWxlYXNlIHRoZSBQ
TSByZWZlcmVuY2UgYW5kIHN0YXJ0IGF1dG9zdXNwZW5kIGZvcg0KPiBHQ0UuIFRoaXMgZW5zdXJl
cyBjb3JyZWN0IHBvd2VyIG1hbmFnZW1lbnQgZm9yIHRoZSBHQ0UgZGV2aWNlLg0KDQpSZXZpZXdl
ZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gRml4ZXM6IDhhZmU4MTZi
MGM5OSAoIm1haWxib3g6IG10ay1jbWRxLW1haWxib3g6IEltcGxlbWVudCBSdW50aW1lIFBNIHdp
dGggYXV0b3N1c3BlbmQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSCBMaW4gPGphc29uLWpo
LmxpbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19jcnRjLmMgfCA3ICsrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jDQo+IGluZGV4IGJjNzUyNzU0MmZk
Yy4uYzRjNmQwMjQ5ZGY1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2NydGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0K
PiBAQCAtMjgzLDYgKzI4MywxMCBAQCBzdGF0aWMgdm9pZCBkZHBfY21kcV9jYihzdHJ1Y3QgbWJv
eF9jbGllbnQgKmNsLCB2b2lkICptc3NnKQ0KPiAgCXVuc2lnbmVkIGludCBpOw0KPiAgCXVuc2ln
bmVkIGxvbmcgZmxhZ3M7DQo+ICANCj4gKwkvKiByZWxlYXNlIEdDRSBIVyB1c2FnZSBhbmQgc3Rh
cnQgYXV0b3N1c3BlbmQgKi8NCj4gKwlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KGNtZHFfY2wt
PmNoYW4tPm1ib3gtPmRldik7DQo+ICsJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoY21kcV9j
bC0+Y2hhbi0+bWJveC0+ZGV2KTsNCj4gKw0KPiAgCWlmIChkYXRhLT5zdGEgPCAwKQ0KPiAgCQly
ZXR1cm47DQo+ICANCj4gQEAgLTYxOCw2ICs2MjIsOSBAQCBzdGF0aWMgdm9pZCBtdGtfY3J0Y191
cGRhdGVfY29uZmlnKHN0cnVjdCBtdGtfY3J0YyAqbXRrX2NydGMsIGJvb2wgbmVlZHNfdmJsYW5r
KQ0KPiAgCQltdGtfY3J0Yy0+Y29uZmlnX3VwZGF0aW5nID0gZmFsc2U7DQo+ICAJCXNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJm10a19jcnRjLT5jb25maWdfbG9jaywgZmxhZ3MpOw0KPiAgDQo+ICsJ
CWlmIChwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFu
LT5tYm94LT5kZXYpIDwgMCkNCj4gKwkJCWdvdG8gdXBkYXRlX2NvbmZpZ19vdXQ7DQo+ICsNCj4g
IAkJbWJveF9zZW5kX21lc3NhZ2UobXRrX2NydGMtPmNtZHFfY2xpZW50LmNoYW4sIGNtZHFfaGFu
ZGxlKTsNCj4gIAkJbWJveF9jbGllbnRfdHhkb25lKG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFu
LCAwKTsNCj4gIAkJZ290byB1cGRhdGVfY29uZmlnX291dDsNCg0K

--__=_Part_Boundary_009_448897325.1832495948
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjUtMDgtMjkmIzMyO2F0
JiMzMjsxNzoxNSYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjt3cm90ZToNCiZn
dDsmIzMyO0NhbGwmIzMyO3BtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKSYjMzI7YmVmb3JlJiMz
MjthY2Nlc3NpbmcmIzMyO0dDRSYjMzI7aGFyZHdhcmUmIzMyO2luDQomZ3Q7JiMzMjttYm94X3Nl
bmRfbWVzc2FnZSgpLCYjMzI7YW5kJiMzMjtpbnZva2UmIzMyO3BtX3J1bnRpbWVfcHV0X2F1dG9z
dXNwZW5kKCkmIzMyO2luJiMzMjt0aGUNCiZndDsmIzMyO2NtZHEmIzMyO2NhbGxiYWNrJiMzMjt0
byYjMzI7cmVsZWFzZSYjMzI7dGhlJiMzMjtQTSYjMzI7cmVmZXJlbmNlJiMzMjthbmQmIzMyO3N0
YXJ0JiMzMjthdXRvc3VzcGVuZCYjMzI7Zm9yDQomZ3Q7JiMzMjtHQ0UuJiMzMjtUaGlzJiMzMjtl
bnN1cmVzJiMzMjtjb3JyZWN0JiMzMjtwb3dlciYjMzI7bWFuYWdlbWVudCYjMzI7Zm9yJiMzMjt0
aGUmIzMyO0dDRSYjMzI7ZGV2aWNlLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7
Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtGaXhlczom
IzMyOzhhZmU4MTZiMGM5OSYjMzI7KCZxdW90O21haWxib3g6JiMzMjttdGstY21kcS1tYWlsYm94
OiYjMzI7SW1wbGVtZW50JiMzMjtSdW50aW1lJiMzMjtQTSYjMzI7d2l0aCYjMzI7YXV0b3N1c3Bl
bmQmcXVvdDspDQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmFzb24tSkgmIzMyO0xpbiYj
MzI7Jmx0O2phc29uLWpoLmxpbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsm
IzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jcnRjLmMmIzMyO3wmIzMyOzcm
IzMyOysrKysrKysNCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzcm
IzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMy
O2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jcnRjLmMmIzMyO2IvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19jcnRjLmMNCiZndDsmIzMyO2luZGV4JiMzMjtiYzc1Mjc1NDJmZGMu
LmM0YzZkMDI0OWRmNSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19jcnRjLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KJmd0OyYjMzI7QEAmIzMyOy0yODMsNiYjMzI7KzI4Mywx
MCYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7ZGRwX2NtZHFfY2Ioc3RydWN0JiMzMjtt
Ym94X2NsaWVudCYjMzI7KmNsLCYjMzI7dm9pZCYjMzI7Km1zc2cpDQomZ3Q7JiMzMjsmIzMyO3Vu
c2lnbmVkJiMzMjtpbnQmIzMyO2k7DQomZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtsb25nJiMz
MjtmbGFnczsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsrLyomIzMyO3JlbGVhc2UmIzMyO0dD
RSYjMzI7SFcmIzMyO3VzYWdlJiMzMjthbmQmIzMyO3N0YXJ0JiMzMjthdXRvc3VzcGVuZCYjMzI7
Ki8NCiZndDsmIzMyOytwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KGNtZHFfY2wtJmd0O2NoYW4t
Jmd0O21ib3gtJmd0O2Rldik7DQomZ3Q7JiMzMjsrcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQo
Y21kcV9jbC0mZ3Q7Y2hhbi0mZ3Q7bWJveC0mZ3Q7ZGV2KTsNCiZndDsmIzMyOysNCiZndDsmIzMy
OyYjMzI7aWYmIzMyOyhkYXRhLSZndDtzdGEmIzMyOyZsdDsmIzMyOzApDQomZ3Q7JiMzMjsmIzMy
O3JldHVybjsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtAQCYjMzI7LTYxOCw2JiMzMjsrNjIy
LDkmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19jcnRjX3VwZGF0ZV9jb25maWco
c3RydWN0JiMzMjttdGtfY3J0YyYjMzI7Km10a19jcnRjLCYjMzI7Ym9vbCYjMzI7bmVlZHNfdmJs
YW5rKQ0KJmd0OyYjMzI7JiMzMjttdGtfY3J0Yy0mZ3Q7Y29uZmlnX3VwZGF0aW5nJiMzMjs9JiMz
MjtmYWxzZTsNCiZndDsmIzMyOyYjMzI7c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYW1wO210a19j
cnRjLSZndDtjb25maWdfbG9jaywmIzMyO2ZsYWdzKTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMz
MjsraWYmIzMyOyhwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KG10a19jcnRjLSZndDtjbWRxX2Ns
aWVudC5jaGFuLSZndDttYm94LSZndDtkZXYpJiMzMjsmbHQ7JiMzMjswKQ0KJmd0OyYjMzI7K2dv
dG8mIzMyO3VwZGF0ZV9jb25maWdfb3V0Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjttYm94
X3NlbmRfbWVzc2FnZShtdGtfY3J0Yy0mZ3Q7Y21kcV9jbGllbnQuY2hhbiwmIzMyO2NtZHFfaGFu
ZGxlKTsNCiZndDsmIzMyOyYjMzI7bWJveF9jbGllbnRfdHhkb25lKG10a19jcnRjLSZndDtjbWRx
X2NsaWVudC5jaGFuLCYjMzI7MCk7DQomZ3Q7JiMzMjsmIzMyO2dvdG8mIzMyO3VwZGF0ZV9jb25m
aWdfb3V0Ow0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwh
LS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2Ug
KioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBl
LW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlk
ZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJv
bSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUg
DQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwg
ZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29w
eWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmlu
dGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1
bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1t
YWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5n
IHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1t
YWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8g
bm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVy
c29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_448897325.1832495948--


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F42090AA16
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 11:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6085C10E324;
	Mon, 17 Jun 2024 09:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="tKq5kRcD";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="eGhk/42s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348DC10E324
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 09:44:54 +0000 (UTC)
X-UUID: 3d2eb2a42c8e11efa22eafcdcd04c131-20240617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=/GgMDDj9z78tK5rJ0LmcuGsYnU1XOUbuMu8CdJLcLM0=; 
 b=tKq5kRcDZUnaHwDEvzscJAAV7CU8PsZ60StPgj6UMh/qt9op2Jje44Yo5BGXCMz5okRp5IEwekQPpPew3p34FWa7LNzbkg0NHL279df6etcdEMf7hD/pjbweDCCUFHaXOCG7OaBzLj/Owm5u2D57EecHNuDJbPVZOH/FdUE46Cs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:1f8dd1d6-39ad-4048-9ca1-361f6d290f3c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:4be42e85-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3d2eb2a42c8e11efa22eafcdcd04c131-20240617
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 546024246; Mon, 17 Jun 2024 17:44:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 17 Jun 2024 17:44:45 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 17 Jun 2024 17:44:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHc8fQ08Ph18HZ5BhC8xnLEZX6QOXr7+dPWoOhfgFc1aQToiA6fgO/Bv0I6w7U4GN9kjIxUf/AG9wD5lRspznnjAvL+aErHYM6ybq/DegtlHRuJ+hlI+ImBlkQ1KDcywDesYL48t9WhUhR82SIPay0sFcxVQaVRtgZmEldAClT69TLbdFYFmDElszzN9YuJQbnjCOU6AXWh00ckcpb9tVoO0MmUxLzEzqN2ZZI+pZMv99P2tOJgRppYRDM7b9g3uSO7hyMS+/158tHIoOD+z1tOBUCtaOtpJkH2TNihsNvQUjtj5yLXF+FCC4uKptpBcVH4jVitAbCqD69/1ma13MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GgMDDj9z78tK5rJ0LmcuGsYnU1XOUbuMu8CdJLcLM0=;
 b=ZpQ0JfyOaBhl+EikxB1hQNttlarz9thj6tMXdKwWGyM43F9uJjE5P4HtAxeW0Kd0kqMBBnu0J2lpiMDpkpAR54+lnebDZAa1Eu/OpxKlbpgpPEYp1wHCjG86NyMNicazDc9o/cYBljGtwJ1/pCHX3kZ0Wtxt7HT5MvEoEe9Vs8jY9zfBn6cVpptpPzLRmN2BpVr5+fV58qPgrnnz2qYnHrQ1L6JcCglgRlEtYKt+fJ42aQEbs9ng+foMhs8xZw2c0Wh/ZCVL982X0vbuEZKIWVbxgkYZXcIeYXt3oBuvi5oAC3EuoiakDUvcEqUDjv+5s1PLbdWbKel5D7TBE26X9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GgMDDj9z78tK5rJ0LmcuGsYnU1XOUbuMu8CdJLcLM0=;
 b=eGhk/42s5OJ4pxorDmzY9sqM/l0vDjQPgrmcdN6VQplCb78CcE1Vyb4ccEl+zJWNe7iJwfzss4o2Om+KcIgCV109vgnwCNeKRBsf+DzR7lQCLfQnMfP53HeNYVNPDKhZb70DR3qw57OriylL29u2lTixBgNoW9xFgQAE+2BCspM=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by TYZPR03MB6955.apcprd03.prod.outlook.com (2603:1096:400:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 09:44:42 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%5]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 09:44:42 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "andrzej.p@collabora.com" <andrzej.p@collabora.com>, "tfiga@chromium.org"
 <tfiga@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>, "jkardatzke@google.com" <jkardatzke@google.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
 <nfraprado@collabora.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
 <stevecho@chromium.org>, "wenst@chromium.org" <wenst@chromium.org>,
 "jstultz@google.com" <jstultz@google.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "hsinyi@chromium.org"
 <hsinyi@chromium.org>, "tjmercier@google.com" <tjmercier@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v6,14/24] media: mediatek: vcodec: Add capture format to
 support one plane memory
Thread-Topic: [PATCH v6, 14/24] media: mediatek: vcodec: Add capture format to
 support one plane memory
Thread-Index: AQHap4u2vsne0VDv40+xdrrapUd/87GjN1uAgCivgYA=
Date: Mon, 17 Jun 2024 09:44:42 +0000
Message-ID: <2d27505f62eea2e82f5602638abc05958f66b1c8.camel@mediatek.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-15-yunfei.dong@mediatek.com>
 <1d4618ac-4316-495d-afdb-5849e4b1e805@collabora.com>
In-Reply-To: <1d4618ac-4316-495d-afdb-5849e4b1e805@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|TYZPR03MB6955:EE_
x-ms-office365-filtering-correlation-id: 2206109d-eb25-46db-f32f-08dc8eb21cfd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|376011|7416011|1800799021|366013|38070700015|921017; 
x-microsoft-antispam-message-info: =?utf-8?B?OGRRSEd1NUJYdjQyK3lIZWhqVVVEOUg4dUd5WEQ0TnEyakNBMHFWdlFJaVQw?=
 =?utf-8?B?Zzd6SDlxbXhzTXdoanZEbWx1V3BWMnc2Tm5ZUnBtVWtxTU1KS2w5NVVMYW1P?=
 =?utf-8?B?S3dRVEYzUllUL3pLcHZIM3R5TVY1S2xOemwzVHB0d0xHLysraGRBODJiWWhO?=
 =?utf-8?B?eTRZeEpHblJtMkxVSUFndGxsS2FtNzk3Y1pWblRnWmlwQzA3WTdud2tmeTU0?=
 =?utf-8?B?NW5LR3ZXMVdZU3M3a3pkdVdITTVlN016YzAyVmtLTG5HU0JkQnN6TVRjUmZK?=
 =?utf-8?B?c0RUT3Rjck1nc2VpY2lKMDE2QWovbU0yempST0VEWURwekZkVzNXaWVyeExV?=
 =?utf-8?B?WmJzN3VrZGF2NHA3Q1p6ajZpdWVReGdUUzRqTG12MjBRV2IwQnpPSnRFYzVP?=
 =?utf-8?B?R1lNNHpWL0VZUTQ4WFR1QXd6K1lpQ25GeWxzNnZXNTlHcmhoTHF4Tm43bjJr?=
 =?utf-8?B?ZEVSNCtjWWVYYklIcjZpQU1ITUNPZVM4V2hqY1M5VHBRbE82Q2ZyQ0FKT2x3?=
 =?utf-8?B?ZVlPNk51cGkxTWpuS1pOYWRvdEx3Tk9WNDVIeDRmTjdKTDgvWDVMdGZHNUlI?=
 =?utf-8?B?Z3B2VzZCdS9RUkN4YnZULy9JZkNFUTNNa1J1ako5eWtXYnA4aUo5cWFRM3JY?=
 =?utf-8?B?SW9zWXdpbzNRY0RPM3d6RTRCaUdnOGozYkJzcmd2eWk0b1dkUS80bThUaUJB?=
 =?utf-8?B?eDhMMDhoRkpwaHZVdTdaUW1jSldLbmt5aXF0R1FYWVlaYkM2cDBiaENCRkI3?=
 =?utf-8?B?djFuOURkQkxmbjM4RytwVUhucGVlNUZoQUdOZ0poRENkeFJlYlNKeEJYTWl3?=
 =?utf-8?B?aG9vZjU3RHZ3ZWFIUDNpbnBZamdUNGlodTRwMXFUaG84WFF4YnRCNHM5b1Ns?=
 =?utf-8?B?RWx1dkZIRC9KK0JUTnVwRkxSTFBqdzdXOXZhV2YyZmxOUkFZT3pJTC9Bcjl1?=
 =?utf-8?B?dmQrTFJGNjlkelNpb1ZoMDV2UXF2V1JacjhXQmFRT1hYSVdXS2szbUF5NWlJ?=
 =?utf-8?B?Zk9mbUIybjc0S1J5RUUrYm1oVkxEcjMzRE8rR3FpNmFCaUVRRDd0QUN1UkhH?=
 =?utf-8?B?NEh1V2FDeDB6MXIvMjQ5dDdLUUhZc01qOW1DWlhzd3NmYm5kcUZtcVA4dlZl?=
 =?utf-8?B?d0FpQUdWcFpSTi9YZW5SVHVna3RGN0VERitUU1N6eFJJZUNsanp5VmNrdDZR?=
 =?utf-8?B?TTlnVERUbHJvWko4Sjd5UE03TStIWmtTZkFPek1uRnpNZVlMbG03QXQwZU1x?=
 =?utf-8?B?MGFkSW1oQzFIczgwYmxGSzVaQ3BEMGVucklXZHZDVTRTOFdVWjR3OHlFSHZv?=
 =?utf-8?B?OWsyTDU2SFBySzg1VWcxbGhGb2QyZG83bWQ0ZGNFeGtUT0t0UXVWQlZmK1lx?=
 =?utf-8?B?a2ZvWU1EdFFpQVFGdlZLOWdxQVJjd2RFekdtK0JnSjdlTllOK01hYk56bEsy?=
 =?utf-8?B?QU5YNHdBTTR4bGFJYTlvQkpNUFpzcDNJaGpreXlEU3ZMZmV1ZU5jSCtObFI3?=
 =?utf-8?B?bTRQWGlyd2lId3JXekgwUEVzZENwaWdRSHAwN0FobVk1TlhHS3dicDVxMXdY?=
 =?utf-8?B?ZklOTnI5MlRaTENpOGM4S1ZCZFNmTXpKZ3JtdEtuc2NwLzdsakdwTER2YW12?=
 =?utf-8?B?cXJZSzRwZnoxSGhNcEd1YWFmRVhSOEdvckVxRXVuaXhqenlZQU82Z3k5RzZl?=
 =?utf-8?B?YkIyMmZkcCtuZzBpNkdyeUZMZmFuSmgyaWswaDltVHpYOHUzcVV4cHlPVHV4?=
 =?utf-8?B?TU1NY3VHK3dhQXZTZzAyVHZ1U0R1NEFNU1dYTFUxa3hBM3lGYlh4UlhFc1VJ?=
 =?utf-8?B?NEhRTTZnY1orVmlEUnpUOC92Sk4zdkNPaFVGZ1g3c1MxYlV3cVA3QmVzdzI3?=
 =?utf-8?Q?uoxZboeHBW9Jy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSQPR03MB8697.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(7416011)(1800799021)(366013)(38070700015)(921017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFp1UGpLUHZtbzFDTXEzWHFlVGVZb2daVXpVekp3SWljT21qWDBxa1RpU3NI?=
 =?utf-8?B?VXJDQWIxN1RIV0hUbGs5M0ttK0E4MEttdk5CdENXcWlDTXUvWlFRZWpaR0RG?=
 =?utf-8?B?L3JIZTZnRTNqVTJsZXdrQkZSb3N5RFhXWnhiQTJ4ZlVzWkRzcHNaQkZmdTZC?=
 =?utf-8?B?c1YySTJGU296Z0pBN3JERkpib2FIaTRLQkhNOTJQOG9aZmkyN0ltTEpqM21G?=
 =?utf-8?B?d1ozSjlld3NDME44Ni93WHBPTlEzeFVnQnliZGF4NSt0VVFtaG9HZXZOMmQ0?=
 =?utf-8?B?aG9jNEdoN2crVE0wN0tSOFJ0T2dUWVZURlVwYUJqUllVMTBVVTFVQlkrbUEx?=
 =?utf-8?B?blhSTEdpdHQ0Tk5qcUJSanFURW5yZDJESmdvZExpZEFJa0JCbUNYNjFKZE42?=
 =?utf-8?B?cXp3Wks1QXlWSGVSVXp5S0FsbHZidVpSQlBtc01qRTlqY2NSWGl3RkdjaCtv?=
 =?utf-8?B?b05WdFNoODc2MmRjYmFjUmhJb29aN0J5VWpRSjY3RjhMNVRhcUhVSzB1R0Zy?=
 =?utf-8?B?SVVDMklZNVY2VFp6cGM1RlQ3a0NLUGhaZEw1cjhQNjR1WTFUM3FXb20rYVVt?=
 =?utf-8?B?TU1oRElLQjh5MVBpRUIyNGhleDk2blUrOHBETkhjSkM2dHNUb01QMERjVlRv?=
 =?utf-8?B?Z05EMkUwKzg0d3FtQW11RXRKWGFDNjJhVElJbmErQmxUYWlJU1RlVGtTaTFO?=
 =?utf-8?B?TTdJRjh0K0ZhU3dwMFN2ZmdRY1dobStyV3hkV25STWRMRUZWWGJIRDErUVdE?=
 =?utf-8?B?aVQzbWtuMDA5dnNJVVYzSERPRzJIYzhHRng3MXBjSm45aHl5N1I5MGZtcWpT?=
 =?utf-8?B?SjU3OHVveXpGNkFMcktLLyticFpwdGp4K3hPcGVQUzhyekIwTkhCYlpZenpW?=
 =?utf-8?B?SWdrc2ZUN2ZKMENzcVdWcEdRQVNHdjAwc1VoZldMQ09QNzdZS2VHL0U4YXVQ?=
 =?utf-8?B?TGlVb21xS3NNS2h6UmcxaWRtTkxIa05aTXhuaG96RG5XeUNkMlozeXhzNm03?=
 =?utf-8?B?cUlOZllqeWNKRVIwS2xJL0FjNUM2dTJjVDBBQ0FUUDhIblVmcW9hTGJ2UHEr?=
 =?utf-8?B?blNGOGx3TUNhUHRadytWZEJSZmhqWDlxYlJsem9nQkVxS0VnWFYxUmgzTWZM?=
 =?utf-8?B?RVZxZUxHeXNPaFNBSFhUZzlsZmpjVE84akc3WE9hVHAzOENLb05nVUdiMmg3?=
 =?utf-8?B?cHZmbnh4TW55K2REUTBGb0ZXZkp1S2oyWDRLNWdQeVhRdkptVG1IZ2tJM2dR?=
 =?utf-8?B?TDREQ3lBaXYwdWk1QThCTzlEZ1B4WkJIaUxaSy9kNWR2Vm5jcDlVR0Q0MTNP?=
 =?utf-8?B?OFRNcGtoRHRUK0lqbnp6aVVhMDVvenpsNndiTTVIWTl6a1JNWUU5alQybDMx?=
 =?utf-8?B?VjhpZmhPS1AvdGVEVTZQQ2RhN3V0d3NEYXRiRDdpaUcvaCtwQmFMb0Y2blht?=
 =?utf-8?B?dEsyV0FxaXZmNXFEQmhTUHVmRzc5MTgyeGs1OEtNWnpkc2M4RVJwSjBIdjFZ?=
 =?utf-8?B?NE5GRkZqZlFwRjdWenhsRDJxQ3ZWcWxaTFFRcDFBNm1WSktQaTN0SVFWelln?=
 =?utf-8?B?c0lVVWgrdGxWSldDR0F3bDM1U2FqUDVhbEgxNHA4d2F5Ti9kVHpiVmpvNlhj?=
 =?utf-8?B?ZWJHK0lEek80SmJMdlpyZXdRWUh6YVJlL1N3RzYzS3ZlK2ZHRGc4TUpndmhK?=
 =?utf-8?B?cnFld3Q2Y1hPMk5vRTdqRXVWMmpsZFBoanQxRW9wZHFzajd6MHB4QW9aMGdG?=
 =?utf-8?B?S2hydzRFQ3djMktkc3FLRDZtWHBDQWRKNGlCNkoxejJjaWdXNitjdTZoSG5m?=
 =?utf-8?B?b3gwQ2hETjhQZXY0dkJ3T0lWSHFOczJRT3F4bmx3QjVVN3NGSE81TTZaOWZ1?=
 =?utf-8?B?RUx2bjJSczFUUERKQlFEUU41RWZ0MTZMdVBndDB5dWQweXZHZU5EMHZob0hD?=
 =?utf-8?B?bVFiZUJHOWZ3bjJHcGpKajltbEFpaExWdmNlRkpMdGJPK2pUMWFwY2EwNTdX?=
 =?utf-8?B?bGEvUHdtVjB1QlRQU25QcStrc0FrajZPb1VpQ0YzZGtyNU02eTlXYzN2cXhR?=
 =?utf-8?B?eG80Ukc2TnQvNGtldVRoeGVCVjNNeGlFR2RCazhUQzVNeEdlVTRxV0d5WldU?=
 =?utf-8?B?SVgwNENEbmZjRThZbW54T2tIaUZIUG9GbUp4WU81emdVOHNOSTExNmYzK1dW?=
 =?utf-8?B?Y1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82874877EA319446804CE6DDD24360E5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2206109d-eb25-46db-f32f-08dc8eb21cfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 09:44:42.0964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KvIcKaQd/BMn09xBw7s+5doPT0O4E6bJf6fdUdzpkOJqjG2n24M0Oamf4CakF/04otfhH61dcWWY5jgwnX4xebi7GrXn0qUrfWUn5kpZAaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6955
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--17.340800-8.000000
X-TMASE-MatchedRID: eVEkOcJu0F6nykMun0J1wpmug812qIbzjLOy13Cgb4/mNRhvDVinvypf
 0VJZhlxPN+7y0ElYiSjLK83WXqbHGKaTtydHAivJws9cphnKwlGy4iyjvVWToiz+5QCTrE/sT85
 +SH/4Avg9I+RojwVYZL3LPP4r1hL6yyK9Yq7IZ3JoMLOoNHsM9mSNw0miEcKrlyNqprgBrUL4eY
 E/JF5KDE14sxrfQXS0evzZE7q8mEuN/VOMfeOgV2wbuvhCHs3cN/BTU5ZfZRIS+jFO7d+PW6iqo
 yMo73J2+GMqpofQlcCmGallF1XuaI5S/4bo68Nb7spMO3HwKCBT4DtiSkMnWP0TP/kikeqnNyd6
 ynRfHVFdiu/iJ3L4eZGTpe1iiCJq0u+wqOGzSV1WdFebWIc3VsRB0bsfrpPIfiAqrjYtFiQe1rz
 Igu8IMkYr5PCgD+3BX/2NP21G8lvCm1tB0bY1qn7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--17.340800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A039768571FB3FB89E5360418E948D85708FD6068DB827C2F920B06B079204DD2000:8
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

SGkgQW5kcnplaiwNCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAgdG8gcmV2aWV3IHRoaXMgcGF0Y2gu
DQoNCk9uIFdlZCwgMjAyNC0wNS0yMiBhdCAxNDoyNiArMDIwMCwgQW5kcnplaiBQaWV0cmFzaWV3
aWN6IHdyb3RlOg0KPiBIaSBZdW5mZWksDQo+IA0KPiBXIGRuaXUgMTYuMDUuMjAyNCBvIDE0OjIw
LCBZdW5mZWkgRG9uZyBwaXN6ZToNCj4gPiBEZWZpbmUgb25lIHVuY29tcHJlc3NlZCBjYXB0dXJl
IGZvcm1hdCBWNEwyX1BJWF9GTVRfTVMyMSBpbiBvcmRlcg0KPiA+IHRvDQo+ID4gc3VwcG9ydCBv
bmUgcGxhbmUgbWVtb3J5LiBUaGUgYnVmZmVyIHNpemUgaXMgbHVtYSArIGNocm9tYSwgbHVtYSBp
cw0KPiA+IHN0b3JlZCBhdCB0aGUgc3RhcnQgYW5kIGNocm9tZSBpcyBzdG9yZWQgYXQgdGhlIGVu
ZC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVk
aWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21l
ZGlhL3Y0bC9waXhmbXQtcmVzZXJ2ZWQucnN0IHwgOA0KPiA+ICsrKysrKysrDQo+ID4gICBkcml2
ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWNvbW1vbi5jICAgICAgICAgICAgICAgICAgICAgfCAy
ICsrDQo+ID4gICBkcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWlvY3RsLmMgICAgICAgICAg
ICAgICAgICAgICAgfCAxICsNCj4gPiAgIGluY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKw0KPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdXNl
cnNwYWNlLWFwaS9tZWRpYS92NGwvcGl4Zm10LQ0KPiA+IHJlc2VydmVkLnJzdCBiL0RvY3VtZW50
YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvcGl4Zm10LQ0KPiA+IHJlc2VydmVkLnJzdA0K
PiA+IGluZGV4IDg4NmJhN2IwOGQ2Yi4uNmVjODk5NjQ5ZDUwIDEwMDY0NA0KPiA+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvcGl4Zm10LXJlc2VydmVkLnJzdA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvcGl4Zm10LXJl
c2VydmVkLnJzdA0KPiA+IEBAIC0yOTUsNiArMjk1LDE0IEBAIHBsZWFzZSBtYWtlIGEgcHJvcG9z
YWwgb24gdGhlIGxpbnV4LW1lZGlhDQo+ID4gbWFpbGluZyBsaXN0Lg0KPiA+ICAgICAgICAgLSBD
b21wcmVzc2VkIGZvcm1hdCB1c2VkIGJ5IE51dm90b24gTlBDTSB2aWRlbyBkcml2ZXIuIFRoaXMN
Cj4gPiBmb3JtYXQgaXMNCj4gPiAgICAgICAgICAgZGVmaW5lZCBpbiBSZW1vdGUgRnJhbWVidWZm
ZXIgUHJvdG9jb2wgKFJGQyA2MTQzLCBjaGFwdGVyDQo+ID4gNy43LjQgSGV4dGlsZQ0KPiA+ICAg
ICAgICAgICBFbmNvZGluZykuDQo+ID4gKyAgICAqIC4uIF9WNEwyLVBJWC1GTVQtTVMyMToNCj4g
PiArDQo+ID4gKyAgICAgIC0gYGBWNEwyX1BJWF9GTVRfTVMyMWBgDQo+ID4gKyAgICAgIC0gJ01T
MjEnDQo+ID4gKyAgICAgIC0gVGhpcyBmb3JtYXQgaGFzIG9uZSBwbGFuZSwgbHVtYSBhbmQgY2hy
b21hIGFyZSBzdG9yZWQgaW4gYQ0KPiA+IGNvbnRpZ3VvdXMNCj4gDQo+IE1heWJlIHMvb25lL3Np
bmdsZSA/DQo+IA0KPiA+ICsgICAgICAgIG1lbW9yeS4gTHVtYSBwaXhlbCBpbiAxNngzMiB0aWxl
cyBhdCB0aGUgc3RhcnQsIGNocm9tYQ0KPiA+IHBpeGVsIGluIDE2eDE2DQo+IA0KPiBtYXliZSB0
aGUgd29yZCAicGl4ZWwiIGlzIHJlZHVudGFudCBoZXJlPyBXaGF0IGVsc2UgdGhhbiBwaXhlbHMg
Y291bGQNCj4gdGlsZSBzaXplcyBtZWFuPw0KPiBBbnkgcGFkZGluZyBiZXR3ZWVuIGx1bWEgYW5k
IGNocm9tYT8NCj4gDQpUaGUgc2VjdXJlIG1lbW9yeSBvbmx5IGhhcyBvbmUgcGxhbmU6IEx1bWEg
ZGF0YSArIENocm9tZSBkYXRhLg0KDQpMdW1hIGRhdGEgaXMgaW4gb3JkZXIgb2YgMTZ4MzIgYmxv
Y2ssIGNocm9tZSBpcyBpbiBvcmRlciBvZiAxNngxNg0KYmxvY2suIFdpZHRoIGFuZCBoZWlnaHQg
aXMgYWxpZ25lZCB3aXRoIGZpeGVkIHZhbHVlLg0KDQpJIG5lZWQgdG8gcmUtd3JpdGUgdGhlIGRl
c2NyaXB0aW9uIGFnYWluLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdW5mZWkgRG9uZw0KDQo+ID4gKyAg
ICAgICAgdGlsZXMgYXQgdGhlIGVuZC4gVGhlIGltYWdlIGhlaWdodCBtdXN0IGJlIGFsaWduZWQg
d2l0aCAzMg0KPiA+IGFuZCB0aGUgaW1hZ2UNCj4gPiArICAgICAgICB3aWR0aCBtdXN0IGJlIGFs
aWduZWQgd2l0aCAxNi4NCj4gDQo+IE1heWJlIGFsaWduZWQgdG8/DQo+IA0KPiA+ICAgLi4gcmF3
OjogbGF0ZXgNCj4gPiAgIA0KPiA+ICAgICAgIFxub3JtYWxzaXplDQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItY29tbW9uLmMNCj4gPiBiL2RyaXZlcnMvbWVk
aWEvdjRsMi1jb3JlL3Y0bDItY29tbW9uLmMNCj4gPiBpbmRleCA0MTY1YzgxNWZhZWYuLjVhZTU0
Y2Y0OGRjNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWNv
bW1vbi5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1jb21tb24uYw0K
PiA+IEBAIC0yNzEsNiArMjcxLDggQEAgY29uc3Qgc3RydWN0IHY0bDJfZm9ybWF0X2luZm8NCj4g
PiAqdjRsMl9mb3JtYXRfaW5mbyh1MzIgZm9ybWF0KQ0KPiA+ICAgCQkgIC5ibG9ja193ID0geyAx
NiwgOCwgMCwgMCB9LCAuYmxvY2tfaCA9IHsgMzIsIDE2LCAwLCAwDQo+ID4gfX0sDQo+ID4gICAJ
CXsgLmZvcm1hdCA9IFY0TDJfUElYX0ZNVF9NVDIxMTBSLCAucGl4ZWxfZW5jID0NCj4gPiBWNEwy
X1BJWEVMX0VOQ19ZVVYsIC5tZW1fcGxhbmVzID0gMiwgLmNvbXBfcGxhbmVzID0gMiwgLmJwcCA9
IHsgNSwNCj4gPiAxMCwgMCwgMCB9LCAuYnBwX2RpdiA9IHsgNCwgNCwgMSwgMSB9LCAuaGRpdiA9
IDIsIC52ZGl2ID0gMiwNCj4gPiAgIAkJICAuYmxvY2tfdyA9IHsgMTYsIDgsIDAsIDAgfSwgLmJs
b2NrX2ggPSB7IDMyLCAxNiwgMCwgMA0KPiA+IH19LA0KPiA+ICsJCXsgLmZvcm1hdCA9IFY0TDJf
UElYX0ZNVF9NUzIxLCBwaXhlbF9lbmMgPQ0KPiA+IFY0TDJfUElYRUxfRU5DX1lVViwgLm1lbV9w
bGFuZXMgPSAxLCAuY29tcF9wbGFuZXMgPSAyLCAuYnBwID0geyAxLA0KPiA+IDIsIDAsIDAgfSwg
LmJwcF9kaXYgPSB7IDEsIDEsIDEsIDEgfSwgLmhkaXYgPSAyLCAudmRpdiA9IDIsDQo+ID4gKwkJ
ICAuYmxvY2tfdyA9IHsgMTYsIDgsIDAsIDAgfSwgLmJsb2NrX2ggPSB7IDMyLCAxNiwgMCwgMA0K
PiA+IH19LA0KPiA+ICAgDQo+ID4gICAJCS8qIFlVViBwbGFuYXIgZm9ybWF0cyAqLw0KPiA+ICAg
CQl7IC5mb3JtYXQgPSBWNEwyX1BJWF9GTVRfTlYxMiwgICAgLnBpeGVsX2VuYyA9DQo+ID4gVjRM
Ml9QSVhFTF9FTkNfWVVWLCAubWVtX3BsYW5lcyA9IDEsIC5jb21wX3BsYW5lcyA9IDIsIC5icHAg
PSB7IDEsDQo+ID4gMiwgMCwgMCB9LCAuYnBwX2RpdiA9IHsgMSwgMSwgMSwgMSB9LCAuaGRpdiA9
IDIsIC52ZGl2ID0gMiB9LA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Y0bDItY29y
ZS92NGwyLWlvY3RsLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwu
Yw0KPiA+IGluZGV4IDRjNzZkMTdiNDYyOS4uM2E2OGYyYjllN2E0IDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYw0KPiA+IEBAIC0xNTI5LDYgKzE1MjksNyBAQCBz
dGF0aWMgdm9pZCB2NGxfZmlsbF9mbXRkZXNjKHN0cnVjdA0KPiA+IHY0bDJfZm10ZGVzYyAqZm10
KQ0KPiA+ICAgCQljYXNlIFY0TDJfUElYX0ZNVF9NVDIxMTBUOglkZXNjciA9ICJNZWRpYXRlayAx
MGJpdA0KPiA+IFRpbGUgTW9kZSI7IGJyZWFrOw0KPiA+ICAgCQljYXNlIFY0TDJfUElYX0ZNVF9N
VDIxMTBSOglkZXNjciA9ICJNZWRpYXRlayAxMGJpdA0KPiA+IFJhc3RlciBNb2RlIjsgYnJlYWs7
DQo+ID4gICAJCWNhc2UgVjRMMl9QSVhfRk1UX0hFWFRJTEU6CWRlc2NyID0gIkhleHRpbGUgQ29t
cHJlc3NlZA0KPiA+IEZvcm1hdCI7IGJyZWFrOw0KPiA+ICsJCWNhc2UgVjRMMl9QSVhfRk1UX01T
MjE6CQlkZXNjciA9ICJNZWRpYVRlaw0KPiA+IE9uZSBQbGFuZSBGb3JtYXQiOyBicmVhazsNCj4g
DQo+IHMvT25lL1NpbmdsZSA/DQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gQW5kcnplag0KPiANCj4g
PiAgIAkJZGVmYXVsdDoNCj4gPiAgIAkJCWlmIChmbXQtPmRlc2NyaXB0aW9uWzBdKQ0KPiA+ICAg
CQkJCXJldHVybjsNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2
Mi5oDQo+ID4gYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgNCj4gPiBpbmRleCA4OWVi
MWEzYzY1NTUuLjdhZmYyZjJjOGY5YyAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGlu
dXgvdmlkZW9kZXYyLmgNCj4gPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgN
Cj4gPiBAQCAtODAwLDYgKzgwMCw3IEBAIHN0cnVjdCB2NGwyX3BpeF9mb3JtYXQgew0KPiA+ICAg
I2RlZmluZSBWNEwyX1BJWF9GTVRfTU0yMSAgICAgdjRsMl9mb3VyY2MoJ00nLCAnTScsICcyJywg
JzEnKSAvKg0KPiA+IE1lZGlhdGVrIDgtYml0IGJsb2NrIG1vZGUsIHR3byBub24tY29udGlndW91
cyBwbGFuZXMgKi8NCj4gPiAgICNkZWZpbmUgVjRMMl9QSVhfRk1UX01UMjExMFQgIHY0bDJfZm91
cmNjKCdNJywgJ1QnLCAnMicsICdUJykgLyoNCj4gPiBNZWRpYXRlayAxMC1iaXQgYmxvY2sgdGls
ZSBtb2RlICovDQo+ID4gICAjZGVmaW5lIFY0TDJfUElYX0ZNVF9NVDIxMTBSICB2NGwyX2ZvdXJj
YygnTScsICdUJywgJzInLCAnUicpIC8qDQo+ID4gTWVkaWF0ZWsgMTAtYml0IGJsb2NrIHJhc3Rl
ciBtb2RlICovDQo+ID4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01TMjEgICAgIHY0bDJfZm91cmNj
KCdNJywgJ1MnLCAnMicsICcxJykgLyoNCj4gPiBNZWRpYVRlayA4LWJpdCBibG9jayBtb2RlIHdp
dGggb25lIHBsYW5lICovDQo+ID4gICAjZGVmaW5lIFY0TDJfUElYX0ZNVF9JTlpJICAgICB2NGwy
X2ZvdXJjYygnSScsICdOJywgJ1onLCAnSScpIC8qDQo+ID4gSW50ZWwgUGxhbmFyIEdyZXlzY2Fs
ZSAxMC1iaXQgYW5kIERlcHRoIDE2LWJpdCAqLw0KPiA+ICAgI2RlZmluZSBWNEwyX1BJWF9GTVRf
Q05GNCAgICAgdjRsMl9mb3VyY2MoJ0MnLCAnTicsICdGJywgJzQnKSAvKg0KPiA+IEludGVsIDQt
Yml0IHBhY2tlZCBkZXB0aCBjb25maWRlbmNlIGluZm9ybWF0aW9uICovDQo+ID4gICAjZGVmaW5l
IFY0TDJfUElYX0ZNVF9ISTI0MCAgICB2NGwyX2ZvdXJjYygnSCcsICdJJywgJzInLCAnNCcpIC8q
DQo+ID4gQlRUViA4LWJpdCBkaXRoZXJlZCBSR0IgKi8NCj4gDQo+IA0K

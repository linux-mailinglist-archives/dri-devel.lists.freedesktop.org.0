Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAo0Op5igWn6FwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 03:51:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48106D3E10
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 03:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BD610E4D8;
	Tue,  3 Feb 2026 02:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="PyZ9rY55";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="VwNDo2WP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B4110E4EA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 02:51:03 +0000 (UTC)
X-UUID: 2a73bd7e00ab11f185319dbc3099e8fb-20260203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=GspwwAQAfA3sI9wi+DzKecjE4IjhWMVdABLxyKeXkzk=; 
 b=PyZ9rY55M0kd3KwPATtFgLrBQ8ZABDV//PWMKAOgh2sua2s1kHWTgppKxVGHHJ+p78A/uQkLPz6M0V41QUyoQ4J+7b6i7IPo0lNxkDSUFQWgBDwldGgmp82avCYS8MShJ6sagDYSInvqGl+l1tI1gjP2pYKnZu2VVyTQgg+5zKo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:41fac746-69ee-4b39-844a-74aab7ec7fc7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:8643847a-8c8a-4fc4-88c0-3556e7711556,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2a73bd7e00ab11f185319dbc3099e8fb-20260203
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1104163396; Tue, 03 Feb 2026 10:50:57 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Feb 2026 10:50:55 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Feb 2026 10:50:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ghjgk8+8zugiA7uPCjoLSlezGvtoZjCJ1Zip01uCRzAEGTUVItM+EsXfMPNyQ/PGxq31HvO98VIe8XGpgvRS7WtZQDFMFANZzGdl3iWrNivxfiF99A3tp8FXwNdwOAK8wMUF2EyHI9Qz1cyMP+cniLUkLRJaT/znnfQPjM56wFtiTgs+EMNdt5IlaW0ksK5wmjA161zzhYrj3YGGnjCgRCq/gLq1oxtbuYlskW+hWFOCFPoLRV+JGJh0xZXmrycOro4/nwihE7bMg0ve1Zp/Hw2Fb3Y8rKTJca9TecfF/P45dgfPZAG5z9BsYABKSM3GpfCsZRWN7doAM9lNXLTFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jc+T4yJsDGRYZBaOKeyOGm2mafUjA9zRr1NyFw4WMvo=;
 b=dgPRYmWnnNqcSKv4OREbdpSBviL5v3cgzzS8sj3/nurvZveByDOxlci78mxelfJ67cQft6pYo99h41nnp+N36rWGyy9DcC+Ebp6nI8NWfr7q7h4lWOfG2/qGEqNuP6shMNxWnzMHvUJgEXGP8m/QoHvVsMDy6wxgR2/OTbQUSPDEaLbaf/bbgtCCNvaM37XJ9UTVRWQ10gC+duE1tEQVqccVCtqUn/CfDl/eCVM2z7XHDRgybQFFhvTmjHY1jU1KEDwRLbejKdMluUDeX/yndDyX2hW+rKTsPaX0Xim7S/Z2HSCBvJk6+hSTuflixWNGzpXr9OBw9jQ+y8WfVtyVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jc+T4yJsDGRYZBaOKeyOGm2mafUjA9zRr1NyFw4WMvo=;
 b=VwNDo2WPWqgNHNYF6izf4ZOnvVnz5eY3w/Gi7/bLlJDF4exMTPU58JNNkxMBGmhLkbnK4yRUhjzznK0keow5fxRY0RsjFFxjeAioxv+kWzrfY8EBtH98bf+pRxvVYV5nM9ARCFedcYCUjo34eWcEf+R9YAMC3oBSlYE4jPrx75s=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PS1PPF62C8446CC.apcprd03.prod.outlook.com (2603:1096:308::2d9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 02:50:50 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 02:50:50 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "greenjustin@chromium.org" <greenjustin@chromium.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, Nicolas Prado <nfraprado@collabora.com>
CC: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Daniel Stone <daniels@collabora.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH RFC 6/6] drm/mediatek: Re-enable AFBC support on MediaTek
 DRM driver
Thread-Topic: [PATCH RFC 6/6] drm/mediatek: Re-enable AFBC support on MediaTek
 DRM driver
Thread-Index: AQHceZVDPJmwIcfuBka1vu3c4U9K2LVwfKOA
Date: Tue, 3 Feb 2026 02:50:50 +0000
Message-ID: <16f5f6c7abb387a611f358cecd12cea3057d8a84.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
 <20251230-mtk-afbc-fixes-v1-6-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-6-6c0247b66e32@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PS1PPF62C8446CC:EE_
x-ms-office365-filtering-correlation-id: 620e234d-b34e-4972-2f82-08de62cf0a3d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bmRIVDhPdXRBSWZzWjhjOUJ4Wi9TR1VLWlJDNkliSlErbTBZY1FJYzRqT3Fm?=
 =?utf-8?B?VVRNZDVENitrQTNuK1NydFFGQ3VnYlA0bmVVRHdYUkNyUGw0bSs4TU1UUnE0?=
 =?utf-8?B?NFliSVJUb0JnczYvUjdsT0dvMmhxR2ZiRnM0WjlnZkRwQmJ2Y1FSOTlLWVJJ?=
 =?utf-8?B?eVVSWEZhcEZXbnVqZU5mWXIvRVdCZWY5QlJKZmhDYlhrbEJKVFZhdDV0Vktz?=
 =?utf-8?B?czRSRDY4eVpockZPbG1CdVd2bWhJUmd6eU15WDc1ZnVhVEozM20rbUxhTnRO?=
 =?utf-8?B?Mk92ZGFSMm4yay9INGlseDlkaDdFVEgxaFZpZldPSzk5eHRuaW5lVHhnQjg2?=
 =?utf-8?B?b2V1S3RhOUViNE41K3NXb05BeGF4a3ZraXhMMzR3TUVQSENIM2VTZGg2YlV0?=
 =?utf-8?B?Z2RodFlucmJuTEFiVzQ4Vk1zWWNWNFhQV0MrakpHT2ZQb2pPRGlEeHBhVW9t?=
 =?utf-8?B?Y1hkZldpbmlHNWcwekxXVEh1YnpZNWVHQnVjZTBHeVBQbFhsb0dpSkhJU01r?=
 =?utf-8?B?SFVrbTdkeXppdGFVbHB5WXFEVjR6K1h3M08wRVpVN1JaSzNRNUxHUEFoRnps?=
 =?utf-8?B?Y2R2QkRqbTNJYnY2bmlPMnVLOTBvWVhCMzEyeCt6bWloUGh5OWloUUNDcTRO?=
 =?utf-8?B?d3d5cmM1djBSMWNYS3ZpUzArMVgrbGlPTmZiUEFHR3E4eUI5Y3hMUG0zMG1C?=
 =?utf-8?B?bExYMHRpa3Z5SEVSUHE5TW1MYVovcFFRRnZoUnlXOEdTaGZjcXVTc0oxTEh0?=
 =?utf-8?B?R01YanFPaU9MS0RtNnFoUDB3cTB2dTBtVGg3MkFSRzdMYmVlY0VPdXlsR0VQ?=
 =?utf-8?B?dXI3eXFHbkJWUnlNQlg4VnlhMUFObEo4OWFVVmNCUXE3WFJXSVNBVXdRS2Fh?=
 =?utf-8?B?bDlVeGRXM0UrQjAwK05RVG9wS3NxVytjTHVYK1BzTjBrWnZWdEFqalY5OFc0?=
 =?utf-8?B?L3VmUVVJaUxSUk82Y1A1VTVOUVR3MnY1eHZtYU5OWTBCRGpmZWtYWW1uNTdp?=
 =?utf-8?B?bys1a3VlTXlVM25mVStnL1J5N0RsMjJZYkR2K0lhVWptRTdPYWdTVjBzYmQz?=
 =?utf-8?B?b25FY3RXM09HRmc4U0RZQldKYk43RHQ3REhXcmY2NzVWNi82TjlvamJqb2lT?=
 =?utf-8?B?NkFFaU9Obmhtd012Y1NlZmMwQldVRU83V2pIQWhWalIzWnpBTEI1Q2c3alg5?=
 =?utf-8?B?azFmOFh4SVFFakh2QWpPblB4YSs3d3VNeW5hUmpHNmJ2clMzNVRtUTJnZ1Nu?=
 =?utf-8?B?Q284aUEwR21zeEdCYXhKaXlMeUhURlRpTGQyaFNzS2JLZ1pmS2VZUUcvU2x5?=
 =?utf-8?B?MTFlVWxMRnNRaTF3eVc2Rmg2a1I5MFZnZXhzeHk3STlVYVJhSm1ScVcrandC?=
 =?utf-8?B?WHRYaG1xenI5U0dobUI2Q1RUaHRyRkQrUjNSQ3hUUlVvNElmMVhJWEMwdDdF?=
 =?utf-8?B?Nmh5OE5tMnE5dmg2QktaWHE4RGdXWTBoSzJwVVNhMEorak9BWklyWkFHWXUr?=
 =?utf-8?B?elErQ3NEeWNPc3REb2w2ZmQ1RG10NDZ4KzNSb1FLZnhCUnVBOWlLTVJ0aWlZ?=
 =?utf-8?B?TEZaNlgrT0ljNmdubnVJeTBrYlRQdkFHWnVLZEc5SDVPZEZGenhQb05ZNUtS?=
 =?utf-8?B?anc2amg1WDFCb1hHaFlUcUxHaU9KbXMvb0kyV1c3NUZlU0doZ2NGWjFRdHMx?=
 =?utf-8?B?V0ZqMndGZDFSQUkwbC84b1lvWjFxd1FXaUh2NHpOQ0hZTExMejc4aUdnK1Fh?=
 =?utf-8?B?ekZpS3I4T2N0cXp0VndtaGo5eVNISjV3TzRBQmJNR0tFZ0syQWhXZWhBUUU4?=
 =?utf-8?B?SHlpVHgxN2tPV1JEaGwwRFl6d2Rzd20rU3M4cHZOMm1xT2tISk9EeHhSN1JE?=
 =?utf-8?B?NmJka2ZFZVJNbCtrZGZFOFRSaklpQ3RxbVY4WStMVlB1YzgreWRiM1F6cFdJ?=
 =?utf-8?B?YXFTZVBEbCtFYllZem5tbVlCcHNyNXJSSzI1QXdnRXNaSEVQN3F6aDhDSGxy?=
 =?utf-8?B?SzRoYmZ5Sjh5WWxIQk1rR29BeFkvTHdOS1JqdjhhNjJOMUNoRlRDVEp6akda?=
 =?utf-8?B?R2x6clRydzZQS05VOTJlR3NaaVFIeEJOYjJ0Wk01SFF0UFJ2dTFXdHV6N0VQ?=
 =?utf-8?B?QzRuUE9WTTh3ZU94dzBxT0g3eDMwUGptMldxeE5iZ0pLY0ZOams2WW1FSHNh?=
 =?utf-8?Q?/hd+BKi2Jb5jEOZL+VcC6Ms=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(7416014)(1800799024)(366016)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFRjN2NQUGtxb1Q4bFNWNDBwa2NBd3VZeXZmQTR5NkdZUHg3ZXBRa2pFelY2?=
 =?utf-8?B?eXVYZldGUTFSRVlDRzZYU3JtZElTbWZQbjBhL2dwVEVPcHpKZFd3SmhUbEI0?=
 =?utf-8?B?VjN3WERJMTVIT2lDL3piemZXMFNlY09QS0ViNnBWY28rODl2UWZON2xld1E2?=
 =?utf-8?B?TXA3RVZubHQwQWY3UHg1VnBqMzROcVowOW45NmNBSm1MNU5HRkcycjcvSlRm?=
 =?utf-8?B?b3NUeE93WFBDSzhWWGl6Rlc2QUs3NU42bS81bzdhajRVejdXcUJuRlJabmdq?=
 =?utf-8?B?N25aNmRRQlA2ZnNjdzVXS0pnQUoxY2JvL3FkMWZPSkNXNTUzTkZYSUNQcmgx?=
 =?utf-8?B?OTZ3NW9MOUVQRXFJdkxQTkUvaFZ1OFllWlgvWU4vZ3UrM28rQlVjY0hKU3NX?=
 =?utf-8?B?RTNBTmtOQjdPQStVRlh0UFRTZStQTDB5WFlaZ1NjUHdkVG5BcmJ5T2g1eGVP?=
 =?utf-8?B?RmhXWGlPNFV3cG1IQVRoWGdOWWRodEViQSsvNDFxMVBXM1ZiSWZkbVkvVlUr?=
 =?utf-8?B?VGQ2Q2RuZDA1SVp2RnFVQzdYblljdG9BbkdxeUgxcUtXNEM5SlluZTlUait4?=
 =?utf-8?B?YVR3RFVudGdlNlNiTVB6b1JRSGdjT28rR3lrbGdWU3IzWS9Fa2tpK2pxMWxD?=
 =?utf-8?B?YjhUZXdLblJhQ2NxblYrVWI2WHhlcnZtTEpVL1h1K2xlTTdEZVhNYmhXaDg1?=
 =?utf-8?B?UnJpNnhPb2RMSzVJSHY5SzFEUTRXbmZQRXZ6YU9SNThEMUxDYWNOWGdzZjBB?=
 =?utf-8?B?VDYyc25jNUYybzlvRGlxYkdSS0IvcVpRemNRMkduYlhMU2prQm5NdGFHdHE5?=
 =?utf-8?B?TnpVU0NMcGl2MnRBZXFpdFZNVVd3RWp0aVo2a3VVOHZZUDQ3eVZRZUdQRXQy?=
 =?utf-8?B?UDJNRUFNeVEzUGlTbVBvdmV2YnEwT3ZIMk1tWE1UZkdiRmJpRkhtSHRFS2c0?=
 =?utf-8?B?MVN5VzAxRFhNYzYyY3ljSDlkN0hlV3lvMTFsNllYNFBjL0UyRUtyVk5Ha2lN?=
 =?utf-8?B?QVdOK1UzTHpLbkdmWHkrenM2cVl2MUdKNU5sRXFIVEh5RE5TY0xqaHJxWURH?=
 =?utf-8?B?MFZOR2U3RFlSQUlCbEhWb251Uml1M2pGM3JtOWlJdWhVRFQzREZNMlp3cFVM?=
 =?utf-8?B?MXROSG05aDFaT3ppRFhKWjd0UlVEM3M3UVFYcnFFa21CWDlZMU5NNi9wRUJ3?=
 =?utf-8?B?N0VsQnRUaVRueGU2dEZHMUw2RGxqMk41aFlaTjIrV1B5aExzK3crd3ZCRmpO?=
 =?utf-8?B?cVJ1bWxVVTZQYVBGL294Ykc1djhwOXR6TUVWeUMzL0g0b0luY2I3dVpUbmhX?=
 =?utf-8?B?OTFGbG5CQVA4alNHYnIwdURVR3l1STZxZ1M5TnBDdTdWSVdDVkcvcG02eFF2?=
 =?utf-8?B?Q21zK1IvZm9yUTByRGRnNHR3eTlHZ25PazlRWXl0MmRvcnNPUFlHQ0Zya3NQ?=
 =?utf-8?B?c01MZWtMN280bjMzMERsTjB0NlNqL3Avb09KeG00OXFnS2d2ZjhVRDNPWjV1?=
 =?utf-8?B?citvNGg1TjlsMUhIVlJoR3FTZWdWY1hsckNmQW12WGZxTis3RS82ekZ1cmNV?=
 =?utf-8?B?bDM1Y01jK1VjNFdnbWxacmovV2FzdzdocmVmRkRLb0dIRy9ya2RITXY1ZWpB?=
 =?utf-8?B?NmpPdnpFRVNVVlFuR0JWWE41UXBsQStWZ0xGekt5UzNOUVJMczdKWjV3eWFj?=
 =?utf-8?B?VFQybTYyOE1KWEg0dmxpcHZtblJrcXpoTmY2RWFZN0N2ckowMXBmVkVTTjl6?=
 =?utf-8?B?MDhNQ2ZkTGRqS1lGSW03eS9pMmdJcHc4R1RJeFFhaWh1SkF2UC9SR1VLU3Z5?=
 =?utf-8?B?TjkwNXV1aWs4ZkhzY1pLaVBsRzdEWWJ4VDdlMTRacVBpb0VIMS9WZnRyL1Zw?=
 =?utf-8?B?VmlweW0reFVXS2xJZm5GVGdvSSt0Mm04UlB0ZStvVDhvT01hUGdOQ2NiRzZZ?=
 =?utf-8?B?SElZM0k0R2lBRkY3M3RTcEFtR29QVGw0YUJ0TVVtd3lxT1htZnNNTkxjWThJ?=
 =?utf-8?B?eHRDVVFuZVhUSzdaMHJSS2lzeWRNODZkS29SNU5MbVpZbkxWbGVLM1pFeUNT?=
 =?utf-8?B?MkNXSzFIdDlhanBvRkViVWxuSDgxeGVMRGtDRjVjeXRtVDNqckM0SnNGZ1A3?=
 =?utf-8?B?NUpTK1dOaEZyL201OS92aVFUYVQ2MXBDQVFpM1dCVVJJcUExTzBXdllBUXNF?=
 =?utf-8?B?VzFiZHZSWWw3RFl5d0FSUzV3RzRlOVp2Yk1DUDRtbVZDNVVCK21iRlVQMDhs?=
 =?utf-8?B?UGpPL3BjM2VWVGVsZ2N3STYrZ1VjWkg2dmNuT0o3UzhmVGtzNXlVKzZYVnQ5?=
 =?utf-8?B?Tm91Z01SUXpZQWQxSDhHR0oweTlmcWl2Qjlzb2MwZ2g0aTBKN3dGQT09?=
Content-ID: <0932354E5673C841B3CFCB3F6F464627@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620e234d-b34e-4972-2f82-08de62cf0a3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 02:50:50.2676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dpvwFy6y7pugyDc4CM/IBv/3vAKB/c0rf0sR27273VYKqtqm4qc+q7JpYh8o5EiT/878JeVXXgoyYb9aXBzf9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF62C8446CC
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_133853081.803664214"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chunkuang.hu@kernel.org,m:simona@ffwll.ch,m:angelogioacchino.delregno@collabora.com,m:airlied@gmail.com,m:greenjustin@chromium.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:nfraprado@collabora.com,m:ariel.dalessandro@collabora.com,m:Nancy.Lin@mediatek.com,m:linux-kernel@vger.kernel.org,m:Jason-JH.Lin@mediatek.com,m:linux-arm-kernel@lists.infradead.org,m:daniels@collabora.com,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,mediatek.com:dkim,mediatek.com:mid];
	FORGED_SENDER(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,ffwll.ch,collabora.com,gmail.com,chromium.org,pengutronix.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_REJECT(0.00)[mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	DMARC_POLICY_ALLOW(0.00)[mediatek.com,quarantine];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48106D3E10
X-Rspamd-Action: no action

--__=_Part_Boundary_004_133853081.803664214
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTEyLTMwIGF0IDExOjAzIC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gQ29tbWl0IDk4ODJhNDA2NDAwMyAoImRybS9tZWRpYXRlazogRGlzYWJsZSBB
RkJDIHN1cHBvcnQgb24gTWVkaWF0ZWsgRFJNDQo+IGRyaXZlciIpIGRpc2FibGVkIEFGQkMgc3Vw
cG9ydCBvbiB0aGUgTWVkaWFUZWsgRFJNIGRyaXZlciBzaW5jZSBpdCB3YXMNCj4gYnJva2VuLg0K
PiANCj4gV2l0aCB0aGUgYnVncyBpbiB0aGUgQUZCQyBzdXBwb3J0IG5vdyBmaXhlZCwgcmUtZW5h
YmxlIHRoZSBzdXBwb3J0Lg0KPiANCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRl
ay5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFw
cmFkb0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfcGxhbmUuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX3BsYW5lLmMNCj4gaW5kZXggOGZiMDg3NjhlOGNlLi4zOGRkOTRjZGQ2NjUgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCj4gQEAgLTIyLDYgKzIyLDkg
QEANCj4gIA0KPiAgc3RhdGljIGNvbnN0IHU2NCBtb2RpZmllcnNbXSA9IHsNCj4gIAlEUk1fRk9S
TUFUX01PRF9MSU5FQVIsDQo+ICsJRFJNX0ZPUk1BVF9NT0RfQVJNX0FGQkMoQUZCQ19GT1JNQVRf
TU9EX0JMT0NLX1NJWkVfMzJ4OCB8DQo+ICsJCQkJQUZCQ19GT1JNQVRfTU9EX1NQTElUIHwNCj4g
KwkJCQlBRkJDX0ZPUk1BVF9NT0RfU1BBUlNFKSwNCj4gIAlEUk1fRk9STUFUX01PRF9JTlZBTElE
LA0KPiAgfTsNCj4gIA0KPiBAQCAtNjksNyArNzIsMjYgQEAgc3RhdGljIGJvb2wgbXRrX3BsYW5l
X2Zvcm1hdF9tb2Rfc3VwcG9ydGVkKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiAgCQkJCQkg
ICB1aW50MzJfdCBmb3JtYXQsDQo+ICAJCQkJCSAgIHVpbnQ2NF90IG1vZGlmaWVyKQ0KPiAgew0K
PiAtCXJldHVybiBtb2RpZmllciA9PSBEUk1fRk9STUFUX01PRF9MSU5FQVI7DQo+ICsJaWYgKG1v
ZGlmaWVyID09IERSTV9GT1JNQVRfTU9EX0xJTkVBUikNCj4gKwkJcmV0dXJuIHRydWU7DQo+ICsN
Cj4gKwlpZiAobW9kaWZpZXIgIT0gRFJNX0ZPUk1BVF9NT0RfQVJNX0FGQkMoDQo+ICsJCQkJQUZC
Q19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfMzJ4OCB8DQo+ICsJCQkJQUZCQ19GT1JNQVRfTU9EX1NQ
TElUIHwNCj4gKwkJCQlBRkJDX0ZPUk1BVF9NT0RfU1BBUlNFKSkNCj4gKwkJcmV0dXJuIGZhbHNl
Ow0KPiArDQo+ICsJaWYgKGZvcm1hdCAhPSBEUk1fRk9STUFUX1hSR0I4ODg4ICYmDQo+ICsJICAg
IGZvcm1hdCAhPSBEUk1fRk9STUFUX0FSR0I4ODg4ICYmDQo+ICsJICAgIGZvcm1hdCAhPSBEUk1f
Rk9STUFUX0JHUlg4ODg4ICYmDQo+ICsJICAgIGZvcm1hdCAhPSBEUk1fRk9STUFUX0JHUkE4ODg4
ICYmDQo+ICsJICAgIGZvcm1hdCAhPSBEUk1fRk9STUFUX0FCR1I4ODg4ICYmDQo+ICsJICAgIGZv
cm1hdCAhPSBEUk1fRk9STUFUX1hCR1I4ODg4ICYmDQo+ICsJICAgIGZvcm1hdCAhPSBEUk1fRk9S
TUFUX1JHQjg4OCAmJg0KPiArCSAgICBmb3JtYXQgIT0gRFJNX0ZPUk1BVF9CR1I4ODgpDQo+ICsJ
CXJldHVybiBmYWxzZTsNCj4gKw0KPiArCXJldHVybiB0cnVlOw0KPiAgfQ0KPiAgDQo+ICBzdGF0
aWMgdm9pZCBtdGtfcGxhbmVfZGVzdHJveV9zdGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwN
Cj4gDQoNCg==

--__=_Part_Boundary_004_133853081.803664214
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMTItMzAmIzMyO2F0
JiMzMjsxMTowMyYjMzI7LTAzMDAsJiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7
QS4mIzMyO1ByYWRvJiMzMjt3cm90ZToNCiZndDsmIzMyO0NvbW1pdCYjMzI7OTg4MmE0MDY0MDAz
JiMzMjsoJnF1b3Q7ZHJtL21lZGlhdGVrOiYjMzI7RGlzYWJsZSYjMzI7QUZCQyYjMzI7c3VwcG9y
dCYjMzI7b24mIzMyO01lZGlhdGVrJiMzMjtEUk0NCiZndDsmIzMyO2RyaXZlciZxdW90OykmIzMy
O2Rpc2FibGVkJiMzMjtBRkJDJiMzMjtzdXBwb3J0JiMzMjtvbiYjMzI7dGhlJiMzMjtNZWRpYVRl
ayYjMzI7RFJNJiMzMjtkcml2ZXImIzMyO3NpbmNlJiMzMjtpdCYjMzI7d2FzDQomZ3Q7JiMzMjti
cm9rZW4uDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1dpdGgmIzMyO3RoZSYjMzI7YnVncyYjMzI7aW4m
IzMyO3RoZSYjMzI7QUZCQyYjMzI7c3VwcG9ydCYjMzI7bm93JiMzMjtmaXhlZCwmIzMyO3JlLWVu
YWJsZSYjMzI7dGhlJiMzMjtzdXBwb3J0Lg0KJmd0OyYjMzI7DQoNClJldmlld2VkLWJ5OiYjMzI7
Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjtTaWdu
ZWQtb2ZmLWJ5OiYjMzI7TiYjMjM3O2NvbGFzJiMzMjtGLiYjMzI7Ui4mIzMyO0EuJiMzMjtQcmFk
byYjMzI7Jmx0O25mcmFwcmFkb0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7
JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYyYjMzI7fCYjMzI7
MjQmIzMyOysrKysrKysrKysrKysrKysrKysrKysrLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxl
JiMzMjtjaGFuZ2VkLCYjMzI7MjMmIzMyO2luc2VydGlvbnMoKyksJiMzMjsxJiMzMjtkZWxldGlv
bigtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19wbGFuZS5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7OGZiMDg3NjhlOGNlLi4zOGRkOTRjZGQ2
NjUmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfcGxhbmUuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfcGxhbmUuYw0KJmd0OyYjMzI7QEAmIzMyOy0yMiw2JiMzMjsrMjIsOSYjMzI7QEANCiZn
dDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMyO3U2NCYjMzI7
bW9kaWZpZXJzW10mIzMyOz0mIzMyO3sNCiZndDsmIzMyOyYjMzI7RFJNX0ZPUk1BVF9NT0RfTElO
RUFSLA0KJmd0OyYjMzI7K0RSTV9GT1JNQVRfTU9EX0FSTV9BRkJDKEFGQkNfRk9STUFUX01PRF9C
TE9DS19TSVpFXzMyeDgmIzMyO3wNCiZndDsmIzMyOytBRkJDX0ZPUk1BVF9NT0RfU1BMSVQmIzMy
O3wNCiZndDsmIzMyOytBRkJDX0ZPUk1BVF9NT0RfU1BBUlNFKSwNCiZndDsmIzMyOyYjMzI7RFJN
X0ZPUk1BVF9NT0RfSU5WQUxJRCwNCiZndDsmIzMyOyYjMzI7fTsNCiZndDsmIzMyOyYjMzI7DQom
Z3Q7JiMzMjtAQCYjMzI7LTY5LDcmIzMyOys3MiwyNiYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7Ym9v
bCYjMzI7bXRrX3BsYW5lX2Zvcm1hdF9tb2Rfc3VwcG9ydGVkKHN0cnVjdCYjMzI7ZHJtX3BsYW5l
JiMzMjsqcGxhbmUsDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3VpbnQzMl90JiMzMjtm
b3JtYXQsDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3VpbnQ2NF90JiMzMjttb2RpZmll
cikNCiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7LXJldHVybiYjMzI7bW9kaWZpZXImIzMyOz09
JiMzMjtEUk1fRk9STUFUX01PRF9MSU5FQVI7DQomZ3Q7JiMzMjsraWYmIzMyOyhtb2RpZmllciYj
MzI7PT0mIzMyO0RSTV9GT1JNQVRfTU9EX0xJTkVBUikNCiZndDsmIzMyOytyZXR1cm4mIzMyO3Ry
dWU7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsraWYmIzMyOyhtb2RpZmllciYjMzI7IT0mIzMyO0RS
TV9GT1JNQVRfTU9EX0FSTV9BRkJDKA0KJmd0OyYjMzI7K0FGQkNfRk9STUFUX01PRF9CTE9DS19T
SVpFXzMyeDgmIzMyO3wNCiZndDsmIzMyOytBRkJDX0ZPUk1BVF9NT0RfU1BMSVQmIzMyO3wNCiZn
dDsmIzMyOytBRkJDX0ZPUk1BVF9NT0RfU1BBUlNFKSkNCiZndDsmIzMyOytyZXR1cm4mIzMyO2Zh
bHNlOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2lmJiMzMjsoZm9ybWF0JiMzMjshPSYjMzI7RFJN
X0ZPUk1BVF9YUkdCODg4OCYjMzI7JmFtcDsmYW1wOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMy
OyYjMzI7Zm9ybWF0JiMzMjshPSYjMzI7RFJNX0ZPUk1BVF9BUkdCODg4OCYjMzI7JmFtcDsmYW1w
Ow0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7Zm9ybWF0JiMzMjshPSYjMzI7RFJNX0ZP
Uk1BVF9CR1JYODg4OCYjMzI7JmFtcDsmYW1wOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYj
MzI7Zm9ybWF0JiMzMjshPSYjMzI7RFJNX0ZPUk1BVF9CR1JBODg4OCYjMzI7JmFtcDsmYW1wOw0K
Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7Zm9ybWF0JiMzMjshPSYjMzI7RFJNX0ZPUk1B
VF9BQkdSODg4OCYjMzI7JmFtcDsmYW1wOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7
Zm9ybWF0JiMzMjshPSYjMzI7RFJNX0ZPUk1BVF9YQkdSODg4OCYjMzI7JmFtcDsmYW1wOw0KJmd0
OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7Zm9ybWF0JiMzMjshPSYjMzI7RFJNX0ZPUk1BVF9S
R0I4ODgmIzMyOyZhbXA7JmFtcDsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO2Zvcm1h
dCYjMzI7IT0mIzMyO0RSTV9GT1JNQVRfQkdSODg4KQ0KJmd0OyYjMzI7K3JldHVybiYjMzI7ZmFs
c2U7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjt0cnVlOw0KJmd0OyYjMzI7JiMz
Mjt9DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210
a19wbGFuZV9kZXN0cm95X3N0YXRlKHN0cnVjdCYjMzI7ZHJtX3BsYW5lJiMzMjsqcGxhbmUsDQom
Z3Q7JiMzMjsNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48
IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNl
ICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMg
ZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZp
ZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZy
b20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJl
IA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2Us
IGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNv
cHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5p
bnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUg
dW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUt
bWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4g
ZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWlu
ZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRv
IG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBl
cnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_004_133853081.803664214--


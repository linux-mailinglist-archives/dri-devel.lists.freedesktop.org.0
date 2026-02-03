Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CGEMfxWgWkFFwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 03:01:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB95D3961
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 03:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EEC10E4AE;
	Tue,  3 Feb 2026 02:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="E+grCm7s";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="aJ88Aiez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA4410E2F7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 02:01:27 +0000 (UTC)
X-UUID: 3bb8451600a411f185319dbc3099e8fb-20260203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=C9Ary25ZGWQ49gkd9ePR2EwNFmGsPtGDwdvyck1NERQ=; 
 b=E+grCm7skCX5geB7qtoX1k2Vxt1h90CRMCcsvaVBGW9MQR4maxeA0wT7VZ31Dx6n+Be9laYZfFQ+nfa5mholoeNLzRy41+3OD5O2DTnVxciTqSzjvtJjjeb6wZOIaoJKj7T3wV/ETs1kqt1ZAAWIjLBf9dOFu7u+TiT3HYw3XUE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:04df1a21-4154-4d20-a86f-84b642d2fff9, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:99a5da5a-a957-4259-bcca-d3af718d7034,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3bb8451600a411f185319dbc3099e8fb-20260203
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2070913576; Tue, 03 Feb 2026 10:01:20 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Feb 2026 10:01:18 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Feb 2026 10:01:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytJ0HCJ6ygltFZzKa4/tQTePXqDM1u64byHr7yo+LBHBdrVG3RulFjodYFFIhizOaAOYJUIOopQiGdIKJZ8sxTajVfJIa9IDweCJv/1+QG97nHcwRr8YiHT8SeNiOGPul3gVDqephobc/Wd+u0f0bBXk1rgQpkBCz2fqkEpQmHiCN9qJWVZtihjStUl79Rr0we9Uou3UGucSVDQeapGudNdXcv9Q290Z77xB/RYqlz9DbXsHl5riG3ocYG8FWrQKziqSLnHaMwOIzOBPL4ymY4QLjW4kvnWrFe2sTpo2usuPywerwIocJ2Y9fIIwcxiUcjsccySsz8jkP8S94fqmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYzd/KmRlWD9z8mdn89DRhcA3F76D0iSm0pZ6e3QmvE=;
 b=uyHpXZd5PMHwjdEoQTp7kUvDxB52OyO/wG/9vMknu8eAgR5xN6oynSxAu4zjGtIS+L/0JdCTgQajOsIycJAxv8nFxNvWCs9PNJGV7R7Ejclv7JxqxcRwT0OhJ/x+zzqwTrg5BF1mcAJ+MjfpltHhs0F+4UawSRHuRWeBAUPsNGgarTE9QvTnVpYW9Qb3rstkl/kscN6WVRjyetGGowh0uhAtUX8AvRb/C2/0KEQsSFl6V4VakuXtdYXlDAHFah54H1iu2BNyGJRmURvPtk6Jl/GZhHvPsjEf1zhRk4Y39gE/bYweRUPUT03ZWk8XMc+kt2x94caFwxa+F9yiN/PvcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYzd/KmRlWD9z8mdn89DRhcA3F76D0iSm0pZ6e3QmvE=;
 b=aJ88AiezeXRrhFi3crNjog4SJtw1eZDtcy+9XxdMElA4VJr/5ngYehHa2M4iMbVlWgL6nJMmWwoGLYKL1/rj2HJuSRJ6kv/autouA3caZ0RfbGGK51PqWr4lROZbzC5YK1vDtUyilzcx8UWp60oIHTAyVdEYvnHMX36e5n7nKxM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYPPR03MB9676.apcprd03.prod.outlook.com (2603:1096:405:396::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 02:01:15 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 02:01:15 +0000
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
Subject: Re: [PATCH RFC 3/6] drm/mediatek: ovl: Fix misaligned layer source
 size on AFBC mode
Thread-Topic: [PATCH RFC 3/6] drm/mediatek: ovl: Fix misaligned layer source
 size on AFBC mode
Thread-Index: AQHceZU/SlrIiCW2Fky/SXbbIg72WbVwbskA
Date: Tue, 3 Feb 2026 02:01:15 +0000
Message-ID: <3716cf4707924e97c097cfefa11c7feb09a1ee16.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
 <20251230-mtk-afbc-fixes-v1-3-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-3-6c0247b66e32@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYPPR03MB9676:EE_
x-ms-office365-filtering-correlation-id: bfbfeaa9-0b81-4fec-cfaf-08de62c81d16
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|42112799006|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?QmF1RUFZcDJiN3lSVzZlZnJWUGV0TGxPVW9WcWNqMSthblVtaFVYbG5QcUR2?=
 =?utf-8?B?MTlvWEpXN2llcFpVcExHMTBJYmlWUWN2a2R5VWJTelVpbnJVN29MSEFNVCtW?=
 =?utf-8?B?UUpBNnI2Mmp2RkhhcjdwM25wTDhZbHYwYmRWNjRnYkVRdGVOaGhQdHBPWEl2?=
 =?utf-8?B?eFNsVWtVd3A5Z2Q0Q21vdkh5NjlOZ3RkbTIzK1FXT042RHZnWWJhM1Zrb0hR?=
 =?utf-8?B?TzJkcGZNYWY5VVN4eGxsY2NiUUs4ZXVXcWNETytuUE5OUEY5alRXaTBwY2Ex?=
 =?utf-8?B?TXdXOHYwVm5uMHhTbkl5Mll0cDRpRUowYmlBWGJDUC9xUzlORitCNlRxWDlZ?=
 =?utf-8?B?dXRvUDk2YkpWeEoyYzFoeGcyTm9WUk9SQlFpM0F1YUZ3Zm5yWWcrS2pYYlNx?=
 =?utf-8?B?eWx3end5NVd3Mkc0OVZKVU9rVWdpb1FuZlpOM1BoQnFtQlNxYWpNeHFoWW81?=
 =?utf-8?B?YTBzWDJOTGJxUDlRWFY1OGZlRVI3NGhUVmtLa2JvVUtTVllIQzBORjh0Q255?=
 =?utf-8?B?QXJXdUZmZTlxTUJlMmVHUC9aeTVRcUd4NUhkNTNITkNSdFBFVWxSTE1qbU4v?=
 =?utf-8?B?YXBUTVF3SC9UaHpFVTRYTEpBaUgvVGhYNzBJNDdRZEtvOU80eGpIYWFoWCty?=
 =?utf-8?B?Ulk2S0ZtRHhLR0s3OWRBYzdUYVVsTE8zWndtOW9BWWxTN2sraXBFUDF4YWtk?=
 =?utf-8?B?Yjhmb29ydkl6QUlyMTNqWFMzejFnem5JQzhMWFBxbUhmNitITmNlRUxCL1hw?=
 =?utf-8?B?ejR6NzB3YzRMNXZ4SHVTclAzcmZQUFl6UzZ2TldGaDRLK1FyYXAxUW5pNGJu?=
 =?utf-8?B?aE0zZzV5UTBDQmJVOWJhMGtLSXpnTHNXY3E4QzRxelpxZnhqRTJ1ckpYZGNC?=
 =?utf-8?B?cGZ6KzVKZ2dmOWNFZnlwbmNTTThSSDZhT3gwb01YV1M3UFdtQkxnREFxMTZq?=
 =?utf-8?B?VHFQWTAyT3Rkc2hRK1BLOEt5WUlUMks4SnJKWndQbjJyRjV4aGJPeGw3SmhC?=
 =?utf-8?B?eHFUT25QMy9qODh1Ty9JcG83akg3L2dhbXdONFhPYW9FV3cwMXJ5R0l1TmtI?=
 =?utf-8?B?Zi9iSnE3MFVYUDRYanBUS3l2YUR0cGpVbzB6NllLUWdsMXZuVjI4Rk1IM0hy?=
 =?utf-8?B?b1NCNlN3QUNhTzFZdy9nOXU4MXZpTHllK3hya1d6bmtETDFOUnVOMGZINVln?=
 =?utf-8?B?MDFjbEw1QlV5endybEdIZUJkeWxkSDltUGpmekRNRmlLTkw2ZXZadHI2c2cr?=
 =?utf-8?B?czZ4cllaejIzL1I1azJaMHJZK2xaSm1mV2p3N2p3WHhlTnBreGF2MC9NSjBx?=
 =?utf-8?B?dWZkK1ROWFc0ellpTEhSN21TSmVSMjA4Nm9oT3JtN1RRVWlja3pEYzdlbTNF?=
 =?utf-8?B?SGR4MkI0czZac1V0aE16MGxvQ0Vob0hveVIzbFFFRlFwUWV2V2U5YzFTY3VM?=
 =?utf-8?B?ZTZON2x6dWRUb0I1eW1KRTM1SUtLbkRGRVQwSyt2bmVQUFlMZFNZZ0FIb2xG?=
 =?utf-8?B?OXo5YlFjSndjTlFpVXhlT1hhd0EvOEJ4d0UvaGNmWGd2aitmbTAwMzBlQUd5?=
 =?utf-8?B?bkgwK1dDamxRM2lPREI5NEY0aFl0UVp1UjB0TndNRlR1MFNoQjVrdG45b00z?=
 =?utf-8?B?alEyYmNPVUlaR0pzTGFIVENRWmQvOVZPUWdVVVlNMUtBQmFjb0REL2VWN1lD?=
 =?utf-8?B?UkRlczFmVWt6OUIyU2N6dGI2VmdRMExJdlZTMWNvM2NtNVBCeUhUSHJoL2Nl?=
 =?utf-8?B?SURpZitLNHJPdUZSdm9BaXh2UWFJNTkzR3BRUXYyK2YzdEtDWHp0N0dwUUky?=
 =?utf-8?B?NGxoYkwyN1VZM0p1ZUs5ODNCRTd3RFI5ejFZbXU0SlpEUWE4Ry9tbGFXSkZE?=
 =?utf-8?B?am1UekdPVGFFR2djZ1RuMnpSSXdNNGM0eTR2bUMraFhZN3RNNVl4QTVOa3NW?=
 =?utf-8?B?b3l1YlJEYWVuYTc5TGdzd3JwbG9rZUtOcXhRSzJnd2JGelZCLzJDdVBobnpi?=
 =?utf-8?B?ajkzWTN0Tjl5NEdJcTBhMC95Rm4wc01wcXhLWVpyaGdCbUxzdm9KWUpEWUsw?=
 =?utf-8?B?elc3ays0MkJ3MUE2TEJiTisyY1pWdGVzNHhTMFFZcmQ3TjlvMnIyWlQ5OUtL?=
 =?utf-8?B?OTlORFZEZ2xacHRuKzg2YUZCY1RiYjlZblRGWUJuTE9RblRaSDhyeUhKZ01q?=
 =?utf-8?Q?GDpi3SL7k6saTzEJyTMHuPU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(42112799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEt2dlQza0NhTUE2a3c5VjV5ZHhHaW41SVN1dHkvc0plS2VWemxlUXVvYzJN?=
 =?utf-8?B?WnpxSk9RZThVTmJCQm9LZkRQR3hSaGZndERlL1BBZ2pYTVcyRlcwcXo2SmhN?=
 =?utf-8?B?M3g0cmpsOWNZaWdVNjZXVkMvMWJIL0RQUDZOZHdIQnhOWW9IWTdPL25qdElO?=
 =?utf-8?B?VHlmMDE0TXczUUVQQ3ZDV3dQdDlxQ3ZGVHhqeWZ2dHd1MEY0MFRYSjczMDN1?=
 =?utf-8?B?SDBONEEyeW1mY1czSDNtNVQvd3ZkdDJDSE1uRVlRM21MVktjYndOVGFhQmxQ?=
 =?utf-8?B?ZEM3QjlqejhxSmdQeDJCbHI3Q20ydUJscXdPMnBjMk0vZmN2YjJNcU9uRWUy?=
 =?utf-8?B?c2JjV0RiVGNTSzA4cXROY0RMZU1SaHJhNHhOdHZHN0tEbEJNQjh0UFFSbTZs?=
 =?utf-8?B?eGVxN0VFTzE2U1VSd2xiaVA4SXNQQ0M4OVcwcDRIV3kyQlVuZXJuOC9MQVRM?=
 =?utf-8?B?NjVNQ3R1b2grcTUwck1waldwaDliTjFsS0htS051ZjJ6ZU1zNTJVQVZRcDNS?=
 =?utf-8?B?a01JejJueHZheWM5NVhFOUtrNTZJaERkejl6aTVrWVRaQko2eDNhYTc1UTFJ?=
 =?utf-8?B?WXV0ZTZvTTJnbjRjekdkQXYrc2FmclJiUnRYc3BwRE1FK3NucmVYVEZvVXBo?=
 =?utf-8?B?T01qT01taDFpdk1LUExZWG5aTWEwODFZYmhxd1pibEd6VGU0RHdUYVpZdFEx?=
 =?utf-8?B?V3lwNkg3NUpvUG1CZ1BKeXE1U2FTNldBbFF3QVNkNEM4eTVPSkR3LzRpa2lG?=
 =?utf-8?B?RG9UdzhHaXQwREtlc09OL1lxcTNJK283U0t0MkJoWE5rcnlubkxjRllYS2JN?=
 =?utf-8?B?U2w1VW9PTUdHMDZocEFGUTZnSjVFS2NsRm5oUDFtVDlWZWpET24wYjBXa2Rp?=
 =?utf-8?B?Ry9sR1JvMVJjYkNRN2JDTlFna1J0UHBpUGdyeG5qQkNHNG1wNEI1ZXNDSW42?=
 =?utf-8?B?aFlWUnpqeFhxMWJaSi9NWEVWaHY0ZW01SVc0U2VxblZiNzJYTEorOUdsTXhI?=
 =?utf-8?B?WHJhRGkrZ2hJTDh4dW9STDNEbHdaUWJBQnA2TzYrSUFLNWUrdHZVb3pnbWNP?=
 =?utf-8?B?SzFRZlFVeHBRZVFtNEZtY0dwcXFyTDZTMGoyS1pIa3FERGxCQ3NHL0tpZXRq?=
 =?utf-8?B?MU5YbFQ3djd4aEdmWU1aTGkwOUV0cTIxSkNkVWJaamdmcWRtMVV2TXVxdFJ3?=
 =?utf-8?B?K1dVY3cvZHZwU3haOXZrSUNDZUNlS3ZtdnJJaklzZ282bVNMeDN0akxic0VM?=
 =?utf-8?B?c0RaeHJSOElsVTJJbk16U094REdWbW1iYi8vKzZoeS9JWHR3aG81N2UyTDVr?=
 =?utf-8?B?a0kvanVKV2h2S1k0cDBCOEtRVVRTRGV2dFc1dkxDWkt2VDljRXY0aFZRaUZV?=
 =?utf-8?B?UER2VzJwZVlTZ0dWUFpiVVd1SWI5cDFDUEt6L0g5c3BWdHN1QzVZTEZCNDg4?=
 =?utf-8?B?c0QyQThJK05RSSs0VVdLeGg1Mk9DKzM3ZWtkVklERVY2WmpYR3RvYjN0UGVL?=
 =?utf-8?B?TjBkakhIdUxaeGJ6eVZKd2NheGhrMEpzOTVraDdXL25SbzJ5NlRGeEk3RU54?=
 =?utf-8?B?VTEzUGhSMXlVRGorS2xIemxWUkJVSXpDcjJtNENSOUtGcEphaXg3dkJxOUtW?=
 =?utf-8?B?RVR2czloMHppTGxEWTQwS0ZaKzZ6QnpmVEpTRTMvTldIMjBVdHkvekZ6SW1T?=
 =?utf-8?B?MEdZdGtlY2VDYlZOSXdQbXVWQU9tUkx5RGlhd29VRURRRXFHRE4wTjdtSXBQ?=
 =?utf-8?B?WDl0U0crSGY2ZlJYN0ZzT2h0TDRIaktlcktoUGJ2dEMvcngwNTFsQXAzeWVX?=
 =?utf-8?B?N2VtUzRSUkh3RTBDeHdWMmd6S0JYRXFURzdlam5SSlQ0enBjSEVUNFIxbi9Z?=
 =?utf-8?B?VWJWdmgrM2JVRVNOenFPbzFIZ1pDSDhTcXpSb2V1QjFLQWZaZGtnNXkzSVZO?=
 =?utf-8?B?eWZ1ZkE5U0xqQlZ1NVVlUFVDMytMaCsxbUNqZWxreEwxZ1JVL2YzK1U4TXdj?=
 =?utf-8?B?OUJvY1l0WGJCOEE2dlk2TVlCejllcXhwQzdmNW5CUDA3NHl5aThYbTFINjJx?=
 =?utf-8?B?Y1E3L3pPMklUUW5wWjJkTmM1amcwNVVGbnd3bEt6dEdWc291ci9rU1BKMFVJ?=
 =?utf-8?B?U0M0ZnczenN4M25qN210Sjh1R2x0UTJvaGF6ZHlqUnF2SW11UmlUK1hUajZw?=
 =?utf-8?B?NTdwY1YvNFNPNEh3U0daamJGME1EdndvYVc0VDFmNncwLzFmeElGdFFkcG15?=
 =?utf-8?B?WUNIbTN1S1hGVE5aMWIzMnIwYU51aFM1NUJxUHl1djFibXpkODkxRVdKcmxx?=
 =?utf-8?B?NW1GQTgwcXVaTzlEYWlnWnVVQVA1MXBaU255bXl2NmpheTFJMDJWQT09?=
Content-ID: <90BFD104EF830C46B77479C3E5E60029@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbfeaa9-0b81-4fec-cfaf-08de62c81d16
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 02:01:15.3681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dVfqK0n8QS9zU7jW8o6A3DwMTqrRapsaupE7iBvR/gj1a0+VouzFktRBm/s3a1Ma6Kq6mbxpoxxyV+eyW3in4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9676
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_959065574.1412445658"
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chunkuang.hu@kernel.org,m:simona@ffwll.ch,m:angelogioacchino.delregno@collabora.com,m:airlied@gmail.com,m:greenjustin@chromium.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:nfraprado@collabora.com,m:ariel.dalessandro@collabora.com,m:Nancy.Lin@mediatek.com,m:linux-kernel@vger.kernel.org,m:Jason-JH.Lin@mediatek.com,m:linux-arm-kernel@lists.infradead.org,m:daniels@collabora.com,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:mid,mediatek.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email];
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
X-Rspamd-Queue-Id: 1FB95D3961
X-Rspamd-Action: no action

--__=_Part_Boundary_007_959065574.1412445658
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTEyLTMwIGF0IDExOjAzIC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gRnJvbTogQXJpZWwgRCdBbGVzc2FuZHJvIDxhcmllbC5kYWxlc3NhbmRyb0Bj
b2xsYWJvcmEuY29tPg0KPiANCj4gSW4gQUZCQyBtb2RlLCBPVkxfU1JDX1NJWkUgbXVzdCBiZSBi
bG9jayBhbGlnbmVkLiBEdWUgdG8gdGhpcyBsaW1pdGF0aW9uDQo+IG9mIHRoZSBBRkJDIGZvcm1h
dCwgT1ZMX0NMSVAgbmVlZHMgdG8gYmUgdXNlZCB0byBhY2hpZXZlIHRoZSBkZXNpcmVkDQo+IG91
dHB1dCBzaXplIG9mIHRoZSBsYXllciB3aGlsZSBzdGlsbCBtZWV0aW5nIHRoZSBhbGlnbm1lbnQg
Y29uc3RyYWludHMuDQo+IEZhaWx1cmUgdG8gZG8gdGhpcyB3aWxsIHJlc3VsdCBpbiB2Ymxhbmsg
dGltZW91dHMgYW5kIG5vIHJlbmRlcmVkIG91dHB1dA0KPiB3aGVuIHRoZSBBRkJDIGRhdGEgc291
cmNlIGlzbid0IGFsaWduZWQgdG8gdGhlIEFGQkMgYmxvY2sgKDMyeDgpLg0KPiANCj4gQ29uZmln
dXJlIE9WTF9DTElQIHNvIHVuYWxpZ25lZCBBRkJDIGxheWVycyBjYW4gYmUgZGlzcGxheWVkLg0K
PiANCj4gVGhlIGZvbGxvd2luZyBpbGx1c3RyYXRlcyBob3cgdGhlIGFsaWdubWVudCBpcyBhY2hp
ZXZlZCB0aHJvdWdoIHRoZSBjbGlwDQo+IHNldHRpbmdzIGZvciB0aGUgaG9yaXpvbnRhbCBjb29y
ZGluYXRlcywgdGhlIHZlcnRpY2FsIGNvb3JkaW5hdGVzIGFyZQ0KPiBhbmFsb2dvdXM6DQo+IA0K
PiAvLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiA+ICAg
ICAgICAgICAgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uICAgICAgICAgICAgfA0KPiA+ICAgICAg
ICAgICAgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uICAgICAgICAgICAgfA0KPiA+ICAgICAgICAg
ICAgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uICAgICAgICAgICAgfA0KPiA+ICAgICAgICAgICAg
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uICAgICAgICAgICAgfA0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiBcLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLw0KPiAgICAgIHwgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICB8ICAgICAgIHwNCj4gICAgICB8ICAgICAgIHNyYy54MSAgICAgICAgICAg
ICAgICAgc3JjLngyICB8DQo+ICAgICAgfCAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgICAgfA0KPiAgICAgIHwgICAgICAgfDwtLS0tLS0tLS0tLS0tLS0tLS0tLT58ICAgICAgIHwN
Cj4gICAgICB8ICAgICAgICAgICAgICBzcmNfd2lkdGggICAgICAgICAgICAgICB8DQo+ICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiAgICAgIE4gKiBBRkJD
X0RBVEFfQkxPQ0tfV0lEVEggICAgICAgICAgICAgIE0gKiBBRkJDX0RBVEFfQkxPQ0tfV0lEVEgN
Cj4gICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+ICAgICAg
fDwtLS0tLT58ICAgICAgICAgICAgICAgICAgICAgIHw8LS0tLS0+fA0KPiAgICAgICBjbGlwX2xl
ZnQgICAgICAgICAgICAgICAgICAgICAgY2xpcF9yaWdodA0KDQpBcyBJIGtub3csIGNyb3AgaXMg
dXNlZCB0byBkcm9wIHBpeGVsIGRhdGEuDQpGcm9tIHRoZSBuYW1lIG9mICdjbGlwX2xlZnQnLCBJ
IHRoaW5rIGl0IHdvdWxkIGRyb3AgdGhlIGxlZnQgcGFydCBvZiB0aGlzIGltYWdlLg0KQnV0IHVz
dWFsbHkgdGhlIGltYWdlIGlzIGFsaWduZWQgdG8gdGhlIGxlZnQgKHN0YXJ0IGZyb20gYXhpcyAw
KSBhbmQgYXBwZW5kIGdhcmJhZ2UgZGF0YSBpbiByaWdodCBwYXJ0Lg0KSWYgc28sIGNsaXBfbGVm
dCBzaG91bGQgYmUgemVybyBhbmQgYWxsIHRoZSBjbGlwIHdvdWxkIGJlIGNsaXBfcmlnaHQuDQpU
aGlzIGlzIHRoZSBub3JtYWwgYmVoYXZpb3IuDQpJZiBPVkxfQ1JPUCBkb2VzIGJlaGF2ZSBhcyB0
aGlzLCBhZGQgY29tbWVudCB0byBkZXNjcmliZSB0aGF0IGNsaXBfbGVmdCBkb2VzIG5vdCBkcm9w
IHBpeGVsIGRhdGEuDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcmll
bCBEJ0FsZXNzYW5kcm8gPGFyaWVsLmRhbGVzc2FuZHJvQGNvbGxhYm9yYS5jb20+DQo+IENvLWRl
dmVsb3BlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRv
QGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiANCg0K

--__=_Part_Boundary_007_959065574.1412445658
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMTItMzAmIzMyO2F0
JiMzMjsxMTowMyYjMzI7LTAzMDAsJiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7
QS4mIzMyO1ByYWRvJiMzMjt3cm90ZToNCiZndDsmIzMyO0Zyb206JiMzMjtBcmllbCYjMzI7RCYj
Mzk7QWxlc3NhbmRybyYjMzI7Jmx0O2FyaWVsLmRhbGVzc2FuZHJvQGNvbGxhYm9yYS5jb20mZ3Q7
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0luJiMzMjtBRkJDJiMzMjttb2RlLCYjMzI7T1ZMX1NSQ19T
SVpFJiMzMjttdXN0JiMzMjtiZSYjMzI7YmxvY2smIzMyO2FsaWduZWQuJiMzMjtEdWUmIzMyO3Rv
JiMzMjt0aGlzJiMzMjtsaW1pdGF0aW9uDQomZ3Q7JiMzMjtvZiYjMzI7dGhlJiMzMjtBRkJDJiMz
Mjtmb3JtYXQsJiMzMjtPVkxfQ0xJUCYjMzI7bmVlZHMmIzMyO3RvJiMzMjtiZSYjMzI7dXNlZCYj
MzI7dG8mIzMyO2FjaGlldmUmIzMyO3RoZSYjMzI7ZGVzaXJlZA0KJmd0OyYjMzI7b3V0cHV0JiMz
MjtzaXplJiMzMjtvZiYjMzI7dGhlJiMzMjtsYXllciYjMzI7d2hpbGUmIzMyO3N0aWxsJiMzMjtt
ZWV0aW5nJiMzMjt0aGUmIzMyO2FsaWdubWVudCYjMzI7Y29uc3RyYWludHMuDQomZ3Q7JiMzMjtG
YWlsdXJlJiMzMjt0byYjMzI7ZG8mIzMyO3RoaXMmIzMyO3dpbGwmIzMyO3Jlc3VsdCYjMzI7aW4m
IzMyO3ZibGFuayYjMzI7dGltZW91dHMmIzMyO2FuZCYjMzI7bm8mIzMyO3JlbmRlcmVkJiMzMjtv
dXRwdXQNCiZndDsmIzMyO3doZW4mIzMyO3RoZSYjMzI7QUZCQyYjMzI7ZGF0YSYjMzI7c291cmNl
JiMzMjtpc24mIzM5O3QmIzMyO2FsaWduZWQmIzMyO3RvJiMzMjt0aGUmIzMyO0FGQkMmIzMyO2Js
b2NrJiMzMjsoMzJ4OCkuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0NvbmZpZ3VyZSYjMzI7T1ZMX0NM
SVAmIzMyO3NvJiMzMjt1bmFsaWduZWQmIzMyO0FGQkMmIzMyO2xheWVycyYjMzI7Y2FuJiMzMjti
ZSYjMzI7ZGlzcGxheWVkLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtUaGUmIzMyO2ZvbGxvd2luZyYj
MzI7aWxsdXN0cmF0ZXMmIzMyO2hvdyYjMzI7dGhlJiMzMjthbGlnbm1lbnQmIzMyO2lzJiMzMjth
Y2hpZXZlZCYjMzI7dGhyb3VnaCYjMzI7dGhlJiMzMjtjbGlwDQomZ3Q7JiMzMjtzZXR0aW5ncyYj
MzI7Zm9yJiMzMjt0aGUmIzMyO2hvcml6b250YWwmIzMyO2Nvb3JkaW5hdGVzLCYjMzI7dGhlJiMz
Mjt2ZXJ0aWNhbCYjMzI7Y29vcmRpbmF0ZXMmIzMyO2FyZQ0KJmd0OyYjMzI7YW5hbG9nb3VzOg0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsvLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tJiM5MjsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLiYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsuLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjt8DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
fA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wNCiZndDsmIzMyOyYjOTI7LS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLw0KJmd0OyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyO3wmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjt8JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzcmMueDEmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7c3JjLngyJiMzMjsmIzMyO3wNCiZndDsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjt8JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7fCYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCZsdDstLS0tLS0t
LS0tLS0tLS0tLS0tLSZndDt8JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8DQom
Z3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzcmNfd2lkdGgm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjt8DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjt8DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7TiYj
MzI7KiYjMzI7QUZCQ19EQVRBX0JMT0NLX1dJRFRIJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO00mIzMyOyomIzMyO0FG
QkNfREFUQV9CTE9DS19XSURUSA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7fA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wm
bHQ7LS0tLS0mZ3Q7fCYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7fCZsdDstLS0tLSZndDt8DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtjbGlwX2xlZnQmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO2NsaXBfcmlnaHQNCg0KQXMmIzMyO0kmIzMyO2tub3csJiMzMjtjcm9wJiMz
MjtpcyYjMzI7dXNlZCYjMzI7dG8mIzMyO2Ryb3AmIzMyO3BpeGVsJiMzMjtkYXRhLg0KRnJvbSYj
MzI7dGhlJiMzMjtuYW1lJiMzMjtvZiYjMzI7JiMzOTtjbGlwX2xlZnQmIzM5OywmIzMyO0kmIzMy
O3RoaW5rJiMzMjtpdCYjMzI7d291bGQmIzMyO2Ryb3AmIzMyO3RoZSYjMzI7bGVmdCYjMzI7cGFy
dCYjMzI7b2YmIzMyO3RoaXMmIzMyO2ltYWdlLg0KQnV0JiMzMjt1c3VhbGx5JiMzMjt0aGUmIzMy
O2ltYWdlJiMzMjtpcyYjMzI7YWxpZ25lZCYjMzI7dG8mIzMyO3RoZSYjMzI7bGVmdCYjMzI7KHN0
YXJ0JiMzMjtmcm9tJiMzMjtheGlzJiMzMjswKSYjMzI7YW5kJiMzMjthcHBlbmQmIzMyO2dhcmJh
Z2UmIzMyO2RhdGEmIzMyO2luJiMzMjtyaWdodCYjMzI7cGFydC4NCklmJiMzMjtzbywmIzMyO2Ns
aXBfbGVmdCYjMzI7c2hvdWxkJiMzMjtiZSYjMzI7emVybyYjMzI7YW5kJiMzMjthbGwmIzMyO3Ro
ZSYjMzI7Y2xpcCYjMzI7d291bGQmIzMyO2JlJiMzMjtjbGlwX3JpZ2h0Lg0KVGhpcyYjMzI7aXMm
IzMyO3RoZSYjMzI7bm9ybWFsJiMzMjtiZWhhdmlvci4NCklmJiMzMjtPVkxfQ1JPUCYjMzI7ZG9l
cyYjMzI7YmVoYXZlJiMzMjthcyYjMzI7dGhpcywmIzMyO2FkZCYjMzI7Y29tbWVudCYjMzI7dG8m
IzMyO2Rlc2NyaWJlJiMzMjt0aGF0JiMzMjtjbGlwX2xlZnQmIzMyO2RvZXMmIzMyO25vdCYjMzI7
ZHJvcCYjMzI7cGl4ZWwmIzMyO2RhdGEuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBcmllbCYjMzI7RCYjMzk7QWxlc3NhbmRybyYjMzI7
Jmx0O2FyaWVsLmRhbGVzc2FuZHJvQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjtDby1kZXZl
bG9wZWQtYnk6JiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7QS4mIzMyO1ByYWRv
JiMzMjsmbHQ7bmZyYXByYWRvQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjtTaWduZWQtb2Zm
LWJ5OiYjMzI7TiYjMjM3O2NvbGFzJiMzMjtGLiYjMzI7Ui4mIzMyO0EuJiMzMjtQcmFkbyYjMzI7
Jmx0O25mcmFwcmFkb0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsN
Cg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxw
cmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioq
KioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1l
c3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwg
cHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xv
c3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5
ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWlu
YXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2Yg
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCBy
ZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwu
IElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3Ig
YmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBs
ZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlz
IGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5j
bHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlz
Y2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhh
bmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_007_959065574.1412445658--


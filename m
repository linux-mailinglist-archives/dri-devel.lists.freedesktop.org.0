Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EBF98FC6E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 05:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9F610E070;
	Fri,  4 Oct 2024 03:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="LBo26mKG";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="va55g1Dq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D696810E070
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 03:00:00 +0000 (UTC)
X-UUID: bb9049b481fc11efb66947d174671e26-20241004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=4UWSGvFBKjD4ATOmb05kukj2FSlokdD2Wo1XT2+J9DQ=; 
 b=LBo26mKGTELkwlZo50hc3E9/shLC7Z+cXT4P/8XnJW/Unx+2XCZAq2r2nyCFLoIpVaI/eIPY78oBzTDq/9pHpHPLXgb+keqDd5DryARsy040dFq4Tg2rt0IgrWNJ8m4zHMIm9Z0VNZqNKvvorCln8zMECf6Bl4e9TDUQUPaqLUI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:f3f14e43-f232-454a-be1d-826c02c788c3, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6dc6a47, CLOUDID:0c554326-5902-4533-af4f-d0904aa89b3c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bb9049b481fc11efb66947d174671e26-20241004
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 151904230; Fri, 04 Oct 2024 10:59:55 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Oct 2024 19:59:54 -0700
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 4 Oct 2024 10:59:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8M+p1SwqVeFArMvw/hly4WPo8J+hCjJVdpuQw2ChNrry50I8cFx4BMdzlBViwnZ2J1oWtAoLzkJFRfdhrpVpdog7yjKirXDdagfZfhfGAQRR9Eg4ZVE07WIQldrSP0HzBrY0107kAA/4qLTwN1NJsfHUgOFygNhFzcNga8iBoLeEsJMotOa+Rkd2eg0wK6xyO/CbbgVmZTdJws9Xhn8YvP/ambFXFqdq4x5huH1PAN1Ohv/Elj/6XnESmKZ/dgZmnT38rRMD5WLq6xJTyAYaShecW/YTIopGFUDOLYFz9CBTB4LnloTNeaXIXyX+BJWMNyf9M23Yhze2Ykqst0jCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UWSGvFBKjD4ATOmb05kukj2FSlokdD2Wo1XT2+J9DQ=;
 b=ohwuJDJxg6GH1+/kSjCp1qjmr8o391T90zQMNhoKymq5W/tZqOjLkKT1me238AvR2oogtEiIBv7vZVMGxcgn39BPtkOOwPuJ1fwVSRsD34AlA350MlYdUOrSOsZKGNb4PgppgMrDLFAHn5mf2R8TZkiACMO9FSjgDMEvKX6eWTK6jQYYgEj2kGT4tlTtA0W70gyUsjV20NVc4UYyl0pAsvJxrzodKkw6zO7cLlHfB2SLh2k1+/NgiyqJK6yvFuFyKQGgIkkS4XmYdYYT0vqQbH3YV8uAHIM2SA8zISZbijjnDF2wJMrTaaYsgjjKME7dY3qVm2abdKaQRxcj6ay+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UWSGvFBKjD4ATOmb05kukj2FSlokdD2Wo1XT2+J9DQ=;
 b=va55g1Dqkq1bkVTj8dZJwtX9LGVSWzVm7TXi5GzGRbc4WEkqClZfPBnQbMBHSLWUy59iEgurrQKFbYVPCy2U2JJubXedSD43AY2IiZgTYOONOYc3MHFnf/FHguEeGNVVCgMw3fxCLluzzcx2GCts0ykp0n1I8aPnM9KoRzFVj+s=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by SEZPR03MB8832.apcprd03.prod.outlook.com (2603:1096:101:251::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 02:59:51 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84%6]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 02:59:51 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?=
 <Macpaul.Lin@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3] dt-bindings: display: mediatek: split: add subschema
 property constraints
Thread-Topic: [PATCH v3] dt-bindings: display: mediatek: split: add subschema
 property constraints
Thread-Index: AQHbFgSPr2Fb5U9qo0Kv9HbTcdNl8bJ15usA
Date: Fri, 4 Oct 2024 02:59:50 +0000
Message-ID: <32081590a38486a24211ed8a5981d3f1ce0f1188.camel@mediatek.com>
References: <20241004022430.19689-1-moudy.ho@mediatek.com>
In-Reply-To: <20241004022430.19689-1-moudy.ho@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|SEZPR03MB8832:EE_
x-ms-office365-filtering-correlation-id: 7f5feedf-cbc7-476a-5611-08dce4209d5b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?NlFyWnFrMXpJQjl0R0lLaWlZd2VRVHBmbmhEOWdlT3hWbWZkU1JXd0Y4STJr?=
 =?utf-8?B?ZjQxRUJsL1U4b1JJMEdiaitqbHRlUVFaU1dxNisvTnJyVGpWdDhRd1RNd1p1?=
 =?utf-8?B?L3haZUIzMmhVZFFPWHpXQnFxNWszbVhxalB0TWdKS2JyU0xzcEJIM2lOdEtE?=
 =?utf-8?B?ZXRkZ2M3UDFac29zWkphQzVYblQ0TTBPdnpNN0w5YTJUS1ZnWnVzUy9waWdE?=
 =?utf-8?B?alBLT2xSUEZlc0N6dWhIemEwaHB2eGFRcXYvaHNwQUdMNWdqQUpYTFF5V1hr?=
 =?utf-8?B?TEtqenZ3cDJYOHVPdEdQc1RTYXhrU2VZZ1Y2Nmc1R1M1Z1g3MHIybDVpdUhR?=
 =?utf-8?B?TTBtNnpSWWZZc1M3b3VjeXhzcnp3MHU5Q2pvcEJRNXlDWGdrQ1NoemZBa29t?=
 =?utf-8?B?Z2lzTHNDdmhmVCszNGpERTJVWkZ2dDlwTGZzZllHT2xCcmVDMTJSODVncGVx?=
 =?utf-8?B?eU5qdnU5ZmM2L1A5VTM1VFlXMFFvRi8yWHZydVlPS1lBQjdoc2NUWG1nZTda?=
 =?utf-8?B?VWFZWVRtYVR6Sko2b1lDZDJ4ejhCUTBtL2JpckJleHhVMjdQM1FYWDgwTmdz?=
 =?utf-8?B?Y3k3Y21OREVsSHhCOXB0N2Ntd3JET0FkRnhRNEZaV0JiSVRpSlQ0cFNkOTZR?=
 =?utf-8?B?RUlJaHVoMEZPcUI3c2RWYllZbVNhL0ZtYmhrYmRET2NHNjBVRU5keWtBczNl?=
 =?utf-8?B?aTIydEJ2ZnV1OHJ1WUpMa1F6Uy9peU45Sk4wOVpVNS92WGdTTnp6Nm16R3pN?=
 =?utf-8?B?Um1vbEFJejFwL0d1Sll1aEpXMGxSVGYvaUhTUHRTNWdiLzA3anp1YnF6Z05S?=
 =?utf-8?B?aTF5aW9Qbkp2STJUb0NzKzRUMkVrNTBodEhNQ3lMQ1owK01veS9XL0FsSVN3?=
 =?utf-8?B?TTBnSnVvaHpXcTFncXJSYnZOUFkweStINHlDcHI4S1hydDFDVjM4M3M3eGsw?=
 =?utf-8?B?TVFxYmpmSSswbXV3anhodlZacmJKeEM1WjBHMWlrTTNDYVRDRzZCSC8rdXZW?=
 =?utf-8?B?REN2TTdoL015dkk2aWVMaHFvU1ovREZlZU1JZkt2MEJmQUx0K2Z0SjRhU01w?=
 =?utf-8?B?Uk8yeWxlcmtRcXhqNHZ5NGFoN3g2cVduQ1dUc01rVWVJWFRqNzFPQXRMNnor?=
 =?utf-8?B?K09CaXYxOWl2NjE2OS9yUkZtbi90dzlveWd4UXRBcnRKdHB3Vk5wNm1iRitm?=
 =?utf-8?B?SDc3UUJxU3RFTUNnZ2Q4aG5mWjZremJHdXhSemNSNVJBNEd0eVdiOElBS2h3?=
 =?utf-8?B?ZmthSW1SNUtmdmFnSHk5cWk0OWgrSnVNcTFtam9qRVMwMGR5L2ZEc2tHT2Na?=
 =?utf-8?B?QVd0eE5nSER1d1VUZXFlamtKNUhkZWkvdWlkclgzZlJqOG9WVXZyRkk5STJ2?=
 =?utf-8?B?WWgrKzNJb2MySHRiZjBvaWJaOGUwbloybXZwZzM4bkttSDVrMk9HTEhrckl6?=
 =?utf-8?B?eG1DQzlqanh2V1dGZVNmNFpENlVOTzZlMkkvVFdMSGZnWnQxNmM5NWhJZ3BN?=
 =?utf-8?B?djhzVStpcEtWclNoMTcvREJBR1ZLL0hBaXlsY3hHcDNXN0hxODEwR2pod0w0?=
 =?utf-8?B?OFBXZUpsVG10UHlWeFdnRHVvcHVTcjdMUHFDU2Nad2JMaXZucnRvOEErZ3BR?=
 =?utf-8?B?RWdvNnZZSjN0RzRsQjJQdXlhc0haNkJEQ29sb3M3bGZ5NG9KVjJhdlgrY1RG?=
 =?utf-8?B?MFFaQUk2TUZiWlVQQm5SSkFicm5KdjlCMERyNlNiQUJoeUFrNk1KcFRiZTMr?=
 =?utf-8?B?bklEcUI2TTBZazF0YWpwM09FZEVBMXBIeUdMVEJnNGZabmZMZk9xT0VIeVln?=
 =?utf-8?Q?ch31Uon0kJeEx/wAhdXu2gwd8HQeyHSxQ7tzE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1JTaEVUZ0Fsc0pmVnRvSmVUWVEvcWhsOUJxNlJ3ekI2ZCtGN09RUUxveGdI?=
 =?utf-8?B?YkVjYVV1dC94czZ6cUNqWmV3cWQvdHFIMEV5VDU2elZwM3VuRHlKR05yVkVv?=
 =?utf-8?B?NkRwdSsrbjhTOS9QQitWdmF6SHVKVVlxamZTaWQydHpNKzVtQjd4NWRnWWh4?=
 =?utf-8?B?cXB0SFFoL052b1B4M2NqazJKTVUxMUJrOWhOcnB2cFhTYkRqaitIK2tiaC9S?=
 =?utf-8?B?TWFJdXhkN205dUtod3pkRmRBaVNITHNtWW1id3d2QU1PYSs5b1BQb2FEaE5j?=
 =?utf-8?B?ZUtpLzlXTlZ4STZ6dXpUU0N5R1JEaGxvVG1sczQ2dWlTVkdNRG9NbWt5QlZB?=
 =?utf-8?B?UGNDOS9iQ0w4S05ZYWxjRXQ5N1lBcy9tMldVQ0RwSkRzUkJDQnB3b3JTMUNR?=
 =?utf-8?B?emIzRjhEWFQ0NW9nbWdDclJaWXJRZFM0dFhvNzIrVFNWcmdxYWhnT0xHVC9P?=
 =?utf-8?B?bmZ2QlQ0clNXcHVTQXFycGE4cTRtSkJCVWdvd2xmRStmYk1IenlVTkJWZkNW?=
 =?utf-8?B?WmNEbWEzZnQ0N2xGK3hWYTZwMVJUY25aNWxqT2dYSWdjM1hEWHNJbW10eDVk?=
 =?utf-8?B?Y09WT21ZS1FLSHdTZitrOGNVWktybDAweWlhdGR5YkRmTTRQQTUwcXBmTUVE?=
 =?utf-8?B?d1FVaEdJL0RNVVlaVHdhVjM0d1VvREc4dUh6VjBpODF0U0tPN21xL1JxdkxS?=
 =?utf-8?B?enc1QytLanlRYm5pVFJ4U09WdC91WGxUNUxlUXJWb0VCVmFpS1VRTDBVd1BM?=
 =?utf-8?B?Uk1TWVhNaDFMQUd5ZFZyNmJDRFNIVzBINFRLOEdZS1NlZGVkdGRMRG9RQXFp?=
 =?utf-8?B?Q09iYUNDZVRPdnk0cnBKQ2xwTDNQTWhvYmluV2UwQUNpc0lBZC9MWWJYRHBq?=
 =?utf-8?B?RThEVldJamxGS2NTM2lpNlZSNzdLRGJ5RVYzQ0gvNENqaFF6Y1FCbkNRdWUr?=
 =?utf-8?B?OThqRGxQL2Y2aWZvTTlYUUQ3VjRNeHZRZHNQVDcvdDdPcThpeWxzN0xZaXVL?=
 =?utf-8?B?VkhzZVl0MkdNUFNadjNEamJXUzNzNzF1RnN3TmFPWkZQb0ZHR3p4SHZWWkZk?=
 =?utf-8?B?Tkk4ZmI1aXB4bDI2RU5pMEMvcXc1cERZZnFXTE9NZzVCL01ja2VyR0dRVndM?=
 =?utf-8?B?Rzh3TWtrRGx2RkdpTVZKbTYwTGFGOGYvdU5HWWsvK2hHVncyMStFSEVrTzdn?=
 =?utf-8?B?RnQ0bkxCbjN3QWlmQ0xjcXZ5WXhiY04xdGprMHJPdUpsaVBrYy9qV0t3N3hX?=
 =?utf-8?B?NkxKSXJEdzJGaWc2RlU4SFFhR2xkcU5Bb3duZzNhS0kxRmhGbXZTT0o5Vm9P?=
 =?utf-8?B?TWc1UkVNWnludUh3akltbzJJcUNvYVdGamZvOTNCL3VrWTlOMHk0K1MxdGh4?=
 =?utf-8?B?N21KRWR5ZDlkdmgvclRISlVkSmo5a3hCTDNjK2J0QzRkL3ZlSHhwTExRR0Uz?=
 =?utf-8?B?YW44VktUUVA1RTZjd0FTNlRnQzlxenA5TDkzcnYvNkQrK0RVTCtZUG5TREpT?=
 =?utf-8?B?V3Z6ZUQ5QWdQNFJBcnRoalR1dTI4cDgwbXV0N2tldmRycWs0dnpNTExyc0Ji?=
 =?utf-8?B?d3R6aUJldTZDaHhhRk9mZnNFVi9mRTdVSFd4VzJBQUM4UE50TXloLzZYdVhO?=
 =?utf-8?B?SFZ6Q0ZrQ2hBQzFqVVVoUUozK2lZWFVUbXFteFRTZm9aemxidDRyeXA4T3Fo?=
 =?utf-8?B?aThyUXFOYWQxYWxWYlVQeHhaaUlsQjJGRW4rVGk5VFhnSzgyY3Zkc1hrSG9R?=
 =?utf-8?B?VW5rd2UweGtGU3FxTFlRMEI2Q3RaL25ZTG5HRjJ5VXFLSmxFeVZMK0NvSGw1?=
 =?utf-8?B?dG5BSVB0YzF3NU0xdlJiQ3pqV1J4MC9ZTDRCZWtoYnhDd1FEUHFPNm5Qb1ds?=
 =?utf-8?B?OUtxelZRMVNQamJnYVk2TTdGUkhzT0RlT0JuckNpWmxOSFFjNzU0WU9meEVl?=
 =?utf-8?B?dW9saEZGL2d0OURZQmJsdjduWmVxcnpwV2VhNnVYOXp5L2tkeTY2T0VWVThJ?=
 =?utf-8?B?Q3dIOGE1Qm16eHArNDRDbzhXZE5iL1VYV2VFanlmTnlwcGI5bzZzWENMQ0NK?=
 =?utf-8?B?SWhPTXB3V1NRTlRidTZBY3Qra3hlYi8rQXRmYWtVV0orM1Q5TmYyektiY213?=
 =?utf-8?Q?zkSyz6srdblwaBVr3xZZ15UNk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD187BAA45ACCB4EB7E0853E74C756C0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5feedf-cbc7-476a-5611-08dce4209d5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 02:59:50.9385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RkgOusI8Qio6Aphr/ZcKpVb0rnBTln4eDl9Tc0Q+32tfX4u9ohnKP1srR+2s+aHb7LOK47dVXLt+D+sn3bD+RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8832
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

SGksDQoNClRoaXMgcGF0Y2ggY29udGFpbnMgYW4gaW5jb3JyZWN0IGNvbXBhdGlibGUgbmFtZTsg
cGxlYXNlIGV4Y3VzZSB0aGUNCm92ZXJzaWdodCBhbmQgZGlzY2FyZCB0aGlzIHBhdGNoLg0KDQpT
aW5jZXJlbHksDQpNb3VkeSBIbw0KDQpPbiBGcmksIDIwMjQtMTAtMDQgYXQgMTA6MjQgKzA4MDAs
IE1vdWR5IEhvIHdyb3RlOg0KPiBUaGUgZGlzcGxheSBub2RlIGluIG10ODE5NS5kdHNpIHdhcyB0
cmlnZ2VyaW5nIGEgQ0hFQ0tfRFRCUyBlcnJvciBkdWUNCj4gdG8gYW4gZXhjZXNzaXZlbHkgbG9u
ZyAnY2xvY2tzJyBwcm9wZXJ0eToNCj4gICBkaXNwbGF5QDE0ZjA2MDAwOiBjbG9ja3M6IFtbMzEs
IDE0XSwgWzMxLCA0M10sIFszMSwgNDRdXSBpcyB0b28NCj4gbG9uZw0KPiANCj4gVG8gcmVzb2x2
ZSB0aGlzIGlzc3VlLCB0aGUgY29uc3RyYWludHMgZm9yICdjbG9ja3MnIGFuZA0KPiBvdGhlciBw
cm9wZXJ0aWVzIHdpdGhpbiB0aGUgc3Vic2NoZW1hcyB3aWxsIGJlIHJlaW5mb3JjZWQuDQo+IA0K
PiBGaXhlczogNzM5MDU4YTljNWMzICgiZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBz
cGxpdDogYWRkDQo+IGNvbXBhdGlibGUgZm9yIE1UODE5NSIpDQo+IFNpZ25lZC1vZmYtYnk6IE1h
Y3BhdWwgTGluIDxtYWNwYXVsLmxpbkBtZWRpYXRlay5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE1v
dWR5IEhvIDxtb3VkeS5ob0BtZWRpYXRlay5jb20+DQo+IA0KPiAtLQ0KPiBUaGlzIGlzIGJhc2Vk
IG9uIFt2Ml0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBzcGxpdDogYWRkDQo+IGNs
b2NrcyBjb3VudCBjb25zdHJhaW50IGZvciBNVDgxOTUNCj4gDQo+IENoYW5nZXMgc2luY2UgdjI6
DQo+ICAgLSBSZXZpc2UgdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiAgIC0gRW5oYW5jZSB0aGUgZGVz
Y3JpcHRpb25zIG9mICdjbG9ja3MnLg0KPiAgIC0gU3RyZW5ndGhlbiB0aGUgY29uZGl0aW9ucyB3
aXRoaW4gdGhlIHN1YnNjaGVtYS4NCj4gDQo+IENoYW5nZXMgc2luY2UgdjE6DQo+ICAgLSBBZGRp
bmcgZnVuY3Rpb25hbCBkZXNjcmlwdGlvbnMgYW5kIHF1YW50aXR5IHJlc3RyaWN0aW9ucy4NCj4g
LS0tDQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxzcGxpdC55YW1sICAgICAgfCAy
NA0KPiArKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdA0KPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHNwbGl0LnkNCj4gYW1sDQo+IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssc3Bs
aXQueQ0KPiBhbWwNCj4gaW5kZXggZTRhZmZjODU0ZjNkLi4wZmZjZDlkMmI3MTggMTAwNjQ0DQo+
IC0tLQ0KPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLHNwbGl0LnkNCj4gYW1sDQo+ICsrKw0KPiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHNwbGl0LnkNCj4gYW1s
DQo+IEBAIC01Nyw2ICs1Nyw5IEBAIHByb3BlcnRpZXM6DQo+ICAgIGNsb2NrczoNCj4gICAgICBp
dGVtczoNCj4gICAgICAgIC0gZGVzY3JpcHRpb246IFNQTElUIENsb2NrDQo+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiBVc2VkIGZvciBpbnRlcmZhY2luZyB3aXRoIHRoZSBIRE1JIFJYIHNpZ25hbA0K
PiBzb3VyY2UuDQo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBQYWlyZWQgd2l0aCByZWNlaXZpbmcg
SERNSSBSWCBtZXRhZGF0YS4NCj4gKyAgICBtaW5JdGVtczogMQ0KPiAgDQo+ICByZXF1aXJlZDoN
Cj4gICAgLSBjb21wYXRpYmxlDQo+IEBAIC03Miw5ICs3NSwzMCBAQCBhbGxPZjoNCj4gICAgICAg
ICAgICAgIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtbWRwMy1zcGxpdA0KPiAgDQo+ICAgICAgdGhl
bjoNCj4gKyAgICAgIHByb3BlcnRpZXM6DQo+ICsgICAgICAgIGNsb2NrczoNCj4gKyAgICAgICAg
ICBtYXhJdGVtczogMw0KPiArDQo+ICsgICAgICAgIHBvd2VyLWRvbWFpbnM6DQo+ICsgICAgICAg
ICAgbWF4SXRlbXM6IDENCj4gKw0KPiAgICAgICAgcmVxdWlyZWQ6DQo+ICAgICAgICAgIC0gbWVk
aWF0ZWssZ2NlLWNsaWVudC1yZWcNCj4gIA0KPiArICAtIGlmOg0KPiArICAgICAgcHJvcGVydGll
czoNCj4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gKyAgICAgICAgICBjb250YWluczoNCj4gKyAg
ICAgICAgICAgIGNvbnN0OiBtZWRpYXRlayxtdDgxNzMtbWRwMy1zcGxpdA0KPiArDQo+ICsgICAg
dGhlbjoNCj4gKyAgICAgIHByb3BlcnRpZXM6DQo+ICsgICAgICAgIGNsb2NrczoNCj4gKyAgICAg
ICAgICBtYXhJdGVtczogMQ0KPiArDQo+ICsgICAgICAgIHBvd2VyLWRvbWFpbnM6DQo+ICsgICAg
ICAgICAgbWF4SXRlbXM6IDENCj4gKw0KPiAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+
ICANCj4gIGV4YW1wbGVzOg0K

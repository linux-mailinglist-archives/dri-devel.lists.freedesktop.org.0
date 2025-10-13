Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BC8BD245B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 11:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578D810E413;
	Mon, 13 Oct 2025 09:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Zzkes6rk";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="lucbqs7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119E810E413
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 09:23:44 +0000 (UTC)
X-UUID: 4ed000b2a81611f0b33aeb1e7f16c2b6-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=2iN1wrHDZnx18qrvDu+jG/8Ewjjh0U3dRWc19acjSSM=; 
 b=Zzkes6rkkv/0+4mDCw1pLKvO190u+JcE+JFNNpEjkZpdOPsVJuN4yFz8dK1o2idTC56FyXptPsZVv/hbgIEyk1z/XdhGJl5i8zHMArf4X8qK9632XXH3n8rdCfJOcPWKY8SmLoD15BIqgaPnnGVI14OQ/PCQpSuB/yv/6Ed52vA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:a4c2e36e-ef9a-4b3e-bbd0-9f80cd21ba7a, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:f34eff50-c509-4cf3-8dc0-fcdaad49a6d3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
 BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4ed000b2a81611f0b33aeb1e7f16c2b6-20251013
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1227287640; Mon, 13 Oct 2025 17:23:41 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Oct 2025 17:23:37 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 13 Oct 2025 17:23:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIfTTw/6ieXPkIY8NYxE9AwtyonKG5cLY3a+pUrQPC73oCwTdxgme8FDYUjhaWp5TcvFjhmND/zctbY0DuXG8PPtCCNsML/InLpY+2ar+hFfwlm47m4XchCJe9hyMc7AP3jn0nOIn6ucj/RXAJnTe1e/aJm20hibkzc38PcoQb4LHzimJWrQbPJvOW9z82QUCX/DsDomprkW2vj6G3XjGKtmf+LJ40cHhIFpXh83Ubul2xvpYZiO+qOHcP1nmlt7JF1UNCWK6eyi0mjyPertTcNlgFMt4u/+bpPb+v8FhzTem8WV/lIXcHz2WMUlSRhJjDnH1UoGTMSLFF4zQTT4uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNAXwEBCMp+8x8I7CHTOCZlBarnb9/Do9coa31402So=;
 b=Pw8S0atI/jSgljjYwqGS8U2Q8uYnt1KXek9Fq10ztdzHiNPIY1YMu/c1IeG1dYmlKDG1vl4WD1WTHXgXJb58dserKzbwfczZPFdmxF5fPQ6s+tJRCNUN5dr8xZehRdu7AI237q9+T7DYdWnwJxl8Xuj37uZgWxwfFEzCiI5+fS0xPk4nlQYIRVxKPNO+yVBuDHJSM9QcETr1kGpJTKCX9MGX4f8Q6xdUqjQMqSsz0JR/CwJT+GWhjdutKrJMNzPLIj4RfD5zfm2F2kOXT4hSfgfem9F2Ls9x6/gmOSuURYSQASBFS7xegHUzdDf4LyvcyMtLv4B1+qYAr3OHGayjjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNAXwEBCMp+8x8I7CHTOCZlBarnb9/Do9coa31402So=;
 b=lucbqs7Dn7ReP2yEbe6dzABZQu77oQ/mBffAzhcT4g1V4+5HLO8pPXwgBLS5UiL5FN97AyFl9NuFLbh/t0vt91u3iSI5ILGt+gE11HpeYfGqQnkOy3uPIvB4yAqvUPVV7otK/0ERNwb0nid0fgTNAp9vrbLDJ82v1eetfKRIlEo=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SI6PR03MB8653.apcprd03.prod.outlook.com (2603:1096:4:251::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 09:23:36 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 09:23:36 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 16/20] soc: mediatek: mtk-cmdq: Remove shift_pa
 parameter from cmdq_pkt_jump()
Thread-Topic: [PATCH v7 16/20] soc: mediatek: mtk-cmdq: Remove shift_pa
 parameter from cmdq_pkt_jump()
Thread-Index: AQHcORPOer0ghUttd0uroYIrBxEpIrS/0/MA
Date: Mon, 13 Oct 2025 09:23:36 +0000
Message-ID: <f95ca970c775fe2ab1acd95781d62a11b7242fd8.camel@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-17-jason-jh.lin@mediatek.com>
 <9abaae2b-8e66-4e28-99c3-14cf3de13c8c@collabora.com>
In-Reply-To: <9abaae2b-8e66-4e28-99c3-14cf3de13c8c@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SI6PR03MB8653:EE_
x-ms-office365-filtering-correlation-id: 6ee32a03-97b6-4592-1e92-08de0a3a3056
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WVdHNXFpd0pSaStPdDF1OXRNWWlCWGJMdlFVcENqNGhudnJ6a0pGZnlUbmJt?=
 =?utf-8?B?QmJualZ3VUIyeUg4d1ZvaUFGT1k3eW9MVUtFandGVG5LZGxzbEdRRE1VazR4?=
 =?utf-8?B?SUVTNStyTGZ5M0dWTHNxb3BWUWlDZmZ3N05UVFl2YStDeEdXSjRQRjJaS1JZ?=
 =?utf-8?B?cEhIVXFmMVBvbkRlSStaL1BFdzlLTmZ6OEdKUG9HYjBwbkZMYUFBbUY2UUN0?=
 =?utf-8?B?K0crQUlwRGtLajgrV1dQbWVTeWxKNFY1MzdzczhYUFNDSjhoUFYwVkNyeFhB?=
 =?utf-8?B?ejEybjN0VUFDaitxeFB5UlAvQU81eS9jcEw5dWlXOUxndHNsVTVhT1Z6RXBG?=
 =?utf-8?B?NldRVEpsYS8xODV2NmdZUWh1VUo4OGI0dVJ4SDJ2U0RncEZ5cHZtWGxvWU14?=
 =?utf-8?B?V3N1OXhJek1tOWhpRlNuNTU4VWpJd0d4Skx5UUhmOVQ3Um1BSG1YWit4WVV2?=
 =?utf-8?B?amRKZDdqTEpjUTI0a3ZvS1dKaDNyYWZncE5xZTJ5WUdKWGhDSnBDak54M3BC?=
 =?utf-8?B?SXZNSWlsSENNZ1hXVXRiMWE2eGJEZC9yeERBcmZjNHliRTIvVi91TXMzZGRT?=
 =?utf-8?B?UEJ5S0VvUjJjTGtxSTMvc29NbnBucEhtaW9icm5ubUFnb0V5dnVhTmdGYUpz?=
 =?utf-8?B?NGloYmhmQWZQM1ZPL1lTS0ZqZEdqRmRXcDJoWmIveGpSVUd1TTg1VHZXZ3Jp?=
 =?utf-8?B?STZ2RHpIdFhMZEVRd2RRSVV2YkpBb0Y2d1RFanpITFhya0t6dVg2cU1TWXZ6?=
 =?utf-8?B?Y2Flcit1R0lMR3dMNGlVL0I4L25qWjQzazRNSmlOMGlnaURrdldRMWlZQVAw?=
 =?utf-8?B?dURNbWlyN0RZc2haL1l6dVI2SlQwZUhkeG5nZE1vU0dYV2NUVHRsZ2JHYWt1?=
 =?utf-8?B?a1VnUDZxVHExYlhRTXVEMGs2dG80T0pSeksyaTNSVGM5cms1ZnpOb2tsZmhl?=
 =?utf-8?B?YVpWanM4bExrVXBydU1JR1pCU25DN3h4WVV5YUVMeDkrc2RjQXJDQTZuOWpR?=
 =?utf-8?B?Z3BMckJUcjg3Vy8xMXU4cDZtRnRtZGhHUFh6NkI2NHhqcXJmMEVXMnlneHNv?=
 =?utf-8?B?OHc4cE5aaTh0TmwwbzAvZmdzaWxrOEhwTjZsZFBJekVDUmlOYkl3MmFwSk84?=
 =?utf-8?B?Mm1qV2g0VUIvckNWS3kycTF1Uy91Qy91UWFtN25selBEM05FU29WcE5tSmVk?=
 =?utf-8?B?SEU1RFk5ZjVFQTJoY1VoUEJCa0JwaGhJejFMbDA2Y1VUM3NqQVNtb2dSd1dN?=
 =?utf-8?B?ZmtBWnVVaTJWdytjVU1sU2NPUThQczMwS1ZFVy9yNm5SMXJQVlBwZW9JSTRC?=
 =?utf-8?B?cnFLYnFHazQ0QU5BL1ZyRFBMMjhVdnVTRm5qTFA4Ymc0THlXU2lybTY4WVhF?=
 =?utf-8?B?c09QTy84ZzRXUkh6WC9zdFBFOVk0T2pZcXM0a215dnQ4QXk5azhVS2EwQVNs?=
 =?utf-8?B?eTc2YklBVEcrR3JyUnViM3lnNDQ0c0xQaDVITGMrUEg0ZDlIbWN2NDVMa01i?=
 =?utf-8?B?WUZKLzlFVndWUHRQVDczYVBsWGhQcTdmbkFvTzdQMTY0Sm5pQnhqbFFkckxH?=
 =?utf-8?B?c1lhcmNHQUo1UnZLMjdDWnh1OVA3WDYrT2lTU2NDTEtad0c1U1Y5NzVqMnBw?=
 =?utf-8?B?MTlYNFVNeVdHbEE2SjRyYjFiZzFHZU53RGFqcjJCYkhxam9mbFdmOVFDSHRF?=
 =?utf-8?B?RDZodk1BV3dMS2VLMnVUaVFQVlZudTRBYXpVSFpkK3VBenNqMDcrNlhpbnly?=
 =?utf-8?B?VldNN2dRSE9KV203RlBKYTNxYmFFbHFDelQ0Z2F4M2gwbW1saFFndjQ0d0pM?=
 =?utf-8?B?NHh1d2JvOHNzcDFzSHNhUzl0ZlhweGVxOVJKYy9SbUo0SUhTOTRqYTRTaHhD?=
 =?utf-8?B?SGFmcFlyTVdEeTlMa3RZNHl4MmhqTVNXdGJtaWxuMStydWV2YjFBTkx3UG1j?=
 =?utf-8?B?SHJVbTgzbzhLS3ViU25EWWllMERQdGl4dHlOdldiM1BwSGhSVW0xTktkS25l?=
 =?utf-8?B?VkVSWVF6OUl1L0xpYndkYmhyWXZOb1h1bUgzdVBDUHdUbVZZZFFzUUYrZ3E0?=
 =?utf-8?Q?66MGVy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEdxakF6ekJJQVA0WWpyOXhyaWFHZWlVaDBkOUIza1FBTndybS9UclU3M0Vt?=
 =?utf-8?B?SklIbnhVZWRBVWZIYWthZHZmZ2I1allBRllNck1oeHRKb3RicDNURVRiWG53?=
 =?utf-8?B?TjQ3ODJkN3ZBZkcyby91elgwWjZHVUloU3M1eVFUQWp5blc2SmZTK0JQeVZW?=
 =?utf-8?B?M2xqMzB0VFJOTzFsbkV6OHZaOUE4WW5jU29rellzTjg4RmswbGczeWNwQUhD?=
 =?utf-8?B?V0p2Y3YxR1ZDeUh6TkJBTll0V0NOY3pDNmFzRjNPN0lOUWg1azRRR2VQeldu?=
 =?utf-8?B?azA1U1FPVUxrVGRqelFRVUhwWUhhT2VzZ2lkUFBwbmZlOHErZkM3ajJJTmRV?=
 =?utf-8?B?TzVpS2g4cDNNS1liUGZUNDVabkhzdzBkbXFDREhDRmcwVnFBNnBHV2kxU3ho?=
 =?utf-8?B?RGZ5ZUw4WXF6b01OZS9nWGI0SHYrNUdmcy9DVzQwa0FnTGlVd0NCYkYwOEFz?=
 =?utf-8?B?a25paHZEQTVxelJocEZVUHJlT0JvZllSdTBFbW00MW55R3I5UUVYN2hmcmE2?=
 =?utf-8?B?cEh2WGozNWZ5VEx5OWxBbVF6ditTQWNUOGF5OEZOWGh5ZlAwbEpOaUJqU29I?=
 =?utf-8?B?QXBoMXQ1ZEtrRndRdUFYUmo1Z21UemZBY1NYajJxOTdwMGNkemoyeDNKSVEx?=
 =?utf-8?B?QkExQzRpSVgweml1dzlYeVJLdG82L1VqVTZEU01OT3FiRFkvb1RCV2R1bjZH?=
 =?utf-8?B?R0cxOU5JQVpFY3A0K3pqbXBrbmZmaFd4UXBRWWdGSXNCLzRUaGVqYVphSS9R?=
 =?utf-8?B?aFpHR1VhNHlIaExTNG16YjVseE1TZk1HWURmT2ZHdjkxTDBqakNBU0pGWDRK?=
 =?utf-8?B?SjFudWtMWHdoa3hUN1VvMjNPYjdETUY2TUlyRyt6aVRMRWl6Q2tNaUtQVURC?=
 =?utf-8?B?N3JoSFFDMTBwRlRZYU1NZHR5MjRQSjgwT2VSZlhGODRnU3BvcGdGYUJWMkhu?=
 =?utf-8?B?V2lISGJuUE1JMnlqeGNNUmdGS09XeUFRVFV4UE5QQXgxWlBHeVVLeTJxaGxx?=
 =?utf-8?B?S3hGWkNjaXRRZ2hkS3VvYzRRSXpSZmZubUtYRWttRmxUZjhvZURRc3lSSG1y?=
 =?utf-8?B?NVYwb0hCcnpnT3VUeFl0Y1d4dnNJNVc5MkNYZDhXOVRuYXFsK3p5dCtVRUZC?=
 =?utf-8?B?cEFwUVZESi9TN205ZlVtRGZJOURIKzhYdnN2U05EbE92OUJZZ2F3MGtmS242?=
 =?utf-8?B?ZEpTQXVLWXRVLzNJM0gyMW81a1F2aWl4WERpdlhUS3lHRmE5c3RYOFBRRHR3?=
 =?utf-8?B?YVFwb1g4ZHNZRjBwWVhKbFAxNG9ySmJLV2JvNXREMmx6MWpONTZ2Nkx4aE12?=
 =?utf-8?B?VTFEaUwyYkM5T29mNkNOcThxY1VPRldvaWNnUGg4RUJ2OHUwdFRjbnlodnM1?=
 =?utf-8?B?R2JpQ2NZSXhPWUp3bWZiVmlGT29SYUdQMTh6K0RJSEc5ZzZuVnVVUXp3dlYv?=
 =?utf-8?B?VHRNZFBLQWltR2p2dmtYMGlDUG1BV2pqLzNXaXI0YUc2WW1ZWi9QY001TFhV?=
 =?utf-8?B?SXVXU0Q0R1dHWEtaMGFsMExmdklJUWxvZnNOMmpmNmtqSDFhZzBTV1d6M2h0?=
 =?utf-8?B?WG1iMVYzMEZyYmw3Lys4M1cwbHArYzRZRTQvb0hnUitRRHR3VEcvMzZRZmgv?=
 =?utf-8?B?RHl6VnJzT3d0TGxmYXRVaWIyNCtrTzZUakU5bWpQV3k2R0ZoV251YmVzSWQ1?=
 =?utf-8?B?VnU5WnlVRFI5VGc3YTN0MzhxblhYbG4zcStjRXdUWHorRDU5TlRXWmJLOEtO?=
 =?utf-8?B?MmsxcnhYNXh4U2FQWVozNTAxelNGdnFMbFgyMWRpcFNZcmJiTW5BWnBpMzJ3?=
 =?utf-8?B?ZVMyQmFBV0hKbEQrb2p6NEh2VjBSRlpSRHZidjN2VGJ4TUdsdUpueWpIbG02?=
 =?utf-8?B?UkFPcWlFSVJ5V0RURjZmODU2SlFYeDhvVnZrNDVGZ05ZS1VZNVg2Ymlud2Ir?=
 =?utf-8?B?N2Q4WHQydFcrdis1MC9UeFBGV2FqOVp1TDIzaVNtdnNRTDdxRUYrOW1tV1FJ?=
 =?utf-8?B?M0J0dGtaZmw5OXZPZlRpdFZEV0ozaUg1TlI1Z1FiN3d5c293QWpxMnFyOVM1?=
 =?utf-8?B?bnVtOWdLK2hyU0tpcWczeVRuQnJJSUtFR2ZTai9jVHdlOXNpcS9WRDIzbk5O?=
 =?utf-8?B?aDZ2cVMrVXM5SHpDY043Zyt3Y2x6ZEgzdE13dFpjNWVraFExdzZoVW52MHFa?=
 =?utf-8?B?Rnc9PQ==?=
Content-ID: <B7DD5AD2EABBCD4E91A97A7520661F75@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee32a03-97b6-4592-1e92-08de0a3a3056
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 09:23:36.8164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tZY+o0A7SeaiOoM4iGkPA3uF8HtAg8sGsUL0VJifmcPsQC+PH5yz/wicKx+ycx5RNOWLYoNqQsA+YvyFtGI5FznWEYvHaIzuWOkzWmEcNcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR03MB8653
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_516175195.640457546"
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

--__=_Part_Boundary_001_516175195.640457546
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI1LTEwLTA5IGF0IDEzOjU2ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMjcvMDgvMjUgMTM6MzcsIEphc29u
LUpIIExpbiBoYSBzY3JpdHRvOg0KPiA+IFNpbmNlIHNoaWZ0X3BhIHdpbGwgYmUgc3RvcmVkIGlu
IHRoZSBjbWRxX21ib3hfcHJpdiBzdHJ1Y3R1cmUNCj4gPiB3aXRoaW4NCj4gPiBjbWRxX3BrdCwg
YWxsIHNoaWZ0X3BhIHBhcmFtZXRlcnMgaW4gQ01EUSBoZWxwZXIgQVBJcyBjYW4gYmUNCj4gPiBy
ZW1vdmVkLg0KPiA+IA0KPiA+IFJlbW92ZSB0aGUgc2hpZnRfcGEgcGFyYW1ldGVycyBmcm9tIGNt
ZHFfcGt0X2p1bXAoKSwNCj4gPiBjbWRxX3BrdF9qdW1wX2FicygpLA0KPiA+IGFuZCBjbWRxX3Br
dF9qdW1wX3JlbCgpLg0KPiA+IA0KPiA+IEZpeGVzOiBhZGUxNzY1MzQxMTIgKCJzb2M6IG1lZGlh
dGVrOiBjbWRxOiBBZGQgcGFyYW1ldGVyIHNoaWZ0X3BhDQo+ID4gdG8gY21kcV9wa3RfanVtcCgp
IikNCj4gDQo+IERyb3AgdGhvc2UgZml4ZXMgdGFncywgdGhleSdyZSBub3QgcG9pbnRpbmcgdG8g
YW55IHVwc3RyZWFtIGNvbW1pdCwNCj4gYW5kIHRoZW4sIHRob3NlDQo+IGFyZSBub3QgZml4ZXMg
cGVyLXNlLCBhcyB5b3UgYXJlIHBlcmZvcm1pbmcgbWlncmF0aW9uLCBub3QgZml4aW5nDQo+IGFu
eXRoaW5nLg0KDQpPSywgSSdsbCBkcm9wIHRoaXMgZml4ZXMgdGFnLg0KDQpSZWdhcmRzLA0KSmFz
b24tSkggTGluDQoNCj4gDQo+IENoZWVycywNCj4gQW5nZWxvDQoNCg==

--__=_Part_Boundary_001_516175195.640457546
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjUtMTAtMDkmIzMyO2F0
JiMzMjsxMzo1NiYjMzI7KzAyMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMz
Mjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3Im
IzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZl
JiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRl
bnQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KJmd0OyYjMzI7SWwmIzMyOzI3LzA4LzI1JiMzMjsx
MzozNywmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyO2hhJiMzMjtzY3JpdHRvOg0KJmd0OyYjMzI7
Jmd0OyYjMzI7U2luY2UmIzMyO3NoaWZ0X3BhJiMzMjt3aWxsJiMzMjtiZSYjMzI7c3RvcmVkJiMz
MjtpbiYjMzI7dGhlJiMzMjtjbWRxX21ib3hfcHJpdiYjMzI7c3RydWN0dXJlDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjt3aXRoaW4NCiZndDsmIzMyOyZndDsmIzMyO2NtZHFfcGt0LCYjMzI7YWxsJiMzMjtz
aGlmdF9wYSYjMzI7cGFyYW1ldGVycyYjMzI7aW4mIzMyO0NNRFEmIzMyO2hlbHBlciYjMzI7QVBJ
cyYjMzI7Y2FuJiMzMjtiZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7cmVtb3ZlZC4NCiZndDsmIzMyOyZn
dDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7UmVtb3ZlJiMzMjt0aGUmIzMyO3NoaWZ0X3BhJiMz
MjtwYXJhbWV0ZXJzJiMzMjtmcm9tJiMzMjtjbWRxX3BrdF9qdW1wKCksDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtjbWRxX3BrdF9qdW1wX2FicygpLA0KJmd0OyYjMzI7Jmd0OyYjMzI7YW5kJiMzMjtjbWRx
X3BrdF9qdW1wX3JlbCgpLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtG
aXhlczomIzMyO2FkZTE3NjUzNDExMiYjMzI7KCZxdW90O3NvYzomIzMyO21lZGlhdGVrOiYjMzI7
Y21kcTomIzMyO0FkZCYjMzI7cGFyYW1ldGVyJiMzMjtzaGlmdF9wYQ0KJmd0OyYjMzI7Jmd0OyYj
MzI7dG8mIzMyO2NtZHFfcGt0X2p1bXAoKSZxdW90OykNCiZndDsmIzMyOw0KJmd0OyYjMzI7RHJv
cCYjMzI7dGhvc2UmIzMyO2ZpeGVzJiMzMjt0YWdzLCYjMzI7dGhleSYjMzk7cmUmIzMyO25vdCYj
MzI7cG9pbnRpbmcmIzMyO3RvJiMzMjthbnkmIzMyO3Vwc3RyZWFtJiMzMjtjb21taXQsDQomZ3Q7
JiMzMjthbmQmIzMyO3RoZW4sJiMzMjt0aG9zZQ0KJmd0OyYjMzI7YXJlJiMzMjtub3QmIzMyO2Zp
eGVzJiMzMjtwZXItc2UsJiMzMjthcyYjMzI7eW91JiMzMjthcmUmIzMyO3BlcmZvcm1pbmcmIzMy
O21pZ3JhdGlvbiwmIzMyO25vdCYjMzI7Zml4aW5nDQomZ3Q7JiMzMjthbnl0aGluZy4NCg0KT0ss
JiMzMjtJJiMzOTtsbCYjMzI7ZHJvcCYjMzI7dGhpcyYjMzI7Zml4ZXMmIzMyO3RhZy4NCg0KUmVn
YXJkcywNCkphc29uLUpIJiMzMjtMaW4NCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtDaGVlcnMsDQom
Z3Q7JiMzMjtBbmdlbG8NCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRl
eHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkg
Tm90aWNlDQogKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkg
YmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpl
eGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5k
ZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4g
QW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5p
bmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRz
KSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBt
YXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9m
IHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMg
ZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAo
YnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9m
IA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0
ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFu
eSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_001_516175195.640457546--


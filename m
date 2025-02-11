Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491F8A305A7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 09:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB10210E436;
	Tue, 11 Feb 2025 08:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="EOF9hd+g";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FJQ4hpsm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3593A10E436
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:23:28 +0000 (UTC)
X-UUID: 74967338e85111efb8f9918b5fc74e19-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=mRPqmniO8DhEQd/BBweBXuR9BJVdBnAkuWRjw2+uhRQ=; 
 b=EOF9hd+gLBCF4FWb8lQ4U+0DK6l+12C9f6E0GKAtedSjBCv8JnJCGlQ8q93J4+CGwtr7kX9Jqvos4bmhnN+NaTy9pfL2SaID6Kjm8CfMnGVTJcnGl3trBee1uzLg2M9NnjAjL/HjjW8BnIXeeI5XbbFlHBhHfaUFRTYp3nB/ddc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:b195a440-1d6d-4204-b1ea-48076036879f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:97ca677f-427a-4311-9df4-bfaeeacd8532,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 74967338e85111efb8f9918b5fc74e19-20250211
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 480407862; Tue, 11 Feb 2025 16:23:21 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 16:23:19 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 16:23:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzFk71QoI+E6boqesUW7lw0aoxD6A4smUv6FXqci/pVqjjubjwIdNfjW0ldCdZVnefD03aX2ux/WF0cEKYdWaemLcACWpNJDIWavDDo5otGWZntw5ESHva85uRJeTcyCQMdYc+rihM1reBT1y70TVBtlKCF7pGL54ccon5K5SpNuYHRws0Yg1laUI8+rRnywDrYsJZ+XTZi7C/FYOZLjMpQX6yhRZUbPC7F14z2+al0VPTuqY+DlPRiwTYVw5SG1YbPXlwUMywHqKyzgjcgaDS8gs9J1NtfQB5NQVIVA2qQ1WOcVD1cIkSfsvtwmtXQLmoVOzeZCP6iZiRnvqPZsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSdIqlmvbMMtUtyA91UMZdyWsftYcEu9zS0VXNJtJ8c=;
 b=KqpXSVKM4O64hxdAv7jJWHikeSe2UoLmNuk3Ymg7G/X5z41QULFdk2I39zcZzgX+UznP2UQXY2lZ4usnwQ5fwVafdZ0CU15JvfPo7qUPBqDsLmuVDxaKhuABWLYihFXmArOabaATKKqIKMa0Lxqj643iDlUivf8dqGDEnazyuJBxU+0Vdi1lVMS/aR/JCOj/DaXPwUhAJ6AKARRR7Ux1LNAbZ1sEj9ou6r4ne5ZHhmmXX3P0cfsuGamqxcIx9StZEQwVhySjmrQVEXUkBTVao4Cm67imlfmhGWxuQjf5bNlYPocudjwTxvlWurC76w9PQx5dkwY8vjcKPG4vStyj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSdIqlmvbMMtUtyA91UMZdyWsftYcEu9zS0VXNJtJ8c=;
 b=FJQ4hpsmfAW6FcDFBZ6BUDOCKKiZoeMb49vZ/MFMb7PeSccbNfaygxnqTdia8jnwt8ZtaEWp5YEn57XcU7vl8ZUmY74DIFI4sdNCbzmVWPlrMB8XMdyo6GLIZLQR9TL0RSU4g9j0/jpkRzW9n8EaYumjNPBHX/3gkO7H6c30Tws=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 KL1PR03MB6970.apcprd03.prod.outlook.com (2603:1096:820:9f::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Tue, 11 Feb 2025 08:23:17 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 08:23:16 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
 <krzk@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Topic: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Index: AQHbY1yrF5tAYKZENUWonbDbyeckJbMP+LiAgArXxYCAAXEmgIAltAkA
Date: Tue, 11 Feb 2025 08:23:16 +0000
Message-ID: <d1f64020a9fa819a7928ea96a2608e4021b325a8.camel@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-4-paul-pl.chen@mediatek.com>
 <abadfae8-56f7-499c-83ff-7d79e3fe1f52@kernel.org>
 <c1440608060e4b2fabf07ff5ac0a7fe49201ba9d.camel@mediatek.com>
 <cc043dcd-b46e-4b4b-9b80-0450efde86eb@kernel.org>
In-Reply-To: <cc043dcd-b46e-4b4b-9b80-0450efde86eb@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|KL1PR03MB6970:EE_
x-ms-office365-filtering-correlation-id: c65faf57-ab85-4df0-175e-08dd4a7555e4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?c0NuQUpJaS9rZ3JQcEdUbG9meVpGSEJwQnZFcW1wWVA0NEl6QWNTd0o1VHlv?=
 =?utf-8?B?N3RISkFYQWxOL1JiOWpUaVpRUHBrYjk1WktCbDRHY0tWNVRHWmFpaVk3Y3ho?=
 =?utf-8?B?dGJUSm1Ea2JhL1B3OHBHNGxEeDNIbDYrR2NzNUxBY1FUYWhFaG93U1ZGUXhI?=
 =?utf-8?B?U0h4N3NPOHZXYVFxU3JXV1ZSb3dxM1Buc3NmUmFtV2VjSWNUeEVWUVVlbWpX?=
 =?utf-8?B?UFFoWklxT1BLL3UzdnVNaHdDTU9yR2tlMnBOOTB6dnlHVkVPYjlneEQ0WkFl?=
 =?utf-8?B?dUxDVjhXS2pLUDVkankxR2s0ZlExaDFXbVFORURsMDNiTU5VWGJmeEU4a1dL?=
 =?utf-8?B?WHhUd29IS0ZHeTA3clRyaC9KdHVVWlNrS1M5cDhSTTBwUHMwZm1FWGFhQ1J5?=
 =?utf-8?B?NUloTk9qeFhpKzhUUUJUVkNMbk5IanJ2OFU5QWVNcENoaXN5SmlWOVFMeUVz?=
 =?utf-8?B?Z3J2TitWUy9Ic1NQMDRNMjJVV0FMQUhXNlloSG9qTG9DVDA1eDBqcWpuUTN4?=
 =?utf-8?B?RDdhUmpGN2dLc0NHUG80aHM5djh4d1VlSk1BdWJsVVRaZzZYeG9jWmFmU2JS?=
 =?utf-8?B?TGlLcm9MN0pHSXFiV2t0eUJIRmZkbkJzM3NrdzJuL2JPdjNLUkJTbjZBMzg0?=
 =?utf-8?B?Z3U3VitxYkhwSWZ0ZGdiaGxKWjBzWSsrdWJTcmZYRmZSdEdvdHc4aFpVUjJz?=
 =?utf-8?B?TEJBQ3BHUTVZY2ZvSS9TWU00S3dTVzdFaFhPU1MzQmh0ekhQSlR5OUlUanF3?=
 =?utf-8?B?UE5pd2ViZW53MDQzUlQ2RW1KVVcwRVQzcGJNaGxLTGxEeDZnTjZpekxkdlkv?=
 =?utf-8?B?VTBrUHdVcEJRRXRYN3NkWGp4SHhHckExaUZqZWFPY3I0TFVFL2NWRUVLTGx4?=
 =?utf-8?B?V2FWZ3NLb0NtdXNGWE1WeU91eFhoTWp6S244NE4xTEpudWFCNlFBVGQ1UFBS?=
 =?utf-8?B?OWNzUVhEVnBzK1pSc2VhRkJjUEZnbUJSQnVQK0gwVklja3pZazd3eFFQb0Fh?=
 =?utf-8?B?UUIzVGQvY0NWb0V2YmRRd2d3RElQMWVVcGlBTVJCY3RkUUNTcFpwakYwTzJM?=
 =?utf-8?B?ZmRLRm9ha3pQbUJSN1JjV0NWM2JNcEt0ZWkvQjgxYXpLeXVTN2VUeXJwdWh4?=
 =?utf-8?B?RjVGS3pnS1RJaCthalB4ejhsbTRkYTlLR09sZWlWQVI4QW90bzQvQ3M1MXY1?=
 =?utf-8?B?WXVUazRpZUlZcUJWcW9TWE10VGM3aXhtVWtXTW8rRXlET054Um1qV1hQb3do?=
 =?utf-8?B?MnphSmxrQmgrK0trNzg3bG1wUElPNGR1RDM5UFphcWtNU1lod2lPclhMdlBT?=
 =?utf-8?B?RldiT2NpaWVieDJoTkFEK0o2bW1STlNZaDlkUDk1c2pGcTNuRDJUSFJTN2Ft?=
 =?utf-8?B?Wkl1RkIyUEhLMzZHb1E4c2c2bFBTOE5UeDFJcUdqTHhvS2hQamRFRmNlQUtn?=
 =?utf-8?B?U2tTUWZsRm9xQ2dBWUN4RlpaNFZWeTJWY2QvNzBiUGJWcDdQVjF4TEVIUnBW?=
 =?utf-8?B?dVRNWHJnakQvcGQ4Y2VFM3JDckw1c2FCL0I2cngvZWk5UXYvbGh5ZTk2US9r?=
 =?utf-8?B?N2dCMWxSdVRuRTlQUkRYRVBDTGVDOFoxbU9hSmErSTMwRFVGaE56UmVlcnZQ?=
 =?utf-8?B?eWQvUkhnM25RRGxpRXVIR3Q5czJyOElsd05FWEUrTUF5bjlXREFQU0ZmUWxX?=
 =?utf-8?B?YjZnKzRKNGtBTmRYZlU4eGtmTXN5T1NMVUdiUHY1TS93ejA2cDVidTl1Mm43?=
 =?utf-8?B?UGQyVC9nYU45N2JFcm0vbkpCZ0Z6SElYalpUOU02MldwSHBFMTN1VTRGNGxs?=
 =?utf-8?B?S2VGSjNkSVhVZXFQTXZQVWYvQ0lwa1oxRlNQalI1SDhRalduTms1TWFKTTlu?=
 =?utf-8?B?YStOcHdUU1lJVHNjRXBQQUt5Z3dyckNzS2pjRGtFYk1QRTJZQU50T3FHbGNO?=
 =?utf-8?Q?S16vCsGXmfmZNDxv5k4HZOrARQhjAYA7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6636.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlZiclFoOGNwQnRiUGdPZEZPK3dTUi81L2pRZ3VDTC8xUEZGTnYwbndXNUV5?=
 =?utf-8?B?RmhuQkhJNk4wVzhXeml6VFRja08rdEt4Qk8xeGNxUTBtYkpGQ1NyREtPeW5N?=
 =?utf-8?B?a042b0J5YndOWTh2VlNKWStjRzd4UFlBU2VpemZSdE4zNkMyR3RtZTVBQ2tq?=
 =?utf-8?B?MTdMYnVtVTl6NDZWZmM1M3B5MkQ1dkpNN2xSL0ZvYjRETitkV3JTZVdialAz?=
 =?utf-8?B?SjRGNnh5bmU5blk3UXdTTFFVZ1hpRVA3WTdCK3hxNHE3TGZtdG9UMkFRZVI5?=
 =?utf-8?B?MVJnem54U2x5YlUwd3hMWk1IS1JoYnplVER2TG0yWXhUUW9qd0tGNXg4UGlN?=
 =?utf-8?B?RlJrSXc2clV2bEo3d0hzRElvSVp1QUw1bUQ0dFRvMXRPNStaekpDNkJQL0RD?=
 =?utf-8?B?Mkk5WWl4SDF4THpDUXFlTVN3aGZZTTZvcVozYmxVbHFOK0FJNWpXSThiaWxv?=
 =?utf-8?B?dHlMaXhKZ0FtL0FhYUQ0VG1BQy9oMW1pZmZzdzI2aitxNGNTMVVzQythRkZQ?=
 =?utf-8?B?L0ZjeXhSTWFlM2l1VzZ4MUFwS1FhK0VocEw5Y3ZZZ2YxYTRQdHVObGpqUHlJ?=
 =?utf-8?B?eWpBd2FOUjUydm1EU1Z2T1N4SkhDVXBJelFNeTN0ZE1RQy8zZ2p3WjBlTit3?=
 =?utf-8?B?MXBmdlZoT2NEWDd2TThmUVdubjlFRDNSQTUzbCtVWW9HdHd5NzVkWnVSZDQ5?=
 =?utf-8?B?cnVxYVdrT1lSQnpWRXlDeUVaRHBxZWdwRHRraHJCMkZMUUJEOFBLOXFGNWxV?=
 =?utf-8?B?aTFnUFFIRlNaRjVRd0RRR1JXaC9lMFl5b0ZjMDFlZVg0UUdVZmVLQlV2bjg0?=
 =?utf-8?B?OUlXVk1aUW1GdTAwT3JRNWMyZ2NKRlBmZ3kzSG9EWWVmY1ZzSWpXOTd5dmU2?=
 =?utf-8?B?Z3Rtdk1jZCsrT2RKWUprbndScElmZ205VWFERXFqRHo5L2hWVHZHM3dhd2d6?=
 =?utf-8?B?OXlpeVM2NGdqVWlzWWRjVlNhMnhsdlFBRzlZVUlPaGlIWm9nSEtYZVEwTmxs?=
 =?utf-8?B?UmMvUlVnTEZXdFB3SFpnbitmNkErZktWUmFVM0lrakZFVER1bnZUVEp0R1JB?=
 =?utf-8?B?eCtrTTFrVVFCaHRtZGw1ZXdOSFExZWd5cWNaY3BwZzhRdExLSGNWS0FqeEpi?=
 =?utf-8?B?aHEzME16MXBubG52UlhZTHVpTTM1MjRaK0hXV3FWcDJkcUwvMENjU242YU1K?=
 =?utf-8?B?akVsYzNzaGgwY3VVME5la1BnUW9EdjZlYlhTQ1gvdEtuenFJTGJ4NkRoSjFn?=
 =?utf-8?B?eEZKVGozQ1N3YkkxK0NtYnB4azUxU3E2RWR0WDUyb0V6b3J1TEZnSG15ODgy?=
 =?utf-8?B?WDJXcVdsaTlzaEdvbTNCQ1p1ZUdNdFJ1RmhLa0pIWlQ0S3FWbSs3bmdQVW5a?=
 =?utf-8?B?UU51Ny9nTjZHWjZPamsrUUlGNmNiRjNYMDhPSFprRFZhRFFXWU4zd2ZsNERJ?=
 =?utf-8?B?eFZmcm95Ti9mY3VyL29iQ2VIWlRoYzFnc0hVeS9pVDRodWI4eEdaSU1ZRUlB?=
 =?utf-8?B?TTRNemUxTVdwR21PbloyUnBZdWV1ZEp5RklqVXZQTTgzbnRuQXJFSjNEeEZR?=
 =?utf-8?B?TGRjQzJKM1hsakpGazRZaGh3ejZnTndRejdYd3BaVTJqU1VXS2xEVFc5VnB2?=
 =?utf-8?B?VkJFOFNFb0g2bWxCODlORllTczhCSzMyS2k0VVVHeW9nNjFWcUYwVmxlTEJN?=
 =?utf-8?B?NzE2NUlPbktWcUhlbEppOU9kNjBUVG9JbFRGWDJac29iMnBwN29xcFQ0UWx5?=
 =?utf-8?B?bDA3L2dkUDRvN1hNZTRhaGNCMHB3dWNEa1JiUkU4Vk9Tby9yUEJHN2lJV2Nr?=
 =?utf-8?B?VTRrb1hxOGlqN1Z3RkJ2ak94QTl6aExsYU1VWHYxWm0xbGR4d00rUjV3cGFm?=
 =?utf-8?B?bXFNU3RGSk41aXJZS3hyYk9BenBCQmVBR1NVS2o5WU5CbDRnQUNzMngxdmJl?=
 =?utf-8?B?UENLNGFyWVl5UlVZR1NyeG1FMllXY25zY0trYW9qM0dtOTB1aHdWUSthYk9K?=
 =?utf-8?B?Y3BuU3d0WDl3a013RnhNM1NiRDhPY1lPc3VwREZnVm1SNy9KK1F3N1B0eXpP?=
 =?utf-8?B?dnJiZEJkazUxQWVHTm9VQ1hmTTFqOWxkd0h2bVBpZGlGMWU1OW1tTEFQS3Fl?=
 =?utf-8?B?MlN1SFVlamMyWHBpQTJDN3JZTEM5eW5wN2dQTTgzTXlhMS8xYmNlbWVGczZ6?=
 =?utf-8?B?V3c9PQ==?=
Content-ID: <5DDC614B4975D848AC28AFF5B2CD9829@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65faf57-ab85-4df0-175e-08dd4a7555e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 08:23:16.8755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uut6DiLUtkjnvQCN5AVTg/rbu4ShWFD4hnz744yYRxTZZhaH6QMn2+1dulaprEGiQQRWtPU4YB9FAHBwxZomSfOMPVbsVa03km6Ay3EW+YM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6970
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1025934294.717032447"
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

--__=_Part_Boundary_008_1025934294.717032447
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gU2F0LCAyMDI1LTAxLTE4IGF0IDA5OjM3ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiANCj4gPiANCj4gPiAoMilQcmltYXJ5IFRhc2sgb2YgRVhETUE6DQo+ID4gVGhlIG1h
aW4gZnVuY3Rpb24gb2YgRVhETUEgaXMgdG8gdHJhbnNmZXIgYnVmZmVycyBhbGxvY2F0ZWQgYnkg
R0VNDQo+ID4gdG8NCj4gPiB0aGUgc3Vic2VxdWVudCBkaXNwbGF5IHBpcGVsaW5lLg0KPiA+IEVY
RE1BIHNlcnZlcyBhcyBhIGJyaWRnZSBiZXR3ZWVuIG1lbW9yeSBhbGxvY2F0ZWQgYnkgR0VNIGFu
ZCB0aGUNCj4gPiBkaXNwbGF5IGNvbXBvbmVudHMsIHJhdGhlciB0aGFuIGFjdGluZyBhcyBhIGdl
bmVyYWwtcHVycG9zZSBETUENCj4gPiBlbmdpbmUuDQo+ID4gQmFzZWQgb24gdGhlIHBvaW50cyBh
Ym92ZSwgd2UgaGF2ZSBkZWNpZGVkIHRvIHBsYWNlIHRoZSBFWERNQQ0KPiA+IGRyaXZlcg0KPiA+
IHVuZGVyIHRoZSBEUk0gZGlzcGxheSBzdWJzeXN0ZW0gcmF0aGVyIHRoYW4gdW5kZXIgdGhlIERN
QQ0KPiA+IHN1YnN5c3RlbS4NCj4gDQo+IA0KPiBJIGRvbid0IGNhcmUgaWYgaXQgdXNlcyBHRU0g
b3Iga2VybmVsIGFsbG9jYXRvciBvciBldmVuIDNyZCBwYXJ0eQ0KPiBhbGxvY2F0b3IuIFRoZSBx
dWVzdGlvbiBpczogd2hhdCBpcyB0aGlzIGRldmljZT8gSWYgaXQgaXMgcGVyZm9ybWluZw0KPiBE
TUEsIHRoZW4gaXQgc2hvdWxkIGJlIHBsYWNlZCBpbiAiZG1hIiBkaXJlY3RvcnkuIFRoZSByZG1h
IHdhcyBwbGFjZWQNCj4gZGlmZmVyZW50bHkgYnV0IGFzIHlvdSBjYW4gZWFzaWx5IGNoZWNrOiBp
dCB3YXMgbmV2ZXIgYWNrZWQvcmV2aWV3ZWQsDQo+IHNvDQo+IGRvbid0IHVzZSBpdCBhcyBhbiBl
eGFtcGxlLg0KPiANCj4gT2YgY291cnNlIGlmIGl0IGRvZXMgbm90IHBlcmZvcm0gRE1BLCB0aGVu
IGl0IHNob3VsZCBub3QgYmUgaW4gZG1hLA0KPiBidXQNCj4gdGhlbiBJIGRvbid0IGFncmVlIG9u
IHVzaW5nIGRtYS1jZWxscyBoZXJlIGFuZCBhbnl0aGluZyBsaWtlIHRoYXQgaW4NCj4gdGhlDQo+
IGRyaXZlci4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KPiANCj4gDQoN
CkhpIEtLLA0KDQpTb3JyeSwgSSBqdXN0IGZvdW5kIHRoaXMgZW1haWwgd2FzIG5vdCBzZW5kLiAN
Cg0KVGhpcyBlbWFpbCBpcyBkaXNjdXNzIGFib3V0IHRoZSBFWERNQSB1bmRlciB0aGUgZGlzcGxh
eSBzdWJzeXN0ZW0NCg0KVGhlIGN1cnJlbnQgcGxhY2VtZW50IG9mIEVYRE1BIHVuZGVyIHRoZSBk
aXNwbGF5IHN1YnN5c3RlbSBpbg0KTWVkaWF0ZWsncyBhcmNoaXRlY3R1cmUgaXMgcHJpbWFyaWx5
IGR1ZSB0byBpdHMgZnVuY3Rpb25hbCByb2xlIGFzIGENCnN1Yi1kZXZpY2Ugd2l0aGluIHRoZSBk
aXNwbGF5IHBpcGVsaW5lLg0KIA0KSW4gTVQ4MTk2IGhhcmR3YXJlIGRlc2lnbiwgdGhlIHN1Yi1k
ZXZpY2VzIGluIGRpc3BsYXkgcGlwZWxpbmUgZm9sbG93IGENCnNlcXVlbmNlIG9mOiBFWERNQSAt
PiBCTEVOREVSIC0+IE9VVFBST0MgLT4gUFEgLT4gRFZPLg0KIA0KSW4gTVQ4MTk1IGhhcmR3YXJl
IGRlc2lnbiwgdGhlIHN1Yi1kZXZpY2VzIGluIGRpc3BsYXkgcGlwZWxpbmUgZm9sbG93IGENCnNl
cXVlbmNlIG9mOiBPVkwgLT4gUFEgLT5EU0kuDQogDQpBcyB3ZSBzZWUsIE9WTCBoYXMgYmVlbiBk
aXZpZGVkIGludG8gdGhyZWUgbmV3IGhhcmR3YXJlIElQcyBpbiBNVDgxOTYuDQpPVkwgYW5kIEVY
RE1BIGJvdGggaGF2ZSB0aGUgYWJpbGl0eSB0byBmZXRjaCBkYXRhIGRpcmVjdGx5IGZyb20gRFJB
TQ0KYW5kIGNhbiBiZSByZWdhcmRlZCBhcyBETUEgY29udHJvbGxlci4NCiANCkkgYWxzbyBoYXZl
IGNvbmZpcm1lZCB3aXRoIHRoZSBoYXJkd2FyZSBkZXNpZ25lciB0aGF0IEVYRE1BIGlzIGEga2lu
ZA0Kb2YgRE1BLCBidXQgaXQgaXMgc3BlY2lhbGx5IGRlc2lnbmVkIHRvIGhhbmRsZSB0aGUgZ3Jh
cGhpY2FsIGxheWVyLCBhbmQNCmhhcyBiZXR0ZXIgcGVyZm9ybWFuY2UgdGhhbiBvcmRpbmFyeSBE
TUEuDQogDQpUaGVyZWZvcmUsIEkgdGhpbmsgdGhhdCBtb3ZpbmcgRVhETUEgYW5kIE9WTCBmcm9t
IHRoZSBkaXNwbGF5IGZvbGRlciB0bw0KdGhlIERNQSBmb2xkZXIsIG9yIG9ubHkga2VwcGluZyB0
aGVtIGluIHRoZSBkaXNwbGF5IGZvbGRlciBpcyBkZWNpZGVkDQpieSB0aGUgdHdvIGRpZmZlcmVu
dCB2aWV3cyBvZiBETUEgYWJpbGl0eSBvciBkaXNwbGF5IHN1Yi1kZXZpY2UuDQogDQpXZSB3aWxs
IGZvbGxvdyB5b3VyIGluc3RydWN0aW9ucyB0byBwdXQgRVhETUEgb24gdGhlIHBsYWNlIHlvdSBk
ZWNpZGVkLg0KDQoNCkJlc3QsIFBhdWwgDQoNCg==

--__=_Part_Boundary_008_1025934294.717032447
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1NhdCwmIzMyOzIwMjUtMDEtMTgmIzMyO2F0
JiMzMjswOTozNyYjMzI7KzAxMDAsJiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7KDIp
UHJpbWFyeSYjMzI7VGFzayYjMzI7b2YmIzMyO0VYRE1BOg0KJmd0OyYjMzI7Jmd0OyYjMzI7VGhl
JiMzMjttYWluJiMzMjtmdW5jdGlvbiYjMzI7b2YmIzMyO0VYRE1BJiMzMjtpcyYjMzI7dG8mIzMy
O3RyYW5zZmVyJiMzMjtidWZmZXJzJiMzMjthbGxvY2F0ZWQmIzMyO2J5JiMzMjtHRU0NCiZndDsm
IzMyOyZndDsmIzMyO3RvDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt0aGUmIzMyO3N1YnNlcXVlbnQmIzMy
O2Rpc3BsYXkmIzMyO3BpcGVsaW5lLg0KJmd0OyYjMzI7Jmd0OyYjMzI7RVhETUEmIzMyO3NlcnZl
cyYjMzI7YXMmIzMyO2EmIzMyO2JyaWRnZSYjMzI7YmV0d2VlbiYjMzI7bWVtb3J5JiMzMjthbGxv
Y2F0ZWQmIzMyO2J5JiMzMjtHRU0mIzMyO2FuZCYjMzI7dGhlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtk
aXNwbGF5JiMzMjtjb21wb25lbnRzLCYjMzI7cmF0aGVyJiMzMjt0aGFuJiMzMjthY3RpbmcmIzMy
O2FzJiMzMjthJiMzMjtnZW5lcmFsLXB1cnBvc2UmIzMyO0RNQQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
ZW5naW5lLg0KJmd0OyYjMzI7Jmd0OyYjMzI7QmFzZWQmIzMyO29uJiMzMjt0aGUmIzMyO3BvaW50
cyYjMzI7YWJvdmUsJiMzMjt3ZSYjMzI7aGF2ZSYjMzI7ZGVjaWRlZCYjMzI7dG8mIzMyO3BsYWNl
JiMzMjt0aGUmIzMyO0VYRE1BDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkcml2ZXINCiZndDsmIzMyOyZn
dDsmIzMyO3VuZGVyJiMzMjt0aGUmIzMyO0RSTSYjMzI7ZGlzcGxheSYjMzI7c3Vic3lzdGVtJiMz
MjtyYXRoZXImIzMyO3RoYW4mIzMyO3VuZGVyJiMzMjt0aGUmIzMyO0RNQQ0KJmd0OyYjMzI7Jmd0
OyYjMzI7c3Vic3lzdGVtLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0kmIzMyO2Rv
biYjMzk7dCYjMzI7Y2FyZSYjMzI7aWYmIzMyO2l0JiMzMjt1c2VzJiMzMjtHRU0mIzMyO29yJiMz
MjtrZXJuZWwmIzMyO2FsbG9jYXRvciYjMzI7b3ImIzMyO2V2ZW4mIzMyOzNyZCYjMzI7cGFydHkN
CiZndDsmIzMyO2FsbG9jYXRvci4mIzMyO1RoZSYjMzI7cXVlc3Rpb24mIzMyO2lzOiYjMzI7d2hh
dCYjMzI7aXMmIzMyO3RoaXMmIzMyO2RldmljZSYjNjM7JiMzMjtJZiYjMzI7aXQmIzMyO2lzJiMz
MjtwZXJmb3JtaW5nDQomZ3Q7JiMzMjtETUEsJiMzMjt0aGVuJiMzMjtpdCYjMzI7c2hvdWxkJiMz
MjtiZSYjMzI7cGxhY2VkJiMzMjtpbiYjMzI7JnF1b3Q7ZG1hJnF1b3Q7JiMzMjtkaXJlY3Rvcnku
JiMzMjtUaGUmIzMyO3JkbWEmIzMyO3dhcyYjMzI7cGxhY2VkDQomZ3Q7JiMzMjtkaWZmZXJlbnRs
eSYjMzI7YnV0JiMzMjthcyYjMzI7eW91JiMzMjtjYW4mIzMyO2Vhc2lseSYjMzI7Y2hlY2s6JiMz
MjtpdCYjMzI7d2FzJiMzMjtuZXZlciYjMzI7YWNrZWQvcmV2aWV3ZWQsDQomZ3Q7JiMzMjtzbw0K
Jmd0OyYjMzI7ZG9uJiMzOTt0JiMzMjt1c2UmIzMyO2l0JiMzMjthcyYjMzI7YW4mIzMyO2V4YW1w
bGUuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO09mJiMzMjtjb3Vyc2UmIzMyO2lmJiMzMjtpdCYjMzI7
ZG9lcyYjMzI7bm90JiMzMjtwZXJmb3JtJiMzMjtETUEsJiMzMjt0aGVuJiMzMjtpdCYjMzI7c2hv
dWxkJiMzMjtub3QmIzMyO2JlJiMzMjtpbiYjMzI7ZG1hLA0KJmd0OyYjMzI7YnV0DQomZ3Q7JiMz
Mjt0aGVuJiMzMjtJJiMzMjtkb24mIzM5O3QmIzMyO2FncmVlJiMzMjtvbiYjMzI7dXNpbmcmIzMy
O2RtYS1jZWxscyYjMzI7aGVyZSYjMzI7YW5kJiMzMjthbnl0aGluZyYjMzI7bGlrZSYjMzI7dGhh
dCYjMzI7aW4NCiZndDsmIzMyO3RoZQ0KJmd0OyYjMzI7ZHJpdmVyLg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtCZXN0JiMzMjtyZWdhcmRzLA0KJmd0OyYjMzI7S3J6eXN6dG9mDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7DQoNCkhpJiMzMjtLSywNCg0KU29ycnksJiMzMjtJJiMzMjtqdXN0
JiMzMjtmb3VuZCYjMzI7dGhpcyYjMzI7ZW1haWwmIzMyO3dhcyYjMzI7bm90JiMzMjtzZW5kLiYj
MzI7DQoNClRoaXMmIzMyO2VtYWlsJiMzMjtpcyYjMzI7ZGlzY3VzcyYjMzI7YWJvdXQmIzMyO3Ro
ZSYjMzI7RVhETUEmIzMyO3VuZGVyJiMzMjt0aGUmIzMyO2Rpc3BsYXkmIzMyO3N1YnN5c3RlbQ0K
DQpUaGUmIzMyO2N1cnJlbnQmIzMyO3BsYWNlbWVudCYjMzI7b2YmIzMyO0VYRE1BJiMzMjt1bmRl
ciYjMzI7dGhlJiMzMjtkaXNwbGF5JiMzMjtzdWJzeXN0ZW0mIzMyO2luDQpNZWRpYXRlayYjMzk7
cyYjMzI7YXJjaGl0ZWN0dXJlJiMzMjtpcyYjMzI7cHJpbWFyaWx5JiMzMjtkdWUmIzMyO3RvJiMz
MjtpdHMmIzMyO2Z1bmN0aW9uYWwmIzMyO3JvbGUmIzMyO2FzJiMzMjthDQpzdWItZGV2aWNlJiMz
Mjt3aXRoaW4mIzMyO3RoZSYjMzI7ZGlzcGxheSYjMzI7cGlwZWxpbmUuDQomIzMyOw0KSW4mIzMy
O01UODE5NiYjMzI7aGFyZHdhcmUmIzMyO2Rlc2lnbiwmIzMyO3RoZSYjMzI7c3ViLWRldmljZXMm
IzMyO2luJiMzMjtkaXNwbGF5JiMzMjtwaXBlbGluZSYjMzI7Zm9sbG93JiMzMjthDQpzZXF1ZW5j
ZSYjMzI7b2Y6JiMzMjtFWERNQSYjMzI7LSZndDsmIzMyO0JMRU5ERVImIzMyOy0mZ3Q7JiMzMjtP
VVRQUk9DJiMzMjstJmd0OyYjMzI7UFEmIzMyOy0mZ3Q7JiMzMjtEVk8uDQomIzMyOw0KSW4mIzMy
O01UODE5NSYjMzI7aGFyZHdhcmUmIzMyO2Rlc2lnbiwmIzMyO3RoZSYjMzI7c3ViLWRldmljZXMm
IzMyO2luJiMzMjtkaXNwbGF5JiMzMjtwaXBlbGluZSYjMzI7Zm9sbG93JiMzMjthDQpzZXF1ZW5j
ZSYjMzI7b2Y6JiMzMjtPVkwmIzMyOy0mZ3Q7JiMzMjtQUSYjMzI7LSZndDtEU0kuDQomIzMyOw0K
QXMmIzMyO3dlJiMzMjtzZWUsJiMzMjtPVkwmIzMyO2hhcyYjMzI7YmVlbiYjMzI7ZGl2aWRlZCYj
MzI7aW50byYjMzI7dGhyZWUmIzMyO25ldyYjMzI7aGFyZHdhcmUmIzMyO0lQcyYjMzI7aW4mIzMy
O01UODE5Ni4NCk9WTCYjMzI7YW5kJiMzMjtFWERNQSYjMzI7Ym90aCYjMzI7aGF2ZSYjMzI7dGhl
JiMzMjthYmlsaXR5JiMzMjt0byYjMzI7ZmV0Y2gmIzMyO2RhdGEmIzMyO2RpcmVjdGx5JiMzMjtm
cm9tJiMzMjtEUkFNDQphbmQmIzMyO2NhbiYjMzI7YmUmIzMyO3JlZ2FyZGVkJiMzMjthcyYjMzI7
RE1BJiMzMjtjb250cm9sbGVyLg0KJiMzMjsNCkkmIzMyO2Fsc28mIzMyO2hhdmUmIzMyO2NvbmZp
cm1lZCYjMzI7d2l0aCYjMzI7dGhlJiMzMjtoYXJkd2FyZSYjMzI7ZGVzaWduZXImIzMyO3RoYXQm
IzMyO0VYRE1BJiMzMjtpcyYjMzI7YSYjMzI7a2luZA0Kb2YmIzMyO0RNQSwmIzMyO2J1dCYjMzI7
aXQmIzMyO2lzJiMzMjtzcGVjaWFsbHkmIzMyO2Rlc2lnbmVkJiMzMjt0byYjMzI7aGFuZGxlJiMz
Mjt0aGUmIzMyO2dyYXBoaWNhbCYjMzI7bGF5ZXIsJiMzMjthbmQNCmhhcyYjMzI7YmV0dGVyJiMz
MjtwZXJmb3JtYW5jZSYjMzI7dGhhbiYjMzI7b3JkaW5hcnkmIzMyO0RNQS4NCiYjMzI7DQpUaGVy
ZWZvcmUsJiMzMjtJJiMzMjt0aGluayYjMzI7dGhhdCYjMzI7bW92aW5nJiMzMjtFWERNQSYjMzI7
YW5kJiMzMjtPVkwmIzMyO2Zyb20mIzMyO3RoZSYjMzI7ZGlzcGxheSYjMzI7Zm9sZGVyJiMzMjt0
bw0KdGhlJiMzMjtETUEmIzMyO2ZvbGRlciwmIzMyO29yJiMzMjtvbmx5JiMzMjtrZXBwaW5nJiMz
Mjt0aGVtJiMzMjtpbiYjMzI7dGhlJiMzMjtkaXNwbGF5JiMzMjtmb2xkZXImIzMyO2lzJiMzMjtk
ZWNpZGVkDQpieSYjMzI7dGhlJiMzMjt0d28mIzMyO2RpZmZlcmVudCYjMzI7dmlld3MmIzMyO29m
JiMzMjtETUEmIzMyO2FiaWxpdHkmIzMyO29yJiMzMjtkaXNwbGF5JiMzMjtzdWItZGV2aWNlLg0K
JiMzMjsNCldlJiMzMjt3aWxsJiMzMjtmb2xsb3cmIzMyO3lvdXImIzMyO2luc3RydWN0aW9ucyYj
MzI7dG8mIzMyO3B1dCYjMzI7RVhETUEmIzMyO29uJiMzMjt0aGUmIzMyO3BsYWNlJiMzMjt5b3Um
IzMyO2RlY2lkZWQuDQoNCg0KQmVzdCwmIzMyO1BhdWwmIzMyOw0KDQoNCjwvcHJlPg0KPC9wPjwv
Ym9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1F
RElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBp
bmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFu
eSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmls
ZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2Fi
bGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNp
Z25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRp
b24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4g
aW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3Ug
aGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2Vu
ZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFu
eSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1l
bnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBv
ZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0t
fS0tPg==

--__=_Part_Boundary_008_1025934294.717032447--


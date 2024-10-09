Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF43995D0A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 03:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1409310E270;
	Wed,  9 Oct 2024 01:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="FVA1YDZw";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="mM5p88/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09F910E270
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 01:33:11 +0000 (UTC)
X-UUID: 6f0c09c685de11ef88ecadb115cee93b-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=F/NR4l+cinM4Vu8qYPO/5Gx0NFZCLKPn2DfRWRT2O+c=; 
 b=FVA1YDZwnEwxB2D3dPJX04WnPlAS5TSyyLfakflZ1GR84r0J737gcX7pYcHx/IUUs9oW7Gz36roSFu0hA831B23DeQiH9w5iN+Tl1Dc/3NjLu2OPn4X88NtHm/BqSBWTSEOjBuEnGWVD1j7r1CYRxFLiWcxYFhJ0fdU1nZeKdZw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:e76e57ea-5ddb-4321-98e8-56df53bcfce2, IP:0,
 U
 RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:1
X-CID-META: VersionHash:6dc6a47, CLOUDID:fa03f564-444a-4b47-a99a-591ade3b04b2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6f0c09c685de11ef88ecadb115cee93b-20241009
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1938023822; Wed, 09 Oct 2024 09:33:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 09:33:04 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 09:33:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wessXaPO26FllazGlFqvkdgJ1IJWefsMIaRKBHk5pQJkMGXKZ532kaNOSsG4kfa2xyuvrdDw8BJxHOvVYOHr5IV3+tLaR9GBk53ACNAGajOwjCbeP2AQ5hIahGYAW9ua4ooRBaIkAWFzXwolzgZlmFm7xXoqSty9J1qLC2AB6duEwipy0Jd/WdhhEjMZ80VcvsSCB1FgKqwqgHQkPxAfBLuoLbQ2S7yXBrpLXAgxSPYN9ZQFyDxGRV/ZpKVPF60z9f/aCgNlcHvNy9Vy2Qaaq4VV3M/Bi94BHyS0xrN9d9/PfzaHpL22GAa9/O2UCzcfUPDlE3IPuK/7RGuuBmxTiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8ckNvWyjcYn3heee0i1hmz0fSQDBlIrHL9qs/eFqXQ=;
 b=U6FknUi9Hr9/Q1IQuqEIi7qH2vvJTuj5FCJ68P/wt0hRzWXv6AIPsDZ/4GkfjZpWimCOy4eJQrV0MVab6+ZgFyQeJJxQH6GOquGgyJcIH3VFvuHHn8xXDz2DeBD9vrmUORkV5PUPmF3blZl/anq2h/YG6YkgwWszAX+xVC0Hk/4I7UF5hroTgsNLYtjVAiGymsr8YR2z820djuw9y1/OMgauc2Aj86OfOcC6etA/O4AlnXwCHpGLPIA142Vkx5PBoyOMbRUiJKjsRSNJrB7hnOHBb5pXFsUbEkzLzWLnD5lUYWypsHthMU8wFFttWhNGla7gpP3zYhjIvmdJjScRwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8ckNvWyjcYn3heee0i1hmz0fSQDBlIrHL9qs/eFqXQ=;
 b=mM5p88/Gl19NsoK+xgJlgbNnH6II/HGXa8AptZ2KGaYOZb/g79apWma3an7WQzZCy2AUVin13pywGFoUtCM2n1+EsKm9xNrbWpsF/wNBXAgKdQUCP6mDBA/ditUx9dQeN5QLq0I1pTVNrif56c+q2vXorkhpF+5hQVjcTOwlMkw=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB7704.apcprd03.prod.outlook.com (2603:1096:101:12b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 01:33:01 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 01:33:01 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "Markus.Elfring@web.de"
 <Markus.Elfring@web.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "me@adamthiede.com"
 <me@adamthiede.com>, "yassine.oudjana@gmail.com" <yassine.oudjana@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
Subject: Re: [PATCH v10 0/5] Fix degradation problem of alpha blending series
Thread-Topic: [PATCH v10 0/5] Fix degradation problem of alpha blending series
Thread-Index: AQHbGU3u+xecq+b7rEiLwWPa0B6a77J8dgMAgAEttgA=
Date: Wed, 9 Oct 2024 01:33:01 +0000
Message-ID: <cb02c430b569c39eb2deafd009f1f74f9d342a2f.camel@mediatek.com>
References: <20241008064716.14670-1-jason-jh.lin@mediatek.com>
 <0379b3a3-9ab0-4b08-adff-59fc8ff98844@web.de>
In-Reply-To: <0379b3a3-9ab0-4b08-adff-59fc8ff98844@web.de>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB7704:EE_
x-ms-office365-filtering-correlation-id: 5df29ac6-7264-4a74-dfad-08dce8025030
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?V2hHRFpHU0RHM0pIbkl4cUpoRXNyRjBhak1mTHViSWsydVgweE1LQXE2cWQ3?=
 =?utf-8?B?cHZRYVpkVFJpcnBGTHBZZ0pRaTZkSkE1QkNQMkRLalVxYVlIdFp1UllUMXJE?=
 =?utf-8?B?L0gxZCtEdlQvZDluOU9pTHNpZERBTGJQWEhQckNlU2VHdTRaMmVwY09EZXln?=
 =?utf-8?B?c2tZWVZ3NW5idkkvTk5yb1JicFRxVTNON0ZoRC9LelZvVTFlbmtpemg5Wm9X?=
 =?utf-8?B?bnBTUTRTQi9lM2JHemF5Q3ljYmVFem9XOHVEL085bGw2SDlOaENCQ0ZQRUlo?=
 =?utf-8?B?cHdWbUdSVEtYRVlkclBDQ2xFVGFOZmwzNmlxeStuY1FwQ3haV2pwWGZkN3F1?=
 =?utf-8?B?a3ZQR3phakdrRFNtbHl3VlJWL0JGekJhZW14UXU0Yktzc08yVU14T2trQ0la?=
 =?utf-8?B?a0NDbjFUcC96UDRqZ3VMVXBSSjZCRnQ2WUd0dXptTUZ6bEdISmlDb2M0OCtI?=
 =?utf-8?B?RDBVN2RPelhOaDhWU1B1aWtRZHJHaVZUdWtmaWpMWXEyQmNPQy9COE5pc2dU?=
 =?utf-8?B?YmZhM3Z3b3M3a0NmSUN6UENnNmlkS2lwRGUvOGMrUGxwMllrUnY4akEyWGdC?=
 =?utf-8?B?NlpFN1JmVHBQTmx1YjA5UlJZcnNTb0FCWVBnNVZreGRhdGY0Q29GNWZ2TGhP?=
 =?utf-8?B?OTB3OEJ2L0Q0QmFpUjgzdnV6OXR2ZzdJZUJTaDBMdEd6K0Qra0x4VFRWRVNK?=
 =?utf-8?B?aWlKNGc3M05mZ1g2RlNQUGpSUzJ5Z3lGOWZpR25GekZCaDZHSFlEVzNraXZX?=
 =?utf-8?B?d1VVYUplcmJBMG9CSUI5NWRuMFNiSm9lTDFVem94NzlWbWlFSWtZODVFTlBp?=
 =?utf-8?B?Qkw4eVdkZS9NUUl6WDRHeHphUnMzV0RZYzRiT3ZMOXVjZmhxdFRYTlhtNE1B?=
 =?utf-8?B?Z3piNjhuUVB6NmJ6bzZjQmxHUlhRdHFSVlBxeFhNbGk4QS8zc0dPRG9GS04v?=
 =?utf-8?B?VHUyRENFamVpeHdpY3VTbEMzNVN1VHRvQjErbklKWlFERmNNVS90WHFKSEpE?=
 =?utf-8?B?VUZ6SDIyRFcvWUdaYjkrZ0tQN2hubVUvbiszVElvcW9WV1Rzb3YxUDMyajJ1?=
 =?utf-8?B?U00ySE9SM25xMk9Uc05vNVlKcFZrRi9xWXhRbGxOa1JtSTZZS0NvNi9tbzk3?=
 =?utf-8?B?ODlBb0pXOVhWS1JpSDEybGN5MCtiTmkwd1FDVVhuck1xZjBLNXpodmFIMFRK?=
 =?utf-8?B?TmliQStUNEpRM0ZWTXd3dlJTTjluMDVkakVUM21kZjRBQnkybUlzSmZVYkg2?=
 =?utf-8?B?dHRFMkRaSGRlc0hKbzhFRkdBSGZBMUR5MVZLd0VYN0xNRWZEOTliN2ZlM1A1?=
 =?utf-8?B?aklDNzc1N0huaHJjUFlqR0wyR0VDa2ZYWHJnVUVJSXR6elQ3SUFhNUpyOHQy?=
 =?utf-8?B?aS9TV25GOVpBTGM5WXhsRy9pWFREVTlUamFLUGVlb09FbjJkRGpGZjJPWHNM?=
 =?utf-8?B?OExOVTE5VmpJT1pvRmlUT05sOEhNaUZBd281TmN5dXpVdXNESTEvM1hkbkpW?=
 =?utf-8?B?RDducnJpb3BUSmo2Wm1lSXE2YStNbnV3K2RKUGRNWUFSTnQ1cXhibTdBLzBQ?=
 =?utf-8?B?djFDdldXT2c2TXdUdTAzN2UxUHFkUWROYTh1MU54dGJpaUNCbVZrRWpxb0pn?=
 =?utf-8?B?ZGJoYkIvbUlnRThrZWlmdGxWRk1hTkF2TGt2Sm54MVF2MVYrOGh3WHIwbjlo?=
 =?utf-8?B?MFB5QmtkTVNpRGU1NVY4a1dqNVJkdVZhNVB6WXhuQTJ4c0M2eFovY2JLZTM3?=
 =?utf-8?B?ZVBkbFVEZTdXdWJ1ZkxwOC9nR1NJN1RHejBTcEQ2V3h6aFlGUFRNbmJhOGpp?=
 =?utf-8?B?TU5xTWduUmJiWklEZUIzZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEk5SUltcDEzeUpFbU5NQTBKcC9IUVNYV0VzUTNDWXMrTk9HTzVIVXg4RE01?=
 =?utf-8?B?RWpUQ1pxZjZXTTdiSFFGcXRnQzIvT3dnZVNpZjdHdGk1WW4rV1hWVmZ0bGVI?=
 =?utf-8?B?cDVtUFpVRFRyemYyUFRBczFPMGtzVmJJM2NSODdtRXozRWtBSWZwZU85UUc3?=
 =?utf-8?B?Mk05MFJjTGpKb29UbmcwWmVoYnBMQWQxNjRsTXJQQ2V6eTNWWDUxb1ArWXJ0?=
 =?utf-8?B?QmQvaSsvZHRCcFAyQ1lsc253dlFVSkZTRml2VlVDeVhWOU4vS3RObzEwRnAy?=
 =?utf-8?B?bjRqNlozV3FucG9la2pMdEw2cjdXaXR1RzIvQXhYZklVRldOVEtCT3ZZY2cw?=
 =?utf-8?B?bG5oTGZZQ1hmVzBVVkFNcWxkYnJkbDZTWkh0SUswZzFkWlZTN3JWU3Mwdldl?=
 =?utf-8?B?eXYrRGtveUlyd0FtWkR0MzVDME55UXVISjJZYno1T1hvRXhqNm9yU0Zjb0hJ?=
 =?utf-8?B?R0E0QkIzcVk2SWpPbmF3VWZwZW04bEZUeDRjbmg5bDRlZ2ZkVEgzbFpzZkZv?=
 =?utf-8?B?eXIwZWkyV0tUMGtqd0ljWGZTSm9lRWVyR2o2V3BUTys0WU44MWhhTXpTUTF4?=
 =?utf-8?B?WVF6bGg5dHZPaWRvKzdqbXJGdWRQM2J6eUVYTGY0TVE2MGwzNkY0cElZa3Ux?=
 =?utf-8?B?V3Iva1p1QW80cTJJUk56emN0WDB4VWdWU3BlaU90MlI5L0hkNkJoZVRQby9o?=
 =?utf-8?B?UTU3dkFOY3ppSm1OaHNqY3gxalRGcGs1RFp3eXZEd3VrTitDZjgzUVNIVlFa?=
 =?utf-8?B?cHNZT0ZzbHZuS2pPdlkwajdSVGtxRkc0YVV1a2srZDRPeSt4eSt0VmNhN3ZB?=
 =?utf-8?B?a0FWR1hEdzJOdjRLSzdLYmhrZTdYQzhZbm9yU0VvR3ZiTTdYdVdXTSs5Znhs?=
 =?utf-8?B?ZU10b0N2Ym53dzZMeHdGSTdvUTNUbU9HUDh0U1VLRVhkM0FPTW83UlRGSFNZ?=
 =?utf-8?B?WU82dnJ0VE1PSDRFUHdpUk02QUN6bW9zbWtXdFVUVExxeXJqcm9FWE13eUVi?=
 =?utf-8?B?Mk9xZFF2WG1JRXdBaU5tUFhqYUIrVVhFcFMzTS9iRXNhOFZReEdSL1ZySzFu?=
 =?utf-8?B?RitnbW1NTUxSTFNFK3NNaHZuZ3FTWGJJdTM5TDRDdlhoRnRJMDBZN1N5NUdh?=
 =?utf-8?B?MjRwcGM0WHVFeGYvSFUxY1FFeUlJejBOU25RTFR1UU9FN2JJdGlkeGlmMmdy?=
 =?utf-8?B?ZEhqcmJnbE5iR3FxcTN2aUJ5bElTZERzeHZCUGhiMTBlYTBQOWRmelZlZUVa?=
 =?utf-8?B?ZTIxTlc3WlZBcUZHZng3elJJbzYzSlNCM0NoV1o0WW1xekR4anhaSzhtUUpt?=
 =?utf-8?B?bXFOL1ZGQ0xHYUdqa1hRcjVkSnJMUkFpYXdZb2RSeVJ0TE5UaitUbWs0UUIx?=
 =?utf-8?B?YVpsS2UwTGllUnNUdzVvTElZbUlaenMrcnNPU25sL2g2SlpyMnpvbVBUQkFi?=
 =?utf-8?B?a05iaDdYTEZjTm16Vzcza1UzcWxrREhkMW5yNFdKblcwSGt0ZUFteHh3eENm?=
 =?utf-8?B?a3IzSm9BZTB5UUpDdTJzZzdEVGhHQXl0OS9lYnVhWjl6UjhFaVI2b0k1NVl4?=
 =?utf-8?B?RUlxVGFNSlRUUTVJMUVXSGg5MG1aOXMxaHZsZURwVzNidDVmTmNjZ2RNejZG?=
 =?utf-8?B?R2swQjZmYWVUc0o3czl4QkRWNEhEVmltRzVqOXZwQm5CRm1HNlJZSzNPUHR1?=
 =?utf-8?B?RUJqamdLRStuL2RWVE9oaVZITE52TXVPVldJTDZQaVFRRWNQL2pmanZocE1n?=
 =?utf-8?B?S09NSStULytkMWhjdjhyU3ArUlNaQ3hmVHdwNGJNZ2t5WEZZMjBud1hBQ3J2?=
 =?utf-8?B?a052L25iV0wvOTl2YXl0ZVZwakdUelZ5OE1ZS1dKLzZKOGpMYWQ4ZUkzTEpF?=
 =?utf-8?B?QldxRm9kV3lVY2poUytpeTZ4a09UOEJCV3l2YmJZMXpuUUloQm9GZFRmNjda?=
 =?utf-8?B?TGZ2Y2lFeWVweHBXT1NPVGRGYzFSYisyaUlrTjltbEhwNkMxa3h6L2JWT0FV?=
 =?utf-8?B?TmpRamFmWWtCVzBMeC95Qk9NNUdnWHM5SzVLQzZBVHY1ZXVJTkh0dEM2aE1w?=
 =?utf-8?B?K29FV24vQVhiOVY1dklrb0NTRkpBNjd2TTJYR3FNL0x2OW5FRElzenVWT1F3?=
 =?utf-8?B?YmNqczBEd3doQWwxUi9hOUd5eDhxQWNzM1ZMNXdVdVdBOUFxQmYzNDlndW5u?=
 =?utf-8?B?TEE9PQ==?=
Content-ID: <781C912DA2FCF843BFCD47940EF393DF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df29ac6-7264-4a74-dfad-08dce8025030
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 01:33:01.2647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C34Rh8H/nIlH/4BbrvOwxY/u4Rex3n8N6dyk6kGBwrRlYA14nFLI5k0xZi3YcXdy/GfUXVEQOdo0Dg+uCN2LdnreSJVUgLk1lgzA0DV0rbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7704
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.412300-8.000000
X-TMASE-MatchedRID: 5+1rHnqhWUQOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
 qIY+/skQkABPgKBt/0rbaVyalxbpdMot60/Xh7AB2OSj4qJA9QYS12tj9Zvd80QvBTq6tlr2o8W
 MkQWv6iUVR7DQWX/WkRBWOoA5nlyNC24oEZ6SpSk+Mqg+CyrtwA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.412300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1DC4571215F5175F70F78AC4B3D47C5493C3F86834977A5ECE5421A9012737482000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_31101183.1734754921"
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

--__=_Part_Boundary_007_31101183.1734754921
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI0LTEwLTA4IGF0IDA5OjMzICswMjAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToN
Cj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3Ig
dGhlIGNvbnRlbnQuDQo+ICDigKYNCj4gPiBGaXggdGhlIFNvQyBkZWdyYWRhdGlvbiBwcm9ibGVt
IGJ5IHRoaXMgc3JlaWVzLg0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2VyaWVzPw0KDQpUaGFua3MhIEknbGwgZml4IHRoaXMgdHlwbyBhdCB0aGUgbmV4
dCB2ZXJzaW9uLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCj4gDQo+IA0KPiBSZWdhcmRz
LA0KPiBNYXJrdXMNCg==

--__=_Part_Boundary_007_31101183.1734754921
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjQtMTAtMDgmIzMyO2F0
JiMzMjswOTozMyYjMzI7KzAyMDAsJiMzMjtNYXJrdXMmIzMyO0VsZnJpbmcmIzMyO3dyb3RlOg0K
Jmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMz
MjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29w
ZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2
ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQom
Z3Q7JiMzMjsmIzMyOyYjODIzMDsNCiZndDsmIzMyOyZndDsmIzMyO0ZpeCYjMzI7dGhlJiMzMjtT
b0MmIzMyO2RlZ3JhZGF0aW9uJiMzMjtwcm9ibGVtJiMzMjtieSYjMzI7dGhpcyYjMzI7c3JlaWVz
Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjtzZXJpZXMmIzYzOw0KDQpUaGFua3MhJiMzMjtJJiMzOTtsbCYjMzI7Zml4JiMzMjt0aGlz
JiMzMjt0eXBvJiMzMjthdCYjMzI7dGhlJiMzMjtuZXh0JiMzMjt2ZXJzaW9uLg0KDQpSZWdhcmRz
LA0KSmFzb24tSkguTGluDQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZWdhcmRz
LA0KJmd0OyYjMzI7TWFya3VzDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6
dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0
eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkg
YmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpl
eGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5k
ZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4g
QW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5p
bmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRz
KSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBt
YXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9m
IHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUt
bWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5
IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiAN
CnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVt
LCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkg
b3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_007_31101183.1734754921--


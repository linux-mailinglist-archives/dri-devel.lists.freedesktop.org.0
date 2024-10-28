Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E24E9B317E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 14:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C276E10E4AF;
	Mon, 28 Oct 2024 13:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="qYnCM4X/";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ScTpNswL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C2310E4AB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:18:46 +0000 (UTC)
X-UUID: 27432d1c952f11efb88477ffae1fc7a5-20241028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=FqgIdgAwszycsz+rmVF28t61csptyDXHvjoFCxrisYE=; 
 b=qYnCM4X/jTl4EAvRUvNpdGxNU0krZzyR61HdpElF6gBgI+3DZs7Ztzp4qMzYiYlb8QL6V9ignkaguwhykiZY+Opkswb73mc0jtJJ00H51o7ol1k10o0/mvZHp5hAZD1cNzuMt5sDANr1gdyKIscYaB18hgZMb8E/P3TFxehvssY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:342cc94f-4144-4ab1-99ca-e0be957f748a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:b6963a2e-a7a0-4b06-8464-80be82133975,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 27432d1c952f11efb88477ffae1fc7a5-20241028
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1950481544; Mon, 28 Oct 2024 21:18:42 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 28 Oct 2024 21:18:41 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 28 Oct 2024 21:18:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQELFi51oabUSnMJet72R63hLtTRfYbrQXvgcIHhbCegyuS4VIxtT9cvgXW5uOlvDH0fmLsf1aTxMj694EXKVBkcF8oXDpBNY0B7mKNtQuWLkc6K/sPKlkZ8el5Mr79yjpd4ly1PnHO7JlWDpIw1AV58jTXuM4PG7DmskmVh6ulzLSePaMpRG3MDAAPGwQ0eK8RQg9dfw46V3xf+YtXuJkXtNr0sCSCVyd0Doi13BFhdilHZ06vOhr2Rf6shBlhdwAg8vws3NfUj/qyzVEKXiooo65Eohy2Hn87XRpLC1RY9Lps+NNDyIOvocsUgI+xb58FFvsezQMuPIkmlSQZ72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loS4FSrWvexwAyObz31FbboiMmDfD7atwxtbqQ0+q7Y=;
 b=j3osNIyB96esAC9y8HxqukKzyoeVlIp5Z/eowrn+Ohh+o1D9H0vsBkXggAxLpqQGr+EhUOCcvFjeActQZNfNgHnh9ZI62CqCRek/QqCTBBhFJt8sGFYoTgLee5WSaK+ydOJ00r+4GTc5KEf/9xrDIf1Js3HLVE7gUWcGnQfPYR18kv/2b4rIhsla5WeF4MiwJO3HN27jM/MW3fTtIlE5o1UOte+jaxa9Ioz82PZLg+Lg7BugOfzOEFVwhXua22WaV4k0g0uPzJi2LGrPlfgJxsZXtz6jQ3iSuP8qCmfD9ES3XLChXUigrux73S+pfDiA8TKw+NW1cguoUu89MwlKAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loS4FSrWvexwAyObz31FbboiMmDfD7atwxtbqQ0+q7Y=;
 b=ScTpNswLWOun5rdHrXDBxth73FQqrtQSIRCwHkbcp5HczuymDwEM49TXbrVrU0hxqrFxbCL2pNnVYy27cABLw3HpvjDA7ByEnK+8mTfJKUzhXPXf30Seyw5dAqnBYO/wFMsUFnvPa1tLDm4xAE5pPNT+WAcPbY372KbKBi6o40M=
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com (2603:1096:400:70::13)
 by SEZPR03MB6596.apcprd03.prod.outlook.com (2603:1096:101:78::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 13:18:38 +0000
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::7a62:8e4a:b62a:3c13]) by TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::7a62:8e4a:b62a:3c13%7]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 13:18:38 +0000
From: =?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
To: =?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?= <Peng.Liu@mediatek.com>,
 =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "granquet@baylibre.com" <granquet@baylibre.com>,
 =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "msp@baylibre.com"
 <msp@baylibre.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v2 1/1] drm/mediatek: Fix potential KP on 0 bytes nvmem
 cell read
Thread-Topic: [PATCH v2 1/1] drm/mediatek: Fix potential KP on 0 bytes nvmem
 cell read
Thread-Index: AQHbEPKmdxDf/P1DVUaRAMuKp1SyMrJ+oZeAgB20ToA=
Date: Mon, 28 Oct 2024 13:18:38 +0000
Message-ID: <3db1be098d362d554ebcd31ced83eefc5134aa8f.camel@mediatek.com>
References: <20240927153305.27642-1-liankun.yang@mediatek.com>
 <CABnWg9uGR1yn9EsRaMjihksL76dwUv9vEi9eF=OCpzLfTvyYLg@mail.gmail.com>
In-Reply-To: <CABnWg9uGR1yn9EsRaMjihksL76dwUv9vEi9eF=OCpzLfTvyYLg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5760:EE_|SEZPR03MB6596:EE_
x-ms-office365-filtering-correlation-id: 780dfce6-fb8f-4dc9-ffbc-08dcf75308fa
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dGNFUENjdklXSXBlcUZXTUxkakJWd1RVZ2RmandySVVkWjZwMC9aOHJlTlMx?=
 =?utf-8?B?bjBZeXVoTkZKWHJKUjMzbENzS0wzWERmUTEwRnhjUitCR00xVHI3elV5Uk5M?=
 =?utf-8?B?am9ld2l0ZjhVRTYvMks2VlpITi82Z2VGdlhyR24zZUlXbGd3dlFGcXhYSTFU?=
 =?utf-8?B?U2xjL0tKR3JuNmJtNXVGcDZaTVI0Zm1CYU1GaFpRM3F2ZmtZUUFKb2ZmS2xu?=
 =?utf-8?B?MVhtMGNhRXRvcUw0bmF1dlIzNVBBS2lpYytKT1F6Y0RRM1JHMmdUbkduUDEz?=
 =?utf-8?B?Nzl6TkNiV0dhMmxCUjV2YkF5dGxONmRqT3BpM3FoTUVRZEtXaDRMdmkwL0tX?=
 =?utf-8?B?R2VuTGQ2RVlkbzc2UUNFQndkUVZPRGg4UEs5dUpjUWhUcWlUTkFZL2doRExv?=
 =?utf-8?B?NERBbE8xSDNMMm95eDJHVmFGZTlVN0pRNmhlaUUxTDRlZ1hJMUFZNVkyQk0v?=
 =?utf-8?B?RHRQMThrYm9WbFZrLzg4N1grY0o2OThIaDFtazFUbEZNS3Z4dWUxSUk5RnJh?=
 =?utf-8?B?NWJCUTZ5NW54Z0lHMUNrWVd6SUhtUHd1c0ljQzB4R1RVYTUzY28vYUZGLzNU?=
 =?utf-8?B?eG8yVW5MQ2h2ZFFiRCtRVWFwNWwyUG4zQXQxMkpVNlZKZzFkaHp1NUN2bjcz?=
 =?utf-8?B?c1dabTlWNk94T0c3WFNoMmFFZCsyYmdaWEJYSXllOXJsQVQxRjBLRU05Tm9t?=
 =?utf-8?B?QnJpVWtZKytwVDF4L1JLTFo1b0JaczRDMU81SW1hSG9sdWlzZi95Q1FzQzg1?=
 =?utf-8?B?eTlwZ3k4UUFvY1UzaXlDRkM0cktpWGNwWEtWbTlnVmRFWjNzZmFjbklIazkv?=
 =?utf-8?B?NDZ3TnJJd1EvQVU3YmZ4RXduam9wY2h4Z3I1d2cvMmJDbmhkUmlLVmJFZ0Fr?=
 =?utf-8?B?MGJWZWtLamFQNVgvc29INkk3T2tNdnVaMnZseHU5Q0ZZSVBYaVEvOSsxdEJi?=
 =?utf-8?B?MUtOZ1ZTQXVsSEdwT2xOQm5CSFl3SDFNdHp5a240eXJjdXp6dmtmMHlMTmZx?=
 =?utf-8?B?U25KQVgxVm5LVnY2Umo3YlhaSlF3RFhyR3BxTWlwVUk2NStYbk8vSytkbjdT?=
 =?utf-8?B?TTlhcmxYZUNNZm5DVXFsVFkySURtVTdDTUplMFZjRk1vdzd0ZGxzbHJWV2Yv?=
 =?utf-8?B?a0NKMktVSUhYNmlyaDVhMTVMcDViK2IzRGFqcVcxNXU1V0YybHNHVjNhaXYr?=
 =?utf-8?B?RDk0ODZoZ0haMnNpNXpvOVNvTERWV2xOSlhudm1PRWZUOVBObkNxd1Y1L013?=
 =?utf-8?B?VWdCS3dZTXQxVmRlMnN3OENEZlhIYy8xLzVSVEZSQ2xicjVkNUE0R1J4UzZS?=
 =?utf-8?B?MmdZUW04QUF0NERvU1pxQ1RTTG5FNG9yS05zc2JxT0hMSy9ES1c4TFp5VmxL?=
 =?utf-8?B?RWUrVEZGWjdxM1VhOG00TGtHQzB1MEZ5S0RiTjR4WFduaWZNanl6ZkhnM1JU?=
 =?utf-8?B?QXZRbjVLdkhjUXJaajh5R1VYSVBjNXhUSDZnM1RNc3BqbWlQM2cxOEtaM3l6?=
 =?utf-8?B?cFQ3RlYxb0JTRnZmYTRnQTlTdURrQ096clZHZzRuZEo1cEZkbUNMUUFERVdp?=
 =?utf-8?B?ZzE2NDBkczZSNmVTbFFKTnd5R3RsQzQ2ZFNMc1NISkV3RXBDb3hvRWc4Y0U0?=
 =?utf-8?B?UlEzUTdadERZTW1uUzhBMExRMDRuNUFibThnVXJtRXI5NVFkQmtiSzVEN2d2?=
 =?utf-8?B?eUJkdHd6Q2NOK2g0TEJkeXZWNWorSFdpSTZlT256QTdZWVZoeDhxd1liY250?=
 =?utf-8?B?THFqTmRMemRXS1lrQm8yMkxKd0VxUm5QTGk1ZmRPRzk3ZklUTXVJNCs5MjM4?=
 =?utf-8?B?bytRRTE1NUY4MGg3THg5U0VHTitWVnFLZUVpQkxROWJmbkJWaDhsSC9IWU9q?=
 =?utf-8?B?WHV4b1FmSFBlOEJuZFBETkhpWEhWN2w5WmpYVUdMR2pweHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB5760.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDB2ZXRVdXFVNDlHV1hNNytrVDBCYVlLQkYveUdjQWd3VkY0aHZOd05aNzJo?=
 =?utf-8?B?RXNNMnBYaVdWdHVuelNkZ1hhdTNtOGg5UGc3emxlRjRNUFprM0UxUkZPZDJQ?=
 =?utf-8?B?YWdhMHZZUlpIWkdIK3NlS1YyK0N2TTVQbXJ6VTQxemw0T0R2MlFvNldUa0VJ?=
 =?utf-8?B?RjNsZDU4aXlrZmt5dHI4SlhJVWVEVTd4K3BUeEJUbHVHM2ZUU2hBM29uMDcz?=
 =?utf-8?B?czlzbFQzOTljc0RVM0FIdGpmNG5xNmFaTVZPMnJKMFBUd09USytIL3JwR0lv?=
 =?utf-8?B?Wk9EbExaZ3YvcmFtd04zZzNJSDN5Nno1L1IxQWJzelhKV3NJVWdOaDg1bURr?=
 =?utf-8?B?U05nMFJaNGdLNWkzd0JoVVMrZ0pBSlZHaFZXc1o1TGVzZVUvN3lZcHM4U0cr?=
 =?utf-8?B?RUNuVlJHUzY4WjI4WUs2eDRKLzVhYUhTRGsrQ3VrUThCd2VVWWhNdnlxQk0x?=
 =?utf-8?B?Tmh0bkxrb1JQTVFwMnNSckc0TFczT1RhaVRPT3ZZQUQ3RmY2SnBSL1NCdFlr?=
 =?utf-8?B?UU9hTXBRZmt2enB5WUJEWFJIS08yWGJocGtOcEd6R0ZDYStFZlAvOHdlb2Vx?=
 =?utf-8?B?d0xBSmV5aU1yZzBDVW9tNTFUQzR4d3J1UGdwNklNVzJjT1U3bEJ5TGR4Q1FI?=
 =?utf-8?B?cHVHbmdBWWZpMTA4bnc5QWc5MzZXV0VIeEtjQmQ0WXlzYml1MmUwdmNzSmFn?=
 =?utf-8?B?ajBsM1pGL050Y2VROWdkZ1lxVFphaUsxK2lBNFFmTFZlUVY2d1M3MytTd0w1?=
 =?utf-8?B?VlB3T2M0bjRoU0pQcnhacGlqRFRnM1hsSzUya1E1Q24wMWFjbnNLZVZZQnhj?=
 =?utf-8?B?WEVuOEtQMzZweHRadmlHU1RyRjdDYkEzK1Y3bTJWRzZ0MEJ2RFEzWWQ2OFhQ?=
 =?utf-8?B?aVZ2aVkwM051M3ZMbnRXK2JVa0hSc0c0THlMRW00SHpDSS9pL0NoRWV5b3BM?=
 =?utf-8?B?MUhWMDNlQVFXQlFUbHJ1bkpQVU4rOXhpV2RwRUp5ZGVFdmRJazFDOHVBSTZH?=
 =?utf-8?B?cmFmdjQ5QmNNSmhqVDhVY01pZTd3dWtCb29LWW1BdVhhTFZwN1pPalJxcG41?=
 =?utf-8?B?S0NQUFI4djRHaVAxY0hCTjZmZmh5NTZLb2NFMExwL081d2lVMVc4U013VzlE?=
 =?utf-8?B?NjZCYkxmZ0FTRlVnNmFQNTE4UVlreTFRUTZIU3hpZm5iRXUrREczbU9peU5B?=
 =?utf-8?B?WDVRVEdhOWQwUVpwTXZJSXcvekFrMnJlMmNlY2tGVHltTDRYRFlDWHI0R2J3?=
 =?utf-8?B?TUcraDhRL0dIMTVLazYraytPaVpQaGhucWRITkRmc0x4bm0xSnJrNXFFZkUr?=
 =?utf-8?B?enVQMGNwdSsyYlM4c2dGOTdrNjJsTk5BTkdtKzZIdWIxMGEvMGFuRm9ndm01?=
 =?utf-8?B?RTVGUDRTU0ZkSjNZT25FZXU5a1p0dUtqK3FVdExFQmxIeDRJU25rS2x6SWlF?=
 =?utf-8?B?OGQ2ei93b2d2SUpYVmhYd3NWS051Rml6QlBKU0hjamwxbFQxMHZYejZleVhO?=
 =?utf-8?B?a1U3RjZJRCtpYjVFSm1nVkhxRjJSZVl0cWZFVU5SZ3VMQldOSHNpOTl3S3ZV?=
 =?utf-8?B?WkZueXM5WVZFa2VRR3hFUUdKbTZac1NjZ292WWJPMUNoTEd0blg4WWJLUjJs?=
 =?utf-8?B?VjdQcWVud2xzazQwNHhwMlZQZUMwRVBXZlp1MnMram82SzFpQXZmN2pmRVFi?=
 =?utf-8?B?NUw3L2RSTlliM05xSGdaNlJtMzAwaWxOWW1IQXRScHNWek9sSU1hSHF6eVdn?=
 =?utf-8?B?Nk9GbCs5Y25hUnZRSUloN2lpeHhPamRtZStRQU5Sd1JpYzVldmI3bm40ZkxG?=
 =?utf-8?B?OW1BOXVFM0RoWUU2N21ISFBlTWhJTWFsT1JLQ0ZIanU2S3F2dDdVWmV3Vk5B?=
 =?utf-8?B?TEUxTWN0bXl2SFhpNXRuNHVMSUJwMk1NTVhTNFRRMS9JTWJzTXR5dWI3T3Rh?=
 =?utf-8?B?cWNBUlpxZmEzU3VWTmtTTk5aMldhZjUrSmlUbXpHNitkc0NuUnNDNTBkcDlq?=
 =?utf-8?B?WTVCSnp0U2hiZlJaZDBLT1RwOWNVVFMvOE1RRTNZdGY1UHBWZ3pIUUtlWVR5?=
 =?utf-8?B?eHE1emJIbUVhV0xYbGNLeXBoNFJ0WTE5VTJvNXN4cDdRWnk1NDI1MUt4QmVV?=
 =?utf-8?B?RG85UWxmdWpKMDVHRnIvZ3hDL1NJN0JVSWYrWEZyVWF6MTVDRSt0K0QyeFFi?=
 =?utf-8?B?WWc9PQ==?=
Content-ID: <A99DAC16D521584093912469A1136DA3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5760.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780dfce6-fb8f-4dc9-ffbc-08dcf75308fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 13:18:38.4681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YBYxkpAEg+6DgwAItVM+9lA9CDvT/AIlw5J9go96DygQkBOoOn0jspIAN9PHeCfnSoeS/EJ0T6uwzdfpgIeZwa498Qif7LlQjuYSy5TkKC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6596
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--25.722500-8.000000
X-TMASE-MatchedRID: GagEC7nsA0TUL3YCMmnG4qjrJc8YmBM8jLOy13Cgb4/n0eNPmPPe5KWz
 WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2ogGd8wIUGIIoUVkB7ifJnoKwF4K/wIz939l
 SYY/1iRt9ojVI5HQ99rzCnXAB7LNkS22k34pVV32XXOyNnX/prBhH6ApagZfOEd+K6O5Nt53ifO
 TDuK1oyIePJzZl66G0oudOeSsYOymwQEC6hpSor+KXavbHY/C1BRwnA14pOUa1bOJifK36+AJi/
 2DIfq9RY0wnaFMx9YpLEH3d9KJSO7ZYfOyEKIlsEwyZyuMQ413WSrKtwxqWpRamNl0dV4G9o8WM
 kQWv6iUVR7DQWX/WkQGLeSok4rrZC24oEZ6SpSk+Mqg+CyrtwA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--25.722500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1B3880481D9253A02C75DD3E2CFF12DABDD36DF0E874B21E063892D2B8FB9A0B2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1080375964.100805969"
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

--__=_Part_Boundary_009_1080375964.100805969
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI0LTEwLTA5IGF0IDA4OjQxIC0wNzAwLCBHdWlsbGF1bWUgUmFucXVldCB3cm90
ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIg
b3IgdGhlIGNvbnRlbnQuDQo+ICBPbiBGcmksIDI3IFNlcCAyMDI0IDExOjAzLCBMaWFua3VuIFlh
bmcgPGxpYW5rdW4ueWFuZ0BtZWRpYXRlay5jb20+DQo+IHdyb3RlOg0KPiA+SWYgdGhlIGxlbiBp
cyAwLCBrZXJuZWwgY3Jhc2ggd2lsbCBvY2N1ciB3aGVuIHBlcmZvcm1pbmcgb3BlcmF0aW9ucy4N
Cj4gPkFkZCB0aGUgbGVuIGNoZWNrIGNvbmRpdGlvbnMgdG8gcHJldmVudCBrZXJuZWwgY3Jhc2gu
DQo+ID4NCj4gPkZpeGVzOiBmNzBhYzA5N2EyY2YgKCJkcm0vbWVkaWF0ZWs6IEFkZCBNVDgxOTUg
RW1iZWRkZWQgRGlzcGxheVBvcnQNCj4gZHJpdmVyIikNCj4gPlNpZ25lZC1vZmYtYnk6IExpYW5r
dW4gWWFuZyA8bGlhbmt1bi55YW5nQG1lZGlhdGVrLmNvbT4NCj4gPi0tLQ0KPiA+Q2hhbmdlcyBp
biBWMjoNCj4gPi0gRml4IHRoZSBjb21taXQgdGl0bGUuDQo+ID4tIFJlbW92ZSBibGFuayBsaW5l
IGJldHdlZW4gdGhlIEZpeGVzIGFuZCBTaWduZS1vZmYtYnkuDQo+ID4tIE1vZGlmeSB0aGUganVk
Z21lbnQgd3JpdGluZyBtZXRob2QuDQo+ID5QZXIgc3VnZ2VzdGlvbiBmcm9tIHRoZSBwcmV2aW91
cyB0aHJlYWQ6DQo+ID4NCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xp
bnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQwOTI1MDg0MTE2LjI4ODQ4LTEtbGlhbmt1bi55YW5nQG1l
ZGlhdGVrLmNvbS8NCj4gPi0tLQ0KPiA+IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAu
YyB8IDIgKy0NCj4gPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gPg0KPiA+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAu
Yw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiA+aW5kZXggZDg3OTZh
OTA0ZWNhLi45ZWNkZjYyMzk4ZWUgMTAwNjQ0DQo+ID4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RwLmMNCj4gPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAu
Yw0KPiA+QEAgLTEwODIsNyArMTA4Miw3IEBAIHN0YXRpYyB2b2lkIG10a19kcF9nZXRfY2FsaWJy
YXRpb25fZGF0YShzdHJ1Y3QNCj4gbXRrX2RwICptdGtfZHApDQo+ID4gYnVmID0gKHUzMiAqKW52
bWVtX2NlbGxfcmVhZChjZWxsLCAmbGVuKTsNCj4gPiBudm1lbV9jZWxsX3B1dChjZWxsKTsNCj4g
Pg0KPiA+LWlmIChJU19FUlIoYnVmKSB8fCAoKGxlbiAvIHNpemVvZih1MzIpKSAhPSA0KSkgew0K
PiA+K2lmIChJU19FUlIoYnVmKSB8fCAhbGVuIHx8ICgobGVuIC8gc2l6ZW9mKHUzMikpICE9IDQp
KSB7DQo+ID4gZGV2X3dhcm4oZGV2LCAiRmFpbGVkIHRvIHJlYWQgbnZtZW1fY2VsbF9yZWFkXG4i
KTsNCj4gDQo+IEhlbGxvIExpYW5rdW4sDQo+IFdvdWxkIHlvdSBiZSBhYmxlIHRvIGRlc2NyaWJl
IHRoZSBjcmFzaCB3aXRoIG1vcmUgZGV0YWlscz8NCj4gDQo+IEknbSBhZnJhaWQgSSBkb24ndCB1
bmRlcnN0YW5kIHRoZSBmaXg/DQo+IA0KPiBpZiBsZW4gaXMgMCwgZGl2aWRpbmcgMCBieSBzaXpl
b2YodTMyKSBpcyAwIGFuZCB0aHVzICE9IDQNCj4gU28gdG8gbWUsIGNoZWNraW5nIGZvciBsZW4g
IT0gMCBpcyByZWR1bmRhbnQ/DQo+IA0KPiBUaHgsDQo+IEd1aWxsYXVtZS4NCg0KSGVsbG8gR3Vp
bGxhdW1lLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29ycmVjdGlvbi4NCg0KVGhlIGNoZWNrIGZv
ciBsZW4gIT0gMCBpcyByZWR1bmRhbnQuDQoNCkkgZGlkIG5vdCByZXZpZXcgdGhpcyBwYXRjaCBj
YXJlZnVsbHksIGFuZCB3aWxsIHJldmlldyBpdCBhZ2FpbiBuZXh0DQp0aW1lLg0KDQpUaHgsDQpM
aWFua3VuLg0KDQo+ID4NCj4gPiBpZiAoIUlTX0VSUihidWYpKQ0KPiA+LS0NCj4gPjIuNDUuMg0K

--__=_Part_Boundary_009_1080375964.100805969
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjQtMTAtMDkmIzMyO2F0
JiMzMjswODo0MSYjMzI7LTA3MDAsJiMzMjtHdWlsbGF1bWUmIzMyO1JhbnF1ZXQmIzMyO3dyb3Rl
Og0KJmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6
JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMy
O29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMz
Mjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQu
DQomZ3Q7JiMzMjsmIzMyO09uJiMzMjtGcmksJiMzMjsyNyYjMzI7U2VwJiMzMjsyMDI0JiMzMjsx
MTowMywmIzMyO0xpYW5rdW4mIzMyO1lhbmcmIzMyOyZsdDtsaWFua3VuLnlhbmdAbWVkaWF0ZWsu
Y29tJmd0Ow0KJmd0OyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7SWYmIzMyO3RoZSYjMzI7bGVu
JiMzMjtpcyYjMzI7MCwmIzMyO2tlcm5lbCYjMzI7Y3Jhc2gmIzMyO3dpbGwmIzMyO29jY3VyJiMz
Mjt3aGVuJiMzMjtwZXJmb3JtaW5nJiMzMjtvcGVyYXRpb25zLg0KJmd0OyYjMzI7Jmd0O0FkZCYj
MzI7dGhlJiMzMjtsZW4mIzMyO2NoZWNrJiMzMjtjb25kaXRpb25zJiMzMjt0byYjMzI7cHJldmVu
dCYjMzI7a2VybmVsJiMzMjtjcmFzaC4NCiZndDsmIzMyOyZndDsNCiZndDsmIzMyOyZndDtGaXhl
czomIzMyO2Y3MGFjMDk3YTJjZiYjMzI7KCZxdW90O2RybS9tZWRpYXRlazomIzMyO0FkZCYjMzI7
TVQ4MTk1JiMzMjtFbWJlZGRlZCYjMzI7RGlzcGxheVBvcnQNCiZndDsmIzMyO2RyaXZlciZxdW90
OykNCiZndDsmIzMyOyZndDtTaWduZWQtb2ZmLWJ5OiYjMzI7TGlhbmt1biYjMzI7WWFuZyYjMzI7
Jmx0O2xpYW5rdW4ueWFuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7LS0tDQomZ3Q7
JiMzMjsmZ3Q7Q2hhbmdlcyYjMzI7aW4mIzMyO1YyOg0KJmd0OyYjMzI7Jmd0Oy0mIzMyO0ZpeCYj
MzI7dGhlJiMzMjtjb21taXQmIzMyO3RpdGxlLg0KJmd0OyYjMzI7Jmd0Oy0mIzMyO1JlbW92ZSYj
MzI7YmxhbmsmIzMyO2xpbmUmIzMyO2JldHdlZW4mIzMyO3RoZSYjMzI7Rml4ZXMmIzMyO2FuZCYj
MzI7U2lnbmUtb2ZmLWJ5Lg0KJmd0OyYjMzI7Jmd0Oy0mIzMyO01vZGlmeSYjMzI7dGhlJiMzMjtq
dWRnbWVudCYjMzI7d3JpdGluZyYjMzI7bWV0aG9kLg0KJmd0OyYjMzI7Jmd0O1BlciYjMzI7c3Vn
Z2VzdGlvbiYjMzI7ZnJvbSYjMzI7dGhlJiMzMjtwcmV2aW91cyYjMzI7dGhyZWFkOg0KJmd0OyYj
MzI7Jmd0Ow0KJmd0OyYjMzI7aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xp
bnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQwOTI1MDg0MTE2LjI4ODQ4LTEtbGlhbmt1bi55YW5nQG1l
ZGlhdGVrLmNvbS8NCiZndDsmIzMyOyZndDstLS0NCiZndDsmIzMyOyZndDsmIzMyO2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYyYjMzI7fCYjMzI7MiYjMzI7Ky0NCiZndDsmIzMyOyZn
dDsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsxJiMzMjtpbnNlcnRpb24oKyksJiMz
MjsxJiMzMjtkZWxldGlvbigtKQ0KJmd0OyYjMzI7Jmd0Ow0KJmd0OyYjMzI7Jmd0O2RpZmYmIzMy
Oy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KJmd0OyYjMzI7
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCiZndDsmIzMyOyZndDtpbmRleCYj
MzI7ZDg3OTZhOTA0ZWNhLi45ZWNkZjYyMzk4ZWUmIzMyOzEwMDY0NA0KJmd0OyYjMzI7Jmd0Oy0t
LSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCiZndDsmIzMyOyZndDsr
KysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQomZ3Q7JiMzMjsmZ3Q7
QEAmIzMyOy0xMDgyLDcmIzMyOysxMDgyLDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMy
O210a19kcF9nZXRfY2FsaWJyYXRpb25fZGF0YShzdHJ1Y3QNCiZndDsmIzMyO210a19kcCYjMzI7
Km10a19kcCkNCiZndDsmIzMyOyZndDsmIzMyO2J1ZiYjMzI7PSYjMzI7KHUzMiYjMzI7Kiludm1l
bV9jZWxsX3JlYWQoY2VsbCwmIzMyOyZhbXA7bGVuKTsNCiZndDsmIzMyOyZndDsmIzMyO252bWVt
X2NlbGxfcHV0KGNlbGwpOw0KJmd0OyYjMzI7Jmd0Ow0KJmd0OyYjMzI7Jmd0Oy1pZiYjMzI7KElT
X0VSUihidWYpJiMzMjt8fCYjMzI7KChsZW4mIzMyOy8mIzMyO3NpemVvZih1MzIpKSYjMzI7IT0m
IzMyOzQpKSYjMzI7ew0KJmd0OyYjMzI7Jmd0OytpZiYjMzI7KElTX0VSUihidWYpJiMzMjt8fCYj
MzI7IWxlbiYjMzI7fHwmIzMyOygobGVuJiMzMjsvJiMzMjtzaXplb2YodTMyKSkmIzMyOyE9JiMz
Mjs0KSkmIzMyO3sNCiZndDsmIzMyOyZndDsmIzMyO2Rldl93YXJuKGRldiwmIzMyOyZxdW90O0Zh
aWxlZCYjMzI7dG8mIzMyO3JlYWQmIzMyO252bWVtX2NlbGxfcmVhZCYjOTI7biZxdW90Oyk7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0hlbGxvJiMzMjtMaWFua3VuLA0KJmd0OyYjMzI7V291bGQmIzMy
O3lvdSYjMzI7YmUmIzMyO2FibGUmIzMyO3RvJiMzMjtkZXNjcmliZSYjMzI7dGhlJiMzMjtjcmFz
aCYjMzI7d2l0aCYjMzI7bW9yZSYjMzI7ZGV0YWlscyYjNjM7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O0kmIzM5O20mIzMyO2FmcmFpZCYjMzI7SSYjMzI7ZG9uJiMzOTt0JiMzMjt1bmRlcnN0YW5kJiMz
Mjt0aGUmIzMyO2ZpeCYjNjM7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO2lmJiMzMjtsZW4mIzMyO2lz
JiMzMjswLCYjMzI7ZGl2aWRpbmcmIzMyOzAmIzMyO2J5JiMzMjtzaXplb2YodTMyKSYjMzI7aXMm
IzMyOzAmIzMyO2FuZCYjMzI7dGh1cyYjMzI7IT0mIzMyOzQNCiZndDsmIzMyO1NvJiMzMjt0byYj
MzI7bWUsJiMzMjtjaGVja2luZyYjMzI7Zm9yJiMzMjtsZW4mIzMyOyE9JiMzMjswJiMzMjtpcyYj
MzI7cmVkdW5kYW50JiM2MzsNCiZndDsmIzMyOw0KJmd0OyYjMzI7VGh4LA0KJmd0OyYjMzI7R3Vp
bGxhdW1lLg0KDQpIZWxsbyYjMzI7R3VpbGxhdW1lLA0KDQpUaGFuayYjMzI7eW91JiMzMjtmb3Im
IzMyO3lvdXImIzMyO2NvcnJlY3Rpb24uDQoNClRoZSYjMzI7Y2hlY2smIzMyO2ZvciYjMzI7bGVu
JiMzMjshPSYjMzI7MCYjMzI7aXMmIzMyO3JlZHVuZGFudC4NCg0KSSYjMzI7ZGlkJiMzMjtub3Qm
IzMyO3JldmlldyYjMzI7dGhpcyYjMzI7cGF0Y2gmIzMyO2NhcmVmdWxseSwmIzMyO2FuZCYjMzI7
d2lsbCYjMzI7cmV2aWV3JiMzMjtpdCYjMzI7YWdhaW4mIzMyO25leHQNCnRpbWUuDQoNClRoeCwN
CkxpYW5rdW4uDQoNCiZndDsmIzMyOyZndDsNCiZndDsmIzMyOyZndDsmIzMyO2lmJiMzMjsoIUlT
X0VSUihidWYpKQ0KJmd0OyYjMzI7Jmd0Oy0tDQomZ3Q7JiMzMjsmZ3Q7Mi40NS4yDQoNCjwvcHJl
Pg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioq
KioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioq
KioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5j
bHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFy
eSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVy
IGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRv
IHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpk
aXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFp
bCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChz
KSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFy
ZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0K
dGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlm
eSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwg
ZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55
IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUg
Y29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8
L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_1080375964.100805969--


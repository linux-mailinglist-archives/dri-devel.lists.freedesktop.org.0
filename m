Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255F2B0537D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8882C10E530;
	Tue, 15 Jul 2025 07:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ldOq/8L/";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WlprLrI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2C310E530
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 07:42:03 +0000 (UTC)
X-UUID: 2fdeebd6614f11f0b1510d84776b8c0b-20250715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=IM9S51FsuJ/mPos3DtpBDzsQFz/DfP12SPT9BDTzRPA=; 
 b=ldOq/8L/B3AGtiFGOfU3FcZvB5nc2hDIz7fvMdCD1cR+YTonp1ZPynR93Jq7p1AgkSH9vatNBR/gjSVjn71Fdf0+rqKo1Dr2mN2sfi4EsoKxbp8JRQ8NmKiOn6O0HnBximiumcfQixJsGM3qt7zx8DeVPRAJ4MHY6T6biCDDAUE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:197e6bd2-7882-4f45-b2eb-ede4bd94fb2a, IP:0,
 UR
 L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:12
X-CID-META: VersionHash:9eb4ff7, CLOUDID:86572cdf-2070-40bb-9c24-dfabef7c07f4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:99|11|97|83|106|80|1,File:nil,RT:nil,Bulk:nil,QS
 :nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
 RC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2fdeebd6614f11f0b1510d84776b8c0b-20250715
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 914599512; Tue, 15 Jul 2025 15:41:58 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 15 Jul 2025 15:41:56 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 15 Jul 2025 15:41:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxT/uGAi1m6RRKjcUoWutAGabr/KrE3tnqRUCeKzdLKzTD/Rxmo4Gpr/0nHgCMFEQ8sC15/C2ZrHBurc2XUpd6Tu6kRGvjvukxYs7s/RJg/wcGTPIgvkru5eJHqPllXX1/AfsAqB6DI+/5blnukrMg/4aG6zkFukeNANXjKapk0Glgq2jpzq1hOHG31KUDkoWnyEnD4Aqqw2nJGqs5X+zYrIio7v9n7d1nx8dF0MbwytLXakOkix6Z+/l+aIdiJVF88gMTwY814ittNeXLoQzV54IZm721BWPa+NEKYyYBWa3LBCHzN4rcdFOcF63KZ3/cBkTJeTYBr3nH6iKKh/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuAFQpgfpqPot8FUtQO+hEsCRRnieK/4MmvH2ciC5ms=;
 b=AEqeDNPCHI5KMT8v/MwUJrBlloyUkNdD/Cbb7yzMQJq4Vp9urww1JsYk12mcDO63iXBetYIMH/Gpmv90ttS4SywHG2K2lAaQVHj+zIQepUzeYwU17z5HaQAENzTBV3h9NmrkCWVuKjzcYNkBxsfjb8hZM/my+Q7foglOcE5UNGlweh1hRTQ901R+pGfuRp8tWFDOZXC1ICrYeWAjTRVUUApKia9zGVLmdQzX72IE84/IBX4r/mhCbgTNyKKCh3GW8K/CKlGzMmIdqUSr+WpfCwAk/dRpFIVfeluBLMNHGY04L/0sD00wAdvRVxpmjcR1KGqLqU2YcOPqPijjlzOqmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuAFQpgfpqPot8FUtQO+hEsCRRnieK/4MmvH2ciC5ms=;
 b=WlprLrI7TxvcNGyOPhkQBpcaJDeEBeHYVaKJOlCO4hcIz7S7LSb/IRbSA1qcvp66jdEvsxwjODMOpXMpc6/2VWpBpTIUGF6rRbraxJNxKI06AmDxFVUCDbZYJgdeziJUqbp4d0QxnACKrdLkCIPewUwgdCo9Irs7Aa2fcWiZK6A=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB7256.apcprd03.prod.outlook.com (2603:1096:301:100::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 07:41:54 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 07:41:54 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?U2hhbmd5YW8gTGluICjmnpfkuIrloK8p?=
 <Shangyao.Lin@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 04/13] dt-bindings: media: mediatek: add cam-yuv binding
Thread-Topic: [PATCH v2 04/13] dt-bindings: media: mediatek: add cam-yuv
 binding
Thread-Index: AQHb7uBQC+PVoYMb7UuSMJ5Toioh5bQy2h0A
Date: Tue, 15 Jul 2025 07:41:54 +0000
Message-ID: <048117e4918189bc51fcca4deb90045879e724b4.camel@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-5-shangyao.lin@mediatek.com>
In-Reply-To: <20250707013154.4055874-5-shangyao.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB7256:EE_
x-ms-office365-filtering-correlation-id: 44ad4815-1047-4945-1bb0-08ddc373120a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|42112799006|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UDI5YndwTFI3N2FjQ2xaUUJPZmZKcjRQQXYvam0xU1J3ZktrVWZMWEt4SVph?=
 =?utf-8?B?djVnaWl2TEFnbitvVUtzYjZYSUZmVGZIWEM2aHAxSE8vdWZBUnV1ZEt3Vmxz?=
 =?utf-8?B?YVBxK0NjQ21YVDd0Vnd6WWhBSjdYeHZINkRxdjhvMVdORWlMY1hJRy9qQkNP?=
 =?utf-8?B?dnh0MU5aRVZtRlFLaXNyalNYRXBTYVZ3emRFekNiUERKNG5WOW13eXoxRzVs?=
 =?utf-8?B?L2p2TkJURHcyeWdBZUJVZkJlOS82U05PUmVYMzRqMW9tMkN4WGFTY093eGdt?=
 =?utf-8?B?TVArTHNxTFA1Yk9pdEJBc3dHVVl4cEM5YnVyN0djMnVZRFdUWXRwQWl1ME94?=
 =?utf-8?B?SDVqSzgxR3R1L3BNVFFscnpkSjY0R0NOMzFtZ3A0cHFibFZucWl0bWpXd0s3?=
 =?utf-8?B?aEl2VEpyaHRBOTFUKzhSVndLQWk5Z0p3a0tiZXZxb04xaklCZ1FnSjJnK2ZL?=
 =?utf-8?B?OXgxbU1EelVJL0dUU29oN3VXNnIyOUplM0w3VkZORlRFbHBzZUlTNGplNzBk?=
 =?utf-8?B?MlJ2SDVkNGU1U2hWOFpyZ0s5SUt5WlBhRUZPSmVqQWJWTUVYdVB4dThnVWRs?=
 =?utf-8?B?b3RxWVZtTGlMa3BIU0tIb2FNMHZIV3k0aXI2dUhIWmpvcHBwY0srclhnaEd3?=
 =?utf-8?B?N0ZMUzRzRC9mMk1adThwY3Jycm1zRHNUcWw1U0FuRW9yamloNmRHUEp5QTNh?=
 =?utf-8?B?Q1hqZVA1Q0Jac21YeFlmZ0lDM216VmVTUSttZG5vTy9BQjErLzVldmpqa0xq?=
 =?utf-8?B?Y1F2ZW1aQU94WUc0a0RkOElmbnFtdUkraklNbno5RDNOR1duc0didFJiOXlK?=
 =?utf-8?B?YXo2ZEZkc2g2RDBLY0RmaFRJL1ltaTlRRThmYTdOUmdlZlhyeFpJaThzWXE3?=
 =?utf-8?B?dTBFQnRNc2tvY2daTEJlMlp4YTMvS0d1bjUreWV2MndtTjliekVWREFZNk9h?=
 =?utf-8?B?Vm5Hdm9IL3JqVFExZkY2c0wvQUUrK2ZML2hNZnZIdFdlNUpha2t5K2ZkcDFS?=
 =?utf-8?B?WDBqNnVVTDRXa21DMGd2TFhyN1ZwcEhMZG1QTU1hZythM2wxdlA4QzQwN3BX?=
 =?utf-8?B?WHZKZTlieHJxWkRoenI0QkZwcTFZZ1BhZlExdEVlZVJrQkdGNnc4aTh6bVdH?=
 =?utf-8?B?U3ZNUmtwOFBYbWNIVTJKSUFMcTlOZDZ3ei9QbW1HTm8zNW5NUjhXR0IzaGRx?=
 =?utf-8?B?U0dwMDVDOVAvNFVJUkdLelg1bzU3dmlYcWYwcW1nSFlmM29JWmZ5eTlHL2tC?=
 =?utf-8?B?QzBycXN4VTkxMVU5QVZqWlRKOFpLTk1UL1RmRWt1RlQxTURxMGV4Q1IvMG0r?=
 =?utf-8?B?RDFYM1g5amEwTVVDTFY2blc0aUhRSTE5a2h5RTRraFRJQ0RGTWdITytOcCtV?=
 =?utf-8?B?QmFOL2FqMDh5WmpLMTBLT0NVTGtNY3pHZ3RCcHRDSC92U0t0QXd2Vzkxekxn?=
 =?utf-8?B?eGFUMGRPOEd0MllxRlQ4ZUNBVGRnR3AyQVFBU1dnM2hNeTlDY0pBTFd5MDgw?=
 =?utf-8?B?UmhHTHVrZXBKS0Q4Q0pSOG9Gc05IdVBscEpqVXZMdmZqRWdsZ0J6a1ZtY2VI?=
 =?utf-8?B?ZDRUaERXMFRJM3NFRGZENnZlSTlQWTc4MlRwY3VnYmdqYkRtMno2cjg3UDYr?=
 =?utf-8?B?UVJYWlUxazlBbGNRMldTNWxlbVQyUXBUY0hRRE15OU5DeGZRTVNtdWtOS3Y5?=
 =?utf-8?B?eENPTDBHd25WTGUwL29uTTQ0RWRoa1N2KzI5aEFBbDJlTUtTOEJyTzJIUjZL?=
 =?utf-8?B?UEdiT3ZHSHpXeGtFN2RVYmxmcWNQSWhuZnNUUHlXRUJmNVNOeVA4bTRWM1ly?=
 =?utf-8?B?dGRLTkhLVE1OREUvclRXM1RBUUJJS08remFFeHJnaFdPT3dBSU5FQ0cvbXBZ?=
 =?utf-8?B?bzB2ZXdvWUtBNUZCVGtQT2FLV1RBZnhCeWpGYWt1V2p4eGt6UUFlUzVMaTlN?=
 =?utf-8?Q?dTuIBCVnKmJnXSJWmpHnjhTsm2xoDgVO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(42112799006)(1800799024)(366016)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkFMNWE0WFZBNi9WakFqUjM0WVRmUmJQbmY1NG5QZm9lci9PYk5xUUNXUnBJ?=
 =?utf-8?B?MlZaVHRTaTI5Y2NWQ2VIWDJxbVc2K0F1YWk2N3EvUHRDZFJZOWZ6QkhITzcx?=
 =?utf-8?B?M2c3dEVRN1dFZWFxTk9wdzM0SHZlTXJDU05OYmhzZlVKUGVLbTQ5NUVHTUVH?=
 =?utf-8?B?amVoZTR4N2poa08vUjhMb3NHbTlvOEsvL3lrSlA1eHYxNDZmd1kwbzI5aWpX?=
 =?utf-8?B?MkRIOXZ0Uno5SUJYSlFIU1pKRDlMcDdPOHg5aDhjbUVCWE5XeEFBbzdQSW5B?=
 =?utf-8?B?Ti9zdFRENXlaeGVncEZJOExZd24xeHBoK3F6ZUhlRGNtUXJaRXJ1R3lrNFNO?=
 =?utf-8?B?SHdUeEZrNzk1UEFlNHRCaTZsTzBNUGpVKzBRRjJYTTRVdDg2VitGVGljcW9F?=
 =?utf-8?B?WWgzM0UrNXNWN3MweDk0ZmRYcXAvVzNMNXJXcXltZW5mMEFadW1QV2hTb08r?=
 =?utf-8?B?bXBUUnFuSm9ubSszUlI0Q0NOYWlpbVI5ejBXaitoK1lYSFpST2VneGp3dUt2?=
 =?utf-8?B?b01RV09EN1R2WXNlWk1HdE9XQlhjYTlzN2UzQXIzQ0F1ZU44VXBteHpuL0hu?=
 =?utf-8?B?TG9mOUE5eUZBQjlZS1NackpZRktoekdUMjJTT3h4bDU5YlhDaitmRk9udWh1?=
 =?utf-8?B?WjVTYU5vTTB1RDJZU2paYW5oMFZLQ0c1Qm8za21jV09WVWpaa3QrZVM1eUN0?=
 =?utf-8?B?WU1qZ0c3Vmd6aHAvMm1SdnlZaE9GdlNEbW12WnRyQUl4ZTFybU9nTUhHNW9D?=
 =?utf-8?B?Ync0Zy9OS3d2aEdXcmthWWVrMittRzhBWG9icmhOOVJJWG5YT3p6NXNaTUl0?=
 =?utf-8?B?emFqOG1kU1BqTEdaWGs4amRXdUNMOUhVUHc2Qk1wZzdXUlRZRlpuZE01bGZu?=
 =?utf-8?B?TWQzaHp4TXdwNWdlR3ZBZ2E4MXVhVHpzdWZRV0RjNnVPdnFvQ05MdDFpVWF1?=
 =?utf-8?B?bkZaRWovempveTgyaVRtQkdmemlKWXVVMExjN1JPZkljU0NxTFUzOXlHTFIz?=
 =?utf-8?B?SEI3enJSd1NOMU1jeUcycVg0WjJyNWZiZkxUZ1V3K3pFSjdDT3IwVG5rLzNE?=
 =?utf-8?B?RjBBRXA0NTk4VFpCMWVqNlRTTDZ4Smx1KytMODc1UVV3RWV4V2VlaXJRaE9X?=
 =?utf-8?B?M3ZxTGhyeDErR1U3WjBXSFpvYVFYanM5NDM3NzlxR0JmZ1o1QWhaK050NDNY?=
 =?utf-8?B?bWV1YzRqdUwyM2RCcHJDN1F3d05aejdUdkFmRitqV01FNmZ5amxiNFQ5T0wy?=
 =?utf-8?B?UzBxNm8wUzRrM3lpUVFuYlBtbkV5VmZZbGtjWXRkVFRJS0xQOG1yL3dWaFlR?=
 =?utf-8?B?OFc3Qkw5N3RqckFtZjRWblNpaXhPbW1OeGZsT1RUSFVKRFFkZTFpSTFySS9t?=
 =?utf-8?B?UUY4bENOYXlMQXltaExxRHNxNWQrVXI0T2lqdDJkRU1jMlNNZ1JVbmZlWUpi?=
 =?utf-8?B?TzBtTjVoMzZNN3UxbFVqcnFobHhyNWRnTGUyUjJIK3NvU1JBMzh2M2pWV3VB?=
 =?utf-8?B?TVFEcTVrZE55WGpZMHFxdVZVaXlzdkxsKzlzNUhWaXRvQmdSRnZzQzlGQjVO?=
 =?utf-8?B?NDVaWndmV1prVzlEeDdYWFVCQnpGbzZZK29meVBHcU1oem9ITm9pY2RRN1Zw?=
 =?utf-8?B?emlKZFpicjJDczBrSDk2QjR1R1J4U3pwQWlxUkcwWHAzZVRaZzJsUE5YVStF?=
 =?utf-8?B?MklvTUpnY3gySGNmNWRxcllxbmg5UnN1d0o0Vyt2cmpEcUtoMTU4d3AzVDU5?=
 =?utf-8?B?MVl2V3lGQlUrZ1N3d0pIRFlURXFuS1J2N3dSa0J3bXJTZGRGNmhjRm1ra1lm?=
 =?utf-8?B?MEt4dkJvRHNjSU9ra2pPWmU5ZGF1cjIxd1ptZUROK20yUGo3eU4rK1ZGRUh2?=
 =?utf-8?B?NVBnR3NCbVVHOGFuL2ljbGtqcUJaUys0bGhXanVYSERYd09mRDk0Nk1QeXNv?=
 =?utf-8?B?S3BzYXduVzJtT0d3Z0JLUE9hV1FWK3p2aFpJeGFHMUZSYTZ3SFFkdXRGcHNm?=
 =?utf-8?B?UU5xL3hiQmh6MitBSnJSNENLZFphdTBpTVZoQk84MlBsWGpGZFlQczFmdmQ5?=
 =?utf-8?B?K3pOdS92bEMvSWNTMWFBRGt0b05SeHd6U3plR0pFSjAxQUc3TTFpZWNYY3ZF?=
 =?utf-8?Q?qJKcmzRelwb02tPJPIiTFVCY6?=
Content-ID: <29BB8FE61CD6AD45B97419189D5D9EA2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ad4815-1047-4945-1bb0-08ddc373120a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 07:41:54.7605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0WoUzUbtOLqAVBarkmtyz1tLS2/2gVfF94Ny5ZVHKZziqfEPjz1o4vI++ffSb4uNQ2kPyQWEsE96OqF/Nak9mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7256
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_654330131.1367175851"
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

--__=_Part_Boundary_006_654330131.1367175851
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTA3LTA3IGF0IDA5OjMxICswODAwLCBzaGFuZ3lhbyBsaW4gd3JvdGU6DQo+
IEZyb206ICJzaGFuZ3lhby5saW4iIDxzaGFuZ3lhby5saW5AbWVkaWF0ZWsuY29tPg0KPiANCj4g
QWRkIGNhbWVyYSBpc3A3eCBtb2R1bGUgZGV2aWNlIGRvY3VtZW50Lg0KPiANCj4gLS0tDQo+IA0K
PiBDaGFuZ2VzIGluIHYyOg0KPiAgIC0gUmVuYW1lIGJpbmRpbmcgZmlsZSB0byBtZWRpYXRlayxt
dDgxODgtY2FtLXl1di55YW1sDQo+ICAgLSBWYXJpb3VzIGZpeGVzIHBlciByZXZpZXcgY29tbWVu
dHMNCj4gICAtIFVwZGF0ZSBtYWludGFpbmVycyBsaXN0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBz
aGFuZ3lhby5saW4gPHNoYW5neWFvLmxpbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgLi4uL21l
ZGlhdGVrL21lZGlhdGVrLG10ODE4OC1jYW0teXV2LnlhbWwgICAgIHwgMTM0ICsrKysrKysrKysr
KysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzNCBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUg
bW9kZSAxMDA3NTUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrL21lZGlhdGVrLG10ODE4OC1jYW0teXV2LnlhbWwNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4
MTg4LWNhbS15dXYueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlay9tZWRpYXRlayxtdDgxODgtY2FtLXl1di55YW1sDQo+IG5ldyBmaWxlIG1vZGUg
MTAwNzU1DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMGRlMTIwZDNjNmU4DQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrL21lZGlhdGVrLG10ODE4OC1jYW0teXV2LnlhbWwNCj4gQEAgLTAsMCArMSwxMzQgQEANCj4g
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNl
KQ0KPiArIyBDb3B5cmlnaHQgKGMpIDIwMjQgTWVkaWFUZWsgSW5jLg0KPiArJVlBTUwgMS4yDQo+
ICstLS0NCj4gKyRpZDogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9zY2hlbWFzL21lZGlhL21lZGlhdGVrL21lZGlhdGVrLGNhbS15dXYueWFtbCpfXztJ
dyEhQ1RSTktBOXdNZzBBUmJ3IW01bGxJaHhiNTJhdGZiSnU3SlpjUE9qV0hSMnlwVHNsOGhBaFpi
WDVrTTkxVm4xZFB2OVJQRENYSHhOd01KRExmMDVjc1h1S3FjaHVSX2YwWWpPNkZTOCQgDQo+ICsk
c2NoZW1hOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFtNWxsSWh4YjUy
YXRmYkp1N0paY1BPaldIUjJ5cFRzbDhoQWhaYlg1a005MVZuMWRQdjlSUERDWEh4TndNSkRMZjA1
Y3NYdUtxY2h1Ul9mMGNXNnI3dlUkIA0KPiArDQo+ICt0aXRsZTogVGhlIGNhbS15dXYgdW5pdCBv
ZiBNZWRpYVRlayBJU1Agc3lzdGVtDQo+ICsNCj4gK21haW50YWluZXJzOg0KPiArICAtIFNoYW5n
eWFvIExpbiA8c2hhbmd5YW8ubGluQG1lZGlhdGVrLmNvbT4NCj4gKyAgLSBTaHUtaHNpYW5nIFlh
bmcgPHNodS1oc2lhbmcueWFuZ0BtZWRpYXRlay5jb20+DQo+ICsgIC0gU2h1bi15aSBXYW5nIDxz
aHVuLXlpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiArICAtIFRlZGR5IENoZW4gPHRlZGR5LmNoZW5A
bWVkaWF0ZWsuY29tPg0KPiArDQo+ICtkZXNjcmlwdGlvbjoNCj4gKyAgTWVkaWFUZWsgY2FtLXl1
diBpcyB0aGUgY2FtZXJhIFlVViBwcm9jZXNzaW5nIHVuaXQgaW4gTWVkaWFUZWsgU29DLg0KPiAr
DQo+ICtwcm9wZXJ0aWVzOg0KPiArICBjb21wYXRpYmxlOg0KPiArICAgIGNvbnN0OiBtZWRpYXRl
ayxtdDgxODgtY2FtLXl1dg0KDQpJbiBwYXRjaCBbNy8xM10sIHlvdSBzYXkgeXV2IGFuZCByYXcg
dXNlIHRoZSBzYW1lIGhhcmR3YXJlIHdpdGggZGlmZmVyZW5jZSBzb2Z0d2FyZSBjb25maWd1cmF0
aW9uLg0KU28geW91IHNob3VsZCBub3QgaGF2ZSBkaWZmZXJlbnQgYmluZGluZyBmb3IgeXV2IGFu
ZCByYXcuDQpVc2Ugb25lIChtYXliZSBtZWRpYXRlayxtdDgxODgtY2FtLXJhdykgZm9yIGJvdGgg
eXV2IGFuZCByYXcuDQpJbiB5b3VyIGRyaXZlciwgdHJ5IGFub3RoZXIgd2F5IHRvIGRlY2lkZSBp
dCB3b3JrcyBhcyB5dXYgb3IgcmF3Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArDQo+ICsNCg0K

--__=_Part_Boundary_006_654330131.1367175851
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMDctMDcmIzMyO2F0
JiMzMjswOTozMSYjMzI7KzA4MDAsJiMzMjtzaGFuZ3lhbyYjMzI7bGluJiMzMjt3cm90ZToNCiZn
dDsmIzMyO0Zyb206JiMzMjsmcXVvdDtzaGFuZ3lhby5saW4mcXVvdDsmIzMyOyZsdDtzaGFuZ3lh
by5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBZGQmIzMyO2NhbWVy
YSYjMzI7aXNwN3gmIzMyO21vZHVsZSYjMzI7ZGV2aWNlJiMzMjtkb2N1bWVudC4NCiZndDsmIzMy
Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0NoYW5nZXMmIzMyO2luJiMzMjt2
MjoNCiZndDsmIzMyOyYjMzI7JiMzMjstJiMzMjtSZW5hbWUmIzMyO2JpbmRpbmcmIzMyO2ZpbGUm
IzMyO3RvJiMzMjttZWRpYXRlayxtdDgxODgtY2FtLXl1di55YW1sDQomZ3Q7JiMzMjsmIzMyOyYj
MzI7LSYjMzI7VmFyaW91cyYjMzI7Zml4ZXMmIzMyO3BlciYjMzI7cmV2aWV3JiMzMjtjb21tZW50
cw0KJmd0OyYjMzI7JiMzMjsmIzMyOy0mIzMyO1VwZGF0ZSYjMzI7bWFpbnRhaW5lcnMmIzMyO2xp
c3QNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO3NoYW5neWFvLmxpbiYj
MzI7Jmx0O3NoYW5neWFvLmxpbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsm
IzMyOyYjMzI7Li4uL21lZGlhdGVrL21lZGlhdGVrLG10ODE4OC1jYW0teXV2LnlhbWwmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7MTM0JiMzMjsrKysrKysrKysrKysrKysrKysNCiZndDsm
IzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEzNCYjMzI7aW5zZXJ0aW9ucygr
KQ0KJmd0OyYjMzI7JiMzMjtjcmVhdGUmIzMyO21vZGUmIzMyOzEwMDc1NSYjMzI7RG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrL21lZGlhdGVrLG10ODE4OC1j
YW0teXV2LnlhbWwNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrL21lZGlhdGVrLG10
ODE4OC1jYW0teXV2LnlhbWwmIzMyO2IvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL21lZGlhdGVrL21lZGlhdGVrLG10ODE4OC1jYW0teXV2LnlhbWwNCiZndDsmIzMyO25l
dyYjMzI7ZmlsZSYjMzI7bW9kZSYjMzI7MTAwNzU1DQomZ3Q7JiMzMjtpbmRleCYjMzI7MDAwMDAw
MDAwMDAwLi4wZGUxMjBkM2M2ZTgNCiZndDsmIzMyOy0tLSYjMzI7L2Rldi9udWxsDQomZ3Q7JiMz
MjsrKysmIzMyO2IvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrL21lZGlhdGVrLG10ODE4OC1jYW0teXV2LnlhbWwNCiZndDsmIzMyO0BAJiMzMjstMCwwJiMz
MjsrMSwxMzQmIzMyO0BADQomZ3Q7JiMzMjsrIyYjMzI7U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
JiMzMjsoR1BMLTIuMC1vbmx5JiMzMjtPUiYjMzI7QlNELTItQ2xhdXNlKQ0KJmd0OyYjMzI7KyMm
IzMyO0NvcHlyaWdodCYjMzI7KGMpJiMzMjsyMDI0JiMzMjtNZWRpYVRlayYjMzI7SW5jLg0KJmd0
OyYjMzI7KyVZQU1MJiMzMjsxLjINCiZndDsmIzMyOystLS0NCiZndDsmIzMyOysmIzM2O2lkOiYj
MzI7aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL21lZGlhL21lZGlhdGVrL21lZGlhdGVrLGNhbS15dXYueWFtbCpfXztJdyEhQ1RSTktBOXdN
ZzBBUmJ3IW01bGxJaHhiNTJhdGZiSnU3SlpjUE9qV0hSMnlwVHNsOGhBaFpiWDVrTTkxVm4xZFB2
OVJQRENYSHhOd01KRExmMDVjc1h1S3FjaHVSX2YwWWpPNkZTOCYjMzY7JiMzMjsNCiZndDsmIzMy
OysmIzM2O3NjaGVtYTomIzMyO2h0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3
IW01bGxJaHhiNTJhdGZiSnU3SlpjUE9qV0hSMnlwVHNsOGhBaFpiWDVrTTkxVm4xZFB2OVJQRENY
SHhOd01KRExmMDVjc1h1S3FjaHVSX2YwY1c2cjd2VSYjMzY7JiMzMjsNCiZndDsmIzMyOysNCiZn
dDsmIzMyOyt0aXRsZTomIzMyO1RoZSYjMzI7Y2FtLXl1diYjMzI7dW5pdCYjMzI7b2YmIzMyO01l
ZGlhVGVrJiMzMjtJU1AmIzMyO3N5c3RlbQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K21haW50YWlu
ZXJzOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjstJiMzMjtTaGFuZ3lhbyYjMzI7TGluJiMzMjsmbHQ7
c2hhbmd5YW8ubGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOysmIzMyOyYjMzI7LSYjMzI7
U2h1LWhzaWFuZyYjMzI7WWFuZyYjMzI7Jmx0O3NodS1oc2lhbmcueWFuZ0BtZWRpYXRlay5jb20m
Z3Q7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOy0mIzMyO1NodW4teWkmIzMyO1dhbmcmIzMyOyZsdDtz
aHVuLXlpLndhbmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7KyYjMzI7JiMzMjstJiMzMjtU
ZWRkeSYjMzI7Q2hlbiYjMzI7Jmx0O3RlZGR5LmNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYj
MzI7Kw0KJmd0OyYjMzI7K2Rlc2NyaXB0aW9uOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjtNZWRpYVRl
ayYjMzI7Y2FtLXl1diYjMzI7aXMmIzMyO3RoZSYjMzI7Y2FtZXJhJiMzMjtZVVYmIzMyO3Byb2Nl
c3NpbmcmIzMyO3VuaXQmIzMyO2luJiMzMjtNZWRpYVRlayYjMzI7U29DLg0KJmd0OyYjMzI7Kw0K
Jmd0OyYjMzI7K3Byb3BlcnRpZXM6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyO2NvbXBhdGlibGU6DQom
Z3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjtjb25zdDomIzMyO21lZGlhdGVrLG10ODE4OC1j
YW0teXV2DQoNCkluJiMzMjtwYXRjaCYjMzI7WzcvMTNdLCYjMzI7eW91JiMzMjtzYXkmIzMyO3l1
diYjMzI7YW5kJiMzMjtyYXcmIzMyO3VzZSYjMzI7dGhlJiMzMjtzYW1lJiMzMjtoYXJkd2FyZSYj
MzI7d2l0aCYjMzI7ZGlmZmVyZW5jZSYjMzI7c29mdHdhcmUmIzMyO2NvbmZpZ3VyYXRpb24uDQpT
byYjMzI7eW91JiMzMjtzaG91bGQmIzMyO25vdCYjMzI7aGF2ZSYjMzI7ZGlmZmVyZW50JiMzMjti
aW5kaW5nJiMzMjtmb3ImIzMyO3l1diYjMzI7YW5kJiMzMjtyYXcuDQpVc2UmIzMyO29uZSYjMzI7
KG1heWJlJiMzMjttZWRpYXRlayxtdDgxODgtY2FtLXJhdykmIzMyO2ZvciYjMzI7Ym90aCYjMzI7
eXV2JiMzMjthbmQmIzMyO3Jhdy4NCkluJiMzMjt5b3VyJiMzMjtkcml2ZXIsJiMzMjt0cnkmIzMy
O2Fub3RoZXImIzMyO3dheSYjMzI7dG8mIzMyO2RlY2lkZSYjMzI7aXQmIzMyO3dvcmtzJiMzMjth
cyYjMzI7eXV2JiMzMjtvciYjMzI7cmF3Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7Kw0K
Jmd0OyYjMzI7Kw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0t
PjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3Rp
Y2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0
aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBj
b25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1w
dCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0
byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkg
dXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBv
ciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5
IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSAN
CmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhp
cyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_006_654330131.1367175851--


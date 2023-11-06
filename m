Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0227E1869
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 02:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BD810E056;
	Mon,  6 Nov 2023 01:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DE510E056
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 01:59:24 +0000 (UTC)
X-UUID: 179b04bc7c4811eea33bb35ae8d461a2-20231106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=s4X62Sic+Pj4R+gT3pJwkG3yH/gFZt2zOn1Wy8WcUVc=; 
 b=JK73GMNJHett3HLTdyU+5eu++OPY+bp+nrWEDpCKbIPhbZczK9R167rOh4Byi0LHoNbPpMpZzuWJ1qT9qHB/TdR9+jyaZpBDn6vS3eaD3JcJ77M6RSQYUbu4LFYrDxHn+dsZ29OnxF3v+UylOL0pEVIJhPTash1+9JphVkp8gwE=;
X-CID-CACHE: Type:Local,Time:202311060936+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:eba2150f-3780-430a-bc22-706ca5517f5f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:364b77b, CLOUDID:13b7b55f-c89d-4129-91cb-8ebfae4653fc,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 179b04bc7c4811eea33bb35ae8d461a2-20231106
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 617547964; Mon, 06 Nov 2023 09:59:17 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Nov 2023 09:59:15 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Nov 2023 09:59:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RV6uCZn66uLdIeVIcBw23OQy2ipMGtlFYein0fVA90cPsoOKHiTwIbxNWfo3RZILBHOS/HqTJBq45BpL/YelsGN7RGvPGwn+nZxK4OFfIiWI+etTUuip8Euq7SzN3uBWh+qQarHBJ47IPd1QcxtjS+Uks615m5SskB0HpRtG2qaBwcjjpnzTftR4aK5npY90ULKIjGObm1I8cSyWm1arfAI+BZygPIgfT6uxaUv4HveXBnbq41xm47g9kptLmEt36ZTPucfglntVHsUab5oIIjLtfPELMdzSgZP9ZJZruFbrb99mHkNcaoBySEURa7cfEkxUGLHgGE1i2WdN5uPSKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViQyoslq8w9YC3E+RZ0xscmJihoKxJcH2ikQi/zZUBI=;
 b=XGe/q2kSuST0b8pV2VDJTPj3UJEO8GYiU+hlN9r7ZtqjszyA8ujJPpWSoJy9qbFqScSwpPv02kvnViILFSwl17B+d6fOdiFQiIHs9NeomnfgUX74qb9rSWyelWxOKdEiYKUAOTxJV4fn99iz78kSe30gd4dOihkz0MYLudyefQFvOrHwJb4jzPX9ja6/jmNnHitVBUoE6BeTmwfMVSOuYp4abQakT7TirP76Pxf136qYREsTReIseqRmYAxLlBi4DdtMOGAQcIimXa0iIufW8rrVwRmx/c46Vo3Ix1Ey9qNN98WRv2WYRYLLPEr2vKKElO2wzrtif4HzTVnvkevjtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViQyoslq8w9YC3E+RZ0xscmJihoKxJcH2ikQi/zZUBI=;
 b=PFL3deZXJBUkjmHTV7EDuMb6B054aId8OecyYegu3J3t14Dh/SMR1B9ORkFTljWZcWhlBFHW6t4b9CfU7XjEt0wPh30Gl5bKarmT8Z88p3YU0J7IhWvj8lXkOj8bzGOlEqpZtkUCljuW7lTMa/unfHLfd4LjItWNQaGoM14NuoU=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SG2PR03MB7278.apcprd03.prod.outlook.com (2603:1096:4:1d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.24; Mon, 6 Nov
 2023 01:59:13 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::ebb9:e872:cb84:4a88]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::ebb9:e872:cb84:4a88%5]) with mapi id 15.20.6954.025; Mon, 6 Nov 2023
 01:59:13 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 10/11] drm/mediatek: Add cmdq_insert_backup_cookie
 before secure pkt finalize
Thread-Topic: [PATCH v2 10/11] drm/mediatek: Add cmdq_insert_backup_cookie
 before secure pkt finalize
Thread-Index: AQHaBWvvI1CahMVgtEeLc9wOstYjZ7BbXOwAgBByOoCAAMk6AIAABnOA
Date: Mon, 6 Nov 2023 01:59:12 +0000
Message-ID: <271afb98630ccae9a9dfb1e1a2e0dcbf4d82a861.camel@mediatek.com>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
 <20231023044549.21412-11-jason-jh.lin@mediatek.com>
 <7e856cd887d2f0319810f9b3ec50f9f5a52a8147.camel@mediatek.com>
 <393154d13115196fde483cc840393719a8844fc1.camel@mediatek.com>
 <cde7fe7dd8e7b26954c1cdfb132d9aa1b6f51745.camel@mediatek.com>
In-Reply-To: <cde7fe7dd8e7b26954c1cdfb132d9aa1b6f51745.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SG2PR03MB7278:EE_
x-ms-office365-filtering-correlation-id: c46a27a5-519f-464b-1dd5-08dbde6bf941
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 55hT3j1/XolvCVWfZABGc0lMbXzfNhSfRbKcguCEYEVVhFDvmw6OA+drDxx/kUPiOwSCPz+ba6TZ9rfLKKdsjtZ6JEXzir7XnaqHOrqTrjMuGbFEB03AMggSavS5SLE+XJEPl9YLAxtOh/olnyg+XP3fWJXiskrGsg4gvhYguegdVRMJEevt2h8ILAKFthp1JzV3/w30aImUOUS9vY47aLgvdignrrmHjTLdvlJp5FD76NGzqED8AGPM4nkWsGwZ76e+C4fULeQvRuyGSS4JvdHSXjYC+UIDVHxz0VMTdISYjEUaGKJjonJODK2SbiMzPrxoRRfccwzrVN680+k5A+xHBruMlqsFf1p52gyWM/kBN6Ro02d/maZBJ6dnaiv3jKukzbItZjGt1uMSQ4e6HMQA2HMMLaHxI+vys56W9n3pVzVU5vaRuk6GDH40HdwdlMcNGNzZuiQtM05FoCujiq5Ntd9dZARqSAB3L4u1QWyZYbkMpXJuFxoc43PHaA7Qy7iDQSmH/Y7+XWuYlH/ZBaZ+a0D9SU7vgt0VQNvgu+fn+K0aq1I4Y4Odm+txeIDfisjv9LeZjBcH6YAdoqSD2KiTTfWT6OxhMo+Pi1Z7qqEUMD8Kopocl3ZT4Rqfvmrx7Zo+9noUzvVLFFu2ailcjxhjh0efcwLYw7Dp3BQ+AwI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39860400002)(346002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(6512007)(2616005)(85182001)(38100700002)(38070700009)(86362001)(36756003)(122000001)(7416002)(83380400001)(5660300002)(2906002)(4326008)(478600001)(71200400001)(6506007)(54906003)(8936002)(76116006)(66446008)(66556008)(8676002)(66946007)(64756008)(41300700001)(66476007)(110136005)(4001150100001)(6486002)(316002)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WS96MlUzc1BIemFzWEZhQ20zbzBYSmpSTWhxNC9UTEl3VWlBYzBGamd3TUNI?=
 =?utf-8?B?b3NLRzRPd2l4MmtUelZmdHpMWXhCYXZSUXh3L0tvWVlrdStnVkoxdk9VMFhX?=
 =?utf-8?B?R2RLMGJWUGNLc2x5b0xrTlVqQXY2MGJlSk52SXhud3ZXMTBIMWZHYnBScG5j?=
 =?utf-8?B?bGowOW1qc3pqRnoxdmI4QzlnR214T1o4VS9mNTIydTUrajJXZzBZeXZla2Vr?=
 =?utf-8?B?ellsdVJPWE5kWnBYTEZwbFZ1YkpSaUFLTXBuZks5Z0RzUVNFZjFHN3phUFNG?=
 =?utf-8?B?TW1tcG5nVkJVcDg1OHlJdWdESlB4Q3RUYTFvS3hNWUZDYmcyWXduTzh6ZWlQ?=
 =?utf-8?B?M0tGSDA5dDhIWXk4UHdSeWVsSmFjR0MwT1duN1Fzb21CekU4NDFqbFhRVXhU?=
 =?utf-8?B?VXRhZml2SnJWdzVKa1hxZzNkM2RBalRCaG5TTVFVcElvN2xMalFXSlpWOCtV?=
 =?utf-8?B?ZGRvMXh3WnlqaFZLVFIvOU9rR0JMaWJISFBQZG9RbkF0K3BCcDhldUdUNUZS?=
 =?utf-8?B?SWZRNnFVRWwrcUhoMlVxbHJ3ZkM4TDdlak1XZWQycjM4VlNVOUhEQjhOMXFW?=
 =?utf-8?B?TEU5SnhQMVk3RGtlbEE2d0YvM2ptdmZiVHFUQjh6MnJjaUtTUTZCRVNhd0xH?=
 =?utf-8?B?SmZNWHBjUDRFakJQWHFuTm12TlNTYkNjbFFIOEpZc09PaG1lUVhXT0k3bkxK?=
 =?utf-8?B?d3lCTjMrbmk4cG15QzRDdTNTV2Z5QUxCd0RsMTNlOUtDV2Z0ZjAySnUzWGJY?=
 =?utf-8?B?ZEIzcjI2MXdYd2xNdWJDdlZyUlVBZXdyakNsNTVhMmNiMmJrU0h1T1hOK2ZZ?=
 =?utf-8?B?ZXgySHlrVlZENkxPcElIOHNKTTNqc3cxVHJXakI2RkNhOHlYa1pBOXBPM2ta?=
 =?utf-8?B?UHZwS0dtK0JYNUp4b0NseElBSGp2SzdQWmdBV1BTSzZzQmlHb1plaEZQaHh2?=
 =?utf-8?B?L3FTelUyVFdBSnV6QUFaSVZQQ0YyUGlLczlkQ2hQS2dITzZMa3YxQlNRVjB3?=
 =?utf-8?B?dEkyay9IaVJpL3d1U1RNSnNrS0NzUFpDNnpQemtyS0tmcWJua2g4OVpsSTlo?=
 =?utf-8?B?ekVpMm1LOHNKUzlrTnNXazVieG51NWZGWEh3bUQ1SmV6dXltZURYcVVUdjJB?=
 =?utf-8?B?MEZNODdVNFBkZGF4ZXI3T0Qvc0Rnak5MMUg3RC9PY1Njb2o1OVNva0loZnAy?=
 =?utf-8?B?VnVBbkMzSSs5U1p2eHhaUkZ6ZWRmdktCZG1VT1FjL01uYmhVTzJxZDNtbmt5?=
 =?utf-8?B?a0NMTmMvN2phb0hvYk5Yc0dMZlN1ZDQvSkxYUmRtVHJVN1hTbE9UKzFrT2h2?=
 =?utf-8?B?SUEzTHIzQ1Zqa0doR2g0blRScW9MT0M5TC95cDhFZjg3Wk1RRHlBZ1hYMi9j?=
 =?utf-8?B?Rk43N0VxSmlnbGQzdTNrL0hQYlBwalh1UmNmU1VWM0d5cVZPd3YvWXBIL2lH?=
 =?utf-8?B?MkJrTVVxUjVDUTk3bkhRdi83aGQvOTBnYU9kNFRxNUpkeWNJVkVzK2kzc1dD?=
 =?utf-8?B?NjgzdE44Z2s3VDdOeWt1enhmdFZYTGJodWkyUmpVS0h5Z0d0MVBjc2kvVC9p?=
 =?utf-8?B?OU9VYWYwVythcC96endONDNnb1RkT0FsNTA1WkZVTlV0dEZQYnpaeXh4WE4w?=
 =?utf-8?B?bUVrNVVtVFZza3hUakprRzBMY1BKZlJveE8reHFCT0hBaUNrRmtWOVZHaDVT?=
 =?utf-8?B?cERvN1REVTJwQXNQbzRRMW9FMWQvUUVjUzJhQXVlRy9BdG1rb0d0d0o4WUxp?=
 =?utf-8?B?VnJkamR6bit0ODdNcGtlVUFsV0dpejYzdGdMbm1NazUrT0p0NS9LQU1FcktB?=
 =?utf-8?B?TEVnVm1UbmFkT3Y0cXQ5N0h6TWV6QndPSG54RE9hYkc1NTlzMGs5dDhwUC9u?=
 =?utf-8?B?WXBNZWRHTUkxMEZRV1h1eW4wSVRVaDhLanpTMldKbTNoYVN5QlRSdUFxVnY0?=
 =?utf-8?B?VjZUbFhmUWZTOHlFS09pSjVScFpWWllBR1hGaXBucXArZko0c2tjVkFuUmdu?=
 =?utf-8?B?cHFoS3p5YXc1TlFSVk5icDFzMm9MK1pJWllMeXN2ZXFtWG5Kb3R4NE1tazFr?=
 =?utf-8?B?em5seW4vd1dqejM4dFR4VzZKKzllc3hPbXBySGJreGRydlNabXU1T0Q1K0w2?=
 =?utf-8?B?elZiUDJWWklVREtoUXlTU3ZtMFNVeUk1Yk9rYTBIdU9rQVpuRnRRRnMrYWpR?=
 =?utf-8?B?akE9PQ==?=
Content-ID: <FCC1D4FCA7C7964C8E27549BE100BE9F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c46a27a5-519f-464b-1dd5-08dbde6bf941
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 01:59:12.7156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TsvJLAM7SvzyIHVxJOALOFX9La19NGJZdtDUeCKyuUcrEk+K1B4hgaVuAjXT+6xibmZuT31WXnwPYHtTlWNd2el5kuPkK62nrXBO0SWr9L0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB7278
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_384161423.1642935209"
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
Cc: "jkardatzke@google.com" <jkardatzke@google.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_384161423.1642935209
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtNb24sJiMzMjsyMDIzLTExLTA2JiMzMjthdCYjMzI7MDE6MzYmIzMyOysw
MDAwLCYjMzI7Q0smIzMyO0h1JiMzMjsoJiMzMjk5MzsmIzIwNDI2OyYjMjA4MDk7KSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjtPbiYjMzI7U3VuLCYjMzI7MjAyMy0xMS0wNSYjMzI7YXQmIzMyOzEzOjM1
JiMzMjsrMDAwMCwmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyOygmIzI2NTE5OyYjMzA1OTE7JiMz
MTA3NzspJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO0hpJiMzMjtDSywNCiZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7T24mIzMyO1RodSwmIzMyOzIwMjMtMTAtMjYm
IzMyO2F0JiMzMjswMjoyNiYjMzI7KzAwMDAsJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYj
MjA0MjY7JiMyMDgwOTspJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0hp
LCYjMzI7SmFzb246DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsm
IzMyOyZndDsmIzMyO09uJiMzMjtNb24sJiMzMjsyMDIzLTEwLTIzJiMzMjthdCYjMzI7MTI6NDUm
IzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyOyZndDsmIzMyO0FkZCYjMzI7Y21kcV9pbnNlcnRfYmFja3VwX2Nvb2tpZSYjMzI7
dG8mIzMyO2FwcGVuZCYjMzI7c29tZSYjMzI7Y29tbWFuZHMmIzMyO2JlZm9yZQ0KJmd0OyYjMzI7
Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7RU9DOg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0OyYjMzI7MS4mIzMyO0dldCYjMzI7R0NFJiMzMjtIVyYjMzI7dGhyZWFkJiMzMjtleGVj
dXRlJiMzMjtjb3VudCYjMzI7ZnJvbSYjMzI7dGhlJiMzMjtHQ0UmIzMyO0hXJiMzMjtyZWdpc3Rl
ci4NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOzIuJiMzMjtBZGQmIzMyOzEm
IzMyO3RvJiMzMjt0aGUmIzMyO2V4ZWN1dGUmIzMyO2NvdW50JiMzMjthbmQmIzMyO3RoZW4mIzMy
O3N0b3JlJiMzMjtpbnRvJiMzMjthJiMzMjtzaGFyZWQNCiZndDsmIzMyOyZndDsmIzMyOyZndDsm
IzMyOyZndDsmIzMyO21lbW9yeS4NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7SSYjMzI7dGhpbmsmIzMyO3doZW4mIzMyO2NtZHEmIzMyO2Ry
aXZlciYjMzI7aGFuZGxlciYjMzI7aW50ZXJydXB0LCYjMzI7aXQmIzMyO2NvdWxkJiMzMjtzaW1w
bHkmIzMyO2NhbGwNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2ludG8NCiZndDsmIzMyOyZn
dDsmIzMyOyZndDsmIzMyO1RFRSYjMzI7d2l0aCYjMzI7YW4mIzMyO0FQSSYjMzI7dG8mIzMyO3F1
ZXJ5JiMzMjtzdGF0dXMuJiMzMjtUaGUmIzMyO3N0YXR1cyYjMzI7bm90JiMzMjtvbmx5JiMzMjt0
aGUmIzMyO2V4ZWN1dGUNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2NvdW50LA0KJmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7YnV0JiMzMjthbHNvJiMzMjtvdGhlciYjMzI7bWVzc2FnZSYj
MzI7aW5jbHVkaW5nJiMzMjtlcnJvciYjMzI7aW5mb3JtYXRpb24uJiMzMjtTbyYjMzI7aXQmIzM5
O3MmIzMyO25vdA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7bmVjZXNzYXJ5JiMzMjt0byYj
MzI7dXNlJiMzMjtzdWNoJiMzMjtub24tdHJpY2t5JiMzMjt3YXkmIzMyO3RvJiMzMjtnZXQmIzMy
O2V4ZWN1dGUmIzMyO2NvdW50Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtUaGUmIzMyO3JlYXNvbiYjMzI7d2h5JiMzMjt3ZSYjMzI7dXNlJiMzMjtzaGFyZWQmIzMyO21l
bW9yeSYjMzI7dG8mIzMyO3JlY29yZCYjMzI7ZXhlY3V0ZSYjMzI7Y291bnQmIzMyO2hlcmUNCiZn
dDsmIzMyOyZndDsmIzMyO2lzOg0KJmd0OyYjMzI7Jmd0OyYjMzI7MS4mIzMyO25vcm1hbCYjMzI7
d29ybGQmIzMyO2NhbiYjMzI7bm90JiMzMjthY2Nlc3MmIzMyO3RoZSYjMzI7cmVnaXN0ZXImIzMy
O29mJiMzMjtzZWN1cmUmIzMyO0dDRSYjMzI7dGhyZWFkJiMzMjtpbg0KJmd0OyYjMzI7Jmd0OyYj
MzI7bm9ybWFsJiMzMjt3b3JsZC4NCiZndDsmIzMyOyZndDsmIzMyOzIuJiMzMjtjYWxsaW5nJiMz
MjtURUUmIzMyO2ludm9rZSYjMzI7Y21kJiMzMjtpbiYjMzI7dGhlJiMzMjtpcnEmIzMyO2hhbmRs
ZXImIzMyO3dvdWxkJiMzMjtiZSYjMzI7ZXhwZW5zaXZlJiMzMjthbmQNCiZndDsmIzMyOyZndDsm
IzMyO25vdA0KJmd0OyYjMzI7Jmd0OyYjMzI7c3RhYmxlLiYjMzI7SSYjMzk7dmUmIzMyO3Rlc3Rl
ZCYjMzI7dGhhdCYjMzI7YSYjMzI7c2luZ2xlJiMzMjtURUUmIzMyO2ludmxva2UmIzMyO2NtZCYj
MzI7dG8mIzMyO0NNRFEmIzMyO1BUQSYjMzI7Y29zdHMNCiZndDsmIzMyOyZndDsmIzMyOzE5JiMx
MjY7NTMmIzMyO3VzLiYjMzI7TWF5YmUmIzMyO2l0JiMzMjt3b3VsZCYjMzI7Y29zdCYjMzI7bW9y
ZSYjMzI7ZHVyaW5nJiMzMjt0aGUmIzMyO3NjZW5hcmlvJiMzMjt0aGF0JiMzMjtuZWVkcw0KJmd0
OyYjMzI7Jmd0OyYjMzI7bW9yZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Q1BVJiMzMjtsb2FkaW5nLg0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjtBZGQmIzMyO3RoaXMmIzMyO3RvJiMzMjtjb21tZW50Lg0KJmd0
OyYjMzI7DQpPSywmIzMyO0kmIzM5O2xsJiMzMjthZGQmIzMyO3RoaXMmIzMyO3RvJiMzMjtjb21t
ZW50Lg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtPbmUm
IzMyO21vcmUmIzMyO3F1ZXN0aW9uLiYjMzI7VGhlJiMzMjtjb21tYW5kJiMzMjtidWZmZXImIzMy
O2lzJiMzMjtub3QmIzMyO3NlY3VyZS4mIzMyO0RvZXMmIzMyO3RoZSYjMzI7R0NFDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtoYXJkd2FyZSYjMzI7ZXhlY3V0ZSYjMzI7dGhpcyYjMzI7bm9u
LXNlY3VyZSYjMzI7Y29tbWFuZCYjMzI7YnVmZmVyJiM2MzsNCiZndDsmIzMyOyZndDsmIzMyOyZn
dDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtHQ0UmIzMyO2Nv
bW1hbmQmIzMyO2J1ZmZlciYjMzI7aXMmIzMyO2dlbmVyYXRlJiMzMjtpbiYjMzI7dGhlJiMzMjtu
b3JtYWwmIzMyO3dvcmxkJiMzMjtmaXJzdC4mIzMyO1RoZW4mIzMyO2l0DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjt3aWxsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtiZSYjMzI7Y29waWVkJiMzMjt0byYjMzI7dGhl
JiMzMjtzaGFyZWQmIzMyO21lbW9yeSYjMzI7YW5kJiMzMjtwYXNzJiMzMjt0byYjMzI7dGhlJiMz
MjtzZWN1cmUmIzMyO3dvcmxkLiYjMzI7QWxsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt0aGUNCiZndDsm
IzMyOyZndDsmIzMyO2luc3RydWN0aW9uJiMzMjtpbiYjMzI7Y29tbWFuZCYjMzI7YnVmZmVyJiMz
Mjt3aWxsJiMzMjtiZSYjMzI7dmVyaWZpZWQmIzMyO2luJiMzMjtzZWN1cmUmIzMyO3dvcmxkJiMz
Mjt0aGVuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt0aGV5JiMzMjt3aWxsJiMzMjtiZSYjMzI7Y29waWVk
JiMzMjt0byYjMzI7dGhlJiMzMjtzZWN1cmUmIzMyO2NvbW1hbmQmIzMyO2J1ZmZlciYjMzI7YW5k
JiMzMjtleGVjdXRlZCYjMzI7YnkNCiZndDsmIzMyOyZndDsmIzMyO0dDRQ0KJmd0OyYjMzI7Jmd0
OyYjMzI7c2VjdXJlJiMzMjt0aHJlYWQuJiMzMjtJJiMzOTtsbCYjMzI7YWRkJiMzMjt0aGlzJiMz
MjtpbmZvcm1hdGlvbiYjMzI7dG8mIzMyO3RoZSYjMzI7Y292ZXImIzMyO2xldHRlciYjMzI7YXQm
IzMyO3RoZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7bmV4dCYjMzI7dmVyc2lvbi4NCiZndDsmIzMyOyZn
dDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7UmVnYXJkcw0KJmd0OyYjMzI7Jmd0OyYjMzI7SmFz
b24tSkguTGluDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
O1JlZ2FyZHMsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtDSw0KJmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0OyYjMzI7DQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioq
KioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioq
KioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGlu
Y2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRh
cnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRl
ciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0
byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0K
ZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1h
aWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQo
cykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBh
cmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSAN
CnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3Rp
ZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCks
IGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFu
eSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhl
IGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0K
PC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_384161423.1642935209
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIzLTExLTA2IGF0IDAxOjM2ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gU3VuLCAyMDIzLTExLTA1IGF0IDEzOjM1ICswMDAwLCBKYXNvbi1KSCBMaW4gKOae
l+edv+elpSkgd3JvdGU6DQo+ID4gSGkgQ0ssDQo+ID4gDQo+ID4gT24gVGh1LCAyMDIzLTEwLTI2
IGF0IDAyOjI2ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90ZToNCj4gPiA+IEhpLCBKYXNv
bjoNCj4gPiA+IA0KPiA+ID4gT24gTW9uLCAyMDIzLTEwLTIzIGF0IDEyOjQ1ICswODAwLCBKYXNv
bi1KSC5MaW4gd3JvdGU6DQo+ID4gPiA+IEFkZCBjbWRxX2luc2VydF9iYWNrdXBfY29va2llIHRv
IGFwcGVuZCBzb21lIGNvbW1hbmRzIGJlZm9yZQ0KPiA+ID4gPiBFT0M6DQo+ID4gPiA+IDEuIEdl
dCBHQ0UgSFcgdGhyZWFkIGV4ZWN1dGUgY291bnQgZnJvbSB0aGUgR0NFIEhXIHJlZ2lzdGVyLg0K
PiA+ID4gPiAyLiBBZGQgMSB0byB0aGUgZXhlY3V0ZSBjb3VudCBhbmQgdGhlbiBzdG9yZSBpbnRv
IGEgc2hhcmVkDQo+ID4gPiA+IG1lbW9yeS4NCj4gPiA+IA0KPiA+ID4gSSB0aGluayB3aGVuIGNt
ZHEgZHJpdmVyIGhhbmRsZXIgaW50ZXJydXB0LCBpdCBjb3VsZCBzaW1wbHkgY2FsbA0KPiA+ID4g
aW50bw0KPiA+ID4gVEVFIHdpdGggYW4gQVBJIHRvIHF1ZXJ5IHN0YXR1cy4gVGhlIHN0YXR1cyBu
b3Qgb25seSB0aGUgZXhlY3V0ZQ0KPiA+ID4gY291bnQsDQo+ID4gPiBidXQgYWxzbyBvdGhlciBt
ZXNzYWdlIGluY2x1ZGluZyBlcnJvciBpbmZvcm1hdGlvbi4gU28gaXQncyBub3QNCj4gPiA+IG5l
Y2Vzc2FyeSB0byB1c2Ugc3VjaCBub24tdHJpY2t5IHdheSB0byBnZXQgZXhlY3V0ZSBjb3VudC4N
Cj4gPiANCj4gPiBUaGUgcmVhc29uIHdoeSB3ZSB1c2Ugc2hhcmVkIG1lbW9yeSB0byByZWNvcmQg
ZXhlY3V0ZSBjb3VudCBoZXJlDQo+ID4gaXM6DQo+ID4gMS4gbm9ybWFsIHdvcmxkIGNhbiBub3Qg
YWNjZXNzIHRoZSByZWdpc3RlciBvZiBzZWN1cmUgR0NFIHRocmVhZCBpbg0KPiA+IG5vcm1hbCB3
b3JsZC4NCj4gPiAyLiBjYWxsaW5nIFRFRSBpbnZva2UgY21kIGluIHRoZSBpcnEgaGFuZGxlciB3
b3VsZCBiZSBleHBlbnNpdmUgYW5kDQo+ID4gbm90DQo+ID4gc3RhYmxlLiBJJ3ZlIHRlc3RlZCB0
aGF0IGEgc2luZ2xlIFRFRSBpbnZsb2tlIGNtZCB0byBDTURRIFBUQSBjb3N0cw0KPiA+IDE5fjUz
IHVzLiBNYXliZSBpdCB3b3VsZCBjb3N0IG1vcmUgZHVyaW5nIHRoZSBzY2VuYXJpbyB0aGF0IG5l
ZWRzDQo+ID4gbW9yZQ0KPiA+IENQVSBsb2FkaW5nLg0KPiANCj4gQWRkIHRoaXMgdG8gY29tbWVu
dC4NCj4gDQpPSywgSSdsbCBhZGQgdGhpcyB0byBjb21tZW50Lg0KDQpSZWdhcmRzLA0KSmFzb24t
SkguTGluDQoNCj4gPiANCj4gPiA+IA0KPiA+ID4gT25lIG1vcmUgcXVlc3Rpb24uIFRoZSBjb21t
YW5kIGJ1ZmZlciBpcyBub3Qgc2VjdXJlLiBEb2VzIHRoZSBHQ0UNCj4gPiA+IGhhcmR3YXJlIGV4
ZWN1dGUgdGhpcyBub24tc2VjdXJlIGNvbW1hbmQgYnVmZmVyPw0KPiA+ID4gDQo+ID4gDQo+ID4g
R0NFIGNvbW1hbmQgYnVmZmVyIGlzIGdlbmVyYXRlIGluIHRoZSBub3JtYWwgd29ybGQgZmlyc3Qu
IFRoZW4gaXQNCj4gPiB3aWxsDQo+ID4gYmUgY29waWVkIHRvIHRoZSBzaGFyZWQgbWVtb3J5IGFu
ZCBwYXNzIHRvIHRoZSBzZWN1cmUgd29ybGQuIEFsbA0KPiA+IHRoZQ0KPiA+IGluc3RydWN0aW9u
IGluIGNvbW1hbmQgYnVmZmVyIHdpbGwgYmUgdmVyaWZpZWQgaW4gc2VjdXJlIHdvcmxkIHRoZW4N
Cj4gPiB0aGV5IHdpbGwgYmUgY29waWVkIHRvIHRoZSBzZWN1cmUgY29tbWFuZCBidWZmZXIgYW5k
IGV4ZWN1dGVkIGJ5DQo+ID4gR0NFDQo+ID4gc2VjdXJlIHRocmVhZC4gSSdsbCBhZGQgdGhpcyBp
bmZvcm1hdGlvbiB0byB0aGUgY292ZXIgbGV0dGVyIGF0IHRoZQ0KPiA+IG5leHQgdmVyc2lvbi4N
Cj4gPiANCj4gPiBSZWdhcmRzDQo+ID4gSmFzb24tSkguTGluDQo+ID4gDQo+ID4gPiBSZWdhcmRz
LA0KPiA+ID4gQ0sNCj4gPiA+IA0K

--__=_Part_Boundary_001_384161423.1642935209--


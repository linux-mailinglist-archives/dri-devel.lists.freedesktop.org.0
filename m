Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC7B76AA7A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 10:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47F910E31B;
	Tue,  1 Aug 2023 08:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1729310E31B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 08:03:01 +0000 (UTC)
X-UUID: d432fd1c304111ee9cb5633481061a41-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=auBFc5127xLvGAHp5/HbgLsjTSEWfbJ6LUWbZXUoW10=; 
 b=t3Wl0vd1LKDebtaf0nE3gKVBjMu6XOMNpsHmztE3RihICPMOxjWYIlvhTYWrVloQTVNJYr2x3MLYxojY7IjTWDdhDmXSCA5gKLG6qkiLjXtiWYamzu7pbsReL4BZo1GJy+RTA9yMp1HN+p7ffSUjYBG5Obs4ntfQwkAna8+5lc4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30, REQID:d448b4fb-9ece-4caf-96d0-b4448d6bf35d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:1fcc6f8, CLOUDID:1fb5c2a0-0933-4333-8d4f-6c3c53ebd55b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d432fd1c304111ee9cb5633481061a41-20230801
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1558991428; Tue, 01 Aug 2023 16:02:58 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Aug 2023 16:02:57 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 1 Aug 2023 16:02:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/voS9UgNMGKxiGScWYY87MAQHCnxMcZcSTMqYkANZ35x5QsJGgSe+5yW7EjpdXXtm42Ya931YRNc6yU0zQO/5DVVXJ+3ELskb5BXkJ0CuE7zPOi2AESj2ixOczM2KJbwPTF01xgxN36AcfGiXdWK/E43mMbqJ56vF0E13Zy2BT886gDYuRZLwvQ+5hPprdM+3G1fOcO30nT0rnZ1woLLtNL8RDVcUpibslDtugBZXi2pP/iJVTcBddoonEj4yhpPU3xsiatBF5DrH6Xg6C4I/JzOCy9Wm6jpeOjpPsXUNRFZNES8sLYC9BSm9tPNxWs8sBZD5Q/3mFTvEmHEDlbwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiLuFDP/inRJY8fYNYkCPspN2nsOqatnw846JkuDvAA=;
 b=BdACRB5WNDYotOGUkU+BplZOU6i5WYweYyCoGdcajfFdormw9r3O5G/lpApPe40YpOcIiLOwHeYTJz2lLvtMqlbXGZ/lqIo20TXBDnGjGRY5SWneHSyuEGPP3Zwc1wBiQ/9p0RgiXGLkHwjTsUUhMOVSPwOJmcNde/xJKm0dPp3kN4XT8cn+YW+SZEbxD6qjPelY5WTY+FIP1m+dxPCQnX8ozS7z7wkt6fpItsGZAaJX4rPZqcvfNsS/XDcDmvF0ywq2o/ZVij/BWIS21iBTk21joZIMST1QyO3pDCoxjkddk8jsp3V4HT6xAZVTy1sB0Kc2Tzxi1kZG42N9B5G+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiLuFDP/inRJY8fYNYkCPspN2nsOqatnw846JkuDvAA=;
 b=kX4om4zlSm2E7N/z5t55Kvj18vS/pygbr+nccXVvNDPDory3yoZWoLFtCYl489MX+994TYxpVtIKPojwWiN1d9Ogk58S0OOTY6FsVEfLtHglLXuw7qdKiZxa0SwygVp5AT+OXyvOlT5PGMlBs85pyUgJCUj3nk4hPZcHLqFzqpw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7336.apcprd03.prod.outlook.com (2603:1096:820:ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 08:02:55 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 08:02:54 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "maxime@cerno.tech" <maxime@cerno.tech>,
 =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>
Subject: Re: [v5, PATCH] drm/mediatek: add dma buffer control for drm plane
 disable
Thread-Topic: [v5, PATCH] drm/mediatek: add dma buffer control for drm plane
 disable
Thread-Index: AQHZrwcT38y2+2g6EUytkMVWz8m92a+qzASAgCpzDwA=
Date: Tue, 1 Aug 2023 08:02:54 +0000
Message-ID: <0fe99eef64fada0cc8b58d7cbfc5a174b3e8ebbc.camel@mediatek.com>
References: <20230705060719.14700-1-yongqiang.niu@mediatek.com>
 <gmzb7lja2lfciu5m7ggxkftacaa6fbui45icwerabqad3lwrcn@nhdxug7fvh6u>
In-Reply-To: <gmzb7lja2lfciu5m7ggxkftacaa6fbui45icwerabqad3lwrcn@nhdxug7fvh6u>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7336:EE_
x-ms-office365-filtering-correlation-id: 76fe3161-6e9c-42eb-6321-08db9265b635
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mk/XMB5BPkDoMhO3ul7vULaui183JCElGZ5D39SJhgLcPjQUek7R4hbqDhCJfy035wjbUHYlVZ4U/vkhQrUBPC0tAS4nSPMwyJ7ylITRiHFN9MKp+7sGVOCOwypk4VshC9z51rcn3UqXjcrnyv3Bkf+UEEZ9D6UnwdniBIrmVO14NVw8+iTMtjNY0HZ7mlNhaS/smm3RGrGFJ8w2Bb3NJqriNT8cbeSzb8rfRur7b1PcZ04P1z2P/0W99tsZAS+Le5SQ/p2ArEZPrAjKYcGsKm/sjY3Ttk+A8V/AP2eGMEfiN90p6Z5N1qm/W5fHV8HxvQsuYjTKskeHAOSJMb1xw9Bcyf3Mc4iN9ohVWbeSqtKStt/L+IfgY9XHV500e2rhZHxFO/OEF30PNIPAhdIL5C2bK9McrYr+xScyxwlu/rVBVWePwbQ2pUs6Jq85JJjIxd38lBJS/0sxnMu9RFzTXoUvH7rhm81dCjoohqf/GqabA9Map0Lr5vLOopTA2GOLjJUhBD1MJXj33RQv1SXuHlCZbKCmiyqIIdPrtZbfZzfKI3W/9MBFR9+r3ymY3L95l7JGvnw/Z+qw8GXTNoyeLn97pwlWOLHkRbOcZ1e7bl2Qto9RxllcnIQVyPmKw8WXktz5TYYZ0zbT+yYs/ioVUh+nqCOcqN1ZEGIB45NyfhA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(6486002)(38100700002)(2906002)(83380400001)(122000001)(186003)(2616005)(6506007)(26005)(5660300002)(8676002)(38070700005)(86362001)(6512007)(8936002)(36756003)(7416002)(66446008)(85182001)(71200400001)(478600001)(64756008)(6636002)(66946007)(110136005)(66556008)(4326008)(54906003)(76116006)(66476007)(41300700001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0Y5WGQycVduWnJCS1BhdHR4V1ZkUlU1dStHa2JiejhoNTBIcHB6bFRZeXVE?=
 =?utf-8?B?eE9mQ08xU0ZxVUlDRHo0MlNtRDN1RHllL3hZQ0paUHc5MkxPWmtZcCt6UzRY?=
 =?utf-8?B?YUd0SlRtY2VhVnV1VlZQZWhBYm5nRWM5dHAyL3dvbDlRQXVULytSQmw4NzhL?=
 =?utf-8?B?azhaOWNpdWtpTFo5NGNvQmhONzVobDJ4c0ZVVTQ3TEp3YkNNTHE2MVpaclNo?=
 =?utf-8?B?OU1WUXk2L2ozcysxV0o2MGRMMUJyOXA0a2JZU1RSV2hyOU5xbTZXQk9UMUto?=
 =?utf-8?B?WndZWExkaTI2ZEVmSWk3bitwTXlkeTlUUm42L1MyYWEvQ2RIYlhLODNBTkRK?=
 =?utf-8?B?TmFqR3VNeGVLeW9hYUlNcTN5cWVEb3dzQTF2OVduS045amRqYjZWSFlTY01K?=
 =?utf-8?B?OENGR3BtUzVtbkNRdmM2TzFRckl4YktZbmhxNExmYlhlNUlnSDdVVmkxb0tm?=
 =?utf-8?B?dEZrK3BUSklsSjVGZWp0N2RTWUcyMkcwclRYaDQyTnphMW5DcXRicndweVJJ?=
 =?utf-8?B?bUNTVnZobWc0WlJnSW0yNE16T0txUFNwY3lEWjBaQkNUN0w1UFo3SW5ERTky?=
 =?utf-8?B?aXcvSlFSOE1WYUxHU2NFWlpNQ1VuS0V2R05xK1R3T21MSE1uRjJFR2FpNDdO?=
 =?utf-8?B?TlFPS2ZkSTlOa1FJVjEva2lOMlVaQ00rWHVYaGtUL2FVOEZxYlQ2MGtvNllu?=
 =?utf-8?B?QW9HTEh6VjUxUlV3eXpUQzNvakg5SW11Tk1tb0NwOHRuYUNJcWdqRko0cVVJ?=
 =?utf-8?B?K0FxZHkwK1ljTGtpcjRzcjdMNHRIWFo5ZjQ0QTVkWFZzWVpSQWU0VmlMSGZG?=
 =?utf-8?B?VmJsck1YK1lQOHFUb09BQnBZeU5BRXVpQzcxWXdTUWRqMzdHQ1ZNL2hzWEtQ?=
 =?utf-8?B?N0ZLUEdXbXllNWEyYVNjcDQ5VnJBQnRCTm4wUUNPUVVlK0tVTXFoU3hWVFlT?=
 =?utf-8?B?Vjhyd0FnWFViMDJoSHJOekxRdDlPRkJhNEc0elZiZjI5bERKNFlKUmhLZ3hz?=
 =?utf-8?B?d3pabFROMVRpbUsxN25LR2dBNWlGVGVEdUwwQ01CYVd1bUdqNnM0NTNZcUJx?=
 =?utf-8?B?dzkzWStPUVBYM3loODJSRVRub09QaENxWElZckdaTDFWcE4vSXJTYUU1T3ox?=
 =?utf-8?B?SEl3cTJteWk5TDdRWTdKZGs0eFZEY0h1T1dHZXE1VjlJRGVvYmMxUExJcFpl?=
 =?utf-8?B?bzBhWURNcklaN2FldW1hWUZhUndQWXRTajZHTWczR1krTTNYcmZFWXUrUVpp?=
 =?utf-8?B?bzB2cVhpQWlCd0k3cHBLRm5sVU5aajJwaVByWXpwcTdCZ3h2OWJxdnZJZkJo?=
 =?utf-8?B?V0ZZTm5TVUhWRW55SVFOdUxSaVN3NG9idWRzZktEN1BKVUU1ckJ3SGRrOFBH?=
 =?utf-8?B?Qk5mRHhwdVhqc0xEU1ZYRVF6S0xWd1JRTXBZQXJxLy9sanNvam1GY0dlRGJP?=
 =?utf-8?B?RFR5ekFqNG9LREJVVWdDazhNVkFHVURuSTdYS3phelJxVEdUR1Bnbkc3eGJl?=
 =?utf-8?B?WnFSNHNEdHNSUmMwOUU4dWMyVGNacGkwc2FWUWVNOTZTRkhpQXpmQ1AxYUM0?=
 =?utf-8?B?UHAzd2VnOHNzUDZvYmNOK1EvNW5IcTRLenhTYmZVeUVIN0thTG1RM1ZnVXRD?=
 =?utf-8?B?QVNmejVsVTlYY2pWczBpRitNRnU0eUcvaS9GZXRoZ2d4OEpjazlJdHRiVE80?=
 =?utf-8?B?MnRZWnBoZWpobmVFRjljWnFNLythbyt0V045bER1R0Q1TFlFaG5DZllUM3RZ?=
 =?utf-8?B?K3NiaGlBOEpVSEt6VmU1bElKeDk4am5Eci8vdFFHVlVOd2hmNkR6WkJWTHlH?=
 =?utf-8?B?cHRrRVpib3RUWXNxQVlNcXZhMGNOR0ppckRGNGEzZWFXWDdzNmtYV2VMWHVo?=
 =?utf-8?B?bU44V0dyejBIdFMrbUx3eVlLbE5SZ09tZ25SczJNMUJJSjFnUGhCMVJsclRX?=
 =?utf-8?B?bWNqaGxpWGx3R0tQZm5Ha0dteDhjTi9yUXlIajhrZ2dBR05IZzFRclZ0VVpJ?=
 =?utf-8?B?Ti9laG5LTkhzZ2Irczc0enBPUDRjeDFmaDhaSzZHKzQrYnVaTWthQnNsaVRo?=
 =?utf-8?B?NTI5Yzhqb2U2NTFkOVZ1a21IclpYeTJnZkQreXpadDlKZUdKNW1GcDAwenli?=
 =?utf-8?Q?hTyTRVVBNfbO875G0LL48jksl?=
Content-ID: <134EC56003D0B448866CEB70F3369C77@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fe3161-6e9c-42eb-6321-08db9265b635
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 08:02:54.9225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yuyTcevdk/ZbvBrR7Pr71WYn0lus2m26tZMxTOqkf4IkeIwsSv99ra6GDjeEMN3NOt563aRnpxiGeJvoQwVrOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7336
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_395119282.1413131809"
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_007_395119282.1413131809
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7TWF4aW1lOg0KDQpPbiYjMzI7V2VkLCYjMzI7MjAyMy0wNy0wNSYjMzI7
YXQmIzMyOzA5OjQ4JiMzMjsrMDIwMCwmIzMyO01heGltZSYjMzI7UmlwYXJkJiMzMjt3cm90ZToN
CiZndDsmIzMyO0hpLA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtPbiYjMzI7V2VkLCYjMzI7SnVsJiMz
MjswNSwmIzMyOzIwMjMmIzMyO2F0JiMzMjswMjowNzoxOFBNJiMzMjsrMDgwMCwmIzMyO1lvbmdx
aWFuZyYjMzI7Tml1JiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO2RtYSYjMzI7YnVmZmVy
JiMzMjtyZWxlYXNlJiMzMjtiZWZvcmUmIzMyO292ZXJsYXkmIzMyO2Rpc2FibGUsJiMzMjt0aGF0
JiMzMjt3aWxsJiMzMjtjYXVzZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7bTR1JiMzMjt0cmFuc2xhdGlv
biYjMzI7ZmF1bHQmIzMyO3dhcm5pbmcuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZn
dDsmIzMyO2FkZCYjMzI7ZG1hJiMzMjtidWZmZXImIzMyO2NvbnRyb2wmIzMyO2Zsb3cmIzMyO2lu
JiMzMjttZWRpYXRlayYjMzI7ZHJpdmVyOg0KJmd0OyYjMzI7Jmd0OyYjMzI7Z2V0JiMzMjtkbWEm
IzMyO2J1ZmZlciYjMzI7d2hlbiYjMzI7ZHJtJiMzMjtwbGFuZSYjMzI7ZGlzYWJsZQ0KJmd0OyYj
MzI7Jmd0OyYjMzI7cHV0JiMzMjtkbWEmIzMyO2J1ZmZlciYjMzI7d2hlbiYjMzI7b3ZlcmxheSYj
MzI7cmVhbGx5JiMzMjtkaXNhYmxlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsm
IzMyO0ZpeGVzOiYjMzI7NDEwMTZmZTEwMjhlJiMzMjsoJnF1b3Q7ZHJtOiYjMzI7UmVuYW1lJiMz
MjtwbGFuZS0mZ3Q7c3RhdGUmIzMyO3ZhcmlhYmxlcyYjMzI7aW4mIzMyO2F0b21pYw0KJmd0OyYj
MzI7Jmd0OyYjMzI7dXBkYXRlJiMzMjthbmQmIzMyO2Rpc2FibGUmcXVvdDspDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7WW9uZ3FpYW5nJiMzMjtOaXUmIzMyOyZsdDt5b25n
cWlhbmcubml1QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOw0KJmd0OyYjMzI7SSYjMzI7dGhp
bmsmIzMyO3dlJiMzMjtuZWVkJiMzMjttb3JlJiMzMjtkZXRhaWxzJiMzMjtpbiYjMzI7dGhlJiMz
Mjtjb21taXQmIzMyO21lc3NhZ2UmIzMyO2Fib3V0JiMzMjt3aGF0JiMzMjt0aGUNCiZndDsmIzMy
O2lzc3VlDQomZ3Q7JiMzMjtpcyYjMzI7ZXhhY3RseSYjMzI7YW5kJiMzMjtob3cmIzMyO2l0JiMz
OTtzJiMzMjtmaXhlZC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhpcyYjMzI7ZGVmaW5pdGVseSYj
MzI7ZmVlbHMmIzMyO2xpa2UmIzMyO2l0JiMzOTtzJiMzMjtub3QmIzMyO3NvbWV0aGluZyYjMzI7
ZHJpdmVycyYjMzI7c2hvdWxkJiMzMjtoYXZlJiMzMjt0bw0KJmd0OyYjMzI7ZG8uDQoNCkJlY2F1
c2UmIzMyO01lZGlhVGVrJiMzMjtkaXNwbGF5JiMzMjtoYXJkd2FyZSYjMzI7aGFzJiMzMjtubyYj
MzI7aW50ZXJuYWwmIzMyO1NSQU0mIzMyO3doaWNoJiMzMjtjb3VsZA0Kc3RvcmUmIzMyO3RoZSYj
MzI7b24mIzMyO3NjcmVlbiYjMzI7YnVmZmVyLCYjMzI7cGxhbmUmIzMyO3Nob3VsZCYjMzI7YmUm
IzMyO3VwZGF0ZWQmIzMyO2luJiMzMjt2YmxhbmsmIzMyO3BlcmlvZCYjMzI7dG8NCnByZXZlbnQm
IzMyO3RlYXJpbmcmIzMyO2VmZmVjdC4mIzMyO0luJiMzMjtNZWRpYVRlayYjMzI7cGxhbmUmIzMy
O2Rpc2FibGUmIzMyO2NhbGxiYWNrJiMzMjtmdW5jdGlvbiwmIzMyO2lmDQp3ZSYjMzI7d2FpdCYj
MzI7dmJsYW5rJiMzMjtwZXJpb2QmIzMyO3RvJiMzMjtkaXNhYmxlJiMzMjtwbGFuZSwmIzMyO3Ro
ZSYjMzI7c29mdHdhcmUmIzMyO3dvdWxkJiMzMjtiZSYjMzI7YmxvY2tlZA0KZm9yJiMzMjthJiMz
Mjtsb25nJiMzMjt0aW1lLiYjMzI7SWYmIzMyO3RoZXJlJiMzMjthcmUmIzMyO2ZvdXImIzMyO3Bs
YW5lcyYjMzI7dG8mIzMyO2JlJiMzMjtkaXNhYmxlZCwmIzMyO3RoZSYjMzI7dG90YWwNCmJsb2Nr
aW5nJiMzMjt0aW1lJiMzMjt3b3VsZCYjMzI7YmUmIzMyO2FsbW9zdCYjMzI7NCYjMzI7dnN5bmMm
IzMyO3RpbWUuJiMzMjtTbyYjMzI7dGhpcyYjMzI7cGF0Y2gmIzMyO2lzJiMzMjtqdXN0JiMzMjth
DQp3b3JrJiMzMjthcm91bmQmIzMyO3RvJiMzMjt1c2UmIzMyO2dldF9kbWFfYnVmKCkmIzMyO3Rv
JiMzMjtwcmV2ZW50JiMzMjtidWZmZXImIzMyO3RvJiMzMjtiZSYjMzI7ZnJlZWQmIzMyO2JlZm9y
ZQ0KdmJsYW5rJiMzMjtwZXJpb2QmIzMyO2FuZCYjMzI7bm90JiMzMjtibG9jayYjMzI7dGhlJiMz
Mjtzb2Z0d2FyZS4mIzMyO0ZvciYjMzI7dGhlJiMzMjtiZWhhdmlvciYjMzI7RFJNJiMzMjtjb3Jl
DQpmcmVlJiMzMjtwbGFuZSYjMzI7YnVmZmVyJiMzMjtqdXN0JiMzMjthZnRlciYjMzI7cGxhbmUm
IzMyO2Rpc2FibGUmIzMyO2NhbGxiYWNrJiMzMjtmdW5jdGlvbiYjMzI7cmV0dXJuLA0KSSYjMzk7
bSYjMzI7bm90JiMzMjtzdXJlJiMzMjtpdCYjMzk7cyYjMzI7RFJNJiMzMjtjb3JlJiMzOTtzJiMz
MjtidWcmIzMyO29yJiMzMjtpdCYjMzk7cyYjMzI7RFJNJiMzMjtjb3JlJiMzOTtzJiMzMjtjb3Jy
ZWN0JiMzMjtiZWhhdmlvci4NCklmJiMzMjt0aGlzJiMzMjtpcyYjMzI7Y29ycmVjdCYjMzI7YmVo
YXZpb3IsJiMzMjtpdCYjMzI7bWVhbnMmIzMyO3RoYXQmIzMyO0RSTSYjMzI7Y29yZSYjMzI7YXNz
dW1lJiMzMjt0aGF0DQpoYXJkd2FyZSYjMzI7c2hvdWxkJiMzMjtoYXZlJiMzMjtpbnRlcm5hbCYj
MzI7U1JBTSYjMzI7YnV0JiMzMjtNZWRpYVRlayYjMzI7ZGlzcGxheSYjMzI7aGFyZHdhcmUNCnZp
b2xhdGUmIzMyO3RoaXMmIzMyO2Fzc3VtcHRpb24uJiMzMjtJZiYjMzI7c28sJiMzMjtJJiMzMjt0
aGluayYjMzI7SSYjMzI7Y291bGQmIzMyO2p1c3QmIzMyO2FjY2VwdCYjMzI7dGhpcyYjMzI7d29y
aw0KYXJvdW5kJiMzMjtwYXRjaC4NCg0KUmVnYXJkcywNCkNLDQoNCg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtNYXhpbWUNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioq
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

--__=_Part_Boundary_007_395119282.1413131809
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1heGltZToNCg0KT24gV2VkLCAyMDIzLTA3LTA1IGF0IDA5OjQ4ICswMjAwLCBNYXhpbWUg
UmlwYXJkIHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9uIFdlZCwgSnVsIDA1LCAyMDIzIGF0IDAyOjA3
OjE4UE0gKzA4MDAsIFlvbmdxaWFuZyBOaXUgd3JvdGU6DQo+ID4gZG1hIGJ1ZmZlciByZWxlYXNl
IGJlZm9yZSBvdmVybGF5IGRpc2FibGUsIHRoYXQgd2lsbCBjYXVzZQ0KPiA+IG00dSB0cmFuc2xh
dGlvbiBmYXVsdCB3YXJuaW5nLg0KPiA+IA0KPiA+IGFkZCBkbWEgYnVmZmVyIGNvbnRyb2wgZmxv
dyBpbiBtZWRpYXRlayBkcml2ZXI6DQo+ID4gZ2V0IGRtYSBidWZmZXIgd2hlbiBkcm0gcGxhbmUg
ZGlzYWJsZQ0KPiA+IHB1dCBkbWEgYnVmZmVyIHdoZW4gb3ZlcmxheSByZWFsbHkgZGlzYWJsZQ0K
PiA+IA0KPiA+IEZpeGVzOiA0MTAxNmZlMTAyOGUgKCJkcm06IFJlbmFtZSBwbGFuZS0+c3RhdGUg
dmFyaWFibGVzIGluIGF0b21pYw0KPiA+IHVwZGF0ZSBhbmQgZGlzYWJsZSIpDQo+ID4gU2lnbmVk
LW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQo+IA0K
PiBJIHRoaW5rIHdlIG5lZWQgbW9yZSBkZXRhaWxzIGluIHRoZSBjb21taXQgbWVzc2FnZSBhYm91
dCB3aGF0IHRoZQ0KPiBpc3N1ZQ0KPiBpcyBleGFjdGx5IGFuZCBob3cgaXQncyBmaXhlZC4NCj4g
DQo+IFRoaXMgZGVmaW5pdGVseSBmZWVscyBsaWtlIGl0J3Mgbm90IHNvbWV0aGluZyBkcml2ZXJz
IHNob3VsZCBoYXZlIHRvDQo+IGRvLg0KDQpCZWNhdXNlIE1lZGlhVGVrIGRpc3BsYXkgaGFyZHdh
cmUgaGFzIG5vIGludGVybmFsIFNSQU0gd2hpY2ggY291bGQNCnN0b3JlIHRoZSBvbiBzY3JlZW4g
YnVmZmVyLCBwbGFuZSBzaG91bGQgYmUgdXBkYXRlZCBpbiB2YmxhbmsgcGVyaW9kIHRvDQpwcmV2
ZW50IHRlYXJpbmcgZWZmZWN0LiBJbiBNZWRpYVRlayBwbGFuZSBkaXNhYmxlIGNhbGxiYWNrIGZ1
bmN0aW9uLCBpZg0Kd2Ugd2FpdCB2YmxhbmsgcGVyaW9kIHRvIGRpc2FibGUgcGxhbmUsIHRoZSBz
b2Z0d2FyZSB3b3VsZCBiZSBibG9ja2VkDQpmb3IgYSBsb25nIHRpbWUuIElmIHRoZXJlIGFyZSBm
b3VyIHBsYW5lcyB0byBiZSBkaXNhYmxlZCwgdGhlIHRvdGFsDQpibG9ja2luZyB0aW1lIHdvdWxk
IGJlIGFsbW9zdCA0IHZzeW5jIHRpbWUuIFNvIHRoaXMgcGF0Y2ggaXMganVzdCBhDQp3b3JrIGFy
b3VuZCB0byB1c2UgZ2V0X2RtYV9idWYoKSB0byBwcmV2ZW50IGJ1ZmZlciB0byBiZSBmcmVlZCBi
ZWZvcmUNCnZibGFuayBwZXJpb2QgYW5kIG5vdCBibG9jayB0aGUgc29mdHdhcmUuIEZvciB0aGUg
YmVoYXZpb3IgRFJNIGNvcmUNCmZyZWUgcGxhbmUgYnVmZmVyIGp1c3QgYWZ0ZXIgcGxhbmUgZGlz
YWJsZSBjYWxsYmFjayBmdW5jdGlvbiByZXR1cm4sDQpJJ20gbm90IHN1cmUgaXQncyBEUk0gY29y
ZSdzIGJ1ZyBvciBpdCdzIERSTSBjb3JlJ3MgY29ycmVjdCBiZWhhdmlvci4NCklmIHRoaXMgaXMg
Y29ycmVjdCBiZWhhdmlvciwgaXQgbWVhbnMgdGhhdCBEUk0gY29yZSBhc3N1bWUgdGhhdA0KaGFy
ZHdhcmUgc2hvdWxkIGhhdmUgaW50ZXJuYWwgU1JBTSBidXQgTWVkaWFUZWsgZGlzcGxheSBoYXJk
d2FyZQ0KdmlvbGF0ZSB0aGlzIGFzc3VtcHRpb24uIElmIHNvLCBJIHRoaW5rIEkgY291bGQganVz
dCBhY2NlcHQgdGhpcyB3b3JrDQphcm91bmQgcGF0Y2guDQoNClJlZ2FyZHMsDQpDSw0KDQoNCj4g
DQo+IE1heGltZQ0K

--__=_Part_Boundary_007_395119282.1413131809--


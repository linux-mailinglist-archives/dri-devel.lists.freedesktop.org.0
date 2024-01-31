Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B98C843F5C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 13:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E0E10F9C4;
	Wed, 31 Jan 2024 12:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510F010F9A2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 12:26:02 +0000 (UTC)
X-UUID: e2536120c03311eea2298b7352fd921d-20240131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=y3Nk2+TFr48OO9Mb9j4+Sa2zKRtTgjGepf7k+DTcITg=; 
 b=tIhU9Le8clwuqPpI/W69uX1gzvIY5kyFZUGStk5OSkt2SOk14nyS8ye6zemMnLARMCUO+3aTpc8DucCzwy5KgRpxgnHl/ZBI+jXAt+NtAsvgfbkHLepgq/52RnRl972KuJ0wuAURFXv8j5XKApkS/P40mKpoaG5WQ1D2e5qBAu4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36, REQID:20b53332-737b-4db0-86fd-a15242b9c262, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6e16cf4, CLOUDID:b6aedd8e-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e2536120c03311eea2298b7352fd921d-20240131
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2049635651; Wed, 31 Jan 2024 20:25:56 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jan 2024 20:25:55 +0800
Received: from SINPR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jan 2024 20:25:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFcVCVyC9pmEJQ7xBWQCa/d6CphDWILMC6R8Hj2CMlCjC0beH2ijYea9A5TfuZiuaw7MJtznfOsBx3EOV243C5nIrigFlCzwntOGzQiDRBSFyI9OxrgFo/C8yAidJFwZoerNXe2kZc4S7hyCcOC1kFMv2Ga8iOLNlVJqu7uSCgeXhQ9KJOUrC58ZPw5wwf2lrXPzZQFQry3LTjo1nugw8EMl2G5ktxz3tTMXlgrm7HmlzHBCBOAH5YyUe8xaEz1PMZjX0uqhNdskg0ITnhxGxODlmSvM3o7um4rylKSH6UXVBtEt03z2FVtUarkWRpK3FE3w/FpLDzHCSbz6YvXy3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxGWxgIP0UuyzElAphXhMb6h77rvW/KTuPlUSNOP6eI=;
 b=WaYrLxClfrWYTnDX48iyLh7afFYFkSaYybMYWAl7SBNBRT2ltNv+lxLgi9hbhRCo7zJhW/o11PxXZ1h4nJbK2egyEFz+d5Xq0nLeq9k2plj5UK/BEU+Uiqt3LxB4c0pRZRKo8xATPd3I7TJ98YnDGRf3LTu9XrGwuiOooxx7PluReCsZ0hZCQ7oWRQHPP6dH89PkR9zn0+IqA0MlYq3HO6Ul+5y0gCFCzHPzNoeM8oGmQ9eiUdBX6qK2VQCN6gtBm7kar1+7HmlWLspzdTWjHUBo2eBQsDjk8jYKm/W4ZVJXYuqrmAg5W51lGVh0lHdc8Kc+RhpFWSrYjN8aQh3tKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxGWxgIP0UuyzElAphXhMb6h77rvW/KTuPlUSNOP6eI=;
 b=hrIpwM8fIRFv1DN2ZImE8cFguMUWXb19QlgZ4+uvApaItGt6vVDJkwwJ4PmvK9ypC9DMJt0JQSm/LFN1Qz+G+fuJ4TGJ30u1sWehgDGIRI7AgYEtCVC4w1uz6ROk/QIju3fVBRTz/7UsqN/lJcdQ/ZbAQHMRqqSBpZohh2Hl6cs=
Received: from SEYPR03MB6459.apcprd03.prod.outlook.com (2603:1096:101:50::10)
 by JH0PR03MB7595.apcprd03.prod.outlook.com (2603:1096:990:9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 12:25:51 +0000
Received: from SEYPR03MB6459.apcprd03.prod.outlook.com
 ([fe80::2db2:b466:bffb:cae]) by SEYPR03MB6459.apcprd03.prod.outlook.com
 ([fe80::2db2:b466:bffb:cae%5]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 12:25:51 +0000
From: =?utf-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Thread-Topic: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Thread-Index: AQHZwxDWBavvSbTht0etjS6nC3ISe6/TxFwAgANXjQCAAB2hgIAA9jgAgADMzoCBG/KLgIAADAMA
Date: Wed, 31 Jan 2024 12:25:51 +0000
Message-ID: <aeef45d131e3e0131b57958253c85cd50a378f63.camel@mediatek.com>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
 <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
 <c6ae8630d06138b6d0156c19323afebf0718f522.camel@mediatek.com>
 <089fe457-1c61-4b7b-ad37-a67e7f46cb56@sirena.org.uk>
 <6aa6947865795fc534b61f5b8a80b3c42fd5a0cd.camel@mediatek.com>
 <9c90185c-9cd4-4a08-9925-be5d460af54d@sirena.org.uk>
 <11f4cfd2-f6a2-45cb-923a-95760a1b9883@collabora.com>
In-Reply-To: <11f4cfd2-f6a2-45cb-923a-95760a1b9883@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6459:EE_|JH0PR03MB7595:EE_
x-ms-office365-filtering-correlation-id: dc4350eb-4ed6-4bb6-8967-08dc2257c336
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6g7wNIc2UhOI6y8cJhpSFA/wfmywqIcFwWBdJwEH3JnsTBChfmDOVkSlqDdeDt4vtCi9TfbK6mPPGDpK1H35ST/WOZAvHJ7+mbbNgjhN5xUkMHjabaqnLb1CojswlbN5C+jEDCUnBt5h4kqhI3DO8vaWO6jK8ae3ChueASAXdWnhk51HVDVo0stn2MeTQMMv8UitKLUjA1aEHBhvtbwnqSEi9Lsm7w9ajWABHpKBd7zd74i5Ut0G1njkt6UmYXbMTdSbxVEKFRZWvMakiJwWz0IV/nLq5k9i50bJ62L6BwZXSdeCDMr8h0uFArfN+lv08DSFyL/YSgggqCrCuJhiNCbS1Y+GIdi+HBDrjbT1T6WEPie8MtWGtCGmUJ1lc6NFLC0QW/e9Iyvd0wVtq+OPbiR6TdbsxzZ/zDCuw6HappH1SuEJnu4g5PHDvKWTkw6/ngz4vdpKiS3mhl0GgXyuxCktB/gFNmksxEglRZeMjh6MZ9MCpehvmpoXDQfWRkxwQsF8DWQlm1wdvkbq+RfOEbb8lm/FOUOO0/0DOHFx+cbpsgsKmJfivj3Cjd9V6pMzEfNsQu4d13y3SxdAxP1AQRJs/Ul2K8gKZOci7BnlFHjwY+R/SabtT82nUN4jWEji
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6459.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(39860400002)(366004)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(2616005)(26005)(38100700002)(122000001)(6512007)(76116006)(4326008)(8936002)(8676002)(5660300002)(7416002)(478600001)(6486002)(2906002)(6506007)(71200400001)(64756008)(66446008)(66476007)(66946007)(54906003)(66556008)(316002)(6916009)(41300700001)(38070700009)(86362001)(36756003)(85182001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEx3eXBBWGs2ZUtCQjEyVUZWK0ZPQWJ1NkVQSk5oYi83M0ZtbjhPOW1SVkdj?=
 =?utf-8?B?Z2F3NkRUblJLUWZJbW94OUU0K29xSlV0YjhvTUZ4dWZjTHliOFFwMXlTWkNS?=
 =?utf-8?B?cmRVUmlodFlrakZDRlVVN3AzejJ1S2NqUUppYytWejA1bFlQc2tzUVdZcDFC?=
 =?utf-8?B?bU4yazFEZHpzTjEzd2I5NTd5cG80SERyem5BRElSWXR0RWhweUFRejRxaHBV?=
 =?utf-8?B?a1p4V0RpK2ZPQXN5TUF5TUxhQ1ByWWhaYWgyVUxYK016M2dNRHdoT2NMcXh1?=
 =?utf-8?B?dnRWeVpZQjZlOHA2OWEzVUx4OUt3VDVqNU5IaG5zczhhOUQ2NFVYYmhHdW5D?=
 =?utf-8?B?L25PSXMycTVGRWZDYlVvN2VENVNBV1RRSVRxZzJnT0NvWDcvRW1qU3RwNWQz?=
 =?utf-8?B?VDgvOFBSYWJrc3FnQnlNUHY3ZVRRYzd2bGE0WmdHSGovd0FpMkJsT3lRbm1S?=
 =?utf-8?B?QTJJVi90blJOalhUSWo5Q2hqU3ZJN3N3b1B3THZjMzJycXJSRWQ2MXpLTDRL?=
 =?utf-8?B?a2xNaHQwLy80MCs2RGRIQVBwU2lMWW1qTk5yWFo4REtTOWY4L1F3dmkzaU5Z?=
 =?utf-8?B?SnZPMDFEUkV0QXMwUkJQTy8xSkwxTnZ2dFFhZWpPVkJEQ0RaZlBEbXdmV2s0?=
 =?utf-8?B?NU5Rc0FGV2ZyMTJMdzBXdzc2UDJuTkFNSmVyb0I3bHNkQUFKcStJTW9LUTNp?=
 =?utf-8?B?L0t4QnNRWEE1eXFDZnlJOEpLR1dOMkY5b3VEQ3RaQlVwTFpFSHlsTUlrVTZ6?=
 =?utf-8?B?eHYxMkkrRXN1ZXJPU1YzRlJGc0xXcFZOL1lISC96eXk3WEVvYlpVallVMVVi?=
 =?utf-8?B?T2dUbktMNmQ0c0RNTGg4S2FYVGtQb2ZteDVnMk5BOFFWbWxjeHdMRmdtNXpN?=
 =?utf-8?B?ZDR0NUZPSmRSTjVITDlIV1RnU1c3T2xPU1o0RUNCUjB5UzMyN3ZmcUlJWmxQ?=
 =?utf-8?B?UFZtMVVhUFNmdkc1cE5EU25xL1lBU1JqWmJDUXZteVRaRnBhU2pUbGRMci9S?=
 =?utf-8?B?NzFSNG1XMmE5NTZPRkowTW56R3YvSGp4WDljTWpWaGMrMFZoR29SQkQ3ZmRQ?=
 =?utf-8?B?TnNrcGpmLzVWc0o5S0FESlVpVVJKMzgrSXZBejFrYnNoRmhTN3Y0My9mTkZt?=
 =?utf-8?B?V0RmNUdnbld2dTRqMVQ3TzhVRDhsQTVFZmhvSHhsaHhiSURUU3ZWelBSd2E3?=
 =?utf-8?B?N21NdjdKQmlINnRXZjVQNnZyYkcrWG8zNGdKRmxaVkpGajFlNk95dzBlU0Vr?=
 =?utf-8?B?MTM0OWtKazQ5Rzc5NTR0dml6MXZkaGt6aW4vV290OVZ6T3IxQU4zTmZ2cEdU?=
 =?utf-8?B?N2tJNDg5WG1GOVNrMlZUNGFiZWlRWWpRdTk5dUtwYXJ3dUFoTFFROXNsMVlJ?=
 =?utf-8?B?d2VMenFSMlZoV3NYNFVwUVFTOGtDWHNBSEpENzB2Y1haam9hYS9GL0E3YlBq?=
 =?utf-8?B?eFlvZVBReldlOTRVK0s4RVJHNU81dy9SQUJDaUdpaHp0VjQ0S01UZG5Ldkd6?=
 =?utf-8?B?cHljbFhYME1mK3RuVTJZNjdLTlFReWpxUFU5UU80UXRXYWh6SGgyUW9IcFNr?=
 =?utf-8?B?RGJicCs0eDhDaDlsRGpoVlFsb1BaSzM5UUhsb2YrZ0FsNjM4Z0FzdW1ORFlK?=
 =?utf-8?B?dVBpMTVzaGJuclhLcDQzclU5alB6WGVocGhtNm8xcW5EMGxUZ3JxRXQ2Z0Nv?=
 =?utf-8?B?VnBCUStSUE5EaHB0cHhsYVR2VUNLZHFxZHhWaWtySzZSbm1qYXYyejllSTJn?=
 =?utf-8?B?bEtuTm1rbm1KUUdrRkNjbDdzYTh5aCtEK3JQTUZBejFGa1lEaFAxbFdiWENm?=
 =?utf-8?B?Wk91TDhRczZLMkNpeWJEVUFta0d0NWZ2RFNjdVRaMnlRUXg4azNtNktvN2J4?=
 =?utf-8?B?Umlnd2hJdU15a1dSdXN0U1lrN05FR05MMFVSNG5PZFpIMUNyNjRuUE54dVAz?=
 =?utf-8?B?RHJiTTRqTFl3WVE0b3R3YnlBNUJvOE92NWlid3d3L29CMmJncG9RalRZUUhu?=
 =?utf-8?B?NHJXc05CNWxsRk5UTmZYb2cyK3dtOXp4RWxmdVFBVldtc2dxb0d3R2t2Vy9s?=
 =?utf-8?B?a0ZWcjZlV3BWYTR2OSs1Z24xOENzaEU1Z3dJdmdZRlpKUjNlTys2L3ZTMlpz?=
 =?utf-8?B?SHB5VS9CaDZsNm9SVzZZeGpJOXc2TzlUY2JjZTRIakNvRC9jUTVDRmZ2MUlw?=
 =?utf-8?B?cmc9PQ==?=
Content-ID: <34725B42A450844E9BE3CB66BB41C400@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6459.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4350eb-4ed6-4bb6-8967-08dc2257c336
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 12:25:51.1867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RwKLlfH0+8csRxvvoTf3NHpvgMDiKHJmjG5WgWPcr4FqPtcRkNE1sZMOR2SidaNA+jbYu8E3DrVZZErO7jr56w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7595
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.269700-8.000000
X-TMASE-MatchedRID: dwNgap4H9hjUL3YCMmnG4kD6z8N1m1ALjLOy13Cgb49qSjxROy+AU2yd
 bY7xfgXYECw8p/maK/yOBnoM+ljx7yZxxfOzHVnli/vfAS7Q3HtQCOsAlaxN72iWB34u/xIWiMh
 uxJgbFV38HWariV+By6pTDNjIhKPWkQ3ot8SYoRPmAId+2bAQwkKzuF0egUUDhhC94pXkBxONiJ
 gdHjlC56S5a0PGMQ+dkZOl7WKIImrS77Co4bNJXQtuKBGekqUpOlxBO2IcOBa9Ys58L8KSFprjm
 QVi80qUopPLv+tzHZt0oWDi/Fd2BtBN9s9KWGZi
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.269700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 68BD8131289FA66034EB36BA1D30EB5D6D6581337ACC5DDB392CBBA3DDCC0BAA2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_748423128.1597427915"
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 =?utf-8?B?Q2h1bnh1IExpICjmnY7mmKXml60p?= <Chunxu.Li@mediatek.com>,
 =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?= <Allen-KH.Cheng@mediatek.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_748423128.1597427915
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjQtMDEtMzEmIzMyO2F0
JiMzMjsxMjo0MiYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0lsJiMzMjswMy8wOC8yMyYjMzI7MjE6MzMsJiMzMjtN
YXJrJiMzMjtCcm93biYjMzI7aGEmIzMyO3Njcml0dG86DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtPbiYj
MzI7VGh1LCYjMzI7QXVnJiMzMjswMywmIzMyOzIwMjMmIzMyO2F0JiMzMjswNzoyMDoxNUFNJiMz
MjsrMDAwMCwmIzMyO0ppYXhpbiYjMzI7WXUmIzMyOygmIzIwNDQ2OyYjMjM0Nzg7JiMzNzk5NTsp
JiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7SSYjMzI7YWdyZWUmIzMyO3dpdGgmIzMyO3lvdSwmIzMyO2luJiMzMjtmYWN0JiMzMjt0aGUm
IzMyO3NwZWFrZXImIzMyO2lzJiMzMjtpbmRlZWQmIzMyO2RvaW5nJiMzMjt0aGlzJiMzMjt3YXku
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtCdXQNCiZndDsmIzMyOyZndDsmIzMyOyZndDsm
IzMyO2Fib3V0JiMzMjt0aGUmIzMyO2hkbWkmIzMyO3RoYXQmIzMyO29uJiMzMjt0aGUmIzMyO2Jv
YXJkLCYjMzI7SSYjMzI7ZGlkJiMzMjtub3QmIzMyO2ZpbmQmIzMyO2EmIzMyO2RlZmluYXRpb24N
CiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2xpbmsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsm
IzMyO3NuZF9zb2NfZGFwbV9oZG1pLCYjMzI7c28mIzMyO0kmIzMyO3VzZSYjMzI7c25kX3NvY19k
YXBtX2xpbmUmIzMyO3RvJiMzMjtyZXBsYWNlLiYjMzI7VGhlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
Z3Q7JiMzMjtwdXJwb3NlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtpcyYjMzI7dG8mIzMy
O2NvbnRyb2wmIzMyO2l0JiMzMjtsaW5rJiMzMjtzcGVha2VyLiYjMzI7T3ImIzMyO3doYXQmIzMy
O2RvJiMzMjt5b3UmIzMyO3N1Z2dlc3QmIzMyO0kmIzMyO3Nob3VsZA0KJmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0OyYjMzI7ZG8mIzYzOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtJJiMzMjt0aGluayYjMzI7dGhlJiMzMjtzZW5zaWJsZSYjMzI7dGhpbmcmIzMyO2hlcmUmIzMy
O2lzJiMzMjt0byYjMzI7ZGVmaW5lJiMzMjthJiMzMjtESUdJVEFMX09VVFBVVCgpDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjt3aGljaA0KJmd0OyYjMzI7Jmd0OyYjMzI7Y2FuJiMzMjtiZSYjMzI7dXNlZCYj
MzI7Zm9yJiMzMjtIRE1JLCYjMzI7Uy9QRElGJiMzMjthbmQmIzMyO2FueXRoaW5nJiMzMjtlbHNl
JiMzMjt0aGF0JiMzMjtjb21lcyYjMzI7dXAmIzMyO2FuZA0KJmd0OyYjMzI7Jmd0OyYjMzI7aXNu
JiMzOTt0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjbGVhcmx5JiMzMjt3cm9uZyYjMzI7bGlrZSYjMzI7
cmV1c2luZyYjMzI7b25lJiMzMjtvZiYjMzI7dGhlJiMzMjthbmFsb2cmIzMyO2Rlc2NyaXB0aW9u
cyYjMzI7aXMuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0hlbGxvJiMzMjtKaWF4aW4sDQomZ3Q7JiMz
MjsNCiZndDsmIzMyO3RoZSYjMzI7TVQ4MTg2JiMzMjtDb3Jzb2xhJiMzMjtDaHJvbWVib29rcyYj
MzI7YXJlJiMzMjticm9rZW4mIzMyO3Vwc3RyZWFtJiMzMjt3aXRob3V0JiMzMjt0aGlzDQomZ3Q7
JiMzMjtzZXJpZXMuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0FyZSYjMzI7eW91JiMzMjtzdGlsbCYj
MzI7aW50ZXJlc3RlZCYjMzI7aW4mIzMyO3Vwc3RyZWFtaW5nJiMzMjt0aGlzJiMzMjtvbmUmIzYz
Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtUaGFua3MsDQomZ3Q7JiMzMjtBbmdlbG8NCg0KSGVsbG8m
IzMyO0FuZ2VsbywmIzMyOw0KDQpObywmIzMyO0kmIzM5O20mIzMyO3N0aWxsJiMzMjtpbnRlcmVz
dGluZyYjMzI7aW4mIzMyO3Vwc3RyZWFtJiMzMjt0aGlzJiMzMjtzZXJpZXMuJiMzMjtJdCYjMzk7
cyYjMzI7anVzdCYjMzI7dGhhdCYjMzI7SQ0KaGF2ZSYjMzI7bGVzcyYjMzI7dGltZSYjMzI7cmVj
ZW50bHkuJiMzMjtJJiMzOTttJiMzMjtjb25zaWRlcmluZyYjMzI7cmV2aXNpdGluZyYjMzI7dGhp
cyYjMzI7aXNzdWUmIzMyO25leHQNCm1vdXRoLiYjMzI7RG8mIzMyO3lvdSYjMzI7aGF2ZSYjMzI7
YW55JiMzMjtzdWdnZXN0aW9ucyYjMzI7Zm9yJiMzMjt0aGlzJiM2MzsNCg0KVGhhbmtzLA0KSmlh
eGluLll1DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17
LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioq
KioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1h
aWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50
aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBk
aXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpj
b252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlz
c2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWlu
ZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVu
ZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxh
d2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWls
LCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJv
ciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRv
IHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWls
IChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90
DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29u
LiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_748423128.1597427915
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI0LTAxLTMxIGF0IDEyOjQyICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMDMvMDgvMjMgMjE6MzMsIE1hcmsgQnJvd24gaGEgc2NyaXR0bzoN
Cj4gPiBPbiBUaHUsIEF1ZyAwMywgMjAyMyBhdCAwNzoyMDoxNUFNICswMDAwLCBKaWF4aW4gWXUg
KOS/nuWutumRqykgd3JvdGU6DQo+ID4gDQo+ID4gPiBJIGFncmVlIHdpdGggeW91LCBpbiBmYWN0
IHRoZSBzcGVha2VyIGlzIGluZGVlZCBkb2luZyB0aGlzIHdheS4NCj4gPiA+IEJ1dA0KPiA+ID4g
YWJvdXQgdGhlIGhkbWkgdGhhdCBvbiB0aGUgYm9hcmQsIEkgZGlkIG5vdCBmaW5kIGEgZGVmaW5h
dGlvbg0KPiA+ID4gbGluaw0KPiA+ID4gc25kX3NvY19kYXBtX2hkbWksIHNvIEkgdXNlIHNuZF9z
b2NfZGFwbV9saW5lIHRvIHJlcGxhY2UuIFRoZQ0KPiA+ID4gcHVycG9zZQ0KPiA+ID4gaXMgdG8g
Y29udHJvbCBpdCBsaW5rIHNwZWFrZXIuIE9yIHdoYXQgZG8geW91IHN1Z2dlc3QgSSBzaG91bGQN
Cj4gPiA+IGRvPw0KPiA+IA0KPiA+IEkgdGhpbmsgdGhlIHNlbnNpYmxlIHRoaW5nIGhlcmUgaXMg
dG8gZGVmaW5lIGEgRElHSVRBTF9PVVRQVVQoKQ0KPiA+IHdoaWNoDQo+ID4gY2FuIGJlIHVzZWQg
Zm9yIEhETUksIFMvUERJRiBhbmQgYW55dGhpbmcgZWxzZSB0aGF0IGNvbWVzIHVwIGFuZA0KPiA+
IGlzbid0DQo+ID4gY2xlYXJseSB3cm9uZyBsaWtlIHJldXNpbmcgb25lIG9mIHRoZSBhbmFsb2cg
ZGVzY3JpcHRpb25zIGlzLg0KPiANCj4gSGVsbG8gSmlheGluLA0KPiANCj4gdGhlIE1UODE4NiBD
b3Jzb2xhIENocm9tZWJvb2tzIGFyZSBicm9rZW4gdXBzdHJlYW0gd2l0aG91dCB0aGlzDQo+IHNl
cmllcy4NCj4gDQo+IEFyZSB5b3Ugc3RpbGwgaW50ZXJlc3RlZCBpbiB1cHN0cmVhbWluZyB0aGlz
IG9uZT8NCj4gDQo+IFRoYW5rcywNCj4gQW5nZWxvDQoNCkhlbGxvIEFuZ2VsbywgDQoNCk5vLCBJ
J20gc3RpbGwgaW50ZXJlc3RpbmcgaW4gdXBzdHJlYW0gdGhpcyBzZXJpZXMuIEl0J3MganVzdCB0
aGF0IEkNCmhhdmUgbGVzcyB0aW1lIHJlY2VudGx5LiBJJ20gY29uc2lkZXJpbmcgcmV2aXNpdGlu
ZyB0aGlzIGlzc3VlIG5leHQNCm1vdXRoLiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgZm9y
IHRoaXM/DQoNClRoYW5rcywNCkppYXhpbi5ZdQ0K

--__=_Part_Boundary_001_748423128.1597427915--


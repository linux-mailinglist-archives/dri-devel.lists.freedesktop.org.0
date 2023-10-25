Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15FB7D6411
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA07F10E570;
	Wed, 25 Oct 2023 07:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D0810E570
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 07:52:48 +0000 (UTC)
X-UUID: 7b3c87b6730b11ee8051498923ad61e6-20231025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=6d68sTqJbjiBKP8sWj45R5pe+oPPLRwoznxd8Kcp99U=; 
 b=PILzpTr96LBu4ZMYfpwlY6KOrMbyayL+Nps3J9PWqcAu0UeKs2hpMb2aGE2U90lgkqR2rHtiL7bpZhp3Itt822I5lDDySOksyOBIX5eYQ74yvwY9CzXwGdUErmlLSOSPw5jnvk9tzc5CM6SuG/hoddG5+HsV5IzL84K2N3TLXhM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:f2467741-c1e5-4008-a1b5-b613974692bc, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:aa0ac0fb-4a48-46e2-b946-12f04f20af8c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7b3c87b6730b11ee8051498923ad61e6-20231025
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1918660298; Wed, 25 Oct 2023 15:52:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Oct 2023 15:52:43 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Oct 2023 15:52:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Btwg4lTYcTUhDa5rw8z9D9H1T1nlsiRO7asgQjrv3Bb6kFtKBi2XjA6+K+2LJDQCTFdiZp5JxQeUDAe9glMSwsFXUhxDBIq6v8jfAEF49cs9geNJAxiOPh42DWKgCurK0Grdu0PuJj1f5nBayPkNAc4GZBD7R6vYmDWfO2xItGiMD2VHBtFwwP/BUYQZdpazGkD5o64g7PMKNEEQgNrB37ve3HQ6tayrSINcO6/1+KYuAd4YHc0BPs2TejsL9LcYB4amgq9+UptBkpK6nL8v7rQBmunKUQWEOrs33ziUGIrB6A4kM3+KQJk1aLjDAi7Cb9Joq2cVNmdqRxpypXTvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAEFvU0gD0EfZ3HJfjkf/2zR/b2rejUj0aaxYBW3bF8=;
 b=jHmCaHhF3KMDoJpj0a5cQtRkg+9Xq7OfLOItAGYjm6zkNsDKivPGxanwB1ZuSJ5fj3Wn8BgZ+ulwTXZxl0E1KTBzUnEoL/jvAwGYvRx327Gvq3Gv3eTE42LiFhirzizzgUQGsJi05/gUghFAIstQtvTRqxSLV5FNa9lwx5Z9jdRehBJNKzNfEv/ZB22Q0vEiI9gqd1eIE96hInVp9I+3zJjjAxitBOTwb+9cr8eFuNv/PxKAN7d2lMl/UkrGSy9VS5rY9DNeoohko5hCcIGNLwsLd3s1XaMIGXin3wshJ3OEk2iQvdSwNtlllOkySww+ecxYDIyUaHIPBwH1f82sGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAEFvU0gD0EfZ3HJfjkf/2zR/b2rejUj0aaxYBW3bF8=;
 b=Q+rSsnXMh19w0rAK/cLm7YJNVFMbw+Ut0uAkL0uuFD44v/HHMo8UUoP6V0PpaI9dJHe6orioHHPuNgHv4eGl0yFrs9RhAt/0oJ4R2IM5ze/FryqMH5e62FqGaTlZOVe/6WMCPLDSO+AXmkDNTrmPiG3BcL12YvJ6gFsddNCvnV8=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7054.apcprd03.prod.outlook.com (2603:1096:820:dc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 07:51:39 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8c0:a8fa:8e5:159d]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8c0:a8fa:8e5:159d%7]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 07:51:39 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 02/11] drm/mediatek/uapi: Add
 DRM_MTK_GEM_CREATED_ENCRYPTTED flag
Thread-Topic: [PATCH v2 02/11] drm/mediatek/uapi: Add
 DRM_MTK_GEM_CREATED_ENCRYPTTED flag
Thread-Index: AQHaBWvsUTrGuX/naUS6pviNQCLvg7BYn+gAgAGFYwA=
Date: Wed, 25 Oct 2023 07:51:39 +0000
Message-ID: <5ef5f87544a1f499fec59c629e3e9a6857171f42.camel@mediatek.com>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
 <20231023044549.21412-3-jason-jh.lin@mediatek.com>
 <f7fa1c3c-8233-40ab-858a-fdf8a2117a04@collabora.com>
In-Reply-To: <f7fa1c3c-8233-40ab-858a-fdf8a2117a04@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7054:EE_
x-ms-office365-filtering-correlation-id: c136e1b3-5777-42e7-38e7-08dbd52f38b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lWjI9BxlpE1vO/EqcPMNXpqULC4kiua46xIJWqa2p1EmB7rt0JkyynS1sNjpDLPjahXPcbXAtjpdIbZdLOINPgge/NBvWEZyxZ5zvy0OC5vH+4BtxX3I6FY8/bR+rKkUsz8PJ8MrMa6vuWKZZ7IBcCdf9JAjCc8xqxWRoAxM5GONczcr/kI+62YYKKg359WtY/j0gldSC2ddsTibQIC8XiyfNE9+fHg3W/Bk3hTUATSdkQDbR62/VI/MIL3q0Qgr87uNPhUCGIWZ8eO3SxOGortXP0aQ80Gd+KbfGQ2hJWn9Cm/lEymY4I/4RZFnBEKrn7ythDyH+VYGIn7en3B59MSMZtu8IJO5R8MI+fM8raa9lIP9fy1ojlC+hjR/3YKR3yHV/FmNCQFmrYtFyR+UnR+jAdW6oy1lf03vLWTnsW6JPYjxoZER5aYCQfR/VPkFng93MiN3EWy18LUgM2/vuAt074bLNki3k39BOvkpvqg6IiQ5DM+rMSoXrwgTeGrAbB7nRYmmHT3WJly4rSDfwiOP+41kIxzi4Y7dyiYD6KuqTn/vGsTqElBFWxNW6iuYkLgrKFNWoe01WjW01i1ZcoOaYgSlyEk/7YgzW+GbhOKGPQu6Iy4Tv9QHheSsG6hiqHIkoXc+OBii0rF8/1VogrlxtKDBMvlQROa8SvHSBX8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(39860400002)(136003)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(36756003)(85182001)(110136005)(66476007)(66446008)(2616005)(66946007)(54906003)(316002)(66556008)(122000001)(38100700002)(91956017)(38070700009)(86362001)(6512007)(64756008)(83380400001)(2906002)(76116006)(26005)(71200400001)(6506007)(4001150100001)(8936002)(6486002)(4326008)(478600001)(7416002)(8676002)(5660300002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWVMVlBKcWt0c0NHWUI0L1E1V3lyMDk5L3d1eHltVHlhZi8ycXhucmx6MHJF?=
 =?utf-8?B?REYyV3AzZytyYnpPUWlsLy83ZG1aZTJTOVlkNmFGUUFrNWNWOFZOU0VYSkJW?=
 =?utf-8?B?VkZFdEFiMmhDNjVKb0I2WFFSU3lTQVFBUEZtRkozMHdtQ291bzlUY0sxbWtw?=
 =?utf-8?B?aEdpN3RBV2UwMkVKd2V1dFJXRFhQQjFTTnV4dFNrK1EvaURWTGpiaVhRVkVX?=
 =?utf-8?B?ZkxQOG9ScEgrMTBGa1NDUS90TERQamIxSjMvWVFqZGV6MzVjSGhHTk1zOE01?=
 =?utf-8?B?SmRCM1ZmMFp5TVdncmZkZzJkLzU5eHRSOE9NbHlxeTFTcXhCSFZXK1c5bmhB?=
 =?utf-8?B?RkpnVWdoME9Ec0h5SElkNXUwNmxua2Nac2JlRHBjVjUzbUZXc2ZKaHJhTzlu?=
 =?utf-8?B?UVU1QkxRRm9LTTkzVEpyNHdPZEwzWEdWcWhQNEZTVEg0L0Y0QjFJdGlYUlZ1?=
 =?utf-8?B?bWRjeFVEb1Y1MUlWT2ZiTTZ5S3ZWL1BkMDczUnJyRzJGMmlOdXBQSXlneWRn?=
 =?utf-8?B?VVcwY3M1T2NNNGV2TFh2Vmk4UFdLZGRZcE1SaVFKeUYyeXFBTVZNeDV6V21H?=
 =?utf-8?B?YXozQ2NMMzVNK1AzUmhoZ3VvQlNmU2huWDYyN0g0cXY1YjhYaXl4bDNzZjhC?=
 =?utf-8?B?aGN6U21RdGIxc0c2aGN5TEljbDNSSFI2dVk3TllITERXUEVKcktwaHk5Slh1?=
 =?utf-8?B?bUcwVmFCbzN2a1FoMDl2YUJZUk1JelBFL09tN20zempLeDRhWTRTMnN3Q2xC?=
 =?utf-8?B?b3A1dEtRZldxdVhuZmZYa2g3ZzExNGdwdStIQkZaQ2tRVjZGZkZYa0lKeVRY?=
 =?utf-8?B?ZDhtL2l0SmE1clVabkRtZGc4bnl1eXJ2cDRsd1BGcUZDVmhjVStldlFhTEVo?=
 =?utf-8?B?V2cvUEk4U0NaRThndExRZ0F1M1ZFbk50RXU1bFI2OEtBYTVtRjBjZjFBTVBR?=
 =?utf-8?B?blB4ZUtTLzFFSExKVmNRckMxRlAzSlNYYnVvREhMK2F5TEJNYWNnNzA4NlBY?=
 =?utf-8?B?VHpOajFKcVZqeERkNEJ5RjNGd29LSnpiWVlrazdGZFA1b2l2TkxYYzNiSytD?=
 =?utf-8?B?NCtvS3QxSU1CdUs4SGFKRGVRMVFDcURmbEdqeTZvYXUzaFlXQ2Jpa2Z5Rk54?=
 =?utf-8?B?RUNucDk4dUp1UFA3c0JlSTFzeXpLUUh5Zk1WdHV4TVp1VlNic0RQSktuRUdF?=
 =?utf-8?B?dkZ4TWZORG5Vd244WXNrUmxJdGtra3hqTSsvQVF4VjNJL1pRcHo2VkhwZk1n?=
 =?utf-8?B?VEFJUFlQUUg4OHFvQUZWc0RPRG11TVpZcFNvQXkwTGNOVDYyaExBaXFhdHhI?=
 =?utf-8?B?VGlYdWl4MTB5aEdJYmQxUjk4K0E4T05NcnFNdTJyUUl3cmo3clFobS9CZkF4?=
 =?utf-8?B?eGh3aGN2U1N6OHZjWVZwWU9uUFZSTi8rdDFGamN0WksxSGJYZHVTOFUvYnRt?=
 =?utf-8?B?eFpFMXNFMlJVV3RyVklKOXNxTHQzOW9HVGJ2MitFanNhVGNyVDVNSzcwMFl0?=
 =?utf-8?B?dmlzMkdXUHczSFJrN2JYSGQyUXptRjQ0cWlSbDhaaC85OUNmakxXQXJwNmRH?=
 =?utf-8?B?RGxvbG5PRmtMR2YzTmJQYmpPNDNCaWdORkNnQVFhSlV3a1YwR0tPYUJZNTU1?=
 =?utf-8?B?dkpJc2tMMGJtMGNxcnZIMFNtNzlNeUd2UWIweXlQSVJsaWRnUWY5V3RXNUhn?=
 =?utf-8?B?UFBpNk45b25qRFk0elIrTnJVZ0I0WnVXUWtVeFdqV0RzYkV5ZndJUlNpYllV?=
 =?utf-8?B?Z2ZLZzBYZ0Y3dEJONWRJRVVLVUlybXBxQ2lmcUtxSWFXLzltSjNYdXZnYUZ0?=
 =?utf-8?B?ZDRUREY0ajVwbFZCMGErNUV3QjBibU10NTVtcmcxcWdGNzg0UWRJVlBQUkJ3?=
 =?utf-8?B?aVZ1MXdNZEVwUzBGUzAvdGp3V2xTQm1jY0RlWE1USy9jaFdzTkc1QmkrUytm?=
 =?utf-8?B?a1ZHb2ZDWHRCWmJSQ2xoeEVKa1hwZDVCSUJPZzhxN2o5OXVLSmJOMEtzVGg4?=
 =?utf-8?B?dTJocnBCSFFVdXF6VGRkOFNPU1N4aUhUTTFMSzJ0Wk9SNjRxQ2EzTklsb1hP?=
 =?utf-8?B?T2s5RUtsMU1kZEJ4UTFDSEVOT1ZGUVdpdVNsZ2tId0hXQjk2eE15bHhsZ3VW?=
 =?utf-8?B?NldFK3UvQ3NUT1dJT3F1WG9nS1VRWXhYbEF1NHJrM2JSZ2xuR0VxYlVONFNK?=
 =?utf-8?B?TXc9PQ==?=
Content-ID: <C3B56307FF7D284AA926231F5CFCBA4C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c136e1b3-5777-42e7-38e7-08dbd52f38b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 07:51:39.4439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6GkVsX2ZbMOokgat9K+oDJXXJLnFAXVMFODi1ZoiHJbC0DVa/+YSBtUMU1wePJPiD+FEWcFHdKL4STxRJvVnSScF35prADNI2py1ilzKtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7054
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_2083144929.1292711647"
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

--__=_Part_Boundary_002_2083144929.1292711647
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jldmll
d3MuDQoNCk9uJiMzMjtUdWUsJiMzMjsyMDIzLTEwLTI0JiMzMjthdCYjMzI7MTA6MzcmIzMyOysw
MjAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQom
Z3Q7JiMzMjtJbCYjMzI7MjMvMTAvMjMmIzMyOzA2OjQ1LCYjMzI7SmFzb24tSkguTGluJiMzMjto
YSYjMzI7c2NyaXR0bzoNCiZndDsmIzMyOyZndDsmIzMyO0FkZCYjMzI7RFJNX01US19HRU1fQ1JF
QVRFRF9FTkNSWVBUVEVEJiMzMjtmbGFnJiMzMjt0byYjMzI7YWxsb2NhdGUmIzMyO2EmIzMyO3Nl
Y3VyZSYjMzI7YnVmZmVyDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt0byYjMzI7c3VwcG9ydCYjMzI7c2Vj
dXJlJiMzMjt2aWRlbyYjMzI7cGF0aCYjMzI7ZmVhdHVyZS4NCiZndDsmIzMyOyZndDsmIzMyOw0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjtZb3UmIzMyO2hhdmUmIzMyO2EmIzMyO3R5cG8mIzMyO2luJiMz
Mjtib3RoJiMzMjt0aGUmIzMyO2NvbW1pdCYjMzI7ZGVzY3JpcHRpb24mIzMyO2FuZCYjMzI7dGhl
JiMzMjt0aXRsZS4mIzMyO1BsZWFzZQ0KJmd0OyYjMzI7Zml4Lg0KJmd0OyYjMzI7DQoNCk9LLCYj
MzI7SSYjMzk7bGwmIzMyO2ZpeCYjMzI7aXQuDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0K
Jmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0phc29uLUpILkxpbiYjMzI7Jmx0
O2phc29uLWpoLmxpbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0NCiZn
dDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtpbmNsdWRlL3VhcGkvZHJtL21lZGlhdGVrX2RybS5o
JiMzMjt8JiMzMjsxJiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7MSYjMzI7Zmls
ZSYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMyO2luc2VydGlvbigrKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9pbmNsdWRlL3VhcGkvZHJt
L21lZGlhdGVrX2RybS5oDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtiL2luY2x1ZGUvdWFwaS9kcm0vbWVk
aWF0ZWtfZHJtLmgNCiZndDsmIzMyOyZndDsmIzMyO2luZGV4JiMzMjtjMDUwZGUzMjBhODQuLjkz
ZjI1ZTBjMjFkNyYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0mIzMyO2EvaW5jbHVk
ZS91YXBpL2RybS9tZWRpYXRla19kcm0uaA0KJmd0OyYjMzI7Jmd0OyYjMzI7KysrJiMzMjtiL2lu
Y2x1ZGUvdWFwaS9kcm0vbWVkaWF0ZWtfZHJtLmgNCiZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjst
NDgsNiYjMzI7KzQ4LDcmIzMyO0BAJiMzMjtzdHJ1Y3QmIzMyO2RybV9tdGtfZ2VtX21hcF9vZmYm
IzMyO3sNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyYj
MzI7JiMzMjsjZGVmaW5lJiMzMjtEUk1fTVRLX0dFTV9DUkVBVEUweDAwDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmIzMyOyYjMzI7I2RlZmluZSYjMzI7RFJNX01US19HRU1fTUFQX09GRlNFVDB4MDENCiZn
dDsmIzMyOyZndDsmIzMyOysjZGVmaW5lJiMzMjtEUk1fTVRLX0dFTV9DUkVBVEVfRU5DUllQVEVE
MHgwMg0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMz
MjsmIzMyOyNkZWZpbmUmIzMyO0RSTV9JT0NUTF9NVEtfR0VNX0NSRUFURURSTV9JT1dSKERSTV9D
T01NQU5EX0JBU0UmIzMyOysmIzMyOyYjOTI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7
RFJNX01US19HRU1fQ1JFQVRFLCYjMzI7c3RydWN0JiMzMjtkcm1fbXRrX2dlbV9jcmVhdGUpDQom
Z3Q7JiMzMjsNCiZndDsmIzMyOw0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJl
PioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioq
KioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNz
YWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHBy
b3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1
cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVk
IG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0
aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRo
aXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVj
aXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJ
ZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJl
bGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVh
c2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBl
LW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1
ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Ns
b3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5r
IHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_002_2083144929.1292711647
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBUdWUsIDIwMjMtMTAt
MjQgYXQgMTA6MzcgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBJ
bCAyMy8xMC8yMyAwNjo0NSwgSmFzb24tSkguTGluIGhhIHNjcml0dG86DQo+ID4gQWRkIERSTV9N
VEtfR0VNX0NSRUFURURfRU5DUllQVFRFRCBmbGFnIHRvIGFsbG9jYXRlIGEgc2VjdXJlIGJ1ZmZl
cg0KPiA+IHRvIHN1cHBvcnQgc2VjdXJlIHZpZGVvIHBhdGggZmVhdHVyZS4NCj4gPiANCj4gDQo+
IFlvdSBoYXZlIGEgdHlwbyBpbiBib3RoIHRoZSBjb21taXQgZGVzY3JpcHRpb24gYW5kIHRoZSB0
aXRsZS4gUGxlYXNlDQo+IGZpeC4NCj4gDQoNCk9LLCBJJ2xsIGZpeCBpdC4NCg0KUmVnYXJkcywN
Ckphc29uLUpILkxpbg0KDQo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1q
aC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgaW5jbHVkZS91YXBpL2RybS9tZWRp
YXRla19kcm0uaCB8IDEgKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vbWVkaWF0ZWtfZHJtLmgNCj4g
PiBiL2luY2x1ZGUvdWFwaS9kcm0vbWVkaWF0ZWtfZHJtLmgNCj4gPiBpbmRleCBjMDUwZGUzMjBh
ODQuLjkzZjI1ZTBjMjFkNyAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL21lZGlh
dGVrX2RybS5oDQo+ID4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9tZWRpYXRla19kcm0uaA0KPiA+
IEBAIC00OCw2ICs0OCw3IEBAIHN0cnVjdCBkcm1fbXRrX2dlbV9tYXBfb2ZmIHsNCj4gPiAgIA0K
PiA+ICAgI2RlZmluZSBEUk1fTVRLX0dFTV9DUkVBVEUJCTB4MDANCj4gPiAgICNkZWZpbmUgRFJN
X01US19HRU1fTUFQX09GRlNFVAkJMHgwMQ0KPiA+ICsjZGVmaW5lIERSTV9NVEtfR0VNX0NSRUFU
RV9FTkNSWVBURUQJMHgwMg0KPiA+ICAgDQo+ID4gICAjZGVmaW5lIERSTV9JT0NUTF9NVEtfR0VN
X0NSRUFURQlEUk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgXA0KPiA+ICAgCQlEUk1fTVRLX0dF
TV9DUkVBVEUsIHN0cnVjdCBkcm1fbXRrX2dlbV9jcmVhdGUpDQo+IA0KPiANCg==

--__=_Part_Boundary_002_2083144929.1292711647--


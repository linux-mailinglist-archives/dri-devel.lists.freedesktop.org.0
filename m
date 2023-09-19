Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA887A56F8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 03:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D50110E382;
	Tue, 19 Sep 2023 01:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC63810E37F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 01:24:46 +0000 (UTC)
X-UUID: 50206134568b11eea33bb35ae8d461a2-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=SvXf0FzqvKjfPIZdCuRE0I+PE4g1tdsl9sPuaMdE5Pc=; 
 b=uxXuVJgiyNpIQ5QaFZP617ft/REWejh8cmE5gnU3SL4JIhAmp/YRIW51kPKGwTAPfh9viFwDGc2QQ4IKTymNqjuBrLHM4zE94KnL7/fTVVfFU6mVruhkAwwF1edfAlgmMvs1Ea6n1/c+cMyPDjbVIdJ0QGN0bHkM6zIHLaoGvf4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:b754c8d4-a4ad-4ef7-91bc-5a7f4e34202a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:f4361714-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 50206134568b11eea33bb35ae8d461a2-20230919
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1848266251; Tue, 19 Sep 2023 09:24:43 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 09:24:42 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 09:24:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmB1GO+7YHWu1JM2+5NtgzBZ0VcVGu0CjyaLaMM3ZEJymBdqSGbg1qIAu3aclCVFbbZtov/Bh+3h4Zj4JwQKwxUICyEwgkVVQEpaljoneQJmVFktpeNAK3k0SrKD9XJTPdtvjZ/juB6bhQDfS/gVMc9bhTA5WSAn9eepmWDPezbHl12BJAqlRViHb/SbPjGHuXoINt/PHzHcuXk7s7II6DIsMeVNB/GXJ91ZXv9S6aVvr5Sd6hzXfdq9spOM2O12C18vf5rvu6rVkoJ7JI8Ay+aqd/Bood+JRV0UFbkeblTHwuIQT/siGnB0ySXyrJruex/HoACYKadp05iyOuwQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VCllqG0a131aNhfIDOqG5cKZ2kkWwETiCW1KyNSKqs=;
 b=HROvRpKbUABGzgr8ZbfL3nHrk8BFAIr5mccZLcI7keoJV+NDsfE7BPmyPXEm21UNODlHRvtemFoEclxE6RycLIP/L4AH4D98sGaQq0GgiopPHgdtdEl41Casc1Q3cWykMj1V1unsmLWpCEnO0p4HPFlQFD8giiTcuJXZYluoxKZtRSKNsPnnzjck/q30sLIEY/33tjqU3g+OfmhJBlMzneWKoD4Q0W+YQ9uRjmZIFcIrw92mH0auXv+lGqL3xI9xTbBYX4pCl/c2rWYrfeL9EZO8IIntnBPjFyJZSvlQaoeL2bqdiyGK07H8pW0nnd96ZHPjG2AA/J23VM4/Dx5N0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VCllqG0a131aNhfIDOqG5cKZ2kkWwETiCW1KyNSKqs=;
 b=nqTU0Opx6zCBTieQxuN/5sDmMfR/q3rtVDyXS//rybcpgs1nzg0j4eRatrKe3Z5jJ/+IjXQiBCHugtF0kXAwDL8CrGKZ86s2rXfrTuxnazE5LH0+JHOrWaO82hKDG4nx/Y/JG/hWXanGzFJuPgkFd74wkjbe0+A8gRuTcgZ4k30=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PSAPR03MB5464.apcprd03.prod.outlook.com (2603:1096:301:23::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 01:24:39 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 01:24:39 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 06/15] mailbox: mediatek: Add cmdq_mbox_stop to disable
 GCE thread
Thread-Topic: [PATCH 06/15] mailbox: mediatek: Add cmdq_mbox_stop to disable
 GCE thread
Thread-Index: AQHZ6mWFNVMFuljvakKU/AkS/85ou7AhW1EA
Date: Tue, 19 Sep 2023 01:24:39 +0000
Message-ID: <e4449273185eb7794f344386d9b5a4605cfea4d2.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20230918192204.32263-7-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PSAPR03MB5464:EE_
x-ms-office365-filtering-correlation-id: f282e21b-005c-483a-0e83-08dbb8af3181
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SMuRYez7o+uyeL1ZEkvQKCgwN4UN88trM64s4YK8ZYl65m603HLT6NXnefkIKW4nF6xo6J3IXrx6Cgk80nUebhAKLsrf9DuUrOD3I8l2IR8C/L3oaa0OSHeCUOTXhJow21WANn92E8HIh7OCjQ+bbyquJ92JVQavQvT0rAkrdNpzN+byQCpt7K8fR+aG0SZ/9ApivAJGM6fPJP/K5U2QQ/eWynZ5tMPVXyFAfgN1Yr5taqz3u2Rj2wIpGRb9LQ/4SCI+KB9h193+fWJbldfRZjjrl8tnuFWKHuDAWUUh2L/ouSMItnJ48nK93IjlkoOEI8Vid9rXfj6jr43tvQs4OEsRYDKVoWkvAzzR16a0H+gbTIGgYCkmBOl7VEXfhIosDxSkxgzxm6cgHw73JIGhAccz2KplpS8QehZmIjhypaw0vTWW4Fcfsl8Wo4lrMe43f4xTO3wy+P2H9idlHZn3OrM5dm+yIfW0Lo6G72+2Cxwa+8gfPZ1aPUs4KuPvXT7WEBFPLhS8yZayNDOihc+KKbJTfDKi3oxsH9kJjH+UrYH4ERr6pmfm37wLua8zAtIntHmze6ARuncMAKbMK7y/TvF5RkE0RzT7HlTNgepyQlgly1h/5ggdCSuGe1ZBszdJgf1+0eW0MIyZVLx/s1GdeRwLPGsmQ8BF/Vw3nWuBJD4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(2906002)(7416002)(5660300002)(26005)(54906003)(66946007)(66476007)(66556008)(41300700001)(66446008)(64756008)(316002)(110136005)(15650500001)(76116006)(478600001)(4326008)(8936002)(8676002)(71200400001)(6506007)(6486002)(6512007)(2616005)(85182001)(36756003)(107886003)(38100700002)(122000001)(38070700005)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWZlUkJkOTNjU3FQV3NzQ0RBLzZkM2FxMnlpbjMrd3BTSHZST2VMUmx1ZW1H?=
 =?utf-8?B?RnQxRUozY3hpYjhrVWQrSWp2cFhuYThrbGxOLzIzYmt4OTFDbTlsTlVZRFhY?=
 =?utf-8?B?d0pHR2tDNmZTL1l4c0RielBFaXE1NWpRYnlUcHVoMVh1TUN3Mmp6alg4TE9Q?=
 =?utf-8?B?ZEFpdWtEc2NjSUhUQXdEWW1kMS9ha292dlY4bW03Uk94VEpNamFNVVRodHlI?=
 =?utf-8?B?eDhKZHJsV21TY0VMcnZqcVFXTUlEMXFnUGd0WXBKKzdteXhzc0R6a0tsWVpJ?=
 =?utf-8?B?dStYclhnelllTXdFYXR3ZkpFRnJ6emxkR2MwSlFldEZmRC9KY3N2M1Bteklr?=
 =?utf-8?B?aThTT2theVBpSmt3YWN3VE1NWTkvdjh4anJzdkJiOWhaS1ZyUUVhVm1ncVJD?=
 =?utf-8?B?Mkh3ajlMYnY1M3l3VGpiVmxKcWVpNUNGYW9tL1lBQVozUHpDam1TNnhhWXZx?=
 =?utf-8?B?YmZ3bFdZMUR5ZG1haTNjMnM5amE2ZWNaVkRZaUp2NzZQT2o2TzJEWEdoZTFa?=
 =?utf-8?B?N1A2ZFQ2MXFXd3IvTzEyb3diazVnWTczQ29naUllZm5DYTE4ZkNhaUNPTXNW?=
 =?utf-8?B?TWkrWktyV3JNMEgxRlJpL2FjNE1FMDN1YWVYT1BuRkFuQng4WVBEcllGMjZp?=
 =?utf-8?B?RlpaaWpNMFkxcFF4aFBsc0p0TkxsSnpKY1Q2TVlqbmdmbVlGOVBybHZ6Wm5E?=
 =?utf-8?B?QVM5WGFnQnFrVDFHMkZUTllkckdtMTFkcGhqSTdWQTV3cW5TekZsNFRLdVlG?=
 =?utf-8?B?dXlzN2cvclFjOTlHV0hSREtiaU8rSkRIb3dTeWhrUitxdmJRaWs5dWQ2Q3FC?=
 =?utf-8?B?d3YzNVFnNS9LWXRYU0NSV1FCV1lBbUVtRHhvZ0E5WjNsQzlERklMODRpM3I1?=
 =?utf-8?B?SzdkNU4ramQzVVB2U0pyUVhNbkN4UW52L3V1blZGOWZMTXZsWnc0QU5iTWdp?=
 =?utf-8?B?R3RyYjdtVUxEU2ZOdDhBTUFoUUNmaTNIbVRZRXQ2eFFnL1Ixam9GTjlRdFRm?=
 =?utf-8?B?VENtZ3kxeU05SWFPNW85OXV4YUVOSE5GZWZ4WENjeVVpQUdFaWVZYURyb3po?=
 =?utf-8?B?VFFVb1ZNZlo2U2gyUmNZWER4RkdHc0RwaFVSNzA5UlA5YTJqajdIdlByd0Uy?=
 =?utf-8?B?QXdLZlB5ajJvOHZPMkRTVWlkZGtjeWtLNGhDNzN3bjd3Ukt2dTRqQUF2QnpG?=
 =?utf-8?B?TTRud1NZV2lFUVpqZ25ucEI4V0ovOFpwcXpmWUJFWWpJMkRGVDZqNDgwSU9y?=
 =?utf-8?B?VHk3eCtpK29kejMrWU5tK2F6NCtoTHRiTW05MmtTQ2ZEamk5dFlBd2NQamND?=
 =?utf-8?B?ajFCN21rV1ZOWWxZTHpJZ205WVBTK1lpeUg3eGR1cHFrV2c0VzUrY2pIOGY2?=
 =?utf-8?B?TytYZ1poenNmMmY1L1ZWOG5TZm1IRHdTTGIrYm5vRk03TG8yUkJCOVNVV29x?=
 =?utf-8?B?R2dkMXhUdG9pN3FsTS9jdEVEZ1JlZmdDQ09Rc292T25Sd0MrTGpUZG5JQis5?=
 =?utf-8?B?TjB5MHNxRVhjd2UxWFNBN1RYT0dnQkhueGxpM3I4Y3NmVEJHbU8zQ29RMzdL?=
 =?utf-8?B?Sk1MNUVKWVpTUlArUjhWQVl4Sm1xdkI4MitMMDREdUZXYkI1QU13MDRwL2Vr?=
 =?utf-8?B?R0pxdkFIcDQyK3djVGRoVWF3dWs5OW9la1JlL1J1ajg5MlVlZ0tKVjFBUyto?=
 =?utf-8?B?SjJPYmJZaEt6UGFzNzJuaFhXU2kyak1mZVJTeUo3eENocWxVdmtMWHY5eE43?=
 =?utf-8?B?MWZYM0ZuRnpvMkxaZWhxSnBHTGJ5UmwrZWtWSHdRVGhqdXFRYkFvU0hTWUJ6?=
 =?utf-8?B?cmxHbElEdnBSVEpjOGt1SDJuQ2xyMUFsWnd1WXlSa3hKVVZ4UjJkOThxRHZK?=
 =?utf-8?B?Mnd0NDhIZUZTVmMwZnJ2SXZLQVBZSkIyTUJjS3VZVUoyYzN3ZjRtR3IrVG9G?=
 =?utf-8?B?WjJmZGFFajFxLzRIS2IwckdhZUNTN2hGZnFHN0JYR0R4RXhhcklxeTllbXlU?=
 =?utf-8?B?WGdyK3Z3WHdoR05aclpGaHhKTGJCSXNLRXJEU3BjdWd3Y2Z4b2g0bEN0Uk4x?=
 =?utf-8?B?ZXNHblQwWWxFTDByN092NFBrVk1zTUNuWEt3V1ZJZVVpRVR5M3pDQXl4Um1u?=
 =?utf-8?B?QjFodVdTOHNXbWx6OHhwQjA3cFNGdko4LzZFeG5sL2Z1S1hpVGRNRjNGUHBl?=
 =?utf-8?B?M0E9PQ==?=
Content-ID: <315FCB4C84B5844FB72305328924F604@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f282e21b-005c-483a-0e83-08dbb8af3181
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 01:24:39.2221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 333OcpyXT7JOignQUXZqCpGWNAbYKD9jB87OlnC3AZKqOHShGcKh0Jhfjv4vx/0s9O/5r0cTDU4FshWzeCQe4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5464
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1096438573.27544710"
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?utf-8?B?RWx2aXMgV2FuZyAo546L5YabKQ==?= <Elvis.Wang@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_1096438573.27544710
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtUdWUsJiMzMjsyMDIzLTA5LTE5JiMzMjth
dCYjMzI7MDM6MjEmIzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsm
IzMyO0FkZCYjMzI7Y21kcV9tYm94X3N0b3AmIzMyO3RvJiMzMjtkaXNhYmxlJiMzMjtHQ0UmIzMy
O3RocmVhZC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7VG8mIzMyO3N1cHBvcnQmIzMyO3RoZSYjMzI7
ZXJyb3ImIzMyO2hhbmRsaW5nJiMzMjtvciYjMzI7dGhlJiMzMjtzdG9wJiMzMjtmbG93JiMzMjtv
ZiYjMzI7dGhlJiMzMjtHQ0UmIzMyO2xvb3BwaW5nDQomZ3Q7JiMzMjt0aHJlYWQsJiMzMjtsb3Bw
aW5nJiMzMjt0aHJlYWQmIzMyO3VzZXImIzMyO2NhbiYjMzI7Y2FsbCYjMzI7Y21kcV9tYm94X3N0
b3AmIzMyO3RvJiMzMjtkaXNhYmxlJiMzMjt0aGUNCiZndDsmIzMyO0dDRSYjMzI7SFcmIzMyO3Ro
cmVhZC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0phc29uLUpILkxp
biYjMzI7Jmx0O2phc29uLWpoLmxpbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZn
dDsmIzMyOyYjMzI7ZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7NiYjMzI7KysrKysrDQomZ3Q7JiMzMjsmIzMy
O2luY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmgmIzMyO3wmIzMyOzEmIzMy
OysNCiZndDsmIzMyOyYjMzI7MiYjMzI7ZmlsZXMmIzMyO2NoYW5nZWQsJiMzMjs3JiMzMjtpbnNl
cnRpb25zKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZl
cnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCiZndDsmIzMyO2IvZHJpdmVycy9tYWlsYm94
L210ay1jbWRxLW1haWxib3guYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzRkNjJiMDdjMTQxMS4uOGJk
MzlmZWNiZjAwJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL21haWxib3gv
bXRrLWNtZHEtbWFpbGJveC5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9tYWlsYm94L210
ay1jbWRxLW1haWxib3guYw0KJmd0OyYjMzI7QEAmIzMyOy00NjksNiYjMzI7KzQ2OSwxMiYjMzI7
QEAmIzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7Y21kcV9tYm94X3NodXRkb3duKHN0cnVjdCYjMzI7
bWJveF9jaGFuDQomZ3Q7JiMzMjsqY2hhbikNCiZndDsmIzMyOyYjMzI7c3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmYW1wO3RocmVhZC0mZ3Q7Y2hhbi0mZ3Q7bG9jaywmIzMyO2ZsYWdzKTsNCiZndDsm
IzMyOyYjMzI7fQ0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyt2b2lkJiMzMjtjbWRxX21ib3hf
c3RvcChzdHJ1Y3QmIzMyO21ib3hfY2hhbiYjMzI7KmNoYW4pDQomZ3Q7JiMzMjsrew0KJmd0OyYj
MzI7K2NtZHFfbWJveF9zaHV0ZG93bihjaGFuKTsNCg0KY21kcV9tb2J4X3N0b3AoKSYjMzI7aXMm
IzMyO2VxdWFsJiMzMjt0byYjMzI7Y21kcV9tYm94X3NodXRkb3duKCksJiMzMjtzbyYjMzI7Y2xp
ZW50JiMzMjtkcml2ZXINCmNvdWxkJiMzMjsmIzMyO2NhbGwmIzMyO21ib3hfZnJlZV9jaGFubmVs
KCkmIzMyO3RvJiMzMjtkbyYjMzI7dGhpcyYjMzI7YW5kJiMzMjt0aGlzJiMzMjtmdW5jdGlvbiYj
MzI7aXMNCnJlZHVuZGFudC4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOyt9DQomZ3Q7JiMz
MjsrRVhQT1JUX1NZTUJPTChjbWRxX21ib3hfc3RvcCk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsm
IzMyO3N0YXRpYyYjMzI7aW50JiMzMjtjbWRxX21ib3hfZmx1c2goc3RydWN0JiMzMjttYm94X2No
YW4mIzMyOypjaGFuLCYjMzI7dW5zaWduZWQmIzMyO2xvbmcNCiZndDsmIzMyO3RpbWVvdXQpDQom
Z3Q7JiMzMjsmIzMyO3sNCiZndDsmIzMyOyYjMzI7c3RydWN0JiMzMjtjbWRxX3RocmVhZCYjMzI7
KnRocmVhZCYjMzI7PSYjMzI7KHN0cnVjdCYjMzI7Y21kcV90aHJlYWQmIzMyOyopY2hhbi0NCiZn
dDsmIzMyOyZndDtjb25fcHJpdjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2luY2x1
ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmgNCiZndDsmIzMyO2IvaW5jbHVkZS9s
aW51eC9tYWlsYm94L210ay1jbWRxLW1haWxib3guaA0KJmd0OyYjMzI7aW5kZXgmIzMyO2E4ZjAw
NzBjN2FhOS4uZjNlNTc3MzM1YWNiJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9pbmNs
dWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oDQomZ3Q7JiMzMjsrKysmIzMyO2Iv
aW5jbHVkZS9saW51eC9tYWlsYm94L210ay1jbWRxLW1haWxib3guaA0KJmd0OyYjMzI7QEAmIzMy
Oy03OSw1JiMzMjsrNzksNiYjMzI7QEAmIzMyO3N0cnVjdCYjMzI7Y21kcV9wa3QmIzMyO3sNCiZn
dDsmIzMyOyYjMzI7fTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3U4JiMzMjtjbWRx
X2dldF9zaGlmdF9wYShzdHJ1Y3QmIzMyO21ib3hfY2hhbiYjMzI7KmNoYW4pOw0KJmd0OyYjMzI7
K3ZvaWQmIzMyO2NtZHFfbWJveF9zdG9wKHN0cnVjdCYjMzI7bWJveF9jaGFuJiMzMjsqY2hhbik7
DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjsjZW5kaWYmIzMyOy8qJiMzMjtfX01US19D
TURRX01BSUxCT1hfSF9fJiMzMjsqLw0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48
cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioq
KioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBt
ZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWws
IHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Ns
b3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZl
eWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1p
bmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9m
IHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQg
cmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVs
LiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9y
IGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBw
bGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhp
cyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRp
c2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRo
YW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_001_1096438573.27544710
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBUdWUsIDIwMjMtMDktMTkgYXQgMDM6MjEgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gQWRkIGNtZHFfbWJveF9zdG9wIHRvIGRpc2FibGUgR0NFIHRocmVhZC4N
Cj4gDQo+IFRvIHN1cHBvcnQgdGhlIGVycm9yIGhhbmRsaW5nIG9yIHRoZSBzdG9wIGZsb3cgb2Yg
dGhlIEdDRSBsb29wcGluZw0KPiB0aHJlYWQsIGxvcHBpbmcgdGhyZWFkIHVzZXIgY2FuIGNhbGwg
Y21kcV9tYm94X3N0b3AgdG8gZGlzYWJsZSB0aGUNCj4gR0NFIEhXIHRocmVhZC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jICAgICAgIHwgNiArKysr
KysNCj4gIGluY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmggfCAxICsNCj4g
IDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiBiL2RyaXZlcnMvbWFpbGJveC9tdGst
Y21kcS1tYWlsYm94LmMNCj4gaW5kZXggNGQ2MmIwN2MxNDExLi44YmQzOWZlY2JmMDAgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gKysrIGIvZHJp
dmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiBAQCAtNDY5LDYgKzQ2OSwxMiBAQCBz
dGF0aWMgdm9pZCBjbWRxX21ib3hfc2h1dGRvd24oc3RydWN0IG1ib3hfY2hhbg0KPiAqY2hhbikN
Cj4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ0aHJlYWQtPmNoYW4tPmxvY2ssIGZsYWdzKTsN
Cj4gIH0NCj4gIA0KPiArdm9pZCBjbWRxX21ib3hfc3RvcChzdHJ1Y3QgbWJveF9jaGFuICpjaGFu
KQ0KPiArew0KPiArCWNtZHFfbWJveF9zaHV0ZG93bihjaGFuKTsNCg0KY21kcV9tb2J4X3N0b3Ao
KSBpcyBlcXVhbCB0byBjbWRxX21ib3hfc2h1dGRvd24oKSwgc28gY2xpZW50IGRyaXZlcg0KY291
bGQgIGNhbGwgbWJveF9mcmVlX2NoYW5uZWwoKSB0byBkbyB0aGlzIGFuZCB0aGlzIGZ1bmN0aW9u
IGlzDQpyZWR1bmRhbnQuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9M
KGNtZHFfbWJveF9zdG9wKTsNCj4gKw0KPiAgc3RhdGljIGludCBjbWRxX21ib3hfZmx1c2goc3Ry
dWN0IG1ib3hfY2hhbiAqY2hhbiwgdW5zaWduZWQgbG9uZw0KPiB0aW1lb3V0KQ0KPiAgew0KPiAg
CXN0cnVjdCBjbWRxX3RocmVhZCAqdGhyZWFkID0gKHN0cnVjdCBjbWRxX3RocmVhZCAqKWNoYW4t
DQo+ID5jb25fcHJpdjsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWFpbGJveC9tdGst
Y21kcS1tYWlsYm94LmgNCj4gYi9pbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJv
eC5oDQo+IGluZGV4IGE4ZjAwNzBjN2FhOS4uZjNlNTc3MzM1YWNiIDEwMDY0NA0KPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oDQo+ICsrKyBiL2luY2x1ZGUv
bGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmgNCj4gQEAgLTc5LDUgKzc5LDYgQEAgc3Ry
dWN0IGNtZHFfcGt0IHsNCj4gIH07DQo+ICANCj4gIHU4IGNtZHFfZ2V0X3NoaWZ0X3BhKHN0cnVj
dCBtYm94X2NoYW4gKmNoYW4pOw0KPiArdm9pZCBjbWRxX21ib3hfc3RvcChzdHJ1Y3QgbWJveF9j
aGFuICpjaGFuKTsNCj4gIA0KPiAgI2VuZGlmIC8qIF9fTVRLX0NNRFFfTUFJTEJPWF9IX18gKi8N
Cg==

--__=_Part_Boundary_001_1096438573.27544710--


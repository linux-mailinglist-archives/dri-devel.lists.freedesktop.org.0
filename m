Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7157E7C63A9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 06:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D3D10E1F2;
	Thu, 12 Oct 2023 04:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EC410E1F2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 04:05:15 +0000 (UTC)
X-UUID: 8937330468b411ee8051498923ad61e6-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=VEu9is+p17j9gyN6QL26R8Mkj8G0xvQmEQXAVbyYJbc=; 
 b=FAyAmdoVtVPzV0RNA64odXT11LYWSvYDLh1uULFEzhSL+3J2CzO/Ss0oLb9SSxEGr/TyTrp+E9Iomj8Es9Cm0egkh0/vTR+19SPvD6bJUTNl2kppZ1WwFgvWzMXojqlo+dnC4pMwhHIZmVgUoBO/T1RF22ppaaVCsoeb8kG3rp8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:119cbeb2-c85f-42c1-a110-b6d8d8e2a82d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:2ad606c4-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 8937330468b411ee8051498923ad61e6-20231012
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 208309892; Thu, 12 Oct 2023 12:05:10 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Oct 2023 12:05:09 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Oct 2023 12:05:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZES4tJ3HF5z97E7ZdQxrXRJFuo5+tBRnhnDG55FC11aMdqtulTilz5eiWH5ZoN+38fK3G5nmjsMhNUeCCSwv7yJWuh9/kS2w0jpIvXrI0vQxqtvNKCjnwPkL+MKNhPEogszFk7e9znE/lfg5iYEnQy1jqRI7sckVjG8hmLD81Zx90quWOd1QwXfYemjoAQs3qtQYa0hxKMSMIn1ZU0CmRyQ+F6FcDfGghtVN2RBu6HAFVfRwEvPog7Qrq3mmqUMZ3SlCTkmIiXqEelxu8aY0NEhF6tuOFh7NsnJ4+m5Hu01phcwQZzEyShFg6BllVl0fL3HqTcA9MOepobwaGOraOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoNfSDvq9WqNuzZotEuWZudXFqrzc9xdxJ5pLOUUK4M=;
 b=NXJzoCt+ghFy3YqPyd7P078U7l84UoSz0agLfk+kBIS+cDOB2zmN+HuqapGQAM4pjYtZfOdmRLqNmvBHfwk+iSPxuln0RcE9W70IvFj3cEKgnEsoOvRo3VZwXROMNQTweYB36chkPLYTkV5cV7bcWhP44G4tQTTVvXNPIOk6n7X5Ae7FEEu93JmddT6rSPLNZrvy6V25JaquwbJUglKptwZycqBfcCfOoKYwKWLQ1cQANYhUKjZB2fR7UOhVwTvWaKtb8fiZ4jDH1RCXAIP+S9arbF8M1eHhUrhRo6O6Hnd+92Eu3IcuQHJrwh6G+CNGQpLTkigx9Ogo3v6qAShUyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoNfSDvq9WqNuzZotEuWZudXFqrzc9xdxJ5pLOUUK4M=;
 b=T1pvwY+YUuLLK4FHNMYfRBSBCjfB1V0dOD5cHWkYWsva6mYXuwMibZu1VuCpGTr7vOk4QGaRd1HFNDzqL3aksgt6kMlEred3/mtXOBfix+vCStDp+KdmCTA/jxguwjBFN6crcguA95yKGkEXJNgKMsPhB0qcVsnTaAOxvSq6NV4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6991.apcprd03.prod.outlook.com (2603:1096:101:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.42; Thu, 12 Oct
 2023 04:05:07 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%7]) with mapi id 15.20.6863.041; Thu, 12 Oct 2023
 04:05:07 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v10 07/16] drm/mediatek: aal: Use bitfield macros
Thread-Topic: [PATCH v10 07/16] drm/mediatek: aal: Use bitfield macros
Thread-Index: AQHZxqWNJjk7dFi/EkyC9eOuDkbI9LBF9UUA
Date: Thu, 12 Oct 2023 04:05:07 +0000
Message-ID: <663daba1611ba84c96dcbf33ed93f151d5e3f160.camel@mediatek.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
 <20230804072850.89365-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230804072850.89365-8-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6991:EE_
x-ms-office365-filtering-correlation-id: 2246797a-3bc1-4597-f0f7-08dbcad86baf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M0sL2sQmSD3MzWBtv1MuKONesReXKu9zvhTuoAQ82CWLVrsRP/GsIUvhevnNfWvxFp87nLsXn4U/hor9ziJxsdZsmgV2Invi5PoFTp/VLIkrpZxbQA9HYshlMbiYa0Ntkk0oT4mTp56SG7zYLIQ9thR2/kcwyPuoKtElL53ES38b1LF7uQcnUbdAg20q7WdbOZs0vAsbi46/J+KWS8PPr3Q5IHSKYvBCOynPyvworxfj7Q0/siOPYejMVIXBjnI8BKgX1D9Kw8jYVX1AZbhL4Lc/JaGoK6gUuX0LCc6pobP34OgcuhgSgUhootfysMVrzDR81sjZy5tcemcGITKOkTjBHm4QSfHCz/WhP2h6KafTuRH0Bk45KcuwX2KxVl2jj+WW52hl5r01yrX7PssFQ8PEv7lpgKv4AxMxmwN8jZNTwJatCdlEmQ2lzfYHhiAPWA11gd0HOVBVzvxnlm1tz/tN4KYCP05SXWSN4SxkhugDlqyNT1FQtSKcT1xFDx3GkK1Wbcky31z8ZVzzU0Fscl/UuJ+CtXoMx1OajhvvFPNOS2FMWwsLwZTY2yPV4AIwmiFvdxCG/obxUiRT7WhuSrJ8UM/R9V/1Z8MvZ21Ap3Mr92BzijJx4dDQzOnTa3+840LlyScFKo+dxTwy7FsQiIjbOkTxFVCekaVbPQUNC9s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(39860400002)(366004)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(86362001)(38100700002)(122000001)(38070700005)(36756003)(85182001)(6512007)(478600001)(4326008)(6486002)(6506007)(5660300002)(41300700001)(8936002)(71200400001)(2906002)(2616005)(66556008)(110136005)(8676002)(316002)(54906003)(66476007)(64756008)(7416002)(76116006)(66446008)(66946007)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkVmWHY1SGVBUXRPaHpub3RyUkpwREVsd3VnL0lpV2llRkRxVDhjU2VtcHBW?=
 =?utf-8?B?ZE1uRnZuQXRSUC9PMHQ3cGNEbk9ROE5BWjF0Q0FsSGp3Z2t5VUtGWlNvRlhv?=
 =?utf-8?B?cEZuRGJrNWpaL0pKckgwQi9WWHZhN2pCaTQxekZDRHpKNWxNRGlSREpieEtU?=
 =?utf-8?B?clRqdE1GbUpadTZuOG9yMzd5ZDgrY3RoNXd2WjhGck91dEpDZzZXdzBoRHA5?=
 =?utf-8?B?QW94anMzbFZ5WGQ1YVVnKzJab3dZMTNTS3VEVStTVXh6MVVGVG5rSkdoTWNB?=
 =?utf-8?B?QXpOTDBJbk9jWXdHdnRKbE5EckNBZ25iSStCVmtxUFAxZmxIcGt0aHBRV014?=
 =?utf-8?B?TEJra1owVFRhcG9xdmtBT091T2JycU5FVHA2a0U1dFovVXRidnExbWY5S2dQ?=
 =?utf-8?B?M09oUGFQUGt5VmFQL1RZbWN3UnRXWTUwbmdQSEZRWFVuNGhWTWJHbG0wTngr?=
 =?utf-8?B?YXZUSGRBTXA3VFlvdlJaRTkrMno0cE5qK1RneWU4bGR5elh3Z3NoclZxaEds?=
 =?utf-8?B?Q1FpMlJ0eUE3SFhaaXRHUXlONS9RcE5WV1lGQTJvc0gzNlRRdXE1bkxkRHFa?=
 =?utf-8?B?SHkxLzN4c2lpcFB4T2JBZFhxQ3VvWk96TzFnNVc4dGgxczBnalI2NWgrSU9s?=
 =?utf-8?B?QUdrNkwvNDlXTFR5LzJONW0waVBRaDFKVjN6RE96akoxaXB0ZlpwWnY0dDJK?=
 =?utf-8?B?RHFUOE9oSmJuVUlJY3k3dEpVTHdrVisyNzdMYjY1UGlUdVdRVENUWkZBY2Zj?=
 =?utf-8?B?eUVMdjNyK0hXK01iUldJMmZVTVJwdkpxM1h6RFZrNEpJd1c0cWVwSElKTk9T?=
 =?utf-8?B?RnJoR0M4SjIwNzQ0MUJmUXRwTnFWeTlaaHJYd1AyaE02S3VFUzI2bS9PUGZ1?=
 =?utf-8?B?d1dPcXZtUjNIcmhraHhmOFNOdit3K1dWSnBib2hUTFhrREhhVkdwc29NREJN?=
 =?utf-8?B?Y2hOa3h3M1RURHhHV05hWkdwUDBCVlBTQ1Z2dVZ2YTN3RE15dUVQamRjMlhu?=
 =?utf-8?B?LzBuSFVOdy9SNFVOSk4zTlJSNFVEaDdNZm9jRSt5cGl4WGRCRHNoajBFNFB1?=
 =?utf-8?B?NVg0R1lJaTlwN0pMNTRhbU9mMWxZTWc2NU9Ldy94UVR1dFErWm5saGdrZkNX?=
 =?utf-8?B?Y1BrK1lKNzN0UWpsNi9Sc0pMeE9WUVlJTm81UitsaGEzc0ViWXVsUnJ1cEV6?=
 =?utf-8?B?S2FvUHJ4cW9ucWtKWkpmVlJBM3crSlhMdVpzcTExWG5ncHY1UkJyWE8vallQ?=
 =?utf-8?B?Yk5oRUxRVTYyOUMwTWlCaE5tMWxESis3Q2xJOWFMSVA3QzNvQjhRaDVkSjFp?=
 =?utf-8?B?ZDVPZWtnc3ZMbEFmZHZoT1RIdFB0cW1wWjk1TGV1VmlnT1BYQXVTRVZjOTVL?=
 =?utf-8?B?ME9wUkdsWkFOb0pSZEpySXd2emNnNFZqMUdnVFB5NmwwRGZDSEVzT2F0VjBQ?=
 =?utf-8?B?eUlkL1p1cWNoSjF2VU93RTduay9IVXJtQXB5c2VEZGxydnpOd2oveDdyQ1Y3?=
 =?utf-8?B?d2VFLytwVkEySVhib2VrTUprcTM2RnJnZUhaOGFhOXdNa0REWWh5RTgzbzkz?=
 =?utf-8?B?aTk4RHlXc3VBKzV2TlU3V1ZpbnRpUlhLZSthcHVwZFBOUDJyTGw1a1VrdEdQ?=
 =?utf-8?B?d1ZKK3BZTjNyanFMcUZnL1pZZVBKbEdkdVpGTitYNHNSei82ZG8rT1NaeSsw?=
 =?utf-8?B?QnRSSWhxMEcyODluc1Qrdnhzd1BKa2RMb2o1NXVhWUFIeFFpVWwwZiszVUhV?=
 =?utf-8?B?Wk91WXBWbS8rMmtwUGViZmk1bWtYMzFLekJiOHFmK2RKZmgreUNhNFA3eEdY?=
 =?utf-8?B?Ync0SkxKc1lob3o0RCtzclV4eStqcEpKRm91Q2J0TjBFamNmRDZTZVUzcmll?=
 =?utf-8?B?WHZVa2Qxb1h1bDcwcjlnNWR5SmYyU0tabW50bUNFR1NWbUdvb3ltdEFWeGIx?=
 =?utf-8?B?SiswTkp4cHNDQUw5dnlxRWRuYmZLS1p4NXlxNFh2WjVXWUxMTU9Ic2tsTG4v?=
 =?utf-8?B?MFNHdHFPU2ltVFA2a0o3RVRncG81c3F1QmlUaEo4RWszaEUyV21MQ2dZMGNw?=
 =?utf-8?B?V2M2ZkpSRUlQWUdWVjU1d1V0eVA5MUJIS2ZBRjRnRk00djk0TWNtWEdxQXpz?=
 =?utf-8?Q?XoZiSsjMnj3jXz+BvcP3KeUz8?=
Content-ID: <D7494C88D03BEB41BE6E0D4EA7B996DF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2246797a-3bc1-4597-f0f7-08dbcad86baf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 04:05:07.1039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TxeoagkIpa4SQqQySHTjlUMIObUS4FStr0D1f+h99yXKlPCCj2K5TYWfCmjCbzNyg9d0zsvZ7U5JWErPk1k89A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6991
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_155918446.413159230"
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ehristev@collabora.com" <ehristev@collabora.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_008_155918446.413159230
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7RnJpLCYjMzI7MjAyMy0wOC0wNCYjMzI7
YXQmIzMyOzA5OjI4JiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7TWFrZSYjMzI7dGhlJiMzMjtjb2RlJiMzMjttb3Jl
JiMzMjtyb2J1c3QmIzMyO2FuZCYjMzI7aW1wcm92ZSYjMzI7cmVhZGFiaWxpdHkmIzMyO2J5JiMz
Mjt1c2luZyYjMzI7Yml0ZmllbGQNCiZndDsmIzMyO21hY3JvcyYjMzI7aW5zdGVhZCYjMzI7b2Ym
IzMyO29wZW4mIzMyO2NvZGluZyYjMzI7Yml0JiMzMjtvcGVyYXRpb25zLg0KDQpSZXZpZXdlZC1i
eTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVs
JiMzMjtSZWdubyYjMzI7Jmx0Ow0KJmd0OyYjMzI7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bj
b2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYyYjMzI7fCYjMzI7MTAmIzMyOysrKysrKysrLS0N
CiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzgmIzMyO2luc2VydGlv
bnMoKyksJiMzMjsyJiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYj
MzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5jDQom
Z3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYw0KJmd0OyYj
MzI7aW5kZXgmIzMyO2UyZTQxNTVmYWYwMS4uYmVjMDM1NzgwZGIwJiMzMjsxMDA2NDQNCiZndDsm
IzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfYWFsLmMNCiZn
dDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfYWFsLmMN
CiZndDsmIzMyO0BAJiMzMjstMTgsNiYjMzI7KzE4LDgmIzMyO0BADQomZ3Q7JiMzMjsmIzMyOyNk
ZWZpbmUmIzMyO0RJU1BfQUFMX0VOMHgwMDAwDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO0FB
TF9FTkJJVCgwKQ0KJmd0OyYjMzI7JiMzMjsjZGVmaW5lJiMzMjtESVNQX0FBTF9TSVpFMHgwMDMw
DQomZ3Q7JiMzMjsrI2RlZmluZSYjMzI7RElTUF9BQUxfU0laRV9IU0laRUdFTk1BU0soMjgsJiMz
MjsxNikNCiZndDsmIzMyOysjZGVmaW5lJiMzMjtESVNQX0FBTF9TSVpFX1ZTSVpFR0VOTUFTSygx
MiwmIzMyOzApDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO0RJU1BfQUFMX09VVFBVVF9TSVpF
MHgwNGQ4DQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO0RJU1BfQUFMX0xVVF9TSVpFNTEyDQom
Z3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7QEAmIzMyOy01Niw5JiMzMjsrNTgsMTMmIzMyO0BAJiMz
Mjt2b2lkJiMzMjttdGtfYWFsX2NvbmZpZyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwmIzMy
O3Vuc2lnbmVkDQomZ3Q7JiMzMjtpbnQmIzMyO3csDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2JwYywmIzMyO3N0cnVjdCYjMzI7Y21kcV9wa3QmIzMy
OypjbWRxX3BrdCkNCiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO210
a19kaXNwX2FhbCYjMzI7KmFhbCYjMzI7PSYjMzI7ZGV2X2dldF9kcnZkYXRhKGRldik7DQomZ3Q7
JiMzMjsrdTMyJiMzMjtzejsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjstbXRrX2RkcF93cml0
ZShjbWRxX3BrdCwmIzMyO3cmIzMyOyZsdDsmbHQ7JiMzMjsxNiYjMzI7fCYjMzI7aCwmIzMyOyZh
bXA7YWFsLSZndDtjbWRxX3JlZywmIzMyO2FhbC0mZ3Q7cmVncywmIzMyOw0KJmd0OyYjMzI7RElT
UF9BQUxfU0laRSk7DQomZ3Q7JiMzMjstbXRrX2RkcF93cml0ZShjbWRxX3BrdCwmIzMyO3cmIzMy
OyZsdDsmbHQ7JiMzMjsxNiYjMzI7fCYjMzI7aCwmIzMyOyZhbXA7YWFsLSZndDtjbWRxX3JlZywm
IzMyO2FhbC0mZ3Q7cmVncywmIzMyOw0KJmd0OyYjMzI7RElTUF9BQUxfT1VUUFVUX1NJWkUpOw0K
Jmd0OyYjMzI7K3N6JiMzMjs9JiMzMjtGSUVMRF9QUkVQKERJU1BfQUFMX1NJWkVfSFNJWkUsJiMz
Mjt3KTsNCiZndDsmIzMyOytzeiYjMzI7fD0mIzMyO0ZJRUxEX1BSRVAoRElTUF9BQUxfU0laRV9W
U0laRSwmIzMyO2gpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K210a19kZHBfd3JpdGUoY21kcV9w
a3QsJiMzMjtzeiwmIzMyOyZhbXA7YWFsLSZndDtjbWRxX3JlZywmIzMyO2FhbC0mZ3Q7cmVncywN
CiZndDsmIzMyO0RJU1BfQUFMX1NJWkUpOw0KJmd0OyYjMzI7K210a19kZHBfd3JpdGUoY21kcV9w
a3QsJiMzMjtzeiwmIzMyOyZhbXA7YWFsLSZndDtjbWRxX3JlZywmIzMyO2FhbC0mZ3Q7cmVncywN
CiZndDsmIzMyO0RJU1BfQUFMX09VVFBVVF9TSVpFKTsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYj
MzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7LyoqDQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0t
ey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQog
KioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBl
LW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlk
ZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJv
bSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUg
DQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwg
ZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29w
eWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmlu
dGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1
bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1t
YWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGlu
IGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlp
bmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBl
LW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBk
byBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBw
ZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_008_155918446.413159230
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gRnJpLCAyMDIzLTA4LTA0IGF0IDA5OjI4ICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gTWFrZSB0aGUgY29kZSBtb3JlIHJvYnVzdCBh
bmQgaW1wcm92ZSByZWFkYWJpbGl0eSBieSB1c2luZyBiaXRmaWVsZA0KPiBtYWNyb3MgaW5zdGVh
ZCBvZiBvcGVuIGNvZGluZyBiaXQgb3BlcmF0aW9ucy4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxj
ay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vIDwNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYyB8IDEw
ICsrKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX2FhbC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5jDQo+
IGluZGV4IGUyZTQxNTVmYWYwMS4uYmVjMDM1NzgwZGIwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfYWFsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX2FhbC5jDQo+IEBAIC0xOCw2ICsxOCw4IEBADQo+ICAjZGVmaW5l
IERJU1BfQUFMX0VOCQkJCTB4MDAwMA0KPiAgI2RlZmluZSBBQUxfRU4JCQkJCQlCSVQoMCkNCj4g
ICNkZWZpbmUgRElTUF9BQUxfU0laRQkJCQkweDAwMzANCj4gKyNkZWZpbmUgRElTUF9BQUxfU0la
RV9IU0laRQkJCQlHRU5NQVNLKDI4LCAxNikNCj4gKyNkZWZpbmUgRElTUF9BQUxfU0laRV9WU0la
RQkJCQlHRU5NQVNLKDEyLCAwKQ0KPiAgI2RlZmluZSBESVNQX0FBTF9PVVRQVVRfU0laRQkJCTB4
MDRkOA0KPiAgI2RlZmluZSBESVNQX0FBTF9MVVRfU0laRQkJCTUxMg0KPiAgDQo+IEBAIC01Niw5
ICs1OCwxMyBAQCB2b2lkIG10a19hYWxfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWdu
ZWQNCj4gaW50IHcsDQo+ICAJCQkgICB1bnNpZ25lZCBpbnQgYnBjLCBzdHJ1Y3QgY21kcV9wa3Qg
KmNtZHFfcGt0KQ0KPiAgew0KPiAgCXN0cnVjdCBtdGtfZGlzcF9hYWwgKmFhbCA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOw0KPiArCXUzMiBzejsNCj4gIA0KPiAtCW10a19kZHBfd3JpdGUoY21kcV9w
a3QsIHcgPDwgMTYgfCBoLCAmYWFsLT5jbWRxX3JlZywgYWFsLT5yZWdzLCANCj4gRElTUF9BQUxf
U0laRSk7DQo+IC0JbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgdyA8PCAxNiB8IGgsICZhYWwtPmNt
ZHFfcmVnLCBhYWwtPnJlZ3MsIA0KPiBESVNQX0FBTF9PVVRQVVRfU0laRSk7DQo+ICsJc3ogPSBG
SUVMRF9QUkVQKERJU1BfQUFMX1NJWkVfSFNJWkUsIHcpOw0KPiArCXN6IHw9IEZJRUxEX1BSRVAo
RElTUF9BQUxfU0laRV9WU0laRSwgaCk7DQo+ICsNCj4gKwltdGtfZGRwX3dyaXRlKGNtZHFfcGt0
LCBzeiwgJmFhbC0+Y21kcV9yZWcsIGFhbC0+cmVncywNCj4gRElTUF9BQUxfU0laRSk7DQo+ICsJ
bXRrX2RkcF93cml0ZShjbWRxX3BrdCwgc3osICZhYWwtPmNtZHFfcmVnLCBhYWwtPnJlZ3MsDQo+
IERJU1BfQUFMX09VVFBVVF9TSVpFKTsNCj4gIH0NCj4gIA0KPiAgLyoqDQo=

--__=_Part_Boundary_008_155918446.413159230--


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB5275E9DA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 04:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D1B10E094;
	Mon, 24 Jul 2023 02:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAF410E094
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 02:41:38 +0000 (UTC)
X-UUID: 9a6ec9fc29cb11ee9cb5633481061a41-20230724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=4VxGaeGuVkGjwPKorcxluiehWOAOdzwNHCjzVG9iOm8=; 
 b=M8wzbln/yoqT185zE7gQuK/kpqIUOuOvzNDq/5gCbJFf2brJJndJnrpXmD5r5dtVxALjvt2BrY1Of3BhyV10XgNVr7+eStdhIp8+qJo4PA5JU7v5S6NOhnyH4NEm1J70Q7kQq1cX0wxrO8SA8X0uK0LBn5cTwRCXXwNDjynq0aI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29, REQID:1624b05f-9c86-4efb-a709-9d146f4ac22b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7562a7, CLOUDID:8002ff8e-7caa-48c2-8dbb-206f0389473c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9a6ec9fc29cb11ee9cb5633481061a41-20230724
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1947084254; Mon, 24 Jul 2023 10:41:34 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 24 Jul 2023 10:41:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 24 Jul 2023 10:41:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4DoUpg8i/YLa9Yp8RSmdT8Zs3fQKVpd49uJhAo/+5FMpYhHJrPd0Erf0RKdRilqOWd8knWsA6gnJKEsnnbwRuslGZbcpwAM40Jy8lAkhvvgFmmrQA4ZfbiU6ArSc/s33B3J8JCn4u+rxakjPOkz63MTol8m0TnGRvuZCfUrCwuzPIqaJrikWezxDSJ3wluIDLq/SqfeND2rkmwhrVfEyRjXMA23dVuthVC4vd7lFMWMHkLSjkka6FFaYiaGhWsOHn7hmQHlbnZxhU5JbO3QP4DxTikb4YFAB1KL41c0dAowpMk0SmuMdrXkOBnkmID0KruEdCX/1QsNY2nNnSnLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUnd/pf9Jur1EpDIwDMlpYuaDJQkhmiZlPmOJpJlIHA=;
 b=S3/Oh0ikDlrtPVrqd+VZdcXCvOhdCA5BUpsj0R91XGlyFFY6PW3jSlC6HM2XW35QZFE71vYJo6oCut0vMgrGhL5eQExEHUkJWt5IxefMTfB35dSpS3QBo8RgKyhAkHVhl7IZQfDBTB3IyES1hB4qSXsjuRIR/wL/LZwy2jQ3sN9wrEW0WIPWjvWE43bavRVMJG+xvJi5m1x/xFU3xMzcehm5HbA1k8oidfLIwok/TPRK47FT1vZgGFtO589CN31bpLgJl2SQPDjH0Ibb2F9ZArDsMPLW8DniogrxVJHwlU7Uo2l6qOKlkNdt+aBwQPEfhm/cuZ6t6n6VCzDYx0b2wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUnd/pf9Jur1EpDIwDMlpYuaDJQkhmiZlPmOJpJlIHA=;
 b=r2Y5rCQ7Dpa0RIWMw7g+9NSGHAdyYcedueUy2hwUDgCQxEcRLF32oQu2rv/rdiXptuvbIWZg5VZMvmTPh5B4d1+j2F0EalxyS0WBghY3wrOoUHG4mlqq7Jwkk2eZIaboqIlj/Y/6FUH0K/E4hLVcXhNcU/dDV4IhXjuh7BbKSZM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7598.apcprd03.prod.outlook.com (2603:1096:820:e0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 02:33:03 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6609.026; Mon, 24 Jul 2023
 02:33:03 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v6 07/11] drm/mediatek: dp: Avoid mutex locks if audio is
 not supported/enabled
Thread-Topic: [PATCH v6 07/11] drm/mediatek: dp: Avoid mutex locks if audio is
 not supported/enabled
Thread-Index: AQHZuLlKGlLbs7kZ0EK6dtJsnqQzqq/IPOMA
Date: Mon, 24 Jul 2023 02:33:03 +0000
Message-ID: <0399116b8561527875faf4ef76817e4af8a40020.camel@mediatek.com>
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230717141438.274419-8-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7598:EE_
x-ms-office365-filtering-correlation-id: a8ab0edf-56ec-4e29-1559-08db8bee4e07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JMsVsEm9K7XzkCPYENfT2KksGmWp2gxqF8YaW7pqQUhnQSdh07dUa5u1Cd69dFFK2blMPBkg04YwVpcjGmL790obJOIPkX+XYqYd2UJEWgHnDMWrhyV4gERsJNPqd15/P7vo4Tl623XERgndP5DpexUilAIfXARFIfRTlDtKRJOj/toLwTcEeef3V9eyUxoTFszV3iAIDUek45Wt9YHRGVFVErc2p076D/Nn91XOLka0oEz/9iQ5ppUIEjOhk3qRqGlvnJX/QguaIy6NtS37UyB9whyeWEIYGOlEaVcRnu2vSIpeY8RiG8pzILJDVFCZrsBGE67rTXLgjViRzyWfBjMNaFJMcNNheVL76avIN37ck1l0YOPXWz6KlngqkG5qIju/mhGwfLoVVnpdMwzsp1Vmk3Hvvzx8Hiemh9lEGhTVuCtOb+ESltypi/pAHJCkQsiAgbLER86BqgxG+8t7Dk9SKb3ArWu64lYbM3R0RZoA0rEdAptCuDrCEYQvRMqIBF2fTIEPCdR39QA33UM9kH3r5WJqSh63lfqy5Umi9Pqj0zq/LkAY/np5knnfIrQ52dkVrqIKmPL2xxB+kUlHX3EH1GLBzUspES+AxJ0mJK6jx7cRjk1VtV8db3zTKWDtfp4IJjiI0RiPcUpycUVDzEAIzNCIxKckWB1If6sCd90=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199021)(2906002)(71200400001)(6486002)(7416002)(85182001)(36756003)(316002)(64756008)(66476007)(4326008)(66446008)(76116006)(66946007)(66556008)(41300700001)(54906003)(38070700005)(110136005)(83380400001)(122000001)(6512007)(8676002)(38100700002)(478600001)(8936002)(5660300002)(86362001)(6506007)(2616005)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3FSZUtGVVVBeDhITzM4Z0ErV2c0RjBYbmJucnlheUxiZ2paWHFhOXNIanB3?=
 =?utf-8?B?MEN5T1RBT0R0dnRMVlBaVG9oUzZsMTlxaVUyMHBIVG5CSDJwVlVHQzAzeHRp?=
 =?utf-8?B?V2pvT2NnNTFadWN1VjZITUVtdFZqYTFNTm44ODdWU2RXdnJ1ZzBtektIN3Rv?=
 =?utf-8?B?STV3Yk1ualFNL3lVMlBuSzdWeVh6dkhnRjZrWTdXN3V6djBXQm9zc0tGb3pN?=
 =?utf-8?B?RGR2ZGdxampoam5HWGpJUEgwVFRNOFh5N0RyOUdyYVBqTDh6WE1pVkhmQnI5?=
 =?utf-8?B?dFhrSUNkT1dZaFNXTTlBNCtoTTJ1V1RvMUtQV2xJUTNIQzRZNHFrbThNYitx?=
 =?utf-8?B?QVNWYzdmQllHR3VWNEJjUlFObWdnUWR6L0JyTGcvN052UytMUXVSdENJbUVM?=
 =?utf-8?B?VFFzUzNvQ1U1YTJRRVh2dzFTdEpENHBPNjhiUmNYUEFPdkw4ZFdxWlo4TTM2?=
 =?utf-8?B?c1FLL2hjVFJJNXlKeDJXTFBtS3QrbVJlUnNvYXNXQW1COG9TOTB2ZHhUS3BY?=
 =?utf-8?B?NkFObUFtMGVxYmdYa1l1Yi84REFvQmFFSGpxelZrSjNMcDJ4eHI3QnIySkhM?=
 =?utf-8?B?TGxLTnNFM0Rtb2l5VnlmTGpnVWlXc0ZpeDYwb3NKMFRVYmtOOTB3S3AvWG5G?=
 =?utf-8?B?Q0srVFVHRklIc2dLWG1BSkVTWDJ4U0k2ak9ra24yMklNSGtpODI1eFowaXdC?=
 =?utf-8?B?TDB1RDZYWnZJM2xSOE9ma0duMnFCMUcxZjJvSGNSTlBPeTJwampyTjFSMHVq?=
 =?utf-8?B?akQ2QUd2bUowbTV1THZ5WHhvRW84TzNTZG0wd1RLNFZQZ0dFTUlvZ2RYUTZk?=
 =?utf-8?B?dzNGeWNtR0xXSDRRLzB2bU9ycmRoWVQyMVY5dFlUZU5rQ1M1cnRyT0syMXl1?=
 =?utf-8?B?ZW5xL0oxaHVtS2dpenVvTmZrYkFMWUs4blllTlRTME5keXIxQ1N0OG9iRXdD?=
 =?utf-8?B?UzdRNWJzT3E1b1dFcUZicnFCZm9UWGZDdHNUYjRncHBOYktRUW50cVpKd1A2?=
 =?utf-8?B?MEVIbURXWGE3cDlTajlUby9GTGhPN0NTSEU3MmxsRktLOTN0UFhwNGtPb2ds?=
 =?utf-8?B?RjRhNDJYUlJOK3NQR3B0WTJ3VVhJNFZGYXRlVVI1NXFCWWtBM2lLdXpXZnRs?=
 =?utf-8?B?SVh5SFM2UThGM0hZYXVqem1yQkRFdExVMGpUNGlwSmZQOTJFL0RPc21IeTNG?=
 =?utf-8?B?dFlReVU1blRzbi9uQysyKzVXcXRweFNuWUQvU3JnaFlVeW9kN3JKTnJyTjdh?=
 =?utf-8?B?emdNUHFmd0dDRjc1bU5wU2k0Q05tOVUvT1BxQ01DQkVhbEVDbk5rWk9TaWQ4?=
 =?utf-8?B?NzhSZDBYaTV4Yndwalk3YVJTUjROY3YvQmJrcStQMXk1T0NJYmxneTJ6eGRC?=
 =?utf-8?B?c3FsdWpRaEMyUTBuV2JIandnRlJ3TlRQbUV2eURJdlNVUXBNUTIrZm93RmpZ?=
 =?utf-8?B?YUo5Y3JmWTZWbnZRWU44L2VSTzlQNDZrd1haMy9PQ25kOThmd05QRm5pWjUv?=
 =?utf-8?B?RWhDcW9BVTczU2w4SXNhOWVZVnVBQ05QejR2MTZvbjVYQkVlT1o4SmdVcXlt?=
 =?utf-8?B?NWlGYWxwWklnU00yM1FhY0NOTllqTjFIeEQ0UkVORTNMUldYMUMrUG5YeHZx?=
 =?utf-8?B?VUVJcG12OTNMODIxdVlwMjB0NVFmMGhycUdGSGgwKzhnWEcrRWNjS3RuckU5?=
 =?utf-8?B?VlFKdFh0WjluS0t6LzBoREhJNEFrd0lrOUc1ZUhNZUNQQjFIdDVqWTRRbkN1?=
 =?utf-8?B?c1FuY0ZscHRtOTdLWEU2WGsyK3lsTmY0SXplS2ZxenFDTWdOcVVTUFA2WVFu?=
 =?utf-8?B?cXoyWC9QZWg1b2Q5Y2U2dnN2cVo5bUJiNmNrZ1o4Znl1WFJIT3Jvc1I2RWM5?=
 =?utf-8?B?cGVYRGFKYXlDTU9HdVFGSGNnWExISnRhZUYyNzBYK21hWExIaWNXTExHRUVH?=
 =?utf-8?B?QUNaVndGQzJCYU5CL2czbENldk92aGFOaXRmMlJiRGI2aHBWTlo3TDhHcTNy?=
 =?utf-8?B?VWNGMU1jYlB3bll5ZVNlOGpneGpGZGdESTVURXJ4Z0twcUNDV00vbU1GWWJD?=
 =?utf-8?B?cXVVcFZlMTZjZFg4N2R3TG1tbkhUVnFISXJ4VjNaRUdSd2pROEpoZWhpQ2dR?=
 =?utf-8?Q?igj2DXN5BuaVS9tnV5hX8Q/mM?=
Content-ID: <098913535E4F0047979BB15BD290950B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ab0edf-56ec-4e29-1559-08db8bee4e07
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 02:33:03.0508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6ibcIZ6oB60O04RcyHJOxv7QBqkDcGSNCw/rRoCDOlTZTuBZHcy3mvk5j9ZstBVdmiki4eODam7BEArhzdqZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7598
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_81366091.1217133682"
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
Cc: "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_005_81366091.1217133682
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7TW9uLCYjMzI7MjAyMy0wNy0xNyYjMzI7
YXQmIzMyOzE2OjE0JiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwm
IzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjts
aW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7
eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0
aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMyO0lmJiMzMjthJiMzMjtjb250cm9sbGVyJiMz
MjsodXN1YWxseSwmIzMyO2VEUCEpJiMzMjtkb2VzJiMzMjtub3QmIzMyO3N1cHBvcnQmIzMyO2F1
ZGlvLCYjMzI7b3ImIzMyO2F1ZGlvJiMzMjtpcw0KJmd0OyYjMzI7bm90DQomZ3Q7JiMzMjtlbmFi
bGVkJiMzMjtiZWNhdXNlJiMzMjt0aGUmIzMyO2VuZHBvaW50JiMzMjtoYXMmIzMyO25vJiMzMjth
dWRpbyYjMzI7c3VwcG9ydCwmIzMyO2l0JiMzOTtzJiMzMjt1c2VsZXNzJiMzMjt0bw0KJmd0OyYj
MzI7bG9jaw0KJmd0OyYjMzI7YSYjMzI7bXV0ZXgmIzMyO29ubHkmIzMyO3RvJiMzMjt1bmxvY2sm
IzMyO2l0JiMzMjtyaWdodCYjMzI7YWZ0ZXImIzMyO2JlY2F1c2UmIzMyO3RoZXJlJiMzOTtzJiMz
Mjtubw0KJmd0OyYjMzI7LnBsdWdnZWRfY2IoKS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7Q2hlY2sm
IzMyO2lmJiMzMjt0aGUmIzMyO2F1ZGlvJiMzMjtpcyYjMzI7c3VwcG9ydGVkJiMzMjthbmQmIzMy
O2VuYWJsZWQmIzMyO2JlZm9yZSYjMzI7bG9ja2luZyYjMzI7dGhlJiMzMjttdXRleA0KJmd0OyYj
MzI7aW4NCiZndDsmIzMyO210a19kcF91cGRhdGVfcGx1Z2dlZF9zdGF0dXMoKTomIzMyO2lmJiMz
Mjtub3QsJiMzMjt3ZSYjMzI7c2ltcGx5JiMzMjtyZXR1cm4mIzMyO2ltbWVkaWF0ZWx5Lg0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtXaGlsZSYjMzI7YXQmIzMyO2l0LCYjMzI7c2luY2UmIzMyO3RoZSYj
MzI7dXBkYXRlX3BsdWdnZWRfc3RhdHVzX2xvY2smIzMyO211dGV4JiMzMjt3b3VsZCYjMzI7bm90
JiMzMjtiZQ0KJmd0OyYjMzI7dXNlZCYjMzI7aWYmIzMyO3RoZSYjMzI7Y29udHJvbGxlciYjMzI7
ZG9lc24mIzM5O3QmIzMyO3N1cHBvcnQmIzMyO2F1ZGlvJiMzMjthdCYjMzI7YWxsLCYjMzI7aW5p
dGlhbGl6ZSYjMzI7aXQNCiZndDsmIzMyO29ubHkmIzMyO2lmJiMzMjsmIzk2O2F1ZGlvX3N1cHBv
cnRlZCYjOTY7JiMzMjtpcyYjMzI7dHJ1ZS4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUm
IzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2ln
bmVkLW9mZi1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZs
dDsNCiZndDsmIzMyO2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsN
CiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwLmMmIzMyO3wmIzMyOzcmIzMyOysrKysrLS0NCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYj
MzI7Y2hhbmdlZCwmIzMyOzUmIzMyO2luc2VydGlvbnMoKyksJiMzMjsyJiMzMjtkZWxldGlvbnMo
LSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcC5jDQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHAuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzgzZTU1ZjhkYzg0YS4uYzFkMWE4ODJmMWRi
JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwLmMNCiZndDsmIzMyO0BAJiMzMjstMTk0OCw2JiMzMjsrMTk0OCw5JiMzMjtAQCYjMzI7c3Rh
dGljJiMzMjtpbnQmIzMyO210a19kcF9kdF9wYXJzZShzdHJ1Y3QmIzMyO210a19kcA0KJmd0OyYj
MzI7Km10a19kcCwNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3N0YXRpYyYjMzI7dm9p
ZCYjMzI7bXRrX2RwX3VwZGF0ZV9wbHVnZ2VkX3N0YXR1cyhzdHJ1Y3QmIzMyO210a19kcCYjMzI7
Km10a19kcCkNCiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7K2lmJiMzMjsoIW10a19kcC0mZ3Q7
ZGF0YS0mZ3Q7YXVkaW9fc3VwcG9ydGVkJiMzMjt8fCYjMzI7IW10a19kcC0mZ3Q7YXVkaW9fZW5h
YmxlKQ0KJmd0OyYjMzI7K3JldHVybjsNCiZndDsmIzMyOysNCiZndDsmIzMyOyYjMzI7bXV0ZXhf
bG9jaygmYW1wO210a19kcC0mZ3Q7dXBkYXRlX3BsdWdnZWRfc3RhdHVzX2xvY2spOw0KJmd0OyYj
MzI7JiMzMjtpZiYjMzI7KG10a19kcC0mZ3Q7cGx1Z2dlZF9jYiYjMzI7JmFtcDsmYW1wOyYjMzI7
bXRrX2RwLSZndDtjb2RlY19kZXYpDQomZ3Q7JiMzMjsmIzMyO210a19kcC0mZ3Q7cGx1Z2dlZF9j
YihtdGtfZHAtJmd0O2NvZGVjX2RldiwNCiZndDsmIzMyO0BAJiMzMjstMjUyMCwxMSYjMzI7KzI1
MjMsMTEmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2ludCYjMzI7bXRrX2RwX3Byb2JlKHN0cnVjdA0K
Jmd0OyYjMzI7cGxhdGZvcm1fZGV2aWNlJiMzMjsqcGRldikNCiZndDsmIzMyOyYjMzI7cmV0dXJu
JiMzMjtkZXZfZXJyX3Byb2JlKGRldiwmIzMyO3JldCwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyZxdW90O2ZhaWxlZCYjMzI7dG8mIzMyO3JlcXVlc3QmIzMyO21lZGlh
dGVrJiMzMjtkcHR4DQomZ3Q7JiMzMjtpcnEmIzkyO24mcXVvdDspOw0KJmd0OyYjMzI7JiMzMjsN
CiZndDsmIzMyOy1tdXRleF9pbml0KCZhbXA7bXRrX2RwLSZndDt1cGRhdGVfcGx1Z2dlZF9zdGF0
dXNfbG9jayk7DQomZ3Q7JiMzMjstDQomZ3Q7JiMzMjsmIzMyO3BsYXRmb3JtX3NldF9kcnZkYXRh
KHBkZXYsJiMzMjttdGtfZHApOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7aWYmIzMy
OyhtdGtfZHAtJmd0O2RhdGEtJmd0O2F1ZGlvX3N1cHBvcnRlZCkmIzMyO3sNCiZndDsmIzMyOytt
dXRleF9pbml0KCZhbXA7bXRrX2RwLSZndDt1cGRhdGVfcGx1Z2dlZF9zdGF0dXNfbG9jayk7DQom
Z3Q7JiMzMjsrDQomZ3Q7JiMzMjsmIzMyO3JldCYjMzI7PSYjMzI7bXRrX2RwX3JlZ2lzdGVyX2F1
ZGlvX2RyaXZlcihkZXYpOw0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KHJldCkmIzMyO3sNCiZndDsm
IzMyOyYjMzI7ZGV2X2VycihkZXYsJiMzMjsmcXVvdDtGYWlsZWQmIzMyO3RvJiMzMjtyZWdpc3Rl
ciYjMzI7YXVkaW8mIzMyO2RyaXZlcjoNCiZndDsmIzMyOyVkJiM5MjtuJnF1b3Q7LA0KJmd0OyYj
MzI7LS0mIzMyOw0KJmd0OyYjMzI7Mi40MC4xDQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0t
ey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoq
KioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1t
YWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVu
dGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20g
ZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0K
Y29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRp
c3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlp
bmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRl
bmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5s
YXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFp
bCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJy
b3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0
byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFp
bCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5v
dA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNv
bi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_005_81366091.1217133682
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDIzLTA3LTE3IGF0IDE2OjE0ICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxl
YXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBo
YXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBJZiBhIGNvbnRyb2xs
ZXIgKHVzdWFsbHksIGVEUCEpIGRvZXMgbm90IHN1cHBvcnQgYXVkaW8sIG9yIGF1ZGlvIGlzDQo+
IG5vdA0KPiBlbmFibGVkIGJlY2F1c2UgdGhlIGVuZHBvaW50IGhhcyBubyBhdWRpbyBzdXBwb3J0
LCBpdCdzIHVzZWxlc3MgdG8NCj4gbG9jaw0KPiBhIG11dGV4IG9ubHkgdG8gdW5sb2NrIGl0IHJp
Z2h0IGFmdGVyIGJlY2F1c2UgdGhlcmUncyBubw0KPiAucGx1Z2dlZF9jYigpLg0KPiANCj4gQ2hl
Y2sgaWYgdGhlIGF1ZGlvIGlzIHN1cHBvcnRlZCBhbmQgZW5hYmxlZCBiZWZvcmUgbG9ja2luZyB0
aGUgbXV0ZXgNCj4gaW4NCj4gbXRrX2RwX3VwZGF0ZV9wbHVnZ2VkX3N0YXR1cygpOiBpZiBub3Qs
IHdlIHNpbXBseSByZXR1cm4gaW1tZWRpYXRlbHkuDQo+IA0KPiBXaGlsZSBhdCBpdCwgc2luY2Ug
dGhlIHVwZGF0ZV9wbHVnZ2VkX3N0YXR1c19sb2NrIG11dGV4IHdvdWxkIG5vdCBiZQ0KPiB1c2Vk
IGlmIHRoZSBjb250cm9sbGVyIGRvZXNuJ3Qgc3VwcG9ydCBhdWRpbyBhdCBhbGwsIGluaXRpYWxp
emUgaXQNCj4gb25seSBpZiBgYXVkaW9fc3VwcG9ydGVkYCBpcyB0cnVlLg0KDQpSZXZpZXdlZC1i
eTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5n
ZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNv
bGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5j
IHwgNyArKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHAuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiBpbmRleCA4M2U1
NWY4ZGM4NGEuLmMxZDFhODgyZjFkYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAu
Yw0KPiBAQCAtMTk0OCw2ICsxOTQ4LDkgQEAgc3RhdGljIGludCBtdGtfZHBfZHRfcGFyc2Uoc3Ry
dWN0IG10a19kcA0KPiAqbXRrX2RwLA0KPiAgDQo+ICBzdGF0aWMgdm9pZCBtdGtfZHBfdXBkYXRl
X3BsdWdnZWRfc3RhdHVzKHN0cnVjdCBtdGtfZHAgKm10a19kcCkNCj4gIHsNCj4gKwlpZiAoIW10
a19kcC0+ZGF0YS0+YXVkaW9fc3VwcG9ydGVkIHx8ICFtdGtfZHAtPmF1ZGlvX2VuYWJsZSkNCj4g
KwkJcmV0dXJuOw0KPiArDQo+ICAJbXV0ZXhfbG9jaygmbXRrX2RwLT51cGRhdGVfcGx1Z2dlZF9z
dGF0dXNfbG9jayk7DQo+ICAJaWYgKG10a19kcC0+cGx1Z2dlZF9jYiAmJiBtdGtfZHAtPmNvZGVj
X2RldikNCj4gIAkJbXRrX2RwLT5wbHVnZ2VkX2NiKG10a19kcC0+Y29kZWNfZGV2LA0KPiBAQCAt
MjUyMCwxMSArMjUyMywxMSBAQCBzdGF0aWMgaW50IG10a19kcF9wcm9iZShzdHJ1Y3QNCj4gcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwN
Cj4gIAkJCQkgICAgICJmYWlsZWQgdG8gcmVxdWVzdCBtZWRpYXRlayBkcHR4DQo+IGlycVxuIik7
DQo+ICANCj4gLQltdXRleF9pbml0KCZtdGtfZHAtPnVwZGF0ZV9wbHVnZ2VkX3N0YXR1c19sb2Nr
KTsNCj4gLQ0KPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIG10a19kcCk7DQo+ICANCj4g
IAlpZiAobXRrX2RwLT5kYXRhLT5hdWRpb19zdXBwb3J0ZWQpIHsNCj4gKwkJbXV0ZXhfaW5pdCgm
bXRrX2RwLT51cGRhdGVfcGx1Z2dlZF9zdGF0dXNfbG9jayk7DQo+ICsNCj4gIAkJcmV0ID0gbXRr
X2RwX3JlZ2lzdGVyX2F1ZGlvX2RyaXZlcihkZXYpOw0KPiAgCQlpZiAocmV0KSB7DQo+ICAJCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byByZWdpc3RlciBhdWRpbyBkcml2ZXI6DQo+ICVkXG4iLA0K
PiAtLSANCj4gMi40MC4xDQo=

--__=_Part_Boundary_005_81366091.1217133682--


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B31BD7BB3A0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 10:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E8E10E099;
	Fri,  6 Oct 2023 08:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7990210E099
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 08:58:23 +0000 (UTC)
X-UUID: 7d80019a642611ee8051498923ad61e6-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=qwSl0ajg1s6HtzCLPoycKtAaPJO+E8Xvw4d+d/sbxqw=; 
 b=OT1e1S2WWZDAdIMKksqqCJPybG9GI92/iB0Is5obvb2d1yU1aX19O2arfnXgMBI0P44MCg7MmwwijgqLLTJZWps8npbAK6rWg2SgRdv5z+OsP3kO5ooTxKo430dAtyrcrrQfO8ytnuTi1cCfgTAyEiq+TxK9MeoO2OVQiE6utPk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:6307efbe-9f80-4cac-9322-f887f160d9e0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:f397c114-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7d80019a642611ee8051498923ad61e6-20231006
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 419961155; Fri, 06 Oct 2023 16:58:17 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 16:58:13 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 16:58:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dr8vY0EG8oGMo2Objmk1/9XFB2e3Yj4T7ixVmLWgohZtxhCXNb1s1IhddcVJ3eRfb8terEIMf28gLYd2NNDZf5SBXWsfknEdnOuyIiSB+4Zz/rF6ewtaVNlNwp9tWUwOq6A2ubnbTuUqLrBA08Z0Dy4veVUmjmiFxje5itzR+SD7l6IrwpDhFvVk840L9NvdJjHGnH+Fvi5lebjl1McaCdcqiTSYPwCjCqZqFFBzOcmuD7WDhI7KalESzTx10xM+zHegDTGphMaWqhTGGR0zozE2TnnR+mHIR1Wt7llppPzsmVyOLnzCZzXhjbNGXhtUwMq4S59V28XNU38HA3X+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4jLi1TvBokXt5subGJZHNKJP+x5vYOA4hjVKQW2R2c=;
 b=jDRBbs9N8cHWD2+g80mBq7P7+kbD8RBMgwNSnuOtqIF/bK4UnSxmXTbnpmMzsf/GOG13IV3IBDf0h8rO2y5pDAQy9QM8WIChpJLVvkIAbkXfOmoO0sZu5zqFA8H9SuOzXLTRibytrF/Evp9m5clrd6FjMUQ6AwAE4LwvvkzLIto9s1DhW/J4eU04oPt53trIzYq/wqkerZ2lgKRVtG8h4vC8tKCVrN6VlOnjJ44ryXw3WZ5X8GNeGDi+4QIG0T1h5dsm6oHLdjIF0vVZQxOY4vjjgVhbIsE39beQdhN60xeQ8F+f1LcXYwEUscjnm2k+Ea5RH3YSy22wv+jsh5MnNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4jLi1TvBokXt5subGJZHNKJP+x5vYOA4hjVKQW2R2c=;
 b=WZ8sMw2tqFsmPlu1pTEidsIhQx3Nh6tyR9IKuKaPtLT4KwF2VjQmVyohgv8lP502xCLLpN/FYNgvTmSE2vs8qsiPi08vUoidVKCUkjpZ2FXAg2HiCDMiKkA5BZU6lVuSD4vqZH5IARBsk71saS9oVzoBS7kvushYNO7SgkTdPyc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7360.apcprd03.prod.outlook.com (2603:1096:101:142::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 08:58:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%7]) with mapi id 15.20.6792.026; Fri, 6 Oct 2023
 08:58:09 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v7 16/23] drm/mediatek: Start/Stop components with
 function pointers
Thread-Topic: [PATCH v7 16/23] drm/mediatek: Start/Stop components with
 function pointers
Thread-Index: AQHZ+CgsyHl/HEbmX0W4RuCq0SaqB7A8diMA
Date: Fri, 6 Oct 2023 08:58:09 +0000
Message-ID: <5772a34df56a8270b86a32143d890056b3ee33ba.camel@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
 <20231006073831.10402-17-shawn.sung@mediatek.com>
In-Reply-To: <20231006073831.10402-17-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7360:EE_
x-ms-office365-filtering-correlation-id: f4dd3d95-f60e-47de-654d-08dbc64a5d0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZGPC9g5EOSooytabOdgP1LIqg7gRkRvZESSfnRRufwSWaaSPVP0vbT6TlaalgjgOOb1I+GY3I+V6IWCR+k8n2XIYps2oe5vkAUnhxK0PpvEUvkXxWqoQxmvZ8cdpFybIiH1HrvxHrRrkuefBMdGRtSJV68Lcz6cXaGSK3aglZUIdRo6ntPuGUYU0TBlZ8HwTCiwCNrdS5VmVZ5q0xB24lYXSvw7E5BwYAaIFC3bBVQQ6MGDoswCjDa0/obYQ81f8onsINfgAIUbOjHtbyqHJqsghuT1W4GaFq801J/y+FBu1xNYbxqzoUoTiva9ooE/w9sN/nQzYOH4SPVCTfOe5K8FIzO5QGBkvFvxKk0+U6+OVu7ctMt8oH6DTdqIigzH7sguQ1U1YYIAu9r/SCR5xv3RPNjVtoH9/yuP+xsnHReIni+19+CJzZYHQKl/1htUDwli0Am3MQVCU8ksCZzIN2QEUTpRgGIICt7OLFtZbtgVymkCXzVyGdoSMWcph0MJWDtuBYrapBagLvkN3io92GkolPVZWeHYSDLkom1SchYyKIlBQirCfawSEXztRMJcMyg8JX8IBMAWqjRm8pigSCePSPhdwjxl4EUzfWLVfebVMk608jk6/J1UP+3TFC/cdabbui2ht7kFnU7FKWeq+7PBTdHyKkCCnqzVcYaLKXfQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(39860400002)(396003)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(66946007)(66446008)(54906003)(66476007)(66556008)(76116006)(316002)(41300700001)(64756008)(6512007)(2616005)(26005)(71200400001)(85182001)(36756003)(6506007)(83380400001)(478600001)(122000001)(38070700005)(38100700002)(86362001)(6486002)(110136005)(7416002)(2906002)(8936002)(8676002)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDNqeVAwZEZZV1RTWEQ3U0pZNDc5Tlp3U2VxZ2hUZXE2Mkp3aGhSNG9PV0Vj?=
 =?utf-8?B?OGdhUTRDQ0VYRVRBdnNldVNnSXNhcWU4RFlRUTlPdHVZV0NqamEwc09wbkto?=
 =?utf-8?B?dzBnbks1Z3BFQ3ZwSC9nSWxFMlRhTGVrbUxscUQ0N3Jqb3NSYldJQmtwWHk1?=
 =?utf-8?B?ZitJUlZtdUI5cmxPTzNSZ3NmU3ZOdGhxUVI1czk2YVYxZnk5cUFURm9NM3Nn?=
 =?utf-8?B?d1ZUUDcrSkZleVQxYmVxcXdVY3lUT0xOb2ZnNEhSR01YWDI0eGs2bG1OSTB1?=
 =?utf-8?B?K1J1TDdFM2VtR1NGU09CT3oveWhpdEN4UDZ1YnM0dVMwSlFSeGlEZ0dRSk9i?=
 =?utf-8?B?ZjlvWkZmU1kvam1IMnJoakh6c1JzS1hlVitMeU5GTnRxbUM4VlZ6eldrbGlF?=
 =?utf-8?B?dW1NZnFsb0NFWnowUi9sanVXNENvWVE0Nm1yTWExQkZOc1JzbEJPQ3JXcnI4?=
 =?utf-8?B?T0pQVnZONDBrR2hWcjhpZXNjZjU5ZmJIa2NNSG9HVWRGTERDdXFBZnFJeGtn?=
 =?utf-8?B?S05RRGI0MjVTUFdramY2UWpNbUVmS1lxUHpJUWVpOExOd3pPT3pyc3J5T3g2?=
 =?utf-8?B?ZHFXSlBRcXAzQW9VeStpRjh5bmlxUCszblZvcjR6UDFCcmZDSGc5blVDMFFR?=
 =?utf-8?B?Tm1VbHZwU29LN0pWTVVmNlNJVDhPeHU3eEIxYnZoZUVRbEhMd1I5OTZ5ZEVj?=
 =?utf-8?B?cjQvb21uUXprUmtZR2RGWTdXSkw1bGlIdEFOZkhaamZHTkh0VWZhRXNXZU1p?=
 =?utf-8?B?UFNqaDViVlpCdDY0ZzhyMHVxeFdMSXdDY2p4NVpvY0VlckpBdEZPK2UrQjE0?=
 =?utf-8?B?TDBad09QQ3JrMUtjNlc4dktTelFFTWVDS1VBNWJ0MG11QWVyaW5GYldpbzY5?=
 =?utf-8?B?OGlmVEsvYTZ3dWZzS01EWmlMZTl5cnB5YkI2anEzMVgvOElIbG1CdnJNR1dp?=
 =?utf-8?B?aHhESmZHWjQ0RkdlNXF4UE1vTk1FWWp2ZGdlZ0ZxV2FZT1A5K0l0amFWN0JN?=
 =?utf-8?B?ejJBREZlRzRJNTN4bVF1Q0hFekFWV0hNakJPblB6K2FzZVFIMGtIcW5TM1Iy?=
 =?utf-8?B?eDIzcUxCWlJFYkJMdmx4c3JjM25ZenRQbDZoV2dNZDZxb2dic0p6VTNGRHNP?=
 =?utf-8?B?S0FNZmpKQnpzdDRUaTdLTnlVNGhOeVdyZXdETlhjZ2Z5N2VVQnhTdDJkbytY?=
 =?utf-8?B?K0d1VGQ3eTNIMXpwaEVxdFhFYmRUNHlETDlPQ1RTb2FxclR2U0J5aTAvbDly?=
 =?utf-8?B?RTk2alBPY3Y4c3pKTUFKbld2bDcxZy8vd3NweGdBTW4wVWxHZU1pRk1PNGpi?=
 =?utf-8?B?cU9wWkVHTDgyRWV1ak0yVUkzS1ptUFJ6bFVqZFVpS0tjM2N2Tk56TTBaclE4?=
 =?utf-8?B?VW9zOWYyY1JlTUdka2hBSnJ1eTM1SlgwbkJPN2I4U3lQbHA5UzdtZkRoNXV2?=
 =?utf-8?B?UWJoOWVMb3ozWFZiQ0FKWWVxUTZkTDFBZEdNYjJhbVNUVUtkaTFyMFRkMVpX?=
 =?utf-8?B?Q0hKcG5lZ3dXcklkdEJ5Ky82R1RJUWxRTWNvRFVzdUVxd2lvM3AzdzNxSzZP?=
 =?utf-8?B?bDZJd0FPcWoxd1pmTFI1VXF2TVpVeERXSXExK0VEd0FVRmd0RUgzZUtnSEo0?=
 =?utf-8?B?WHRneGNkMDZDTFVOV2FRUFMwb1MyODNmYk9pRDlSL1U2QmdxM0dNM1dwdlVx?=
 =?utf-8?B?dnM2bVVXaVVtNnc1OVZzbHdDZElBd29ZMmdnb0o5T3V0UWhYRlMvLy9PWUQr?=
 =?utf-8?B?R0JKQy9ORnBnN3hrcEFNaHN2RU0yd2NlaDA4bU9kK1AzN0lIV3Q5VVhvQlI3?=
 =?utf-8?B?TE9uUTRRVHlGYXBnUkJXVkxVS2puaElUUDNUY1JMUU5IQ2JTdGI4c0psUmZL?=
 =?utf-8?B?aE9rK2tTNGVFR1AzdVRqdWdyaVJoVEY5alNuZ0N4Sy9jeStOTzgxdWlVQXp3?=
 =?utf-8?B?UUZEMnBJeUlSZXYwK0p5c3lCNnliNWt2YUR4OXZzVmRzb09DU0V4eHRLenBN?=
 =?utf-8?B?TDU5cHBhVFhHdDdoSnR1SHBsRFU4bTdYRFlnUWRuYmpHU1VISDdURUZSbEh2?=
 =?utf-8?B?aDI5ajk1UmpLc1NaYU1lNzBrUm04QzN4c3dIaEZrRWJOdnN4VkhqeHBsWnBT?=
 =?utf-8?Q?pxbiLm4ZdpiFuRBw+Ezz1l6yq?=
Content-ID: <056879D8AA00E44799767E5880D72912@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4dd3d95-f60e-47de-654d-08dbc64a5d0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 08:58:09.3418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: menzpMBYCTJ8SO3KPXr58f1cMaALC/AY0W35lEwCba+G70M6nEiByHbSru08/HXjis74BzIiVHcJZqGkzuEBTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7360
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.471600-8.000000
X-TMASE-MatchedRID: 7ySqCuYCpfg/XHdICuW5rya1MaKuob8PC/ExpXrHizyK1QpOXZsW6kSh
 /y19PSKrt6QHGjMsZdzd7PI9QvI9hcOYR/M8CPo64pdq9sdj8LWuiRuR9mCaug6QlBHhBZuwxEs
 GD8geUL1Mmm8bxtFZ3WRwYgGpn9zIr78SC5iivxzSBVVc2BozSlkMvWAuahr8+gD2vYtOFhgqtq
 5d3cxkNbCgyM+buGWas2WOiCUysLy2Ht2ge7FBVVsRYa+DeimLHlNHrXtDiMNm8EE5p8jggeUD6
 0NtGloK3GK5BNtV+/DshLNm/CsG9+eSONaHzs5YPVxlUTP3GoO7AlsRb/Q7WQoYlPnP/8T/FltY
 lf3C/iNDDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.471600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F8E8C3E8419101300182E5185B5420F27700FB6D1281B22B64F48D7F8628D9102000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_792202163.1758627977"
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
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_004_792202163.1758627977
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SHNpYW8tY2hpZW46DQoNCk9uJiMzMjtGcmksJiMzMjsyMDIzLTEwLTA2
JiMzMjthdCYjMzI7MTU6MzgmIzMyOyswODAwLCYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjt3cm90ZToNCiZndDsmIzMyO0J5JiMzMjtyZWdpc3RlcmluZyYjMzI7Y29tcG9uZW50JiMz
MjtyZWxhdGVkJiMzMjtmdW5jdGlvbnMmIzMyO3RvJiMzMjt0aGUmIzMyO3BvaW50ZXJzLA0KJmd0
OyYjMzI7d2UmIzMyO2NhbiYjMzI7ZWFzaWx5JiMzMjttYW5hZ2UmIzMyO3RoZW0mIzMyO3dpdGhp
biYjMzI7YSYjMzI7Zm9yLWxvb3AmIzMyO2FuZCYjMzI7c2ltcGxpZnkmIzMyO3RoZQ0KJmd0OyYj
MzI7bG9naWMmIzMyO29mJiMzMjtjb21wb25lbnQmIzMyO3N0YXJ0L3N0b3AmIzMyO3Byb2Nlc3Mu
DQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29t
Jmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtIc2lhbyYjMzI7
Q2hpZW4mIzMyO1N1bmcmIzMyOyZsdDtzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsm
IzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjsuLi4vZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxf
YWRhcHRvci5jJiMzMjsmIzMyOyYjMzI7fCYjMzI7MjANCiZndDsmIzMyOysrKysrKysrKysrKysr
KysrLS0NCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzE4JiMzMjtp
bnNlcnRpb25zKCspLCYjMzI7MiYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMy
O2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9v
dmxfYWRhcHRvci5jDQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9vdmxfYWRhcHRvci5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7ODQxMzMzMDNhNmVjLi44MTJhMWRm
OTczMmYmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMNCiZndDsmIzMyO0BAJiMzMjst
NzIsNiYjMzI7KzcyLDgmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtjaGFyJiMzMjsq
JiMzMjtjb25zdA0KJmd0OyYjMzI7cHJpdmF0ZV9jb21wX3N0ZW1bT1ZMX0FEQVBUT1JfVFlQRV9O
VU1dJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVj
dCYjMzI7bXRrX2RkcF9jb21wX2Z1bmNzJiMzMjtfZXRoZHImIzMyOz0mIzMyO3sNCiZndDsmIzMy
OyYjMzI7LmNsa19lbmFibGUmIzMyOz0mIzMyO210a19ldGhkcl9jbGtfZW5hYmxlLA0KJmd0OyYj
MzI7JiMzMjsuY2xrX2Rpc2FibGUmIzMyOz0mIzMyO210a19ldGhkcl9jbGtfZGlzYWJsZSwNCiZn
dDsmIzMyOysuc3RhcnQmIzMyOz0mIzMyO210a19ldGhkcl9zdGFydCwNCiZndDsmIzMyOysuc3Rv
cCYjMzI7PSYjMzI7bXRrX2V0aGRyX3N0b3AsDQomZ3Q7JiMzMjsmIzMyO307DQomZ3Q7JiMzMjsm
IzMyOw0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO210a19k
ZHBfY29tcF9mdW5jcyYjMzI7X21lcmdlJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjtAQCYjMzI7LTE4
OSwxNiYjMzI7KzE5MSwzMCYjMzI7QEAmIzMyO3ZvaWQmIzMyO210a19vdmxfYWRhcHRvcl9jb25m
aWcoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsDQomZ3Q7JiMzMjt1bnNpZ25lZCYjMzI7aW50
JiMzMjt3LA0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7dm9pZCYjMzI7bXRrX292bF9h
ZGFwdG9yX3N0YXJ0KHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2KQ0KJmd0OyYjMzI7JiMzMjt7
DQomZ3Q7JiMzMjsraW50JiMzMjtpOw0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO210a19kaXNw
X292bF9hZGFwdG9yJiMzMjsqb3ZsX2FkYXB0b3ImIzMyOz0NCiZndDsmIzMyO2Rldl9nZXRfZHJ2
ZGF0YShkZXYpOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOy1tdGtfZXRoZHJfc3RhcnQob3Zs
X2FkYXB0b3ItDQomZ3Q7JiMzMjsmZ3Q7b3ZsX2FkYXB0b3JfY29tcFtPVkxfQURBUFRPUl9FVEhE
UjBdKTsNCiZndDsmIzMyOytmb3ImIzMyOyhpJiMzMjs9JiMzMjswOyYjMzI7aSYjMzI7Jmx0OyYj
MzI7T1ZMX0FEQVBUT1JfSURfTUFYOyYjMzI7aSsrKSYjMzI7ew0KJmd0OyYjMzI7K2lmJiMzMjso
IW92bF9hZGFwdG9yLSZndDtvdmxfYWRhcHRvcl9jb21wW2ldJiMzMjt8fA0KJmd0OyYjMzI7KyYj
MzI7JiMzMjsmIzMyOyYjMzI7IWNvbXBfbWF0Y2hlc1tpXS5mdW5jcy0mZ3Q7c3RhcnQpDQomZ3Q7
JiMzMjsrY29udGludWU7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrY29tcF9tYXRjaGVzW2ldLmZ1
bmNzLSZndDtzdGFydChvdmxfYWRhcHRvci0NCiZndDsmIzMyOyZndDtvdmxfYWRhcHRvcl9jb21w
W2ldKTsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyYjMzI7DQomZ3Q7
JiMzMjsmIzMyO3ZvaWQmIzMyO210a19vdmxfYWRhcHRvcl9zdG9wKHN0cnVjdCYjMzI7ZGV2aWNl
JiMzMjsqZGV2KQ0KJmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsraW50JiMzMjtpOw0KJmd0OyYj
MzI7JiMzMjtzdHJ1Y3QmIzMyO210a19kaXNwX292bF9hZGFwdG9yJiMzMjsqb3ZsX2FkYXB0b3Im
IzMyOz0NCiZndDsmIzMyO2Rldl9nZXRfZHJ2ZGF0YShkZXYpOw0KJmd0OyYjMzI7JiMzMjsNCiZn
dDsmIzMyOy1tdGtfZXRoZHJfc3RvcChvdmxfYWRhcHRvci0NCiZndDsmIzMyOyZndDtvdmxfYWRh
cHRvcl9jb21wW09WTF9BREFQVE9SX0VUSERSMF0pOw0KJmd0OyYjMzI7K2ZvciYjMzI7KGkmIzMy
Oz0mIzMyOzA7JiMzMjtpJiMzMjsmbHQ7JiMzMjtPVkxfQURBUFRPUl9JRF9NQVg7JiMzMjtpKysp
JiMzMjt7DQomZ3Q7JiMzMjsraWYmIzMyOyghb3ZsX2FkYXB0b3ItJmd0O292bF9hZGFwdG9yX2Nv
bXBbaV0mIzMyO3x8DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjshY29tcF9tYXRjaGVz
W2ldLmZ1bmNzLSZndDtzdG9wKQ0KJmd0OyYjMzI7K2NvbnRpbnVlOw0KJmd0OyYjMzI7Kw0KJmd0
OyYjMzI7K2NvbXBfbWF0Y2hlc1tpXS5mdW5jcy0mZ3Q7c3RvcChvdmxfYWRhcHRvci0NCiZndDsm
IzMyOyZndDtvdmxfYWRhcHRvcl9jb21wW2ldKTsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsmIzMy
O30NCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO2ludCYjMzI7bXRrX292bF9hZGFwdG9y
X2Nsa19lbmFibGUoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYpDQoNCjwvcHJlPjwhLS10eXBl
OnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxp
dHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5
IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0K
ZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVu
ZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocyku
IEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWlu
aW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50
cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQg
bWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBv
ZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBl
LW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChi
eSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2Yg
DQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3Rl
bSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55
IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_004_792202163.1758627977
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEhzaWFvLWNoaWVuOg0KDQpPbiBGcmksIDIwMjMtMTAtMDYgYXQgMTU6MzggKzA4MDAsIEhz
aWFvIENoaWVuIFN1bmcgd3JvdGU6DQo+IEJ5IHJlZ2lzdGVyaW5nIGNvbXBvbmVudCByZWxhdGVk
IGZ1bmN0aW9ucyB0byB0aGUgcG9pbnRlcnMsDQo+IHdlIGNhbiBlYXNpbHkgbWFuYWdlIHRoZW0g
d2l0aGluIGEgZm9yLWxvb3AgYW5kIHNpbXBsaWZ5IHRoZQ0KPiBsb2dpYyBvZiBjb21wb25lbnQg
c3RhcnQvc3RvcCBwcm9jZXNzLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVr
LmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3Vu
Z0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgLi4uL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
b3ZsX2FkYXB0b3IuYyAgIHwgMjANCj4gKysrKysrKysrKysrKysrKystLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0b3IuYw0KPiBpbmRleCA4
NDEzMzMwM2E2ZWMuLjgxMmExZGY5NzMyZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMNCj4gQEAgLTcyLDYgKzcyLDggQEAgc3Rh
dGljIGNvbnN0IGNoYXIgKiBjb25zdA0KPiBwcml2YXRlX2NvbXBfc3RlbVtPVkxfQURBUFRPUl9U
WVBFX05VTV0gPSB7DQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyBf
ZXRoZHIgPSB7DQo+ICAJLmNsa19lbmFibGUgPSBtdGtfZXRoZHJfY2xrX2VuYWJsZSwNCj4gIAku
Y2xrX2Rpc2FibGUgPSBtdGtfZXRoZHJfY2xrX2Rpc2FibGUsDQo+ICsJLnN0YXJ0ID0gbXRrX2V0
aGRyX3N0YXJ0LA0KPiArCS5zdG9wID0gbXRrX2V0aGRyX3N0b3AsDQo+ICB9Ow0KPiAgDQo+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyBfbWVyZ2UgPSB7DQo+IEBAIC0x
ODksMTYgKzE5MSwzMCBAQCB2b2lkIG10a19vdmxfYWRhcHRvcl9jb25maWcoc3RydWN0IGRldmlj
ZSAqZGV2LA0KPiB1bnNpZ25lZCBpbnQgdywNCj4gIA0KPiAgdm9pZCBtdGtfb3ZsX2FkYXB0b3Jf
c3RhcnQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgew0KPiArCWludCBpOw0KPiAgCXN0cnVjdCBt
dGtfZGlzcF9vdmxfYWRhcHRvciAqb3ZsX2FkYXB0b3IgPQ0KPiBkZXZfZ2V0X2RydmRhdGEoZGV2
KTsNCj4gIA0KPiAtCW10a19ldGhkcl9zdGFydChvdmxfYWRhcHRvci0NCj4gPm92bF9hZGFwdG9y
X2NvbXBbT1ZMX0FEQVBUT1JfRVRIRFIwXSk7DQo+ICsJZm9yIChpID0gMDsgaSA8IE9WTF9BREFQ
VE9SX0lEX01BWDsgaSsrKSB7DQo+ICsJCWlmICghb3ZsX2FkYXB0b3ItPm92bF9hZGFwdG9yX2Nv
bXBbaV0gfHwNCj4gKwkJICAgICFjb21wX21hdGNoZXNbaV0uZnVuY3MtPnN0YXJ0KQ0KPiArCQkJ
Y29udGludWU7DQo+ICsNCj4gKwkJY29tcF9tYXRjaGVzW2ldLmZ1bmNzLT5zdGFydChvdmxfYWRh
cHRvci0NCj4gPm92bF9hZGFwdG9yX2NvbXBbaV0pOw0KPiArCX0NCj4gIH0NCj4gIA0KPiAgdm9p
ZCBtdGtfb3ZsX2FkYXB0b3Jfc3RvcChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICB7DQo+ICsJaW50
IGk7DQo+ICAJc3RydWN0IG10a19kaXNwX292bF9hZGFwdG9yICpvdmxfYWRhcHRvciA9DQo+IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiAgDQo+IC0JbXRrX2V0aGRyX3N0b3Aob3ZsX2FkYXB0b3It
DQo+ID5vdmxfYWRhcHRvcl9jb21wW09WTF9BREFQVE9SX0VUSERSMF0pOw0KPiArCWZvciAoaSA9
IDA7IGkgPCBPVkxfQURBUFRPUl9JRF9NQVg7IGkrKykgew0KPiArCQlpZiAoIW92bF9hZGFwdG9y
LT5vdmxfYWRhcHRvcl9jb21wW2ldIHx8DQo+ICsJCSAgICAhY29tcF9tYXRjaGVzW2ldLmZ1bmNz
LT5zdG9wKQ0KPiArCQkJY29udGludWU7DQo+ICsNCj4gKwkJY29tcF9tYXRjaGVzW2ldLmZ1bmNz
LT5zdG9wKG92bF9hZGFwdG9yLQ0KPiA+b3ZsX2FkYXB0b3JfY29tcFtpXSk7DQo+ICsJfQ0KPiAg
fQ0KPiAgDQo+ICBpbnQgbXRrX292bF9hZGFwdG9yX2Nsa19lbmFibGUoc3RydWN0IGRldmljZSAq
ZGV2KQ0K

--__=_Part_Boundary_004_792202163.1758627977--


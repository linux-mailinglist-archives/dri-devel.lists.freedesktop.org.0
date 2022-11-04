Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C15619386
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 10:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C76810E710;
	Fri,  4 Nov 2022 09:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3361E10E710
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 09:30:18 +0000 (UTC)
X-UUID: 1437655087dd4a7bb0c37852c02d2085-20221104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=r1Otmg/18wrVBWUt+BBzhT1N1MxnqoRha1M4ZFtzjiM=; 
 b=a8CPFm3vv2YAMMsaSzSqDqMImYXzEQdB524/P+s7qbS2bG5oRmGmO0/35Xny384WIc5ybxC2JqZApE+4fh6l5P2aHiTDbcV44md1Tsh4ioYA8l2ASJZfFkVEjmKaCVSb2v38hc1tcp3xvtbayAXIXtkhxxDS/x6dM4SRf8f2rr4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:5ddd34f1-23bd-4ac8-b504-45a8ed5f1e96, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:62cd327, CLOUDID:f11f72eb-84ac-4628-a416-bc50d5503da6,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1437655087dd4a7bb0c37852c02d2085-20221104
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1096290544; Fri, 04 Nov 2022 17:30:01 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 4 Nov 2022 17:30:01 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Fri, 4 Nov 2022 17:30:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6tRwE/kRxfN6r2HIhKgY+dB0+0dN+zHv5TJx6NjQVEHRWFX4qxxs/j5R7cJv8gB2kT+GqAq6+GraQIoB0082UFH5MTKAb3788pmjEcc6p9bxZB3zsFqdTd/70jP3O0JXX8n8RDhtvQ4XftCyrfsgLEioW0ZEFKri87fVQx70zZ1WkJCJnNSiLNLPEUCXiUwys6A780pDUDrGvRdxll1OH/0CYqWo3dNVqv6WxgVSd4oohtlfd9A6NObDDQN9FuQqDqgDB8rzWj+szySSC+jkDQux4f1kn0omjCC2o82ygPB1mrWk9u7C/d2LdG/Q+Rz04JgXlQYDcSijsysyonIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifAkFgayZ+HglADRXWl4b+GXWLqFUfaI6oTizHqzR3E=;
 b=EcKAf26yvEDwkmQVctSEfJtRuEVCHuxB/+anthnDDZlML5cQbylll59wC8rs7hphEiBq4+gyEbWySPhhaevh5c/FReWgsTnUj9wKOQ7R75A+2G+NmyPGBLeQZzAQ+r+FOOj0dN9SYtox+CUgS7tDzf0pWDGp0EYmrW9Zfo6QbJ2LXldMmKTRTIGMZ0tqjmM3mNZd0I9SC6ftd3SH9IqKptfbaK2ikoqOk8FGATWmkAEBHZISiXWITOyyvCSqU0+VR+HCJ0Vu4bn5YqGagzN5u6etBKMRcNIQwayzExu/eHOJn8+bppQZSi6gfRoTESvFrNdIA9wb57f064c6Kd0cWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifAkFgayZ+HglADRXWl4b+GXWLqFUfaI6oTizHqzR3E=;
 b=EA2Wi0JtJG9iYdPTS1LVDZqso6ft/34fA/2lUStw/ZSQmQ5Tp8kKcd156U4X3GOrZC4iBgSZ2ZM7mUNMqMSWoZumY5NTOSPynTF/8C/q75QKTgJgl2MlsT9VBf755qmWnrCEuZPxjBS4hvpc5hZXto5em6UOmsZZvS7gGTEvoLA=
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com (2603:1096:820:8::11)
 by PUZPR03MB6966.apcprd03.prod.outlook.com (2603:1096:301:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.9; Fri, 4 Nov
 2022 09:29:58 +0000
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::8cda:5c09:3c2e:19]) by KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::8cda:5c09:3c2e:19%7]) with mapi id 15.20.5791.020; Fri, 4 Nov 2022
 09:29:56 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: "nfraprado@collabora.com" <nfraprado@collabora.com>
Subject: Re: [PATCH v27 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
Thread-Topic: [PATCH v27 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
Thread-Index: AQHY7zP8IB9OrEnPxka4DzE4Bd/13K4tqGsAgADZKwA=
Date: Fri, 4 Nov 2022 09:29:55 +0000
Message-ID: <d4a204f74810e2a6445fe12dbf3b71695aa9b755.camel@mediatek.com>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
 <20221103032512.9144-6-nancy.lin@mediatek.com>
 <20221103203238.fryjwpgjtwccnjwu@notapiano>
In-Reply-To: <20221103203238.fryjwpgjtwccnjwu@notapiano>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5175:EE_|PUZPR03MB6966:EE_
x-ms-office365-filtering-correlation-id: 068e749a-7316-4b13-e426-08dabe4722aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7B6peN2c+hWIZa5fw+jrdDWLsFe7FWuYBSblymi9bqVsiyqHQibjeu2uqsLC1Gh/uRHMMTv8GZlfkJCP9Xr2rfqIFyXXUnhLgrjOHqIa+EpCPT5qhikwL7F/mIeR1y83bx4T+AYSkbVloTUD8X7Kkxa2AnV2VKXiKr+e+nsQ+3rQW2OzCrPjJTnaVCZ2QX6EGbj0OPKl74LXRALY2f1kq5nH+k6m1e/HnpIyvV/qFzDQK7GkaD1Tw9iuybw7bec1zDKFgwoo1VFoF5noqsltYYQ6ILVgfrtYto/ozLHoImXp7TLm0EUq9dHvdCKINQHYGP7xrJFNWlzY5Y0s5p3QqqcvctQDCZxhpJ9ve51GhWGjEUbjj2lt5ClRnLayPLKxVMy3wmX/0CbkRFfQHsFnD3OQQubF24aydt+r0VHrPgYJi9woNVjLGHEAwhZtL0AmYab88qrbg4LgZg3LsWyqaKcpRTqHfW/gvTbLe3Q72fHql4Vuu8Kq7SZ7/pTogr9cfunYA2B1ws3gvL7nBzf9e8I6Is9IwWkaTl07al1oIsOpJZfTotrL1VQIovbtGpJuPzS+tJ5SJ8MlKEOfVSoJikdiOYvDdrdNhhhLZ5QIu32Mi4xTlnsw6hkt6Pcq44UAZPYJ1vBi8HFzWw68ziodTcnikrk1OqLy6TD3r9ugYioSCCY8BNvHJmnASdAaE2/6pkds+La2/KEqymA7xYneYnQZlXQz2vhhfcYww+jdThBGji/EzQaT3CHa1XxdiO1Fr4zXPnFbfd/L4JjnEUlWKi989vpVrbCwHRBBZac71K9tTD5ofeFWfE6E4v+8GGrm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB5175.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199015)(7416002)(4326008)(71200400001)(5660300002)(41300700001)(8676002)(38070700005)(66946007)(86362001)(66446008)(83380400001)(6486002)(66574015)(186003)(2616005)(122000001)(26005)(6512007)(91956017)(38100700002)(478600001)(64756008)(4744005)(76116006)(6916009)(316002)(66476007)(66556008)(54906003)(8936002)(2906002)(6506007)(85182001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2VvMlZ5eUZFL1p3cDE1enNvem9RTlV2NVVlRVRZRVFDTDlUQkYzbWVjcktO?=
 =?utf-8?B?M3dxQjEyR3RuOUVHNWFzYlJEVFNOdXlweXBsRzRXMmx1R0RpTWUzOHVIUEVQ?=
 =?utf-8?B?TjQ1dVAxNjZ5a01VQWh2SzBXdTVwOWd3bDdzVUVlT0NscVdhTzhaaG9ZVEYr?=
 =?utf-8?B?OFZYWUNRSE9zUlhONEJrcnFqMkJxNDRSU3NCcnJoWnZlWWdCOEhiVWNUQkZi?=
 =?utf-8?B?dDllazdienMrNWlqL3BFSmNFalBOY3AzK3M2c3JGVEhZRVpnSk4rVlg0STdz?=
 =?utf-8?B?dm94SG4wMmpKWVptZ29ScmNlNllrdGpTL1lRbnFybGV5T0Rkek05cVJLd0RH?=
 =?utf-8?B?Q3B5Ym9NaG9LT0o1VGhsYnBZV1JzSENlQjZJT05SSndTUllDRjVtdERVRTZv?=
 =?utf-8?B?L2ovK3JCZnJlZ281bFdlRzBaTmNqcjk2QlMzTlJuTzZmK3hPaUgxRFBQeExm?=
 =?utf-8?B?b2F4dG9kTkkrc041d1FxbEZsRFZQRmtLaFNGUTlLWWpBaGFYeFhjbUlXUDUx?=
 =?utf-8?B?UkNGYUxmWWlrYjVsVXo4cktpSXBhZWZHQkpMeGhQcUhEdDN2c0Y2dE9BL0Vq?=
 =?utf-8?B?S2E5Q29MSTRUZGJzYWp4RnlEc3JvbTZiR2h2bkJoaytvZCtTZlZMNm44bzFy?=
 =?utf-8?B?OHBGZ2dwNEVaNWwwTkxqZ2JNUExmZUM0cnRvNmlNRHJ0WEZLZVZUYU9GVkp4?=
 =?utf-8?B?YjJIa1pTNVczUzJvNnl2OFd1MlkxbmVDQUpCR0s4eFpOcTJtdTJIUm9EZUhR?=
 =?utf-8?B?UC9CaHRIT0xReEZrQWl1ellFNXcwcG14dm1FdGNmZEtGbHZKM21QSTI5OFRn?=
 =?utf-8?B?aEtlU0RWMHZxQ0JITXh6S0trNWJWV1B2VHJMSDhpaHhSLzMrTlllU0RFNkNV?=
 =?utf-8?B?cHJiak1SaERENVZtampVSjlhYVRHWXBPQm5adUhSanFCbWFaaVMvb1Nud3FD?=
 =?utf-8?B?Tjg0bWxKSGY1WEQzRE5LL0FodmkreTF5V2VLYjlmZXhmWnRRdnowNitiblhv?=
 =?utf-8?B?UDJZNGNldGQzTHl2MU1lKzRYQy90NitocFFVRlBlOURwZ3YvbWtUMjdobzdj?=
 =?utf-8?B?MldCdjVWWDU1dHd5YWpmbXVIZGh2OVRuT1c0aFZua1ZlSUduM3FQbDQwTEx4?=
 =?utf-8?B?bkxDZFhTeXltdXBRZ1RtVWZqN01Mbk9IQ2tGRFc2VFlyT1dlR2dqRjF2VWs0?=
 =?utf-8?B?T2c0U3JWdUdhTFJxWUVvNmtPZlhlTzVWT1FzOUdzMklNS0RLVDJQN0RtTDB0?=
 =?utf-8?B?YTJRM2lpU01CQ2RnOU5DTTdOS3NBZWttMzZZS1R4WSt1TnUybERldGpWeVhI?=
 =?utf-8?B?OWZ3MmNlbWlKeE9lOE8xajJnWjlrNHg4QjZuOU1rTEE3R2RFajRUajEyK1lL?=
 =?utf-8?B?cTBIMkI5RFBqYkhkejBlZitTQUgrQ3pUVWlCNUd1Y0RFMmUrWk9CTWFjbkh6?=
 =?utf-8?B?OTVqNnR0TkZyWkc2aTFxb3ZCSDFKa1o2cWVWT0ZwRDhHMlVZRUlLbElyY2xs?=
 =?utf-8?B?THlsajhEY05peUhidzcrMTNONVlmK3c5SE1mRlFBYm1Ka0lSa2VJcmRzUWdN?=
 =?utf-8?B?MG1obHA3RVB3NDcxc2hYaUJSR3lqNnpmOHplaXRXSTYrWVZtdTFMN0dEZ3RS?=
 =?utf-8?B?ZTJNT3YzdEV1eFY2YmxGYjF2clRSUTRtSjQ0UHF2TC9IYkFjK21CRG9sMFBi?=
 =?utf-8?B?L2UrRmZUNFN6SlphYXFIUlB1MlNWNnRteDY1eC9UeUswSHhodnU4bzRyWEti?=
 =?utf-8?B?RGNLbFA2MVJlQUlPSG9RRWVSK1RoVm5sRkV5MGd0dFR4OVJyTFQ0MU9iUWFZ?=
 =?utf-8?B?Q3dHaGxBc25HU2huVWxRaXBEdkYwbEV0MHE5dVNMa2dFb0NIOUxqVVA5d1hu?=
 =?utf-8?B?VFR5Ny8wN1JFV0NPaGRnNzZwb3kxWEJHWWlFa2xmM2lVNHJ1bHhSWVhlYjBI?=
 =?utf-8?B?YlplUzAxZWpGdXNFWEEvdGpGbXQybFdBV00rRHE1enVmSWx6NXg5dUp2aDM0?=
 =?utf-8?B?QUFNS3JPa0JzU3pPRitkc0Y2QVhwR0EvYm1zQ01JRjArbXQxQ2NNb0xrVEwy?=
 =?utf-8?B?MjMxbW5HNFFCMjVlUTZxMnNXbWpRcm9TdVc2VHZ4MjRucUhIaFJySGs5RS9F?=
 =?utf-8?B?Wjh2MnNKU2UvdllRRHNQcFJlTWhyWG43TXZqU2JVZElTUGhJMzd5YTJyN29y?=
 =?utf-8?B?SHc9PQ==?=
Content-ID: <BE24ADF31E211C43BB3130CC2DF340EA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5175.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068e749a-7316-4b13-e426-08dabe4722aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 09:29:55.9614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eGkJvOiWzYKypcSPAShQJXHdldLC/ijsy4cD9NNoH6bkvp4vsgNLlXLO3j9x78B40ZpfF2Ck2HAIq2hUtFxscw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6966
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1742383449.426993168"
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_004_1742383449.426993168
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkRlYXImIzMyO05pY29sYXMsDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jl
dmlldy4NCg0KT24mIzMyO1RodSwmIzMyOzIwMjItMTEtMDMmIzMyO2F0JiMzMjsxNjozMiYjMzI7
LTA0MDAsJiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7QS4mIzMyO1ByYWRvJiMz
Mjt3cm90ZToNCiZndDsmIzMyO09uJiMzMjtUaHUsJiMzMjtOb3YmIzMyOzAzLCYjMzI7MjAyMiYj
MzI7YXQmIzMyOzExOjI1OjA2QU0mIzMyOyswODAwLCYjMzI7TmFuY3kuTGluJiMzMjt3cm90ZToN
CiZndDsmIzMyO1suLl0NCiZndDsmIzMyOyZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL3NvYy9t
ZWRpYXRlay9tdGstbW1zeXMuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMv
c29jL21lZGlhdGVrL210ay1tbXN5cy5jDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1suLl0NCiZndDsm
IzMyOyZndDsmIzMyOytzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19tbXN5c191cGRhdGVfYml0cyhz
dHJ1Y3QmIzMyO210a19tbXN5cyYjMzI7Km1tc3lzLCYjMzI7dTMyDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtvZmZzZXQsJiMzMjt1MzImIzMyO21hc2ssJiMzMjt1MzImIzMyO3ZhbCkNCiZndDsmIzMyOyZn
dDsmIzMyOyt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrdTMyJiMzMjt0bXA7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrdG1wJiMzMjs9JiMzMjtyZWFkbF9yZWxheGVkKG1t
c3lzLSZndDtyZWdzJiMzMjsrJiMzMjtvZmZzZXQpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3RtcCYj
MzI7PSYjMzI7KHRtcCYjMzI7JmFtcDsmIzMyOyYjMTI2O21hc2spJiMzMjt8JiMzMjt2YWw7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1lvdSYjMzI7c2hvdWxkJiMzMjttYXNrJiMzMjt0aGUmIzMyO3Zh
bHVlJiMzMjtiZWZvcmUmIzMyO3dyaXRpbmcmIzMyO3RvJiMzMjtwcmV2ZW50JiMzMjtiYWQmIzMy
O3ZhbHVlcyYjMzI7ZnJvbQ0KJmd0OyYjMzI7b3ZlcndyaXRpbmcNCiZndDsmIzMyO2JpdHMmIzMy
O291dHNpZGUmIzMyO3RoZSYjMzI7bWFzay4NCiZndDsmIzMyOw0KJmd0OyYjMzI7dG1wJiMzMjs9
JiMzMjsodG1wJiMzMjsmYW1wOyYjMzI7JiMxMjY7bWFzaykmIzMyO3wmIzMyOyh2YWwmIzMyOyZh
bXA7JiMzMjttYXNrKTsNCiZndDsmIzMyOw0KJmd0OyYjMzI7V2l0aCYjMzI7dGhhdCwNCiZndDsm
IzMyOw0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtS
LiYjMzI7QS4mIzMyO1ByYWRvJiMzMjsmbHQ7bmZyYXByYWRvQGNvbGxhYm9yYS5jb20mZ3Q7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1RoYW5rcywNCiZndDsmIzMyO04mIzIzNztjb2xhcw0KDQpPSywm
IzMyO0kmIzMyO3dpbGwmIzMyO2ZpeCYjMzI7aXQmIzMyO2luJiMzMjt0aGUmIzMyO25leHQmIzMy
O3JldmlzaW9uLg0KDQpUaGFua3MsDQpOYW5jeQ0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEt
LXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAq
KioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUt
bWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRl
bnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9t
IGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSAN
CmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBk
aXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5
aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50
ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVu
bGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1h
aWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVy
cm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcg
dG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1h
aWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBu
b3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJz
b24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_004_1742383449.426993168
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciBOaWNvbGFzLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFRodSwgMjAyMi0x
MS0wMyBhdCAxNjozMiAtMDQwMCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6DQo+IE9u
IFRodSwgTm92IDAzLCAyMDIyIGF0IDExOjI1OjA2QU0gKzA4MDAsIE5hbmN5LkxpbiB3cm90ZToN
Cj4gWy4uXQ0KPiA+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jDQo+ID4g
KysrIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMNCj4gDQo+IFsuLl0NCj4gPiAr
c3RhdGljIHZvaWQgbXRrX21tc3lzX3VwZGF0ZV9iaXRzKHN0cnVjdCBtdGtfbW1zeXMgKm1tc3lz
LCB1MzINCj4gPiBvZmZzZXQsIHUzMiBtYXNrLCB1MzIgdmFsKQ0KPiA+ICt7DQo+ID4gKwl1MzIg
dG1wOw0KPiA+ICsNCj4gPiArCXRtcCA9IHJlYWRsX3JlbGF4ZWQobW1zeXMtPnJlZ3MgKyBvZmZz
ZXQpOw0KPiA+ICsJdG1wID0gKHRtcCAmIH5tYXNrKSB8IHZhbDsNCj4gDQo+IFlvdSBzaG91bGQg
bWFzayB0aGUgdmFsdWUgYmVmb3JlIHdyaXRpbmcgdG8gcHJldmVudCBiYWQgdmFsdWVzIGZyb20N
Cj4gb3ZlcndyaXRpbmcNCj4gYml0cyBvdXRzaWRlIHRoZSBtYXNrLg0KPiANCj4gCXRtcCA9ICh0
bXAgJiB+bWFzaykgfCAodmFsICYgbWFzayk7DQo+IA0KPiBXaXRoIHRoYXQsDQo+IA0KPiBSZXZp
ZXdlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29t
Pg0KPiANCj4gVGhhbmtzLA0KPiBOw61jb2xhcw0KDQpPSywgSSB3aWxsIGZpeCBpdCBpbiB0aGUg
bmV4dCByZXZpc2lvbi4NCg0KVGhhbmtzLA0KTmFuY3kNCg==

--__=_Part_Boundary_004_1742383449.426993168--


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB20D5F36
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 11:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251FB6E216;
	Mon, 14 Oct 2019 09:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50066.outbound.protection.outlook.com [40.107.5.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5AC6E216
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 09:43:59 +0000 (UTC)
Received: from DB6PR0801CA0058.eurprd08.prod.outlook.com (2603:10a6:4:2b::26)
 by AM5PR0801MB1636.eurprd08.prod.outlook.com (2603:10a6:203:3a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Mon, 14 Oct
 2019 09:43:55 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by DB6PR0801CA0058.outlook.office365.com
 (2603:10a6:4:2b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Mon, 14 Oct 2019 09:43:55 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 14 Oct 2019 09:43:54 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Mon, 14 Oct 2019 09:43:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e5736c89d469c85
X-CR-MTA-TID: 64aa7808
Received: from ea05d2ded876.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 009FD6CE-8152-4893-A351-13EBEFD9070A.1; 
 Mon, 14 Oct 2019 09:43:42 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea05d2ded876.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 14 Oct 2019 09:43:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgyFpF2T1Fk9I7SHJbpgE7Urwkc0KNPsu5Vw+5Rlt7RxHkYh3ezGGD27gwCKz1cDqZgWyjFIc6EUfHAjmM+82ISPtOrl+cL0lfIm1ugddJJ4xc32ZDx2a6DZiyex+hECltdWY2nsDQimar/pxfTRpXlRR6IHzJeANWG839lxSGOU5+WmhafX/vZgS/C8eUhrxjqzixmUYrIsiVadYAatssxPHBQsPdziJ3btQSjf081HGmiQ2AOESLh2/Qgdw5zkBwmWsE/VvPdEpDIgmB3Jfg3DT1lEGkF/uoFKp2Hf5DftN5U2jN/089sqd5tvBD7MYu1O387ZB9jVOPe+31qGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwHhXvt95GLMYq8v+LyaFwefKl1dUvimCCsOJm2miew=;
 b=ND4JDKq4w4Cb/pi9EsY8qOUcLMP0karaboM/k9AeQnGdHMtj6wGp0pYULj3sfoJkBZZ0HY8EQP9LEPM6C/kpqIj7kmAA0iCkL3bFqA4SB2k9cpPa+aoJ/mvXkppEXQY70BTmiuXeCNg+/vOdR0Z6E1z8hXnq7YUyicaapTgO9ELTr+YnOA4hnRDTCvHEvNC/CYRO8Zk+UaBGYqyiO0b8o6OyoJV3xVlcfLSnfQDsNPUvpB5DxhtJ/KG0oxCrtx8chG7D3LIsqnLbbcgYkbnIPCN3D5ks9JeeqeTmNi2ywTXVzePYCIgsfZ0manhgMnrFTKI9kRSkaB0fpd2eHWfvgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4781.eurprd08.prod.outlook.com (10.255.114.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 14 Oct 2019 09:43:40 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 09:43:40 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v2 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVf/cV8wl8pZbk8kmsplok4zd2G6dVG1eAgATMaQA=
Date: Mon, 14 Oct 2019 09:43:39 +0000
Message-ID: <20191014094332.GA15094@jamwan02-TSP300>
References: <20191011054459.17984-1-james.qian.wang@arm.com>
 <20191011054459.17984-2-james.qian.wang@arm.com>
 <1622787.6FTe1jSl1W@e123338-lin>
In-Reply-To: <1622787.6FTe1jSl1W@e123338-lin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3e8021b3-9f94-465d-9507-08d7508b06f2
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4781:|VE1PR08MB4781:|AM5PR0801MB1636:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16365193FE44B1E3E916E452B3900@AM5PR0801MB1636.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3044;OLM:3044;
x-forefront-prvs: 01901B3451
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(2906002)(33656002)(6512007)(9686003)(66066001)(71190400001)(476003)(71200400001)(386003)(6506007)(76176011)(7736002)(486006)(305945005)(229853002)(446003)(25786009)(26005)(102836004)(55236004)(186003)(11346002)(99286004)(86362001)(478600001)(8936002)(14444005)(8676002)(6436002)(81166006)(81156014)(52116002)(33716001)(6636002)(3846002)(6486002)(58126008)(6116002)(54906003)(256004)(6246003)(5660300002)(66476007)(66946007)(66556008)(316002)(1076003)(4326008)(14454004)(66446008)(64756008)(6862004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4781;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: scWtQ5gxG3QR61ygsrric09dtjBuEFHzjqUl2LGZlyi99BQ7udepCEpaZS1eOzWX855Be/9ssONV+VvnYSZl0fTWfQD3ZBMiq9+MSEedxAleYI2BI3cEJHNSdRhAc2vKURmSsUQvTEgAHf1mwGSy1bQYK/4sHW5RhCdMWvqA/jB3HYqfAHMBZvXM65qJTadQHGeg/S6VorR695P8BVxbhYbnJnpDpqQMhLhwngzTJX7gavK0Kjlt4dSkhfP1nKGvlkw/VflzdDpq9RPVK0Oxn9fdpanCqVfrBTv9uS8w9EyHb+JRi6p/klBtH2UK0/Epf9ubJZG9EHVNlNiktuGFD0LI5eYfERz8teiuO3pi9DfRSvh8ggGarsTEtStGwIkoL9aS0wEafxhQhUAG514x0oJPwdxcTjndJOreJkfIe/Q=
Content-ID: <7382987736F7BD4E86B193C4D25E9A02@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4781
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(376002)(346002)(136003)(39860400002)(189003)(199004)(36906005)(46406003)(386003)(6506007)(25786009)(54906003)(476003)(6486002)(5660300002)(23726003)(6116002)(3846002)(11346002)(229853002)(305945005)(7736002)(58126008)(126002)(99286004)(316002)(76176011)(33656002)(446003)(4326008)(6512007)(9686003)(22756006)(356004)(14454004)(26826003)(478600001)(102836004)(14444005)(63350400001)(6862004)(26005)(336012)(186003)(66066001)(50466002)(97756001)(6636002)(86362001)(6246003)(47776003)(33716001)(76130400001)(8936002)(8676002)(70206006)(81166006)(81156014)(8746002)(2906002)(1076003)(70586007)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1636;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 88f8d0bd-c23c-4678-d397-08d7508afddb
NoDisclaimer: True
X-Forefront-PRVS: 01901B3451
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cwteMcfyBnu/oPs4OtaKCvFxEqfWvm3rxtILi7gabrh9wZccKGJ5PmDNNe1GORhTpwn1BdZ07eAyGffJrBrYklKCWyGYn+FxABo7wozQ7kcLWyJO+eTRHD55i3trC42ozohXInV8tRYXt5GoLr/DxVLliYo/q8HjvzQqVzsiGGIJu7m+rD0gFV4pktbeHwLiqHDllKaCWxhYe2Ve1wNbKAlQiTh+fAFBmsngpsMtFIYqMxY+FOLLEQB5C3p4iazM+eEtLWV8rjCjXp15BLcLwcQM6oC6VU2O5fBS5+SuQTvGdihNpgXdyfZv9zs/R9LzW/JCvbz5K5EIiQwGr/PtSu/vCxqMgwR/VKYXYC9/pRdt1St24G5IWQubBr9HYo5Vb6d6EDAkBzT6hBpqNCvELsAYxnnZBYZ0T1hKSxhQGUc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 09:43:54.2371 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8021b3-9f94-465d-9507-08d7508b06f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1636
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwHhXvt95GLMYq8v+LyaFwefKl1dUvimCCsOJm2miew=;
 b=zA42F4+nFXt2/teRr364Pu6NQKHBln7KZ7XfJ8Xk609i/aBMw1UUo8YFOvekQWJcJEtMPLKIXMX/Xz2DFA+2dhekZoCksKjbmIAT3QomUKt6zMqqxEo7n79b73i27pSWx+edZ+3Fl+d8OZqTJXADf7i1mlDBVhLuuoUwx2dJzto=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwHhXvt95GLMYq8v+LyaFwefKl1dUvimCCsOJm2miew=;
 b=zA42F4+nFXt2/teRr364Pu6NQKHBln7KZ7XfJ8Xk609i/aBMw1UUo8YFOvekQWJcJEtMPLKIXMX/Xz2DFA+2dhekZoCksKjbmIAT3QomUKt6zMqqxEo7n79b73i27pSWx+edZ+3Fl+d8OZqTJXADf7i1mlDBVhLuuoUwx2dJzto=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDg6MjY6NTNBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBIaSBKYW1lcywKPiAKPiBPbiBGcmlkYXksIDExIE9jdG9iZXIgMjAxOSAwNjo0
NToyNyBCU1QgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4g
PiBBZGQgYSBuZXcgaGVscGVyIGZ1bmN0aW9uIGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24o
KSBmb3IgZHJpdmVyIHRvCj4gPiBjb252ZXJ0IFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0byBRbS5u
IDIncyBjb21wbGVtZW50IHRoYXQgc3VwcG9ydGVkIGJ5Cj4gPiBoYXJkd2FyZS4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGph
bWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9j
b2xvcl9tZ210LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGluY2x1ZGUvZHJt
L2RybV9jb2xvcl9tZ210LmggICAgIHwgIDIgKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI1IGlu
c2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29s
b3JfbWdtdC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMKPiA+IGluZGV4IDRj
ZTVjNmQ4ZGU5OS4uM2Q1MzNkMGI0NWFmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9jb2xvcl9tZ210LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdt
dC5jCj4gPiBAQCAtMTMyLDYgKzEzMiwyOSBAQCB1aW50MzJfdCBkcm1fY29sb3JfbHV0X2V4dHJh
Y3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbikKPiA+ICB9Cj4g
PiAgRVhQT1JUX1NZTUJPTChkcm1fY29sb3JfbHV0X2V4dHJhY3QpOwo+ID4gCj4gPiArLyoqCj4g
PiArICogZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbgo+ID4gKyAqCj4gPiArICogQHVzZXJf
aW5wdXQ6IGlucHV0IHZhbHVlCj4gPiArICogQG06IG51bWJlciBvZiBpbnRlZ2VyIGJpdHMsIHRo
ZSBtIG11c3QgPD0gMzEKPiA+ICsgKiBAbjogbnVtYmVyIG9mIGZyYWN0aW5hbCBiaXRzIHRoZSBu
IG11c3QgPD0gMzIKCkBtOiBudW1iZXIgb2YgaW50ZWdlciBiaXRzLCBvbmx5IHN1cHBvcnQgbSA8
PSAzMQpAbjogbnVtYmVyIG9mIGZyYWN0aW5hbCBiaXRzbSBvbmx5IHN1cHBvcnQgbiA8PSAzMgoK
PiA+ICsgKgo+ID4gKyAqIENvbnZlcnQgYW5kIGNsYW1wIFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0
byBRbS5uIDIncyBjb21wbGVtZW50Lgo+ID4gKyAqLwo+ID4gK3VpbnQ2NF90IGRybV9jb2xvcl9j
dG1fczMxXzMyX3RvX3FtX24odWludDY0X3QgdXNlcl9pbnB1dCwKPiA+ICsJCQkJICAgICAgdWlu
dDMyX3QgbSwgdWludDMyX3QgbikKPiA+ICt7Cj4gPiArCXU2NCBtYWcgPSAodXNlcl9pbnB1dCAm
IH5CSVRfVUxMKDYzKSkgPj4gKDMyIC0gbik7Cj4gVGhpcyBkb2Vzbid0IGFjY291bnQgZm9yIG4g
PiAzMiwgd2hpY2ggaXMgcGVyZmVjdGx5IHBvc3NpYmxlIChlLmcuIFExLjYzKS4KPiA+ICsJYm9v
bCBuZWdhdGl2ZSA9ICEhKHVzZXJfaW5wdXQgJiBCSVRfVUxMKDYzKSk7Cj4gPiArCXM2NCB2YWw7
Cj4gPiArCj4gPiArCS8qIHRoZSByYW5nZSBvZiBzaWduZWQgMnMgY29tcGxlbWVudCBpcyBbLTJe
bittLCAyXm4rbSAtIDFdICovCj4gPiArCXZhbCA9IGNsYW1wX3ZhbChtYWcsIDAsIG5lZ2F0aXZl
ID8gQklUKG4gKyBtKSA6IEJJVChuICsgbSkgLSAxKTsKPiBUaGlzIGFsc28gZG9lc24ndCBhY2Nv
dW50IGZvciBuICsgbSA9PSA2NC4KClllcyB0aGUgZnVuYyBpcyBvbmx5IGZvciBzdXBwb3J0IG0g
PD0gMzEsIG4gPD0gMzIKCkJ1dCBJJ20gbm90IHN1cmUsIGhvdyB0byBoYW5kbGUgdGhlIHVuc3Vw
cG9ydCBjYXNlID8KTWF5YmUganVzdCBtZW50aW9uIGl0IGluIERvYyBpcyBlbm91Z2guCgo+ID4g
Kwo+ID4gKwlyZXR1cm4gbmVnYXRpdmUgPyAwbGwgLSB2YWwgOiB2YWw7Cj4gPiArfQo+ID4gK0VY
UE9SVF9TWU1CT0woZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbik7Cj4gPiArCj4gPiAgLyoq
Cj4gPiAgICogZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQgLSBlbmFibGUgY29sb3IgbWFuYWdl
bWVudCBwcm9wZXJ0aWVzCj4gPiAgICogQGNydGM6IERSTSBDUlRDCj4gPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaCBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210
LmgKPiA+IGluZGV4IGQxYzY2MmQ5MmFiNy4uNjBmZWE1NTAxODg2IDEwMDY0NAo+ID4gLS0tIGEv
aW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaAo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Nv
bG9yX21nbXQuaAo+ID4gQEAgLTMwLDYgKzMwLDggQEAgc3RydWN0IGRybV9jcnRjOwo+ID4gIHN0
cnVjdCBkcm1fcGxhbmU7Cj4gPiAKPiA+ICB1aW50MzJfdCBkcm1fY29sb3JfbHV0X2V4dHJhY3Qo
dWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbik7Cj4gPiArdWludDY0
X3QgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbih1aW50NjRfdCB1c2VyX2lucHV0LAo+ID4g
KwkJCQkgICAgICB1aW50MzJfdCBtLCB1aW50MzJfdCBuKTsKPiA+IAo+ID4gIHZvaWQgZHJtX2Ny
dGNfZW5hYmxlX2NvbG9yX21nbXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4gIAkJCQl1aW50
IGRlZ2FtbWFfbHV0X3NpemUsCj4gPiAtLQo+ID4gMi4yMC4xCj4gPiAKPiAKPiAKPiAtLSAKPiBN
aWhhaWwKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

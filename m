Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5706CEC95
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 17:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F7710E173;
	Wed, 29 Mar 2023 15:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95F610E173;
 Wed, 29 Mar 2023 15:16:37 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32TCZI0l013197; Wed, 29 Mar 2023 15:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=ULgz/3IE3fDCYdd6ZnQxxmE7mnhyyh5SL48Dx0ucHAQ=;
 b=L+Hp7DjcEpaJJkfswxHTRWSEEJPjpxSxVwKZcmxusQUTO1RKPNtPflXBypxAvK4Qtcvz
 /0wZ3nI1/6Jde9zkvAQbqTAYJNjpm+OkXo+CKhXCfwU/AXrJ7xKOp7nZwj/OkK5It5C0
 7TzzTgRUI+LCamtsN+I5bzsIczrVicNA3uBHI79Zje/KxyHyi+/PzzBvRmNGdna95/iy
 02mYQxXdCDipE/lE+1lcjBapSoZnKvVE/ib6Qwg0f6oPVFrGOnf0GzDhpucFrBifOCN6
 0QAyVV6wh9Cxtjjk9i7fANvTnk3FaLxiKBxSAc9HpMrueiA6PyY2kyGupDvii3fl02Cy jA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pm6k82c4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Mar 2023 15:16:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMjLtzOJWZLY999M6de6iXacA/joevjk9cphDCZsqFBRzIdcSCBP4xBOzHD1Uzsz8PF3fbVh2PZiDuzL85WkCbvn4rUBF74OLZFbrZ+O6D/4zzfxaj+ntnCEncUct4Wnd5YxGHTfkKpGMKk7Aowha8WPmzuATi/kLmZfM5RBY5acd/4umxk7yzz0W6u4GzDgSM5VXOJR61bRkYdfomJs549ss8HCbDlgh0+9CyaDpQH9xwjHYF377SZxrnUM+V4KBg1dLM58pKkk33sEZCIEuFDki99mwMWZ9BYv4PGY4qavHPLekomA/6cEVe8PTkYk64cS+Dy5nKg1Rvr7BW4Nmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULgz/3IE3fDCYdd6ZnQxxmE7mnhyyh5SL48Dx0ucHAQ=;
 b=WUKT0Ps0PNhmc6Zo7x7unGagldraJSsXBHo7wr4sLRwN10T2ZhvFA1oxkxvq/CwXqxk4pe6BLMV+wNjW6ZkA3kpM+D0ZqhrgFtzEByRs/ZmoIfoqg1b3ROn+lEimDEIEMLD1VcGFk7RLovlYYWk3wgGoOq5oXIwS67BKP+qQyC+MWxpSbEprVea5a18jyp9QPAEIhFONOiI4fR6C/VTVDxdhc/fns6i3jAjzKr1maIdGZtAog1Ao+vLErSlKBDPOPhIzkCTRCoOfYe6pOpdltNbnzotI0+yVmv7TnAfyOgjnFCS9ZtTt40ThZ+ag3lX5jajxK4hFT1Q8I5BukdYkAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by SA3PR02MB9277.namprd02.prod.outlook.com (2603:10b6:806:31c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Wed, 29 Mar
 2023 15:16:24 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::5c51:5ca0:fa24:f4f5]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::5c51:5ca0:fa24:f4f5%2]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 15:16:24 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: Stephen Boyd <swboyd@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>, "robdclark@gmail.com"
 <robdclark@gmail.com>
Subject: RE: [PATCH v14 14/14] drm/msm/dp: set self refresh aware based on PSR
 support
Thread-Topic: [PATCH v14 14/14] drm/msm/dp: set self refresh aware based on
 PSR support
Thread-Index: AQHZTSTsb2JCdFx7o0SY2y5fDPNNi68NZWaAgAACYwCAAZAAgIADD/og
Date: Wed, 29 Mar 2023 15:16:24 +0000
Message-ID: <BN0PR02MB81736AFC01FB13F1640068CEE4899@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com>
 <20230326162723.3lo6pnsfdwzsvbhj@ripper>
 <20230326163556.iesjkoh3nw3iwvf2@ripper>
 <CAE-0n520ypTRNT1X6kZ8o_Z+DN_68qwqZc1wZGMwsFqV5naktw@mail.gmail.com>
In-Reply-To: <CAE-0n520ypTRNT1X6kZ8o_Z+DN_68qwqZc1wZGMwsFqV5naktw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|SA3PR02MB9277:EE_
x-ms-office365-filtering-correlation-id: f9992a99-cde3-47a1-adbf-08db30688f3e
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tY5JxVfMCYY9E9Z6t1HH/8XPXqv693Cob9jUKuMyR1g42RMOLB3dcxJIN20I/1ht2xrlMTluwHVy2d9LNt9fpt3U3Uunlmmnj7JxnoDBn+mg2qNKfoa8Ha6vOOJrFO+ukRiU7cK+aOGEE/lY0nOr32s8pEBiQhCM/hjSCY2q6tqlT2C6RZzqwfNi/VXvzOWGermbyaZu599d4vifIygHV/0/TnmmspG42OnAzXr95Xh2wVKYzZ+Ifi4vIQ/NGa/nvGpvrr4EPJfPbT/65N+LuQDauCsx8kcJ7vXF8ha4zwwKTH8dIAgYguSsRg2K6rcpKsqxUnPzNKC000br1IPiMADgpwF63RHaA1z+sV2mtyQqXegqCilwYD3811EWWU3tJGLvdhRMF/dVycKziuVeeEivq0bk+jYKc92OyxDQ0Gw0AKMnalVg6NhvMpvG4E3a5PGlMV/KW380UafeKaLD0G9uDZg5/tZ/stGbGFyMTkInAZe3I4YqlkAfMh3sRl2E/m3i+eZFQfc3+LPFXIe3lGJpkDPFKboTzEQZKXE3D4NqzfXrKFEgTVJsmvZg3WnbFXde4Lr7BSjbD2zNk04PaSXeBog+O9pZskEi7bEA1/BRB8ea2YpvCAqIocMr/NBk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(86362001)(38070700005)(33656002)(2906002)(478600001)(71200400001)(55016003)(83380400001)(7696005)(107886003)(38100700002)(53546011)(9686003)(110136005)(7416002)(316002)(66446008)(64756008)(66946007)(66476007)(8676002)(122000001)(41300700001)(66556008)(4326008)(186003)(26005)(54906003)(52536014)(76116006)(5660300002)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MllHdmRGTHArcC82dXU5dnZlZXZ4UGFPVVJVb3UzSGZybHYzNFRqRG1qYkNz?=
 =?utf-8?B?YzlSRlgvaTJKUlFxN1MrNTl2bS8rYmRRaXV1Ump1eHBudnRYd21lR0MyZnd1?=
 =?utf-8?B?ejdNN2tZRFFRMWU4d2lxaURwSnh6ak9SRVVLQkpMU1Nqc0xzUGRRZGVIeTNr?=
 =?utf-8?B?ZktmczMxajI1OVRpNUhNTWN0T2F2YXJ4UWNFTkJUSjgxbXNKSDJjRUdMMGdm?=
 =?utf-8?B?Z0Nkb0xqdStLS080QzVJWGd0SnhYSDJ6S0x5bU50dVplU0lSeFVwaXdGZW1l?=
 =?utf-8?B?Z1hXZXN0ZlRySE9HQXJIVVNRL2oySmdEdGh2R0RuaGM2REhueDVvVjR0MW43?=
 =?utf-8?B?bnVhdUJTNkJvOWJwSEpLZ1doZGEyblRWdWtRRllDcDl0R053Z1hiR3M1VHo0?=
 =?utf-8?B?UDBYRlplYlNNekxteUhwcVNvKzlxTFFBaDZLblJGc0I4QThMQklyMmJ5SWU4?=
 =?utf-8?B?bExmMmp1bC9EMWo3Nk9BUEYza0JhNWFYZXY2a21oanh5ZmN1bU11Mm5jT29V?=
 =?utf-8?B?L1p4SFZYalhOYTQxSDMxVjUvc1c5S2pGUElRTXJOR21ZUkVVdlJvUWdaN1M0?=
 =?utf-8?B?VVZPOFBNQzRmVUpVanhVOGZkd0pWOW5IR0plaGJCM3RsWEVZVjJWek5Gb1FZ?=
 =?utf-8?B?TUtDYlZ2aTZidXVpVVF5Sk11d2N0UmdCZnFESFJsd0dxeUxwQTBHaDVCT3Az?=
 =?utf-8?B?VTVYaXNyWUFONW84Z1VnUU5XYjM2VEVWRDRBcUs3L0R5YUg3NGxRbHB6TGZE?=
 =?utf-8?B?VmlJZ29vZ2paM0lmRTJRRVIvQlJuc1YwYkZKTnNpR0FjZGxMV0czRGhBUHpr?=
 =?utf-8?B?WDREbkxlbVE1NXR5L2x3L1BMcDhncERSQkF0bmV0L3VHd00xNjd2d1hBdUtK?=
 =?utf-8?B?NmRlYnRUQTg0VzFDVVVtYmY1OFFldk16ZnV0OHIwYmMyZlAra05mUUdLNTlV?=
 =?utf-8?B?WVlKejdBR2NvQVd1VWtZWnU1M0dYckpVT25KU3BGVW5kbHcyWkk5Zm1oWDY5?=
 =?utf-8?B?cXVwaVVQNWpiYW5SbkdTMHp5NklycmpGb3dramNPL00veW5PT1Bhc1Blc1Jh?=
 =?utf-8?B?Qi80aGJqRHNYS1F0aFhnTkdYcUM4VEUwVS9MU21YWVVPMXZvbUJ1QVNlNGxN?=
 =?utf-8?B?NHZCVXBiVjNoeml5cEQzcy9uRkxQVkgyM1pVL1d6Vm5OUEtSdWRMRDVQMWZ6?=
 =?utf-8?B?Z1FsVW42T2JMQk9PdWNTY2QyV0pEVHU2emx2TVZxQkNkeVBSNy81cHJiQi9O?=
 =?utf-8?B?eElvcnFmdUxTZHRtYkkyUnJpZXJEbDU0eWUwL2p5dHc0eVJlOERsNnV0b1lx?=
 =?utf-8?B?a1hUS3Y5elFJVkxGeWtZV21lTFZPd3Z6ZFZRa0RCYTcyazgxbHBzYnV2amp4?=
 =?utf-8?B?RmJuTE1VY0dUZFJ0Tk8xWjdnZHpiNXBwcXJ4dWJ5WVlkblBtZGhOUDhVL3FL?=
 =?utf-8?B?ak8zaXlFZFhjMFZ4TC9JaFpjSnUzdWdLME1Qd3FaMFlYT0NIdnBOWXF0czBY?=
 =?utf-8?B?SHpoT1dlc2ozeTdBOVJtN1BXY2FOUEtFdThwRHVmcU1ZbmRqd3ZhcXVjVjRL?=
 =?utf-8?B?WFJ0Ry9FMXVnc0QwVWlZYlhjbG5MQUI0Y3l4VjNZaGpZVjZjT1hpSS8wN3lX?=
 =?utf-8?B?LzlIUERMWjBTY3UzSU95UUttZ2ZUOWREQkQzN09kTWU3TG1xYzk0U0Y2UVhl?=
 =?utf-8?B?SzZOU1RyMmxDMlJQSlZCbk0yOGxyZ3JpcU9rdThPYThaRFQvaWpUcm5kKzdW?=
 =?utf-8?B?RFpZQUFraTJjcUo0d1YwNVJ3UFF0MGxvQW9SL3ZyL0FtSTA4a2lJQStQRWxS?=
 =?utf-8?B?REdPMWhrdkpuNVVMWU51YWQ2MFBmMWVwM2YzdmFuSXlENTRBR2ZEMTFGcTN4?=
 =?utf-8?B?SUhHQ3JqQlVUOTFIL2ZWdU5MMVQzUzc0ZDBnVlpWMHhrSE1HcVQvbXY4ODVE?=
 =?utf-8?B?NXdXcGl0MXRFRHBxTDZ2VDRkL2JFQkxrYWZoVWtIYllqUllvS1duZHFSTW1H?=
 =?utf-8?B?TklMNUNxU1hmdjZhZjFIOTJwbmphd2FQb08rOWl1b1dmLytobE4zakh5ZnE1?=
 =?utf-8?B?YVRBR2ZiNEM4MC9ubzJLMkVjcS9jTTlsTlhWbGZlQy9aTmxOYWVFRkJCRGVQ?=
 =?utf-8?Q?EPuVZc1V+012bnSe411CcMg2L?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Y2s0WHFHUDJHTFNQYVZadVdzVmJteDdpcElUUmd6Z3VoSHE0M2RTaFlNU3NT?=
 =?utf-8?B?OXJEb1g0ZmFMMFVFRldLbTBEZTBZNXpjeGVpd1ZJRk1yeHZvVU54QkdXV1V6?=
 =?utf-8?B?Z3lETzB1U2pIV0pYakNlTzRDenZPdkJ6Ni9xZkVIdHRhc2hzaDgzRVlCb09Y?=
 =?utf-8?B?bkpJNCtHcjVNWWRPMFVNSnlUYnZiQzdudzBKMlFyZGNNa3NkZmFoSHlPazBa?=
 =?utf-8?B?SGdQMCtYeGVNKzdoclN1UG9IWTdlZU1WaGhoN1dQSndhOXY2ZEdUaHFWcTdq?=
 =?utf-8?B?R0lhNmxjQVo2NEZFR2FRbW1FRzB0S3A3b3hxUlhuVHUrRUNwcTFDZGhXMlZB?=
 =?utf-8?B?NHMrOGcyaTAwMFlZN016bGxXRGtjN2lpMEVpWG8xd0ptcHpYK2tJUzFwTytH?=
 =?utf-8?B?N1pYSmhsd2RpbkwwQnBINmU1YldWbGdENWpzUGVIV3F4dkp5OFFET2M0MkpX?=
 =?utf-8?B?YTlDQlVVUktVT2w4STJQYkhqckU0UmlnVE9JdzRQRlI0amNCd2ExSzlpR0VY?=
 =?utf-8?B?U2VnTTJsUGdHZjFtTFpwdEZCQUloTjlXbDByNTRYMnRLU0FEMVBSWThDT2Q1?=
 =?utf-8?B?elUvbi80TXNmcUJiQ2MrSXhOVENPdkJYSVU1dEhlTm45YzJEdmVuR0N1OUxW?=
 =?utf-8?B?eHJvMWk5VTd3eS8rQnJQczdXK2lTSG5aYk1pam00WDYyRWdlYnI4dGpDQys3?=
 =?utf-8?B?M0dkNjIwbTdGK0RyMEJtZDE4ZW5oOUpGVHhDdUxpekFGaitjbk1xek9BczY1?=
 =?utf-8?B?T1VxVHdSOWcramhFT3ZMUkp3SVFqU21udFdjQzFXT0oyOWxoVlUyR0xwMFJM?=
 =?utf-8?B?cERQTXRiUVR2alFZRUIrMGtUaTlCejE1aXZ4ZWxhcEtzZ3orVE1kZVBuVFcz?=
 =?utf-8?B?SUlyYjI2aGJ4SWtycGJIeHlPc1RoOVQ0VHdCN3M0TUU5ZXFlQitoMk9JWVBG?=
 =?utf-8?B?V0lldUl0SndxNFg1SkV3ZlhaU1VpVFNPN0tYTHN0VmpHeE1KTFkzU0dPTVZz?=
 =?utf-8?B?VC9zN2s3SE1naHAweUFtbGRQallZeE5PeTNnd2hOOGtDL2hEeVpScDgwR2c1?=
 =?utf-8?B?YmdPRkJPY1lWcFhYY09yQmRlMGJSYUFDU0VtczBGYXgrbytmbjRJcS8xVm1r?=
 =?utf-8?B?bXdRTXNISXY0dkNpSmtTZDVlWWNMc1NabkhSa3cvZ25HR2habzdLdjVQZVZt?=
 =?utf-8?B?RVNsVi8yWkpBNk1YZmFVbnZyZFZLbkt4UWQwZFBwZzFMamkxWnFWU05aekFm?=
 =?utf-8?B?N25ZR1dTRjM2UzVlVG04Y1BzblFhQWhCTzJpN0xScFM1THdwZz09?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9992a99-cde3-47a1-adbf-08db30688f3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2023 15:16:24.1025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FaxRRiUNNpgpVat6OlNfv6Bgm9Mxx24jYuMvlojLElm4HGPdRF6Xq1z0sy6vbL5bHbTxoBvYyPKrl1PZ1vLpj9iw2YVVva2V7pmoM77iACs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR02MB9277
X-Proofpoint-ORIG-GUID: 6PLj2gl7KiQqPM_QXD8mALoVrjy5hCNy
X-Proofpoint-GUID: 6PLj2gl7KiQqPM_QXD8mALoVrjy5hCNy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_08,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 clxscore=1011 adultscore=0 phishscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303290120
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIDxz
d2JveWRAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDI3LCAyMDIzIDk6NTgg
UE0NCj4gVG86IEJqb3JuIEFuZGVyc3NvbiA8YW5kZXJzc29uQGtlcm5lbC5vcmc+OyBWaW5vZCBQ
b2xpbWVyYSAoUVVJQykNCj4gPHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+DQo+IENjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9y
ZzsNCj4gZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyByb2JkY2xhcmtAZ21h
aWwuY29tOyBkaWFuZGVyc0BjaHJvbWl1bS5vcmc7DQo+IEthbHlhbiBUaG90YSAoUVVJQykgPHF1
aWNfa2FseWFudEBxdWljaW5jLmNvbT47DQo+IGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZzsg
S3VvZ2VlIEhzaWVoIChRVUlDKQ0KPiA8cXVpY19raHNpZWhAcXVpY2luYy5jb20+OyBWaXNobnV2
YXJkaGFuIFByb2RkdXR1cmkgKFFVSUMpDQo+IDxxdWljX3Zwcm9kZHV0QHF1aWNpbmMuY29tPjsg
Qmpvcm4gQW5kZXJzc29uIChRVUlDKQ0KPiA8cXVpY19iam9yYW5kZUBxdWljaW5jLmNvbT47IEFi
aGluYXYgS3VtYXIgKFFVSUMpDQo+IDxxdWljX2FiaGluYXZrQHF1aWNpbmMuY29tPjsgU2Fua2Vl
cnRoIEJpbGxha2FudGkgKFFVSUMpDQo+IDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYxNCAxNC8xNF0gZHJtL21zbS9kcDogc2V0IHNlbGYgcmVmcmVz
aCBhd2FyZSBiYXNlZA0KPiBvbiBQU1Igc3VwcG9ydA0KPiAgDQo+IFF1b3RpbmcgQmpvcm4gQW5k
ZXJzc29uICgyMDIzLTAzLTI2IDA5OjM1OjU2KQ0KPiA+IE9uIFN1biwgTWFyIDI2LCAyMDIzIGF0
IDA5OjI3OjIzQU0gLTA3MDAsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gPiA+IE9uIFRodSwg
TWFyIDAyLCAyMDIzIGF0IDEwOjAzOjE3UE0gKzA1MzAsIFZpbm9kIFBvbGltZXJhIHdyb3RlOg0K
PiA+ID4gPiBGb3IgdGhlIFBTUiB0byBraWNrIGluLCBzZWxmX3JlZnJlc2hfYXdhcmUgaGFzIHRv
IGJlIHNldC4NCj4gPiA+ID4gSW5pdGlhbGl6ZSBpdCBiYXNlZCBvbiB0aGUgUFNSIHN1cHBvcnQg
Zm9yIHRoZSBlRFAgaW50ZXJmYWNlLg0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IFdoZW4gSSBib290
IG15IHNjODI4MHhwIGRldmljZXMgKENSRCBhbmQgWDEzcykgdG8gY29uc29sZSB3aXRoIHRoaXMN
Cj4gPiA+IHBhdGNoIGluY2x1ZGVkIEkgZ2V0IGEgbG9naW4gcHJvbXB0LCBhbmQgdGhlbiB0aGVy
ZSBhcmUgbm8gbW9yZSBzY3JlZW4NCj4gPiA+IHVwZGF0ZXMuDQo+ID4gPg0KPiA+ID4gU3dpdGNo
aW5nIHZpcnR1YWwgdGVybWluYWwgKGN0cmwrYWx0K2ZOKSBjYXVzZXMgdGhlIHNjcmVlbiB0byBy
ZWRyYXcuDQo+ID4gPg0KPiA+ID4gQmxpbmRseSBsb2dpbiBpbiBhbmQgbGF1bmNoaW5nIFdheWxh
bmQgd29ya3MgYW5kIGZyb20gdGhlbiBvbiBzY3JlZW4NCj4gPiA+IHVwZGF0ZXMgd29ya3MgYXMg
ZXhwZWN0ZWQuDQo+ID4gPg0KPiA+ID4gU3dpdGNoaW5nIGZyb20gV2F5bGFuZCB0byBhbm90aGVy
IHZpcnR1YWwgdGVybWluYWwgY2F1c2VzIHRoZSBwcm9ibGVtDQo+IHRvDQo+ID4gPiByZS1hcHBl
YXIsIG5vIHVwZGF0ZXMgYWZ0ZXIgdGhlIGluaXRpYWwgcmVmcmVzaCwgc3dpdGNoaW5nIGJhY2sg
Z28gdGhlDQo+ID4gPiBXYXlsYW5kLXRlcm1pbmFsIGNyYXNoZWQgdGhlIG1hY2hpbmUuDQo+ID4g
Pg0KPiA+DQo+ID4gQWxzbywgdHJ5aW5nIHRvIGJyaW5nIHRoZSBlRFAtc2NyZWVuIGJhY2sgZnJv
bSBEUE1TIGdpdmVzIG1lOg0KPiA+DQo+ID4gPDM+WyAyMzU1LjIxODA5OV0gW2RybTpkcF9jYXRh
bG9nX2N0cmxfc2V0X3BhdHRlcm5fc3RhdGVfYml0IFttc21dXQ0KPiAqRVJST1IqIHNldCBzdGF0
ZV9iaXQgZm9yIGxpbmtfdHJhaW49MSBmYWlsZWQNCj4gPiA8Mz5bIDIzNTUuMjE4OTI2XSBbZHJt
OmRwX2N0cmxfc2V0dXBfbWFpbl9saW5rIFttc21dXSAqRVJST1IqIGxpbmsNCj4gdHJhaW5pbmcg
IzEgZmFpbGVkLiByZXQ9LTExMA0KPiA+IDwzPlsgMjM1NS4yNjI4NTldIFtkcm06ZHBfY2F0YWxv
Z19jdHJsX3NldF9wYXR0ZXJuX3N0YXRlX2JpdCBbbXNtXV0NCj4gKkVSUk9SKiBzZXQgc3RhdGVf
Yml0IGZvciBsaW5rX3RyYWluPTEgZmFpbGVkDQo+ID4gPDM+WyAyMzU1LjI2MzYwMF0gW2RybTpk
cF9jdHJsX3NldHVwX21haW5fbGluayBbbXNtXV0gKkVSUk9SKiBsaW5rDQo+IHRyYWluaW5nICMx
IGZhaWxlZC4gcmV0PS0xMTANCj4gPiA8Mz5bIDIzNTUuMzA1MjExXSBbZHJtOmRwX2NhdGFsb2df
Y3RybF9zZXRfcGF0dGVybl9zdGF0ZV9iaXQgW21zbV1dDQo+ICpFUlJPUiogc2V0IHN0YXRlX2Jp
dCBmb3IgbGlua190cmFpbj0xIGZhaWxlZA0KPiA+IDwzPlsgMjM1NS4zMDU5NTVdIFtkcm06ZHBf
Y3RybF9zZXR1cF9tYWluX2xpbmsgW21zbV1dICpFUlJPUiogbGluaw0KPiB0cmFpbmluZyAjMSBm
YWlsZWQuIHJldD0tMTEwDQo+ID4gPDM+WyAyMzU1LjM0NTI1MF0gW2RybTpkcF9jYXRhbG9nX2N0
cmxfc2V0X3BhdHRlcm5fc3RhdGVfYml0IFttc21dXQ0KPiAqRVJST1IqIHNldCBzdGF0ZV9iaXQg
Zm9yIGxpbmtfdHJhaW49MSBmYWlsZWQNCj4gPiA8Mz5bIDIzNTUuMzQ2MDI2XSBbZHJtOmRwX2N0
cmxfc2V0dXBfbWFpbl9saW5rIFttc21dXSAqRVJST1IqIGxpbmsNCj4gdHJhaW5pbmcgIzEgZmFp
bGVkLiByZXQ9LTExMA0KPiA+IDwzPlsgMjM1NS40MDU2NTBdIFtkcm06ZHBfZGlzcGxheV9wcm9j
ZXNzX2hwZF9oaWdoIFttc21dXSAqRVJST1IqDQo+IGZhaWxlZCB0byBjb21wbGV0ZSBEUCBsaW5r
IHRyYWluaW5nDQo+ID4gPDM+WyAyMzU1LjY2ODk4OF0NCj4gW2RybTpkcHVfZW5jb2Rlcl9waHlz
X3ZpZF93YWl0X2Zvcl9jb21taXRfZG9uZTo0ODhdIFtkcHUNCj4gZXJyb3JddmJsYW5rIHRpbWVv
dXQNCj4gPiA8Mz5bIDIzNTUuNjY5MDMwXSBbZHJtOmRwdV9rbXNfd2FpdF9mb3JfY29tbWl0X2Rv
bmU6NTEwXSBbZHB1DQo+IGVycm9yXXdhaXQgZm9yIGNvbW1pdCBkb25lIHJldHVybmVkIC0xMTAN
Cj4gPiA8Mz5bIDIzNTUuNjk5OTg5XSBbZHJtOmRwdV9lbmNvZGVyX2ZyYW1lX2RvbmVfdGltZW91
dDoyMzk4XSBbZHB1DQo+IGVycm9yXWVuYzM1IGZyYW1lIGRvbmUgdGltZW91dA0KPiA+DQo+ID4g
QW5kIHRoZW4gdGhlIG1hY2hpbmUganVzdCByZXNldHMuDQo+ID4NCj4gDQo+IEkgc2F3IHNpbWls
YXIgYmVoYXZpb3Igb24gQ2hyb21lT1MgYWZ0ZXIgd2UgcGlja2VkIHRoZSBQU1IgcGF0Y2hlcyBp
bnRvDQo+IG91ciBrZXJuZWwuIEkgc3VzcGVjdCBpdCdzIHRoZSBzYW1lIHByb2JsZW0uIEkgc3dp
dGNoZWQgYmFjayBhbmQgZm9ydGgNCj4gYmV0d2VlbiBWVDIgYW5kIHRoZSBPT0JFIHNjcmVlbiB3
aXRoIGN0cmwrYWx0K2ZvcndhcmQgYW5kIHRoYXQgc2hvd2VkDQo+IHdoYXQgSSB0eXBlZCBvbiB0
aGUgdmlydHVhbCB0ZXJtaW5hbCBhZnRlciBzd2l0Y2hpbmcgYmFjayBhbmQgZm9ydGguDQo+IEl0
J3MgbGlrZSB0aGUgcmVkcmF3IG9ubHkgaGFwcGVucyBvbmNlIG9uIHRoZSBzd2l0Y2ggYW5kIG5l
dmVyIGFnYWluLiBJDQo+IHN3aXRjaGVkIGJhY2sgYW5kIGZvcnRoIGVub3VnaCB0aW1lcyB0aGF0
IGl0IGV2ZW50dWFsbHkgY3Jhc2hlZCB0aGUNCj4ga2VybmVsIGFuZCByZWJvb3RlZC4gVGhpcyB3
YXMgb24gQ1JEIChzYzcyODAtaGVyb2JyaW5lLWNyZC5kdHMpLg0KPiANCj4gVGhlcmUncyBhbiBh
bmltYXRpb24gb24gdGhlIE9PQkUgc2NyZWVuIHRoYXQgaXMgd29ya2luZyB0aG91Z2gsIHNvDQo+
IHBlcmhhcHMgUFNSIGlzIHdvcmtpbmcgd2l0aCB0aGUgY2hyb21lIGNvbXBvc2l0b3IgYnV0IG5v
dCB0aGUgdmlydHVhbA0KPiB0ZXJtaW5hbD8gSSBoYXZlbid0IGludmVzdGlnYXRlZC4NCg0KSSB3
YXMgYWJsZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlIHdoZXJlIGluIHZpcnR1YWwgdGVybWluYWws
IEkgZG9uJ3Qgc2VlIGFueSBzY3JlZW4gcmVmcmVzaCBkZXNwaXRlIHR5cGluZyBpbi4NCkluIHRo
ZSBWVCBtb2RlLCBJIHNlZSB0aGF0IFBTUiBpcyBlbnRlcmVkLCBidXQgZGVzcGl0ZSB0eXBpbmcg
aW4gdGhlcmUgYXJlIG5vIGF0b21pYyBjb21taXRzIHRyaWdnZXJlZCwgaGVuY2UgdGhlIGxhc3Qg
YnVmZmVyIHdhcyBhbHdheXMgcmVmcmVzaGVkLg0KDQpRdWVyaWVzIGZyb20gbXkgc2lkZSB0byBS
b2IgJiBEb3VnOg0KMSkgSW4gVlQgbW9kZSwgZG9lcyB0aGUgZnJhbWV3b3JrIG9wZXJhdGVzIGlu
IHNpbmdsZSBidWZmZXIgbW9kZSB3aXRob3V0IGFueSBjb21taXQgZm9yIG5ldyB1cGRhdGVzID8N
CjIpIGlmIGFib3ZlIGlzIHRydWUgdGhlbiwgaG93IGRvZXMgZHJpdmVyIGtub3cgaWYgdGhlIGZy
YW1ld29yayBvcGVyYXRlcyBpbiBzaW5nbGUgYnVmZmVyIG1vZGUsIHRvIG1ha2UgYW55IGFwcHJv
cHJpYXRlIGFjdGlvbg0KMykgd2hhdCBpcyB0aGUgZXhwZWN0ZWQgYmVoYXZpb3Igd2l0aCB0aGUg
ZHJpdmVyIGhlcmUgPyBzaG91bGQgaXQgcmV0dXJuIGF0b21pY19jaGVjayBmYWlsdXJlLCBmb3Ig
c2luZ2xlIGJ1ZmZlciBtb2RlIG9wZXJhdGlvbiBvciwgaXQgc2hvdWxkIGV4aXQgUFNSID8NCjQp
IGlzIHRoZXJlIGFueSBISU5UIHBhc3NlZCBkb3duIHRvIHRoZSBkcml2ZXIgc28gdGhhdCB3ZSBj
YW4gYmFuayBvbiBpdCBhbmQgYWN0IGFjY29yZGluZ2x5Pw0KDQpUaGFua3MsDQpWaW5vZCBQLg0K
DQrCoA0K

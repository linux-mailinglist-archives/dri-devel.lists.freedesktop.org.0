Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805887E48B8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 19:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE1E10E662;
	Tue,  7 Nov 2023 18:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C344910E65C;
 Tue,  7 Nov 2023 18:51:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ll2NKCoXP4ihZ+cadUw0wX0bMHVeNZRhBDltHcAk67jzqCQ2ZumSnPtMXv479Q7/xl1ft6diWFQPfcHFmyk8PryegwgW4ZDHHo2Yu7LWbIdvYqNtZ75Xi90sNeNnUYxqQvj54fhc+ztTN/yQiiHoljgSxRTRff0klAS+gfB/vlm2xmHSkYRcsOe5q74zjurltetHcciXGO5TwsOXzgaK0LuMgsZRiAL1v8sAeLtZEfMBevyhBUiectdeRi3pFYrXR6K9hFwMUPncJlepwV2hfUUuYhC53JYZ/vBMQtH8usod7IVkyAbBCa9gQS0a37fvFmSbMozqtrUx6MMpwOaxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvgGPh5HvJZJLjazjoshCc/oCIrnYiSYdn/HZ9Lckqs=;
 b=PgJTwG/F9mhvspmQWX2jiiMm0k8d8K2aVb4F5vAYlV3FPoVBaitNrxxyFMFbz1OWHejVRO+x+UhmwMQo9dTjVWuWYSHKqNHhZD/a0NgdApAJKAwihfULBwNSrXrKTDeeyS/fi3SQTlVLoST72lpSbuh/ginxJTWYhEvpsHmdsEf4sW92WNBZDXKsICrqe2tWDYjv2hjkWeW4rhj4AZYlqEEnH++8hTY4VhRa8uG0Z/n/PUHJHSxt28Oq0LoHrj3tcA8u/AA1Hn1HSz1Za+s6c9GDzzTCAYxFbN1SchUXi4CnOmIt7OITMJijdvqBghKYraDm5YRzFbk9MQTLN8HuuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvgGPh5HvJZJLjazjoshCc/oCIrnYiSYdn/HZ9Lckqs=;
 b=t0APv6htGGD3JWYkn49sv8rKswDifbpmj3dKIqO0l9/WxuZKjjdOBZgt1n1PyaNn36DB/cU3lli+J3E+AtC0nqYq1IcIsJnajTkWbgOOVUtU7a+sWt3heNLBFkvAPLQ16js8d0nXCAwO/J3tNSxI0TpT1ai1damfNB80drr8rjgZgtGnb8a3wxuCEZh9X/cxqt4RMhCVL68j48EK5W9TwKzXB7mLuiz4HfiQRUqu81SsqzJR9oRr72gXBxDxaG4RlC1sccuceAXLK4xaNNI551wdRmzTu3EKkFqhQ46HFZQu5/FmQ4CSdu4Jxtyhc9u1BhmtcvGMagmaNCFrJ35yow==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by LV3PR12MB9403.namprd12.prod.outlook.com (2603:10b6:408:217::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 18:51:01 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 18:51:01 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [Nouveau] [PATCH 3/3] nouveau/gsp: add some basic registry
 entries.
Thread-Topic: [Nouveau] [PATCH 3/3] nouveau/gsp: add some basic registry
 entries.
Thread-Index: AQHaC7nrqx09z4mpykGvaUaC4Zd97LBvP0CA
Date: Tue, 7 Nov 2023 18:51:01 +0000
Message-ID: <5b0b5a7fefa8aac31659e7ade0811f835c576511.camel@nvidia.com>
References: <20231031051943.1957328-1-airlied@gmail.com>
 <20231031051943.1957328-4-airlied@gmail.com>
In-Reply-To: <20231031051943.1957328-4-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|LV3PR12MB9403:EE_
x-ms-office365-filtering-correlation-id: e049cb79-9e15-470c-6ec5-08dbdfc27cdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ctPrK8tbJnL5ZnBcVCrkmHoWi4Ur91L8FtRCcPp2Cj6a5+aDV014MPajAUpAj8oDSnMI+h4prcWxxxOrpzINAAQa+ivuvEkhq0hl2QVk/ZmK+V8n6gOocGdiB5hwxYig7EKc7npoWiVETxBfBL40agovGEL5AJfBnI91dMtCbjFh7P3sl219RCDDfY1exkrh8ygsCVgxIxJsYZsNthYHaeIISmxMpGHIyoKpXFZKRHbZkjzxsW3VeIGCphMEzYalJ8w7XFAcNypmiZicBzAaMzsCXakAXnWtP7ujg0MbV/7OM4tN1GiyHQAXFzZFyhdTr28B39qHIAPXd3vQ1zWxwbvYcQ4wrIkpwz/N1v8Pi9wFsNEErnp54IvjSq6o0buO55+SpxFvcTybAPmt/YCEL89lSKKHJI8CvVYz8tFZr+iey2i5WivmVuFkYPZ0hhuZMLXt+fEsWqHhhyLj4zgl0nurmkatchAyieV+1pp1BejKfex8j0SDrc2rWcLiJBge2gp9JX+DQ3kOac/8Jyf2FLNQ7FjpIm+oeMewvi/Vw2v3qFZ63WdyQRH1PbkZomistnmaNPJuFAlc6TAArRulwi9zBBzyiXtthjL9vnLhEalN87Bzd15CYVFIbN4hEFFM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6512007)(2616005)(478600001)(6506007)(71200400001)(6486002)(2906002)(66446008)(110136005)(26005)(66946007)(66476007)(41300700001)(5660300002)(4001150100001)(66556008)(316002)(76116006)(8676002)(4326008)(8936002)(38070700009)(64756008)(38100700002)(36756003)(122000001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzZ4OE83bEF5VlJQY25XeFh2bE8vZ3o2Q29GLzJ3VmVrK2I4VmJkYWJnM1RM?=
 =?utf-8?B?WHRkL2ZJRjFZQjFiYmM5WnN5dGtIS05xUzRCZEl4MGl1d2hpRHhXL1FsZXVQ?=
 =?utf-8?B?amd4NmFFV2pKd1J3S2ErRjhiWS9McHhudzd3bjJlZThua1ZmOVdLYzlnTkRv?=
 =?utf-8?B?STdremU5Rkw3c0FRNXE1MWxtNGJtTUE5NzRvVXU3NytCUnhnWUI5RHE0Q0Vr?=
 =?utf-8?B?dzdvaXlmSVp5UTVPbS9BbDkvMGJESVdMUlRjRTVxY21Bb0QwV3d4dFNha2RC?=
 =?utf-8?B?STlDdFRzYXp3Y2c4K29DM1dqQXhiSUdZZ3paNVV0VlFTWlRoRlJhK21HcnRh?=
 =?utf-8?B?UGZtUnFRc2ZwZDRVOUZaZU9OL3V3b2pMSlB0bDVvSWpjS2F2NmtIWVpzRHdQ?=
 =?utf-8?B?T1pzWHFPVU5pNFpCTW1RMSs5K0xNcTBKTWk5N3U1MHU4UG9FTjlUSE9va09I?=
 =?utf-8?B?eHlrYnNBdVpVVDFnVVVzNFBjaWJmQzV0Y0lXNzNrb21UV05mUWxpbnB3eTVs?=
 =?utf-8?B?Vkc2V1d1bWlJMkpxVzRVaHFmTEcwTFFZOU4yU0ZmL1RLbkZRcVFiNW01bTAz?=
 =?utf-8?B?Z1R0VmZ1NjFTVXMxQ1lqajJkeTJKcXFIallaMjJpNjRneWZqSWlBNXE4N2tm?=
 =?utf-8?B?dmQwZGkxSjVKUWtiRVhEWGZlRzZmbmduSkFxMTlaaVBrLzMxRWs4S3pQaHhh?=
 =?utf-8?B?OXRoVTBJd0daL1RlN3J2ZjN1N3NucHd2THlQMGhuSEJsMEcvZE1VN2JZeXdF?=
 =?utf-8?B?c0pHVVdiMjJycUgrZVNOd2NRRTl5M0x4Y1ZGOXdmV2Z0SGhpekM4SHNCS0lo?=
 =?utf-8?B?QS9VVURHbGdKUTc0NWVRZ0hpVll2QnppOXU5dXNhK1d1NUpVL3ZkZm9GVWpM?=
 =?utf-8?B?bUhFSTlBN2hML2xwWGxHUkFHSUJKa242RzRlRUI3K0RKNXo2b1RZeTUzcDZ2?=
 =?utf-8?B?SUpaMmlmcWx0cGRIN2NCNTJ1MDB5TmVCLzFoWXgyRzRtRlk4SlJVbHZLS0Vh?=
 =?utf-8?B?cFhhNkd5RSsvcXlWUU5tSGNjdzhqYTBkZ2F3R1paaU03bHBDRmNrdnptVm9Y?=
 =?utf-8?B?aVI5SEhadDE3dG9IR0VTRmNwS3JsY3c5S3pneFJnOFpBRDBZNU0vWnkzWXR6?=
 =?utf-8?B?STU2YndXQW9zek5uUEt3MndWVWFNcGFqRkVCcXRLU1lDTW85dnZwS1VXMTFU?=
 =?utf-8?B?V0FoVlBjeDBSWlRaOEUzTEFnWjJPc3psbDRyTGw4NGJwYVNPeTdac1dOQVdl?=
 =?utf-8?B?NVRwbHVMQndtZjRCdWMzeFh0clJjcWZuc3JKRHFQaGlULzF0UG1EWVd4UC85?=
 =?utf-8?B?TkJtZElLcmg1RXB6TVBzbWVBSjh3ZDJvWm1sdlg1SjRXcnhkQ3BlVmY3L0JH?=
 =?utf-8?B?b0JzRFloQWJpWVdWVldXRjZwY3docmRZSjZ4aHlVbFhuRVBzN2VyT29CcG1C?=
 =?utf-8?B?aEFLNzlHaVVxekFEZTU1RTFpS0Nlbk0yQjhUOE5yRmNaMEpLTGxlZmc0Rmxy?=
 =?utf-8?B?ZVZocVAzUkM3a2NNOSt2RWk1K3NaL3E4c3ZNNEJCaTdTRjJwOFozZzI5Qzd1?=
 =?utf-8?B?TVUxZEt4bWFxbUloYUVJSUpjRXNDOGRNV21TMURlREdwcVl0dnJuTkdSMUhw?=
 =?utf-8?B?aXdWVW9panRacTFlT1FobzZ4d1lRNURTUUhKT1RqSUN1K2dEendENEtlRDln?=
 =?utf-8?B?M0UveDJ1U2x3blQ2eWVYSkhWSDJjOTJuTUJ5RHFvczJGVFg2UzZxSHB6eVd6?=
 =?utf-8?B?Zncya1Jlb2dZU1IyWjEyMkUyUU10TEdjT3FZaERqMXNDWlRNRnlUUitBVnBU?=
 =?utf-8?B?RTN6Q0JnZm5scytORnFsV2tKYnM2ek1GQ2E2ZHRkcjVhUDVrV2pVT3JtNlgr?=
 =?utf-8?B?Zm5xUUJqaWRjdnQvQ29RWEJXQkVjeVFNU3lCc2FVdUdOaWN4RDJXakwzQjFB?=
 =?utf-8?B?aU5jbDhDQkF2MERGRUFPYjd4RjJvTTR4RjRFTHhXcGpXYis4SWpqUHRWU1FK?=
 =?utf-8?B?cnBLOXFERzd6cGU3N0ZOUmMyT2xOeHJiODdjR2psUGVPSFRXSXkvRytSV1Jm?=
 =?utf-8?B?ZHhrS1Y4cDhTaytUY2EwVkw3dmZxT2djTHNLRnEzUmdzM1ZlRThhOS9kcDFz?=
 =?utf-8?Q?IMshVXYKz+ph5OZA0C/st9R/H?=
Content-Type: multipart/alternative;
 boundary="_000_5b0b5a7fefa8aac31659e7ade0811f835c576511camelnvidiacom_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e049cb79-9e15-470c-6ec5-08dbdfc27cdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 18:51:01.4318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GOSUogXbd2H+vLyfoX4ey2VxvNZiRknAmUGImnOyT9M40gGwDCpcR0i+R1A5JOg93WraFGEfwtBPs6yia6h2jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9403
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_5b0b5a7fefa8aac31659e7ade0811f835c576511camelnvidiacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIzLTEwLTMxIGF0IDE1OjE4ICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCisg
ICAgICAgc3RyaW5ncyA9IChjaGFyICopJnJwYy0+ZW50cmllc1tOVl9HU1BfUkVHX05VTV9FTlRS
SUVTXTsNCg0KSSBnZXQgYSBVQlNBTiBpbmRleC1vdXQtb2YtYm91bmRzIGVycm9yIG9uIGJvb3Qg
YXQgdGhpcyBsaW5lLg0KDQpbIDE3Ljc2NTc0Nl0gbm91dmVhdSAwMDAwOjY1OjAwLjA6IGdzcDog
Y21kcTogd3B0ciAxDQpbIDE3Ljc2NTc0OF0gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NClsgMTcu
Nzc0MTcwXSBVQlNBTjogYXJyYXktaW5kZXgtb3V0LW9mLWJvdW5kcyBpbiBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmttL3N1YmRldi9nc3AvcjUzNS5jOjEwNjU6MzMNClsgMTcuNzgzNDQ5XSBp
bmRleCAyIGlzIG91dCBvZiByYW5nZSBmb3IgdHlwZSAnUEFDS0VEX1JFR0lTVFJZX0VOVFJZIFsq
XScNClsgMTcuNzkwMTMyXSBDUFU6IDAgUElEOiAyMzQgQ29tbToga3dvcmtlci8wOjQgTm90IHRh
aW50ZWQgNi42LjAtcmM1KyAjMQ0KWyAxNy43OTAxMzVdIEhhcmR3YXJlIG5hbWU6IEFTVVMgWDI5
OS1BL1BSSU1FIFgyOTktQSwgQklPUyAyMDAyIDA5LzI1LzIwMTkNClsgMTcuNzkwMTM2XSBXb3Jr
cXVldWU6IGV2ZW50cyB3b3JrX2Zvcl9jcHVfZm4NClsgMTcuNzkwMTQzXSBDYWxsIFRyYWNlOg0K
WyAxNy43OTAxNDVdIDxUQVNLPg0KWyAxNy43OTAxNDhdIGR1bXBfc3RhY2tfbHZsKzB4NDgvMHg3
MA0KWyAxNy43OTAxNTVdIGR1bXBfc3RhY2srMHgxMC8weDIwDQpbIDE3Ljc5MDE1Nl0gX191YnNh
bl9oYW5kbGVfb3V0X29mX2JvdW5kcysweGM2LzB4MTEwDQpbIDE3Ljc5MDE2MF0gcjUzNV9nc3Bf
b25laW5pdCsweGY4MS8weDE1MzAgW25vdXZlYXVdDQpbIDE3Ljc5MDI5Ml0gPyBfX2Rldl9wcmlu
dGsrMHgzOS8weGEwDQpbIDE3Ljc5MDI5NV0gPyBfZGV2X2luZm8rMHg3NS8weGEwDQpbIDE3Ljc5
MDI5OF0gdHUxMDJfZ3NwX29uZWluaXQrMHg5Yi8weGQwIFtub3V2ZWF1XQ0KDQpJJ20gbm90IHN1
cmUgd2hhdCB0aGUgZml4IGlzLiAgRG8gd2UgbmVlZCBfX2F0dHJpYnV0ZV9fKChub19zYW5pdGl6
ZSgiYXJyYXktYm91bmRzIikpKSBvbiBQQUNLRURfUkVHSVNUUllfVEFCTEU/DQoNCg==

--_000_5b0b5a7fefa8aac31659e7ade0811f835c576511camelnvidiacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <60BB994ECEB25449848EA63DA7F529D5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5PbiBUdWUs
IDIwMjMtMTAtMzEgYXQgMTU6MTggKzEwMDAsIERhdmUgQWlybGllIHdyb3RlOjwvZGl2Pg0KPGJs
b2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBib3JkZXItbGVm
dDoycHggIzcyOWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXY+KyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO3N0cmluZ3MgPSAoY2hhciAqKSZhbXA7cnBj
LSZndDtlbnRyaWVzW05WX0dTUF9SRUdfTlVNX0VOVFJJRVNdOzxicj4NCjwvZGl2Pg0KPC9ibG9j
a3F1b3RlPg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+SSBnZXQgYSBVQlNBTiBpbmRleC1vdXQt
b2YtYm91bmRzIGVycm9yIG9uIGJvb3QgYXQgdGhpcyBsaW5lLiAmbmJzcDs8L2Rpdj4NCjxkaXY+
PGJyPg0KPC9kaXY+DQo8ZGl2PlsgMTcuNzY1NzQ2XSBub3V2ZWF1IDAwMDA6NjU6MDAuMDogZ3Nw
OiBjbWRxOiB3cHRyIDE8L2Rpdj4NCjxkaXY+WyAxNy43NjU3NDhdID09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PC9kaXY+DQo8ZGl2PlsgMTcuNzc0MTcwXSBVQlNBTjogYXJyYXktaW5kZXgtb3V0LW9m
LWJvdW5kcyBpbiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9nc3AvcjUzNS5j
OjEwNjU6MzM8L2Rpdj4NCjxkaXY+WyAxNy43ODM0NDldIGluZGV4IDIgaXMgb3V0IG9mIHJhbmdl
IGZvciB0eXBlICdQQUNLRURfUkVHSVNUUllfRU5UUlkgWypdJzwvZGl2Pg0KPGRpdj5bIDE3Ljc5
MDEzMl0gQ1BVOiAwIFBJRDogMjM0IENvbW06IGt3b3JrZXIvMDo0IE5vdCB0YWludGVkIDYuNi4w
LXJjNSsgIzE8L2Rpdj4NCjxkaXY+WyAxNy43OTAxMzVdIEhhcmR3YXJlIG5hbWU6IEFTVVMgWDI5
OS1BL1BSSU1FIFgyOTktQSwgQklPUyAyMDAyIDA5LzI1LzIwMTk8L2Rpdj4NCjxkaXY+WyAxNy43
OTAxMzZdIFdvcmtxdWV1ZTogZXZlbnRzIHdvcmtfZm9yX2NwdV9mbjwvZGl2Pg0KPGRpdj5bIDE3
Ljc5MDE0M10gQ2FsbCBUcmFjZTo8L2Rpdj4NCjxkaXY+WyAxNy43OTAxNDVdICZsdDtUQVNLJmd0
OzwvZGl2Pg0KPGRpdj5bIDE3Ljc5MDE0OF0gZHVtcF9zdGFja19sdmwrMHg0OC8weDcwPC9kaXY+
DQo8ZGl2PlsgMTcuNzkwMTU1XSBkdW1wX3N0YWNrKzB4MTAvMHgyMDwvZGl2Pg0KPGRpdj5bIDE3
Ljc5MDE1Nl0gX191YnNhbl9oYW5kbGVfb3V0X29mX2JvdW5kcysweGM2LzB4MTEwPC9kaXY+DQo8
ZGl2PlsgMTcuNzkwMTYwXSByNTM1X2dzcF9vbmVpbml0KzB4ZjgxLzB4MTUzMCBbbm91dmVhdV08
L2Rpdj4NCjxkaXY+WyAxNy43OTAyOTJdID8gX19kZXZfcHJpbnRrKzB4MzkvMHhhMDwvZGl2Pg0K
PGRpdj5bIDE3Ljc5MDI5NV0gPyBfZGV2X2luZm8rMHg3NS8weGEwPC9kaXY+DQo8ZGl2PlsgMTcu
NzkwMjk4XSB0dTEwMl9nc3Bfb25laW5pdCsweDliLzB4ZDAgW25vdXZlYXVdPC9kaXY+DQo8ZGl2
Pjxicj4NCjwvZGl2Pg0KPGRpdj5JJ20gbm90IHN1cmUgd2hhdCB0aGUgZml4IGlzLiAmbmJzcDtE
byB3ZSBuZWVkIF9fYXR0cmlidXRlX18oKG5vX3Nhbml0aXplKCZxdW90O2FycmF5LWJvdW5kcyZx
dW90OykpKSBvbiBQQUNLRURfUkVHSVNUUllfVEFCTEU/PC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2
Pg0KPGRpdj48c3Bhbj48L3NwYW4+PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_5b0b5a7fefa8aac31659e7ade0811f835c576511camelnvidiacom_--

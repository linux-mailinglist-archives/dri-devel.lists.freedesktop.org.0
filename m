Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F197A38C9D1
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 17:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151E26E5AB;
	Fri, 21 May 2021 15:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3400 seconds by postgrey-1.36 at gabe;
 Fri, 21 May 2021 15:10:51 UTC
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5D86E5AB;
 Fri, 21 May 2021 15:10:51 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LED83G001232; Fri, 21 May 2021 14:13:16 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 by mx0a-0039f301.pphosted.com with ESMTP id 38pe3j81pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 14:13:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuaJK0qIzgGtwhSXrqdlIPHi6juChTrYWypjuY77a9e5JkkVJ4DCpTojre6SN/GQicwNaVwIagfRoyisPfvRaribK1U1VJcIBZbrDGF+xW6HVHID8AaatI00LQpZrA+02vZ0W4oPW9y7wFncRX//BPDUDsFB3zSjccx0Qz5HBMvH7tTnbPs+wn6KyXGNr9AJsnSr8b8iuIqIkEIZqFPg0hTuy/eXTzhB+p9mxLwJbhJQe2T17bFEbLT7nCMIkimJ1uDG4Gu72jGpqqHAcZaZPqDh8NgcRc7Ix9qJNW03HR2J0kSKE6ID8gbty0EQ9FGS61JH5TP1eyFJxxQJ98dZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=synphXwSrLm3nRPt+NsSMiX7qe0j9811C0H3uUFQWJc=;
 b=SZMk1h7K8B0hg54pNeWeCea0/CXrOZLHpAT1nudo+cMjA+UA98G+PqXRIc24xNTTROGKfuCs934AJf/1l9NQBmgU2aSTdT6Yy+BNetxk7BhfnLzIZQYXGCQt/qwLgmfsz+sB7UnGyT9luKc2SonZpYGucbO6qTmdn0KxKVTAEws5KrzwkLktvS0GRbCNLogHNXgDsxtS4ij2i0NIr+FYGNk/ABx/LAfeqqWbZx8vrbye73FsvdJfZxK6jgfCrrlbhggPpGdVQEWjh2pL2TYBsER1JCufwGbEMi+N6HU4wMaWEbgGGZLjHKDSIQlXwmrcBgvdR5l54cHk7uSs2TVSAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=synphXwSrLm3nRPt+NsSMiX7qe0j9811C0H3uUFQWJc=;
 b=nbWDGCP0Hn0kqaztMmur09A9hQrDbhQuH0svSqUg8zNNuvSsshQbThNVJjOmjcApv6nUeX5mr+20amGK7BCT3YjQ9Jigikj/afbFS5JwrW41OMqzfyU5i5dIYi5X0/Z8pccdAQbcnpE3U9MhAGrvzziUaUwpQ7lI0htWIJvFBPaGbYu0aJZG9iLGkIvLxntoPv+CH7nmFprFTkvx6EKtzKghVS8l4Wt5ZVU1IFVWINWdVjXu7Y/THEk6km9gdOJ6Di1ERUNDDECNi3ZajD9IUxf4gLWVkpXcvGTL6J4E/dminsi+FVIdDyqJD7Eo4PH3mEyWZs/0fCSM9A+QDBhtmA==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5699.eurprd03.prod.outlook.com (2603:10a6:208:173::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 14:13:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d%6]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 14:13:13 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb is
 the default
Thread-Topic: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb
 is the default
Thread-Index: AQHXTiEf04OO3eCHAEO/U1ulzURrU6rt+psA
Date: Fri, 21 May 2021 14:13:13 +0000
Message-ID: <5c75b291-0b47-92de-e90d-2842b0e5f996@epam.com>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bdf988e-a91a-452c-3aeb-08d91c62925a
x-ms-traffictypediagnostic: AM0PR03MB5699:
x-microsoft-antispam-prvs: <AM0PR03MB56997BA8B412A973FBE143CCE7299@AM0PR03MB5699.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tmGi7CkLNA9HCBt4RJY63mpvC6/lOFd4BzM8h4P0cCkTjo3/w+OEeK7i1Sc1cy7I23DPvgbKPuhKgyXEPQIxoiqz5WL+6byDV8REM0kFONDtd1x7JTA7IFH2s9Wb8fJ3Ld3p6JCsIUPnY4xCaK1ZMw35mUxEog90d6jV9063RjqSsLrfZE5C9+FIpwtK23lz3PJQyVEj12eo7CEEweG/d5OCIJXJHYk97BhjPnVgWA+N0WWYqNCpzRa6dRx6dzKYfRgCUPyuik3YdGRMrXgrV59fAdO+cQfPQiRm/Ai+FYroGE2YJA5EQjYljxkkNPdJoNKIcjzo/Vu2c+rJ2Vz5GOYYTxatC4WeD1dRWA5F2F35dAm6RVuY/RFgqBF76Af/QjnP5f3PRzfYBCfyWA8yTKsN6jRkxnNYou06NjWWQMCenh8W10qT6Gmz4NqmpMj+cxO5G3B1G+lx2YTeNsIGBxSQP4E7SWWTcjIXA5rRMXzrJtTOKT6sXhEIuNctx0Oz2R0z4CSVqWWDBjlhskyymN8qNCTr7De/Npryqb/ZiwCvCfdEdsrE6gfhN8S4ujqd/4jzToHjcNxhMJgxieTbgOl8K57u892un5M7H/slHEG8QwgNh1iOjnLZgya7p1FoYmglyy6KMpT9+Q6IVRkvEiaD8lNsDeNjIJGjuZutSNs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(2906002)(2616005)(478600001)(122000001)(66446008)(6512007)(66556008)(66946007)(38100700002)(91956017)(6486002)(76116006)(4326008)(66476007)(54906003)(86362001)(316002)(64756008)(110136005)(8936002)(7416002)(53546011)(5660300002)(8676002)(186003)(31686004)(558084003)(31696002)(83380400001)(36756003)(26005)(71200400001)(6506007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?b1ZnVDNYN0w1ZVdWUzMzcU4wWjlCOTI5Uzh5QSt5L1NtMXp6QTdOMSszcnlN?=
 =?utf-8?B?cGJPWmo2SktKdE1BdkRHaUY4Z1JqVFUwZTVjbiswWnFrTmtCMlg4TGl0VG9B?=
 =?utf-8?B?YlI5U2IweXlFRmxCcTZjdExYd3lOL0FYeDcyV0hXZlBKK3NVSThmNkRBUnls?=
 =?utf-8?B?My9iMEZNS1lBNkFwWTdkMlJmRHBaeWFwZituSXRZV0tJaFJ1U1Y3Z2xxckQ0?=
 =?utf-8?B?K1pTWW1zcFlMdWdzWVVKNkF3NHJDMWNiZXdnQ3hWazBtd200LzJZZk5XS1F2?=
 =?utf-8?B?SWtic1EwV1JaVGdBRGJHOEJUcjhlOGNrVm8zVk1JTFdiYmhVK3NNZ3FQdDZJ?=
 =?utf-8?B?bkZ2REp2bnFuajM3Mnh3THQ4NTlyTytwRG9rYVlpekI5bVBMMHNsaG5zQzA4?=
 =?utf-8?B?YmtIZTBoMENuMkRkUXJ1UXpQV0c5bWkrdGx0NUZMNzFQZWRDTDluUXdudzBH?=
 =?utf-8?B?Zm0wb1dTTUZZTExYeGJveUNPVEtjaERzZGFZQ3ZJenlkc0VRL29rUm5YMXFs?=
 =?utf-8?B?ZDRqeStiaTMxZzJsYm90VlF6NXUvY3kyYllLa2Ezb3R4eVArU00rTCtXUyt5?=
 =?utf-8?B?ejVJbGFXdmRBRjBGbWpmb2FrcmRwbWhldmNIbER6QXNXVWdlaGZtUHg5VXRC?=
 =?utf-8?B?MkR2VVV5RkRJejE5cVl0c3JRSmVqODRBSFBEN2kyandFV0FvVzJ6UkNsdVRs?=
 =?utf-8?B?M3FpdlFOSDRiRFQ4VUVKYWhmWlB2QzhGZnpJQXBsWEgxWUoxU09kY3hLRGNm?=
 =?utf-8?B?SHFkMlJQYmxKTUdmcnpQTFdjemJUYXRuQStVUFRtVER3S1lXeWx0emc2WlpG?=
 =?utf-8?B?Yjl2eG9LNHJnby9vQlN0aWZBQXZDc2trclpEVWJKc1hnc2ZCWXhjV3k4ZE16?=
 =?utf-8?B?cDZqdk56VE9Dd2dWODhZbzVUL0hFUkRSMnR0S3ZaTG9sUk1sNzNzY0R6WjNE?=
 =?utf-8?B?RGZPN05iSENrZGpyYUh1MVFWdkxmNTFRaXJvMTI2N015dlUvQk9DbkV4NEpo?=
 =?utf-8?B?eGtFQzl1SUdraUtQc0Yrem5ncVh1bEdWK0xXOFN5dFVaUDdoODlFVERESWZh?=
 =?utf-8?B?T01YcHgvUEFrTXd3amUwWE5LQ0NmTkt2WEttczUyL0tuVnl2N1V5QzJDVVhC?=
 =?utf-8?B?ZjU4dzVaSHBuYktneTRMYmVTMVFrcjdXR3dwdjEzbjVzZ2Y0WFVCaVhBaUVl?=
 =?utf-8?B?Ym1RM0djUXFzR0NoR0R3WmxCZVFBZEMxZEhDcHQ1THhScmdhMDB0SlhQcjFU?=
 =?utf-8?B?YUhrZVdsODBmRjZRaWdxT1JZdExIanZmM0l4UWxuUW5RUEViMUxWeFBKelJD?=
 =?utf-8?B?aEhPNXdNZW5oYmd4SzhQSlZiaUFjVFlCa0pRaFdmcDhVdWRRSU5scEllVHNC?=
 =?utf-8?B?Z2cwK2dsMGJHT1E1V1JUdC9zZ2liQWlEYXc1N1IrV1d1OHRPSmtZREM4VE9u?=
 =?utf-8?B?azUzekt6VzVhb0FHMnloeWd5a1FDWGpOc0ozVjVOaytGZkF0QlQ5R3QrdHNl?=
 =?utf-8?B?VGpLMzdOWnpBU2JaWCtYYlZiODVTMSs0aHIwaFFrQzl1U2duUXZjYVJ1Tzhv?=
 =?utf-8?B?SEVRaHN2cE5hM1pWZTZtMFA5MTgyUVVWUzRxU2pteEkwR1JHSExNcTJCQlYr?=
 =?utf-8?B?R2J2d2I3M1FWN2JOeHgrZzhGRXcxSTBSZmw0U2p2YXRpaC9uczJEWWNxSEZi?=
 =?utf-8?B?YmMvM2Z2U0xSSDRZYXZYQ054YWdKdVczSC9tV1dsZERtcGJEVXlYQmkxRXJP?=
 =?utf-8?Q?TtT8xnEMcdgbr+0D6CQgES5ADMtm35SHuiNf+sY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5B75DA063347C46B779C8F812FBED80@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdf988e-a91a-452c-3aeb-08d91c62925a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 14:13:13.6987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cEywJNdU8get7rLb9Yld0YaovUvaWTjG/DVX9Yzk4y0wjgYviEhHRz2i16qk5xKJ80NR93HtaD8Fu7Vp44rUPfHpuMxogbkWjjBRKQRZZd2jj3XUFN9kpMCKGXpwIG25
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5699
X-Proofpoint-GUID: HF7xGuFoEAPBAFQk1W4RxRM9bpA7WEMd
X-Proofpoint-ORIG-GUID: HF7xGuFoEAPBAFQk1W4RxRM9bpA7WEMd
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=955 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210080
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Lechner <david@lechnology.com>, Emma Anholt <emma@anholt.net>,
 Andrew Jeffery <andrew@aj.id.au>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?utf-8?B?Tm9yYWxmIFRyw7hubmVz?= <noralf@tronnes.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yMS8yMSAxMjowOSBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4gR29lcyB0aHJvdWdo
IGFsbCB0aGUgZHJpdmVycyBhbmQgZGVsZXRlcyB0aGUgZGVmYXVsdCBob29rIHNpbmNlIGl0J3MN
Cj4gdGhlIGRlZmF1bHQgbm93Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyPGRh
bmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KQWNrZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCg==

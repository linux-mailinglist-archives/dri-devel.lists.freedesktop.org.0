Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BCB550C23
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 18:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2841B10FDD8;
	Sun, 19 Jun 2022 16:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 23255 seconds by postgrey-1.36 at gabe;
 Sun, 19 Jun 2022 16:42:49 UTC
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14DD10FDD8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 16:42:49 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25J53TRs018067;
 Sun, 19 Jun 2022 10:15:10 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3gs6ryhvse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 19 Jun 2022 10:15:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/zMXplcHDNiIX8lvGo4dzWeCGOXD7Ngd7AJbOSTF1mvmMeRb8UbzkSOeSwA5xOIOSh7+NO06oy8RpODq6h6H6UFqTVQsyE88XWlRntieQ6p5Y7MV9dhV4hwCjVv9rnENdsjYde9BK5fJymbwY3BDIVVCflvixnFPaKv9QlsejSG9HShPcYMxwhLOwSE6XRhYYsoYWseHSZSMKnrAccLvZZwQznVJdVhwwzyk9wO6WXnTln9J5sUb6xl5FplnjVySquE9WlOKo6TzHc+35+oDxt3jm6ny5RuEHUvd0zkSs8zCTqVEq5xqYfDQfcf6VsTHxBXf5kIkhFcL5jdaYYC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGplq3oWsFAAVCxUacIORBzHw9VJIgU9kEPa/BQeFh0=;
 b=keU4dGhDX9/MM+WISXLck9f7/OPDUf4bhS2WXHtArRhT/qmpnNstCFXHFle3VQc+2cxtq/AE6qV7Ld4WFTbQNkwHG9xlpdUW02kBPQg7rmYGNYQI5BtiHrGWNBprC2emj3Uvnt1Z+GS01eAnVx+f+y4UmNTHj8luFSbyPWLHKCIK1fG1nGl5XcaaH/v8UL0PG2wjXxM8+d4NYoq8DYOAq/8WPucaRlUkwqWWrKoHrisdMQvZhHdXmhu6GwFJSx6sdVrXcMgYr7ZlbbSgh/vCVC7uYKdVp54WKWjztLnUpsNIPNBjTcuaiI+2f4rnS+pc1sGj7CQ9Y4kle98PuqLKDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGplq3oWsFAAVCxUacIORBzHw9VJIgU9kEPa/BQeFh0=;
 b=cxGC6P3N6evx7jt4miif8GPmQOZjROHU7xfeQm1T4TdP9Ub3WynnXD6k6btX2GbBA6ErO7rOVbDsczIZ1keZBm0t2a/EVPX+psY0gbYi9ihGMFSiB85XB+wefMoviAhNu6j062FoZtemfqNNtWGtddSzPeZEbbyO+srZIb9dMjIkNqbAIPyI+VQEK3u+lNJeQQuwsd2bpeSN/5GZf8fcYMdciWw6I1GAPWNadaq2dYmYhJv7aUaKX1QTHRA9CNHIWuH1yv7Y2zlT8Z1in79RCAKgmmGQCUY95ayYvRbQEmn9f/YikJlhZZDd3uxLZiTSSsT6AgnpteZvBeBsbTeo/g==
Received: from DU0PR03MB8292.eurprd03.prod.outlook.com (2603:10a6:10:320::10)
 by AM9PR03MB7995.eurprd03.prod.outlook.com (2603:10a6:20b:43e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.20; Sun, 19 Jun
 2022 10:15:06 +0000
Received: from DU0PR03MB8292.eurprd03.prod.outlook.com
 ([fe80::b57f:9009:fba8:a795]) by DU0PR03MB8292.eurprd03.prod.outlook.com
 ([fe80::b57f:9009:fba8:a795%5]) with mapi id 15.20.5353.018; Sun, 19 Jun 2022
 10:15:06 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xen: Add missing VM_DONTEXPAND flag in mmap callback
Thread-Topic: [PATCH] drm/xen: Add missing VM_DONTEXPAND flag in mmap callback
Thread-Index: AQHYY6v/wU3gEIzWM0yI8demCauBeq1Ww4oA
Date: Sun, 19 Jun 2022 10:15:05 +0000
Message-ID: <ab942c02-cc3d-b90b-ea68-d271b6b04638@epam.com>
References: <1652104303-5098-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1652104303-5098-1-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2062dc2-d2c9-4629-3170-08da51dc94ec
x-ms-traffictypediagnostic: AM9PR03MB7995:EE_
x-microsoft-antispam-prvs: <AM9PR03MB7995ECFCBABA0386F96DA341E7B19@AM9PR03MB7995.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /GJe/V2YbRJMnBT3Qh9Su8XWEfVrZ0+OWhvQwtoRtM04RmfTahWWRNpUT56+YvhFdQFZVrU70B/WfFPy8I9RHMqNWNXlNdCd8R1N69KyCbHjYzI1kVBOdwzm58OAcAuwBegKL9oA/PF9Axu9PGemm47pIjSm5tWZ4Nr70+tyy+XjbUGyZbjLpUmPtLzO8BYfNpSnsU5pAD2rP3UXAvQKWcLds9JLXSnfYgA/4XUy0dKA+ZO8IC/V306Eb8ynF/UyQ87OEKjWqOpejdZKQIX8+J8VWR0BzqeaXcLjFl8u+HVZvELDZ7BZn8vUyo2Vsl56frV0ZaTEppFCT3os7icchkt6IBqG3wufPUMHBw93o3NOz4ZoiQzu51Yf7KT+V3NkVlwNbEaoK7ZzmLG/b6xaN2wWb3UfEX6O7PchWHpEL/KrkD2sK1ApqeqVH4RmRPdTXJvCmCsL8uVQVD/M63DKupH+DPvgo+3EI+scWGpJDVMOrPdjKXzdOElsghqky86OxuU8dW6NHwZTQhBlbi3/bgyiUyjUN5OA1+1KG49qlABGUwEqMd495kffZlzL9rrQB2Kzz38127ceRFijflla9MDrIuo/F9lQCFtWOJWaZsO84/kcYMN6+ZtZf2dynDgKqhlOB3RMFpVZgG0EDzDcUq4ux5LDlwaBdf2CHapB6cWpJb2MInhHz8mQZL1reB6ZDBAXkd6B5aBJsfzRO7nsSzL1XHKIeb7o9dOKwc8igQI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR03MB8292.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(45080400002)(5660300002)(71200400001)(8936002)(122000001)(498600001)(83380400001)(6486002)(2616005)(186003)(86362001)(2906002)(6506007)(31696002)(76116006)(53546011)(6512007)(26005)(38070700005)(66556008)(8676002)(4326008)(91956017)(64756008)(66476007)(31686004)(110136005)(66446008)(316002)(38100700002)(54906003)(66946007)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3g4Wm92YnkwZjkzSlBNSVJNZXhEK0cyY3RKYko1QmlEUFA1eUJQWU1EWk54?=
 =?utf-8?B?U3ErRVNXSVBUYnVJNzhVWCtTa3pIUXNVbVl6Vk94bG1xYXVqV3dZWVdwM2t5?=
 =?utf-8?B?SVVyYzc1UXhCdmdRa3Q2MndsQ1dDSkZNWmkyMEJyZHdEUEpRQlgrWi9iN1dH?=
 =?utf-8?B?bk93NGJYRnY3T2pmWUlyZ1Y1RVBLYUxOaHpEak9SYlZaUjE5R0NKQlVoYUtN?=
 =?utf-8?B?S01aakgzd0VvZGMwTU5GTmZERk5Qa09vclI4NnhLZTBQdjE0Ni9mcnZlNFJm?=
 =?utf-8?B?eGVVN0pzWGc2TE1LNHF5SFpka3JORTlHUDFWb2d2ZHc1S0RRc1ovM05GTmpi?=
 =?utf-8?B?Z1dtSDlsbzBzNlZxQUtRQUF1ZVEvakZWdkpOWnJreWNudnNFNWNtVkVxVDkz?=
 =?utf-8?B?VUg1YVo2bWlVYWxJTVJ6bkdUNUpOeUkxOGdsbDdSN1huN05nS3BTbDJYcmhj?=
 =?utf-8?B?OFkrcmdIUWdTVVJ0eHBWeXlVUkZNQ3VzQ0x6dm9mTUJrNlRaaW9SLytmN1dj?=
 =?utf-8?B?THFKRVZvOFAvN2t5NjNuM29nQTlSTE5BbzYxOUEyS1kvYnF6akdIQkx6SENz?=
 =?utf-8?B?dVphbDI0b0hwRUNRa1VBL241eWtYRkFEbUhqQi9Xa1JkcEM1blZFUE5BZnFw?=
 =?utf-8?B?ODAvd2dUZWlSUGFWUTgzOFJqZVdCOWFxRjN4dlBhM2dRN1lwNmFJTVNlMGVP?=
 =?utf-8?B?ZWJ3WldGb2gvYjN4V3NQUFduYnR5bmNYdy9yclI1Y3JEMGtDZG1SajNDakxj?=
 =?utf-8?B?ZG1jQUFJZkZMVHlVNThUdFJTNUNTb0JmdjR3bTc1eVJXVms0S2kwK2FuU055?=
 =?utf-8?B?MmF2YXlSRllJZXhieGZqeEpNSGI5c2xhVzVBOGZKdGQ3Z1RuMFgxRktyb2Zj?=
 =?utf-8?B?R2J4aWZ3aXdLNmVlUUVSNkJ6M0NsSGNpdFB3ZmxvKytFK1hXc2JNZFB4Rk14?=
 =?utf-8?B?SSsxZ2cxanJ4TThaMkVyTlBpWXJlTG53aVFGZC9QemM5ZFBCclJ6cjdYc0J1?=
 =?utf-8?B?K1lFMGdNNTF6RzZEMDZDNkVJejNWK2ZtZFVyRVdhM2Ribm9lM1MxaUtQTnlI?=
 =?utf-8?B?VDhwekxYbTVHUTlVWlF1RS9rZnlDRUdPckIyNlpEcy80ODFJd2xnQ3hzdm1w?=
 =?utf-8?B?blpaVHduL2FET2tEaE1TTkR6NTRqR2paL2p2TkJlSS9PZm4wZ1JqcFhpNzNS?=
 =?utf-8?B?Uk5ZbTl0VTZvbzV5Vk9XdVVEY3pvYkdkYUo0Yk9saVdORUtSeFJYNFhweEZX?=
 =?utf-8?B?L2REbEJybUY2UTFrS1lEaDU4aTVKejdSRGs1TEpLdUlYTGpvWjZjcTc0Y3Rz?=
 =?utf-8?B?OFlVbkdlWmhsVXMva0E0UjZRUXZYUzVWWGhPcUx0bW5aaU5JcGQvVkY4SlJO?=
 =?utf-8?B?M3lwNzdzaG9GUlpxbTZVRlN6NVFUUnc2ck1pMlhrOHA0b2REeXorOURiMW1q?=
 =?utf-8?B?L1VqWTVTNUliemZDUjVHUGFvSFZjRFBBb1JyeEhucXRPaGJ6SHllK3l4dTBk?=
 =?utf-8?B?d0VqN3NML3ZGRThEQXF3ZlhrcHZqL2w4dkdsVnBXQkhvd0xvL29DOHhqTzB4?=
 =?utf-8?B?QmI1WGQ5VWJ0eWxMWHZzRDhINXNubXo1YlJueVZuREQwT3RvemRiK0RMTis0?=
 =?utf-8?B?WDJ3Z1orbEp0bUM3TXFOMUtLc0thVkcvN2QxRDZ0ZDBpZWVsQzB5cCt6bzhU?=
 =?utf-8?B?ZTFScklNRGFJNFgxVjNZTE9hK280bHVlZzkwS1A5YUtUQjdud01teTJHNUlD?=
 =?utf-8?B?SG5VNW12am93blFwdFB4TUhMaWhxZk5DdUtUSi9BTy8wL2NPVG5vL0llRzAw?=
 =?utf-8?B?S1g2NS9JTVE3Ykt0TWVCN0lUY3kxUWVKTlNVTFczZ2x5ZG9QSW9Db1ZLSSti?=
 =?utf-8?B?ejk5Y1JKd3ViTXNER2JieFZCT1pxK2ZKMlA2Ylo0UUVCeEczOWd5bVRXdndq?=
 =?utf-8?B?WUU2clhBQ0l3ZmpHTkRoVEFPNTlJTEt1WTVkR3FnVFd5U2hRYXh4clhmMmRD?=
 =?utf-8?B?aUFiWlc2TjZWbkJIUzVpUWpqenBiQmNIWXN2RjhHNTRVSnc2R2EvQXc0VjVD?=
 =?utf-8?B?dnoxSVpyYVBTMFZYTTdWbW5hWi9uQVJnWUZLdVBBVVBtQ0hTQ0NHek83c25p?=
 =?utf-8?B?TDNTZzVZell5TWtFRjgyVU1aNTl6d1VmdlVZT3c3clpSdWlrakI1SVpYWmVI?=
 =?utf-8?B?N2NwUS9qZjdMcTk1QU1GN1hLS3pENk51cUkxUTE3T0d4cmtZK0R0d1puVWd6?=
 =?utf-8?B?REpCeU54akhwRE1UTkVMM1RLNDVwaGpSdmhwZlplR2RpWjcrMzdiY2QyUUhi?=
 =?utf-8?B?WHZnRitUSTF5Z2l2MHh6R01nM0poSXhjVDdvT1VtOGZjcHY2OHlZVC9NanZ2?=
 =?utf-8?Q?++/BeOkx4TL+PwDzAiaCNZ9/jlx/UubdyoiB2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B17FB5A8F01724479FD5954570B95EAD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB8292.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2062dc2-d2c9-4629-3170-08da51dc94ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2022 10:15:05.9039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oyBCtHlHhulv7CbXO7K3lNNw0qJypoiKb7MqSyOmvSoG7gIlP1136LDpch1cANB6sJJW0IKkPCRdq69AJ21C7vt0kG4U47AvZ7uOEUobTEg3bnCiLKdvRVb9/eNEre4p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7995
X-Proofpoint-GUID: Q2OCQ0eURb-9P5UTJ9uDJza2jrG6TVy-
X-Proofpoint-ORIG-GUID: Q2OCQ0eURb-9P5UTJ9uDJza2jrG6TVy-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-19_09,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=918 adultscore=0
 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206190050
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
Cc: David Airlie <airlied@linux.ie>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Juergen Gross <jgross@suse.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE9sZWtzYW5kciENCg0KT24gMDkuMDUuMjIgMTY6NTEsIE9sZWtzYW5kciBUeXNoY2hlbmtv
IHdyb3RlOg0KPiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVu
a29AZXBhbS5jb20+DQo+DQo+IFdpdGggWGVuIFBWIERpc3BsYXkgZHJpdmVyIGluIHVzZSB0aGUg
ImV4cGVjdGVkIiBWTV9ET05URVhQQU5EIGZsYWcNCj4gaXMgbm90IHNldCAobmVpdGhlciBleHBs
aWNpdGx5IG5vciBpbXBsaWNpdGx5KSwgc28gdGhlIGRyaXZlciBoaXRzDQo+IHRoZSBjb2RlIHBh
dGggaW4gZHJtX2dlbV9tbWFwX29iaigpIHdoaWNoIHRyaWdnZXJzIHRoZSBXQVJOSU5HLg0KPg0K
PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVu
a29AZXBhbS5jb20+DQpSZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtz
YW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KDQo+IC0tLQ0KPiBUaGlzIHBhdGNoIGVsaW1p
bmF0ZXMgYSBXQVJOSU5HIHdoaWNoIG9jY3VycyBkdXJpbmcgcnVubmluZyBhbnkgdXNlciBzcGFj
ZQ0KPiBhcHBsaWNhdGlvbiBvdmVyIGRybSAod2VzdG9uLCBtb2RldGVzdCwgZXRjKSB1c2luZyBQ
ViBEaXNwbGF5IGZyb250ZW5kDQo+IGluIFhlbiBndWVzdCAoaXQgd29ydGggbWVudGlvbmluZyB0
aGUgZnJvbnRlbmQgc3RpbGwgd29ya3MgZGVzcGl0ZSB0aGUgV0FSTklORyk6DQo+DQo+IHJvb3RA
c2FsdmF0b3IteC1oMy00eDJnLXh0LWRvbXU6fiMgbW9kZXRlc3QgLU0geGVuZHJtLWR1IC1zIDMx
OjE5MjB4MTA4MA0KPiAoWEVOKSBjb21tb24vZ3JhbnRfdGFibGUuYzoxODgyOmQydjAgRXhwYW5k
aW5nIGQyIGdyYW50IHRhYmxlIGZyb20gNSB0byA5IGZyYW1lcw0KPiBbICAgMzEuNTY2NzU5XSAt
LS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gWyAgIDMxLjU2NjgxMV0gV0FS
TklORzogQ1BVOiAwIFBJRDogMjM1IGF0IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmM6MTA1NSBk
cm1fZ2VtX21tYXBfb2JqKzB4MTZjLzB4MTgwDQo+IFsgICAzMS41NjY4NjRdIE1vZHVsZXMgbGlu
a2VkIGluOg0KPiBbICAgMzEuNTY2ODg2XSBDUFU6IDAgUElEOiAyMzUgQ29tbTogbW9kZXRlc3Qg
Tm90IHRhaW50ZWQgNS4xOC4wLXJjNC15b2N0by1zdGFuZGFyZC0wMDAwOS1nYWJlODdkNzhiYmM5
ICMxDQo+IFsgICAzMS41NjY5MjJdIEhhcmR3YXJlIG5hbWU6IFhFTlZNLTQuMTcgKERUKQ0KPiBb
ICAgMzEuNTY2OTQwXSBwc3RhdGU6IDYwMDAwMDA1IChuWkN2IGRhaWYgLVBBTiAtVUFPIC1UQ08g
LURJVCAtU1NCUyBCVFlQRT0tLSkNCj4gWyAgIDMxLjU2Njk3M10gcGMgOiBkcm1fZ2VtX21tYXBf
b2JqKzB4MTZjLzB4MTgwDQo+IFsgICAzMS41NjcwMDFdIGxyIDogZHJtX2dlbV9tbWFwX29iaisw
eDc4LzB4MTgwDQo+IFsgICAzMS41NjcwMjZdIHNwIDogZmZmZjgwMDAwOWQwM2JiMA0KPiBbICAg
MzEuNTY3MDQ0XSB4Mjk6IGZmZmY4MDAwMDlkMDNiYjAgeDI4OiAwMDAwMDAwMDAwMDAwMDA4IHgy
NzogZmZmZjAwMDFjNDJkNDNjMA0KPiBbICAgMzEuNTY3MDgwXSB4MjY6IGZmZmYwMDAxYzQyZDRj
YzAgeDI1OiAwMDAwMDAwMDAwMDAwN2U5IHgyNDogZmZmZjAwMDFjMDEzNjAwMA0KPiBbICAgMzEu
NTY3MTE2XSB4MjM6IGZmZmYwMDAxYzAzMTAwMDAgeDIyOiBmZmZmMDAwMWM0MDAyYjgwIHgyMTog
MDAwMDAwMDAwMDAwMDAwMA0KPiBbICAgMzEuNTY3MTUwXSB4MjA6IGZmZmYwMDAxYzQyZDQzYzAg
eDE5OiBmZmZmMDAwMWMwMTM3NjAwIHgxODogMDAwMDAwMDAwMDAwMDAwMQ0KPiBbICAgMzEuNTY3
MTg2XSB4MTc6IDAwMDAwMDAwMDAwMDAwMDAgeDE2OiAwMDAwMDAwMDAwMDAwMDAwIHgxNTogMDAw
MDAwMDAwMDAzNWM4MQ0KPiBbICAgMzEuNTY3MjIwXSB4MTQ6IDAwMDAwMDAwMDAwMDAwMDAgeDEz
OiAwMDAwMDAwMDAwMDAwMDAwIHgxMjogMDAwMDAwMDAwMDAwMDAwMA0KPiBbICAgMzEuNTY3MjU4
XSB4MTE6IDAwMDAwMDAwMDAxMDAwMDAgeDEwOiAwMDAwZmZmZjk1ZDY5MDAwIHg5IDogZmZmZjAw
MDFjNDM1YWMzMA0KPiBbICAgMzEuNTY3Mjk0XSB4OCA6IGZmZmY4MDAxZjY1Y2UwMDAgeDcgOiAw
MDAwMDAwMDAwMDAwMDAxIHg2IDogZmZmZjAwMDFjMjRkZTAwMA0KPiBbICAgMzEuNTY3MzI5XSB4
NSA6IGZmZmY4MDAwMDlkMDNhMTAgeDQgOiAwMDAwMDAwMDAwMDAwMDkwIHgzIDogMDAwMDAwMDAx
MDA0NjQwMA0KPiBbICAgMzEuNTY3MzY1XSB4MiA6IDAwMDAwMDAwMDAwMDA3ZTkgeDEgOiA5ZGQ4
Y2I3YzAyYjFiZDAwIHgwIDogMDAwMDAwMDAxMDAwMDBmYg0KPiBbICAgMzEuNTY3NDAxXSBDYWxs
IHRyYWNlOg0KPiBbICAgMzEuNTY3NDE1XSAgZHJtX2dlbV9tbWFwX29iaisweDE2Yy8weDE4MA0K
PiBbICAgMzEuNTY3NDM5XSAgZHJtX2dlbV9tbWFwKzB4MTI4LzB4MjI4DQo+IFsgICAzMS41Njc0
NjBdICBtbWFwX3JlZ2lvbisweDM4NC8weDVhMA0KPiBbICAgMzEuNTY3NDg0XSAgZG9fbW1hcCsw
eDM1NC8weDRmMA0KPiBbICAgMzEuNTY3NTA1XSAgdm1fbW1hcF9wZ29mZisweGRjLzB4MTA4DQo+
IFsgICAzMS41Njc1MjldICBrc3lzX21tYXBfcGdvZmYrMHgxYjgvMHgyMDgNCj4gWyAgIDMxLjU2
NzU1MF0gIF9fYXJtNjRfc3lzX21tYXArMHgzMC8weDQ4DQo+IFsgICAzMS41Njc1NzZdICBpbnZv
a2Vfc3lzY2FsbCsweDQ0LzB4MTA4DQo+IFsgICAzMS41Njc1OTldICBlbDBfc3ZjX2NvbW1vbi5j
b25zdHByb3AuMCsweGNjLzB4ZjANCj4gWyAgIDMxLjU2NzYyOV0gIGRvX2VsMF9zdmMrMHgyNC8w
eDg4DQo+IFsgICAzMS41Njc2NDldICBlbDBfc3ZjKzB4MmMvMHg4OA0KPiBbICAgMzEuNTY3Njg2
XSAgZWwwdF82NF9zeW5jX2hhbmRsZXIrMHhiMC8weGI4DQo+IFsgICAzMS41Njc3MDhdICBlbDB0
XzY0X3N5bmMrMHgxOGMvMHgxOTANCj4gWyAgIDMxLjU2NzczMV0gLS0tWyBlbmQgdHJhY2UgMDAw
MDAwMDAwMDAwMDAwMCBdLS0tDQo+IHNldHRpbmcgbW9kZSAxOTIweDEwODAtNjAuMDBIekBYUjI0
IG9uIGNvbm5lY3RvcnMgMzEsIGNydGMgMzQNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3hl
bi94ZW5fZHJtX2Zyb250X2dlbS5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zy
b250X2dlbS5jDQo+IGluZGV4IDVhNWJmNGUuLmUzMTU1NGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmMNCj4gQEAgLTcxLDcgKzcxLDcgQEAgc3RhdGljIGlu
dCB4ZW5fZHJtX2Zyb250X2dlbV9vYmplY3RfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdl
bV9vYmosDQo+ICAgCSAqIHRoZSB3aG9sZSBidWZmZXIuDQo+ICAgCSAqLw0KPiAgIAl2bWEtPnZt
X2ZsYWdzICY9IH5WTV9QRk5NQVA7DQo+IC0Jdm1hLT52bV9mbGFncyB8PSBWTV9NSVhFRE1BUDsN
Cj4gKwl2bWEtPnZtX2ZsYWdzIHw9IFZNX01JWEVETUFQIHwgVk1fRE9OVEVYUEFORDsNCj4gICAJ
dm1hLT52bV9wZ29mZiA9IDA7DQo+ICAgDQo+ICAgCS8qDQo=

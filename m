Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EABB4753F5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 08:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B857C10EAB3;
	Wed, 15 Dec 2021 07:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 7120 seconds by postgrey-1.36 at gabe;
 Wed, 15 Dec 2021 07:57:51 UTC
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9D010EA5D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 07:57:51 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BF5h9lg017265;
 Wed, 15 Dec 2021 05:59:10 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cxur5tgjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 05:59:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NObmng8Aks+aH7Fz7A2Onwrez8xAY1mEmDeJUUiIqESkHtPmgN5leZgIOK8qZlweObwLWQ2UEF6b4gl6umzDmUWFVSAEtLMjblKLn5mIypGfYz/Wtj7d0ZHDV8dmI7YJI4/3VednrQolGRf+hFNSx/xjLJ+BdYaeS6LEsqFzy+uCdlSf/nXDPWJS5fb0vFMcjL4Zs7O4vnuvKOdyi91mL2IV60fn/KO0Hec/gc7oep+bJ1WPWO2Tku5YoPT1hs4YTLxKzExQQNKY8gn/i0ruvVEgYCygfQbHlW5NEeBG6d3S8/3Timy3gIT1AdEDxXvuuXGn5pC6zPBAm8IaPJDp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yzu9qg9pMYz/sHVzFhrkMb2YqTKCElESqr5vcTjNKxA=;
 b=AZwrWVZw71MvUGS+RRF1p543wTcvwzAU1CDfoPSfLsvXMIKxKjO4+QweAk2TuY4dqES/qZN7UEakmidOGryVBu1McgFGIv3oi/ClD9r5/vxNbxK7f0IIBZ4qRp87Hmnr3Vqo5yw3DwqsQAL0kNy9aW+D0qLdDt0qNIXPwRVP8WapLXtXwC4yy4MJwC4E/k3bMAs1FL22ujfPXM/syQ7tg/3/XXlvl9Mkgg29C3uSaVWDMqQzgoS5SkJKWXc5+okkAyxxTfLDLc2k9OiMIxhEgvqFANqXl0V+TVG2FSPZIxDZt4u1SAhkdJIEE97R7k/bM8lebi/37M+MsPvd3ktZ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yzu9qg9pMYz/sHVzFhrkMb2YqTKCElESqr5vcTjNKxA=;
 b=dUFyUFwnp3qDx0OckGCbl4O/1a57sqGPMQImYLM+71Sz5pTd4lXmgJdhnNMAFTPQXtZHI/7BOPR571iFE7nr3K6rO8OBZy+gRFkMNvVB7PFeJgehi65ptLm52F3iccxyAzUuK4L2+pmGn0yIN74UirTkXhv1xamCLSuSWDwuYRdvXEXHMCA6AceF0Z1eUk4L8C63u7vX6v9benshv7CGzYLLa1E1LZCE6xkRMcwZ4kqMbtkoH4bOPIm5wa3vFGFXuQ8u5pyH6y62ae1VjUHdVTPQWvbB5Ad1BSqC/tl5Ne2n+0gGNk/1NXZiCh+rfYlfVTPdyTs9g4qucxxJumTOUg==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6963.eurprd03.prod.outlook.com (2603:10a6:20b:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 05:58:57 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%6]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 05:58:57 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 59/60] drm/xen: Add support for the nomodeset kernel
 parameter
Thread-Topic: [PATCH 59/60] drm/xen: Add support for the nomodeset kernel
 parameter
Thread-Index: AQHX8U9WX5q9KBkfbkOEwV0kZKFb+6wzDxIA
Date: Wed, 15 Dec 2021 05:58:57 +0000
Message-ID: <c417c35e-fbff-cb88-6684-7757f218bdf3@epam.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-60-javierm@redhat.com>
In-Reply-To: <20211215010008.2545520-60-javierm@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4b29668-962e-4cc0-0b6d-08d9bf8ffb96
x-ms-traffictypediagnostic: AM9PR03MB6963:EE_
x-microsoft-antispam-prvs: <AM9PR03MB696345B7A39E4A1A7356FBF0E7769@AM9PR03MB6963.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:595;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /1gWB0wvk3UmlDPJ8GHGwuWXMzWne23xv0aDA9EF/bkxBVoCOUdDIjFGjZP4HQZ6e3CymM3IU+fQps9s1O4njyHFjNBrtUD94Q61x+08CoVZv41w84WWTvmaXd1rTHAQ1IFI2qrwuaMv1UBVGkWABhRfFMqRK5pkY/wMvxAHShbfULTD4FAceA8CmNlNU3kEoOqzs6N3bwzo49dsdlQq6tEEsk71g3vGOmRmhXl7oDiAz7MksAcAU1Rr/WDToa8Cab0wn05EAOM76XsacjumrGMoIsjnUgMCESGgy6m7XcSiVyGiswlUw1F82o/3b4Rr+PV/kOg/7iFqwCrLbqsPKuQuxFYz/eVPkLsP5tp+pRJBXJsQYuhXM19IEJrFZ1Q4lFfg3iV4DS5nFf5zMIcC2PSi4o0PzATRr+M6hyUkRULk0yA/6QdLor+nVD+kMm2Bg67+eQu2O4FiU5q0KBM7Esf7Q5eHqQKSggUTVDBTSPEwsi89pYNYhVHSYfUwe1wA9Yi0XN+77N96OPLCf8k1aQerY3SP5hda3BhMhqGImYU/44Q7RNh6ycY8MFAp2RhU94oy48ng1bmD9usjN9GMjVtoXVwvCqCTvRRstW7mQNKTWR3oL9YYR2GCyMIM34WvVkIw2tU65ln+rbJFlwecU+49c+eJHtioPSPgDIN09K/hPJRoBWED1wVOGbg14fO3N6rPjch36ajI2BPLVVAqhh3RxYqfg3bTeu47vb/yfaMft4x8ZJZLqet+t3zd4fGB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(186003)(2906002)(76116006)(66476007)(91956017)(6486002)(66946007)(53546011)(38070700005)(6506007)(64756008)(55236004)(8676002)(66556008)(6512007)(8936002)(71200400001)(66446008)(508600001)(31686004)(86362001)(2616005)(36756003)(316002)(5660300002)(31696002)(122000001)(38100700002)(83380400001)(110136005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nk41QkQwckRab3g1YnFuWlNnZEFzL2VjOE90dXlONHFuTlNlSEFJaTVkbitC?=
 =?utf-8?B?RWRLNGZHUnNYZWdNYnErNU9yd1lHb3pSeFR2aDFTa0RhVVVHbi9Ka3V2Rkpq?=
 =?utf-8?B?bGdjeFZaSTlyYlkvc1BrZXA1ZjdCbU9ndmdxeU5ibnduWWpkdDJXazFlek9h?=
 =?utf-8?B?V01KZ3JucVVnSnJBVThHR1hQUXBqR0Q4RE15TDlrbUl5cFAxTDJpTS9LNHVL?=
 =?utf-8?B?a0QxZVAza0dVUHRaZk9TKzFVYjNzY1FYN0U4dlg1Tk1yM3poaFFBL0srbHJL?=
 =?utf-8?B?eU0zdTVhOEg4SDVidUFjcHVwRnBTeTMyS05RRHpDVjhCcjRxTTF2cjF3djE5?=
 =?utf-8?B?ZjRpM3ZMSHhibng5MVRsbFlWbXhPdGFMbU0yRzhleVJMY0w4YlNCMU5yMEpo?=
 =?utf-8?B?N3Q4ZzBQTGxwVU9zTjM0eTJ3NTJaamZkZDk2T2V4Tjk2eUNmMTMvREdYQ0hj?=
 =?utf-8?B?cVZpdEljaEs1aGpqZzMrb2NUd3hDSGRnZk9vMGtObXpnY1owWkNpb1lXN2hV?=
 =?utf-8?B?WElkRU9vUEl6eFkxNGtKSlBoc0NxT2tBa2Qyb2FQc2RyUzRwMzNyTHU1MXNE?=
 =?utf-8?B?WjNWQzIvV1ZzNVJrRFZrdmlOYkdTUmZ4YXhidnRGTzNCK09McVYrWWJiSXVo?=
 =?utf-8?B?RXlndzlXcE1iNlhlUUc3S3g5eUl0UnA4NTdPeUkvZVVPdmFsMllyU2h5VTFj?=
 =?utf-8?B?SkNrdmc3UkJGMGJPRld5ZkJEemR4Qkt5dDNHMCtMdUZjMmJidVJJRmFQcEdX?=
 =?utf-8?B?clhYTlpTTGNPM21BVmlEVHRDajBwTjRSY0dockN2R2tNYytJM0JZOXVXQThH?=
 =?utf-8?B?S2hQSUZOVHI1NGlLWks0a0dDVFdxOCtPdklvY2JDWE1jSWliQ2F3RGhPSS95?=
 =?utf-8?B?MW5RcWhDemozRFg4OVZIcnRUV1RoSXlRRzRWN25YQkNBUUZ2elNhaDFlWFNz?=
 =?utf-8?B?L1crM2VKbDhrUGM5Q3lXWklvVVUvTE9PbUpsMnFMNHVtVmhlc1prWTJxZDNo?=
 =?utf-8?B?a2s2RFdZdXRWSzdDZmhzQUFnWVFIV0RDRTE0YWgvVWdsMCtFWUVqOVhGZ01p?=
 =?utf-8?B?M0ZqMzlqdHZzSnY4citFLzdkTTZENGJYWkRjVHJpM20wbFEzYnR1TjJFVDFT?=
 =?utf-8?B?NGZiV3FPanlJWEE5SHM1WlNmWG4xUlZRVlVIYSthQ295SDJWSkRVeVZUN2NH?=
 =?utf-8?B?OTdVK2xCT2tNRHhuRTFXZXFML1ErY2RTNWZDY1hOajcrOHFsclFIQW1ER0ZO?=
 =?utf-8?B?VjdOcGtCMkdMaGJUU2Z2aEN4SnBmdGFpZmpJbVkvM3AyYVVWcHc4MWVMbmhG?=
 =?utf-8?B?TDdBTXBVcFJwMjVEbWc0bFl1UkdHam9iUGw1aituZmVQOUVaMzkxc3V0cWVM?=
 =?utf-8?B?WlJhc2lmd2wzS21wQnBwQml1eC9keUtqd0x1VVNZamhCMkFZL1kwanBUQmpI?=
 =?utf-8?B?MnFaVE9HcndoMjd2Y24zamVIMjFQbDU4ZXBLbEo3cDBWUThUWGhQOFl0UmxG?=
 =?utf-8?B?SVp6YzgxRThQSG1KdW9tamx1MjlpNHNpdVNENzYxaW1lVGpDM3IxZnJGYjQ1?=
 =?utf-8?B?QjUvVHRPenZuMS9PdmdvV0NTVVMxbDNtaE1wdXF2YU1qVTlqcCtoK1lFVXU2?=
 =?utf-8?B?ZVFSeHI3SUhRS2pFUGtxSWhZNVFmencyTTNMTHB1UlNxeTJrNFEzNFl5Q0ds?=
 =?utf-8?B?WmhOSzNGRGlwSFRYZ1BWbGdKdUJkQ0VsQ2FKLzRjRmtwUVhBMFRJRWs5MTZx?=
 =?utf-8?B?aWVQRGR6RE9CT2tpVVlPNkUvNURqODl0ZGpkOUpUNDZHcXdnUDlPVVNCWjRT?=
 =?utf-8?B?VmRlcFcvTlVPOU5WT3R2dWx6c3lOK3BmN3hLR3NNMk1EeVpQOFVqREgxOE9v?=
 =?utf-8?B?YU5kd1kwNjZ0UmE3SmVneWt5akFDck9IZWlnSkVrSVBiemNEanhHRXRhR0I5?=
 =?utf-8?B?Z1dJd1lDZWNDbk5hc25GOTB0OWpaTFhURVM5d1EwaE5NRG9qZUZzSDlmS0Iy?=
 =?utf-8?B?bGFaSGRFNG1NWFF5Z2dyeTJLbHRlR1hUa1p1Yk5mbFZsalFzc2NOWlgrRDRF?=
 =?utf-8?B?YklTWVJVbUkwL0cyTzIyUEJZU3FoMDR2UnhIV203NVhmVm93T2JpNkY3STUv?=
 =?utf-8?B?T2JyS05uVnNORThnckZsS25JeGFOSG9UYitWZVoyaVBWWkIrYk1zWDRSMkxR?=
 =?utf-8?B?dHFFVzFzcCtWd0dSZmcrZk9jYklvdU4zdE1OMHVDcE9WN2l4Sjh6ZU8wT2RW?=
 =?utf-8?B?U1V6SUNSSmRlVHN0Wk5Nd0U2ZU1NTHJBNnVDcVRpaDJ0TWwwVU9EdkVQNTd6?=
 =?utf-8?B?ZGlhT0VtcW1nUWxHNi9LZTczcnVTbVRvZkQxczFhcytMbk9ZRmE2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB831FE17E8335469D8BDC4B9096E345@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b29668-962e-4cc0-0b6d-08d9bf8ffb96
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 05:58:57.1154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r0E1PXK2QCIvLPndmtgka0R8ErBEo12HGrOmsGSeIwGQTr2lKN4xQSeZyu7KTWwb+PsE/wQHguN4HVqvSgHlQd2EKW5cWkG/YLPDHjy7fbhhwydOHyCV8+JKwOPhc9rX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6963
X-Proofpoint-GUID: 01mSCEFYlM0KBjpjepzz_Z3uK3rFq0La
X-Proofpoint-ORIG-GUID: 01mSCEFYlM0KBjpjepzz_Z3uK3rFq0La
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_05,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 clxscore=1011 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150035
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEphdmllciENCg0KT24gMTUuMTIuMjEgMDM6MDAsIEphdmllciBNYXJ0aW5leiBDYW5pbGxh
cyB3cm90ZToNCj4gQWNjb3JkaW5nIHRvIGRpc2FibGUgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlk
ZS9rZXJuZWwtcGFyYW1ldGVycy50eHQsIHRoaXMNCj4gcGFyYW1ldGVyIGNhbiBiZSB1c2VkIHRv
IGRpc2FibGUga2VybmVsIG1vZGVzZXR0aW5nLg0KPg0KPiBEUk0gZHJpdmVycyB3aWxsIG5vdCBw
ZXJmb3JtIGRpc3BsYXktbW9kZSBjaGFuZ2VzIG9yIGFjY2VsZXJhdGVkIHJlbmRlcmluZw0KPiBh
bmQgb25seSB0aGUgc3lzdGV3bSBzeXN0ZW0gZnJhbWVidWZmZXIgd2lsbCBiZSBhdmFpbGFibGUg
aWYgaXQgd2FzIHNldC11cC4NCnMvc3lzdGV3bSBzeXN0ZW0vc3lzdGVtDQo+DQo+IEJ1dCBvbmx5
IGEgZmV3IERSTSBkcml2ZXJzIGN1cnJlbnRseSBjaGVjayBmb3Igbm9tb2Rlc2V0LCBtYWtlIHRo
aXMgZHJpdmVyDQo+IHRvIGFsc28gc3VwcG9ydCB0aGUgY29tbWFuZCBsaW5lIHBhcmFtZXRlci4N
Cj4NCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJl
ZGhhdC5jb20+DQo+IC0tLQ0KPg0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9u
dC5jIHwgMyArKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+DQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYyBiL2RyaXZlcnMv
Z3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jDQo+IGluZGV4IDQzNDA2NGM4MjBlOC4uMjBkMTFl
YTc5ZTBmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYw0KPiBAQCAtNDk1
LDYgKzQ5NSw5IEBAIHN0YXRpYyBpbnQgeGVuX2RybV9kcnZfaW5pdChzdHJ1Y3QgeGVuX2RybV9m
cm9udF9pbmZvICpmcm9udF9pbmZvKQ0KPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldjsN
Cj4gICAJaW50IHJldDsNCj4gICANCj4gKwlpZiAoZHJtX2Zpcm13YXJlX2RyaXZlcnNfb25seSgp
KQ0KVGhpcyBpcyBub3QgeWV0IGluIHRoZSB1cHN0cmVhbSBrZXJuZWwsIHJpZ2h0Pw0KPiArCQly
ZXR1cm4gLUVOT0RFVjsNCj4gKw0KPiAgIAlEUk1fSU5GTygiQ3JlYXRpbmcgJXNcbiIsIHhlbl9k
cm1fZHJpdmVyLmRlc2MpOw0KPiAgIA0KPiAgIAlkcm1faW5mbyA9IGt6YWxsb2Moc2l6ZW9mKCpk
cm1faW5mbyksIEdGUF9LRVJORUwpOw0KV2l0aCB0aGUgY29tbWl0IG1lc3NhZ2UgZml4ZWQ6DQpS
ZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hl
bmtvQGVwYW0uY29tPg0KDQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

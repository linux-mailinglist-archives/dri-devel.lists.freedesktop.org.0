Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 658DF7484B2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 15:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B4010E093;
	Wed,  5 Jul 2023 13:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593F810E093
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 13:13:15 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3655laRS015149; Wed, 5 Jul 2023 14:13:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=LJ0Es8xyzBjiUy6tuYfpKZ8Xf4pixWjCvaDK125OlVM=; b=
 CNyheV442A6gON3SOgGKs5CP17jB5xq/bva5AJatFwjFTskK6IzahTEN2TtnX347
 8S3pCv2NmnlxKkuMqgBDSk+r9alM0QVaus4B99fvwhZMDBDF2KdERuFb0qziH/Gx
 WTgTdqC78EgknGRh3K/5+zJLmfjDhaPbe1MdUeuBTWGUGl8ZKHXYhuL/rQ6WFE0C
 VZMtpA36BlMncUjQRm/EbscU548uQf6iDciHun49HXT1VIOsDyHJ6jkZq0JJu3+p
 2DpNZdbI2RvdtqqbE4AuGogxcNqvl05p2Dv0tWCRjbopf4Yrzg8VhkNfqOz/qeQK
 h3CLNf55ZjQ6zozPKDG2oQ==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3rjadqk64b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jul 2023 14:13:03 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 14:13:02 +0100
Received: from outbound.mail.protection.outlook.com (104.47.20.58) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 5 Jul 2023 14:13:02 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaWkkoPSm72v+OU+oUPrIYQqlLZRuAhFvGqqpEi4OlIrmZeLpCZ0ZXZ4UWf4jVfmSPr4V6dGto17COVzYnLaY2JHlTZvFalB+5stRTfBw0jFFNDcHlXrDGl6JCFa0NJw2l6cY42+5chCO71A3wsyoQKuKzR/sHkDocTSPfzNOmwwLftrMHa/vg8CoCh7eNg5r/OZzKxCPTcuNuUBi5ufVasOyHlWJ+OfOtjPHpdFNeYGVXH5oy5cWAqJsGT5oWTwe/FbTyd0LU7cqZkrbX6QRcSSd8tQqOtq0xaTDQmpWCgBYWT9kavEaQMnHLEzYbks4qCrOnqBd1dJ35EVV5VtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJ0Es8xyzBjiUy6tuYfpKZ8Xf4pixWjCvaDK125OlVM=;
 b=L5qSdOGuSnIIvDMuxyiSx3JEWqR0TeiXr1fE2w5e0L4v+JV0DiPbpi3mtJ44s0YcJ2DA2x7gf0vifZv5vo5oF3KY0KqM8LAYjnGlM2hXnqaidZyyRKOgBmaU5bX8lTGnre2hZ8Jf76ub78JYe1NPB9MC8LWzTTSwE9OfFjmmzCevqLm1Ot1tlHXJTP0/EA6at039uMRVIOlzwsAnJu4Gse+YHu6JgNpkXPD13PeXiSAmcoVt4NYF8j7O52EG0bggbwdaZttyqyI4x8/goAbzyjTAy1HoM68A6Zi1FJc7NHWGGfoaRSQNhXZ6PQODWk0mUIRT88Z5jYyIvBWufJhOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJ0Es8xyzBjiUy6tuYfpKZ8Xf4pixWjCvaDK125OlVM=;
 b=VIJsE6hLdpA5O3ZLSDiAtkpnfNpvSXEZpoK3CYAjLK4eal5j4nOwkDorJL9jAZHpg6oQodZRti+ZiuNV0YhpEwtrp3vO/YzLy9uE68+wnVovd52MBrVg0I3QiAm/lnS16hyGwPnrKK7Cgs9P4uOJgQXmJW4QOfQwoQiNzcLiYS8=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWLP265MB6909.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1f9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:13:01 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c%3]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:13:01 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "aford173@gmail.com" <aford173@gmail.com>
Subject: Re: Re: [PATCH v3 07/17] drm/imagination: Add GPU ID parsing and
 firmware loading
Thread-Topic: Re: [PATCH v3 07/17] drm/imagination: Add GPU ID parsing and
 firmware loading
Thread-Index: AQHZr0JsTNePiK3ogEaySh4LuJ0xBA==
Date: Wed, 5 Jul 2023 13:13:01 +0000
Message-ID: <9c11a1afd5e568b3daebc0aff1cf71650adf3dca.camel@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-8-sarah.walker@imgtec.com>
 <CAHCN7xK9rDyeTCFz3nonvEnKWyFeqsPpvzHcoPA6SCXSbTYGkw@mail.gmail.com>
 <1863de9e89872a0330dea51afbef5efaa6a4b831.camel@imgtec.com>
 <CAHCN7x+Fep209VCBfaa8C8Q9sG5wZ==GHt2OGhfhLBRxpMX3kw@mail.gmail.com>
In-Reply-To: <CAHCN7x+Fep209VCBfaa8C8Q9sG5wZ==GHt2OGhfhLBRxpMX3kw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWLP265MB6909:EE_
x-ms-office365-filtering-correlation-id: d3194ed6-c1a0-40af-a380-08db7d598f3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P9jqmgpS3WcPqgw6K902kEtyTSZY7Pssw9MnuhZ1sETrTr7mtr7mbwcv5m0wt6gWBDLMkk55YjwJ9dG4Ilx+GBImRV6WnUGQgr08RXfMdL/np5IZcHgUpR+jF14FWSYaCyCeuZQT16wKtLWS/mYLk0fvoOL5ifvGiRnvONxfQfLSSSjbic34MMRsO1u9ffILIl5L7LVhQ+zNfoXt1lmlZpwk45IeZwxHRoV9X5gAWstWsOTjmLOEKF7rbWwmbr67C+SyYX9F2DNeiL3YBDep9tEozIJbg8tZRm70xBBV2rETE3aMtYI0KZuMtCqBYkv+GoK9l5RSBCogFgBbZOaCC7U2ZVhvSxJ+q9RVQgCnsDNhX/mLd+oBBUg6tGUHBuzn/pFMsMYXuC+eO2TmIaZoeoHoAeLsBiLs6mENkNibuIk5ddNyCzs1x1tDw/IstOh5Eag6Vp/uMnQFe70VUqybPEezvWClSPqFRutLepvcHSp+51AdUFr5pqbDbbVNsFFmAWHmmwP8SYYFBnnjsls1z0ZLa3Ge/m7Jiz+hqpnQUIQz6rB612QquXhvbOy25iGcGYATqnQmYJ1mN01C/to4MAcE9mDfhX0/V6An3zUZmRU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39850400004)(396003)(366004)(136003)(451199021)(5660300002)(8936002)(8676002)(41300700001)(316002)(2906002)(66899021)(83380400001)(7416002)(122000001)(76116006)(6506007)(2616005)(4326008)(6916009)(66476007)(66946007)(38100700002)(66446008)(66556008)(64756008)(86362001)(186003)(53546011)(26005)(54906003)(478600001)(6486002)(38070700005)(36756003)(6512007)(71200400001)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eU5nVHo3SStiRDV0MHZWdy9vbE9Ndk5KcmFTSjNPcENPSzZ2bUd2dVZOV3dz?=
 =?utf-8?B?Z3FZdlVCa2N0MHBaMGZ5SkMwZEZQOFRhZGs4TEl4T2RHeDdybE9qWXhlaVQr?=
 =?utf-8?B?ZkRPOTk4OWNySm4xbE83d0pxUmpNZzVEcUM5cGw4YjRKRGlLWFh0R0ZNRXhP?=
 =?utf-8?B?c0FMYnZDVitqdFhXRGZqWHVhL0c3YmtOeUdaVkIxRVpYU2FLREV0cGxRaHNV?=
 =?utf-8?B?dFpKdnltV2FrQ3hNUzgrbjliOS94bHFtZWZRM2c4bm1INXJhQWpjcS9CT0VW?=
 =?utf-8?B?dUhLMHArVDRhT3NYZlZ2dDFSL1RCL1lHbVFScVhGVEVTaXM4TGNHTmhFWnRO?=
 =?utf-8?B?dm5uajNlcmlsbXQ2L2IwdWFqVEg0MmpQNlVHWVlIWEhoTy9SeWhrbSs3b2Vs?=
 =?utf-8?B?NDB3c0hlNnQrRlNmSFZMeU9ZSWlKTldQNUY1Nk5CbWVGVkQycWxLYzRwSTJ6?=
 =?utf-8?B?NmQwVXlrbDNHZzUrODRGbHNUSGh6eDZBSFFzTUROR0pkRWo5YnR0cW5wWGZ2?=
 =?utf-8?B?allVMUs5MnUyZitjOUdReE4rTXBNbG5HK1pUaS9wdzF1WUwwTE1JaXF2VmY1?=
 =?utf-8?B?NDU5RFQwcnRlc3JCcUpzU3NzU2U3Lzk0eVBxMEFYOFVySGpxN0x6V0JJaDJ4?=
 =?utf-8?B?cmtMSWliTnNkWHN1bC9ZMkVoYzUvY2FhYXhoVTBKUkZDMThuYzFTbG14NkV1?=
 =?utf-8?B?VDJCVmtXS3pSS2dNQnkvbkp5UmU1S3MrRHR6dnZGZXZZZ1FUU3FIVDBRUjR4?=
 =?utf-8?B?aEM2bkhDdzdyTi9VN3NRSno4bDJCZ01OeWMwWlZQdFhUV29qb1NUUDgvQ3pF?=
 =?utf-8?B?RUozQUVzMTJqaEhZL0M4NVpYZjF5VnpXRCtuRXBZb1VIaldYRGJaRmZxenhm?=
 =?utf-8?B?YVR2VFMrejQzVXh0U3BmcWJ4NzU3SldnbXJqRmJySFVpdG00RFdDeHcvUjhF?=
 =?utf-8?B?RERZTDY4eHFzSlN5OFJvK2RiT0xPRWNNdkRyNVorR1VseWp5ZGFiZGNncXhk?=
 =?utf-8?B?SUp3SjJxVGxLck9DTVFWb0xyT2o5ZWR0Rk5DN2JxR1VnZ1V0b3ZaRHVHYnVS?=
 =?utf-8?B?aVlZWFdNck9EbFhnaU02bGNWTW42YU5rR3M0ZUZkOHJsV2lqLzNyWkNSM09Y?=
 =?utf-8?B?RWFrbjRGY2huVG05a3p6bjJwd2d1RGllYU95STBsUndDVW9jaFpXeVR3cnor?=
 =?utf-8?B?Umh0MHhBUFE3RVRQaHBOaGp2TVQreFhBZHErUDViNjlEcE1RbVNSdGJmSmtt?=
 =?utf-8?B?RTZRQW9nQndybnVTcitDcjlmY0RuRzJKN05XaCtOSm9MWmJ5OW9USWJ6d2FV?=
 =?utf-8?B?NTJBODdzRWlJSzl0emxBUHk5Vm4zandnNHpzRENBRkk5aU5tUHBsaWJDeFlt?=
 =?utf-8?B?TnhuU0hHcEVYWEk4eWJJQkRXVWtVRDhxU2pWTmxxSXE3SFZaK2RUenJQMFRv?=
 =?utf-8?B?NUNhREFCVTZoRXNOdTJKcnJwUStnSnZwOXByNkVUMDJPSDAvaEdSbmgzR3I1?=
 =?utf-8?B?VHNtQ2x1RnNKN05tOHU2ekRtd01oeHlPTjRLbm1nV09yUjY3QWRJWlI2TWdM?=
 =?utf-8?B?UGtMNFZJQXdNSzM1Zk9GbjZtUlNIMDN0MEhuSlpmaFA2VS9ISUcvSEVWVUhE?=
 =?utf-8?B?cEdYbHVodkI2V2lXcTdpeGJZWXFFRGtTT3hQQkRnQndROG5OZENOclFhRTZw?=
 =?utf-8?B?c3lQUU9ac1VyQmNCa2R6N2svWDF2R0VWWndhM3dIY0JWRXNxQS9JNGdhd1NX?=
 =?utf-8?B?YVA0KytDNUx1NUpZa3J5WWpxODVQRGZPKy82bElNdzc5c2h1Y0dXekE5UCs1?=
 =?utf-8?B?aENIQkptYnFTdStDWllmRnk0SnVXbThBMEptNC9qY0FQcUVJejZZN01YcjBm?=
 =?utf-8?B?cDQ0dDA5M0VTUzlWaU43N1kwKzVtaHNvU0Zxb3NNVVlLa3VWLzNQMHVZS3h5?=
 =?utf-8?B?cG5nZW1vUnUzS1c2Y3RGbFc5aEFGVVZaYklIR3BYazRqbFViUTlrTDR4NzRO?=
 =?utf-8?B?U3UzZDlKS0p2NEdyTEpPWjByMlVzYloxTHN3RTdsREtFdjZRTW5EMEowMmd3?=
 =?utf-8?B?QTRmL3BxWGNjT3duWTV0R2NPUTZHZEJhcjl1OWVYMTlmYzdhZ1hUa3l6eXJJ?=
 =?utf-8?B?MFAzSFYrWXFpWEhGRnJGcU9BeWxWZW1hWUpmY0RRME1vdC9UK2NhODh3cWVl?=
 =?utf-8?B?RVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCAB894DFE86AF49A10869E1110161A2@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d3194ed6-c1a0-40af-a380-08db7d598f3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 13:13:01.1673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PyA4ypg4DsK/MDkpPSxtrZ3CAASSca1CxuhJm6i+Ymz7BRm3Ab6glWRHwLcciou+GUKctPOUSgqyNGI/5LPhYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6909
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: _kx9k0b9ZKieKide5w-IlPF_eR6l4Nwu
X-Proofpoint-GUID: _kx9k0b9ZKieKide5w-IlPF_eR6l4Nwu
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 Sarah Walker <Sarah.Walker@imgtec.com>,
 "marek.vasut@mailbox.org" <marek.vasut@mailbox.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA2LTI2IGF0IDEwOjM4IC0wNTAwLCBBZGFtIEZvcmQgd3JvdGU6DQo+IE9u
IE1vbiwgSnVuIDI2LCAyMDIzIGF0IDg6MjLigK9BTSBGcmFuayBCaW5ucyA8RnJhbmsuQmlubnNA
aW1ndGVjLmNvbT4gd3JvdGU6DQo+ID4gSGkgQWRhbSwNCj4gPiANCj4gPiBPbiBTYXQsIDIwMjMt
MDYtMTcgYXQgMDc6NDggLTA1MDAsIEFkYW0gRm9yZCB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgSnVu
IDEzLCAyMDIzIGF0IDEwOjIw4oCvQU0gU2FyYWggV2Fsa2VyIDxzYXJhaC53YWxrZXJAaW1ndGVj
LmNvbT4gd3JvdGU6DQo+ID4gPiA+IFJlYWQgdGhlIEdQVSBJRCByZWdpc3RlciBhdCBwcm9iZSB0
aW1lIGFuZCBzZWxlY3QgdGhlIGNvcnJlY3QNCj4gPiA+ID4gZmVhdHVyZXMvcXVpcmtzL2VuaGFu
Y2VtZW50cy4gVXNlIHRoZSBHUFUgSUQgdG8gZm9ybSB0aGUgZmlybXdhcmUNCj4gPiA+ID4gZmls
ZSBuYW1lIGFuZCBsb2FkIHRoZSBmaXJtd2FyZS4NCj4gPiA+IA0KPiA+ID4gSSBoYXZlIGEgUm9n
dWUgNjI1MCB2YXJpYW50LCBidXQgdGhlIEJWTkMgaXMgcmV0dXJuaW5nIGEgc2xpZ2h0bHkNCj4g
PiA+IGRpZmZlcmVudCByZXZpc2lvbiB0aGFuIHRoZSBmaXJtd2FyZSB0aGF0J3MgY3VycmVudGx5
IGF2YWlsYWJsZSwgYW5kDQo+ID4gPiB0aGUgb2xkZXIgZmlybXdhcmUgZm9yIHRoZSB2ZW5kb3Ig
ZHJpdmVyIGRvZXNuJ3Qgd29yayB3aXRoIHRoaXMgbmV3DQo+ID4gPiBjb2RlLg0KPiA+ID4gDQo+
ID4gPiBMaW51eCByZXNwb25kcyB3aXRoIFVuc3VwcG9ydGVkIEJWTkM6IDQuNDUuMi41OC4gIEZy
b20gd2hhdCBJIGNhbg0KPiA+ID4gdGVsbCwgdGhlIGNsb3Nlc3QgYXZhaWxhYmxlIGZpcm13YXJl
IGlzIDQuNDAuMi41MS4NCj4gPiA+IA0KPiA+ID4gV2lsbCB0aGVyZSBiZSBtb3JlIGZpcm13YXJl
IHZhcmlhbnRzIGluIHRoZSBmdXR1cmUgb3Igd2lsbCB0aGVyZSBiZQ0KPiA+ID4gc29tZSBvcHRp
b25zIHRvIGJ1aWxkIHRoZSBmaXJtd2FyZSBzb21laG93Pw0KPiA+IA0KPiA+IFdlIGRvbid0IHBs
YW4gdG8gc3VwcG9ydCB0aGUgU29DIHZlbmRvciBwcm92aWRlZCBmaXJtd2FyZSBiaW5hcmllcyBh
cyB0aGlzIHdpbGwNCj4gPiBtZWFuIGhhdmluZyB0byBkZWFsIHdpdGggbWFueSBkaWZmZXJlbnQg
dmVyc2lvbnMgb2YgdGhlIGZpcm13YXJlIGFuZCBpdHMNCj4gPiBpbnRlcmZhY2UuIFNwZWNpZmlj
YWxseSwgdGhlIGludGVyZmFjZSBjYW4gY2hhbmdlIGluIGJhY2t3YXJkcyBpbmNvbXBhdGlibGUg
d2F5cw0KPiA+IGJldHdlZW4gcmVsZWFzZXMsIGl0IGNoYW5nZXMgYmFzZWQgb24gdGhlIGhhcmR3
YXJlIGZlYXR1cmUgc2V0ICYgYnVncyBhbmQgaXQncw0KPiA+IHNwbGl0IGFjcm9zcyB1c2Vyc3Bh
Y2UgJiB0aGUga2VybmVsLiBUaGlzIG1ha2VzIHRoZXNlIFNvQyBwcm92aWRlZCBmaXJtd2FyZQ0K
PiA+IGJpbmFyaWVzIHZlcnkgZGlmZmljdWx0IHRvIHN1cHBvcnQgaW4gdGhpcyBuZXcgZHJpdmVy
Lg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmVzcG9uc2UuDQo+IA0KPiBUaGF0IG1ha2VzIHNlbnNl
LiAgSSB3b3VsZCBob3BlIHRoYXQgdmFyaW91cyBTb0MgdmVuZG9ycyB3b3VsZCBqdW1wIG9uDQo+
IHRoZSBiYW5kd2Fnb24gdG8gd29yayB3aXRoIHlvdXIgZ3JvdXAgdG8gZ2V0IHRoZWlyIGhhcmR3
YXJlIHN1cHBvcnRlZC4NCj4gPiBBcyBhbiBhbHRlcm5hdGl2ZSwgd2UnbGwgYmUgcmVsZWFzaW5n
IGZpcm13YXJlIGJpbmFyaWVzIGFzIHdlIGFkZCBzdXBwb3J0IGZvcg0KPiA+IG1vcmUgUm9ndWUg
R1BVcy4gV2UnbGwgYWxzbyByZWxlYXNlIGJpbmFyaWVzIHVwb24gcmVxdWVzdCwgaW4gY2FzZSBv
dGhlcnMgaW4gdGhlDQo+ID4gY29tbXVuaXR5IHdhbnQgdG8gd29yayBvbiBzdXBwb3J0IGluIHRo
ZSBtZWFudGltZSAtIHdlJ3JlIGp1c3QgZ2V0dGluZyB0aGluZ3MNCj4gPiBzZXQgdXAgZm9yIHRo
aXMgYXQgdGhlIG1vbWVudC4NCj4gDQo+IFRoZSBNZXNhIHNpZGUgb2YgdGhpbmdzIGFwcGVhcnMg
dG8gYmUgbWlzc2luZyBzb21lIGRvY3VtZW50YXRpb24sIGFuZA0KPiB0aGUgcG93ZXIgVlIgc3R1
ZmYgc3RpbGwgYXBwZWFycyBsaXN0ZWQgYXMgZXhwZXJpbWVudGFsLiAgSXMgdGhlcmUNCj4gc29t
ZSBkb2N1bWVudGF0aW9uIHNvbWV3aGVyZSB0aGF0IHdvdWxkIGV4cGxhaW4gdG8gc29tZW9uZSBo
b3cgdG8gZ28NCj4gYWJvdXQgcG9ydGluZyB0aGUgUm9ndWUgNjI1MCB0byBhIGRpZmZlcmVudCBo
YXJkd2FyZSB2YXJpYW50IG9mIHRoZQ0KPiA2MjUwPyAgSSBkb24ndCByZWFsbHkga25vdyB0aGUg
ZGlmZmVyZW5jZSBiZXR3ZWVuIEJWTkMgb2YgNC40NS4yLjU4DQo+IGFuZCA0LjQwLjIuNTEsIGJ1
dCBJIGNhbid0IGltYWdpbmUgdGhleSBhcmUgZHJhc3RpY2FsbHkgZGlmZmVyZW50Lg0KDQpPbmUg
dGhpbmcgSSBmb3Jnb3QgdG8gbWVudGlvbiBpcyB0aGF0LCBhbG9uZ3NpZGUgdGhlIGZpcm13YXJl
IGJpbmFyaWVzLCB3ZSdsbA0KYWxzbyBwcm92aWRlIHRoZSBjb3JyZXNwb25kaW5nIGRldmljZSBp
bmZvLCBlLmcuIGZvciBNZXNhOg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2Ev
bWVzYS8tL2Jsb2IvZTcxNGIzNTMwMWEzMzE0NTM5OWY4OTM5Y2E4NjRmZmQxNGI0OWRlOS9zcmMv
aW1hZ2luYXRpb24vY29tbW9uL3B2cl9kZXZpY2VfaW5mby5jI0wzMi0xMjUNCg0KV2UgZG9uJ3Qg
aGF2ZSBhbnkgc3BlY2lmaWMgcG9ydGluZyBkb2N1bWVudGF0aW9uLCBidXQgd2UgZGlkIGp1c3Qg
c2VuZCBvdXQgYQ0KTWVzYSBNUiBhZGRpbmcgc29tZSBpbml0aWFsIChiYXNpYykgZG9jdW1lbnRh
dGlvbjoNCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9y
ZXF1ZXN0cy8yMzk5Mg0KDQpJbiB0ZXJtcyBvZiBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSB0d28g
R1g2MjUwIHZhcmlhbnRzLCBpdCBkb2Vzbid0IHNlZW0gdGhhdA0KdGhlcmUncyBhbnl0aGluZyBm
ZWF0dXJlLXdpc2UgdGhhdCB3aWxsIHJlcXVpcmUgYW55IGRyaXZlciBjaGFuZ2VzIHRoYXQgYXJl
DQpzcGVjaWZpYyB0byB0aGUgNC40NS4yLjU4IHZhcmlhbnQgKHRoZSBkaWZmZXJlbnQgZmlybXdh
cmUgc2hvdWxkIGluIHRoZW9yeSBiZQ0Kc3VmZmljaWVudCkuIFRoZXJlIGFyZSBzdGlsbCBzb21l
IGRyaXZlciBjaGFuZ2VzIHJlcXVpcmVkLCBob3dldmVyLg0KDQpBc3N1bWluZyB0aGUgU29DIHlv
dSdyZSBpbnRlcmVzdGVkIGluIGlzIGFscmVhZHkgd2VsbCBzdXBwb3J0ZWQgdXBzdHJlYW0gYW5k
IHRoZQ0KY2xvY2tzLCBwb3dlciBjb250cm9sbGVycywgZXRjIG5lZWRlZCBieSB0aGUgR1BVIGFy
ZSBhbHNvIGFscmVhZHkgc3VwcG9ydGVkIHRoZW4NCnRoZSBmb2xsb3dpbmcgY2hhbmdlcyB3aWxs
IGJlIHJlcXVpcmVkIGF0IGEgbWluaW11bToNCg0KMS4gQSBHUFUgbm9kZSB3aWxsIG5lZWQgYWRk
aW5nIHRvIHRoZSBkZXZpY2UgdHJlZSBzb3VyY2UgZmlsZSBmb3IgeW91ciBzcGVjaWZpYw0KICAg
Ym9hcmQNCjIuIFRoZSBjb21wYXRpYmxlIHN0cmluZyBmb3IgdGhlIEdQVSBub2RlIHdpbGwgbmVl
ZCBhZGRpbmcgdG8gdGhlIGxpc3Qgb2YNCiAgIHN1cHBvcnRlZCBkZXZpY2VzIGluIHRoZSBrZXJu
ZWwgZHJpdmVyIChncmVwIGZvciAiZHRfbWF0Y2giIGluIHRoZSBkcml2ZXINCiAgIGNvZGUpDQoz
LiBUaGUgZGV2aWNlIGluZm8gd2UgcHJvdmlkZSBhbG9uZ3NpZGUgdGhlIGZpcm13YXJlIGJpbmFy
eSB3aWxsIG5lZWQgYWRkaW5nIHRvDQogICB0aGUga2VybmVsIGRyaXZlciBhbmQgTWVzYQ0KNC4g
VGhlIGNvbXBhdGlibGUgc3RyaW5nIGZvciB0aGUgR1BVIGFuZCBkaXNwbGF5IGNvbnRyb2xsZXIg
ZGV2aWNlIHRyZWUgbm9kZXMNCiAgIHdpbGwgbmVlZCBhZGRpbmcgdG8gdGhlIFZ1bGthbiBkcml2
ZXIgKGdyZXAgZm9yICJwdnJfZHJtX2NvbmZpZ3MiIGluIHRoZSBNZXNhDQogICBjb2RlIHRvIHNl
ZSBleGlzdGluZyBleGFtcGxlcykNCiAgIA0KSG9wZWZ1bGx5IHRoYXQgY292ZXJzIGV2ZXJ5dGhp
bmcsIGJ1dCBubyBkb3VidCBJIG1pc3NlZCBzb21ldGhpbmchDQoNCldpdGggcmVzcGVjdCB0byB0
aGUgZXhwZXJpbWVudGFsIHN0YXR1cyBvZiB0aGUgZHJpdmVyLCBJIHRoaW5rIHRoZXJlIGFyZSB0
aHJlZQ0KdGhpbmdzIHRoYXQgbmVlZCB0byBoYXBwZW4gYmVmb3JlIHdlIGNhbiBkcm9wIHRoaXMg
dGFnLiBGaXJzdGx5LCB0aGUga2VybmVsDQpkcml2ZXIgbmVlZHMgdG8gYmUgbWVyZ2VkIHRvIHRo
ZSBrZXJuZWwuIFNlY29uZGx5LCB3ZSBuZWVkIHRvIHBhc3MgS2hyb25vcw0KY29uZm9ybWFuY2Ug
b24gYXQgbGVhc3Qgb25lIG9mIHRoZSBkZXZpY2VzIHdlIHN1cHBvcnQgKG91ciBjdXJyZW50IGZv
Y3VzIGlzIG9uDQp0aGUgQVhFLTEtMTZNKS4gRmluYWxseSwgd2UgbmVlZCB0byB1cHN0cmVhbSBh
bGwgb3VyIE1lc2EgY2hhbmdlcy4gVGhpcyBpcw0Kc29tZXRoaW5nIHRoYXQgd2UndmUgYmVlbiBj
aGlwcGluZyBhd2F5IGF0LCBidXQgd2UgZG8gaGF2ZSBhIGJpZyBiYWNrbG9nIGluIG91cg0KcHVi
bGljIGJyYW5jaCBbMV0uIEkgZXhwZWN0IGl0J3MgZ29pbmcgdG8gYmUgcXVpdGUgc29tZSB0aW1l
IHVudGlsIGFsbCBvZiB0aGlzDQp3b3JrIGlzIGNvbXBsZXRlLg0KDQpXaGlsZSBzbyBtdWNoIGNv
ZGUgaXMgc2l0dGluZyBpbiBkb3duc3RyZWFtIGJyYW5jaGVzIEkgdGhpbmsgaXQncyBnb2luZyB0
byBiZQ0Kc29tZXdoYXQgcGFpbmZ1bCBmb3IgcGVvcGxlIHRvIG1lYW5pbmdmdWxseSBjb250cmli
dXRlIHRvIHRoZSBkcml2ZXIgaXRzZWxmLg0KRWZmb3J0IGlzIHByb2JhYmx5IGJlc3Qgc3BlbnQg
b24gZ2V0dGluZyB0aGUgb3RoZXIgZHJpdmVycywgd2hpY2ggdGhlIEdQVSBkcml2ZXINCmRlcGVu
ZHMgb24sIHVwc3RyZWFtIGZvciB0aGUgcGxhdGZvcm0ocykgeW91J3JlIGludGVyZXN0ZWQgaW4u
DQoNCkp1c3QgdG8gc2F5IHRoYXQgSSdtIGJ5IG5vIG1lYW5zIHRyeWluZyB0byBwdXQgeW91IG9m
ZiBmcm9tIGNvbnRyaWJ1dGluZywgYnV0DQpzaW1wbHkgdHJ5aW5nIHRvIHdhcm4geW91IHRoYXQg
dW50aWwgdGhlIGRyaXZlciBpcyBvdXQgb2YgaXRzIGV4cGVyaW1lbnRhbA0Kc3RhdGUsIGEgbG90
IG9mIHRoaW5ncyBhcmUgZ29pbmcgdG8gYmUgaW4gZmx1eCBhbmQgdGhlIGRldmVsb3BtZW50IHBy
b2Nlc3MgaXMNCmN1cnJlbnRseSBhIGxvdCBtb3JlIGNvbXBsaWNhdGVkLg0KDQpJdCdzIGFsc28g
d29ydGggaGlnaGxpZ2h0aW5nIHRoYXQgd2UncmUgYSBzbWFsbCB0ZWFtIHRhY2tsaW5nIGEgdmVy
eSBsYXJnZSBqb2IhDQpXZSdyZSBkb2luZyBvdXIgYmVzdCB0byBkbyB0aGluZ3MgaW4gdGhlIHBy
b3BlciB3YXkgYW5kIHRvIGxheSBnb29kIGZvdW5kYXRpb25zDQpmb3IgdGhlIGZ1dHVyZS4gV2Un
cmUgYWxzbyBsZWFybmluZyBhbG9uZyB0aGUgd2F5LCBzbyBwbGVhc2UgYmVhciB3aXRoIHVzIDot
KQ0KDQpUaGFua3MNCkZyYW5rDQoNClsxXSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZnJhbmtiaW5ucy9tZXNhLy0vY29tbWl0cy9wb3dlcnZyLW1lc2EtbmV4dC8NCg==

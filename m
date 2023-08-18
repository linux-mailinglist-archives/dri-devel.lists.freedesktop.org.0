Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56945780AA1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 13:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF5F10E4E3;
	Fri, 18 Aug 2023 11:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F14710E4E3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 11:00:28 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37I9tgnS006465; Fri, 18 Aug 2023 12:00:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=b51sjWzhaX1KS/OEM+Z3IUEq8dTbRU9zzUjvKsOoI7I=; b=
 ePd6E8F5EI5SMZ3r6C9dGZ41shtUcAR+q0QdPljThRDn64/8wzsuRkq9276N9HXF
 QpNEhDT0b85cPja0Y6r8mxL7LXd2nzya/mIN5n7WP/TLO46hHmZQ3xOdEcNwNB+Z
 VqEhP50wIMAX2Kk9zsoyEzluxQRnOhKhCKhXDzTgiaSPCpNoyS/7YMoALTfWsl/f
 0X9kDWSIAC2Qe598FBM87C1E5Wc9ELQlUwc1BUc7sGJV1SlKEqsk3UE+V4gnIMdY
 H4PC4YIlW0Gz5+xH/L5MP4PYPmDX4SXbzcuTPTebo1t5yVeqtHLsewYu4b8qIdlC
 8Bk3/rYLA7pTc9rT1HPb3Q==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3se25tvjaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Aug 2023 12:00:06 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 12:00:06 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.106)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 12:00:06 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RneaMDZyhlkTkw/ib3Qg4qCbFb6nslFJ/o6qltFlmL9xdx8oIlvCqDHlYdf+Y/0txEROXmRkDRFYe8apBqmF2N8KAQXuUcYpWEKsn0q9LCTSV7AXn1KzmKwmSOJJkRh8OHWel5+DizN8wMnPZr6GZQ5b1suVi+ysxZv5So/9w8IrDBgOZqbymnxdS6+mk8sQA1lGkKYohkfPwDzeNIUCpHR6G/dJDeZq0M3ZtJTgh/yx+ky+EFtDnrSPrdyYsgeVI1rEK4WRk+uxD0AFgE4sO2dn8E5rTXi151QMoNfr/KaSosK534gJSjvN4Y5/Wj7xQKgbsziT3W//sZUfDPY/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b51sjWzhaX1KS/OEM+Z3IUEq8dTbRU9zzUjvKsOoI7I=;
 b=azCP7zFs0Hjl69mzasoNJQ2jIs9pn81/zrAiKWmuRImar+s58lGRH4k4CWbHodavjY2oLVKvtYGmeiikuwYHYxY3JU1ETbY52zEIMoH3etswOGOYBWHrNmXbV0cFquAws8VcK8DPAMamBU6FGoSD/LZDXNTzZxec8VvEvnyoCgiEsVtefRg8Igsb3R6T2L8He69UCjurd9GYkQ0IvfHVFotW6OK6uyCYjYpsiBEiLfCg1PtZGQ3fMUemWxS8aOBzOoBairak6cA1lldLem/DnK+p/47VWHvKms3Ef8+7Lgc4emDo/REWAqIpHYSwn3r3iGay70b/x8dGmpmn3brQwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b51sjWzhaX1KS/OEM+Z3IUEq8dTbRU9zzUjvKsOoI7I=;
 b=VANwFeGlsAWNpFUcK4Vg+f2A5yM+W7RnD+KIIqI2Z3SoEHgd2C/W9FNmfKCLAfIUWm7mHZXm4rlhennJF3ZZVzXbdBiUAB97l2jhOdlWWFpwLT6gj/+CKK4KBQuMjBeKx0lwg54MqQ3nJXrSudJM69slOHBLKMXD8AveHeGwfwE=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LOYP265MB2112.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 11:00:04 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 11:00:04 +0000
From: Sarah Walker <Sarah.Walker@imgtec.com>
To: "jannh@google.com" <jannh@google.com>
Subject: Re: [EXTERNAL] Re: [PATCH v5 13/17] drm/imagination: Implement
 context creation/destruction ioctls
Thread-Topic: [EXTERNAL] Re: [PATCH v5 13/17] drm/imagination: Implement
 context creation/destruction ioctls
Thread-Index: AQHZ0BtYKkVQLzOQUUuVaoudFnAQjq/vF+yAgADOIwA=
Date: Fri, 18 Aug 2023 11:00:04 +0000
Message-ID: <8fb0a30a06e31357128b4d2248a923beff80d029.camel@imgtec.com>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <20230816082531.164695-14-sarah.walker@imgtec.com>
 <CAG48ez2xv2i_gObpRZ7v0O8x+dJpHT9a3gcvte7R9_S7bvUNgg@mail.gmail.com>
In-Reply-To: <CAG48ez2xv2i_gObpRZ7v0O8x+dJpHT9a3gcvte7R9_S7bvUNgg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB4817:EE_|LOYP265MB2112:EE_
x-ms-office365-filtering-correlation-id: d126531a-2fe7-43ed-295a-08db9fda470c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MyvHFEXWxteXu2EVlN1BZUva//M/FN0iNF2XfQEuGhV0aYfM4h9bDePEZWup6pMXwWw3vI5l6Ky6oYyoQrPV/dNywbDynDiC9pG1zGAJSgD1LcT2aIEb8tZVURORx3BB4sleDtzsuAtPyp4xq2FGIFmO+5gV3NsW29SsVP8gDzAz6vyJnhpQ6A4KVaLaD+ZADqh9gbdLfenfPXHfbUfZdu6NPdyrjErehig2g2hBjlb6RlcrNxIz3f2BKxoUQNDUs8thSMQJlJmSb6iRWpPIZuS2eGinQaeDFLTZ2S3aOjMYXUGHtMQUEoPdpYcVFsudcPo0tnaVwQpNP9Cd0k82SeA5NS0/SsAB0zG/PHNoqsKJFoY694Trvc3sVN78GoUJvZrEa3RtaBdzd1L8Uf3olAEzZhitOkUZMf/aQ3kYsLcItSkg4ryxoTEEvKKk4gyZyLI4s4O2LGZjihrOMVVX+MTsx0numDNp0uUZ1nx8vmyw5NaeKlVqnLEq7p2+topDI0yt3DKhCUkNfj2nCFKh7xjEh+8g8Fhe+9GznenlVITof2dBNrc8KU/alNqu09cfFfrwIzB52urblJDyKwj5GJu/27A1IjrSNMAkEnMVVIIindUt4cF/+pwrE/9+e6u0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39850400004)(366004)(136003)(346002)(451199024)(186009)(1800799009)(91956017)(76116006)(5660300002)(2616005)(41300700001)(2906002)(66476007)(66446008)(66556008)(316002)(6916009)(66946007)(64756008)(54906003)(7416002)(8676002)(4326008)(8936002)(478600001)(86362001)(71200400001)(6486002)(53546011)(38070700005)(38100700002)(6506007)(122000001)(6512007)(36756003)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VE8yU200dS80cmFvQkVacjVEYk05UGxYNVpWSTRxYjc4eWlnU2s1U0RrMy9Z?=
 =?utf-8?B?SDdyOTdBQWxRcUFMNUlrQlNuRGlMZFc2QUtPN2k3ekRnRy9TblBZYjNwS2xi?=
 =?utf-8?B?NG5JNGFlVko0TFFnTFFvZGpCY2xCZVF0QzIxV1VZTGdsTkFzN2ZBbm9XNW9J?=
 =?utf-8?B?U21QZE9BOG1nank1VVZCTUowWFB5dituc2pMRWFlc2taYnc4Sk1Pckt6UzRt?=
 =?utf-8?B?cTFrZFVnNmlmUGhnNEZsVjR6NnNOK2o1clpjU3JtcmNIRVZXd3VjbTI3eXZH?=
 =?utf-8?B?OUFmVXNkQWRrRnY5dXlzckNHVEduelN4b2FZaWxWYS9ZUy84Qys3bmpTVHdH?=
 =?utf-8?B?N3lnMVZydGNqVDUwWEdnZWZuOXUrRjhFT1c0Z1hkZDc3S2dMT3puOFdYbVhI?=
 =?utf-8?B?ZW1XZkVwK3dpdEZuUDRJUG9tZjlvc2tNa2lOd3VJM3E1ekZOU1FKUExINFFq?=
 =?utf-8?B?cDNhRkVaTUN6UXRlbG8wcDU5U1F0eVVJTDBESDZNZXN3VUlVR0FFNmQ5dUFE?=
 =?utf-8?B?c2hTT004eXlpT3R2RzZ0bmgwTmF3YmdTU3FvUEVCSnFINTZpR0JZR0YwMith?=
 =?utf-8?B?UzVLa0tSenFsc05YeUZXSE9VMTErM2NuRVJ5VHpxZHRxQXcvMVgzQUFJd2tl?=
 =?utf-8?B?MjBZeFh5QWlFVnpyTmtPZmU5V1gzbUREOTJtenNxVGVWcENOSVVmZkp0N2p1?=
 =?utf-8?B?TTFiT3RNb1U0SW02WjdrREdHQ3dTSHJYWWhYMTljUTVXOTNJcHBTZkNNNUxZ?=
 =?utf-8?B?dzFvaXdiK2ovTXFaQVQ1a2lGcHRsNnpJTmdYNW8yMnI5bzhyTXpiakUvRE9Z?=
 =?utf-8?B?ZjcxdHQ1YTRCQXlCK3RSYndVT25jeXNPOHVOMGc4VTRWMHBpM3ZXdTRMeWF4?=
 =?utf-8?B?djFCNVpob3RJaHhHYVBtZkpMRTNUcUtQNVhSMjVQSjZabUxrU3JzU3ppeitw?=
 =?utf-8?B?b013RFZBdEVaY3VqRVhMcWVFQ051cW9FUW9qNWVON3F3bEE3alprWjl0TFhh?=
 =?utf-8?B?UWg4a3huZFVnVi9oVFVpdDViNVlCL1BnZ2JPbWRyeFFvelEwbHRYV3NGUjF5?=
 =?utf-8?B?clE5MnFORGdadHZwOUViM29BUGNzWFVxcWRrVzJaRVBQN0crRHp2cms1MXVZ?=
 =?utf-8?B?YUFjUEE4TlBJVG8zQzFReFU1SGtsQ0ZtRHhxNVZTQWtLTXlNeWtGeTVhRzNh?=
 =?utf-8?B?RjcvaDVHVlpranZEUGp3eUNoL3NyMzhnb2JPR2JqT3VsSjNVTk5uUFlNR2lw?=
 =?utf-8?B?SWVNWUdDbjhkYm5INmh3RHQ1Z1dhYUprT21Bd1d6ZlAwd1dOQ3ZWTlFNR1Vp?=
 =?utf-8?B?QStjRmowWEtCZkNMbnFDenRDd2tndkVBNUk5Y0dVai9wWEZ2K0JqeVExazFW?=
 =?utf-8?B?RWxzempCVHZjUXcwYkJ0K1NOaEJqb2Z6N3VvcmZuL01GVW1FdFZpbmtUb2gw?=
 =?utf-8?B?anVsS3E2bmN2aEROWEcxcTBCL1BXbDlYbkQvbENpREk4UnFOK2kxaEpBRVhs?=
 =?utf-8?B?cytDMktLcFhHQkdmc0t4QlRoSGtNZXNVWWZrbmlCbVVFbStaWUU1MUlpU2Nk?=
 =?utf-8?B?K1VkL1FESjRnS3pjZm1IWSt3RFJFNDFpMThMTzh3WGM5VXRhOGpnQ0ZYZDhV?=
 =?utf-8?B?Qncyek5POVp0VktCdS8zMTZPNkRIT0tWME9NUmJRRlU1aHFGQktGUEdlcU13?=
 =?utf-8?B?b1NvTlVsZ1BUTGJQL1pkWEplMUdTOVlaNUVJWXlXZFpKNk8yOTcyZjN1TE9P?=
 =?utf-8?B?WFJTaTFLd3cxeG5KQkhJRFJsQkVyRWFaeFJ5M21tb202akpFeUY2WVczUlNJ?=
 =?utf-8?B?ME1aNXYwSVdZN1JCeEJ4bnpXZWZaWlNwQVd3aEk0ODl1RytWSnUralovQ2o1?=
 =?utf-8?B?YmpoWU1lUE1KMVVwdG4rWTlTY0Z4UlJYaEJqZExWbldPSjlmeEhTQmFEUzYv?=
 =?utf-8?B?aWtqQStCVjZwYnpHeHVZT2l4QTJIMlBGWVA1RmJLbGFwRmtrS0pGbHBud09o?=
 =?utf-8?B?V0Ywd1kwSlRSZFJYSDhQMmFveEhrZ0xVSlZzaSszWlFMQzh0RGIzTXRxMVhi?=
 =?utf-8?B?TmJwekp6dEtlWXB2em4zdUc3SjYySUY2UkZzMjRTbjd1am92WU0yanA1ZG50?=
 =?utf-8?B?SldyQ0JTeXllN3NRYjdyVWtGM0Y4SWNxdWM0S01XNlJaVEIwYzhFcTN2c1d0?=
 =?utf-8?B?emc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCB07141481297459B38327E0B92403D@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d126531a-2fe7-43ed-295a-08db9fda470c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 11:00:04.6433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MFkssaZJE67q96fh4/13/fzNqckwo5c7IU8aJqWcwRjwPgWmPc+GhcT2n45/gLD+XqKWl3b4OYVSS/C5ABdf8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2112
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: CiLt4Q0LMhY1i4j3JZ6CWO8k3TCCAbwf
X-Proofpoint-GUID: CiLt4Q0LMhY1i4j3JZ6CWO8k3TCCAbwf
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
 "mripard@kernel.org" <mripard@kernel.org>,
 "hns@goldelico.com" <hns@goldelico.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>, "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA4LTE4IGF0IDAwOjQyICswMjAwLCBKYW5uIEhvcm4gd3JvdGU6DQo+ICoq
KiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZXMgZnJvbSBhIHNvdXJjZSBub3Qga25vd24g
dG8gSW1hZ2luYXRpb24gVGVjaG5vbG9naWVzLiBUaGluayBiZWZvcmUgeW91IGNsaWNrIGEgbGlu
ayBvciBvcGVuIGFuIGF0dGFjaG1lbnQgKioqDQo+IA0KPiBPbiBXZWQsIEF1ZyAxNiwgMjAyMyBh
dCAxMDoyNeKAr0FNIFNhcmFoIFdhbGtlciA8c2FyYWgud2Fsa2VyQGltZ3RlYy5jb20+IHdyb3Rl
Og0KPiA+IEltcGxlbWVudCBpb2N0bHMgZm9yIHRoZSBjcmVhdGlvbiBhbmQgZGVzdHJ1Y3Rpb24g
b2YgY29udGV4dHMuIENvbnRleHRzIGFyZQ0KPiA+IHVzZWQgZm9yIGpvYiBzdWJtaXNzaW9uIGFu
ZCBlYWNoIGlzIGFzc29jaWF0ZWQgd2l0aCBhIHBhcnRpY3VsYXIgam9iIHR5cGUuDQo+IFsuLi5d
DQo+ID4gKy8qKg0KPiA+ICsgKiBwdnJfY29udGV4dF9jcmVhdGUoKSAtIENyZWF0ZSBhIGNvbnRl
eHQuDQo+ID4gKyAqIEBwdnJfZmlsZTogRmlsZSB0byBhdHRhY2ggdGhlIGNyZWF0ZWQgY29udGV4
dCB0by4NCj4gPiArICogQGFyZ3M6IENvbnRleHQgY3JlYXRpb24gYXJndW1lbnRzLg0KPiA+ICsg
Kg0KPiA+ICsgKiBSZXR1cm46DQo+ID4gKyAqICAqIDAgb24gc3VjY2Vzcywgb3INCj4gPiArICog
ICogQSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuDQo+ID4gKyAqLw0KPiA+ICtpbnQg
cHZyX2NvbnRleHRfY3JlYXRlKHN0cnVjdCBwdnJfZmlsZSAqcHZyX2ZpbGUsIHN0cnVjdCBkcm1f
cHZyX2lvY3RsX2NyZWF0ZV9jb250ZXh0X2FyZ3MgKmFyZ3MpDQo+ID4gK3sNCj4gPiArICAgICAg
IHN0cnVjdCBwdnJfZGV2aWNlICpwdnJfZGV2ID0gcHZyX2ZpbGUtPnB2cl9kZXY7DQo+ID4gKyAg
ICAgICBzdHJ1Y3QgcHZyX2NvbnRleHQgKmN0eDsNCj4gPiArICAgICAgIGludCBjdHhfc2l6ZTsN
Cj4gPiArICAgICAgIGludCBlcnI7DQo+ID4gKw0KPiA+ICsgICAgICAgLyogQ29udGV4dCBjcmVh
dGlvbiBmbGFncyBhcmUgY3VycmVudGx5IHVudXNlZCBhbmQgbXVzdCBiZSB6ZXJvLiAqLw0KPiA+
ICsgICAgICAgaWYgKGFyZ3MtPmZsYWdzKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4gPiArDQo+ID4gKyAgICAgICBjdHhfc2l6ZSA9IGdldF9md19vYmpfc2l6ZShhcmdz
LT50eXBlKTsNCj4gPiArICAgICAgIGlmIChjdHhfc2l6ZSA8IDApDQo+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybiBjdHhfc2l6ZTsNCj4gPiArDQo+ID4gKyAgICAgICBjdHggPSBremFsbG9jKHNp
emVvZigqY3R4KSwgR0ZQX0tFUk5FTCk7DQo+ID4gKyAgICAgICBpZiAoIWN0eCkNCj4gPiArICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICsgICAgICAgY3R4LT5kYXRh
X3NpemUgPSBjdHhfc2l6ZTsNCj4gPiArICAgICAgIGN0eC0+dHlwZSA9IGFyZ3MtPnR5cGU7DQo+
ID4gKyAgICAgICBjdHgtPmZsYWdzID0gYXJncy0+ZmxhZ3M7DQo+ID4gKyAgICAgICBjdHgtPnB2
cl9kZXYgPSBwdnJfZGV2Ow0KPiA+ICsgICAgICAga3JlZl9pbml0KCZjdHgtPnJlZl9jb3VudCk7
DQo+ID4gKw0KPiA+ICsgICAgICAgZXJyID0gcmVtYXBfcHJpb3JpdHkocHZyX2ZpbGUsIGFyZ3Mt
PnByaW9yaXR5LCAmY3R4LT5wcmlvcml0eSk7DQo+ID4gKyAgICAgICBpZiAoZXJyKQ0KPiA+ICsg
ICAgICAgICAgICAgICBnb3RvIGVycl9mcmVlX2N0eDsNCj4gPiArDQo+ID4gKyAgICAgICBjdHgt
PnZtX2N0eCA9IHB2cl92bV9jb250ZXh0X2xvb2t1cChwdnJfZmlsZSwgYXJncy0+dm1fY29udGV4
dF9oYW5kbGUpOw0KPiA+ICsgICAgICAgaWYgKElTX0VSUihjdHgtPnZtX2N0eCkpIHsNCj4gPiAr
ICAgICAgICAgICAgICAgZXJyID0gUFRSX0VSUihjdHgtPnZtX2N0eCk7DQo+ID4gKyAgICAgICAg
ICAgICAgIGdvdG8gZXJyX2ZyZWVfY3R4Ow0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAg
ICAgIGN0eC0+ZGF0YSA9IGt6YWxsb2MoY3R4X3NpemUsIEdGUF9LRVJORUwpOw0KPiA+ICsgICAg
ICAgaWYgKCFjdHgtPmRhdGEpIHsNCj4gPiArICAgICAgICAgICAgICAgZXJyID0gLUVOT01FTTsN
Cj4gPiArICAgICAgICAgICAgICAgZ290byBlcnJfcHV0X3ZtOw0KPiA+ICsgICAgICAgfQ0KPiA+
ICsNCj4gPiArICAgICAgIGVyciA9IGluaXRfZndfb2JqcyhjdHgsIGFyZ3MsIGN0eC0+ZGF0YSk7
DQo+ID4gKyAgICAgICBpZiAoZXJyKQ0KPiA+ICsgICAgICAgICAgICAgICBnb3RvIGVycl9mcmVl
X2N0eF9kYXRhOw0KPiA+ICsNCj4gPiArICAgICAgIGVyciA9IHB2cl9md19vYmplY3RfY3JlYXRl
KHB2cl9kZXYsIGN0eF9zaXplLCBQVlJfQk9fRldfRkxBR1NfREVWSUNFX1VOQ0FDSEVELA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3R4X2Z3X2RhdGFfaW5pdCwgY3R4
LCAmY3R4LT5md19vYmopOw0KPiA+ICsgICAgICAgaWYgKGVycikNCj4gPiArICAgICAgICAgICAg
ICAgZ290byBlcnJfZnJlZV9jdHhfZGF0YTsNCj4gPiArDQo+ID4gKyAgICAgICBlcnIgPSB4YV9h
bGxvYygmcHZyX2Rldi0+Y3R4X2lkcywgJmN0eC0+Y3R4X2lkLCBjdHgsIHhhX2xpbWl0XzMyYiwg
R0ZQX0tFUk5FTCk7DQo+ID4gKyAgICAgICBpZiAoZXJyKQ0KPiA+ICsgICAgICAgICAgICAgICBn
b3RvIGVycl9kZXN0cm95X2Z3X29iajsNCj4gPiArDQo+ID4gKyAgICAgICBlcnIgPSB4YV9hbGxv
YygmcHZyX2ZpbGUtPmN0eF9oYW5kbGVzLCAmYXJncy0+aGFuZGxlLCBjdHgsIHhhX2xpbWl0XzMy
YiwgR0ZQX0tFUk5FTCk7DQo+ID4gKyAgICAgICBpZiAoZXJyKQ0KPiA+ICsgICAgICAgICAgICAg
ICBnb3RvIGVycl9yZWxlYXNlX2lkOw0KPiANCj4gVGhpcyBiYWlsb3V0IGxvb2tzIGEgYml0IGRv
ZGd5LiBXZSBoYXZlIGFscmVhZHkgaW5zZXJ0ZWQgY3R4IGludG8NCj4gJnB2cl9kZXYtPmN0eF9p
ZHMsIGFuZCBub3cgd2UganVzdCB0YWtlIGl0IG91dCBhZ2Fpbi4gSWYgc29tZW9uZSBjb3VsZA0K
PiBjb25jdXJyZW50bHkgY2FsbCBwdnJfY29udGV4dF9sb29rdXBfaWQoKSBvbiB0aGUgSUQgd2Ug
anVzdCBhbGxvY2F0ZWQNCj4gKEkgZG9uJ3QgdW5kZXJzdGFuZCBlbm91Z2ggYWJvdXQgd2hhdCdz
IGdvaW5nIG9uIGhlcmUgYXQgYSBoaWdoIGxldmVsDQo+IHRvIGJlIGFibGUgdG8gdGVsbCBpZiB0
aGF0J3MgcG9zc2libGUpLCBJIHRoaW5rIHRoZXkgd291bGQgYmUgYWJsZSB0bw0KPiBlbGV2YXRl
IHRoZSBjdHgtPnJlZl9jb3VudCBmcm9tIDEgdG8gMiwgYW5kIHRoZW4gb24gdGhlIGJhaWxvdXQg
cGF0aA0KPiB3ZSdsbCBqdXN0IGZyZWUgdGhlIGN0eCB3aXRob3V0IGxvb2tpbmcgYXQgdGhlIHJl
ZmNvdW50Lg0KPiANCj4gSWYgdGhpcyBjYW4ndCBoYXBwZW4sIGl0IG1pZ2h0IGJlIGEgZ29vZCBp
ZGVhIHRvIGFkZCBhIGNvbW1lbnQNCj4gZXhwbGFpbmluZyB3aHkuIElmIGl0IGNhbiBoYXBwZW4s
IEkgZ3Vlc3Mgb25lIHdheSB0byBmaXggaXQgd291bGQgYmUNCj4gdG8gcmVwbGFjZSB0aGlzIGxh
c3QgYmFpbG91dCB3aXRoIGEgY2FsbCB0byBwdnJfY29udGV4dF9wdXQoKT8NCg0KWWVzLCBJIHRo
aW5rIHlvdSdyZSBjb3JyZWN0IGhlcmUuIEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhbnl0aGluZyBp
biB0aGUgY3VycmVudA0KcGF0Y2ggc2V0IHRoYXQgY2FuIGFjdHVhbGx5IHRyaWdnZXIgdGhpcywg
YnV0IGl0IGRlZmluaXRlbHkgbmVlZHMgZml4aW5nLg0KDQpUaGFua3MsDQpTYXJhaA0KDQo+IA0K
PiANCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gMDsNCj4gPiArDQo+ID4gK2Vycl9yZWxlYXNl
X2lkOg0KPiA+ICsgICAgICAgeGFfZXJhc2UoJnB2cl9kZXYtPmN0eF9pZHMsIGN0eC0+Y3R4X2lk
KTsNCj4gPiArDQo+ID4gK2Vycl9kZXN0cm95X2Z3X29iajoNCj4gPiArICAgICAgIHB2cl9md19v
YmplY3RfZGVzdHJveShjdHgtPmZ3X29iaik7DQo+ID4gKw0KPiA+ICtlcnJfZnJlZV9jdHhfZGF0
YToNCj4gPiArICAgICAgIGtmcmVlKGN0eC0+ZGF0YSk7DQo+ID4gKw0KPiA+ICtlcnJfcHV0X3Zt
Og0KPiA+ICsgICAgICAgcHZyX3ZtX2NvbnRleHRfcHV0KGN0eC0+dm1fY3R4KTsNCj4gPiArDQo+
ID4gK2Vycl9mcmVlX2N0eDoNCj4gPiArICAgICAgIGtmcmVlKGN0eCk7DQo+ID4gKyAgICAgICBy
ZXR1cm4gZXJyOw0KPiA+ICt9DQo=

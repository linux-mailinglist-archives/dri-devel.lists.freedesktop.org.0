Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0337FB87E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E4910E4C5;
	Tue, 28 Nov 2023 10:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F8510E4C4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:47:34 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AS5sBKn023885; Tue, 28 Nov 2023 10:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=IOQT4JvzDOqWXOh3VVmQTyWoOGJISAfDk0otqwFVWc0=; b=
 cP9P5p3b19sxpkJ6cEyXJKBGDyDLkyVruzVKLbi9nBbp54EzhXvAHcgDLiBPCAIP
 05Rc3Wqk1feOk3wcTWpM0iiN0MEOWEBxck8SkXaUw9SFSeia/Nri/ARu3XTa0xRE
 msdWjh3Vs3KFTDjDm4Y9X7c5f2HQPQuFdlRF7tszBvkis31JZ7cOHIB+4LU4/eQy
 oNf3n5fvbWSD/1JFNFhWLAQDM6Jx00szbBnif3vvI/TG+HZjTxYHPca7BkKYOx0p
 UGNmhJCqYMqS2GHbTwkw+n3F6ZUe6xBC9hkpAi7P4o1Qt5SDJK7uxWEZyvyFg+dz
 fnz9tVhqMMrYRbiNtkzrjg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3uk82sj1pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 28 Nov 2023 10:47:21 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 10:47:20 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 10:47:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIlfCeoDMKo/NckFGBWLLvJnElohVjt8jrayfXb29jGidmBuXgBESeIyfQiuQG84eKXy/sTAsr4GCip6YXdJBY3p7NW/ZN+/kCksvY8XoQY+fIdsB5EoXQmGhXSmirDJoM9S1pEgtIWrL17TEDHJUh5uc3NAnakXjywxE/X7iTNA8OhQSPKCodwBIjsbWMI+/EnjUPY2d7nEh0ADreZEErONCECG56bIjD+GvbQAgEtjVkmeAxHWxTjO45ZrTdjsgw9wOanwm9yX4Rjutzrje5g/DJGU8SQEpmlDynlezz22awbTE0Gkr1m8lAg2c7kb10y6d1fHicr1yfiRevwYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOQT4JvzDOqWXOh3VVmQTyWoOGJISAfDk0otqwFVWc0=;
 b=JbPL5LhAida522V9qEDgWCNkALKDA8TzdcbRXaPsvflgw/QTMIyXwJyeMF754//zUJFPVacDdodfgDXVz8Yul2SE/odghYT/0W4ogGGwkqjcrhBpQKyhrmkH1UB00VOwm0YX4GmM328E9+qAQV7X5cwI4yTlXBQfjS0dLhAUEWGz9cGZfudLDieeAjeI4olwbRkHZtZFVqk++oIISRlK3+FFSQ8Syws6L2VXmmqZQQKFogr/Yj8Rw6EwayZfpxFQ1fqya9+3AqEeEHZiWvZdPJiSDUJ5/VSkaM2XaFp/7HIGQyp3Clk9Sp6OvA7QtZSoOR8tgQQnT/kh6TbWnURz3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOQT4JvzDOqWXOh3VVmQTyWoOGJISAfDk0otqwFVWc0=;
 b=pbMZXgt25uwDXb06llKMy+BO3tlXof2k0kNCdbtupiqQ6BCAzctdc9pwZDagQGgACQEaWqUPAwFmnCvMu5p4J7upbeee9+Z9nnbheUw4o8X/lfVG1+G9b7Dju/MbX/vLghK5n1JHVK/DzXEjj9KLD19I0hdds/8Sk800Ci54uOU=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB1762.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:5d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Tue, 28 Nov
 2023 10:47:19 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 10:47:19 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, Frank Binns <Frank.Binns@imgtec.com>, 
 Matt Coster <Matt.Coster@imgtec.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Sarah Walker <Sarah.Walker@imgtec.com>
Subject: Re: [EXTERNAL] [PATCH drm-misc-next 5/5] drm/imagination: vm: make
 use of GPUVM's drm_exec helper
Thread-Topic: [EXTERNAL] [PATCH drm-misc-next 5/5] drm/imagination: vm: make
 use of GPUVM's drm_exec helper
Thread-Index: AQHaHy8tlqqfENA3HEmgWsNuuiCs57CPkiUA
Date: Tue, 28 Nov 2023 10:47:19 +0000
Message-ID: <3582c630ee753db6ef1370612e69f36287536912.camel@imgtec.com>
References: <20231124233650.152653-1-dakr@redhat.com>
 <20231124233650.152653-6-dakr@redhat.com>
In-Reply-To: <20231124233650.152653-6-dakr@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|CWLP265MB1762:EE_
x-ms-office365-filtering-correlation-id: 3fd46f67-6eee-405a-9fdd-08dbefff64ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JfjBwXxN1inx/bxUb2lYlPLvSZeJX6WBbKirVRVV6CZHgKaqonNz9I8GmvZODndMluP1F6bZqSgPkjqNirv9FvtCgwBCx7wpeqilTXWq/FTKETFbPxjdOVkVF++fzyQMG1GeX644jbFCQ+sssVnnw0EdkMhYJCiZ/YlKzh/u4vvJywRfUQRZjGJKlDq5/ztgohgTxp49/YjOsJVmXjWD6IKSc/MSRQzbhFisFTAzsRYhQW9F725M7zm1IUFMuwOc6b3MuEMAAhMCmPcqaE8OhUDXSF4etYUkrHzNjX2IY67kTtavTLTLiPJ4DkqLI3kcXNQnWR3WfLcLEypEaUHmnHwxaMmvRNV2Fl6cpSAI5qEMX63SZc+ZflMLrUB7ydVwXqducZ77WI9d7CA6CrMR6ulBboilqelqgmdI9SEBt1TBfJ3JeAE4hngcYM/WJPzlEJCLu+sAuwvt59Uua8v2oer605ly+yl4fiytHzncEXj707KzvmhB10L7UvoGwuuRaS5Ie5srUU9SuQRLF+QrhXexuFIIZpHhAJu/LjwmGU89E/tT5yYlsqh740Dw+aKca12OPtcWgL+GCEiJjxwd3Sx2gPk8WWg8uVh3VRgNFYgNjdtuUW5VLqcvLPsUYMx8iQs0eBoEL6S89KfwxMV3uSHWfIWPu6vvApY4+1h9B3Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(39850400004)(136003)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(71200400001)(2616005)(478600001)(26005)(6506007)(6512007)(5660300002)(83380400001)(2906002)(4001150100001)(4326008)(41300700001)(64756008)(54906003)(66446008)(66476007)(66556008)(66946007)(316002)(6486002)(6636002)(8676002)(8936002)(91956017)(110136005)(76116006)(38070700009)(122000001)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3hKc2RQbUFSd3FFd1VjRENESWRZekEwZlh4VEgydnNuZHR1enZKYUUxeFRS?=
 =?utf-8?B?SXFuUHYwVWI3UDdZSms5SWovOUwzZXhjQWt5Mzd1Qmp2YVg1NTFhZzJpK1Bk?=
 =?utf-8?B?WHFhWnZkdWdIWDRCMEFzWEx0OHJxNmdJUU5HQjVYNmoweTdNUzJlZ0JaWEc3?=
 =?utf-8?B?ZlpRTU1Tb1FJNkhUaTUreFUxd0tHZVU1TTdGUXJiODBXcitaZ0hFOFV2a29k?=
 =?utf-8?B?K05CRTBqdzcrNGV0VlVLMjhONCtWcEpqWU91WTlTM09Dakt4eEVwT21qc3VS?=
 =?utf-8?B?UGtvSjViNHZRb0RDVW51U1R6cnlQeGhtSlkvWWpYRiswRlEvYlpUR2tDS3Nz?=
 =?utf-8?B?dUpJZTVxNnJFTG5VczJDRit2b1RseEJUSldpaVFYSTlUNWpVRWhjTE5ldjht?=
 =?utf-8?B?ellhUDFYdTlMaEpSMFFiQnM1U2lHaW1GbTNTQngrbEdDY2E5WXJvWkxSWXVz?=
 =?utf-8?B?MDllVzROYmIrdkJqZ1lzVEpFY2hpTk9oaDZ3TzI4TkhIVWNRN3Z2SllNRGRh?=
 =?utf-8?B?Q21vM0d6dXZ3SWVVbVRGbWhSZHVZR0tObm9vdWkzTUZNU1cvZGM4OHAvOVBD?=
 =?utf-8?B?dCtjalJ3TTlaaS9CQWdMY2NmUEVtSUZ3Q2lCSEllbUdEWHZvNGowZ25NVDA3?=
 =?utf-8?B?L3Ezd0s0V1JSaElLeHBrSTZ3SUtlelpHU09SdFlaNEgrQitpaXd0Q2x1SUh3?=
 =?utf-8?B?SFFDcVQxUllOM1k2RWUvU0tSS2ozRUJQT2VoMVdMLzRrYVlhYXh0Q2p1SjlU?=
 =?utf-8?B?VDRWMWhGUDJ6UlhZb2gxVGFjZEZnSnJva0hXQmxDTnVpdEk3Yk1qNlRLMWpr?=
 =?utf-8?B?VExWZzUwZHFjY05wTFREbDk4UEQ0Vi84Y1Y1SGlLL001VzEvcnpwNHU2bHYr?=
 =?utf-8?B?aElGcDVjalpVbGNzd3padjJsNWZ1UlNLUit3cXNyUjFOZVB3RGxhblF6VE96?=
 =?utf-8?B?V3ZKQWhUeEpUVkFWaUR4dWJOem5nbVF0cFVHV2ZWTE9NZlhBTENhd1JQRmNS?=
 =?utf-8?B?SFl1NzRHNjlldSs4elE1V2tKWVdZUkpUc0pEdXdNbGhDVlM4RlJqN3pEOE5V?=
 =?utf-8?B?YlB3cDIzTWlYdndkMkJOeDBCZ1BjVFpVL1NIMGxGUFYrM3p6OENTUVhlUmI4?=
 =?utf-8?B?dWlxUTNlWkhBdGpkcURXakt3c2JaU0JDZlBWZlVxVjEyeVZveGVxZktyMzZl?=
 =?utf-8?B?Q3hQSkExdFV4bjRtWm9zb0dtdXRBdHMwZ0d2azJ2aDU1TzdLRDNHOWN5MUlT?=
 =?utf-8?B?QW1XM2UxRXlmVmVvdWxyajhUenpMOFRRRlovTERJdHlnVHMyTE8vcG81djF0?=
 =?utf-8?B?M2QwQUJuZTA2MzN6djk4ZTZ0SVZHQ3hBb1cxdGdnckoyZ1Q0RDIxdVlnMWVu?=
 =?utf-8?B?d0Npd0srbnY3VmdMZldoajYrS3NCT1k0VEphNnVXSnUxdGdETXFTMHFsVU5H?=
 =?utf-8?B?OG5uSnBpUWxOallWYkwyWHdpK0Ezbm9ZQ3h4MkUrRHJVcFNFKzFjUWpRUmNF?=
 =?utf-8?B?azA3RTZicUFsV25RTmlYRnk2aXRod0x5RTdQZ09qbjNzbWNmcUg2bGExeHo3?=
 =?utf-8?B?OG5wOGtsYVBzRVhoQWdVNDZKWDZnbnhYQXpBeEo0TmVPbUFHc3IxQnJpNjd6?=
 =?utf-8?B?M2tQWXBhYitSb3orbHVEMmI5RXpJMlhkRkE0Q1oxQzEwdGE0UlQrWHZxWFlQ?=
 =?utf-8?B?UGNsbGhhWkJJTWh1ZkZWQTJod0ZFamtrVUVBM2s2S05zMTFWU0VXczIya0Zp?=
 =?utf-8?B?QU1aUGJWcHZaTHBnc2wwT1oyc3pSdUFzNU9QU2pPM1grTi9EZC9JVmp5V1dI?=
 =?utf-8?B?YUp3d1VpbURZMytDRHBaSG1LakhPa05MWDNTUXFGeXFxMXk3aDRhZ2hIZ0VH?=
 =?utf-8?B?UVl6NzAxWnRvZ3l5U25rR3NrM3V2QkpRQWx6Y1ltUUx4UHdjQ2hvNkJBOTZn?=
 =?utf-8?B?Mkl6Nk4zUVlrcUlnNnhWS3Faa1F6bHdWNmUwWHVpWUFwY3VpQ1l2WWpRK0Rv?=
 =?utf-8?B?NWdqQkxSQ2VCa0FxekptYUJoaFlJUnl1ZEhvdFpZM04zMDNXa1NxWHBrakJj?=
 =?utf-8?B?ZzVXSjNRSUxTUHhUdUV2bjExMVZTRENpTldQaDZyeStjMys0RW11RzNGYXEx?=
 =?utf-8?B?RVR5VEpwdHRqTTJEWm4rLzlwbVdMT1dFenY0U2d5Qmxkc0hXK09HWElEMDZk?=
 =?utf-8?B?TEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32C15F50D12F6F419D3337BBF190C27E@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd46f67-6eee-405a-9fdd-08dbefff64ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 10:47:19.1667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wa2QbSs1eGvPJ+ZYo75xnBmeo3W3SQm79V8GyR1A2TgX85bgPpENcVHw4187yTHxABTP5nXL5qxX+Z5IkSOzBHNBVlIrkisH8SgkLn7HVHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1762
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: kTvIEiHVho1FDSiwbapebhmmky5GVuPr
X-Proofpoint-GUID: kTvIEiHVho1FDSiwbapebhmmky5GVuPr
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWxvLA0KDQpBcG9sb2dpZXMgLSBJIGd1ZXNzIEkgc2hvdWxkIGhhdmUgc3VibWl0dGVk
IGEgcGF0Y2ggdG8gaGFuZGxlIHplcm8gZmVuY2VzIGluIHlvdXINCmxvY2tpbmcgZnVuY3Rpb25z
IHdpdGggdGhlIGZpbmFsIHBhdGNoIHNlcmllcy4NCg0KT24gU2F0LCAyMDIzLTExLTI1IGF0IDAw
OjM2ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3RlOg0KPiAqKiogQ0FVVElPTjogVGhpcyBl
bWFpbCBvcmlnaW5hdGVzIGZyb20gYSBzb3VyY2Ugbm90IGtub3duIHRvIEltYWdpbmF0aW9uIFRl
Y2hub2xvZ2llcy4gVGhpbmsgYmVmb3JlIHlvdSBjbGljayBhIGxpbmsgb3Igb3BlbiBhbiBhdHRh
Y2htZW50ICoqKg0KPiANCj4gTWFrZSB1c2Ugb2YgR1BVVk0ncyBkcm1fZXhlYyBoZWxwZXIgZnVu
Y3Rpb25zIHByZXZlbnRpbmcgZGlyZWN0IGFjY2Vzcw0KPiB0byBHUFVWTSBpbnRlcm5hbCBkYXRh
IHN0cnVjdHVyZXMsIHN1Y2ggYXMgdGhlIGV4dGVybmFsIG9iamVjdCBsaXN0Lg0KPiANCj4gVGhp
cyBpcyBlc3BlY2lhbGx5IGltcG9ydGFudCB0byBlbnN1cmUgZm9sbG93aW5nIHRoZSBsb2NraW5n
IHJ1bGVzDQo+IGFyb3VuZCB0aGUgR1BVVk0gZXh0ZXJuYWwgb2JqZWN0IGxpc3QuDQo+IA0KPiBG
aXhlczogZmY1ZjY0M2RlMGJmICgiZHJtL2ltYWdpbmF0aW9uOiBBZGQgR0VNIGFuZCBWTSByZWxh
dGVkIGNvZGUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pbG8gS3J1bW1yaWNoIDxkYWtyQHJlZGhh
dC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jIHwg
MTYgKysrKystLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2ltYWdp
bmF0aW9uL3B2cl92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jDQo+
IGluZGV4IGUwZDc0ZDlhNjE5MC4uM2Y3ODg4ZjVjYzUzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2lt
YWdpbmF0aW9uL3B2cl92bS5jDQo+IEBAIC0zMzcsMjcgKzMzNywyMSBAQCBzdGF0aWMgaW50DQo+
ICBwdnJfdm1fYmluZF9vcF9sb2NrX3Jlc3ZzKHN0cnVjdCBkcm1fZXhlYyAqZXhlYywgc3RydWN0
IHB2cl92bV9iaW5kX29wICpiaW5kX29wKQ0KPiAgew0KPiAgCWRybV9leGVjX3VudGlsX2FsbF9s
b2NrZWQoZXhlYykgew0KPiAtCQlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnJfb2JqID0gJmJpbmRf
b3AtPnZtX2N0eC0+ZHVtbXlfZ2VtOw0KPiAgCQlzdHJ1Y3QgZHJtX2dwdXZtICpncHV2bSA9ICZi
aW5kX29wLT52bV9jdHgtPmdwdXZtX21ncjsNCj4gIAkJc3RydWN0IHB2cl9nZW1fb2JqZWN0ICpw
dnJfb2JqID0gYmluZF9vcC0+cHZyX29iajsNCj4gLQkJc3RydWN0IGRybV9ncHV2bV9ibyAqZ3B1
dm1fYm87DQo+ICANCj4gIAkJLyogQWNxdWlyZSBsb2NrIG9uIHRoZSB2bV9jb250ZXh0J3MgcmVz
ZXJ2ZSBvYmplY3QuICovDQo+IC0JCWludCBlcnIgPSBkcm1fZXhlY19sb2NrX29iaihleGVjLCBy
X29iaik7DQo+ICsJCWludCBlcnIgPSBkcm1fZ3B1dm1fcHJlcGFyZV92bShncHV2bSwgZXhlYywg
MCk7DQo+ICANCj4gIAkJZHJtX2V4ZWNfcmV0cnlfb25fY29udGVudGlvbihleGVjKTsNCj4gIAkJ
aWYgKGVycikNCj4gIAkJCXJldHVybiBlcnI7DQo+ICANCj4gIAkJLyogQWNxdWlyZSBsb2NrIG9u
IGFsbCBCT3MgaW4gdGhlIGNvbnRleHQuICovDQo+IC0JCWxpc3RfZm9yX2VhY2hfZW50cnkoZ3B1
dm1fYm8sICZncHV2bS0+ZXh0b2JqLmxpc3QsDQo+IC0JCQkJICAgIGxpc3QuZW50cnkuZXh0b2Jq
KSB7DQo+IC0JCQllcnIgPSBkcm1fZXhlY19sb2NrX29iaihleGVjLCBncHV2bV9iby0+b2JqKTsN
Cj4gLQ0KPiAtCQkJZHJtX2V4ZWNfcmV0cnlfb25fY29udGVudGlvbihleGVjKTsNCj4gLQkJCWlm
IChlcnIpDQo+IC0JCQkJcmV0dXJuIGVycjsNCj4gLQkJfQ0KPiArCQllcnIgPSBkcm1fZ3B1dm1f
cHJlcGFyZV9vYmplY3RzKGdwdXZtLCBleGVjLCAwKTsNCj4gKwkJZHJtX2V4ZWNfcmV0cnlfb25f
Y29udGVudGlvbihleGVjKTsNCj4gKwkJaWYgKGVycikNCj4gKwkJCXJldHVybiBlcnI7DQoNCkJl
Zm9yZSBJIGRpc2NvdmVyZWQgdGhlIHByb2JsZW0gd2hlbiBub3QgcmVzZXJ2aW5nIGZlbmNlcywg
SSB3YXMgdHJ5aW5nIHRvIHVzZQ0KZHJtX2dwdXZtX2V4ZWNfbG9jaygpIHdpdGggdm1fZXhlYy0+
ZXh0cmEuZm4oKSBmb3IgdGhlIHBhcnQgYmVsb3cuICBJcyB0aGVyZQ0KYSByZWFzb24gbm90IHRv
IGRvIHRoYXQgbm93Pw0KDQpNYW55IHRoYW5rcywNCkRvbmFsZA0KDQo+ICANCj4gIAkJLyogVW5t
YXAgb3BlcmF0aW9ucyBkb24ndCBoYXZlIGFuIG9iamVjdCB0byBsb2NrLiAqLw0KPiAgCQlpZiAo
IXB2cl9vYmopDQo=

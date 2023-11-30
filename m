Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A46807FEB83
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 10:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4408D10E235;
	Thu, 30 Nov 2023 09:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDA410E235
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 09:09:45 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AU8rv9L013967; Thu, 30 Nov 2023 09:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=u6qykZx4fHkLDPxux/v/VcmEURgwR73mzGjFTsY1Meo=; b=
 oiCQFICjRdxiSJ9sSOu29bPQ1nVlJNRM4Nv6wHWRQGzCKcGb02fHxqGoIBRFzK+f
 AUO0Fy8jdBMEQ7mF0qzyQA9VYTXKqhfyy3IxNXrC0X3BqLdeX5Kj6jhHiMmFZHSi
 LZIqjHahjVjGiOOYFOhueh5TZooEsgfvmVp/QvdR/O8RNomNF3mmGsF39IpkWhU4
 f/MBZcEO1KrTqgiicgtpOoFwx5pcMI1PNQKgr0yksAzyC3KY7QNW6N8rMqyjNu8r
 OUYoPNqqvAcmX1dXvGmdNeJ6b+g/acBQq23gcL3l4UlSsmroOYsFsMrUq6+GE8HM
 kn3ZMyufplUjLSlw+EEFoQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3upgv6r98u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Nov 2023 09:09:33 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Nov 2023 09:09:32 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 30 Nov 2023 09:09:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dblmC3q6cf+fOs7zrrmhTB78o5cLKkaEM7y+SZsUuI0ZhCECWKaLnbzsT/vMS2bv/dUaut8PEgLU9Pvy83jPaOtNeNGVZjH9hNxKd+sTeEKe5K0ihRosv3Fnru5AbYZv/TXP3uWpkv6bzhFu6uc/E8OOa8SHaQ+n7xLzmtKs7MO0QJpp4+MP3bt0X7HsFjReAeGn1t4wmI4WjXdp6xXtytOaqzGIq68iR/GHsOdxIVN7W/EiDhCYTm3LD1zD3TaNiu8GITWRfw4sUl0UGDbZb9WoKz5hRuqD9RfKZrwSVPBfnEbllJuGqqzr3AMv26rFW7oe+51WRLqbQcTqimQtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6qykZx4fHkLDPxux/v/VcmEURgwR73mzGjFTsY1Meo=;
 b=OA7ddc0RIFvwbvofF9iqrnsTCAGxZvkXgHrIAOKX48pTXxcZwoie9Oo73HzjS3Kpb9mSaf2QQ9+zVMUvk0nvbXuchgwPQROcXHVW7fHb5+F8kV7eoi8rBE0HyMglmIXG8j+UDHKuHO9v66NrUT/WhrXyvrhtLoamdd9ema+8Hw+Xopsje+n4EwOE2E2+cWWxsHweotjYejDeGX5OuOYX+xLEeu8p/k/NBm4AJnJoSELAV5ZIN51NETQaXCC0CwxI3O8PZZ5n8GKt6ekPkGNfaFT5rAaqrOu1iKNnOi2WVXB7S2Uej6b+1hOo1nUoAztb4AGIU5YUsWoV0wy/e+oxxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6qykZx4fHkLDPxux/v/VcmEURgwR73mzGjFTsY1Meo=;
 b=JBSL4RltepIjHR3u268b3FsKgG3XY5OKY/NE+5KCC1bidxUhXLx8dEwaypPqHstI/VLJ8tJkIDSpOViWnpx/nrIs60Msd7McTfBGuK4JgWLGjJpd+f9j1KbForNEIs+CV3cYAskpDaZiKJWCkfRW3AGJqhoBh6hGdI78JDfBR5o=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LO0P265MB5925.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 09:09:31 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 09:09:31 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>, Sarah Walker
 <Sarah.Walker@imgtec.com>
Subject: Re: [PATCH 2/2] drm/imagination: Fix IS_ERR() vs NULL bug in
 pvr_request_firmware()
Thread-Topic: [PATCH 2/2] drm/imagination: Fix IS_ERR() vs NULL bug in
 pvr_request_firmware()
Thread-Index: AQHaI2zty10S9X9860OzH9Sodb/+iQ==
Date: Thu, 30 Nov 2023 09:09:31 +0000
Message-ID: <5a1d8121d85858653b646f8f73845627cb70198b.camel@imgtec.com>
References: <384288de-a779-46c7-869d-b3c63462e12b@moroto.mountain>
In-Reply-To: <384288de-a779-46c7-869d-b3c63462e12b@moroto.mountain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LO0P265MB5925:EE_
x-ms-office365-filtering-correlation-id: 67f189da-8bbc-4cfb-5ad8-08dbf184104c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mUBRDvqPrh8VCfSjs0iIbzJ3czhdongm2uvz5pCIq71HNhHtLz418FD2Rk3EXXlpeQ7CbQfWg7exTsbUOnkfUMX2livIXJF4fLwkVCEWj/jsbRvxogjdVf3hUvnLy/eX8pKrSPDdChPm/VqkvjOj/fqf9eGEBocCZxtk51OnPMiuH+Ny9zRge9vusLhaa0nNLUZNZUhuJf+WGikaEy7YRf7dxDApeJjwepLQ/L4a4jUNW/VBriG8o469y6rtBE036wR2thCjWwbeBL3bGUY1bCmXxK2Ku0BIELBHQ+N6SUIlc3dWq8DrTWrDau4G8HwqfLHlO+m8l4fyqJ4CVJpXjUcCqJpsbrRoDkUte0seiKwH8Q6xUbtfD2O15Rt0JuBMFmT4Us6FDuoaXYmc5ZhjuxpC4pbyf6fHvoDfz+N4u/RfQU9GIjdkcsioHDwuMsgubbYfMYoKi3HpNLoyacEGseWCpqAV8emUZ1ept+f43MuvZMFLfLy7Q57ZxnQCvMAA0tYU+QiSAqXvbCR9Pr+ALMWOojmqgazYuIv7v/zm6jQ1a8rgluFnwFQJg6Kqgalt4NDL3WZX41ZIsWcaKiXGH2ADvSx+/bqatzZZ1xGS7Lo1mHxnH62DYDEg4RhfeWBkRJd8SkTlNlMDEYSIznZ9fdmNzmdwXm3Frc624uNC42c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39850400004)(376002)(136003)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(38070700009)(36756003)(86362001)(122000001)(202311291699003)(41300700001)(66446008)(316002)(54906003)(66476007)(6512007)(6636002)(110136005)(8936002)(76116006)(66946007)(6486002)(64756008)(71200400001)(6506007)(8676002)(478600001)(5660300002)(2906002)(4744005)(4001150100001)(4326008)(66556008)(2616005)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2hRbFlaWDByZHJTWU05bnNDS2NiQmRyVnE3ZkZqTUlVN2tWb2dWTXNKaWxJ?=
 =?utf-8?B?U3prZVlSU2o2VVRYcVR4dTY0blNIQ0p2OVdZMjNmOXpSMG5UWDljQkhxc3h3?=
 =?utf-8?B?VWVTWXp4M2RXV2J3YzRsMkpPQkNaRndYSElHZVdBVUVJYkpwTkpMMXdkNXVI?=
 =?utf-8?B?MDFJUGwvNXFtUjJMbXpPQTJlWFFnSW14RjlWdEtFUWt5ZjVkNlczcG5DT0tm?=
 =?utf-8?B?UUk5VmRqWVMzeXREOVJrV2lQVCtBem5QaFMrL3dwWEk2Y2pCaytXOGlQZjRs?=
 =?utf-8?B?eU5pRzJMUmpER3JybitWYlN4SFZiWnlKTjNaTWJkUXNiN0ttazNuNTNPWVQ2?=
 =?utf-8?B?Q0xBSkdKNTNJNE41bGpsb0wrQ3h1YnNRSjFETmE2ZU54bHBiU2JvL0tjbnls?=
 =?utf-8?B?akYyUFZtNjJtZExORVdHMWFRbVdjL2llQnBtMWl4Zkxkc2FUWUxJWjVXcmhw?=
 =?utf-8?B?VGNkUXVoaGgzU1Jmem11NFNrMEVhTWVKeUZYdVRzbVdvaHFxYnc5ZnZXaHA2?=
 =?utf-8?B?a1Y3L29VMDROVFQ4MzBaN3F6dmlrY0ZFV0hnbmdwOEhBQTBHRW5DVGM5MXpy?=
 =?utf-8?B?NlRmdGNhbXNRYW0xcHB5OUpJQWVjeStiSC96VFVBeCtBZUIrWlk1MTNhMGp1?=
 =?utf-8?B?QStuMXBabDd0dWMrb205SmRRd0ZpZXlhNmtQT240LzZ4K0JnV3FhL0FZUFJ1?=
 =?utf-8?B?dGQwVU9KN1FscjJqMGp1Z2lXMXNrUFl0RVJXSDh5M3ZYbjRSMFVIWHUzTERG?=
 =?utf-8?B?bTZWR01mbUx2OFJudzdOVlVham1HZ0M4K3ZHSjB1L3JOeVhFVE5Nbm4rUUpC?=
 =?utf-8?B?d1U0YkRvWEZXMUs5MGdaY0FidDBsN1dUT0t3Y3JKeHJMa0JLMWRQay9aL0RQ?=
 =?utf-8?B?WVpiM3hWVjVKQVhRTHRSOCtXY0lsNzdsd0JlNU5rRVFhZlgycHIyLzFRMWNL?=
 =?utf-8?B?T0NpQ2JtYVBNd2x1Nlh6aGMyZnF4c2R4WU5wdUJEcEs5OXk4a1lpSVR1ZElM?=
 =?utf-8?B?VXcrZExBV0o4SEI3ZE9TUjBTMS9LL1BxZEFxQWx6ME1nVzA5czRBOWZQNzQw?=
 =?utf-8?B?d1gwRFJDK0Vvc1VJYjZCQnJReUtlWmY3ZUFKTlVIOGM0TVdEazNOREJ1UnlR?=
 =?utf-8?B?Y2dxUzFDeC9UbExlMThKN0wzc2JqVTJJNmlBc0pWcEZySVVHZ0d0QlBTVEdq?=
 =?utf-8?B?TEN1RENRNzVCN1lxSjJyWjRFMXNjaDBuY2Z0MFlkZCt3TFI3UjBVTEo4WlJi?=
 =?utf-8?B?RDRTamF1QWs1eVppaXRIbjRwb29DSWFNbjNzbVQ4a3pSd0djTmF5S2dxbThX?=
 =?utf-8?B?K2RvWTNpVHpPbm1iSTdxcnVXc0xhWXRmdk1BcWo5cForZndiV2tCeE5IdmEr?=
 =?utf-8?B?aW8wMWV4YlNldG9wVnpJMFNlZ3VoTUp4QnRnZkdFdHB1Q3FEbmV1Q2RKT2ow?=
 =?utf-8?B?OHJISFBRdjJrOGdGV2tpZThGRTRVUDNxSThSc3YvZ3JabU1OWHl2L0tDUDBl?=
 =?utf-8?B?V3lCYVkrLzFVd2lGWXNQUXMrRDdXNGJmNUYydzUwMVdyVGxOOTdRbDI2NGxm?=
 =?utf-8?B?SU5XeU1RN3ljUlB1RFVLZE5UVjJoK0F3MkZGV1hZM3ZncndITHk1MUJYQWRi?=
 =?utf-8?B?dXpWVXFwQ2ZpSnh6TGFtYlV2ZElTK2duZHRIUjhUOGlZK3pzT3Z5eEx4VFN0?=
 =?utf-8?B?ZnpxVmxxY3lFYTJvbjQ0d0NqU2dpdlBxSmhjSCtXc1E1QXpNNmhmd29rY1g4?=
 =?utf-8?B?MmhVa1NDVkFsQVBmUTFKSlg1NVRDR2NGN2MwZXBBbGFwUVo1eW9lOGFCaUdz?=
 =?utf-8?B?K0piYmk1UGJGYmxQRS9BM2tiL1g4RUdmalhwZkxyMnAvVktybStNSHFVendC?=
 =?utf-8?B?N3M1L2R3UUpUZFVaQks0Q2EwT29aemt1SzNTM25BajRkY3owaklZZHQyL2ZC?=
 =?utf-8?B?MFA2a2FJUStHdlVySDVFeHErcm9FSUlreXNLVmRQYjBoMjJUWGdiUS94Z1lV?=
 =?utf-8?B?VkdLdSt3VVBPcStQNUdjc3Fsc09LaHFvYjZ4aUVMdzVyd3U2UWNadUZGYzBS?=
 =?utf-8?B?MC9FWVBkcDlmNFFaMzluOUlhcTFHblF6LytvZ3poeXY3bC82MU1ZZWNUY294?=
 =?utf-8?B?VVArNWRDMlEwOHk1Wm94V2VJMkFuRmJoSWE5T1NwUjhHOW5XYzdxMGFqalVX?=
 =?utf-8?B?TlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1BD185F0862744D9ECFC85C99E68A79@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f189da-8bbc-4cfb-5ad8-08dbf184104c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 09:09:31.3891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jX0rBk+3cU203KkMZfPsYV0AONU+L2PxcUBinRE1H5bPbspv7iB24Y6zeMufKirIZShWTxrhE51F+Z1uLspnrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5925
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: rXJeunkmfkjQeiIkNJfnKP5tvSPv13js
X-Proofpoint-ORIG-GUID: rXJeunkmfkjQeiIkNJfnKP5tvSPv13js
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Matt Coster <Matt.Coster@imgtec.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTExLTMwIGF0IDEwOjI3ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBUaGUgcHZyX2J1aWxkX2Zpcm13YXJlX2ZpbGVuYW1lKCkgZnVuY3Rpb24gcmV0dXJucyBOVUxM
IG9uIGVycm9yLiAgSXQNCj4gZG9lc24ndCByZXR1cm4gZXJyb3IgcG9pbnRlcnMuDQo+IA0KPiBG
aXhlczogZjk5ZjVmM2VhN2VmICgiZHJtL2ltYWdpbmF0aW9uOiBBZGQgR1BVIElEIHBhcnNpbmcg
YW5kIGZpcm13YXJlIGxvYWRpbmciKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxk
YW4uY2FycGVudGVyQGxpbmFyby5vcmc+DQoNClJldmlld2VkLWJ5OiBGcmFuayBCaW5ucyA8ZnJh
bmsuYmlubnNAaW1ndGVjLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5h
dGlvbi9wdnJfZGV2aWNlLmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2ltYWdpbmF0aW9uL3B2cl9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9w
dnJfZGV2aWNlLmMNCj4gaW5kZXggZTFkY2M0ZTQyMDg3Li41Mzg5YWVhN2ZmMjEgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9kZXZpY2UuYw0KPiBAQCAtMjg2LDggKzI4
Niw4IEBAIHB2cl9yZXF1ZXN0X2Zpcm13YXJlKHN0cnVjdCBwdnJfZGV2aWNlICpwdnJfZGV2KQ0K
PiAgDQo+ICAJZmlsZW5hbWUgPSBwdnJfYnVpbGRfZmlybXdhcmVfZmlsZW5hbWUocHZyX2Rldiwg
InBvd2VydnIvcm9ndWUiLA0KPiAgCQkJCQkgICAgICAgUFZSX0ZXX1ZFUlNJT05fTUFKT1IpOw0K
PiAtCWlmIChJU19FUlIoZmlsZW5hbWUpKQ0KPiAtCQlyZXR1cm4gUFRSX0VSUihmaWxlbmFtZSk7
DQo+ICsJaWYgKCFmaWxlbmFtZSkNCj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ICANCj4gIAkvKg0K
PiAgCSAqIFRoaXMgZnVuY3Rpb24gdGFrZXMgYSBjb3B5IG9mICZmaWxlbmFtZSwgbWVhbmluZyB3
ZSBjYW4gZnJlZSBvdXINCg==

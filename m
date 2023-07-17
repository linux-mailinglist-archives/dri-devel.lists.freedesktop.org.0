Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5700B755FFD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 12:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD1F10E21B;
	Mon, 17 Jul 2023 10:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE75810E21A;
 Mon, 17 Jul 2023 10:01:27 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36H64rGW025426; Mon, 17 Jul 2023 11:00:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=687B7ygr+V5ty72LFplGeOeBBUZ8pkgfbGSW/bYSaCE=; b=
 GDxVt7OmtwrjIDmWlNqY+OV99z4Tf1WBN41C5xUpVzGJsRE/Jb5cG1fNMzErNuPS
 7iBXPRLNLh5Y+vjrK1XeYDw833ohSAWUqDYxLN12hoGiw7UTVqM3h/X7l/SbwAW5
 zqXF6y0YCZBRzth+EXt6104eCjSFrJ/vga4LonvduMMdS4zcNM2PLqtT4KlgM8bf
 sDBH1wjo956LhnWXXjBvXem1BTqud7FMqrLx7H5kBYZ1HZUsxGmaVh4+KSZQukb7
 h2psoVv9SbpRKEGv5TTQy4/NDDdWaV9qr+XUDOaehee1rBzXNnr4YihMnnOMxvLq
 r24mjyh6h2sAQ+wm9z1pJA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3rutdrs61f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 17 Jul 2023 11:00:39 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 11:00:38 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.59) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Mon, 17 Jul 2023 11:00:38 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuGqOoLsHgOLFj9dNs4b3X1DRYeto9TsNJXeGp4xx7VHdam8KfJfW5yiE8V9W6bjECoIUvxBG87o9A3GAEP/HPfBF8FvHz2zqH5zbcElYSY4YvbXQc1WW1JLd+PnyiCof04P2XJdxsv5CYR+VCXUrmYtXhvWOtLVsMwVM+h3EfkrPj1SrE98P/Qj6BCdDfl8W3bh/NSae7L47FjPo4KXxXbLxuP44CAU79ifU5S6EgwmCSv8deqWdyii7MCbR1F94D6LY3h7qW0H43BXV22JSm5D1aOajiU9O9TUULhZ1FEgQ1tai7z7pgKNPeXtjpc0GTtQE2EiKBam4Deta9seyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=687B7ygr+V5ty72LFplGeOeBBUZ8pkgfbGSW/bYSaCE=;
 b=D5vTergi6tz1aRXHbSkFw/KejFTosqs4roe48tcpHekVbbIeRrklzIfmDgKXYe0jb73kLp1VxPaBIaEvxx3AK/wBnQ9SFElxiUeAETod8O8RzEYCLHLc39zJQ0EJvkPNbLmon1Tyl3uvNnr+68w4/IInMzl/B4smsYVkaAe9431sfQ7aWXw/B95xKeWGPb+TCpG58+gtr0EMtlIfMG8ceU4MnESpEv9/H9GdFpHRNHp5XfJ/LNHs4TGn7hirp0nCBHoVo9WAII2MLzj5m4W5rOArXNUN9Q0JpDlfBDK/d+3yiJP3RCZeTgNoeYqNyDGHidr1EtmWqggVJlqnzEOJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=687B7ygr+V5ty72LFplGeOeBBUZ8pkgfbGSW/bYSaCE=;
 b=ZE2D+OH3AlxUknqqO0qaTq9yS7a5EQFVazTe8/yQD3yAESTSZ6wniQ/vnGB2aLOxv4Qo3syws4WEz7nvGAgqmgduxAXsPILAsmhcVRpudNlAERufr5MHKak3vNsyEthYgkq5+PrKFT3OO68Ha8MaYajaDttliER05OoUO4i576M=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB5330.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 10:00:32 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::76a7:922d:d0e0:3449]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::76a7:922d:d0e0:3449%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 10:00:32 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "jason@jlekstrand.net"
 <jason@jlekstrand.net>, "willy@infradead.org" <willy@infradead.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>, "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "ogabbay@kernel.org"
 <ogabbay@kernel.org>, "boris.brezillon@collabora.com"
 <boris.brezillon@collabora.com>, "Liam.Howlett@oracle.com"
 <Liam.Howlett@oracle.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>
Subject: Re: [PATCH drm-next v7 02/13] drm: manager to keep track of GPUs VA
 mappings
Thread-Topic: [PATCH drm-next v7 02/13] drm: manager to keep track of GPUs VA
 mappings
Thread-Index: AQHZuJWG9L5X8pjo/0KTAgTcke7AyQ==
Date: Mon, 17 Jul 2023 10:00:32 +0000
Message-ID: <f5957892c4fb41becd7084ac93310aae3a6e091a.camel@imgtec.com>
References: <20230713170429.2964-1-dakr@redhat.com>
 <20230713170429.2964-3-dakr@redhat.com>
In-Reply-To: <20230713170429.2964-3-dakr@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|CWLP265MB5330:EE_
x-ms-office365-filtering-correlation-id: 1110ad0c-7a2d-4a74-0759-08db86aca8a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8XAYHQjpurFDas/THPVBJaW43l767xb2cs5GWQbca6P6YSPfZ/86LsK8Q2iAUhkWdUcDD/gKfd52mnSQ9o53o6hsaZclQ2FfpAwd/1P0H0ckgJ4oUEO6dDozaJrXBVOPJdkWIZQEzSpGclDYaCbaZT8Q7TrgpYWBwlYErNQQqK+xhiJ+hgvnHwjBVYjoD3JwoT003e43pJ1iJLTkrPOrjBenZhvEFD+mWwhOeIH5vaqCKw4wYsBpSYKyNG63JMv798Hco35+JmJxCa9k9hO80zxkLvMcI95+9X9u7YtWb3X671SnjN9zW0OnlKvfPHVcMRU/a1qL2bQjd0asqcP5+ILHIN3lLuxF1LE5dZWTDjM/tLITdUAgLHJs8BrZ+2ca73AdAmsTPB1SmjmkzTcBlhtmqOi/ncGWDhUU/yRRJWUwP4F3TEF96X793oigMh4MLJpDVwquFtOYLseys2xYw20jwyWuBbfI5ZE4/+x/xDQnM+NGYBzPn8y3YEMmMJaOcBottCcb3xKFJfBbLZMMZXE/LXlecMM7KYeP0k4GUT+xGNsr0EvD5WjG2lQeUhkPhTTGbigQSWvQi76twLY5ZQDzS7FzsrraLaQGbEl8ONDnhYOeKvQ50jIqNPkJOp+kpCXq7ATJNqzWkKpoHnOu7Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39840400004)(396003)(366004)(136003)(346002)(376002)(451199021)(478600001)(71200400001)(6486002)(91956017)(110136005)(54906003)(186003)(6506007)(26005)(6512007)(76116006)(2906002)(41300700001)(316002)(66476007)(66946007)(64756008)(66556008)(66446008)(4326008)(5660300002)(36756003)(7416002)(8676002)(8936002)(38100700002)(122000001)(921005)(86362001)(38070700005)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZktMTVVOVEhENjNQM1ZGNEEwd0tJNTZlaDV4VFBlY2tiajBXd3c2czVYcGgv?=
 =?utf-8?B?aDlBem9CSXhPa0dNWkpocmtiMzlVNVBYa2czV0ljOEVLNnVxcFJNVHdGU3o0?=
 =?utf-8?B?QlZYTXpqWURYUUN2QVhaNWt1V3R1amVGMm00WWpRd1pFNVBFSjNERkN2WFpq?=
 =?utf-8?B?Ujl0am9URytjeTJhempyRUJLVWNyTjRsZDcxOUFtbTBYVUp2M0gyY09hNVJz?=
 =?utf-8?B?MUlCcEQrUkxySm5rbWZSMGJpVVhZc0xZc3R2aTJEMWVjNlZ5bFNBZy90bjZz?=
 =?utf-8?B?aFRFOS8xeWp4R1Q2bkFkbE9Hc09naFVnUVl6UjJjdEgzTmNjRFN2b3cwMzN6?=
 =?utf-8?B?T1lHeWMzclJpZFR0N2ZUOUsyTytGNzVkeEwzdm43N0NtQ1RmUnFSaXFwemQy?=
 =?utf-8?B?UlVvOWR4V2xYUEVZb2d6N3RnRy8vZHNCS0l2dFdHelF6N0tmWWRxZnNiZzNK?=
 =?utf-8?B?UDdCRFNaTDEweVl5Q2JZWXYyMDZXYXBTdEpveEVUaGRrdHRYR281YU1KWm1S?=
 =?utf-8?B?TFhlbWxXNGY2Nk1JQW5aajAwVDhxbzcxNGlaVm1tR3pVME9Db3RKR3IvcExG?=
 =?utf-8?B?MFgvNEdBVlNIV2o5Mm9jYmd2Y2JoVno1TThrZVg3NW9sS0c4bjBJR2M0R0p4?=
 =?utf-8?B?dnI0YndkWTZrczFhMTYyOGxNOWptelRIMVBWaEpWMmhYTXFlZTRJeUFJWGoz?=
 =?utf-8?B?ZjNNTFI2OGVlSEZmK2lTRDZUQkVaaWp5d2w5c2EwaXRseXdjQVJhYVBRZ3Ba?=
 =?utf-8?B?Z1dTR05xb1N2ZWNBdWRKSnFQbk1PV2FxUHk1WVdyYzZhRGh6Z0tFTytoZzRM?=
 =?utf-8?B?QnJvTDBOSXIzU3d3aXoyaFh5VGpSOXdGZ01QTm9NMllyYzQwdGVPWU90aXlC?=
 =?utf-8?B?UjR2YWVvdHBDZDNmVXU1TE9OZVB4bG0vQnlHRTg0bFg4ZDVqQndXb1phMWRa?=
 =?utf-8?B?dWZMMFY5Nm9LZndBcHlvRkFEakpFRkVwOTE2cHZ3UlIzTWtxWEZhRi9XMlpt?=
 =?utf-8?B?Y3MrZi9ya0FDZ3g1ZmZ1eWt1dDNkeTV5SnlSRWFndDIzQlphVGtuTGtQYUQv?=
 =?utf-8?B?bFZJc21jRTY0b3JGR1kzRXljR0hUa2NhMXhVamdoMGEzVmtNL1hMWFhhUk9B?=
 =?utf-8?B?cmx5eTEvem85Wng3Nko4QU1rWlNXRlo0VGxyUXhjWWRub0JnSTRNdWJ5YjB3?=
 =?utf-8?B?aTNvZTZIQ3BRQVdxSnJhT2lGOGpja2hQSXFMRWdDU3J5MXMybXhLalErbFRm?=
 =?utf-8?B?OWhvRUkray83eWpRRTFKa2VRdDVhQU1CS0RjMmxyN0lpNy9XUWViSmpKQ1VV?=
 =?utf-8?B?ZVBvSTNsaEVIb0c3VlpYNUlEOGx3bkdvcHUxbjNCbkdITU5DbFd5STkvZGVW?=
 =?utf-8?B?ZXlnRjNwTVc5RmNrb1Y3cGtLdDNSRG9Jak5nZUM4UStuMTV6K0JLYmFNRUtL?=
 =?utf-8?B?dHpIQVJGOGtrek1KcXQwb0psSm1TZDY0dm8yUzdZTUo3MTZSNWpxQnI1Y2Uz?=
 =?utf-8?B?OGlmUzBzUEZZdEl3WkNjVm9naFpteko4SG5CSGNxQVVvSnFRWi9XTWRScERK?=
 =?utf-8?B?WUZVakhscy9kZlVsUXdCK3VYekZCMXNpVTMrKy9EZElkTGZObXJSNUczKzU1?=
 =?utf-8?B?TE5GREQyYkFZVUVoK0xuV3ZEU2UxZ3dXYS8zQWJuazg2RllxNEF5Wk5HOGUy?=
 =?utf-8?B?cUYxZnNPdTdHT3dFMXhHa2gwa3NTZk9vdHg4MHhFa0ppekRlNDVidm1qbW5M?=
 =?utf-8?B?aTA4T2Z4czNjb3BLWS9CelNBWHJya0YybWlPb2RhMW5RcHU5ZC9ZZFBjYXpv?=
 =?utf-8?B?STdmRkpCOVRmZnBLbGt3VUFFanRkeXRLaFVrTFZid1V0VktqUVNrdi82Ryt5?=
 =?utf-8?B?aGt1Y24rTUs4bFBuR3VEU0dBT3FmeG56N0w2Q2NGVVhXNnRabWR5anc3MjBW?=
 =?utf-8?B?RFRubFdUN01naktrWk0zTjlqL3VnSkhxaWtCTFJtckowaFlORGp2aDBDNXFz?=
 =?utf-8?B?Q1hmQnAyeU1acGNSR1NZZStPQUphWVpVOUN5bmVVSlc1V1UwcE1LUzNzSFNz?=
 =?utf-8?B?MzFyQnVVRHg4dmNsb1g3VDhiRkhyYUhLZVBZUmpkbGpzWDBRYzhiRTY5RHV0?=
 =?utf-8?B?K1FKT1Znb0ZxNUtxanZEemlzNWVvQW02bGJLTXZYZDk1cC9lTGxDVSthZ3pr?=
 =?utf-8?B?Snc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3E06D8B6817C148A2A8F011637C1173@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1110ad0c-7a2d-4a74-0759-08db86aca8a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 10:00:32.4200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PSfmcp14lRjStLByDzyGaKMFuenKmS+lsHd7xAhoT0mkGFGJRHqU4ac3xD9bT79kMcst8f7dZQifSdwlfEhaQoQ7zuY7ZkNyVLY+saKNIFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5330
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: SB8EFyNjSNchWqoMVkdrtJO_IneBfPz3
X-Proofpoint-ORIG-GUID: SB8EFyNjSNchWqoMVkdrtJO_IneBfPz3
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
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWxvLA0KVGhlIGJlbG93IHBhcnQgb2YgdGhlIGRvY3VtZW50YXRpb24gaXMgb3V0IG9m
IGRhdGUgbm93Lg0KVGhhbmtzLA0KRG9uYWxkDQoNCk9uIFRodSwgMjAyMy0wNy0xMyBhdCAxOTow
MyArMDIwMCwgRGFuaWxvIEtydW1tcmljaCB3cm90ZToNCj4gDQo+ICsNCj4gKy8qKg0KPiArICog
RE9DOiBMb2NraW5nDQo+ICsgKg0KPiArICogR2VuZXJhbGx5LCB0aGUgR1BVIFZBIG1hbmFnZXIg
ZG9lcyBub3QgdGFrZSBjYXJlIG9mIGxvY2tpbmcgaXRzZWxmLCBpdCBpcw0KPiArICogdGhlIGRy
aXZlcnMgcmVzcG9uc2liaWxpdHkgdG8gdGFrZSBjYXJlIGFib3V0IGxvY2tpbmcuIERyaXZlcnMg
bWlnaHQgd2FudCB0bw0KPiArICogcHJvdGVjdCB0aGUgZm9sbG93aW5nIG9wZXJhdGlvbnM6IGlu
c2VydGluZywgcmVtb3ZpbmcgYW5kIGl0ZXJhdGluZw0KPiArICogJmRybV9ncHV2YSBvYmplY3Rz
IGFzIHdlbGwgYXMgZ2VuZXJhdGluZyBhbGwga2luZHMgb2Ygb3BlcmF0aW9ucywgc3VjaCBhcw0K
PiArICogc3BsaXQgLyBtZXJnZSBvciBwcmVmZXRjaC4NCj4gKyAqDQo+ICsgKiBUaGUgR1BVIFZB
IG1hbmFnZXIgYWxzbyBkb2VzIG5vdCB0YWtlIGNhcmUgb2YgdGhlIGxvY2tpbmcgb2YgdGhlIGJh
Y2tpbmcNCj4gKyAqICZkcm1fZ2VtX29iamVjdCBidWZmZXJzIEdQVSBWQSBsaXN0cyBieSBpdHNl
bGY7IGRyaXZlcnMgYXJlIHJlc3BvbnNpYmxlIHRvDQo+ICsgKiBlbmZvcmNlIG11dHVhbCBleGNs
dXNpb24gdXNpbmcgZWl0aGVyIHRoZSBHRU1zIGRtYV9yZXN2IGxvY2sgb3IgYWx0ZXJuYXRpdmVs
eQ0KPiArICogYSBkcml2ZXIgc3BlY2lmaWMgZXh0ZXJuYWwgbG9jayBieSBzZXR0aW5nIHRoZSBA
RFJNX0dQVVZBX01BTkFHRVJfTE9DS19FWFRFUk4NCj4gKyAqIGZsYWcuDQo+ICsgKg0KPiArICog
Rm9yIHRoZSBsYXR0ZXIsIGZ1bmN0aW9ucyBzdWNoIGFzIGRybV9ncHV2YV9saW5rKCkgb3IgZHJt
X2dwdXZhX3VubGluaygpDQo+ICsgKiBjb250YWluIGxvY2tkZXAgY2hlY2tzIHRvIGluZGljYXRl
IGxvY2tpbmcgaXNzdWVzLiBGb3IgdGhpcyB0byB3b3JrIGRyaXZlcnMNCj4gKyAqIG11c3QgcHJv
dmlkZSAoaW4gY2FzZSB0aGUgQERSTV9HUFVWQV9NQU5BR0VSX0xPQ0tfRVhURVJOIGZsYWcgaXMg
c2V0KSB0aGVpcg0KPiArICogZXh0ZXJuYWwgbG9jayB3aXRoIGRybV9ncHV2YV9tYW5hZ2VyX3Nl
dF9leHRfbG9jaygpIGFmdGVyIGluaXRpYWxpemF0aW9uLg0KPiArICovDQo+IA0K

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9916DE341
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 19:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1299E10E5FE;
	Tue, 11 Apr 2023 17:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11011011.outbound.protection.outlook.com [52.101.47.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C12B10E5FE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 17:56:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHG17LykxlwAN9aW4BA0pc0UfCHuwbx1rv1ayDq1mlIA2GReCCDuYCFgFTKEPa7jQpvkiJA4fIkTt/48rNUb+M4ABuqcOiOuU6PgE0We3h85bQI1jHS9ituqkBAAj6TQCGi5sF/TcGekxp6Z49buHpH2iPUbw8toUtQ6fmVrYErXnwPnDjGj21nwx0qnaS5PNm3v7h/+BswN1e9mIquToS9gYQ6MuzPGe914IZ45VOB1FcBE0gTVArm6C8MVR4294vYk5ZTfpdqIeIs1q8v1jAX/TYYJvwxRH5TY8sfikwPmf/RiFEzfy5Arp2fpEO5vRO8csRObXORMTGRvD9/wlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJU3HEXEbOgEiVdY5t0IXwXnI13n+K1+q6eFTbq13RI=;
 b=L2EMfPxZrij1AedNL2sK6IP1EZta8CiRRyfu1cjqrjSpm9P9vK5BnpRMATAOu8Q0mdnzFhJ0NHHqmrupFzgmWVgoY6ekiYZlNVmnPFlSnkHGEh4TbJJkbEjoMzzNDu8j8FtgWZ/KXZsuDppI8+6Z818hmlzb1RbXOutIKfqRkF3uY3QNrUczFbJchxU01MzCGQ9HpOxJHJ7HfM/yrmteFmySgVyxXWdsj5bAXg5cdCQ9JLSSAJd2S4tT6UXZ8ou6q0Fp0z3MNWzi3N94aCVj9AIqXooEHIoJa6bEPknx2VYOygRFish9HQL4i9qBDui7RKyW1zNrssLC04e01NLKEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJU3HEXEbOgEiVdY5t0IXwXnI13n+K1+q6eFTbq13RI=;
 b=vpaT11QjMPgu1VOQEhScq3iPEUTsFAKZ3+Fniwg4lIH8u4U9A/0+7dQMP7RUkCBcTL+eRok1CMnahlzsXVK1ni4hna9i+J8UIcVdd57y2q5zLO5pZojq06918+5DEdF2BZYbhe3WWfI/UWLI6c9l9TwNjgoRUzeOwBjNeA74Hog=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by SN6PR05MB4093.namprd05.prod.outlook.com
 (2603:10b6:805:23::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 11 Apr
 2023 17:56:15 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::b4c3:9441:f0:efb8]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::b4c3:9441:f0:efb8%6]) with mapi id 15.20.6298.028; Tue, 11 Apr 2023
 17:56:15 +0000
From: Zack Rusin <zackr@vmware.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "nathan@kernel.org"
 <nathan@kernel.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "trix@redhat.com" <trix@redhat.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: remove unused mksstat_init_record function
Thread-Topic: [PATCH] drm/vmwgfx: remove unused mksstat_init_record function
Thread-Index: AQHZXoppq+SckREidEuckuwMrXDKD68mgLsA
Date: Tue, 11 Apr 2023 17:56:15 +0000
Message-ID: <7409df3e0e77a73494c56aed8010ada57b41b18c.camel@vmware.com>
References: <20230324195403.2655148-1-trix@redhat.com>
In-Reply-To: <20230324195403.2655148-1-trix@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|SN6PR05MB4093:EE_
x-ms-office365-filtering-correlation-id: 23067797-37bd-445e-d1f4-08db3ab60b51
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p6/GFsL7SzPGIgtAS09wzwJ58PHI+vKJ+yVlJlojXlDZrUOHhAEQtXL1Xh/QleHRf3U4nzGtMGG5+iATFQX/FZGdd4rv1ehYy+9vNvJcNa6UJfG15Rg8rP2V+KPvhHSx9SWsCm/P3TQA81/nhoXGPFJBItRr+nfhyaLB++AIm68hGvSgLk0VhDRofAYwSIvZVUXLKRl17BqOApwck5oGejZkOkm5HRGFrLMdZnIL1o8tbJg2zhmvT09g0hwOy9aEB1f7D5Gsi8iCQ80u15cvEci0U7sURnUVlr/8Y54ldY6R5c+M8k1ie5xn0JHoW56sVdGIO/bq5t5jxhntxblQH2W0v/dkP6IOJL80iq08utcD1IxL9dtGCTL0Q9gypF2WdvBKmVt09SZAQ+4hSfvPBlGTfJr7eUyDfBCTPQd7DRuCWkuFa5tkvxmx6wbfCpXjpPBd6gbAEf+Wpzm8WGgcEOZDpqfF5CnFJ5YV8Boud7NqbMHJCVRr6vOdBk428jeTftzkp2/wMX8xsawn56lt6Jk6T/TV1DtpWTrBdbL5IU84pM9i05DPiSpetTWlIHqdSIA5EXoPxH7YbSUoe032HBS/yJ4KTaMzJeYI5OlToxVwi6bQNQ0FALi++vchmPzz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(8936002)(71200400001)(6486002)(38070700005)(2616005)(86362001)(36756003)(122000001)(6506007)(26005)(6512007)(186003)(66556008)(91956017)(4326008)(66446008)(38100700002)(66476007)(66946007)(4744005)(8676002)(2906002)(41300700001)(110136005)(316002)(54906003)(64756008)(5660300002)(76116006)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWRoY08zd2Y2UVNIeFMrcUJiYURxVUlrdGZqNXpvUWUyQUZSdk5xRkRucEE5?=
 =?utf-8?B?aEZEUGdRbEUrTkJPVVd3ek1xby9iRnMrUjRVVHVUbXErTTJIZkpUaDE0RmFZ?=
 =?utf-8?B?SDZLdHoyUFNFRUZFTG5EZ2VHdkRjT2I2RG9IbG4za1NZVUZTeEk2Z0IreU9S?=
 =?utf-8?B?K3FoN1NVYXFnR1QvOEZmV0xxTUZLZ2syeFYzZ0hpWjRiRy9UZjB1bjUrRkRs?=
 =?utf-8?B?ckErUzYrcE1UYUZrZjVsSUxCcm5XUHBNOGtkWC8xNDY5UzhnVXBWS21FUXlu?=
 =?utf-8?B?eVc4VDQvY0xyZHZ6WCtxMEEyaDBGdlVmbFArN250NU9Zb093Ri9NN1plNlNn?=
 =?utf-8?B?ZDEwRE5GbzZLaysyMmZWY0xLZ0h0c1pGZS9zWVhTdWJDNGk1d1JvN0JOTkFn?=
 =?utf-8?B?R3lLdDNJeEdHTXZhNDNFNzY0UmwvSWw4SGxhTzZNRVRpbW02VDhSTjV1WENW?=
 =?utf-8?B?QmlsbHBDK1VTeXVDLzhvTVlsTlpYb2pTcHhLb3Btd283V2VIVlZmLzdadCty?=
 =?utf-8?B?cW16ZUtBbGx2MG1JWTRaRWRJbTlVZzljTnJDS1FZVkxKNkZjMWlVZEg5MklM?=
 =?utf-8?B?MDYwQzhlM2YwdHNCR0czLythaDdwMGJnQnRFcUllVStLYlMxRW5oblFQMkVE?=
 =?utf-8?B?bzZhSmJPSjNvcXBXbG94UlBPNUlycHBtdzkzQnNVQWNOcEtEYloxREo5M3R6?=
 =?utf-8?B?OWtWTHZFWGc5SHN0TXJyRDY1UVRZTFFkU1lUUVVtNWxZTndMbzJtN2FUd1lh?=
 =?utf-8?B?dm9QRWpGbHUwVmd2QWhUMzFpaXdIbDE4aXhHdktNWkR2RCtGQ20raWlZM1d3?=
 =?utf-8?B?SGFiazEzUVgvNlFLcUNZRFI3Q1RXYXNBLzYvNUNEZ1Q2WmxYOUN5TVZEOFBW?=
 =?utf-8?B?cmg4Vm5JZnFpWHhscDJWcnUxLzBwVE1nYUpldDhQL3F1Q2VJMHNhcDdnRzhC?=
 =?utf-8?B?eDdWbjJNUnROVGVwT3NpRXNCTk9QMHdJR2FiaWdxMGUzRm1rcVFUZHUrbHdO?=
 =?utf-8?B?YnpZSStTaEk2eUVJSXg0emV0bkt3c1JKSVJUWTUzbHE4eS95SUJqa1h4L05I?=
 =?utf-8?B?MkpHMC9ycWFnRXRiM09ZaTBmL01FSVdGNjRhejJTVHlXNmxYSzlzY29zRW5W?=
 =?utf-8?B?dnJGZklXeTVBQU5sSzJZOE4rbXlYKzlQc1NpUVJVcjFtZERMcnMxR01BVkMr?=
 =?utf-8?B?eGVTclQwaW5uci9tTS9sOEl4b0xTcnFqeEQvQVVPYzRBUFNHL0phU2lXQmpF?=
 =?utf-8?B?L1VsWjhJUElqbDVNT1NmZmlUb1REM1NndXJFSVBVUURCRDRtS3VUamFqSGk1?=
 =?utf-8?B?RFJ3V3VmSlpuTlJJQlVFcTBuOVBRYVUvQkdQNjhqSTFZdlhabkZjeS9JOXhR?=
 =?utf-8?B?UTFOZE5xNHJ3blF4Um9BK1hLTWtsblk2Vk5teWFOcFc5a0xsanl3clRmUkZO?=
 =?utf-8?B?aWlpbXlSYk5kUnhVaGFkaW02MWR5eEU4dHhQTFp1U1ZtUFZHR1prdkhwa28z?=
 =?utf-8?B?a08zVUlrTTJtOHZ1QnZzSUZBLzdtUWxRNFpHODJmQlRqTmhvTWhNaUFHLzgy?=
 =?utf-8?B?NU5UaStmaUp4OTBvWFNva0FoU0drbmNhVnB1KyswUHNBWURYZGhmMm42Skc3?=
 =?utf-8?B?OVhZZFRONDdMN3c1TTNZanNaREpnM1lkVlZzSHgzSFhhVjBlQ2cwTHArU2dx?=
 =?utf-8?B?VER2QW5vamlrdmx6K2NOVlJpQXNlcG56dkJoY25Jb0NJMDhiajBTTjdwZ3hv?=
 =?utf-8?B?a213TDB6ZVowRklaODYxbjZUakNvK2lIYmc4Ty9KdTJrODdTMmpneGxvUXJW?=
 =?utf-8?B?SXlzVzM1VThVWkovMTI0Wk9jWGdaWWg4TWN2MG5odFRmblN3aTdCQnBid0pL?=
 =?utf-8?B?ZWFXTEIyS0ovcG9xMEdtclpmMzdvaE9Fa1BWL0ZnVFRiRWd6ZExBMmxQbEsy?=
 =?utf-8?B?T2l6eDdpSGVFRzVTWS9rdCtRdjljQnRWUERtSjM2NmpGUGgwd3o0Wlkrd0RL?=
 =?utf-8?B?T2xWU0QxQUVwWnZLc3VJeFBWdXlqTytUS2JWb251eGd3MXhRaklNd3hPZGw4?=
 =?utf-8?B?R2FVUGRSR3NPWTU3NVBhVjV6bTM5SFJ5clBUVHZwWHNIbmU3a0kycEttRmVL?=
 =?utf-8?Q?5LQWlCoCKUBZdneqB159gQh9w?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5AD87214882AA48B2E0B677F4032259@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23067797-37bd-445e-d1f4-08db3ab60b51
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 17:56:15.0988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lg/XjokrCZGHCZnOkEWXkU4fqF7qXwPZDTszWAqkGYFtZ9HMw8MTOYRaSoLL/1lNwG0OsPOdWVDOGPulocx3yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB4093
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTAzLTI0IGF0IDE1OjU0IC0wNDAwLCBUb20gUml4IHdyb3RlOg0KPiBjbGFu
ZyB3aXRoIFc9MSByZXBvcnRzDQo+IGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5j
OjcxNjoyMTogZXJyb3I6IHVudXNlZCBmdW5jdGlvbg0KPiDCoCAnbWtzc3RhdF9pbml0X3JlY29y
ZCcgWy1XZXJyb3IsLVd1bnVzZWQtZnVuY3Rpb25dDQo+IHN0YXRpYyBpbmxpbmUgY2hhciAqbWtz
c3RhdF9pbml0X3JlY29yZChta3NzdGF0X2tlcm5fc3RhdHNfdCBzdGF0X2lkeCwNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXg0KPiBUaGlzIGZ1bmN0aW9uIGlzIG5v
dCB1c2VkIHNvIHJlbW92ZSBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRvbSBSaXggPHRyaXhA
cmVkaGF0LmNvbT4NCg0KVGhhbmtzLCBNYXJ0aW4gS3Jhc3RldiBhbHJlYWR5IHNlbnQgdGhlIHNh
bWUgcGF0Y2ggdG8gdGhlIGRyaS1kZXZlbCB0d28gd2Vla3MNCmJlZm9yZS4gSXQncyBpbiB0aGUg
ZHJtLW1pc2MtbmV4dCBicmFuY2ggaW4gdGhlIGRybS1taXNjIHRyZWUgYW5kIHNob3VsZCBtaWdy
YXRlIHRvDQprZXJuZWwgZm9yIDYuNC4NCg0Keg0KDQo=

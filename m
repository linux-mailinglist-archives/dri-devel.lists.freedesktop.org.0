Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FFC3EDFB2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 00:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CC889A62;
	Mon, 16 Aug 2021 22:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EEA899EA;
 Mon, 16 Aug 2021 22:06:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSokk+4E84JpRAWu3HnudxTN/yEUQFajaBIpYYjcS/x0/yChuk3Xv3nQImvLgQLwEiLRkySUlV+lM8tPG7WQySky/DMzufasvExsgX1gbB599KAXZmn0bJm98TdbhFCFDVnL2+RJm2FNjxB9SOaR+Zna4i6PaDodHewjKu/MCxVbhufrgknSztAr2yUwZ9kMUlP9ln9Sa7k8SG9gg+Zmt0YJk/9tji2bqydedWe/XsOeN0nIOdQ2bKE0f/prShChd0wnoRXdpjdYfzwlPa+Dkj9F0ku9zhb2Mp/rdtdZ6EBUVyvdOSmVKeLZnF/C9ESvCwGu1hAhmrFJKCWWnM1Y6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pij3bsL0v+tTo92jymAmxuGdbgRdPhEFYcUOrHl4Jm8=;
 b=lY+839RcIZsAyEWP/a4U5GS4YNLxAnhArGtamqx/E0f+YlxshmKK+Y5kOtauJCXAJontRmoAcIO7QvJD/zUs2ixcN6NGHH197uf6r/WrXhk1wz4G1645QNxm7He+pL3pCen3mQJghQaE9KQUucipxekjHt/f8kQZL/QY8ETvGpHTICeTny++1kGiuDMHiiFtiS5kS+xl2GLFdFUaK5c56gplM19Z66V2y/UCddz2aTZqavlJBH4GURCRoGj+sfTWaLBzTvE0Xzc3pFBJfykkQiBEsLQbjuhbpFyrxxgHgbkOOWURwTfOpuPN6c1lu8BeueCok8SU9TA62Oh/e+4EzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pij3bsL0v+tTo92jymAmxuGdbgRdPhEFYcUOrHl4Jm8=;
 b=Bk1Lnzt4w5habziElx2gBr1CgK9v8WibqsaOIddYfKBZZHCmMYksu72fbgtfsSyK9l6reQsk6cdaQL1596+KrpWwKR2n36fnhYIDla85KaOHjDlZmbJ/i9vG6Jl4sFCc8Lmo0CY7BbsG/gCgcOs40PmI1+f2y9jAbUAnhP26v/c=
Received: from DM4PR12MB5374.namprd12.prod.outlook.com (2603:10b6:5:39a::11)
 by DM6PR12MB5536.namprd12.prod.outlook.com (2603:10b6:5:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Mon, 16 Aug
 2021 22:06:38 +0000
Received: from DM4PR12MB5374.namprd12.prod.outlook.com
 ([fe80::6958:68e2:61a1:466f]) by DM4PR12MB5374.namprd12.prod.outlook.com
 ([fe80::6958:68e2:61a1:466f%3]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 22:06:38 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>, Christoph Hellwig
 <hch@lst.de>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>, "linux-ext4@vger.kernel.org"
 <linux-ext4@vger.kernel.org>, "linux-xfs@vger.kernel.org"
 <linux-xfs@vger.kernel.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>
Subject: Re: [PATCH v6 05/13] drm/amdkfd: generic type as sys mem on migration
 to ram
Thread-Topic: [PATCH v6 05/13] drm/amdkfd: generic type as sys mem on
 migration to ram
Thread-Index: AQHXkAz8GPC8PJLriEeuboq3TY2nI6t0txGAgAHZjAD//+IxgA==
Date: Mon, 16 Aug 2021 22:06:38 +0000
Message-ID: <771FC2D4-15CF-464B-96FF-837533A85886@amd.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-6-alex.sierra@amd.com> <20210815153825.GB32384@lst.de>
 <694ea624-9dc7-7a25-78a6-308ee0debaea@amd.com>
In-Reply-To: <694ea624-9dc7-7a25-78a6-308ee0debaea@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.49.21050901
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60fe9f34-7bdc-4b08-557c-08d961021ecb
x-ms-traffictypediagnostic: DM6PR12MB5536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB5536D4392B1ACFD0B20159BE80FD9@DM6PR12MB5536.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2N0NGCd007pP6CKpdC8S7jvbbT+hGvQed9ALVNKSfaNQkHaZRbBJYcfWPNTxHcp/NzjU5XABNOiNj/FhvE8816P4wo9kM9nWeKDolgztrx8mISkZYbW+BO8Cm8qpQu34yMNgDsHszyiSylKT36I5kQJJCmm5afXkS5kYc/MlM8dkTY9+y5bEpEJ8kgyWzUFteS57iyzQ4FwqzeNUyVQejgNPN7PSBLwP9Oqzki5WIhxpvk0Aj34F4BjC1ER6aqRCGQYc/zb+CpGcywvy9jpTTc/cJ93f/D7FXmbEUslAPyiuNL5JjOPD2SHwho9y4KkLXThUiyfp0b8ejHXMiMPAprqvud+wWCF2swjc8Xf4j7E//p9mOsp/54YyZvyQprHdUYjF4T4zoaJQcFF+EHYfTFTfldUxcCSpXBSve/mgYeZm+lxFSVqKj/vUa/4t+tNxj/Iiw9M5EtadOg+OOCBCTA/vnDmrHxzBV82sH23iK+Zm9cdFI8P1QZehPRo2nTF6MYmKjqirXOUnOqFjy0OJymkavMfj9bt8l1fJaZazpwz8cWqvQbak2lO0bRSJmytXnhFPGuabUe2qcpYI5eWHS+F5QxXT2A+ggaPX2GeS8K546jw/hXPYE0xRDvoaXMPlfxd5y4NpZw7BOagEuGi4y0H9dnfAMS/X8LpzhkAfCkR6lkmPZhVD0zClziCe+eBbjI+5sTkAE9+cEPRY4LoE3807fKJU2NVOf6ICOSMk5jEGD2WSk2M9FBXFC6Xg41qH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5374.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(8676002)(110136005)(66476007)(66446008)(8936002)(64756008)(66556008)(478600001)(6506007)(53546011)(38070700005)(26005)(6486002)(86362001)(54906003)(83380400001)(4326008)(2906002)(33656002)(66946007)(2616005)(122000001)(5660300002)(316002)(76116006)(186003)(91956017)(7416002)(71200400001)(6512007)(38100700002)(36756003)(41533002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enE4K3hOSUhZeDdOVm9sSFNrang3c1FIb2loUWJQS3lEMUFYU0E3OWpDb01O?=
 =?utf-8?B?M1hHdDRkQW92bmU5bHFNcmVIaUhqRlR6VU5JZnZVRWltb0xBWUV5Q1lYTFBM?=
 =?utf-8?B?dEhvT2NRUFE0VDU1SVB4eEMzVFZCRDVmT0Y5M2xEdDM5NDJaekg3Q3lWTk1w?=
 =?utf-8?B?RUtxS0dCbFo4SnBObE5xRTZJRUpkS083S01uZ0VOMytlK0FkSjZCY21Za0Fj?=
 =?utf-8?B?NXU2TWc0bVhFUGFhTGQ2VjlPQ1ZSYnkzTWl3eGZkZ1dmRzI5OTNVb2lrTWtQ?=
 =?utf-8?B?Tmo2bzZQU1hvMHU2ZEZkam1yRGFxNkVFcENzNUZJa0lqQWlxYkRaQjZwOHlQ?=
 =?utf-8?B?ZGNOWSt2cWNGTGtQTlgrSXBEODBBa2p0cnlpT2dYYk9GNlBpNS9Tc255dWlU?=
 =?utf-8?B?QUFkbnJpRzRudVM3cUcxb0VjbU0zREFtK1dOaGxQaVdrL0hORmYxTWZQZTh2?=
 =?utf-8?B?MzJvQmYwT25sUHpuVHVGeVZPZTlvSUh4cjc1cTNIdllhVlVWNlFyZzZXMXhh?=
 =?utf-8?B?WUdXVENiMGQxZENhU1YzMUw1bTdNK1RxekRBcTN3ZFlEU0phMzhwR3Z1d3J4?=
 =?utf-8?B?cDR5TURVQlBOc2tOd1ltOEUvTXpvUzZDbWxScHNNc1ZsQlY2TGRGS3BFR1p5?=
 =?utf-8?B?UjRZNzJQUGhuSDd2ekJoZmNYQ0E3Wmdyc05SSFk2dzRnb3dnQmRzS09IMm9t?=
 =?utf-8?B?Z0FWcEpYNzRzbXBWSUs2TjNsMWt2ZVo2MU9LRmxwRTlBaG55QWJldk9lT2l6?=
 =?utf-8?B?L3hjZ0Q5amZ3V1dtaHNxL3FyUnc3cmIyalI4QUFjR1hwNzhSVlRyNTFOcEp1?=
 =?utf-8?B?d2wxbitwaUk3ZWl5b01MY1Q3QVJkSTRCaWNKMW8yTUhxOE5CWTJqeElYZnB0?=
 =?utf-8?B?WXpURFptdlNwdy9rZFVJVEV6VzVZcmdHTDcvaitCc3RXS0pTOVRYTVg4VWxw?=
 =?utf-8?B?TGRCc3puNVVDVTdhZ1ZSN3ozcjk2UitKMHJjMXkzaGQ0OUtQNUJ3dHRyWkMy?=
 =?utf-8?B?RW03K0psTzd5MlZZY3owODY0Vy8wTFJ1c2FML3lBckwxMExtZFQrMlpKTWxq?=
 =?utf-8?B?dWU3OXhVcEVXZUZlQXIwS21PVm1GRnJWUDBUWjN6UXg1a2FqNDNydGh4YW11?=
 =?utf-8?B?c3ZueVdkT1NZQURMekZjZ1dmZHVLWS95RDJBVlU1OE4xa1pRV0s5VUR1T2pS?=
 =?utf-8?B?emFuM1FnS0ZhV0RtdXBzdEtvT3REOXV2YTFTTXlGdStzMmgyc3ZkTnRhbHZK?=
 =?utf-8?B?dDdyR3RjSVNtZEtlYkd0SDBrRXhoWVBBMDJDeHlJWDZLRHQxRWtEY0NFOUZW?=
 =?utf-8?B?b1AvTThnWXJaaGFxUnhCOTg1QVZnYlMzdjdLbG5HMXB5Z1hQQ2twWDNxYk1y?=
 =?utf-8?B?djNlYUg3WG9wUTQvdzAyb0xNcDRxOVZIM1Z0dk9pUzFUUlp1M0R4ckVGQmw5?=
 =?utf-8?B?clN3bU11ZkNwSXJDV2NEU2NCL2pZRTEvNnVCcUIxZ3lpejgzUzBuQWdham0y?=
 =?utf-8?B?Ym9VMW9iVWRHRFdJUDBzRXp2ZWpkOHhWNnRuZng2Yk5vMzY0TWo5WDBXSnZp?=
 =?utf-8?B?WXBDRmNxVjdJMDhkdGgxUWROTktpbnQrQUd1dUp0WFc5dDNaUTdzRmtQdTlD?=
 =?utf-8?B?L2NUeC83ZFhZalU1UWdoaW1kdkNSWjhoZkh0NFhRUzd0TFcwR3FweE9jWWhu?=
 =?utf-8?B?cXI4blN1TE1yZ0xnQVo1c1ZhdUh5bDNGZ2pISG5DTjA5UDJQK1A2NEVmWjNV?=
 =?utf-8?Q?TgZrh6NByF5A3KmAntQkCPbe4MIYOme+yBeQoNl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8699A48575CB14DBFE9CA5CFC9F20FA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fe9f34-7bdc-4b08-557c-08d961021ecb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2021 22:06:38.2882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /OpvEroORl0nVMFxjFoWLx46g76ljWmdv0SBfQKt6iDDgUg/4GxsdXtn2xrAp8Je
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5536
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

DQoNClJlZ2FyZHMsDQpPYWsgDQoNCiANCg0K77u/T24gMjAyMS0wOC0xNiwgMzo1MyBQTSwgImFt
ZC1nZnggb24gYmVoYWxmIG9mIFNpZXJyYSBHdWl6YSwgQWxlamFuZHJvIChBbGV4KSIgPGFtZC1n
ZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmcgb24gYmVoYWxmIG9mIGFsZXguc2llcnJh
QGFtZC5jb20+IHdyb3RlOg0KDQoNCiAgICBPbiA4LzE1LzIwMjEgMTA6MzggQU0sIENocmlzdG9w
aCBIZWxsd2lnIHdyb3RlOg0KICAgID4gT24gRnJpLCBBdWcgMTMsIDIwMjEgYXQgMDE6MzE6NDJB
TSAtMDUwMCwgQWxleCBTaWVycmEgd3JvdGU6DQogICAgPj4gICAJbWlncmF0ZS52bWEgPSB2bWE7
DQogICAgPj4gICAJbWlncmF0ZS5zdGFydCA9IHN0YXJ0Ow0KICAgID4+ICAgCW1pZ3JhdGUuZW5k
ID0gZW5kOw0KICAgID4+IC0JbWlncmF0ZS5mbGFncyA9IE1JR1JBVEVfVk1BX1NFTEVDVF9ERVZJ
Q0VfUFJJVkFURTsNCiAgICA+PiAgIAltaWdyYXRlLnBnbWFwX293bmVyID0gU1ZNX0FERVZfUEdN
QVBfT1dORVIoYWRldik7DQogICAgPj4gICANCiAgICA+PiArCWlmIChhZGV2LT5nbWMueGdtaS5j
b25uZWN0ZWRfdG9fY3B1KQ0KICAgID4+ICsJCW1pZ3JhdGUuZmxhZ3MgPSBNSUdSQVRFX1ZNQV9T
RUxFQ1RfU1lTVEVNOw0KICAgID4+ICsJZWxzZQ0KICAgID4+ICsJCW1pZ3JhdGUuZmxhZ3MgPSBN
SUdSQVRFX1ZNQV9TRUxFQ1RfREVWSUNFX1BSSVZBVEU7DQogICAgPiBJdCdzIGJlZW4gYSB3aGls
ZSBzaW5jZSBJIHRvdWNoZWQgdGhpcyBtaWdyYXRlIGNvZGUsIGJ1dCBkb2Vzbid0IHRoaXMNCiAg
ICA+IG1lYW4gdGhhdCBpZiB0aGUgcmFuZ2UgYWxyZWFkeSBjb250YWlucyBzeXN0ZW0gbWVtb3J5
IHRoZSBtaWdyYXRpb24NCiAgICA+IG5vdyB3b24ndCBkbyBhbnl0aGluZz8gZm9yIHRoZSBjb25u
ZWN0ZWRfdG9fY3B1IGNhc2U/DQoNCiAgICBGb3IgYWJvdmXigJlzIGNvbmRpdGlvbiBlcXVhbCB0
byBjb25uZWN0ZWRfdG9fY3B1ICwgd2XigJlyZSBleHBsaWNpdGx5IA0KICAgIG1pZ3JhdGluZyBm
cm9tDQogICAgZGV2aWNlIG1lbW9yeSB0byBzeXN0ZW0gbWVtb3J5IHdpdGggZGV2aWNlIGdlbmVy
aWMgdHlwZS4gDQoNCkZvciBNRU1PUllfREVWSUNFX0dFTkVSSUMgbWVtb3J5IHR5cGUsIHdoeSBk
byB3ZSBuZWVkIHRvIGV4cGxpY2l0bHkgbWlncmF0ZSBpdCBmcm9tIGRldmljZSBtZW1vcnkgdG8g
bm9ybWFsIHN5c3RlbSBtZW1vcnk/IEkgdGhvdWdodCB0aGUgZGVzaWduIHdhcywgZm9yIHRoaXMg
dHlwZSBvZiBtZW1vcnksIENQVSBjYW4gYWNjZXNzIGl0IGluIHBsYWNlIHdpdGhvdXQgbWlncmF0
aW9uKGp1c3QgbGlrZSBDUFUgYWNjZXNzIG5vcm1hbCBzeXN0ZW0gbWVtb3J5KSwgc28gdGhlcmUg
aXMgbm8gbmVlZCB0byBtaWdyYXRlIHN1Y2ggdHlwZSBvZiBtZW1vcnkgdG8gbm9ybWFsIHN5c3Rl
bSBtZW1vcnkuLi4NCg0KV2l0aCB0aGlzIHBhdGNoLCB0aGUgbWlncmF0aW9uIGJlaGF2aW9yIHdp
bGwgYmU6IHdoZW4gbWVtb3J5IGlzIGFjY2Vzc2VkIGJ5IENQVSwgaXQgd2lsbCBiZSBtaWdyYXRl
ZCB0byBub3JtYWwgc3lzdGVtIG1lbW9yeTsgd2hlbiBtZW1vcnkgaXMgYWNjZXNzZWQgYnkgR1BV
LCBpdCB3aWxsIGJlIG1pZ3JhdGVkIHRvIGRldmljZSB2cmFtLiBUaGlzIGlzIGJhc2ljYWxseSB0
aGUgc2FtZSBiZWhhdmlvciBhcyB3aGVuIHZyYW0gaXMgdHJlYXRlZCBhcyBERVZJQ0VfUFJJVkFU
RS4gDQoNCkkgdGhvdWdodCB0aGUgd2hvbGUgZ29hbCBvZiBpbnRyb2R1Y2luZyBERVZJQ0VfR0VO
RVJJQyBpcyB0byBhdm9pZCBzdWNoIGJhY2sgYW5kIGZvcnRoIG1pZ3JhdGlvbiBiL3QgZGV2aWNl
IG1lbW9yeSBhbmQgbm9ybWFsIHN5c3RlbSBtZW1vcnkuIEJ1dCBtYXliZSBJIGFtIG1pc3Npbmcg
c29tZXRoaW5nIGhlcmUuLi4uDQoNClJlZ2FyZHMsDQpPYWsNCg0KSW4gdGhpcyB0eXBlLCANCiAg
ICBkZXZpY2UgUFRFcyBhcmUNCiAgICBwcmVzZW50IGluIENQVSBwYWdlIHRhYmxlLg0KDQogICAg
RHVyaW5nIG1pZ3JhdGVfdm1hX2NvbGxlY3RfcG1kIHdhbGsgb3AgYXQgbWlncmF0ZV92bWFfc2V0
dXAgY2FsbCwgDQogICAgdGhlcmXigJlzIGEgY29uZGl0aW9uDQogICAgZm9yIHByZXNlbnQgcHRl
IHRoYXQgcmVxdWlyZSBtaWdyYXRlLT5mbGFncyBiZSBzZXQgZm9yIA0KICAgIE1JR1JBVEVfVk1B
X1NFTEVDVF9TWVNURU0uDQogICAgT3RoZXJ3aXNlLCB0aGUgbWlncmF0aW9uIGZvciB0aGlzIGVu
dHJ5IHdpbGwgYmUgaWdub3JlZC4NCg0KICAgIFJlZ2FyZHMsDQogICAgQWxleCBTLg0KDQoNCg==

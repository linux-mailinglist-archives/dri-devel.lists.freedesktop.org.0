Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEDD2F29D0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C95D89CB8;
	Tue, 12 Jan 2021 08:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B65489CB8;
 Tue, 12 Jan 2021 08:16:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yv9hluJCfAsCV6rhqbDqyRZVJZMD3VZrcQwDtx0MnNuaDKAr2/om20KXNMrqYB4CsU7p6vvFSPYEpZPSGOK6jHQTXx+LLJJ9g8JjeRTMrKURXjNcWT7prlAxIa+Zbv/4pQtk1S/XJPp+8z/UKASJBFalz9g+iDjmdw/NIkqZeZ9gfdItE19fd4aY8MinTTDU1FE8lt1doJgjTFQLqOAP+eooahiMNSCj4jsGwM1eSn95shDrMFDZd6ThEnSDIQmRlYTwpQwcnL0/C0z7iVemQTVEARWx5P+qjFDsI028YREf5TwxMH+akgJSd2Fg7Ee0uY9CtFGd8Nl3hyLWU+wRZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B//ErVWJu88kYiMZow+EVGTvx2agDKbt/CROHaG8JWU=;
 b=X7Af3V5DjidgOfjWNWajHiamoyyuXZAQ8xkZ8SJi2p5SzcDAPmLDB9MBmKJT22i7Vs5QCN11hnaRQBukhAMEmxO/rRlanvIVi1X/Kz4k5rhLVcmJmDRHzEy0ExaqVgMNszQa30iIqQxrLB5gbvhcDpdZnyUCwNN5D+P8DFaeG/0sUNvUd77q7FMvKcPFenrBwLmWwCncC49B+1ehxog4Y7SbKG2bbiN36qZyIdxnZiRD+ggj5TEZZPDx2yC0639ccltMGqczsMQ1t5u18Z4cIbbnvx75Cv3TLmlnWUJY5VXY4jXwEyh+3ZWoEYXml7m3y8gcelo9SfSjkVcVb1Y85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B//ErVWJu88kYiMZow+EVGTvx2agDKbt/CROHaG8JWU=;
 b=GgZyNz4q4jvZ7ayys90cuq9Ea1UE4YME2mUDdt2kZawAAgSxMbdECLEuNkzAtgSu919gT26BkrRPH9Sx2FNMpB8OgZMKtprmCxob3T6TzEsflGx1JJFAjLy4koFN9NJofICtHz4oyM8ZValj8z10O7ppyqD+PBFjtJjfJr4dPfw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 12 Jan
 2021 08:16:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 08:16:17 +0000
Subject: Re: [PATCH 0/6] Move struct drm_device.hose to legacy section
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 alexander.deucher@amd.com
References: <20210112081035.6882-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4d743b2c-ef10-00f4-3f4b-ddfaa509fbbb@amd.com>
Date: Tue, 12 Jan 2021 09:16:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210112081035.6882-1-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR05CA0121.eurprd05.prod.outlook.com
 (2603:10a6:207:2::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0121.eurprd05.prod.outlook.com (2603:10a6:207:2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.20 via Frontend Transport; Tue, 12 Jan 2021 08:16:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 19a187bb-abc6-405c-4474-08d8b6d25640
X-MS-TrafficTypeDiagnostic: MN2PR12MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4126BB638F61F530A2DA08E783AA0@MN2PR12MB4126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f/1YYFPP3rabzC+jetXxGzWFVg7F1kwpgRlOAcDnfGQG5LQHZLLaI0KBd1oesXE/MdQS44p6EuQh0B3wbkfZvBAImlHO3oABx6cKmPHdapSPYq0cVV1SbRII+IQCitU5cFKh6EFlU3KA7dMarnseIBmqslmAlMrYMhWEiRomzfBFPaDAVFpFEHwIwYLSvjX/64BCmuk9dHJh1Y8vYdrYxfF9qEFVfdNOUzD/D2svHJz3qpw/XsilHal3ChYPVwQy/W71LRlUiULuJfNogIsjSaTYmo2KUM4Z82iG2q/A/hcxHyfxYmVkNbqS+SmUpY6tsyWxta5Q5dINsTYcG9mK+cA+V9KfYyM4MicOOBhUdh6WaA+cRF8Wlk0MdaO5vdGa8u3m7bCx1Rh6Bxi8wmc/2KCwLBlQ0F9XdKHcW3yO4Za6y/6y4wxwCEMajab6bXLN6WTL3rVl89Qq/+HpUJfCZGR/cDYGtxestnRxUfBlhEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(66946007)(478600001)(31696002)(6636002)(66556008)(6666004)(8676002)(2616005)(66476007)(5660300002)(316002)(6486002)(4326008)(8936002)(86362001)(52116002)(186003)(2906002)(16526019)(66574015)(31686004)(36756003)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SzlIREIxa1JJeHgxVWVFL25RTGk3SUx0KzhLdkZyakx0OFlkWGxqSzc1OFdk?=
 =?utf-8?B?bGlWd1BSR2xuNEszVlBodlE5YUZVZ0dlZzREdVB4MklNR0h4QUJ2V29SZXVa?=
 =?utf-8?B?dk0rMUd1TWpSNE0vQ1BoMVB1aCtuUGZPaFhyZCtKc2cwN2xqUVVBVElBbWFM?=
 =?utf-8?B?c21KNG1vNFFnbWY0aUpYRGdvVnR5YlJvWjFuN1JyNmxldGR5UTdUSjRqdVQr?=
 =?utf-8?B?eG1INld6ckcya3pCU2FNMEFTQXFzaGc2ZnRjNDYrTk9nd2xpZ1oyWXVSOEp5?=
 =?utf-8?B?dkw2U3BNM053K2Jibi9MVVFGOXpsN3c5WHJoanpZcHNJblJETEZMSC8rN0JX?=
 =?utf-8?B?b2MxTk9rbDJ0YnB2aVpicU9hNnJMOWtoWGxyd0tyMHUxUzdRQ05SNWY0ZzJD?=
 =?utf-8?B?czJBTWgzbnN0bmR4dmZHU3pyaWNDbFNpb1o5aUcvaG94TXRyN2xDZGE2Mysw?=
 =?utf-8?B?dVFhZnVLSVNYVmhKZEFUTmxKUjdZVVVJdjBOUG5WM0ZJc0pIKzFTdkhzYnhV?=
 =?utf-8?B?akVhZ2MzZXk3bk5HNG9CY09aZktXZ1JtN0dybzVXWGkyQkdwM09FMGZ4Tm9y?=
 =?utf-8?B?c2d6RXl4VVJxQmhuRVhid0dDU2p1WnVKZFl2bE9uN1lWdUs0ZjZsbmJxbmt0?=
 =?utf-8?B?bmNQWEpMWnloMEhreFFjaS9xTlhOWk5FN0lHSlQ4R3VIL2dUSlZueGJEVStM?=
 =?utf-8?B?eXNHalJjWWVUL29OSmJUN2NxZURVelRpYWpIQVdrcU1tYmpqdURJTGZacVRi?=
 =?utf-8?B?YnV4NE03Tm92K2hTajJYNkZZZkMwd2FVNVErVDJWLy9oREJkVDdFcWJLdUFX?=
 =?utf-8?B?TEpreWEyZTRnUHQzNXlvM3lTelAxTmpSQ0k2UzJsQlcxWlpCdS9XbStLRWVh?=
 =?utf-8?B?Y3lMOSt0amdwTFIxc2JnYi9yejJDNjZZS3Zyb2pZaHZHNWVyZ093d2t6bGk2?=
 =?utf-8?B?U2VUand0aGI1Qnpia3hCTTZEaXRpWjFMRENyZkc2ODBEc3FkL1E2NWRvRVRw?=
 =?utf-8?B?N3QzQy9PQ3U3aWtvUVpzV0J6a3NxaWsvWlZTeHFpQTZDVGxoaXNjSVRaMS9M?=
 =?utf-8?B?bi93cEhmSVRTdUNISXBPejR6Zmo3NWFjRDJUelArZmdqK29BSUNZMEc5Zkc2?=
 =?utf-8?B?Smp0SGdjVFB6eHNnSW50eHg3R1hnM0M4aVN2dHZUMGE3OWJhVmFLQi9tUGhQ?=
 =?utf-8?B?RVB6MmNXRHpMYWs2bXMrRkJ0cE0wUFBUZ09yUDhlMGNkMjJaMWRtd3VFUlp6?=
 =?utf-8?B?ekE3R3Vza3UzU0VSS2dCWGFGbkdzemE4WTRXeDQwNFN3TnFKSDd3c3VKSEln?=
 =?utf-8?B?dTNMUjQ4Z3FWT050MW9UbnJxNUFRRDIzNURKY2hFV25hY1ZicXJ1aVFTZHZZ?=
 =?utf-8?B?WFJoOWFHamEzdFp1K1ZZamZmNVkyUkIzRmN2NWZUSnNCaUoxeldScVViQWhr?=
 =?utf-8?Q?5w1U2Q8q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 08:16:17.8225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a187bb-abc6-405c-4474-08d8b6d25640
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8GxrFkhOxp1asat5FSjmMdgiIEIjJXlMCS1U7XB7GX+FGsksFHmnPhE17pnSN36
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSdtIG5vdCBldmVuIHN1cmUgdGhlIHJhZGVvbiBzdHVmZiBzdGlsbCBjb21waWxlcy93b3JrcyBv
biBhbHBoYSA6KQoKQW55d2F5IGxvb2tzIHNhbmUgdG8gbWUgYW5kIHRoZSB3aG9sZSBzZXQgaXMg
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiAKS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
LgoKVGhhbmtzLApDaHJpc3RpYW4uCgpBbSAxMi4wMS4yMSB1bSAwOToxMCBzY2hyaWViIFRob21h
cyBaaW1tZXJtYW5uOgo+IFRoaXMgcGF0Y2hzZXQgbW92ZXMgc3RydWN0IGRybV9kZXZpY2UuaG9z
ZSB0byB0aGUgc2VjdGlvbiBmb3IgbGVnYWN5Cj4gZHJpdmVycy4gQXMgcGFydCBvZiB0aGlzLCBh
IG51bWJlciBvZiBvdGhlciBjaGFuZ2VzIGFyZSBhcHBsaWVkIGluCj4gb3JkZXIgdG8gcHJvdGVj
dCBhbGwgdXNlcyBvZiBob3NlIGJ5IENPTkZJR19EUk1fTEVHQUNZLgo+Cj4gUGF0Y2hlcyAxIHRv
IDMgbW92ZSBub24tbGVnYWN5IGNvZGUgb3V0IHB1dCBkcm1fbWVtb3J5LmMgYW5kIGFkZCB0aGUK
PiByZW1haW5pbmcgSS9PLW1lbW9yeSBoZWxwZXJzIHRvIHRoZSBsZWdhY3kgY29kZS4KPgo+IFBh
dGNoIDQgYWRkcmVzc2VzIENPTkZJR19EUk1fVk0sIHdoaWNoIGlzIG9ubHkgc2VsZWN0ZWQgYnkg
bGVnYWN5Cj4gZHJpdmVycywgc28gZHJtX3ZtLmMgY2FuIGRpcmVjdGx5IGJlIGNvbXBpbGVkIGJ5
IENPTkZJR19EUk1fTEVHQUNZLgo+Cj4gUGF0Y2ggNSBjaGFuZ2VzIHJhZGVvbiB0byBtYWludGFp
biBpdHMgb3duIGNvcHkgb2YgdGhlIGhvc2UgZmllbGQgb2YKPiBzdHJ1Y3QgZHJtX2RldmljZS4K
Pgo+IFBhdGNoIDYgbWFrZXMgdGhlIGhvc2UgZmllbGQgbGVnYWN5Lgo+Cj4gVGhlIHBhdGNoc2V0
IGhhcyBiZWVuIGNvbXBpbGUtdGVzdGVkIHcvbyBDT05GSUdfRFJNX0xFR0FDWSBlbmFibGVkLgo+
Cj4gVGhvbWFzIFppbW1lcm1hbm4gKDYpOgo+ICAgIGRybTogSW5saW5lIEFHUCB3cmFwcGVycyBp
bnRvIHRoZWlyIG9ubHkgY2FsbGVycwo+ICAgIGRybTogSW1wbGVtZW50IGRybV9uZWVkX3N3aW90
bGIoKSBpbiBkcm1fY2FjaGUuYwo+ICAgIGRybTogQnVpbGQgZHJtX21lbW9yeS5vIG9ubHkgZm9y
IGxlZ2FjeSBkcml2ZXJzCj4gICAgZHJtOiBNZXJnZSBDT05GSUdfRFJNX1ZNIGludG8gQ09ORklH
X0RSTV9MRUdBQ1kKPiAgICBkcm0vcmFkZW9uOiBTdG9yZSBQQ0kgY29udHJvbGxlciBpbiBzdHJ1
Y3QgcmFkZW9uX2RldmljZS5ob3NlCj4gICAgZHJtOiBNb3ZlIHN0cnVjdCBkcm1fZGV2aWNlLmhv
c2UgdG8gbGVnYWN5IHNlY3Rpb24KPgo+ICAgZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAg
ICAgICAgfCAgNSAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgIHwg
IDYgKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9hZ3BzdXBwb3J0LmMgICAgfCAxMiArKyst
LS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMgICAgICAgICB8IDMyICsrKysrKysr
KysrKysrKysrKwo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMgICAgICAgICAgfCAgMiAr
Kwo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9sZWdhY3kuaCAgICAgICAgfCAgMiArLQo+ICAgZHJp
dmVycy9ncHUvZHJtL2RybV9tZW1vcnkuYyAgICAgICAgfCA1MSAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaCAgICAgfCAgMyAr
Kwo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgfCAgNCAtLS0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jIHwgIDQgKysrCj4gICBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyB8ICAyICstCj4gICBpbmNsdWRlL2RybS9kcm1fYWdw
c3VwcG9ydC5oICAgICAgICB8IDE4IC0tLS0tLS0tLS0KPiAgIGluY2x1ZGUvZHJtL2RybV9kZXZp
Y2UuaCAgICAgICAgICAgIHwgIDkgKystLS0KPiAgIDEzIGZpbGVzIGNoYW5nZWQsIDU3IGluc2Vy
dGlvbnMoKyksIDkzIGRlbGV0aW9ucygtKQo+Cj4KPiBiYXNlLWNvbW1pdDogY2QwZGYyMWUyOGMz
NmRlODAzNTYzNDRmZjg2ODNiZTI4MTNjNmZmMgo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogYzJi
MmYwOGYwZWNjYzlmNWRmMGMwZGE0OWZhMWQzNjI2N2RlYjExZAo+IC0tCj4gMi4yOS4yCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

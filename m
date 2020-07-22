Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C2F22964F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 12:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AB56E804;
	Wed, 22 Jul 2020 10:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8846E471
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 10:36:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmGoDR23OsjvPGNNlnep/L2lm3CpZVTz6AQqgQh93eK1SSqCHnc7GA9L/eex5OK1/3BtRPHAvqJCKMIenGSyTOeBPZwbEjc0wPlz6hWWzn0DLxQlgjPNJKYIQUJxq6i9znzDP395Ic0VO4+g8ffxeywApw6/OG5wNq0lqLn03VNUjdaBjhsVi8RXYr08LmvVrCcod1XYBvgyGszBmYpxL9qrh+pnRI4YuHBDKaTmSMpP08DY3vQHJk9Ce4GwdDY4lMfCTVAI9I2euZ9G+E+90zpPrZxmfR9ZaBEu/7LfPIpIIF1OW+ktW3AeyFELf984aSTNyc9xYZGXYZspE+1phw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOY0JEIGCX1BJwf0qf/iSolMw4aoo53hQRvTCvAGa+w=;
 b=iA6l4tq/5RrZpE+7W2ZZ7z7xhriLnphWRPJsp54nEirk0UVUGYJQictxcbS18o6TJliCUhRCalHKwETKjdwn7Z3zI8IJCeywAUN1wDVYox11udJtp/lFIb/rrS87eEWigrgmKRiPQ2ndhPIa116h2MIII307Mc2ozFVbqvo8PMozLSzQyEKsFkUAphrVOcPjFZH8L+QHzBlZUVJgD4Cx81AjBq+t4h0nIo0M/QbCiGXBfkjMTl7swQhFLKiBrL1f9dGuLZYoJgi/y6712wKkdG6D/wmxPeYdEonB3IKpwE+0C6BE9jBoTBjDE8BSP3aF1x6bkAhZEYFfK04+vozw5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOY0JEIGCX1BJwf0qf/iSolMw4aoo53hQRvTCvAGa+w=;
 b=TGUrcZKn2zrE3mQxb9USCgdrjW5TeQFk9qK/oKBuPB5BkIf4Zy02VAHTibp2Pem+cXEo595zWbP6U1KKp8C0mDG4OWV/FyFz+Ehn9GYlSdujgpqXVIc04VpnxReTI5kNde+upG3ABgYsfCR5hjBZrmGhHAwQMRKrL+PS2+xqVEg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Wed, 22 Jul
 2020 10:36:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.021; Wed, 22 Jul 2020
 10:36:06 +0000
Subject: Re: pages pinned for BO lifetime and security
To: Daniel Vetter <daniel@ffwll.ch>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>
References: <CAPaKu7S2BjymZN1pPnYz-YAXpHsD8Q_EPxttifhoTBc-Qe52dg@mail.gmail.com>
 <CAAfnVB=9o=xy13Z1ErgXVhcBf24TLQMGJHnfDKoSMSw2MZdg2A@mail.gmail.com>
 <ed03508d-c87d-681e-4c24-c5c8e26ed72a@amd.com>
 <CAKMK7uHWM59iMx=MA+4sTxw-8-3qwc_ajw297vPKH+NL7yUBrg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d8316a7d-f30e-8b73-db39-5f6432aa3a7e@amd.com>
Date: Wed, 22 Jul 2020 12:36:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAKMK7uHWM59iMx=MA+4sTxw-8-3qwc_ajw297vPKH+NL7yUBrg@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.15 via Frontend Transport; Wed, 22 Jul 2020 10:36:04 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5fc65b82-8065-45e6-10a0-08d82e2b09e1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-Microsoft-Antispam-PRVS: <MN2PR12MB455199FD39D32E73263A17A383790@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 00m077sNERvICYqEZeLYT/QZ21XRmFyOTLTxNOVv2vLKfb8eVP13e2BJAT56DWD7eUrsAZCjqskz/lB8Oo/EIPs7TVycslpAmzBBC5Bos+Gge5RvVjNEXlprjqto5Vtxmu35cI7J/ejmWeUrz6Hu0sYZ8c56+60dp7+j54hD3m2PwTO/rnemKyR4ztTvpfWBB/lsm/+qNo9k1xPx/eD41Sr6iE9CRs8lJEgVeST4H9xCSM7riuhgyg4zoMJnPh+0oZF05dwuzkK5R9X1jYkNSssnC23AyLL/Q/jH2WXYa8Pf3MpIlSKpJZZO3kU6DPiFD9BVyLtNk7KlK3OX1+fNuwlI5cdZsW33ojoU7AMFo+AMAkyjpUiM3u/RzUYaUvM3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(66574015)(83380400001)(186003)(16526019)(54906003)(52116002)(53546011)(478600001)(2906002)(110136005)(316002)(6486002)(5660300002)(2616005)(86362001)(31696002)(66556008)(66946007)(31686004)(36756003)(66476007)(6666004)(4326008)(8936002)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4RMeVRdDzEy9o+U5UKOr+bW/k3Ej6Kz71Yw64J8eBzE2c069Wax/U2/3qJ4lUeSo3qHhFr+c1TgJqJEXGlZ8MPs0Cn2IRN6YuIiNBuZDx+h661hz3NGEXTsTIdSQdLtyPTzyA2btAqY1KFc0PzA7holVYes7/kNiyK6wlG3zep0RWUxMUbY7V9g9+em9XJBj+cRdU54nMCSPhDRL4KHou8rOD+yb5KhT9iBsWRR6kBt3gXxq1JedfjeuWxVME9NagaTkJ+a5Lflb11zEetnGCGg3NdBiM+rr50+bk+K4bUxxxJv98e+NEsGGB1mmRvoy2fz54DzPdHGr8kk6GYwU8mLeGo37X+WqJNPWJWkfuycYXtPoKD19Q4xQCNRSGGtDwbyLcF6nqg+Q/GMojj89PD+jFwqTF6XvL5J77uHrNFpr8n2qREi7kiBRga8Jm1jl3902EkTERPOWuFdtYsbjoBDkAweQ6sLuQ3+u3EqfrgbBztuYefeHgVe8wR6maXHBqqfabPEABAmsATfVwBCdgCYo/DIrFySJwGc4f+uxc0Y2OcAaX38dly3pq286MY+l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc65b82-8065-45e6-10a0-08d82e2b09e1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 10:36:05.8520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmUHaIjLM0mxJbURtGAZ+5FC+U314lmmXGgO/07ZtiZDohdcOvnThZOIF4hJNY5d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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
Cc: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDcuMjAgdW0gMDk6NDYgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgSnVs
IDIyLCAyMDIwIGF0IDk6MTkgQU0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOgo+PiBBbSAyMi4wNy4yMCB1bSAwMjoyMiBzY2hyaWViIEd1cmNoZXRh
biBTaW5naDoKPj4+IE9mIHRoZSBkZXNrdG9wIEdQVSBkcml2ZXJzLCBpOTE1J3Mgc2hyaW5rZXIg
Y2VydGFpbmx5IHN1cHBvcnRzIHB1cmdpbmcKPj4+IHRvIHN3YXAuICBUVE0gaXMgYSBiaXQgaGFy
ZCB0byBmb2xsb3cuICBJIGNhbid0IHJlYWxseSB0ZWxsIGlmIGFtZGdwdQo+Pj4gb3Igbm91dmVh
dSBzdXBwb3J0cyB0aGF0LiAgdmlydGlvLWdwdSBpcyBtb3JlIGNvbW1vbmx5IGZvdW5kIG9uCj4+
PiBzeXN0ZW1zIHdpdGggc3dhcHMgc28gSSB0aGluayBpdCBzaG91bGQgZm9sbG93IHRoZSBkZXNr
dG9wIHByYWN0aWNlcz8KPj4KPj4gV2hhdCB3ZSBkbyBhdCBsZWFzdCBpbiB0aGUgYW1kZ3B1LCBy
YWRlb24sIGk5MTUgYW5kIG5vdXZlYXUgaXMgdG8gb25seSBhbGxvdyBpdCBmb3Igc2Nhbm91dCBh
bmQgdGhhdCBpbiB0dXJuIGlzIGxpbWl0ZWQgYnkgdGhlIHBoeXNpY2FsIG51bWJlciBvZiBDUlRD
cyBvbiB0aGUgYm9hcmQuCj4gU29tZXdoYXQgYXNpZGUsIGJ1dCBJJ20gbm90IHN1cmUgdGhlIHR0
bSBzaHJpbmtlciByZWFsbHkgd29ya3MgbGlrZQo+IHRoYXQuIEkgdGhpbmsgdGhlcmUncyB0d28g
cGFydHM6Cj4gMS4ga2VybmVsIHRocmVhZCB3aGljaCB0YWtlcyBidWZmZXJzIGFuZCB1bmJpbmRz
IHRoZW0gd2hlbiB3ZSdyZSBvdmVyCj4gdGhlIHR0bSBnbG9iYWwgbGltaXQuIFRoaXMgaXMgdGhl
IHR0bV9zaHJpbmtfd29yayBzdHVmZiwgYW5kIGl0IG9ubHkKPiBzaHJpbmtzIGlmIHRoZSB6b25l
IGlzIG92ZXIgYSBoYXJkIGxpbWl0LiBCZWxvdyB0aGF0IGl0IGp1c3QgbGVhdmVzCj4gYnVmZmVy
cyBwaW5uZWQuCj4KPiAyLiBBY3R1YWwgY29yZSBtbSBzaHJpbmtlciwgd2hpY2ggcmVsZWFzZXMg
YnVmZmVycyBoZWxkIGluIGNhY2hlIGJ5Cj4gdHRtX3BhZ2VfYWxsb2NfZG1hLmMuIEJ1dCB0aGF0
IG9ubHkgaGFwcGVucyB3aGVuIGJ1ZmZlcnMgaGF2ZSBiZWVuCj4gdW5ib3VuZCBieSB0aGUgZmly
c3QgdGhyZWFkLCBzbyBhbnl0aGluZyBiZWxvdyB0aG9zZSBoYXJkIGxpbWl0cyBpcwo+IG5vdCBz
aHJpbmthYmxlLiBBbmQgaWlyYyB0aG9zZSBoYXJkIGxpbWl0cyBhcmUgbGlrZSBoYWxmIG9mIHN5
c3RlbQo+IG1lbW9yeSBvciBzbyAobGFzdCB0aW1lIEkgbG9va2VkIHRocm91Z2ggdGhpcyBzdHVm
ZiBhdCBsZWFzdCkuCj4KPiBObyBpZGVhIHdoeSBleGFjdGx5IHRoaW5ncyBhcmUgbGlrZSB0aGV5
IGFyZSwgc2luY2UgdGhlIGZpcnN0IHRocmVhZAo+IGFscmVhZHkgZG9lcyBhIGRtYV9yZXN2X3Ry
eWxvY2ssIGFuZCB0aGF0J3MgZW5vdWdoIHRvIGF2b2lkIGxvY2tpbmcKPiBpbnZlcnNpb25zIHdo
ZW4gYmVpbmcgY2FsbGVkIGZyb20gMi4gT3Igd2VsbCwgc2hvdWxkIGJlIGF0IGxlYXN0LCBmb3IK
PiByZWFzb25hYmxlIGRyaXZlciBkZXNpZ24uCgpZZXMsIHRoYXQncyBjdXJyZW50bHkgYSBiaXQg
bWVzc3kgaW4gVFRNIGFuZCBub3Qgc3VjaCBhIGdvb2QgZGVzaWduIG92ZXIgCmFsbC4KCj4gVGhl
IG9ubHkgb3RoZXIgdGhpbmcgSSdtIHNlZWluZyBpcyB0aGUgZ2xvYmFsIGxydSwgYnV0IHRoYXQg
Y291bGQgYmUKPiBmaXhlZCBieSBoYXZpbmcgYSBwZXItZGV2aWNlIGNvcmUgbW0gc2hyaW5rZXIg
aW5zdGFuY2Ugd2hpY2ggZGlyZWN0bHkKPiBzaHJpbmtzIHRoZSBwZXItZGV2aWNlIGxydS4gQW5k
IHRoZW4gd2UganVzdCBnbG9iYWxseSBiYWxhbmNlIGxpa2UKPiB3aXRoIGFsbCBzaHJpbmtlcnMg
dGhyb3VnaCB0aGUgY29yZSBtbSAic2hyaW5rIGV2ZXJ5b25lIGVxdWFsbHkiCj4gYXBwcm9hY2gu
IFlvdSBjYW4gZXZlbiBrZWVwIHRoZSBzZXBhcmF0ZSBwYWdlIGFsbG9jIHNocmlua2VyLCBzaW5j
ZQo+IGNvcmUgbW0gYWx3YXlzIGxvb3BzIG92ZXIgYWxsIHNocmlua2VycyAtIHdlJ3JlIG5vdCB0
aGUgb25seSBvbmVzCj4gd2hlcmUgc2hyaW5raW5nIG9uZSBjYWNoZSBtYWtlcyBtb3JlIG1lbW9y
eSBhdmFpbGFibGUgZm9yIGFub3RoZXIKPiBjYWNoZSB0byBzaHJpbmssIGUuZy4geW91IGNhbid0
IHRocm93IG91dCBhbiBpbm9kZSB3aXRob3V0IGZpcnN0Cj4gdGhyb3dpbmcgb3V0IGFsbCB0aGUg
ZGVudHJ5IHBvaW50aW5nIGF0IHRoZW0uCgpNeSBwbGFuIGlzIHRvIHJlcGxhY2UgYWxsIHRoaXMg
d2l0aCBhbiBleHBsaWNpdCBTV0FQIGRvbWFpbiBmb3IgYnVmZmVyIApvYmplY3RzLgoKT25lIGlk
ZWEgd2FzIHRvIG1ha2UgdGhlIFNZU1RFTSBhbmQgU1dBUCBkb21haW4gZ2xvYmFsIGFuZCBleHBy
ZXNzIGFsbCAKdGhpcyB3aXRoIHRyYW5zaXRzIGJldHdlZW4gdGhlIGRpZmZlcmVudCBkb21haW5z
LiBCdXQgaGF2aW5nIG9uZSAKc2hyaW5rZXIgcGVyIGRldmljZSBzb3VuZHMgbGlrZSBhbiBldmVu
IGJldHRlciBpZGVhIG5vdy4KCj4gQW5vdGhlciBwcm9ibGVtIHdvdWxkIGJlIGFsbG9jYXRpbmcg
bWVtb3J5IHdoaWxlIGhvbGRpbmcgcGVyLWRldmljZQo+IGxydSBsb2NrcyAoc2luY2UgdHJ5bG9j
ayBvbiBzdWNoIGEgZ2xvYmFsIGxvY2sgaW4gc2hyaW5rZXJzIGlzIGEKPiByZWFsbHkgYmFkIGlk
ZWEsIHdlIGtub3cgdGhhdCBmcm9tIGFsbCB0aGUgZGV2LT5zdHJ1Y3RfbXV0ZXggbG9seiBpbgo+
IGk5MTUpLiBCdXQgZm9yIHR0bSB0aGF0J3Mgbm90IGEgcHJvYmxlbSBzaW5jZSBhbGwgbHJ1IGFy
ZSBzcGlubG9jaywgc28KPiBvbmx5IEdGUF9BVE9NSUMgYWxsb3dlZCBhbnl3YXksIGhlbmNlIG5v
IHByb2JsZW0uCgpZZXMsIGV4YWN0bHkuCgpDaHJpc3RpYW4uCgo+Cj4gQWRkaW5nIFRob21hcyBm
b3IgdGhpcyB0dG0gdGFuZ2VudC4KPiAtRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK

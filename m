Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C9213C203
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2652D6E9C7;
	Wed, 15 Jan 2020 12:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BDD6E9C7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlylLPL/mo2kZAL7LOStwDHvBJkReO9AB9C0+ozlG4wf5eE5gWFY4nFdnm6khgmvUpEHjsiPjaY62DNc6gcryIYLefB12oftgKfbAMhqjgb4aS0/L88xkr4dodG0lkfefs5MzToqOJi+46DhTDq2t6oHPhF1mMGiU84Q1si51Z+mCBXHsiSZgOrrcxFfsezOnCytPDB1Cx3wVjZhiSg/gdrpgAZ2BDaxvRJ7+dbsLspKdO+6uhFWgYH8k3E3oYuRfhFejMTG57J4VLPH3+cHrwM62LATSamkOzNA5cxwbzcuHJAAhEhWPiU1Q5b/7HqR9UqCdmFJxF74UuTwocsuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/k4kdIxHzthPS0kON3qYgcBzbGXcRpSCHh31BjZxFrU=;
 b=XlCIjqE9aTKHqvt24lPfPc5cUjVc/e/Ce2GoE7g5Aaih1YFy5oWpBKFPC5ftIz9WJglyqJ/5Ghe2g124FcGR8pWrE4kpth3hHqaVkvDp3RO70p3a88OQiM0CoK9ep91wofc5iS5DSMZE8gLe7h8txNG7gziYGBC/6WOIuIywdiHHzeEFetjHUNzBzLJ5wnNTbkzG5ZGVw9gRqB6yiHdTNuiFw3anPBeQo5uqR17WDlkQYM1Izb6eb0wYq9BCi+Y5Hd4eh/56nWhL2dXDgFRZvIbTUUE65MlCu+D0/BkUNyHVzu3iFGAcMAFclJ+IimUYkRFewMqsbhPjbrzygHwhfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/k4kdIxHzthPS0kON3qYgcBzbGXcRpSCHh31BjZxFrU=;
 b=oYN2a6b2N8dnGQCYKtI7BBStp+mzqIXYP0g+5IT7Rd3WbDDF86r28PT3BUtFTvuxrGnMoMpE/J6ElrQWs2NjzWy0G3PhT2UKukg2SvfkN+aAuFMaV2ez8Wd2W5bjHHIWMp8oH9FAsDAR/UO63irhH130v5gaVEJsnvZk7YEPXI0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1209.namprd12.prod.outlook.com (10.168.234.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Wed, 15 Jan 2020 12:55:04 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::8dde:b52a:d97a:e89]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::8dde:b52a:d97a:e89%2]) with mapi id 15.20.2623.015; Wed, 15 Jan 2020
 12:55:03 +0000
Subject: Re: TTM or vmwgfx tree? Re: [PATCH v5 0/2] mm, drm/ttm: Fix pte
 insertion with customized protection
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
References: <20200115124107.3845-1-thomas_os@shipmail.org>
 <01560aef-b21e-57b9-a7a1-fd7ff3aabfb2@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <52254ee1-6a83-d1f1-1de8-9d94fc5798df@amd.com>
Date: Wed, 15 Jan 2020 13:54:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <01560aef-b21e-57b9-a7a1-fd7ff3aabfb2@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0202CA0014.eurprd02.prod.outlook.com
 (2603:10a6:200:89::24) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0202CA0014.eurprd02.prod.outlook.com (2603:10a6:200:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via Frontend
 Transport; Wed, 15 Jan 2020 12:55:02 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9150142-14a0-479d-0b9f-08d799ba2376
X-MS-TrafficTypeDiagnostic: DM5PR12MB1209:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1209C572002E0BE8F0EAD7FE83370@DM5PR12MB1209.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 02830F0362
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(199004)(189003)(31696002)(66556008)(66476007)(81156014)(8936002)(81166006)(8676002)(186003)(31686004)(2616005)(53546011)(2906002)(36756003)(66946007)(52116002)(5660300002)(316002)(478600001)(6666004)(6486002)(86362001)(16526019)(40753002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1209;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xV19xzLTQj48AbunGRZUra+QDPTKvbjA6Kvjj6o7p6F9cdbhkIaroHIW40V4mYlFgEbZYr9ithGh55zW8g7IZ1Tr5D4GZoY1fcqmPqH1+XLlEaESSsJVDJddyGlKBudhxTXJDnD0zu17foOYCg8FtyaXcOGhXIY/bdnOVYDG0VV6cyRE7sNoOlkZpsNSXU8upsPHIC7FEE3LHxtle7B8oNDebaTLmsfxl/DWPgLAfKGte7/WR4yAUrbJjv+qtnuXTTOIU2OwJN6jKYk3Z5MZ1p+l4Xo2JpsZ+4N5ssQWaOVNcRaJeeQ+6VyUFS+AzKzyBqh6zQlV+BGm3u6I+Tp1vUD2aodlsybXA8Nhzj41trs9Jt6VtVyvCH+i8Ly+MSBqGZ8kCWuBIYylMMsc4MK1IKFGBWEfbir6e9ZqNSTQah8GsUIf5YTq0ReXl4IJrq7Qu+4Eic9Luf69uui2WUS27uiUXD0c41rfawQEvwA6wW9M/jnhGk6X2TibOHqxvRJi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9150142-14a0-479d-0b9f-08d799ba2376
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2020 12:55:03.7498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVEwe868B5o3N7q3PEN6aauRut0QVA3tIXFiOG6RT8EjSKm8outX0lXT+xtTWn/f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1209
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDEuMjAgdW0gMTM6NDUgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToK
PiBIaSBDaHJpc3RpYW4sCj4KPiBPbiAxLzE1LzIwIDE6NDEgUE0sIFRob21hcyBIZWxsc3Ryw7Zt
IChWTXdhcmUpIHdyb3RlOgo+PiBGcm9tOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZt
d2FyZS5jb20+Cj4+Cj4+IFRoZSBkcm0vdHRtIG1vZHVsZSBpcyB1c2luZyBhIG1vZGlmaWVkIG9u
LXN0YWNrIGNvcHkgb2YgdGhlCj4+IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCB0byBiZSBhYmxlIHRv
IHNldCBhIHBhZ2UgcHJvdGVjdGlvbiB3aXRoIAo+PiBjdXN0b21pemVkCj4+IGNhY2hpbmcuIEZp
eCB0aGF0IGJ5IGFkZGluZyBhIHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCgpIGZ1bmN0aW9uIHNpbWls
YXIKPj4gdG8gdGhlIGV4aXN0aW5nIHZtZl9pbnNlcnRfcGZuX3Byb3QoKSBmb3IgdXNlIHdpdGgg
ZHJtL3R0bS4KPj4KPj4gUGF0Y2hlcyBhcmUgYWNrZWQgdG8gYmUgbWVyZ2VkIHRocm91Z2ggYSBk
cm0gdHJlZS4KPgo+IFRoaXMgc21hbGwgcGF0Y2hzZXQgc2hvdWxkIGJlIHJlYWR5IHRvIGJlIG1l
cmdlZCBub3csIHdpdGggYWNrcyBmcm9tIAo+IEFuZHJldy4KPgo+IERvIHlvdSB3YW50IHRvIHRh
a2UgaXQgdGhyb3VnaCB0aGUgdHRtIHRyZWUsIG9yIHNob3VsZCBJIGFzayBEYXZlIC8gCj4gRGFu
aWVsIHRvIHB1bGwgaXQgc2VwYXJhdGVseT8KPgo+IE5vdGUgdGhhdCBzaW1pbGFyIHRvIHRoZSB2
bXdnZnggY29oZXJlbnQgcGF0Y2hlcywgTGludXMgaGFzIGluZGljYXRlZCAKPiB0aGF0IGhlIHdh
bnRzIHNlcGFyYXRlIHB1bGwgcmVxdWVzdHMgZm9yIHN0dWZmIGxpa2UgdGhpcyB0aGF0IHRvdWNo
ZXMgbW0uCgpCZXR0ZXIgYXNrIERhdmUgaW4gdGhpcyBjYXNlIG9yIG1lcmdlIHRocm91Z2ggZHJt
LW1pc2MtbmV4dC4gVGhlIGxhdGVyIAppcyB3aGVyZSBJIHB1c2ggYWxsIHRob3NlIGxpdHRsZSBj
cm9zcyBkcml2ZXIgY2xlYW51cCBwYXRjaGVzIHJlY2VudGx5IAphbmQgdGhhdCBzZWVtcyB0byB3
b3JrIGZpbmUuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gVGhhbmtzLAo+Cj4gVGhvbWFzCj4K
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8846D1B232F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 11:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488206E2BC;
	Tue, 21 Apr 2020 09:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4909C6E2BC;
 Tue, 21 Apr 2020 09:48:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYncF7qEkMpsq9Uk5ZRmVJ4X2B4kY1Lps2AJM+JX5xxmIfp266zQkgPZILZjvpKAfJtLHyHamtj+bIGhsIUBE+0yriR38okaFZM7B7UvGrKgqazIV3XOiFcxGbjoZv/E63mZG6tfzAuZ7qlDQc7Nfk9fzk1Ft/VyVtThLq9C+CY8oGt2jK8PBaYNJ98+H6Xl9UJX0L0YvrWsovYhrDyadmQMNgtahnhOo7mddf6zJtfSps/o8XLv3QDmtPpqKmcVLTFublYWguDry6L1x+N75DsUEnthD3M7699CBtnoO6Lq4nnNBKAI/YS6GiyI7W4PSF4TA62N3qEEhU4RwFnyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtS95uol8q4ubWpRU4UduZfVz4ZbS63erd7K8JjFavU=;
 b=d6EQ/LFphOTlb6bu6U0/+TMmZedWXJ5tmFZ8SmZw/QhFBscH+V1TwrUgSxH+6l7njTb60xj+ZGVSXAVqj8aNbyZyYFO6nClac/YltiRoLsp+NerJX8NU94DivzzZefJ17LsWkNPGfBv8dAfpMgK5McYMstXv1JMQszi+kQ86+orJdLTof9neiFtybC1kEuWGDEx6DnDttaFpvDlAfDVNn/bcxgsbF9KKSw9uVcxcMnGj/DoFHu5ptAsgQfbBVWJeOphmbQT4EUyxXaUYiwk3k21N29oLMaky+aTLiAqrSyOIZn3TwGyU1XWP4q8Gt7P0QX+KZ2jMtDgjV3revPDCmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtS95uol8q4ubWpRU4UduZfVz4ZbS63erd7K8JjFavU=;
 b=MdgVrLsXP2l03CId++rErdcN6xgIaXeNLQ/YRQW5p79CwglFuuTgR5wuDqZIfojhBnBdX6rNnb6pIb43iloi2i3uwSFEqs6cwnSL0ZMPN5fOm78a9H+j8Zfw39unaQiHES90QPMDl9l62H8NAPSKtUUkZ24RHgyUt3BGeCWfl+w=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3546.namprd12.prod.outlook.com (2603:10b6:5:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 09:48:40 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 09:48:39 +0000
Subject: Re: [PATCH V3] amdgpu: remove unnecessary condition check
To: =?UTF-8?B?6LW15Yab5aWO?= <bernard@vivo.com>
References: <AIsA-wCZCFCxiq0WKb3WjKr*.3.1587458683834.Hmail.bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ccd14dee-f275-5de4-b5c1-4f359d155288@amd.com>
Date: Tue, 21 Apr 2020 11:48:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <AIsA-wCZCFCxiq0WKb3WjKr*.3.1587458683834.Hmail.bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR03CA0072.eurprd03.prod.outlook.com
 (2603:10a6:207:5::30) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR03CA0072.eurprd03.prod.outlook.com (2603:10a6:207:5::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.27 via Frontend Transport; Tue, 21 Apr 2020 09:48:35 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2ec64341-fd56-4dd6-4aa3-08d7e5d92b7f
X-MS-TrafficTypeDiagnostic: DM6PR12MB3546:|DM6PR12MB3546:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB354600A9D1C2FAA75D6D94C383D50@DM6PR12MB3546.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(6666004)(31696002)(5660300002)(4326008)(31686004)(16526019)(66946007)(6486002)(2616005)(186003)(8936002)(66556008)(2906002)(66476007)(52116002)(81156014)(8676002)(36756003)(478600001)(54906003)(316002)(6916009)(86362001)(45080400002)(966005);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IT0YgfjQ56TRQY8166MCMEMF5y/CNBYVbUGE1sd4c7PoR9IpgUTKaPSv9G1+8VPwWNr88XY4uhk8OTRsMpVeg6qtfGhMpNerD1O+VpdIv8J2tepaMfsbmqLsK/64B4lUy6gyK2CdTdod2jCq+V45Pb81+B3VyeBTnQ3xKQocLDyzIwjzX0VRMSbsdIVOFqOnqI2vjo+V8YDxrQ3G+lPIxr5ejhqjadio2r0pZ9R5z1wkqkPcrxEHjSCiYmgnXtBTyxyjUUKL02ca2vVJHAqOxsl/h1j1c7HHlh0I6UlYee+XyFobH0Knd4BlK808INwwsvRlHi2tUfFeeTd3l/OWHRuLBKUsey4KjG6M2zAUZk5YGHEZSiwAiFmi5XARUJ2X7SwyHS1IlBfPfWvayOlmxqEa3dbEiyocLpDKO3BOv7JCXsHNVo0BZrS8Gtxj7kACeD4acMguobBDVarTzlroU4FU8rhQbF3p+yHxEp8y+YWDXgv8hu+VRwvOJq4nAikJ7JRDwKrbh51bQY3kqUCdBw==
X-MS-Exchange-AntiSpam-MessageData: lthqa8eWjf+PakVzws6yCWpH4eY7T8FnaI0NeSjMIEjjR5L2rVRkOOeeQRz/s8zLHZX6zNbCOVkfYI4MI6av7uajSrNofT18NcH+mY976ARiZ97W/bTwbThIzQllDo5MboEu8kwJQ87qhFwy0KA2b45u5520m8YUmCF5MbarjjfbJrJJ5roliftrV1FSSr1LgYBYLQ6WyNnxTKlz7wXV1pFfQlyaWA6uYrGQPTr19gX8+1JiuTObbf9zM3WVVusta4vtRihRAX1wYl5x0wJtsr6qy2E5aeqqK/B4JsVr9I39pdlDY3sNA1Pq/nqqHCazE6Tk3G1pc/tQRZO8iodD1l2MzwOSd/AKxjNiYNO1R/CCZyYzyASN2SS/kc5hmXv2o85xpoJHGIPFHt6PfjGVTuB4EoobX6s3geY1q6I4q0ivQk8Ey+IntLmYjTqcschiTyD83eiuJMj/2UsHVav3EQLPACzz256MBJQUVH/pyt0cigZ/0EH7MbGokj7iGxnvC+XsXbJT3skEeiMqhpHQYnb8dmerO3k1ZJzCdn7TL/XvYsQCzZ/zRtTZ/TzUix1i4Gl98/dND6cIIieN8xemxqXEw3fTvzNewnU7I6hDClAaA/Q10K/Ytzth7HRMDOYqLj2SIfraZ5MSJd8vpYGCIz5zhhRcu4kA19a35/Ns/XR9co8XpnUrVUwlnv8BzBVm/QQPk8YUPCnBJsflI7amSwT88RTK9RhVRBbSxky1zQiwPD6pnT9ZE0KwNHRLTIz+9OwiiQ6xLwe/68sL1CS5T5d+cLuKIiAjQea9KRNzAYofTEk7eIPNVrC/wJpMtZrTSntBJlnvFiWCzAFq94Laefvd/3J1PaqPuq3awu8D6CQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec64341-fd56-4dd6-4aa3-08d7e5d92b7f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 09:48:39.8393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnI30yKROrrE94aStMO9YO0hElcK4mozbXPXUXhKMeeNapE/KiwT1tAxdjm5VoTN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3546
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
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Elfring <Markus.Elfring@web.de>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDQuMjAgdW0gMTA6NDQgc2NocmllYiDotbXlhpvlpY46Cj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCj4+PiBpbmRleCA5ZGZm
NzkyYzkyOTAuLjU0MjRiZDkyMWE3YiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCj4+PiBAQCAtNjYwLDEzICs2NjAsMTIg
QEAgc3RhdGljIGludCByZXNlcnZlX2JvX2FuZF92bShzdHJ1Y3Qga2dkX21lbSAqbWVtLAo+Pj4g
ICAgCj4+PiAgICAJcmV0ID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmY3R4LT50aWNrZXQsICZj
dHgtPmxpc3QsCj4+PiAgICAJCQkJICAgICBmYWxzZSwgJmN0eC0+ZHVwbGljYXRlcyk7Cj4+PiAt
CWlmICghcmV0KQo+Pj4gLQkJY3R4LT5yZXNlcnZlZCA9IHRydWU7Cj4+PiAtCWVsc2Ugewo+Pj4g
LQkJcHJfZXJyKCJGYWlsZWQgdG8gcmVzZXJ2ZSBidWZmZXJzIGluIHR0bVxuIik7Cj4+PiArCWlm
IChyZXQpIHsKPj4+ICsJCXByX2VycigiRmFpbGVkIHRvIHJlc2VydmUgYnVmZmVycyBpbiB0dG0u
XG4iKTsKPj4+ICAgIAkJa2ZyZWUoY3R4LT52bV9wZCk7Cj4+PiAgICAJCWN0eC0+dm1fcGQgPSBO
VUxMOwo+Pj4gLQl9Cj4+PiArCX0gZWxzZQo+Pj4gKwkJY3R4LT5yZXNlcnZlZCA9IHRydWU7Cj4+
IFRoYXQgaXMgc3RpbGwgbm90IGNvcnJlY3QgY29kaW5nIHN0eWxlLiBJbiBnZW5lcmFsIHdoZW4g
b25lIGJyYW5jaCBvZiBhbgo+PiBpZi9lbHNlIHVzZXMge30gdGhlIG90aGVyIG9uZSBzaG91bGQg
dXNlIGl0IGFzIHdlbGwuCj4+Cj4+IEJ1dCBJIGFncmVlIHdpdGggRmVsaXggdGhhdCB0aGlzIGNo
YW5nZSBsb29rcyByYXRoZXIgc3VwZXJmbHVvdXMgdG8gbWUKPj4gYXMgd2VsbC4KPj4KPj4gUmVn
YXJkcywKPj4gQ2hyaXN0aWFuLgo+IEFib3V0IHRoZSBjb2RlIHN0eWxlLCB5b3UgYXJlIHJpZ2h0
LCBJIGNoZWNrZWQgdGhlIHJlZmVyczoKPiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXQua2VybmVsLm9yZyUyRnB1YiUy
RnNjbSUyRmxpbnV4JTJGa2VybmVsJTJGZ2l0JTJGdG9ydmFsZHMlMkZsaW51eC5naXQlMkZ0cmVl
JTJGRG9jdW1lbnRhdGlvbiUyRnByb2Nlc3MlMkZjb2Rpbmctc3R5bGUucnN0JTNGaWQlM0Q5MDI4
MGVhYTg4YWMxYTkxNDBkYzc1OTk0MTEyMzUzMGQ1NTQ1YmI2JTIzbjE5MSZhbXA7ZGF0YT0wMiU3
QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0MzNjQwYTg1M2EzMWU0ZTk4ZjY2ZDA4
ZDdlNWQwNTMwMCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2
MzcyMzA1NTUyMzA5MTc5MTEmYW1wO3NkYXRhPUlodW04dGpRQXclMkJrNjdLVHElMkIzekJCTEhM
MWJTSEJoQmhTeUcwaldlTWNFJTNEJmFtcDtyZXNlcnZlZD0wCj4gVGhlIGlmIGFuZCBlbHNlIHNo
b3VsZCB1c2UgdGhlIHNhbWUgc3R5bGUuCj4gQnV0IGkgaGF2ZSB0byBzYXkgdGhlcmUgYXJlIHNv
IG1hbnkgY29kZSBub3QgZm9sbG93IHRoZSBrZXJuZWwgY29kZS1zdHlsZSBpbiBhbWRncHUgbW9k
dWxlLgo+IEFuZCBhbHNvIHRoZSAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBkaWQgbm90IHRocm93
IGFueSB3YXJuaW5nIG9yIGVycm9yLgoKVGhhdCBpcyB1bmZvcnR1bmF0ZWx5IHRydWUsIHllcy4g
QnV0IHdlIHRyeSB0byBwdXNoIG5ldyBjb2RlIHRocm91Z2ggdGhlIAp1c3VhbCBjb2RlIHJldmll
dyBhbmQgaW1wcm92ZSB0aGluZ3MgYXMgd2UgZ28uCgpPbiB0aGUgb3RoZXIgaGFuZCBwYXRjaGVz
IGp1c3QgdG8gZml4IHRoZSBjb2Rpbmcgc3R5bGUgYXJlIHVzdWFsbHkgc2VlbiAKYXMgYW4gdW5u
ZWNlc3NhcnkgaW50ZXJydXB0aW9uIGFuZCBqdXN0IGEgd2FzdGUgb2YgdGltZS4KCkJ1dCBpbiB0
aGlzIHBhcnRpY3VsYXIgY2FzZSB5b3UgY291bGQgYXJndWUgdGhhdCB0aGUgb3JpZ2luYWwgY29k
ZSBpcyAKbm90IGVhc2lseSByZWFkYWJsZSBhbmQgeW91IHRyeSB0byBpbXByb3ZlIHRoYXQuCgo+
IElmIHRoaXMgY2hhbmdlIGxvb2tzIHJhdGhlciBzdXBlcmZsdW91cyB0byBhbGwgb2YgeW91LCBz
aG91bGQgaSBjaGFuZ2UgdG8gdGhlIFYxIGNoYW5nZT8KPiBBZnRlciBhbGwgaSBkb25gdCB0aGlu
ayB0aGVyZSBpcyBhbnkgbmVjZXNzYXJ5IHRvIGNoZWNrICJyZXQiIGFnYWluLCBtZXJnZSB0aGUg
PGVsc2UgYW5kIGlmIChyZXQpPgo+IG1heWJlIGJldHRlci4KPiBPcmlnaW5hbCBjb2RlOgo+IHN0
YXRpYyBpbnQgcmVzZXJ2ZV9ib19hbmRfY29uZF92bXMoc3RydWN0IGtnZF9tZW0gKm1lbSwuLi4u
Lgo+IAlpZiAoIXJldCkKPiAJCWN0eC0+cmVzZXJ2ZWQgPSB0cnVlOwo+IAllbHNlCj4gCQlwcl9l
cnIoIkZhaWxlZCB0byByZXNlcnZlIGJ1ZmZlcnMgaW4gdHRtLlxuIik7Cj4KPiAJaWYgKHJldCkg
ewo+IAkJa2ZyZWUoY3R4LT52bV9wZCk7Cj4gCQljdHgtPnZtX3BkID0gTlVMTDsKPiAJfQoKSW4g
Z2VuZXJhbCBJIHN1Z2dlc3QgdG8gdXNlIHRoZSBmb2xsb3dpbmcgcGF0dGVybiBmb3IgdGhpcyBl
cnJvciAKaGFuZGxpbmcgYW5kIGF2b2lkIHRoZSBlbHNlIGJyYW5jaCBhbHRvZ2V0aGVyOgoKaWYg
KHJldCkgewogwqDCoMKgIHByX2VycigiRmFpbGVkIHRvIHJlc2VydmUgYnVmZmVycyBpbiB0dG0u
XG4iKTsKIMKgwqDCoCBrZnJlZShjdHgtPnZtX3BkKTsKIMKgwqDCoCBjdHgtPnZtX3BkID0gTlVM
TDsKIMKgwqDCoCByZXR1cm4gcmV0Owp9CgpjdHgtPnJlc2VydmVkID0gdHJ1ZTsKcmV0dXJuIDA7
CgpXaGVuIHRoaW5ncyBiZWNvbWUgbW9yZSBjb21wbGV4IGdvb2QgcHJhY3RpY2UgaXMgdG8gaW5z
ZXJ0IGEgImdvdG8gCmVycm9yX2NsZWFudXAiOyBpbnN0ZWFkIG9mIGluIHBsYWNlIGNsZWFudXAu
CgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gQlIvL2Jlcm5hcmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

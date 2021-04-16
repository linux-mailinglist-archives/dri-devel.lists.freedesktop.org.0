Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B66362474
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 17:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9436EC56;
	Fri, 16 Apr 2021 15:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC77C6E0CF;
 Fri, 16 Apr 2021 15:52:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjOpjToFKvYdpQaeWi4Ptv50TNAGJvkCBgfjVCC1P9ncMl/sgPz8X+mB+sBrWBkVds8t1/KTLb8SAbdD+hX6z+N9PtqTVWEIdblLtzN5YJ+vMpYc3OLdEREExNQma0jwZWjM6BrVnYQsipg5TMlcSDIZ1588n4BsPdM6G3tXviVrNMYHeAyugaxwX0/Hij3rskF7PQF6tfBJ/j44+FJZ9qZaBSgSzYu3t/XFU4zrjsOKgdBTetaK3WD+0ZdMTHxZPbI9Xat75+3K5tEjbMF+PqX0JD7Pf6b3wywPVbuQOhP+zdFxy0B3WBasjBD5HjNZyK5nSf3DHBArBS21KOxHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF6G+gFBN9ury3aeIcVISgR4tEDopdz8tIiAp89PtCQ=;
 b=OVU3FJT0QFaFKEc8ug4gq/mi5jsZBHRv/4rrsqoTU4kWsxdg5BSk1Je021zw8Qbsj9c/o0KAqr3dKHMwVfhd62fbkWXJU5C02Tsw/DYWeerKsxa4s1swWQb3whgdbPv95p26fK59QKZXpx5zSggHYExSgevUHIzwroaFzkeT7oKyMe6Ij6Xftt0Ckgk9EWSdPLsxhLHog4f5qz8kjVViy0uOVhnYfaCLWjIIjvieRaqVq4as1McpDCCwoAUgrs9s4RXeUXD4xL6T8Rsd3E0vshu1GkmmoQNuGrqGoBbDCJetJEMN6VbUWsi3ybM3af4JTx+Qkq5r/55gmrcM9p0tlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF6G+gFBN9ury3aeIcVISgR4tEDopdz8tIiAp89PtCQ=;
 b=NlCvJr/g/bbWvf9bhnTTEW3Khx7HjIOdNSYhPvwyYIx1xzTOxUMNQpsuek7HQc5lgVv40gn37J05JVk8Ob0dLYuujUvQg4/lOqUuPmZ6rwZd09kVyzJpbCMH8iq99qACBBXnb71xEoRbTsCvDeBp67CGSFb2o17yfH0mRtHnVHI=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2484.namprd12.prod.outlook.com (2603:10b6:207:4e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Fri, 16 Apr
 2021 15:52:28 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.025; Fri, 16 Apr 2021
 15:52:28 +0000
Subject: Re: [PATCH 29/40] drm/amd/amdgpu/amdgpu_fence: Provide description
 for 'sched_score'
To: Lee Jones <lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-30-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <dfb153eb-53cc-ad27-2114-c0db07610a60@amd.com>
Date: Fri, 16 Apr 2021 17:52:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210416143725.2769053-30-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
X-ClientProxiedBy: AM0PR01CA0175.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
 (2a02:908:1252:fb60:5d8d:1198:63ca:8fe4) by
 AM0PR01CA0175.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 15:52:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b6f3edd-e56b-4d6f-1b3c-08d900efa2f0
X-MS-TrafficTypeDiagnostic: BL0PR12MB2484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2484AB52D219B87DC7BB5AF7834C9@BL0PR12MB2484.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3GoGCZrNuASO4NZPMi84K1MavclE7oQauiLLq1ehY8XP3uXH5+SZfJDP2aHnly2ZiPgXB4Rs6IOpvfMouLLlQHqyPto6S7h5cdfeQB9ae4wncY1s2AjbeR3FTJEYxKZ/JbmrueVwDIgwoXPkPhXRx+X7ifaBxRhUKMg3JU0hZ3sKyvWVvRRsQu2lBCnjimWJ9p3SJeQ3Avfu9kFBUAZILhICLduArU+YiuoAQv4hYHUhfSQ307GDr14SBnw2M52wFi4sSx/IAIoXR0srmap4xoEOn8aD5GYxnPpTWDEq2/QKd2ndKmxJ44EP7TgjSXBCy0IlJU0EQPfWj9Gxtc7sp1EhUW1ZxEnCdIlQLxjr8PgxBbuNZsSL/HS37NrcPnNRAUFfAyO8t6LXqM1s1lsc05hziVh7XSEI6sNwSSzvB6M4KUxQXkhmlAyGL8ZKSFGcJxv/uYfAwWZWRxlUtzr7I6DM9+e4qCTFd78OpzDjt832z16X5SG3KPMQUbX3T5j+aHo7AINtNpWfUhBw9DelTTEqH+LUzakPit2uxUMnY11eCyqQMkL6NloZpTMpjzQ99N3y1en66oXZwlkpuzRQTAX3Ep81X/XIEiiL0z9N242lpnQ1gaon3qvP9Z1MCnwXZP5jNybxc0OvCZd+Hsc8tPS2JJzS8DF9UNlme/A7Umo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(6486002)(6666004)(66556008)(31696002)(54906003)(2906002)(52116002)(66476007)(2616005)(38100700002)(66946007)(8676002)(316002)(186003)(86362001)(31686004)(36756003)(83380400001)(6916009)(7416002)(66574015)(16526019)(5660300002)(8936002)(478600001)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VU9WMWZpemZ5RitYVFczN2ljVnV5T0FmclB2RFh1Mzg1Sm1xV3dqUjJqWlRD?=
 =?utf-8?B?OTBkL1RYUjlzZmVFWFZPVmVtNXg0aTlxOWFxNy9FVENZdmNUdUVVcGpucWhE?=
 =?utf-8?B?cEhuL090QkV3dC92cWZTRk1iY3F0ZDlwSWpFcEpLcW9CVE1Kc1NIRmdvbE9G?=
 =?utf-8?B?NlFib3Jac3hmQVVXYXM4Z3NoeHVUM0RFM0R4MW5DS24xYUZ0aVVoRXdPQ1Aw?=
 =?utf-8?B?RlZCSUIybnJPTXR1QU5yMFduL3ZrNXQzZ0JnVVlSRTl2NFpLeC9jSkhpYzZY?=
 =?utf-8?B?Syt2azkybi9OdzRhUy9WNmZkWElBeXpETGFSZEpmanhqaFNsQWVqY0dIZ3dZ?=
 =?utf-8?B?WWh4My9MN0dCQ3NMaEQ5WDFzNklCckZ1bmRja2NJcWh1WnJNM3d4ZGxDc09j?=
 =?utf-8?B?dWh6dDZWZURMVTlkaTd1SWhOQkQ0OE5YOXA0TDRZTU9rU0FqZlNDZTJqRTR0?=
 =?utf-8?B?alZXd1lmZWZKM1NCaERNRXZoaEt4RmVMSXVrTjlRdm1oeDIrNUk1UTFkZlM4?=
 =?utf-8?B?cXBscDIva2FGZW5ZRllrWEdsUTk5amRIQXpzZ3o4WHU5cjdBTllGYUExazBX?=
 =?utf-8?B?NWpSYjBkQmlaSFcwZE52R3cwVzQxZmZXYnNDTkRncHM2NEF2NzlHeDQwRnRL?=
 =?utf-8?B?K2lSTXh6OXNvbDVNTEdNdjZUZW5XY1p1VUNyaW5kOWYrWWthcnFmZCs4ZlF2?=
 =?utf-8?B?MG9UWmRITmhxSlpncUtiV0l3aFByOHpvajJMU0EySVg0TmZKc3NtdEZPM2Yr?=
 =?utf-8?B?QVBabjlFNjdsenpiOHNhd0pNMTJSWjZSQmVVVTRFM0tLVUFJbjNYbVB0UW1U?=
 =?utf-8?B?alUzeUN3NEJFcWZWcHZZdHZweHl0MTEwb3JkOXhZYXdSekExVi9kZERjWnhN?=
 =?utf-8?B?TXpidVBRdmpHdUY5UjIyeFBJRlhub2tobEZzYzFxZUVYNnBKNnFpYkhmT290?=
 =?utf-8?B?Y1F4LzFFZjc1ZzRzUW5kZlRMMnFnN1VDWElKQkNhRkpvcEppTklwcU9oaUpV?=
 =?utf-8?B?b2dZVVR1MkMwcjg0anVLSWxnbVVhRnhZWUM3Wm1wTGdJNW1QaGpJZXRocmlJ?=
 =?utf-8?B?Q0N2MVl5MWRJZitDNzdBai9CK2JCSlR4NFBWN0JRNlg2ck45ZFFDL3gvOVAx?=
 =?utf-8?B?TUFHSFVBOHNYU3VsVngzZ0RHSzNYbmM3U2QxaU1ORzFpbjUycHNONThmNFIv?=
 =?utf-8?B?Q1Y3Z3dmSFY1UHVJOW1nbEpwRkhwUkd6cnhqUFRBRUdWenBLdkF1L25lVEVN?=
 =?utf-8?B?b3kzcDJUaFB3bE5uUFg4ZFZ4ck90QTNzM1lTdzFaSzlHNGg1OGl5MVpZdVF2?=
 =?utf-8?B?K1o4bGRDUFNmY0l5eE4wM2RMdk1qVS94N0x1clBGaWVqNUtyUHdFRnNXUDd5?=
 =?utf-8?B?ZmdMeFRVRlJCMVVscjRmR3lFTDIwOC9NS3J0MXNnUXovVjN5WkxVN2ZvdW1P?=
 =?utf-8?B?N3cvSUxDUEtrWThjSzdRa0hVQWxNamhTUTF4aFcwTEc5Ry93T0pPK2VtaHZJ?=
 =?utf-8?B?N08rWTgwQ3FMWEZSdy9Ydm1SdEV4QXgwUDArL2NkblhWZkhkdzBMeVkwQ1Fh?=
 =?utf-8?B?WitaUWF6ZjhlZFdTQ0o5Mk5SVHMyZHY3cXVlQWRrSDYwR2xtL3hCNFhSWUpu?=
 =?utf-8?B?ZmlYUi9WNVpLeElvVE83Z1VSTDZITVFOQnM4bEs3L1VvNXRsYktpckFYZldV?=
 =?utf-8?B?MTNhVTFGWEhweHFON3pHSi9MSFV6N0pWRytMMHZXOWtibUNoamhXVXZXb2JM?=
 =?utf-8?B?Zy9hSDloR1NtcFA5LzZZS3RaVklCNWZDOE1YdXplUHlSZFF1ZzRwdXlvclZO?=
 =?utf-8?B?NmFrWHl0OUpCMlJnMnd3NFhHOEVyQ2hZV2wwQ052RStGd0pnWVdCUVNPdzRG?=
 =?utf-8?Q?RJ92qji2d4//R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6f3edd-e56b-4d6f-1b3c-08d900efa2f0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:52:28.1543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goD6zZOxlLLH+M/vtpViFPinv/bhaEc0I2lp7MQmj6gBUFBeJ2diq/feFWXwfxmt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2484
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jerome Glisse <glisse@freedesktop.org>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDQuMjEgdW0gMTY6Mzcgc2NocmllYiBMZWUgSm9uZXM6Cj4gRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jOjQ0NDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAnc2NoZWRfc2NvcmUnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9mZW5jZV9k
cml2ZXJfaW5pdF9yaW5nJwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBs
aW5hcm8ub3JnPgo+IENjOiBKZXJvbWUgR2xpc3NlIDxnbGlzc2VAZnJlZWRlc2t0b3Aub3JnPgo+
IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBs
aW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZmVuY2UuYyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Zl
bmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYwo+IGluZGV4
IDQ3ZWE0Njg1OTYxODQuLjMwNzcyNjA4ZWFjNmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZmVuY2UuYwo+IEBAIC00MzQsNiArNDM0LDcgQEAgaW50IGFtZGdwdV9m
ZW5jZV9kcml2ZXJfc3RhcnRfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCj4gICAgKgo+
ICAgICogQHJpbmc6IHJpbmcgdG8gaW5pdCB0aGUgZmVuY2UgZHJpdmVyIG9uCj4gICAgKiBAbnVt
X2h3X3N1Ym1pc3Npb246IG51bWJlciBvZiBlbnRyaWVzIG9uIHRoZSBoYXJkd2FyZSBxdWV1ZQo+
ICsgKiBAc2NoZWRfc2NvcmU6IG9wdGlvbmFsIHNjb3JlIGF0b21pYyBzaGFyZWQgd2l0aCBvdGhl
ciBzY2hlZHVsZXJzCj4gICAgKgo+ICAgICogSW5pdCB0aGUgZmVuY2UgZHJpdmVyIGZvciB0aGUg
cmVxdWVzdGVkIHJpbmcgKGFsbCBhc2ljcykuCj4gICAgKiBIZWxwZXIgZnVuY3Rpb24gZm9yIGFt
ZGdwdV9mZW5jZV9kcml2ZXJfaW5pdCgpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==

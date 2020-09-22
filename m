Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D874A27423C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 14:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE336E14E;
	Tue, 22 Sep 2020 12:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5984E6E14E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 12:42:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OphEYJ8hUmy8R/iC02TW3nVbpOfUb8PBeXqDIlW0GQxwrzCEtFWmKkZkDe8sCSRakrNarfVT2eQpATgJmpKR1LvMJVTPFqj/GEnAB/vRYvIdFkP6zePjBZqL+ovv4zbSnxQCTM3qgAKGtjB6ZX6LFmHOyiqZLPCQziC2xL/Xl8In3Q/tiPDQeOySwpkacIbLe1wmW0doyKvGUfYC4dmKgbc83JuHEudz4MbRkUpTQ4FviQrTzG57AuyPr9QV6tPWkxxwQ8HcOMrEzVq47XMReM5ucncx+b2WycfUaUYHleskt51/m0PyNuE2t42bcKmFvgtxBaSa5xkIv924Pj30bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8gfVxNkThlvK7Yayd0AmkNWAKjL5BAqvJhmgUHQFsQ=;
 b=P/yi/1y2kNVLff9BaOxvemUO9njiOaYT1qhlSLAEcZZaDe41RGP+eN1RTHRSUfp/Jbt1t6VOpvegFroEg3xsBk+67XAtimmCqeS8IvnaPtdZkOd2nCu6MbmlYSuro4FJ8tf1JKEYjCxxT7yrBnpKsN9+TDsQGm3Oexhy7SKSVA64mR0ccsHpjBifFiD8jYh4yxJz0P0uWoa7MSqXL3pIgqn9w+4oEqJEsj158257IwJfrUge7eAO9/NeUnd5tzaIMR++UQOoZjycgpdo6kzOZpUso478OXmqPiEykBWY3jN2bzC2Skl47syWoE1dRK/vtZx0YKC7Y2NehWMp6RuOUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8gfVxNkThlvK7Yayd0AmkNWAKjL5BAqvJhmgUHQFsQ=;
 b=eIiNVBiI8DV3KVAglkrQUGJmXGPplTX0rx9Oa7n+2YM1lrXuyJY4f4DvFzTgClfDWO/OHUgha2tG5vxqvIJW+VjvF57jGFQKmk77/0CgusXQXE9tG0UUOF1LnEl6DjNQoiVVRqiGXfYjKqcsaqAujEDwJ4zzuo7dCrjwJencEus=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 12:42:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.026; Tue, 22 Sep 2020
 12:42:05 +0000
Subject: Re: [PATCH -next] dma-buf: heaps: Remove unused variable ret
To: Zou Wei <zou_wei@huawei.com>, sumit.semwal@linaro.org, afd@ti.com,
 benjamin.gaignard@linaro.org, lmark@codeaurora.org, labbott@redhat.com,
 Brian.Starkey@arm.com, john.stultz@linaro.org
References: <1600761208-45229-1-git-send-email-zou_wei@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <16d720b7-9bf3-ad3a-0785-76f21c87c9e1@amd.com>
Date: Tue, 22 Sep 2020 14:41:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1600761208-45229-1-git-send-email-zou_wei@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.4 via Frontend Transport; Tue, 22 Sep 2020 12:42:02 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ba50b27-dbec-4380-fac1-08d85ef4e90e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4048:
X-Microsoft-Antispam-PRVS: <MN2PR12MB404880DDD8FA31193B5DBB5E833B0@MN2PR12MB4048.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LXziOEyqybva/4u0ZkGgxxYjq3dWEI+FRGozJ2ywVWVcqqIbrKQzUs5+WDPtyOBscZqirZHxrzAAeErQkGUPDTs52zWlGs0Lns9ZwHoO7HVcpBA/dt0KfwFMFF2Kg42F+YVHN4Xlr+Kq8Y6NLSCozQZHqt1ZkkdMA1G6L/gfs8dUmRCFf5bRh3NFWZCToWGTWDhFH/GkYzMWeFDFD0GJhzDEB0rWUFEUNmS7mNwohv9f9bcbKDnUoTbPpzOY4I6TAAwF16h5DTgRQ/p3qotHLFTcV5yXcL0VmboH0dZxet1TLUgqSYME5aMWIPk5m/9GhK1uGjh5QXhJ6Yp1bLL1EGUIPckLlTtY0c4YWFkyO+lWo3idU0+udUcS7wkIahe+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(36756003)(66574015)(16526019)(186003)(86362001)(2906002)(83380400001)(4326008)(66946007)(31696002)(66476007)(66556008)(478600001)(316002)(8936002)(6486002)(7416002)(5660300002)(52116002)(8676002)(6666004)(2616005)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: SFBesYf07aF8mucY9afFYORyc1RwCk5xWvlPlt7Uu2vUEA03wNLzZ31PZnVrzfArNZ1Rm+HfN6O85SA8hGOarsoIl/pkxXoG2GB7M1ZyaBeYh06sLuM/5c/UnJxd9zLomfYnAuqURhIeAmFrNgLt7/y8xGQtIoRQqNAz+t7RCzDuxF+N9tjNS2qewLmT+NTG1aps3EY7zP3tu1W3c69F6bdoZbOOqCQRHQlH/pE/iOQG4Yw2Lg4OlUMhYVZGnrA+OXTVrUskrWvtAiKfsENBytegH1HZNBn3QIOutr2bbbkIVSe7G4S3Pw72TEP54WttDiItq3+sJhSnXD5BCeg2sHT382tAktV6WHvD+C+7x3idR6kBtBZVyUp4I14bUq8C2CkvJuVNBdnic9VfHKEeiO5ugiFVi+AohnbzNKpiDHpsvmi7EnMCJvKEDuW1s0jQ5PQbQZbPjM6a1hwnw4hWKwnjq1/HGXBLBzDOB5zixTwPUonqFo5hA+979UyZuCl5NFjp6J74JEpuby+ZjkTUJYGvHEnE/IYnuWwDqzxogLHKSdiOiIcVRuc2y/4RstzMa3Pd8OlmQvkjnhiXkPFmkbAq6GJv+Ly6MI3EydbBzca/D1QR51FP17SYp1/Y8qZuGbpq17M8FLbKI7dOc2q92tlJA7+MZZagfSuFK/2o1ZGIB8IHB/c9zKvgO8XyZHSunL0wjNDN7nOQtp+du6M31Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba50b27-dbec-4380-fac1-08d85ef4e90e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 12:42:05.1867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LG2/z9QuHsN0qgGh/DviCq0IFZ23rm1qfiYV4iohgylsohKuqOHZvAGZjGz/gQx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDkuMjAgdW0gMDk6NTMgc2NocmllYiBab3UgV2VpOgo+IFRoaXMgcGF0Y2ggZml4ZXMg
YmVsb3cgd2FybmluZ3MgcmVwb3J0ZWQgYnkgY29jY2ljaGVjawo+Cj4gLi9kcml2ZXJzL2RtYS1i
dWYvaGVhcHMvaGVhcC1oZWxwZXJzLmM6MjAyOjUtODogVW5uZWVkZWQgdmFyaWFibGU6ICJyZXQi
LiBSZXR1cm4gIjAiIG9uIGxpbmUgMjE1Cj4KPiBTaWduZWQtb2ZmLWJ5OiBab3UgV2VpIDx6b3Vf
d2VpQGh1YXdlaS5jb20+CgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgoKR29pbmcgdG8gcGljayB0aGlzIHVwIGZvciBkcm0tbWlzYy1uZXh0LgoK
PiAtLS0KPiAgIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuYyB8IDMgKy0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5jIGIvZHJpdmVycy9k
bWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5jCj4gaW5kZXggZDA2OTZjZi4uNzk2OTUxMCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMKPiArKysgYi9k
cml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMKPiBAQCAtMTk5LDcgKzE5OSw2IEBA
IHN0YXRpYyBpbnQgZG1hX2hlYXBfZG1hX2J1Zl9iZWdpbl9jcHVfYWNjZXNzKHN0cnVjdCBkbWFf
YnVmICpkbWFidWYsCj4gICB7Cj4gICAJc3RydWN0IGhlYXBfaGVscGVyX2J1ZmZlciAqYnVmZmVy
ID0gZG1hYnVmLT5wcml2Owo+ICAgCXN0cnVjdCBkbWFfaGVhcHNfYXR0YWNobWVudCAqYTsKPiAt
CWludCByZXQgPSAwOwo+ICAgCj4gICAJbXV0ZXhfbG9jaygmYnVmZmVyLT5sb2NrKTsKPiAgIAo+
IEBAIC0yMTIsNyArMjExLDcgQEAgc3RhdGljIGludCBkbWFfaGVhcF9kbWFfYnVmX2JlZ2luX2Nw
dV9hY2Nlc3Moc3RydWN0IGRtYV9idWYgKmRtYWJ1ZiwKPiAgIAl9Cj4gICAJbXV0ZXhfdW5sb2Nr
KCZidWZmZXItPmxvY2spOwo+ICAgCj4gLQlyZXR1cm4gcmV0Owo+ICsJcmV0dXJuIDA7Cj4gICB9
Cj4gICAKPiAgIHN0YXRpYyBpbnQgZG1hX2hlYXBfZG1hX2J1Zl9lbmRfY3B1X2FjY2VzcyhzdHJ1
Y3QgZG1hX2J1ZiAqZG1hYnVmLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==

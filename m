Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBC135C5C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 16:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC896E906;
	Thu,  9 Jan 2020 15:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB296E906
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 15:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUE7yiWIzWb6dS05WjcnMPYh9T3tAJRYBqxNjQaFgrECYGUddZitFIa9OH5a8s4ZcXmHpMVLJGf25OHWuMtPmBoGHXN0ZkbNXJsUDbJjAeWuXIh1qgXlOrI2fhPQN9D3e3qHX6alQdPCP9Y+7NpBX8BwkFbTLmWkg0vye6T+dSN4pzFUffSv/vEbqbWI/nF68jhpXbj+S1zdszc0Q1r0qxSGwQHSfHshKPIpOGm4zX587jrfFCRviZnB0OSyL/jZZiKCmwGXeIyRhzAT52wjOQxcPQvQA8eXNSEBVRcu17rvn/KURc1pFNsvhtUyYzXoLcWqqIPLwaaWEIELWHfUCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FWBPxx5loObgE01b4wIxp0C88g/PK7Z1wwYhm0o/y0=;
 b=fAdH3usaRCWCA9WHxD3w3YamaMrAGgTKRFWEKvXthJ7VlK7cFjOlINr0B398gZtKY3hne4lf1ngGYLf6v4+QpZuWogPeV48/NQwlB7zZE+LWu7py5nD7vXNvAhKu3Ry5k8CwkKKQ+Gnj+W0nY3fZQBw+dFdY5IPMkwZfOf42s9GyHAb3xPAw18lAHe84r/iCHwQ2XrxRIXctm3vC3fUyDQonqEkwchHsnvSIxX79fLJyPgMRYIglADufo6LwUpxjMtbHP9KzP2biDpZNXOZ4QIsc3SrdzTnIN0kkvNR28aWpEXpPoLSbxjlRUAYEsQn0OFPW1JF6tGVsihVXytVr/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FWBPxx5loObgE01b4wIxp0C88g/PK7Z1wwYhm0o/y0=;
 b=TPTvHgw1jRgnNGuRg7Hgc2y6zWCxWsip/VwOKuoGonDCIpSv5TJXkSzMSkGPYyFjxUY6BHkvYJG5UaoJo05lHBfO0O+AynLvo3EUQu0bPPpIHtycM74l9tpGejsSqSsX89Mf1HSqVyGK+iV9eTajRvWk8l2FpSdk7Lpa91BAbFQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1466.namprd12.prod.outlook.com (10.172.38.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.11; Thu, 9 Jan 2020 15:12:34 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::8dde:b52a:d97a:e89]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::8dde:b52a:d97a:e89%2]) with mapi id 15.20.2623.011; Thu, 9 Jan 2020
 15:12:34 +0000
Subject: Re: Regression in 5.4 kernel on 32-bit Radeon IBM T40
To: Christoph Hellwig <hch@lst.de>, Woody Suwalski <terraluna977@gmail.com>
References: <400f6ce9-e360-0860-ca2a-fb8bccdcdc9b@gmail.com>
 <20200109141436.GA22111@lst.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9ad75215-3ff1-ee76-9985-12fd78d6aa5f@amd.com>
Date: Thu, 9 Jan 2020 16:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200109141436.GA22111@lst.de>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0038.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::18) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Thu, 9 Jan 2020 15:12:31 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90a10d8a-eb5a-404d-3e5c-08d795165aca
X-MS-TrafficTypeDiagnostic: DM5PR12MB1466:|DM5PR12MB1466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB14662793BDBAE0393439695883390@DM5PR12MB1466.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 02778BF158
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(199004)(189003)(8936002)(6486002)(8676002)(81166006)(81156014)(4326008)(36756003)(31696002)(2906002)(478600001)(2616005)(54906003)(316002)(110136005)(66476007)(5660300002)(66556008)(66946007)(186003)(16526019)(86362001)(31686004)(6666004)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1466;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e0D2HXMVxHsR/Xk+yOK7CaF7jQnneGwVI+hHNLgZth8Nk79t3oGU7mXn8NwH3FbD2SC2BJJ6e61Fr6QOtdw3u+M+NQIrMguhYjQ9dccWlIifYSF1a74YNpqP4O07B0ADSVghz8tIo5T7QoRhdL63jaPQabTp2c/a3NWni9ZLiutSvjudmuMDYd/hnDFKKzBp+GsFUQlp+9XWUZm9EKjI8jwVbFQFteo4yl4CYlN2k84ZUAzGEzMUs3MEK93099iLMNF0umK4J3AyNo/lc/CHIJp8OKWC6axbY7LvzxVaXTIqMFPzAsglKZqYsn1dxORvRzRfPTsLKzna4n3BrcXPudV+IesdbEDcSx8X4Oa+zc4X8Fasi+QE0dO+6gHvKZFqvzv8yckyBOa+yL/uEXLCqxiZlINl58vkuX0+y6v44fGB+RwJsi2UA4UJ1Fm9oYxU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a10d8a-eb5a-404d-3e5c-08d795165aca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 15:12:34.2906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/2h+zoK6ovQohUFASd1AloX6mhrtJ6scK+esy2ZgV3Ozq6RdYSJWVeY0+lwfwGz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1466
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0b3BoLAoKQW0gMDkuMDEuMjAgdW0gMTU6MTQgc2NocmllYiBDaHJpc3RvcGggSGVs
bHdpZzoKPiBIaSBXb29keSwKPgo+IHNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSwgSSd2ZSBiZWVu
IG9mZiB0byBhIHZhY2F0aW9uIG92ZXIgdGhlIGhvbGlkYXlzLgo+Cj4gT24gU2F0LCBEZWMgMTQs
IDIwMTkgYXQgMTA6MTc6MTVQTSAtMDUwMCwgV29vZHkgU3V3YWxza2kgd3JvdGU6Cj4+IFJlZ3Jl
c3Npb24gaW4gNS40IGtlcm5lbCBvbiAzMi1iaXQgUmFkZW9uIElCTSBUNDAKPj4gdHJpZ2dlcmVk
IGJ5Cj4+IGNvbW1pdCAzM2IzYWQzNzg4YWJhODQ2ZmM4YjlhMDY1ZmUyNjg1YTBiNjRmNzEzCj4+
IEF1dGhvcjogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4+IERhdGU6wqDCoCBUaHUg
QXVnIDE1IDA5OjI3OjAwIDIwMTkgKzAyMDAKPj4KPj4gSG93ZHksCj4+IFRoZSBhYm92ZSBwYXRj
aCBoYXMgdHJpZ2dlcmVkIGEgZGlzcGxheSBwcm9ibGVtIG9uIElCTSBUaGlua3BhZCBUNDAsIHdo
ZXJlCj4+IHRoZSBzY3JlZW4gaXMgY292ZXJlZCB3aXRoIGEgbG90cyBvZiByYW5kb20gc2hvcnQg
YmxhY2sgaG9yaXpvbnRhbCBsaW5lcywKPj4gb3IgZGlzdG9ydGVkIGxldHRlcnMgaW4gWCB0ZXJt
cy4KPj4KPj4gVGhlIGN1bHByaXQgc2VlbXMgdG8gYmUgdGhhdCB0aGUgZG1hX2dldF9yZXF1aXJl
ZF9tYXNrKCkgaXMgcmV0dXJuaW5nIGEKPj4gdmFsdWUgMHgzZmZmZmZmZgo+PiB3aGljaCBpcyBz
bWFsbGVyIHRoYW4gZG1hX2dldF9tYXNrKCkweGZmZmZmZmZmLlRoYXQgcmVzdWx0cyBpbgo+PiBk
bWFfYWRkcmVzc2luZ19saW1pdGVkKCk9PTAgaW4gdHRtX2JvX2RldmljZSgpLCBhbmQgdXNpbmcg
NDAtYml0cyBkbWEKPj4gaW5zdGVhZCBvZiAzMi1iaXRzLgo+IFdoaWNoIGlzIHRoZSBpbnRlbmRl
ZCBiZWhhdmlvciBhc3N1bWluZyB5b3VyIHN5c3RlbSBoYXMgMUdCIG9mIG1lbW9yeS4KPiBEb2Vz
IGl0PwoKQXNzdW1pbmcgdGhlIHN5c3RlbSBkb2Vzbid0IGhhdmUgdGhlIDFHQiBzcGxpdCB1cCBz
b21laG93IGNyYXp5IG92ZXIgdGhlIAphZGRyZXNzIHNwYWNlIHRoYXQgc2hvdWxkIGluZGVlZCB3
b3JrIGFzIGludGVuZGVkLgoKPgo+PiBJZiBJIGhhcmRjb2RlICIxIiBhcyB0aGUgbGFzdCBwYXJh
bWV0ZXIgdG8gdHRtX2JvX2RldmljZV9pbml0KCkgaW4gcGxhY2Ugb2YKPj4gYSBjYWxsIHRvIGRt
YV9hZGRyZXNzaW5nX2xpbWl0ZWQoKSx0aGUgcHJvYmxlbSBnb2VzIGF3YXkuCj4gSSdsbCBuZWVk
IHNvbWUgaGVscCBmcm9tIHRoZSBkcm0gLyByYWRlb24gLyBUVE0gbWFpbnRhaW5lcnMgaWYgdGhl
cmUgYXJlCj4gYW55IG90aGVyIHNpZGUgZWZmZWN0cyBmcm9tIG5vdCBwYXNzaW5nIHRoZSBuZWVk
X2RtYTMyIHBhcmFtdGVycy4KPiBPYnZpb3VzbHkgaWYgdGhlIGRldmljZSBkb2Vzbid0IGhhdmUg
bW9yZSB0aGFuIDMyLWJpdHMgd29ydGggb2YgZHJhbSBhbmQKPiBubyBETUEgb2Zmc2V0IHdlIGNh
bid0IGZlZWQgdW5hZGRyZXNzYWJsZSBtZW1vcnkgdG8gdGhlIGRldmljZS4KPiBVbmZvcnR1bmF0
ZWx5IEkgaGF2ZSBhIHZlcnkgaGFyZCB0aW1lIGZvbGxvd2luZyB0aGUgaW1wbGVtZW50YXRpb24g
b2YKPiB0aGUgVFRNIHBvb2wgaWYgaXQgZG9lcyBhbnl0aGluZyBlbHNlIGluIHRoaXMgY2FzZS4K
ClRoZSBvbmx5IG90aGVyIHRoaW5nIHdoaWNoIGNvbWVzIHRvIG1pbmQgaXMgdXNpbmcgaHVnZSBw
YWdlcy4gQ2FuIHlvdSAKdHJ5IGEga2VybmVsIHdpdGggQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQ
QUdFIGRpc2FibGVkPwoKVGhhbmtzLApDaHJpc3RpYW4uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

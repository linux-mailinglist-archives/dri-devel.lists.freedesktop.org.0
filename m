Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE91264806
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 16:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A4F6E928;
	Thu, 10 Sep 2020 14:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0B26E928;
 Thu, 10 Sep 2020 14:32:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUu13nCcldwfj0zDc8IcJLuhodqXOfoC5WPqC6rXUlCl5tX2vcfIFQ+cwkNrwG78UAlK0QytAUHdb2eBESTc8N1GZt/ZnsYDFe8mdDs7/w+mQMzA3gnPZQNlgLuc7KKVmNPLpKv7OBxrJBFAJRAK1fnnkSxJ/rO55el6dC86c+XxXJ4cQ2bnaI8h9TaYthNUHS3j6Pr3TZjnPCHEgzTtj7A3aCcPrDQgn3vtOk3HRP1cRf+HG/Z09k5foAGctm/60TPSzUi8O70dCX3BIirRx/rel9tpartU7lp3YpMlIys1w+ryDW2NXO9iG17SLIW+MXtoJCl8uvXm9UWSPl06QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WW4FB5BAqYyM/jWrbRbi4oI5x6RGXYhuHWhEq5RQO2s=;
 b=lTeaJPx0dBx0ZoEOn60kcXlr9ZKG066KEwoM7Bm3soqi3HWlSh8DI6HZOR24tNWEBe6scHhmEIjLoBfv5n4ec70NfiKkvnFOjjgtMy1BIYLt5t/1FZReW5WnjAzFQJu7Pz/CcHddFzkbWl5/tOrs82Jfqo646K60ERsfyMaGwuYskU3+UfAiJr0O/KTEKoknaLVYVMizB+kymvnTZ7hhh/1gwyxpDJ+BV7x7m5AR/SdpwQ5tfELrecRrLyMJAhbsj4WGMGFZgIYzdVyqPJNZn76jmq6AvgQHqC+ikRigyImxHUs9/6avDqHTbmVUeqi/EkSpA4rPSvoVV8wytXkZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WW4FB5BAqYyM/jWrbRbi4oI5x6RGXYhuHWhEq5RQO2s=;
 b=gBWl3EZNKiZqnT82uHhfeWUUJtD1wrSZlfAQaZmTsnDhHWIJHeD5Da3qxF2mVp7p3LVciiOSRWbexd8InjhuqqbbBEniWkCJaLmfcLC0sZfstU0zcu6Gqx9icUkcqw1pDdH18YcRr9eLBka04Gnzjs4/bHIg09mkmtC9+YNd2AY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN1PR12MB2447.namprd12.prod.outlook.com (2603:10b6:802:27::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 10 Sep
 2020 14:32:24 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::d548:1236:cb4f:1be9]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::d548:1236:cb4f:1be9%7]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 14:32:24 +0000
Subject: Re: [PATCH v2 -next] drm/amdkfd: Fix -Wunused-const-variable warning
To: YueHaibing <yuehaibing@huawei.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 Yong.Zhao@amd.com, ray.huang@amd.com
References: <20200910025532.19616-1-yuehaibing@huawei.com>
 <20200910075006.41484-1-yuehaibing@huawei.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <a0dec097-399e-f29e-c252-cd741862ac9e@amd.com>
Date: Thu, 10 Sep 2020 10:32:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200910075006.41484-1-yuehaibing@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::25) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.113.11) by
 YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Thu, 10 Sep 2020 14:32:23 +0000
X-Originating-IP: [142.116.113.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e6eb3b03-0934-4442-1003-08d85596559f
X-MS-TrafficTypeDiagnostic: SN1PR12MB2447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB244721BF2BE36D48FDFBD5A192270@SN1PR12MB2447.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1xbb+LmSeQvoJg1HqNY84Khxzh9bLz/Z/bd14BG0XeeNfArYH/wQbABxtbDVa4EE5O3lHD1X4EE0+11ceWyeeubhbggY3lF5WcrKpfwm49tlpG2lJ718MaNMkcQEWDB320T5XLkWQGcbYrboHq5AAy9GTnAUq8GYEES7EJyoMnESx+0t70uUelKIPHTyvCI6c/7PEiJ6gra7iJnCwzVV+I9AtRkxpYcnmdLKT0XyX8U83epd3HHai4LrYLYtkR9MVyHcGN51qbZusV6ZcVaAGYIoqUW7gpPrZdEp3tlL1zexmKtMhzuHcImHPEfOYimMJWPJC2ARv78hZVGD1424JQCscF+szdLNJ3j9LetVhsNM9xfCsd9XPHNw4AFaL6iw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(6486002)(8936002)(956004)(86362001)(26005)(16526019)(186003)(52116002)(31696002)(2906002)(5660300002)(478600001)(66476007)(36756003)(66556008)(6636002)(16576012)(2616005)(316002)(4326008)(83380400001)(8676002)(31686004)(44832011)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: rytbtlN4TnT8ytyNZoWffpNkmMZ4iKDKV1Ojw2br06oT0hzTw/ayYXwGQfSQNVLHA4E2CDzzYN102iQIkF4uNDhjxycfB6StSze48eIlyX7GU75UbOKLjiQzxr7glgc0BBC2pPasxxYEZLsSaf12H++38WeURGxWSWl/T6gUwbnrcgW5cEQg4qN1W5Dnfw3Y1C9GjNSgA5d9c50GTwdXggZE0C6h7D4XFmRxklzZcNLifqrMltbB2p1sAUcYqEVBaDp02dVnwExXxpYzRUk1YtDJq1J2UBL09xFJZ+HDQXlQ3QA3MmuqnVH+RF0ep6aWqgP5ziopuETTb0ctx8FXe1P2T49F5xE0AEA6FxVVr67V++BhkIvm475ZmS5bkZpMrFWTVq2+aI+wbafafX/11qzCqU8FEdHRgs6HDRYy3tJ242zf2ypp8O9uzzloMF/D7IZ5gqxCSWTaPqdApCdNyERNSAB9aViOpgMSzu4ms8VlrqZGOGLKYSiMUHPJ2VD+Z9qD0SDvnODq2fVeGzEAQslQWeTztHT1U0mmb7YpHZ5QHC4cctAABhlHbIWoFC1Vh51DcU8inkcpVod1nBzuvsb2tfgPeww84yuXESMe8m1mZq7SBTGS6HpkNM284CofpgKx6ubLfBZQwrNK0mNfmg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6eb3b03-0934-4442-1003-08d85596559f
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2414.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 14:32:24.4537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXtRMXSs9qwmXy8kIXMxZz+vCBpTtAnU9W16lRwBuUnG6bKXCM+u4ONtHEdoswfli7uUtG/2ODtnjOF+3fNN5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2447
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMC0wOS0xMCB1bSAzOjUwIGEubS4gc2NocmllYiBZdWVIYWliaW5nOgo+IElmIEtGRF9T
VVBQT1JUX0lPTU1VX1YyIGlzIG5vdCBzZXQsIGdjYyB3YXJuczoKPgo+IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2FtZGtmZC9rZmRfZGV2aWNlLmM6MTIxOjM3OiB3YXJuaW5nOiDigJhy
YXZlbl9kZXZpY2VfaW5mb+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3Qt
dmFyaWFibGU9XQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyByYXZlbl9k
ZXZpY2VfaW5mbyA9IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn4KPgo+IEFzIEh1YW5nIFJ1aSBzdWdnZXN0ZWQsIFJhdmVuIGFscmVhZHkg
aGFzIHRoZSBmYWxsYmFjayBwYXRoLAo+IHNvIGl0IHNob3VsZCBiZSBvdXQgb2YgSU9NTVUgdjIg
ZmxhZy4KPgo+IFN1Z2dlc3RlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+CgpSZXZpZXdl
ZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpJIGFwcGxpZWQg
eW91ciBwYXRjaCB0byB0aGUgYW1kLXN0YWdpbmctZHJtLW5leHQgYnJhbmNoLgoKVGhhbmsgeW91
LArCoCBGZWxpeAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKPiBpbmRleCAwZTcx
YTA1NDNmOTguLmUzZmM2ZWQ3Yjc5YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfZGV2aWNlLmMKPiBAQCAtNTAzLDggKzUwMyw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2Zk
X2RldmljZV9pbmZvICprZmRfc3VwcG9ydGVkX2RldmljZXNbXVsyXSA9IHsKPiAgI2lmZGVmIEtG
RF9TVVBQT1JUX0lPTU1VX1YyCj4gIAlbQ0hJUF9LQVZFUkldID0geyZrYXZlcmlfZGV2aWNlX2lu
Zm8sIE5VTEx9LAo+ICAJW0NISVBfQ0FSUklaT10gPSB7JmNhcnJpem9fZGV2aWNlX2luZm8sIE5V
TEx9LAo+IC0JW0NISVBfUkFWRU5dID0geyZyYXZlbl9kZXZpY2VfaW5mbywgTlVMTH0sCj4gICNl
bmRpZgo+ICsJW0NISVBfUkFWRU5dID0geyZyYXZlbl9kZXZpY2VfaW5mbywgTlVMTH0sCj4gIAlb
Q0hJUF9IQVdBSUldID0geyZoYXdhaWlfZGV2aWNlX2luZm8sIE5VTEx9LAo+ICAJW0NISVBfVE9O
R0FdID0geyZ0b25nYV9kZXZpY2VfaW5mbywgTlVMTH0sCj4gIAlbQ0hJUF9GSUpJXSA9IHsmZmlq
aV9kZXZpY2VfaW5mbywgJmZpamlfdmZfZGV2aWNlX2luZm99LApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

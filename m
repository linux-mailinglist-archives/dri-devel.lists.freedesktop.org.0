Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A54FE75C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 23:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321E96EB27;
	Fri, 15 Nov 2019 22:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690079.outbound.protection.outlook.com [40.107.69.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477926EAE1;
 Fri, 15 Nov 2019 22:03:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JB4mnzA+HXjZ8r3jvG3tILD5KipS+hEYZybNv+BP8zleLc/RxxKrH55Hy0wNXrcVe20IwgvqoE7d5RCWR9oyZg1RASHYYZE/l2I2QoeimHJHvUT1qVfmJL5Sq8OwERlsjm2CDUIypRbBilwCwworuDst72Z+ZCCkl2tAQkLAEWctlbtADlsuucCp3fYw7CEXtvU+rWVX+m8DMtPV9TsqHZpehNFQepq1BnHjQLWzHfxGCfHUwUWBOujgFysmpjlg+seFfHHKVSv6oS1lL2aOS/oRKGXcm1kGpNVFbVHLC+TZKOCCsDBrGKtDZu+B801AVTorZWVWSu4HQqYxGlc25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGcvy2HqKEojzxriHmACz4FIP7yxbFRhwVJ7AGeOWNM=;
 b=UAxPXbOe5o8Cqd1mMyo4kQ+dJ5dUnCnmP0tJ/yUWpGR4ZIKqUOMSYtuuKg3vVR6ntOkxZrBrSuGjo3eRVyyBKJYbSLNHbRJ3stBRCdLD6LMs0lT/zRVf4HdhEHrMRl4zziA9DZozOdwHaC0/HPaaeU75mtFC9ZUIy/G1qnNKmG//XTJrwFsWZ8YligkHG3tpq4hWecf107I2b9ZT/ofAxdgJQOp0+yEf1uDrgC9VanW6s+n4lpCasrm8ux3A7lL3jVkUqgDrat/OocrveMKbiLCKSm1VdkW5gClbwfogNi/AUrVSO1hgGzEnSytQMw21SLRo4zdg9BQ9SztcX0yNyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3949.namprd12.prod.outlook.com (10.255.237.150) by
 MN2PR12MB3166.namprd12.prod.outlook.com (20.179.83.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 15 Nov 2019 22:03:00 +0000
Received: from MN2PR12MB3949.namprd12.prod.outlook.com
 ([fe80::49f3:af31:eb8e:569b]) by MN2PR12MB3949.namprd12.prod.outlook.com
 ([fe80::49f3:af31:eb8e:569b%4]) with mapi id 15.20.2451.029; Fri, 15 Nov 2019
 22:02:59 +0000
Subject: Re: [PATCH] drm/amdkfd: remove set but not used variable 'top_dev'
To: zhengbin <zhengbin13@huawei.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <1573701625-120559-1-git-send-email-zhengbin13@huawei.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <5dac1add-79e8-0b52-fe49-918bd21dc449@amd.com>
Date: Fri, 15 Nov 2019 17:02:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <1573701625-120559-1-git-send-email-zhengbin13@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::37) To MN2PR12MB3949.namprd12.prod.outlook.com
 (2603:10b6:208:167::22)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 53997eac-be4c-455f-05ec-08d76a1793f2
X-MS-TrafficTypeDiagnostic: MN2PR12MB3166:|MN2PR12MB3166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3166A14578FBB4D1B927BA9092700@MN2PR12MB3166.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 02229A4115
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(189003)(199004)(76176011)(186003)(316002)(6116002)(2906002)(3846002)(229853002)(6486002)(6436002)(66476007)(66556008)(66946007)(58126008)(81166006)(81156014)(65956001)(65806001)(66066001)(8676002)(5660300002)(47776003)(305945005)(4001150100001)(446003)(53546011)(31686004)(486006)(7736002)(52116002)(26005)(6506007)(386003)(2870700001)(25786009)(14454004)(99286004)(44832011)(14444005)(36916002)(86362001)(6246003)(476003)(2616005)(50466002)(478600001)(8936002)(2486003)(6512007)(11346002)(23676004)(31696002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3166;
 H:MN2PR12MB3949.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CysmVhMep1rN4TzhYqsGkV2x86VpgvYXa+2uOLSpnwR/ps8rP30r1+6Swk6lAtad8FWsTcHSU7zt2hsFt1aD4M9tCy1DCsInMNYKQ/av2aHfnAQZNj9vwYkEai1NBn52wSSn/kOEfRDnpbCEyLazexKbrcYyTUDcIe8lPuu9Zo+o9YPnEpMDKfVves/DE+1+q1TNv4ex8Cr+At8TTW4edbNzVs7dVVDe1oBAmIaOUu0iG/OYe6GBHWjclK0w9qke2EsEV33fOD/EHTcKigRSOUVmhi2W8x5ai9TSBbSjnahEExrxLhe2ujTlFE8kbbvXVJnIxmhrBwGHoXmiXysDFk7PlDNG4zTbXHfiloimENDsB4YJPFnof3zYSI/BF0u7GAX9NU5lc89cY2ezl0UO9U82lBNLEMWl44G2zyknrILQ/EO00XHG86tlLCwBwM9I
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53997eac-be4c-455f-05ec-08d76a1793f2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 22:02:59.8596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63xmrrKQ4GUQMaEmTb0RVJelTLR3sAlryYTKaZ394SkRh3/gfdyu4wBfO2y9sUWEc6fIEznW24ZwiRwI466xqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3166
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGcvy2HqKEojzxriHmACz4FIP7yxbFRhwVJ7AGeOWNM=;
 b=m+Q942sLrojdxN7bilr3jtJ5XJ942z1IoInpRDxO1MSYmSekTM5KjI5OldRiQJlrzkBqI8SK3l2RUtqMD3atOQvYdGSl5Wrgl7eYP2nYRSmSYp4RhRXzC0M78WwxwezCRNM+tcMYOMBdMgiGqwBBDmrrgvzKTEnJpEFUrvUHQO0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

T24gMjAxOS0xMS0xMyAxMDoyMCBwLm0uLCB6aGVuZ2JpbiB3cm90ZToKPiBGaXhlcyBnY2MgJy1X
dW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4KPiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfaW9tbXUuYzogSW4gZnVuY3Rpb24ga2ZkX2lvbW11X2RldmljZV9pbml0Ogo+
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pb21tdS5jOjY1OjMwOiB3YXJuaW5nOiB2
YXJpYWJsZSB0b3BfZGV2IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFi
bGVdCj4KPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gRml4
ZXM6IDFhZTk5ZWFiMzRmOSAoImRybS9hbWRrZmQ6IEluaXRpYWxpemUgSFNBX0NBUF9BVFNfUFJF
U0VOVCBjYXBhYmlsaXR5IGluIHRvcG9sb2d5IGNvZGVzIikKPiBTaWduZWQtb2ZmLWJ5OiB6aGVu
Z2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgoKVGhlIHBhdGNoIGlzCgpSZXZpZXdlZC1ieTog
RmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpJJ20gYXBwbHlpbmcgaXQg
dG8gYW1kLXN0YWdpbmctZHJtLW5leHQuCgpUaGFua3MsCiDCoCBGZWxpeAoKCj4gLS0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW9tbXUuYyB8IDMgLS0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfaW9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9p
b21tdS5jCj4gaW5kZXggMTkzZTI4My4uOGQ4NzE1MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfaW9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9pb21tdS5jCj4gQEAgLTYyLDkgKzYyLDYgQEAgaW50IGtmZF9pb21tdV9kZXZp
Y2VfaW5pdChzdHJ1Y3Qga2ZkX2RldiAqa2ZkKQo+ICAgCXN0cnVjdCBhbWRfaW9tbXVfZGV2aWNl
X2luZm8gaW9tbXVfaW5mbzsKPiAgIAl1bnNpZ25lZCBpbnQgcGFzaWRfbGltaXQ7Cj4gICAJaW50
IGVycjsKPiAtCXN0cnVjdCBrZmRfdG9wb2xvZ3lfZGV2aWNlICp0b3BfZGV2Owo+IC0KPiAtCXRv
cF9kZXYgPSBrZmRfdG9wb2xvZ3lfZGV2aWNlX2J5X2lkKGtmZC0+aWQpOwo+Cj4gICAJaWYgKCFr
ZmQtPmRldmljZV9pbmZvLT5uZWVkc19pb21tdV9kZXZpY2UpCj4gICAJCXJldHVybiAwOwo+IC0t
Cj4gMi43LjQKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

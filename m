Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E80297480
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08566F8CB;
	Fri, 23 Oct 2020 16:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A079E6F8CB;
 Fri, 23 Oct 2020 16:38:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idTJ0BjCrHUOHAYjUTsC54cRzZJIz0gJcX5EG1+7BAvpdlHgvUGRn6k15f1/2hZfLIHYARMwQkx36ILIVUkJkUfWuSzrWqZ9oioKjpzI9/GTymZyRI7EJzs0Awpwwl3I89XsKN1ZG3hcsfJrggO/c5KlqNgCOSwEG2t5P29Z0TLtCM8VUe25WgS4ve7u4hb4wL7q5il/HJJfkiXXNC2Gbf9EA19KXV8QI8AwXzNbOrA3GYElR5rmb4bPPphARuNSFwwlF71iDHqgC7rH6BCgPrle5BZc/Zj8BufLTSqeNpaw+3J4ZWnUSvuMdSY8yW2EPTpqhaLCq4MqK/5hxZgowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4DrqDtPSnNUPbW1Da7SwRFtEuUOsRLtXyyuKxC4jF0=;
 b=BBVf84BCOyaxka5hajjhowSZQ8H/cH2P2Vf8cTuIxv79HdlgrNIt39PMJfHjSWQrw7q1o+GgFuISDIAvpCVPUqWi5tP8G06xiYHlZj1A+ZW98CDa+3mf9Yy+XJIUMhdXUa0DXus7KBZMbjs57aZgpOUKH4SWix0yrKF0/PhAeYt1qHNsHuE9QWnOFKlRr6b0/QSUydy/i5jmXYTsJ8i9G2gT/33NH+7cB0wFMGDOWCjffcRH8zE+Kpnq3S3//1G4Ul7j/FChzV0RoYe0ManIUmDY+irqSIXIUGkDxWTQDE52s7HgwD4DllvkJwGA6krx7dqjnk0Xs8K5azeW7kJ0zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4DrqDtPSnNUPbW1Da7SwRFtEuUOsRLtXyyuKxC4jF0=;
 b=An+TFKGzN8SbrQLi4xiKe49EFHFXd6hDBzuiGZh3AcGYxRZwNofwguPu9bdvk/7+2hzzUzhBXO4J3vNDzDq6SVVmeaE3RN4r43xFjnmBiJb0pGW+nARmWTRkRrAQh2ksf7oow+xgY4lH/qqealvnkHGCeGJPK/oJCiYuS1+o88I=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4318.namprd12.prod.outlook.com (2603:10b6:208:1d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 23 Oct
 2020 16:38:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 16:38:46 +0000
Subject: Re: [PATCH v3 03/56] amdgpu: fix a few kernel-doc markup issues
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <632b3b11118969ff6fccb8a2f606c87fde41c138.1603469755.git.mchehab+huawei@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ecb99629-f593-b389-60b3-dc6f1b306c8b@amd.com>
Date: Fri, 23 Oct 2020 18:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <632b3b11118969ff6fccb8a2f606c87fde41c138.1603469755.git.mchehab+huawei@kernel.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0132.eurprd04.prod.outlook.com
 (2603:10a6:208:55::37) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0132.eurprd04.prod.outlook.com (2603:10a6:208:55::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Fri, 23 Oct 2020 16:38:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 51ec5735-a37b-435b-5f6b-08d877721c74
X-MS-TrafficTypeDiagnostic: MN2PR12MB4318:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB431803764B84C9A7D7A80150831A0@MN2PR12MB4318.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DlqryhEoO1L7KJ0DvWsnV0M4KcXExuf2+UXXkW3B2XfPyrldcYn1Mvsl0wOvV/ccZpJ72ysExWWaBx0fnGWZpfJqJPBLU25yel1Irc3hcyQcOeIhgS2KnM8YtgAnRYdaWr6SRlopLjr1cyTf7Erkw1sAL70iZwZAP0stccinlkPVuY0SWRemk/SoUmBUJiKLLJYLPZO9ITiuBFhuHYpV7EzfkYZxJSUvoN51IkjTbNKQ0/dxR8RKPQm5+r/MiKfQwrIsbAaqD8+GVjGGzLkntJwa5Niduaky5Xhxk6IZ/fDo29ZTxD7hVecMO/V6j7u3vljgX9RzFTv/wDMw1qE28eZPEAoT8QDvvT5w7C0ujg19O/z187xxZiOFINzENHxA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(316002)(66946007)(6486002)(110136005)(478600001)(86362001)(31686004)(54906003)(36756003)(16526019)(8936002)(31696002)(8676002)(2616005)(4326008)(186003)(2906002)(66556008)(52116002)(66476007)(66574015)(6666004)(83380400001)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: sw/qPRCwAvvMW+cjsvCoYitUPXvHGQxo0wJEc5TjscHFtQ2CXsXrZuELrx05Ye0hnJiElZvQkUwg5miXe9LYG2ex7T5mKO90qPY5IaixC7OKwgUPeLMvgAlGgktmZjmOwr+H/VlyElHxSwVFynK0tpc6XdaiAcO3VFpbJber854U6cR4R3Lm6xi2XHm0SPOfn2J6bD6WB1XmY6tvTZQTqZ3hEqv927DlefVfBnuJtdsSTBLWmfpPAwNceGKXnksVhnuuhhZ+E8z4ofBj8qkJ6yrcWnGbFnDrGSk2jvazFRWOocgVErRr31Ij5Ptp0FHG05gsHh7gZocqQVofN9JjrBWnRZkSF5d3Vbf7yYbFRVRN7sft5ZBrZ1W9RLkLIAI7VNMhPWCsgpREAaiWul7NwPJwhJBfbZVkU4515fI8A0PI2uN45y6fIwzkD/nUiUOsf03fCs+rin05NCRIurZuz1V4QCSCAclfRegq5hS6ANm1RjLr+mOh10HCqJiJNuYebFEb8gv76oL7H4k0qBPWh0buqwFoYGepLEW1HuknSUo9XJupCAt7gEi9wPTQ+Vwp+fYA6ZC4ZnHBDqSNQoaubn/mmg1gcuo5HfUFtz6iNct0zyWUr628bUjCFopAgd2cpp6A+b3CySTPPYUfpuSrjtkWPEU7RVuLcySs17iehRGleMbtTgiaripa1ry72wINi0KbcA29+ZJ0MQaKIrGRAQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ec5735-a37b-435b-5f6b-08d877721c74
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 16:38:46.2809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PG7yzvjAGPI8dfhortPP6Tzxd6BMl1SG7LKyMA4lLWsgA+E3tiWGCqSLk7vtyBJ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4318
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMTAuMjAgdW0gMTg6MzIgc2NocmllYiBNYXVybyBDYXJ2YWxobyBDaGVoYWI6Cj4gQSBr
ZXJuZWwtZG9jIG1hcmt1cCBjYW4ndCBiZSBtaXhlZCB3aXRoIGEgcmFuZG9tIGNvbW1lbnQsCj4g
YXMgaXQgY2F1c2VzIHBhcnNpbmcgcHJvYmxlbXMuCj4KPiBXaGlsZSBoZXJlLCBjaGFuZ2UgYW4g
aW52YWxpZCBrZXJuZWwtZG9jIG1hcmt1cCBpbnRvCj4gYSBjb21tb24gY29tbWVudC4KPgo+IFNp
Z25lZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitodWF3ZWlAa2VybmVs
Lm9yZz4KCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
IHwgOCArKysrKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMK
PiBpbmRleCBmODc4NWJkZWM3OWMuLjFkNGI1NDk1MDUyOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiBAQCAtMjM5LDkgKzIzOSwxMSBAQCBib29s
IGFtZGdwdV9kZXZpY2Vfc3VwcG9ydHNfYmFjbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ICAg
CXJldHVybiBhbWRncHVfYXNpY19zdXBwb3J0c19iYWNvKGFkZXYpOwo+ICAgfQo+ICAgCj4gKy8q
Cj4gKyAqIFZSQU0gYWNjZXNzIGhlbHBlciBmdW5jdGlvbnMKPiArICovCj4gKwo+ICAgLyoqCj4g
LSAqIFZSQU0gYWNjZXNzIGhlbHBlciBmdW5jdGlvbnMuCj4gLSAqCj4gICAgKiBhbWRncHVfZGV2
aWNlX3ZyYW1fYWNjZXNzIC0gcmVhZC93cml0ZSBhIGJ1ZmZlciBpbiB2cmFtCj4gICAgKgo+ICAg
ICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+IEBAIC00NDk3LDcgKzQ0OTksNyBAQCBp
bnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
PiAgIAlib29sIG5lZWRfZW1lcmdlbmN5X3Jlc3RhcnQgPSBmYWxzZTsKPiAgIAlib29sIGF1ZGlv
X3N1c3BlbmRlZCA9IGZhbHNlOwo+ICAgCj4gLQkvKioKPiArCS8qCj4gICAJICogU3BlY2lhbCBj
YXNlOiBSQVMgdHJpZ2dlcmVkIGFuZCBmdWxsIHJlc2V0IGlzbid0IHN1cHBvcnRlZAo+ICAgCSAq
Lwo+ICAgCW5lZWRfZW1lcmdlbmN5X3Jlc3RhcnQgPSBhbWRncHVfcmFzX25lZWRfZW1lcmdlbmN5
X3Jlc3RhcnQoYWRldik7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E882AA4E8
	for <lists+dri-devel@lfdr.de>; Sat,  7 Nov 2020 13:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8786E0A0;
	Sat,  7 Nov 2020 12:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0746E0A0
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Nov 2020 12:12:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhK00RDpTcnzR8IX4y/OWITEZcVhDxHTe6IB4Oo/qEyx48oMMg5plObd2cpQLafpVtQ/1mPGnIuL43IiKmx03gg/5ozaku8qKilgc8qeb9ppmchJGPr+5j5XeVE2xrBJAm/F935VEZFT9FvlsgElMlqFBnLng5Yu5c4Z5gUoV39fME2KhId4nMcyWeN+Vwg++Vlk0s+4Skg4dR6ZAErgqfS0fmbDxhEmYTk0D50PDJdnfWQoOqTcXu8LankTgHhkbY3cJBdRZmAlZjMKqJ3/oaxSwsNv3pDLbgo9Z8OpgXtWs3zGXIeYtFFeoDW0YId7Na+PXtn3SQIL22a/nSHNtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/t7npU7A8P4jtcgq02VAPiswkxIr93rIBgCZBNrZYNg=;
 b=Qa2aoolpHkXdc8f/ZEAONOsW14H1DxsXeQkdSdxQT87DUjBOlCMeHilXNqBIQtwus+Nm6Z0oUx3xfCdYzHx3QRe3C7u4sgxlQ418KO8oghgxXEVX64lEW49a2qSCWpDj3ZeLpugTP0YW5Ik1TArD3yT/XnuebOtk4SlsdPp9x6/x7cgDlDKjkDryg0XlhfKbW5EgRy02AeVUPdrHISzEJ6GCXnoBF8LSh/IELf+6w2vZVtyoT7q8b7hnD7vzl3iTtfvXMputxw+9Das2senNNGh3FLbfk7ZOyWzgc1/n2ZVvcrcM4sdIIw9jUp3+myW7ZwWxUP3V1yBoBl7PvOWfiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/t7npU7A8P4jtcgq02VAPiswkxIr93rIBgCZBNrZYNg=;
 b=HGeF/SLFGoaITKg0dTZ7TBGySRblipaUYYFqCB9xtNb1+aUOrX8/Nc/fyveIwhoH/SZ6OBzlSGg7Wd9Jb20yaJqibfF0LwOL/HwVsT+18ZCSi4FNnKAT5/Mp3eteESH2lbC1Ufu1rBf/UzNxcKyYvDfu08J1jvxRIg+78YuXZ9I=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2545.namprd12.prod.outlook.com (2603:10b6:207:4e::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Sat, 7 Nov
 2020 12:12:15 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3499.032; Sat, 7 Nov 2020
 12:12:15 +0000
Subject: Re: [PATCH 01/19] drm/ttm/ttm_range_manager: Demote non-conformant
 kernel-doc header
To: Lee Jones <lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-2-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <72945d8b-e1fe-8d4a-5c16-a40776e01007@amd.com>
Date: Sat, 7 Nov 2020 13:12:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201106214949.2042120-2-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::12) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P189CA0007.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Sat, 7 Nov 2020 12:12:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 89d6618a-266b-4afa-6f1a-08d883165d44
X-MS-TrafficTypeDiagnostic: BL0PR12MB2545:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2545215173EC9E48B96D9C0383EC0@BL0PR12MB2545.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ANpYD9OT/rIHvtvc0XuHBuPJibPpIrTIJm2wwJzwr+kIMFO8/w2dCsXlZeGMy+Tbz6RRpExEMcWzvsr7t/uMkGTSecZj9xRERAbqP6jzQOWJq0GAe7akyoBRzafEBxY2//fjCalMicNBdguJi34PizDOxMRBsDNmQro0mtk4tcyuPvj63gnMcsEX7AczAOe45LcjWuWV1agkQBeGIGE783Wd53oSjPSfp05sL1wIZKnmZpXfw33+O0hamiBVDky7cGNrFSm8eeYwXAqCxWDcJWKFjtTwr9D4Cw22Gmo2vKR9NHWBUPMmRn8jxI+r/EA+mLjmdnn3fKI2IBhJ7993IMH8cNR1oT3KdIxcFjdXlKN8UnxUHxOVFhTkPvDzPFg7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(4326008)(66574015)(83380400001)(6916009)(52116002)(8936002)(8676002)(478600001)(6486002)(31696002)(54906003)(16526019)(186003)(2906002)(36756003)(2616005)(66556008)(66476007)(86362001)(66946007)(6666004)(31686004)(316002)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: iDMmOsK74JWAV9hkPAuwoU0SRLCswaHGwROHu50bBendrvLoGmjB3CUkim9NBSFADS1jMUO7rp9FXOcNJdKQ6yWYDSUC5zHCKovD2vWeCE7qB/l/yJB2kWYWWJxw1fLzwsQ2yb3hqQzBZgy01PeFNJjsythHXKKhdBLOe0GVEql7Pay0on6JupXAGDuAtswI/gvjnxehQYFkewfZ+cJSoohr1526f74Ym1AUIREgbko5yy+Vi/IGQvcdORj908s5WnyYIFz/HDvZLOmXvlyghpLmwaHUiawP/Eo3fQP4v5ArhFX2tCkjir438+aLvcMxGUSgLsFSKP4J4OFxkOhpKknkJISEp1SHBk/wOfZgASzFI1eDFH7xzQQAP+Lv9wcznAAPvpm2nTLOvCynvD7rd+I/j7ETHQH/+vwHzcCZpnbM8FwM1K8404jao1d2b5F8tjG8VCaKshRKheRNXux5qUmhYGWrwsCKHdPM/zMipVKVNrmmT/YxVEyh4mpUHjxXfyohergcO3GIltFBjkQlyYOesirDf6RgDMMTsTjGilhSfL7XDQ7FI08iIpx9O4ooNCi/26juQbb2/GrspJpnuoFL3Fv1sQmaMug6ibKvr5jSCJYcykgqSofJ6vRAKrSNYlOhyns6/4RgWO2p0KwRr0l7ZdnD5DVU4e1smm1VDGytbzdeEQFuqHpcHse7/p0fnMEwWPNd7ZETX7WcuI+OPg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d6618a-266b-4afa-6f1a-08d883165d44
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2020 12:12:15.5607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmzoGkX/6HvZv7h8dQZIU9P7Gpb8FysWzj2x6GEJRcZPJIgczE1fwGDCzUQz90Aw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2545
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDYuMTEuMjAgdW0gMjI6NDkgc2NocmllYiBMZWUgSm9uZXM6Cj4gRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX3JhbmdlX21hbmFnZXIuYzo0Njogd2FybmluZzogY2Fubm90IHVuZGVyc3RhbmQgZnVu
Y3Rpb24gcHJvdG90eXBlOiAnc3RydWN0IHR0bV9yYW5nZV9tYW5hZ2VyICcKPgo+IENjOiBDaHJp
c3RpYW4gS29lbmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IEh1YW5nIFJ1aSA8
cmF5Lmh1YW5nQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcmFuZ2VfbWFu
YWdlci5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcmFuZ2VfbWFu
YWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcmFuZ2VfbWFuYWdlci5jCj4gaW5kZXgg
ZWE3NzkxOTU2OWEyZS4uZTA5NTI0NDRjZWE5MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9yYW5nZV9tYW5hZ2VyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9yYW5nZV9tYW5hZ2VyLmMKPiBAQCAtMzcsNyArMzcsNyBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4
L3NwaW5sb2NrLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICAKPiAtLyoqCj4g
Ky8qCj4gICAgKiBDdXJyZW50bHkgd2UgdXNlIGEgc3BpbmxvY2sgZm9yIHRoZSBsb2NrLCBidXQg
YSBtdXRleCAqbWF5KiBiZQo+ICAgICogbW9yZSBhcHByb3ByaWF0ZSB0byByZWR1Y2Ugc2NoZWR1
bGluZyBsYXRlbmN5IGlmIHRoZSByYW5nZSBtYW5hZ2VyCj4gICAgKiBlbmRzIHVwIHdpdGggdmVy
eSBmcmFnbWVudGVkIGFsbG9jYXRpb24gcGF0dGVybnMuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

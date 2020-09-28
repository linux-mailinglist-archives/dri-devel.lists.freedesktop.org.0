Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D343D27B1A5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 18:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A452B89D8D;
	Mon, 28 Sep 2020 16:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750080.outbound.protection.outlook.com [40.107.75.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C7589D8A;
 Mon, 28 Sep 2020 16:17:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmowzgtYOPr/jdDuddIhrRCoz9qC6ZjKUKEvhwJaOsMBr0Pjydb1Ck21j+SILJshxz3Qul7N7Eloe5JaTFElFpjuaLyeFQspaXlOhoDjqKUULgPl8LLtSthCcycnARwcZ+8Q+IIMI/lok/tJ08aQF5Byt78FtIhTKgDdY6f3Ktmb/rkxjGJN4U0JlwWU3ZAojD6wXmi3k55Ay/J1R0iq5gsRnI/XvumrePA/WlGwd2AjFhpItubZ1j+RbI1GrweseJkAxfXfDiT88/TirEOZfqpRNUFyrhSFyN7bmOdP3RjNBqfY179qAxXyLFlhWIPycY3BHOidP5S+I7MEvdhhWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBT1774VFROOelQFFIk1UsPr6o1s0qsqob/iYEunFKY=;
 b=Dp8CieFcUkyED7nUswwAWJr3cBa173RKTFy0Rg6RkDtRcHasNALHJlSqEhYWODLOHEuXmF//MSUMgNqkUvJ26zfXAz+f2vXRVLpZu/b5c02nQWSCvkXuPSQnllsuhN0JvOQpRe1lM7rK6OkD9+21VcHRqTp0Fpi3mRgBeht+MBdwcOaWevboadt5/C0ZBJdI9wRXa6L+ECvCsHyoK8Xvbl4wB4w5rPZ43mu1NNh3EPCOXNghAEUHiZtAD5LoXfERWIFrFVoUgcMaaxV4wRs9Kglo/vvsfLhowHr6iWp4oj/ibCjwUTRg/Yb6dr1/T4ep5S0bOBLPUS+h1wchqY8V5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBT1774VFROOelQFFIk1UsPr6o1s0qsqob/iYEunFKY=;
 b=qgW+F2Ipmiqe9DvD+QcaO+OGaB3dxhVSHCOpPBM8XkSsGO2/0fRBngtLiCYDMEDUZrZAPY611h0YlUF//739Fdhe5euaNoDGxfRGIvJ0iryrh14pFadgPIPzP38TjfjWl+zdSLpR+ydSzLVV7ZhN/ZwklknwhVK1oc1odtzTXzQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.29; Mon, 28 Sep
 2020 16:17:45 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::d548:1236:cb4f:1be9]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::d548:1236:cb4f:1be9%7]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 16:17:45 +0000
Subject: Re: CONFIG_AMDGPU triggers full rebuild
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <e7f5e4ae-7a6a-0a3c-666c-05180a8fe726@suse.de>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <ef014d4c-1406-d0a7-839f-7715d7afd15c@amd.com>
Date: Mon, 28 Sep 2020 12:17:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <e7f5e4ae-7a6a-0a3c-666c-05180a8fe726@suse.de>
Content-Language: en-US
X-Originating-IP: [142.116.113.11]
X-ClientProxiedBy: YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::21) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.113.11) by
 YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15 via Frontend Transport; Mon, 28 Sep 2020 16:17:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 75601ca8-94b5-4821-9de4-08d863ca07ee
X-MS-TrafficTypeDiagnostic: SA0PR12MB4430:
X-Microsoft-Antispam-PRVS: <SA0PR12MB4430526F33CC7A95DCFB0F8492350@SA0PR12MB4430.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X7ofn4grL0KS/E31HrxECH68mVd9PXN+mrk+Uj8AJpJT3Jz9uTwTZ8qPRSqqLH9KIeVpDqW8RntaVbG0IR8QeNQrVemdcRHCToytmXo9MBAQaOse8JD4CKCWv1JcitSUm5UltPAiuaqQinEdXEHUziovyEaPhDpcyml41H2QUbenHZXjfge3OcoVVTB+jW9uRttTfCjA0MK6PIoIy1LvPKYurQbrO4qUqY1XviWIBj5YRhg7Ae6iPlYdd9LKIEl6JR1SMRneum7grhKSBqohDllHxAuPJiyWRgt9iyFRAoOJdtaxnxUsI7xoaAU8vewW61n7QirWo5SJ+4036id7+wFhk8i2SOI5AeJ5+xat6MM2lS42FFdTXrbTWOcFvVPuVdU39SlCT7c35Pojt5km43RM+YzaJ4QL4coBqEO75PzkbwfOg0V7EqrcBk1GEJbCBEU3tC69eT84YbVt5igXzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(8676002)(5660300002)(316002)(44832011)(26005)(31696002)(8936002)(966005)(2906002)(956004)(2616005)(36756003)(45080400002)(6486002)(86362001)(478600001)(66476007)(66556008)(66946007)(186003)(110136005)(16526019)(31686004)(16576012)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: gXunnoejC0+0GFTH1y6om2vSoV2kujLKMNr1XpcvKFmQneCppZq1u12Sjqk04WV2iB/b8HRrH6m8pu8iWX2lUnBf/azpIdKjgwdnNBtd5wd9cyN5QXk219cxr8Lzec0PPTG5v+vfYuk7c/y5+VQ0lM7qgVb7gHGNCuJZGCFieUt8pF3ANhVpT/H6kL2gaobAz0SHcyl3o1HlGxLRWsMcN6N5DsHyYmu78lfa+P4GJiA6WzQXnRMBLO8SJeo+tirM5MRloFKA4D3QBr8ERAy+vg1eKNWwVmcztqAlv6zbA0w9r37hOWDt0g6JyTQ2AtmloS/GMmYpz+R5u3gPsUl/uD9ygI/ZoXMKCYyIisvCLLQdJNo94I2JATKCphtAYo5yCKia6bwZgJFMBtbUNpkGczHod9vZSXFtJR8ztNOhlukHXvJZkVErW71iGZ+r1dCIfFiniUhbElOcYvh+JusvihDY0DGlzK0tv6JC2696nvp6RwcAAoIcnMM16IGW4fencXS8CSeIqHjPnaV/GuI5Vdde9PwKKG8C7QiCcRyp1+5ckqXB49r7yIRXAbWfLTnGpAwKrm9ybbAuYFWfS1y9JChHC29PEmqevm/sePMXW2P2puVmZb+sbGqOAEsSd01Mg/wf58ThECHVYaow0JJYrg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75601ca8-94b5-4821-9de4-08d863ca07ee
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2414.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 16:17:45.0171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FclRw/gbLxrvJvSVmFfknB3j5yoxl8ItcAnG9Z2zS1uBsiCBozxQHLG4h2uKML/UQCRwhCT9xeo8ytr2WcT85g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgSSBoYWQgdG8gZ3Vlc3MsIEknZCBzYXkgc29tZXRoaW5nIEhNTS1yZWxhdGVkLiBUaGVyZSBo
YXMgYmVlbiBzb21lCmJhY2stYW5kLWZvcnRoIGJldHdlZW4ga2VybmVsIHJlbGVhc2VzLiBTbyBJ
IHdvbid0IHNheSBhbnl0aGluZyBtb3JlCnNwZWNpZmljIHdpdGhvdXQga25vd2luZyBleGFjdGx5
IHdoaWNoIGJyYW5jaCBvciByZWxlYXNlIHlvdSdyZSBvbi4KClJlZ2FyZHMsCsKgIEZlbGl4CgpB
bSAyMDIwLTA5LTI1IHVtIDEwOjI5IGEubS4gc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBI
aSwKPgo+IHdoZW5ldmVyIEkgY2hhbmdlIHRoZSBvcHRpb24gQ09ORklHX0FNREdQVSwgSSBoYXZl
IHRvIHJlYnVpbGQgdGhlIHdob2xlCj4ga2VybmVsLiBJIGd1ZXNzIGl0IGF1dG8tc2VsZWN0cyBz
b21lIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBmZWF0dXJlLiBUaGF0Cj4gZnVsbCByZWJ1aWxkIG1p
Z2h0IGJlIGF2b2lkYWJsZSBpZiBJIGNvdWxkIGVuYWJsZSB0aGF0IGZlYXR1cmUgcGVybWFuZW50
bHkuCj4KPiBBbnkgaWRlYXMgd2hhdCB0aGlzIGNvdWxkIGJlIGFuZCBob3cgdG8gYXZvaWQgdGhl
IGZ1bGwgcmVidWlsdD8KPgo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+Cj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBs
aXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL25hbTExLnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVl
ZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTAyJTdD
MDElN0NmZWxpeC5rdWVobGluZyU0MGFtZC5jb20lN0NjMjBhMmE4YzQ3MjU0YTE4YzkwYjA4ZDg2
MTVmNmUzMSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzcz
NjY0MDk4NzMxOTc4MTEmYW1wO3NkYXRhPWsyUzhvdVF6UDZHS08zQVdKUmhlRUZibFhwN0NrVUxN
dnhyaEdVSFdxM2clM0QmYW1wO3Jlc2VydmVkPTAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E78C2EEDF8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 08:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B114C6E7D4;
	Fri,  8 Jan 2021 07:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64DD6E7D4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 07:47:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlRcHqh5WUQuxFmAVt0QkdJTTRECg17R87U59bha4Gxiw1B4uj966m97dxKMQAm32G5Luvd/VLf1NHTLrbI2XIX66Bls7KUs+gEqPP4hMV68mIsqol/cG8wyTMsvmFucC+Bd85IBPnWMztfeJjIMPOuUY+xyVfEYro7vDDt3+D64C++O8IA0pIuQoEaFSI3C/V8CblrAvAkbLJCX5yrNPvMAXQpnV51K3vpXdJpgwYCJQZBbWxm600F2XuCSU6DPqDaoHK2NDzU0VftOA/TGPBamYYjvA6psnxW9yAGwUn8cBdBB9kCUlbDROnWXQuCbuuuS4+GR2QXQPG3RobwN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTpxKJxGklHB2Zg3f7x03fqZ4S2Bd/tqWLMD+wS6wVA=;
 b=hNm4YEEWfwSRFWUbshOH1T/bAXuVAsmNqccGHC/2XzcW33fRdjDwczE999ZuL8neJV5RSP9l5xdIdUmWyLnMmD/z9WS5SlzuiJbFLyjzt85CiQ2sSnBz8cCzW2cQomvJad1DquH+mMnPZgbQL3n5yhGtlsgXN6zHdiN2IeDiDDhG8Oa/atVtscDxUKIlb7MQtEg70YKKyU4osExkp3xnluKFRjIVy+jfrLtkvwiKEJPnKK1QpIkeTiM1XY1YeObUxZdKlzouDp0KIcZ3GhkYFFdNOIC4NPcidoxhEpvkEYfV6p9F+cX4Qb2YCQDlj0TM+8T6XMWdB4Bn2YMzua7sjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTpxKJxGklHB2Zg3f7x03fqZ4S2Bd/tqWLMD+wS6wVA=;
 b=IdXu7CdrQfuJfEJxjqC0kTsD0HWD2kAjsns5MrwTxeBqRzMe01NlSs1zQ0twIb1tNtFIVthyaTP9AtJKVzMcyEov0VFzCxGG/EAgNp9gxQunU26J3fCyuCQcksNPTxJlPtYvNEcG1YzDrKWw2QEAa9r7OVGGAi7ixUmlQi4l7No=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4755.namprd12.prod.outlook.com (2603:10b6:208:82::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Fri, 8 Jan
 2021 07:47:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 07:47:42 +0000
Subject: Re: [PATCH 4/4] PCI: Add a REBAR size quirk for Sapphire RX 5600 XT
 Pulse
To: Bjorn Helgaas <helgaas@kernel.org>, Nirmoy Das <nirmoy.das@amd.com>
References: <20210107213240.GA1392833@bjorn-Precision-5520>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ad8af2b2-f00f-0a31-97c3-35f8542c749e@amd.com>
Date: Thu, 7 Jan 2021 21:25:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210107213240.GA1392833@bjorn-Precision-5520>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0101CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0068.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 07:47:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6a24b175-c3e8-43b0-cd18-08d8b3a9ae5f
X-MS-TrafficTypeDiagnostic: BL0PR12MB4755:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB47559C1D41279B857E3DC4F883AE0@BL0PR12MB4755.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a9umNFg+ED5Wik8HDj6vQplGXHCEHqShaWLBEjt7G/ijDXMyyOTByTSPVZaMy1QA7KUOQSoNAp5nZCxa2aI0uCyrXS1oLDW9+8Q2xo5J45vTPr2moesdq0xGrV4iX84IXwDaZfJKSP+3ZDMmRqXtjhdsTgtppNMxXqIKYlYr1WvhWsvR53e+v6q2IwXHfHY+aeCFZx6QcL2HDPAciDj1wo44mGkHR6rgQ9Xke1v8/z4QOdaM6Xb7RR1aZIVbS0xDf36uRA7n4jQSKl0obJJfaelgJYbkIevt7wCIsTLkMZvFoI/fZT2Zr8KdZWUpaoNHUr3Mua05gkMWB8867GgGZD1WmXKdLLGTuMbEeBV+sE3EJP154spVTxidmDbl7ACl2lbQobfeinBeBx1xvMHmdeH7ahZsqQeNX/dyH4eNXCK7lvvP/CTT2bV8xzRlw+hEOatz09pIl4UYGkP8mmbn1fYKtmz6aVcXeSM0CbfxihjHdFjF65XpQazrA3qx8cdRYOMaadmSItvk82GW1eINiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(2616005)(186003)(8936002)(16526019)(6636002)(6666004)(66946007)(86362001)(66556008)(52116002)(36756003)(66476007)(31696002)(478600001)(54906003)(45080400002)(66574015)(2906002)(110136005)(316002)(31686004)(83380400001)(6486002)(4326008)(8676002)(5660300002)(966005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L2ZmbUxFaDZNdmVuSUVOME44Q1Y0Zkt3Y0g4bHQ1ZFlTS09vc1d4NzNpR2Ro?=
 =?utf-8?B?S0V4ZWtsbTdmMWxjTG1ZaVgxNWhDQjF4cDlBV3d6Q3o4NFY4SlNoRmlSVDdZ?=
 =?utf-8?B?VGEvN3VkWVJTbDJQdXAvd1VQdCtJMUJRd2EwWmJ3cXdBLzFpV1hnb1RyVE9P?=
 =?utf-8?B?SWRocDl4YjE4QnM3UnE0SFlva3JhckpvZ2ppSWQxeVptQkVjY3lLb3FZRkFX?=
 =?utf-8?B?bHhrYmxxRjMwNUdqRWk3RTByVEsySmc4SzlQZUhIblpmZVR6QmV6V3pIdGhy?=
 =?utf-8?B?b1RRZVlkM1hQd1RlYTJFcTl4cENWSURBMzgrL2EyMHNWWElJaThUcGdWQUFP?=
 =?utf-8?B?bmdRbzQ2WHBjeitaS0R2STVzK05iVFZNeDMxVWtRamVzeFF3VFc4ejFWRU01?=
 =?utf-8?B?NDRGRndCVzYwekJkaFRHcGZlNnpsQmlpTU1xZHdMRU1ab2c2cDU5S1BjQ0NH?=
 =?utf-8?B?QWJzZnpLdlNkTGlCc3ZDbGlhZnZnVHhTVjlrQVFBSEhTeWNaT2o0N1Vsc2FD?=
 =?utf-8?B?Ni9RdG9QVFlEZk5lVVl2RkZ5a0RsTGQzNU52TWtTb2V2S0JYMjl4ZzhpQ242?=
 =?utf-8?B?SlVhcjdGWEhYOWtXWkhHMlJxTklxc2J6RlcvVEczQ09keTgyT2dLamd2K1hv?=
 =?utf-8?B?R3p1bDVGeDFVbmRXMGxOVmEyemoySFA0WG02Nkc5OGtDV2dKd0s5YVNYK3Ru?=
 =?utf-8?B?eW44NUdxWlZwRHgraWwxVkJaVHpjWWRYUUY4MFhGYUtxeFVjc1BERVhocS9o?=
 =?utf-8?B?ZFI3MWpzVWUxeVNCOGRKNFNyQ2xBblBoM0U1enpGSlp4ZCs4dmRTR2E0WUdw?=
 =?utf-8?B?ZXZoaWdNaWtYdlByVDBxUENwYUcxVHhvTkpGUXRkQ0dLa2tuUEdIazJiQ05V?=
 =?utf-8?B?Q1hQU3YwRTB2anpRQ29Da0I2T1ZERmgzbWxiZ0l3M3d3Q0xaem03NGxGMXI1?=
 =?utf-8?B?S2U2bzVyUHRXczgzMEliWEIxR25MNE9hR1dtaXNnUml3WjM0a29yK3h1UDk3?=
 =?utf-8?B?N01hOUZJVUlKMmZwem9qRDVlM1FBOHNpUkpZZ0h6YStBbHAyT1FOamJCcm1t?=
 =?utf-8?B?QXVyQ0NCdzZaTXhlZnVud2wrMXFJYVRLNXk0NHU5aHdZV1hEY1RHc3JCb3Fn?=
 =?utf-8?B?SW1QS1pNaThKSWtQYmFscml1Ym94ZlBOYmJuY0pIWFhldDA4UXVLWkdDK2pt?=
 =?utf-8?B?amdMVU50ZHlOamc0UWtVdVFab1RUU3lvNlloOWt6bWtGUlJIaWEzaE5KZllm?=
 =?utf-8?B?UmlFWnBlUm5nTFI5TWo3d3BjeEhDT0FEd1FRTGNDZWVvR1pMemZkNWxCV01O?=
 =?utf-8?B?UkxOdUFIVGxVelhSR2N6eTR2NXdnenNyRDAwdFJydWFKUWdDWVBjUUk3Ni9B?=
 =?utf-8?B?emZ0L04yUFc0bHpwVS8rYlV4YytEcjBaUDVOWjArRWVSc2RwYWpyMFhBekFO?=
 =?utf-8?Q?6ROuqB3z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 07:47:42.8464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a24b175-c3e8-43b0-cd18-08d8b3a9ae5f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwjjxoli6FBHu1z6E+R+D7aJmSZAGOnaGAfwfPWHNFedmdu1Kc9Sl4srhNd7mr6h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4755
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
Cc: kernel test robot <lkp@intel.com>, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, devspam@moreofthesa.me.uk,
 linux-pci@vger.kernel.org, bhelgaas@google.com,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMDEuMjEgdW0gMjI6MzIgc2NocmllYiBCam9ybiBIZWxnYWFzOgo+IE9uIFRodSwgSmFu
IDA3LCAyMDIxIGF0IDA2OjUwOjE3UE0gKzAxMDAsIE5pcm1veSBEYXMgd3JvdGU6Cj4+IFJYIDU2
MDAgWFQgUHVsc2UgYWR2ZXJ0aXNlcyBzdXBwb3J0IGZvciBCQVIwIGJlaW5nIDI1Nk1CLCA1MTJN
QiwKPj4gb3IgMUdCLCBidXQgaXQgYWxzbyBzdXBwb3J0cyAyR0IsIDRHQiwgYW5kIDhHQi4gQWRk
IGEgcmViYXIKPj4gc2l6ZSBxdWlyayBzbyB0aGF0IENQVSBjYW4gZnVsbHkgYWNjZXNzIHRoZSBC
QVIwLgo+IFRoaXMgaXNuJ3QgcXVpdGUgYWNjdXJhdGUuICBUaGUgQ1BVIGNhbiBmdWxseSBhY2Nl
c3MgQkFSIDAgbm8gbWF0dGVyCj4gd2hhdC4gIEkgdGhpbmsgdGhlIHByb2JsZW0geW91J3JlIHNv
bHZpbmcgaXMgdGhhdCB3aXRob3V0IHRoaXMgcXVpcmssCj4gQkFSIDAgaXNuJ3QgYmlnIGVub3Vn
aCB0byBjb3ZlciB0aGUgVlJBTS4KPgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCBy
b2JvdCA8bGtwQGludGVsLmNvbT4KPj4gUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5j
YXJwZW50ZXJAb3JhY2xlLmNvbT4KPiBJSVJDLCB0aGVzZSBSZXBvcnRlZC1ieSBsaW5lcyBhcmUg
ZnJvbSB0aGUgImNhcCA9PSAweDNmMCIgcHJvYmxlbS4gIEl0Cj4gd291bGQgbWFrZSBzZW5zZSB0
byBpbmNsdWRlIHRoZXNlIGlmIHRoaXMgcGF0Y2ggZml4ZWQgdGhhdCBwcm9ibGVtIGluCj4gc29t
ZXRoaW5nIHRoYXQgaGFkIGFscmVhZHkgYmVlbiBtZXJnZWQuICBCdXQgdGhpcyAqaGFzbid0KiBi
ZWVuCj4gbWVyZ2VkLCBzbyB0aGVzZSBsaW5lcyBvbmx5IG1ha2Ugc2Vuc2UgdG8gc29tZW9uZSB3
aG8gdHJhd2xzIHRocm91Z2gKPiB0aGUgbWFpbGluZyBsaXN0IHRvIGZpbmQgdGhlIHByZXZpb3Vz
IHZlcnNpb24uCj4KPiBJIGRvbid0IHJlYWxseSB0aGluayBpdCdzIHdvcnRod2hpbGUgdG8gaW5j
bHVkZSB0aGVtLiAgSXQncyB0aGUgc2FtZQo+IGFzIGdpdmluZyBjcmVkaXQgdG8gcmV2aWV3ZXJz
LCB3aGljaCB3ZSB0eXBpY2FsbHkgZG9uJ3QgZG8gZXhjZXB0IHZpYQo+IGEgUmV2aWV3ZWQtYnkg
dGFnICh3aGljaCBJIHRoaW5rIGlzIHRvbyBzdHJvbmcgZm9yIHRoaXMgY2FzZSkgb3IgYQo+ICJ2
MiIgY2hhbmdlcyBub3RlIGFmdGVyIHRoZSAiLS0tIiBsaW5lLiAgVGhhdCBkb2Vzbid0IGdldCBp
bmNsdWRlZCBpbgo+IHRoZSBnaXQgaGlzdG9yeSwgYnV0IGlzIGVhc2lseSBmaW5kYWJsZSB2aWEg
dGhlIExpbms6IHRhZ3MgYXMgYmVsb3cuCj4KPiBJZiB5b3UgbWVyZ2UgdGhlc2UgdmlhIGEgbm9u
LVBDSSB0cmVlLCBwbGVhc2UgaW5jbHVkZSB0aGUgIkxpbms6Igo+IGxpbmVzIGluIHRoZSBQQ0kg
cGF0Y2hlcywgZS5nLiwKPgo+ICAgIExpbms6IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3Rl
Y3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxvcmUua2VybmVsLm9yZyUyRnIl
MkYyMDIxMDEwNzE3NTAxNy4xNTg5My01LW5pcm1veS5kYXMlNDBhbWQuY29tJmFtcDtkYXRhPTA0
JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzMzYzE0ZjUzNjFlODRkOWQwZTQ5
MDhkOGIzNTNjNDEyJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3
QzYzNzQ1NjUxOTY3ODYwMTYxNiU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdM
akF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0Mx
MDAwJmFtcDtzZGF0YT13WTlxYXozRFRaQTA2OXF6bk1DOVd2b3E5U1pJenlKSEUwWGthVlhvcUFj
JTNEJmFtcDtyZXNlcnZlZD0wCj4KPiBmb3IgdGhpcyBvbmUuICBPYnZpb3VzbHkgdGhlIGxpbmsg
aXMgZGlmZmVyZW50IGZvciBlYWNoIHBhdGNoIGFuZCB3aWxsCj4gY2hhbmdlIGlmIHlvdSByZXBv
c3QgdGhlIHNlcmllcy4KPgo+IEknbSBub3Qgc3VyZSB3aHkgeW91IHB1dCB0aGUgYW1kIHBhdGNo
IGluIHRoZSBtaWRkbGUgb2YgdGhlIHNlcmllcy4KPiBTZWVtcyBsaWtlIGl0IHdvdWxkIGJlIHNs
aWdodGx5IHByZXR0aWVyIGFuZCBqdXN0IGFzIHNhZmUgdG8gcHV0IGl0IGF0Cj4gdGhlIGVuZC4K
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+Cj4gQWNr
ZWQtYnk6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4KPiBMZXQgbWUga25v
dyBpZiB5b3Ugd2FudCBtZSB0byB0YWtlIHRoZSBzZXJpZXMuCgpJIHdpbGwgbWFrZSB0aGUgc3Vn
Z2VzdGVkIGNoYW5nZXMgYW5kIHRha2UgdGhpcyB0aHJvdWdoIHRoZSBkcm0gc3Vic3lzdGVtLgoK
VGhhdCBtYWtlcyBtb3JlIHNlbnNlIHNpbmNlIGl0IG9ubHkgYWZmZWN0cyBvdXIgaGFyZHdhcmUg
YW55d2F5LgoKPgo+PiAtLS0KPj4gICBkcml2ZXJzL3BjaS9wY2kuYyB8IDkgKysrKysrKystCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvcGNpLmMgYi9kcml2ZXJzL3BjaS9wY2kuYwo+PiBpbmRl
eCAxNjIxNjE4NmI1MWMuLmIwNjFiYmQ0YWZiMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9wY2kv
cGNpLmMKPj4gKysrIGIvZHJpdmVycy9wY2kvcGNpLmMKPj4gQEAgLTM1NzcsNyArMzU3NywxNCBA
QCB1MzIgcGNpX3JlYmFyX2dldF9wb3NzaWJsZV9zaXplcyhzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
aW50IGJhcikKPj4gICAJCXJldHVybiAwOwo+PiAgIAo+PiAgIAlwY2lfcmVhZF9jb25maWdfZHdv
cmQocGRldiwgcG9zICsgUENJX1JFQkFSX0NBUCwgJmNhcCk7Cj4+IC0JcmV0dXJuIChjYXAgJiBQ
Q0lfUkVCQVJfQ0FQX1NJWkVTKSA+PiA0Owo+PiArCWNhcCA9IChjYXAgJiBQQ0lfUkVCQVJfQ0FQ
X1NJWkVTKSA+PiA0Owo+PiArCj4+ICsJLyogU2FwcGhpcmUgUlggNTYwMCBYVCBQdWxzZSBoYXMg
YW4gaW52YWxpZCBjYXAgZHdvcmQgZm9yIEJBUiAwICovCj4+ICsJaWYgKHBkZXYtPnZlbmRvciA9
PSBQQ0lfVkVORE9SX0lEX0FUSSAmJiBwZGV2LT5kZXZpY2UgPT0gMHg3MzFmICYmCj4+ICsJICAg
IGJhciA9PSAwICYmIGNhcCA9PSAweDcwMCkKPj4gKwkJY2FwID0gMHgzZjAwOwo+IEkgdGhpbmsg
dGhpcyBpcyBzdHJ1Y3R1cmVkIHdyb25nLiAgSXQgc2hvdWxkIGJlIGxpa2UgdGhpcyBzbyBpdCdz
Cj4gZWFzaWVyIHRvIG1hdGNoIHdpdGggdGhlIHNwZWM6Cj4KPiAgICBjYXAgJj0gUENJX1JFQkFS
X0NBUF9TSVpFUzsKPgo+ICAgIGlmICguLi4gJiYgY2FwID09IDB4NzAwMCkKPiAgICAgIGNhcCA9
IDB4M2YwMDA7Cj4KPiAgICByZXR1cm4gY2FwID4+IDQ7CgpHb29kIHBvaW50LgoKVGhhbmtzLApD
aHJpc3RpYW4uCgo+Cj4+ICsKPj4gKwlyZXR1cm4gY2FwOwo+PiAgIH0KPj4gICBFWFBPUlRfU1lN
Qk9MKHBjaV9yZWJhcl9nZXRfcG9zc2libGVfc2l6ZXMpOwo+PiAgIAo+PiAtLSAKPj4gMi4yOS4y
Cj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

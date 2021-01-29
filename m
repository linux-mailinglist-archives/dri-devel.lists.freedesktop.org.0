Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B63B309018
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 23:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8FD6EC44;
	Fri, 29 Jan 2021 22:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C68F6EC41;
 Fri, 29 Jan 2021 22:33:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOxmAPvCbzQPfvXoQifGIW0sM/PEjlhXe5gvR8q2zQUDWyu/pI+q6Md/OChWLm4bBG3+b10UrhK1jjfr+vk/TL3185mUGF9JWbf4NoPTxACXMsoRk3ghPzUGdIl2PtWolU0FLOf0xSw8JdvltiMPWJSlnmwE30Hubl1rtmvKMlq6KtyBKvaHq0R8eDXTF8gMfgpkesUD6YGQqeffO1b46DJTAdS5YoekJKe7e86fusTcANO3mOFSrR0Cbae1CTPxg8ocWSxAbmcTqhnWNGX7PPZ9GBbY97PCMWCO1QPX+/E7GmPjcBX/c13bJJETJF+MSiOub1k0ooCBvpkBMS+LSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1Hg1KjZlHx5Ee6NBEWmTSXDpo87v7en30HIOKwtBWQ=;
 b=bH3052nStZ92+VWNYjJ6jsOqwBaphaL3ZH+5yBRPXhJnHxkGdsJiyev24LuQ7VgQhi6Fq35RSSBJulMHzkO7clPhJ/NxFGZfv4zmIQPNr26+F+EhCGr07dpzHbkujEHETkhLq0v2XrvbbL5XpcWpg19AVRG6EiGivooiuqs5pa6i8SiBd5K8JnWvwwkIyw0ynqB6stuDzTm/yglsPtPelKhTO+EnmcGi6PKvx4gLrJ85pgoAoj0zeRq0Xqn4CWJ/3RNgotSMzBBG3A9aY+a9obGqConCbmygRwN6YEKC1S6+hcEtKNiTu+de6uCmWS+ym2VF3emXPYYMWH74dFzLfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1Hg1KjZlHx5Ee6NBEWmTSXDpo87v7en30HIOKwtBWQ=;
 b=FaVqfbCyulj9yFs96SjxK8OdT6/12H35rmn1wRR0UVeqY6g+BRPaNn6mZIwJZOmPDhJdv9buGQHBk0mLM5PBwmnEKuhT+VGKEowyPIb/CTizput5fjHrnFpF1cVE5p6tnlR8wcDXFm+RpZuTg3l0X969HNHu/Aqqkru6c6X1/CQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Fri, 29 Jan
 2021 22:33:09 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%8]) with mapi id 15.20.3784.017; Fri, 29 Jan 2021
 22:33:09 +0000
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.12
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, daniel.vetter@ffwll.ch
References: <20210129222840.3861-1-alexander.deucher@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <40a51812-7e2a-9408-f7a2-3dd02d63a301@amd.com>
Date: Fri, 29 Jan 2021 17:33:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210129222840.3861-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::33)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YT1PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Fri, 29 Jan 2021 22:33:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c44c52d3-4f34-4d2c-2763-08d8c4a5dad7
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB23539A91C20631D7AE63722592B99@BL0PR12MB2353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BC6svuM+KWXYvvRJ61iBidOBSvG/AZXpPv8tuRcMvlbMqmmocF32FpNsDth5mkNn4nJnt0bV6gGPUeevpm28ruEyrcewyXgmvwhHUcb9BPmgKRs6u/25CPkezEso/6HGOu0s10G/USotnuso9AWda6hloIsxQcjfDtUglpg+6LXIY47UPu3hD9ZchC1zijHtr6yparyVwc9Z8/vvSoengGe4byRnEpK4kq+N7JsrSq/JoSy79nc8UCi3vhOVXckJuGMOQAr12RB019+7bHaL0OLDmSwcHNGxpLQF++TQuwTASfW+LZsBRqeBvxpk34OpsfHrk43K89oTo3NU4/tTiWkrYko7L2OTpZcvOQ+G9sTOcoKsmCnK9eaaVGbyX2l8JHt/K5m6WneM77GT8AD+qooHqvy2/jFlmiix0t/7kYTGKqmPxfkHddhsb9+rATpe4JYh0tjBN6/Qh2hjlcK7kBIY0Dfd/SvC/tMg560qXHjocfvFAYYkdQnheloIHp2ZOxGjb8/ecTXTj1oH9PSEhN6BlalN0pMhxm2Hcgxn9zD8Ko2LZ7DaaUaR8NUleyN2qD+gmkPo5ISs5xVk8x5YwMrjZ+T48xv3BZE+yGeNv6Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(16576012)(36756003)(52116002)(316002)(31696002)(5660300002)(478600001)(86362001)(8676002)(66556008)(66476007)(6486002)(66946007)(54906003)(44832011)(956004)(2616005)(558084003)(26005)(4326008)(31686004)(186003)(16526019)(2906002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K01qZ1pxbFJWQUY5dDg0cWttU0NFZk54bngzaTFnZ2QybVN5ZDhqdEFhY1oz?=
 =?utf-8?B?UmxNUURRZGp6Q2hHTHcxcUtwSjYxb2dYdzZ6di9iMitSRTB1MXZ5bXp6QXV5?=
 =?utf-8?B?MnJIQUhXaXRSQnNTYmhRbERqaU1KV3d4emJHVXNBZVJ4dUc2VUtLdlJQV3Rj?=
 =?utf-8?B?dWZ3NnNnNFZrV2NLVGtxb0pBTnBXeHkvRnZtOVE4enE3OHYvVTh6NXhKMWhE?=
 =?utf-8?B?b1dyRnQ4d1ByM0QraDNEQStKbkNkNWR4QWg0d3paWVQzTGIwVVdyK0NxUWk5?=
 =?utf-8?B?RzlZSnFPNC9tczJrc1pHRWdtTzdQUnBIM2FibWJHL2JabTRCREYxcnMwUDZF?=
 =?utf-8?B?MU9VMkxGVlE4ZW5CeDhRVzhnbTY3T2tRMjhPcjVPZld0WnNIa24rMDJ5dmVa?=
 =?utf-8?B?MnZiRmFkQmwyaWlzeFI4K1NrNWVOWFk0YzJpSnR2bW9yUllINjc3VjFrYnl3?=
 =?utf-8?B?bHFCdUVoZUJsMUYzQmh0MGZwZUlkQitVSW5EZ3ZoM0Y1bk9NVU93VStRSm9H?=
 =?utf-8?B?eitnZUZRTzRrR2xoVUtiU2l6L3c5WVBNQ1RqZmR5ZUxnRGpyWkVxcFk1NTZo?=
 =?utf-8?B?OGIrcUk5WXRyVnkyaWdFbTVRZVkvdVZUUysyQjRQdllVdWwrZFBRTC9Db2tT?=
 =?utf-8?B?aFVxRmFFN1ExbGVkNEtIbzlCK2Zhd0FXOHNiMFNiNEdRQjJEcWpKaXVteEsx?=
 =?utf-8?B?b1J2WXkzd2U3bmR1eHNKRE16R1F3Y0FGK0xhc000TUVlUXNQdmdUa0RtakRD?=
 =?utf-8?B?MC9sRkdROHVpbjN6cGNZTU02T1hZZzlQVDJIUy9PblJQeXFwWXVqb3Z4QVVK?=
 =?utf-8?B?aWRXS1lWUTErUnpqSEFxemVsMThUalBIVjRTaGlZaXNLU0VCbTNMb3p4OU9U?=
 =?utf-8?B?SS94M2pYSm15MUdwNnhQcDVhRXA2Z01qM05XektaKzdFekEyWFdmU1ZBRmdN?=
 =?utf-8?B?Umo1UUVSSnNVZzBtZCtvRS96dDQwWkllcGFCbmpkOXlQMDdWN1VkajlLQjdG?=
 =?utf-8?B?TVAwQ3U4bGd2L3kwY3laZkpaUnR2SldCcTRIQVkwTlRPSDJaczUwRzlWa0JN?=
 =?utf-8?B?QlpxYURiODdWU1F2Mk1Jc1A2RGYyY1QwWnd6ZlNrUXcyMlAybks3aWxSWFIv?=
 =?utf-8?B?dmI3bVJqeW9wNkNNcS9zeVk4S1FTRWZMS01XNmhvTGhvNyt6TUZVazhVQVlv?=
 =?utf-8?B?NjdHdUxNeStVQjV1aGhsQ3JwKzlSQUlHV0xYZ2QvUzUzRy9VSkI3ZFk5QzBx?=
 =?utf-8?B?N1ZUaU9PajdrcUo2cFB5b3d6VVlLcjJsZlYwR2JDVHdIZGdwK2ZIMGxEYUhM?=
 =?utf-8?B?Z2VTR0JQOXFCT1Q2K0pqWkdIRDZBbHMrVDJwREdsazdYSXJIOXV3NVFyVU8v?=
 =?utf-8?B?SWNUZ3pyMkpucUlYeU4wWHhPKzFEdGI4NEFyS2RyQjU0cGZDazQ0Rk51TDZr?=
 =?utf-8?B?WnBvMmcrUDJFelY3NFhmVVNaN2lqbE4wRmlVMFVnPT0=?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44c52d3-4f34-4d2c-2763-08d8c4a5dad7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 22:33:09.5277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hH91k6HpciRf5K/8sHdQr47vJQGhh88SYseK1z7pqxJEfH2Rl5ERfydOAoZYaqNbZcKBcd2QQ1Me1Dxy39UscQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2353
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
Cc: Alex Deucher <alexander.deucher@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wMS0yOSB1bSA1OjI4IHAubS4gc2NocmllYiBBbGV4IERldWNoZXI6Cj4gZHJtL2Ft
ZGdwdTogTWFrZSBjb250aWd1b3VzIHBpbm5pbmcgb3B0aW9uYWwKClRoaXMgb25lIG5lZWRzIGEg
Zm9sbG93LXVwIGZpeCwgYXMgaXQgYnJlYWtzIHBpbm5pbmcgaW4gR1RULiBYaW5odWkKc2hvdWxk
IGhhdmUgdGhlIGZpeCByZWFkeSB2ZXJ5IHNvb24uIFlvdSBtYXkgd2FudCB0byBob2xkIHRoaXMg
YmFjawp1bnRpbCB0aGUgZml4IGxhbmRzLgoKUmVnYXJkcywKwqAgRmVsaXgKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

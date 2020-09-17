Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7168826D9C7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 13:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811CC6EBED;
	Thu, 17 Sep 2020 11:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6881B6EBED
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 11:03:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6QpuYteJr6xkPoIQHnNewcpxTmw78D00xmfyJDoX7VEb9QXThLI+4XHzRdIzgeebxDLPOsiKAnu3yizfyE7WILJTFBw2loglw7JMIIhthBZYMNS3OmHwswr9McJ/i19G0ZIz89YHc5TctefGdwQZ0rOYG7na01GJq98rjB1oCv/kFcC+0/uVApNWS8rFnssGqK+589sPKpo7e4Gux6NQG6jciYO/QHW1kv6BlbMy7m5WmoGPztHImVy8j5npf2ShNiVh2QTMFB6jr0fCPTDu85hU/+SCSgtMpALM40GT7gS+mxlumvk/PQHcfYVW6VvNL5Jg2U6W3by3UwG4iib0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+ampQKMV6ozjcT4Jb2r/ibVDxyczfZbqTdVrYPr1SY=;
 b=BVyrpHonkRiosijaaHGHDzmN2cqDeVjhz1qu3x8q3sCNFggoyFyY6lLRfKqXfKDbeG2o0hyuIKi+fr9tEbMNcTJng5BKo53j70nHQs2hrhne8j6hfWJsE+jRG/WJ1tQWqfSmwkR1prFw0bPHwMkaSnsFURmoVOrmCyfUwSePH37gClafSFWI+1ynuZvN7AHBK6y1uaGbCEbBEY0Zoj9nZQCrJfeJQ3E8AdtVEtMFKUJwhnTi8IQ5uUihjLrHZh4l1BTxcjFywA68tUsK0Rk9WCSWIj0hFVc5tmYx8Z5KpNGijt5ww5fNG6IL8mv7h91I2I2Atr2rBMpBkcbgYX8pmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+ampQKMV6ozjcT4Jb2r/ibVDxyczfZbqTdVrYPr1SY=;
 b=MRx/jkSV5sa7MOLjD8xEZJg7x57plPkOgQDj+0Nsr+MzIBVHBx66IbWYW0eO8fIuEYxophKwocwLt+u/HdlDxf5feknoV7vdk8IOgnwTD5wblYhWmBHcBKU4i3tTtmSwrkRuBnfdiEfp/wwB60ofSBgtQ/ikRhNMkaXRNUaDfR8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4657.namprd12.prod.outlook.com (2603:10b6:207:1a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 11:03:10 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 11:03:10 +0000
Subject: Re: Why is nouveau using a separate swap storage?
To: Ben Skeggs <skeggsb@gmail.com>
References: <5315ceb2-8be0-5a12-5d9d-9244ebf17e74@gmail.com>
 <CACAvsv7HffJYt-58FrDVWCrfD1WQP0-0q=C3JsJXOOhNSZsJYQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c8cbd4c6-704f-c362-ef15-76d92ddf310c@amd.com>
Date: Thu, 17 Sep 2020 13:03:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CACAvsv7HffJYt-58FrDVWCrfD1WQP0-0q=C3JsJXOOhNSZsJYQ@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0108.eurprd02.prod.outlook.com
 (2603:10a6:208:154::49) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0108.eurprd02.prod.outlook.com (2603:10a6:208:154::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend
 Transport; Thu, 17 Sep 2020 11:03:09 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 53a3b4f0-7d33-4e88-193d-08d85af9438f
X-MS-TrafficTypeDiagnostic: BL0PR12MB4657:
X-Microsoft-Antispam-PRVS: <BL0PR12MB465703C92D4B8524320E80C7833E0@BL0PR12MB4657.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Khkw/R9rBtN/ptvYs78RoI2khu476y6Ly9xvrcsYtkCl6MLNP6VkAY3hZ3voOqR8/HM/8aP5lWz+eogyzvZCVdHsAbSw3p2XdEVdHrWO0LUCrb5IGUAsCV4KzCDXqdlh9E1ZyWfhhkeOkPPv1liBiel4pxNMPsi5oyVduPno1PVU3cYYCAaU3NvM7YrFTMdYK4ljBHMEfy2DBK/y/Vv7F877MZqe9guXs7FrzldSggw6DyQLtkb103Dk5TcaXsMPt1nDqUQp1zTZc+SfDbggfV/ZfkFgVkCjN+XKjRPgvsirjCQWqc/lw6N1ivND0vIvRjFOyo89pnP1T9YNijaxlIY+xy9X7C0bBaXxkmy9/BohQarEEe2j1IpJPh/h9Rfu2nne3TtluZ41v/LNz7fwFNKJl+QhecWJg+QOeAnPGN0q0SiTj04+uwWmXJtHfsibbq2pl8u2Ltusnl/OVU4DwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(31686004)(66556008)(66476007)(66946007)(316002)(5660300002)(6666004)(86362001)(2616005)(8936002)(8676002)(966005)(2906002)(6486002)(45080400002)(478600001)(52116002)(36756003)(186003)(16526019)(54906003)(4326008)(6916009)(31696002)(66574015)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: GgFV7LFrxoxLfdwLSyIIEQpW8hj/2bOGOMsWM6op06Cvc4RSAhJ+FDlkmYrqw9m6MYlc2Z0X7Y7UKYwCqEhDd5KsFKWXXazKhGvfaMjTOVaOb7SzK/YYrAB2w/5kHHFZUdiiOz4r+ynWByEobMWnVSl8ImayjVnzZSsWZSOWr1w0If1JV0xow4nnxHxcYgr0vbD//Lg+0x2kMlcfgURU1eXH39Z//ytrm7g3cxD2/zgpNlkTVzqKCbVH+H9F1Ryoqr8Wm9lvBWWEfw61gAcQug2zg7TojirZE1GUhIWNStmGdjtjQGz+5OFKh/+s71gAH/h+AWcHV5QklbGQbeF4Nu7LmNHvQXx9xOQjY1GuA9xPjRBiljahBWzvjxDm75nbBwnjXSXWL/KxQOfJHr9qDMw2PTEyfi9t777JZnWFkfoAVboJ7wZR4h9JmHsJy0sT991NEJE2ADKXogdi/4f69cK4NBLA3YTi8fNoMvnRKMQdlX9LDpGj7hf2NqTtrIsh09A59DAoJVIY8F3DlM9iouo99aTg0dug5jMb7b+tq6PEdpa9UqoUxUIYeS8af+u2sn+azk2FFxV1U0XCjHqbqEVEn06cswg9UIIjCZy0v+10MGtxWgVD+iz3F9so0BEslzLoPnYUKy1R44tEXhXmeoZE3OYgQ5++jaszZXQ5DePaG+k7T60DLGJgxttsFe+n3tMbd0crXcshUT0PcpAGkQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a3b4f0-7d33-4e88-193d-08d85af9438f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 11:03:10.1902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2aEpefPxsXDLVFfjjMmbplEAIzoEHCoWwU0nG6I/JSmdDnJL3OFCr6x8sXxIxBZi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4657
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
Cc: Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDkuMjAgdW0gMTI6NTEgc2NocmllYiBCZW4gU2tlZ2dzOgo+IE9uIFRodSwgMTcgU2Vw
IDIwMjAgYXQgMjA6MDYsIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtl
bkBnbWFpbC5jb20+IHdyb3RlOgo+PiBIaSBndXlzLAo+Pgo+PiBqdXN0IGFub3RoZXIgVFRNIGZl
YXR1cmUgd2hpY2ggaXMgb25seSB1c2VkIGJ5IG5vdXZlYXUuCj4+Cj4+IFdlIGhhdmUgdGhpcyBi
by0+Ym8ucGVyc2lzdGVudF9zd2FwX3N0b3JhZ2UgcG9pbnRlciB3aGljaCBpcyBvbmx5IHNldCBi
eQo+PiBub3V2ZWF1IHRvIHRoZSBHRU0gZmlscCBhbmQgdXNlZCB3aGVuIGEgQk8gaXMgc3dhcHBl
ZCB0byBhIHNobWVtIGZpbGUuCj4+Cj4+IEFzIGZhciBhcyBJIGNhbiBzZWUgdGhpcyBkb2Vzbid0
IG1ha2UgYW55IHNlbnNlIGF0IGFsbD8gV2hhdCBpcyB0aGUKPj4gYmFja2dyb3VuZCBoZXJlLgo+
IE5vIHNwZWNpZmljIHJlYXNvbiBJIGNhbiByZW1lbWJlciwgbGlrZWx5IGNhcmdvLWN1bHQgZnJv
bSB2ZXJ5IHZlcnkKPiBlYXJseSB2ZXJzaW9ucyBvZiBUVE0vR0VNIHN0dWZmLgoKT2ssIGdvaW5n
IHRvIHNlbmQgc29tZXRoaW5nIG91dCB0byBkcm9wIHRoaXMgdGhlbi4KClRoYW5rcywKQ2hyaXN0
aWFuLgoKPgo+IEJlbi4KPgo+PiBUaGFua3MsCj4+IENocmlzdGlhbi4KPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbmFtMTEu
c2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3Rz
LmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmRyaS1kZXZlbCZhbXA7ZGF0
YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M3MGNlNzU1OWYxM2M0YmYx
ODFmYjA4ZDg1YWY3Yjg1YiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3
QzAlN0M2MzczNTkzNjcyODYwMjA2MzImYW1wO3NkYXRhPW5jSjIlMkZrQ1k3RHVHYjExOU0lMkJS
JTJCTHRTVUExcWpFSzVuaEdWaktqRWQ2alElM0QmYW1wO3Jlc2VydmVkPTAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

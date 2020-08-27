Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470E22544A1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 13:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500526E073;
	Thu, 27 Aug 2020 11:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74ECE6E073
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 11:56:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwL/hdvOaBBUiTUu9HkpGAKt8HR9k6x2lmkl42HnYRNy27juPfh3OB/5XGJfOYMXkPmcPwg+HL8Ivd1IIoEqr4/PoWefHVkcA3bkSRlDzLnHAuWp+s+yNP0vn3Si3JOcMSme2nxNmv2nUlfXmr10jT6XHdoBCyY7D/vBBwvqliNgi+17njmIje4jIaxivTjZujTDSBOuacUkcfYUZDm/2aSlDkRtHaBQaC37ljXeeAhY+zmL9QgBBMpJnt+vlIp6H64qxI8z04IkyRztFEe0js7Ce+sK9XclT0sIo3MZzFSWvymnq1sLNkQlN7gEI2YKVocQzuW6V7fn42f6wSsOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oISCnJz7z717Wz8VXiatF65FYtkRmKlQx0jr+OffwG8=;
 b=dDe+eMp1/JK9iZawRPiYTv+/ZtW+yuElrstzr4UJvufO6yliVeESlXhj2Z9c9bb2dtZSBNdPBlXBefaWDq4+7UH77jBQroB8vq9qMEDmCLYFo1JW0OZ6YcZLVn33/V435xMfU+Hn+RJLWVmRcS5T8FPZhH216pRAD/inh47kUU4Tgk+SLwgxGOhKdgDkGZlPZQohb91jPckr5IpheSUfThCye4OCX9dXigRJtmAGSkGBYFh6CA9Bv/LhDwj8A5S2AH6IyEDp6xewhcYbCWf0KvyRxPQjYpcF424KCp8w5+1xXjkfV25wuhRf6CrM3Kwm56VgH9tcDcqCKOYKIsb1gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oISCnJz7z717Wz8VXiatF65FYtkRmKlQx0jr+OffwG8=;
 b=DRMEkfuE6LfwGO9+N3P0FAqwo1n7Zim/gh8hgfeGbn6Oa45vY8QxroX+N8fvdaF5wfka+OTbf5UcHSe78itavDzHaqNgNEdQQIBjtRUFM6HG1ZXFSP05tZ4L1xV9+nkGjCbVoPlWWBJrgxwhiOjksvLkwNo/vj82u8EQbfKuc+Y=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2419.namprd12.prod.outlook.com (2603:10b6:207:44::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Thu, 27 Aug
 2020 11:56:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.030; Thu, 27 Aug 2020
 11:56:03 +0000
Subject: Re: [00/23] ttm tt refactoring.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200826014428.828392-1-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8e44396f-49ca-6668-3943-aa887478a7cf@amd.com>
Date: Thu, 27 Aug 2020 13:55:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0108.eurprd07.prod.outlook.com
 (2603:10a6:207:7::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0108.eurprd07.prod.outlook.com (2603:10a6:207:7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.5 via Frontend Transport; Thu, 27 Aug 2020 11:56:02 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 506dd8cb-c810-46b5-dd5b-08d84a802c57
X-MS-TrafficTypeDiagnostic: BL0PR12MB2419:
X-Microsoft-Antispam-PRVS: <BL0PR12MB24198C584B982F2AAB4FDD3A83550@BL0PR12MB2419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0QQgxz+T2THUvhy1tRID3FjtV0nXminvaO5zQ/uPXVh33ezgh0EZnsa7VcAjJvwEX+lMoIKfWmUSJv0YiMHiuCAB368jnJvhgoz9FLmpqWajcDNuNYdf2/ji7P7d+C8Arf8g51IS1jJ8USAy9KYHdkpRJ9ROR6MLPLBXY/RZRJZk1icxkHL9p4tdosD+G1JGdyjn3sIJvwe2ogs4jfU8ryMp6GYrSGlulwtPaxbJqpFVL8ZaqhrL75OVCxTYfaqBSHP86UC7FGQlpmimjCsQL2utT975CxHVDHLTUNgKpoSyjXeHF1HRMS3gp00swzBFdYA9E3eW+rBJI9s8xauaC1PqGeFSO7d1VHbKeCsOD0qKPaenviGgmsLcJVL1zLoWY/ZQMqO/hjvOfKT4zQ9YO0mPl551YDoVepIhpJ3JgFYtELWnEwqa0VQ4j6mmXPEtciqoUMOfXZdJL6Y+qdKz4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(8676002)(66574015)(2906002)(83380400001)(52116002)(6486002)(66946007)(4326008)(45080400002)(66556008)(478600001)(66476007)(16526019)(186003)(966005)(6666004)(86362001)(8936002)(5660300002)(316002)(36756003)(31696002)(2616005)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: tuBtu4fVIMBfk39pOrUKLBEah9zObj+tDMb32BVTpzOFoIUEUcvdD+r5hWtJ+aH0g+cwDU46oHxkq61rdLyCFW2XQyH+X7UFslGqbTiAs2a76HYrxPTHr09AGybUSrLuL9gP/JJ6ZX/8nG8zWxITHSC8GHsWGGDDU6JQN0rBfx68nHM2L5gxNf6YGguu48AR0gB8QO5+nzoKU0l7WheNHGz8MmWTPC8N7KutXLcxH3Xjp74QVXChfB6DMS0DyVAXw0jQf8q7RP8i7mq2TW8WsZKvcaATgL0PP8RbNVIGuUlX7nVcBKxK1lDGD7ZtYnpSga9pfz2Jz8eUE1kEa3yMB9VwwnQpYWnstgcXa4aWWrfm4BzXHCEkkEyNB+6ZGjoqcBtHwt2OiErJTG3OnmgLHVT2DAvQuthwmSdADEwQWuKEHWGuo2HEX6rXXyRjsG6HoS/2u5QF+5IngCW+gPySZh7koX0CKi61mrnJI8T6H8CxcB3A5Yb6pEfkIVBuHfw2G+HtLbCFVmlef91pn1DRuy+pVYFSwWw5tDWw6FgJXC7jiR3sXwKZPi8SSDIg3+LkAc96hTY7JO+bOnpEnY6LIOaoW3UUzuCY34G2uh7YN/8v64OB+Vf9MTeU5gvBebdEjQiEjdLF0wCKtWckciAch0gX97vM3BfOXyoSneDIqtyniVBy2RzNss+ql1oHyG7Ad7tw84+u4KM36c0MGPzXPQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506dd8cb-c810-46b5-dd5b-08d84a802c57
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 11:56:03.5019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Dy9GPYWC/Vsd3McVIkFbypasdDvDpc7BtbR0Mzkl3DvXke5qkIbbUBoic5pj1QE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2419
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A repeating style nit pick that {} can be dropped on single line if and =

empty line between declaration and code.

Apart from that looks mostly good to me :)

Patches #1-#4, #6, #10, #12-#15 are Reviewed-by: Christian K=F6nig =

<christian.koenig@amd.com>

Patch #5, #8, #9, #11 are Acked-by: Christian K=F6nig =

<christian.koenig@amd.com>

A few nits on patch #7.

Regarding patch #16 I'm not sure if the sub-classing into ttm_tt and =

ttm_dma_tt is really worth it. I mean we can provide allocation helpers =

for drivers which don't need the DMA address array. But apart from that =

I'm pretty sure keeping the all fields in ttm_tt is the way to go.

Patch #17 has one little style comment.

I really need to take an in deep look at patches #18-#23, but the =

general approach sounds like the right thing to do.

Christian.

Am 26.08.20 um 03:44 schrieb Dave Airlie:
> This is based on top of misc-next with Christians io rework for nouveau.
>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fairlied%2Flinux%2Ftree%2Fttm-tt-cleanup&amp;data=3D02%7C01%7Cchrist=
ian.koenig%40amd.com%7C84fd18e47b124259c45a08d849619a9a%7C3dd8961fe4884e608=
e11a82d994e183d%7C0%7C0%7C637340030838885795&amp;sdata=3DWyDLcpJp07bSNxYPWo=
vsnDkUIRDDmK3OlakW%2Fwy9HX4%3D&amp;reserved=3D0 (is a complete tree)
>
> The idea is to move towards ttm_tt being just a backing store for system
> allocated pages + dma info, and not be anything to do with a global TT.
>
> First is a couple of minor cleanups, then drops bdev from ttm_tt,
> and moves the func table into the bdev driver table instead, makes
> drivers deal with the agp differences, then cleans up the mess.
>
> It tries to cleanup ttm_tt a bit more as well, in the end ttm_tt
> is getting to what I'd like it to represent, the next step is tackling
> the whole bind/unbind/move stuff I think.
>
> Dave.
>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

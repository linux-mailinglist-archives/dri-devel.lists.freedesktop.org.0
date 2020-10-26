Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36739298E59
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 14:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0E78989C;
	Mon, 26 Oct 2020 13:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661B88989C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 13:45:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XasEaeRuE9uB321tTgwOsZpyXEq5J5qFlRR0JMOPSm84e5U86OiwgpRqC8CVV1r4YU4LL5gluoSCpkbAKaErhkp4hk0MpkiEPpW5gAocpvlQosn3Nr6zZDueNP/uLbQTKcFPyfh0iQ/Z+Ik9cT6BjXbUHWxFc0DcTdUehciDa2m6mBhklI3l8lZfIKK1gsBy8VBi5/tZdxw6xWNaO8W73l0VL6qyXL6Fr0ng+gT2NwSTM2kvCfuM5Gdd8K/7BmgR6fO4kzvKb2cs2UXFA+7sK9FfAmyPx2BaV1fbDg37bLoqUsQXv7OvhPsgNiWSf/12td+I6SBaC1vZsh9KwP3rLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBheozrcB4OvrqWRxhyYLtcZ0b66XMziiqtc+sRq81E=;
 b=S3DIdpDtENR/UggTq2i2cPPhEu76Cuf0gFuciUkPQBgQynVjQHaJfRY9f/W1TWMjFzeLRW4NwZNyAyThIkNOLFqf0OjveBv5g25uk87bfEFrAR4yEQ5c6iQUv/h2dVMqsPLeMA03lAJZeAGI5OzXnS8sV7lc8e28B5kSNdeyNQFN1fzhfGAVxVSycj7CWkhsqEMyAHr/GQfUBnICpRZSgPy9tCI2NXYFYtoVVtm9Fgz9m96BtEFnc/IinqmBC2kRqqih9R2x1fMCigJElrS7QApSHpV0sS77M6ArsDKf4rOv/UnFabc8QjeOR09GnaHNYSMitraEK5nWcSIzzzCiMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBheozrcB4OvrqWRxhyYLtcZ0b66XMziiqtc+sRq81E=;
 b=O8DQVZKMDYzWJl+ZsFn0lzvKqS+GYJwnGr0v2odlklf88veytykNMZff8vGyjkZGD6hmvXSbVpsuiXKmPlxd+e+nhk6M3CaG+3I43JSfVLK3y3RYH9afVrGN1mlCuouxufuNi/WObZvu+eemOeDswhCJUGdh3gqHHlRvHZRQDdA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR12MB1312.namprd12.prod.outlook.com (2603:10b6:300:11::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Mon, 26 Oct
 2020 13:45:19 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::b885:8b56:a460:4624]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::b885:8b56:a460:4624%11]) with mapi id 15.20.3499.018; Mon, 26 Oct
 2020 13:45:19 +0000
Date: Mon, 26 Oct 2020 21:45:12 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: drm/ttm: new TT backend allocation pool
Message-ID: <20201026134512.GA410214@hr-amd>
References: <20201025154100.16400-1-christian.koenig@amd.com>
Content-Disposition: inline
In-Reply-To: <20201025154100.16400-1-christian.koenig@amd.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HK0PR01CA0071.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::35) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HK0PR01CA0071.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Mon, 26 Oct 2020 13:45:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 033e5c69-06e9-44b1-fd6b-08d879b560b5
X-MS-TrafficTypeDiagnostic: MWHPR12MB1312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1312C9001B049F319514B52BEC190@MWHPR12MB1312.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e0e5cwm0qh38xCdyk4HuRVFzln833OtVnvzjWiqpDsCjG9aYrbzVbb1G4oSd6sxjcYXRFTl/+j5JTTwjzX39U1uuJgKOadGx7CgCY7bg7MNqXpQ6ETVTuaVFOYhyutMEQCgBkFQl7q9Dm67M3sRfN3dBge4C22ax/fgHU3J1yS8iiFH8WoDkr3p6R32ScmfKpcgz7HaIX+3RMZ7HRccUmzxuQhFlFpGMOcwtmswwW46MwoE/9NIDwNmrGh5brqGR/2Pl8KjfYw4wf3yawzsHQp6ySoGxG44M7y3utqWWphw7WOm7gDR2L5Bf4bmsBUfO6z7SYatOIwhXOMQM84FjaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(478600001)(33716001)(9686003)(86362001)(8676002)(66946007)(66556008)(66476007)(8936002)(2906002)(1076003)(4326008)(6496006)(956004)(52116002)(26005)(33656002)(6916009)(6666004)(186003)(54906003)(5660300002)(66574015)(16526019)(83380400001)(316002)(55016002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: NZsXgINYuKdqtP2KCMOVIcIsTq+Ia5EOqXGDWI3OCFGVcvlplaxgSnl8yyfUALsajp8iYpVwENyP3+pnpVhQL3ZLA5orGAmaedog5W3RE4qSduSd2Bgv0xaYWSx2JAJ/ChldGhMMiZ7f9YAsKD/Xz8nMoQziy26za/15fDWvKvz2C+Y27fC9qcuZ45UqxJ2S4Zx8VnAF6AiPiR24sk3vTpb5b/KeKxbKsREJllq5DusV6L6BysMZu3JJ5x5tsD4gsuJh0anYsekA4dYH63Qs1KkOZ5VYTAjQAq/MBAmDSs52yuF2V1qjbgnP0yv6VgpJKusFuy1gWRcuvyl76sPDqqwB6I3Ex535QhxzV0zARIfpBKDZaoJmAjzEYS26eLCr9wm30h+aqkD7VzwIf0ulwELCOb599yx3VkpmURMviXzL5z0WzL/Muxni+75n7fjyrb5gEsPvwSft8TYAmgUooN+oPfaVLLn8WZ3mJG30aePcUZMlu7shuRhgUNoe0TlMa+cQrdRd9zm2E8YBz+Ra5hAV1Qhh++VPiQIuvbsx2m2siTr4vSr7yH2lai5jdwg8ja/pMYVFFkVBHUWA7EmJ5oc51dRTbYJ1ofcZSgEsf4acFOYaTDFUvasEISwOVB+EyrBR9ToM2FXcqjbL7ub+Kg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033e5c69-06e9-44b1-fd6b-08d879b560b5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2020 13:45:19.3175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39LGBgv4RqVeSEaXTUgvECebGme5v0PoftLksUHWdeLmhHzgIkGJChtML3tv2CTbt+BdRRiPlkb63rBor1rWEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1312
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
Cc: "Chauhan, Madhav" <Madhav.Chauhan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 25, 2020 at 11:40:47PM +0800, Christian K=F6nig wrote:
> This replaces the spaghetti code in the two existing page pools.
>     =

> First of all depending on the allocation size it is between 3 (1GiB) and
> 5 (1MiB) times faster than the old implementation.
>     =

> It makes better use of buddy pages to allow for larger physical contiguous
> allocations which should result in better TLB utilization at least for am=
dgpu.
>     =

> Instead of a completely braindead approach of filling the pool with one C=
PU
> while another one is trying to shrink it we only give back freed pages.
>     =

> This also results in much less locking contention and a trylock free MM
> shrinker callback, so we can guarantee that pages are given back to the s=
ystem
> when needed.
>     =

> Downside of this is that it takes longer for many small allocations until=
 the
> pool is filled up. We could address this, but I couldn't find an use case
> where this actually matters. And we don't bother freeing large chunks of =
pages
> any more.
>     =

> The sysfs files are replaced with a single module parameter, allowing use=
rs to
> override how many pages should be globally pooled in TTM. This unfortunat=
ely
> breaks the UAPI slightly, but as far as we know nobody ever depended on t=
his.
>    =

> Zeroing memory coming from the pool was handled inconsistently. The
> alloc_pages() based pool was zeroing it, the dma_alloc_attr() based one w=
asn't.
> The new implementation isn't zeroing pages from the pool either and only =
sets
> the __GFP_ZERO flag when necessary.
>     =

> The implementation has only 753 lines of code compared to the over 2600 o=
f the
> old one, and also allows for saving quite a bunch of code in the drivers =
since
> we don't need specialized handling there any more based on kernel config.
>   =

> Additional to all of that there was a neat bug with IOMMU, coherent DMA
> mappings and huge pages which is now fixed in the new code as well.

Let me give a test your patch set in my renoir and new vangogh platform
with iommu enabled. (I actually encountered many page faults in legacy
ttm_page_alloc_dma implementation with swiotlb=3D1)

Thanks,
Ray
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

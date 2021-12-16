Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C79E476914
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 05:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448EB112123;
	Thu, 16 Dec 2021 04:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2089.outbound.protection.outlook.com [40.107.102.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F89112123;
 Thu, 16 Dec 2021 04:34:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpbdWs5RIk8xkjSANt8GO4LrIlB0boFls+LYmUiVUAXpXLMRNt5wu8Tsggub8yBiuJNxMC+j+7W7wrhf27EF2nlCvq2P4Wp3odMJARvZAyspVqLikfEpkQKpP0pJcH/pKPzYvq1IZwXTa8M/B3tyznJjY1kLDO2Dx6ObW6fyaUyokOrJ5Bam5rkhsfGryxv2mOjgqoH39FvcAJba3VWNu0kImAFkAeZ18YwzlQYlrvZEa/rq0Ddl9fHvkXJZw3UtP9yWsaJPojhiWbLKAOh433CuTeTZV254xcOAueFj0Zaukp4HIAUW/hbytyFLshOhHFdQ9pBCEdQw/5LWrooPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMxfc/rVVOmDOyb67gFsGflbojYNvpW+XJ/IKqnb+9Q=;
 b=QdLVoSlApchTYni/9sD00OVhzBaNcnD+0DyA788iXN4/FLybEgTG6alqeSWSUV6xSmGlk3Mc1CNhmTfMbUpflKPD3Ds5tTaqj7BjirIbe02IdRAAP71We8SXzUWD1DLVMUAQgoheHYPqNJTndlQ4e0b7QQ10Eus/PmgIkO55fnbW2LpzAqezRKP9JJkNNjeij8cq62++eHmxM7J1kLeBrKe0A9As0CSrrJfOCGil/VV+N8YAN2libfarxCGd52+jUbWtEqH4r03AW0wh6kzO9hFKX47EoMpMky1tf7vQ+9tb5ATf0460bxIBSn89U87f46Km8LiOTdsiq3o40LWghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMxfc/rVVOmDOyb67gFsGflbojYNvpW+XJ/IKqnb+9Q=;
 b=vIyBPXSoHT4rZ/2W/jGdPfKajdml/IU3QpOKMfsri9nS5/GnP6h6PLlyZmbcgMA1XDCmSTAUxtR+qN0iGx4yyB7kVjVQLmIr45z7LlFNqTK+ecUBzRn9r1ZfUedtqmyGiloThxdA8VekfpMgeBG0rUcMw8o6RPHShM81/avbiUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 DM5PR12MB1771.namprd12.prod.outlook.com (2603:10b6:3:110::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Thu, 16 Dec 2021 04:34:34 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::5d07:e475:316c:d187]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::5d07:e475:316c:d187%5]) with mapi id 15.20.4755.027; Thu, 16 Dec 2021
 04:34:33 +0000
Date: Thu, 16 Dec 2021 12:34:12 +0800
From: Huang Rui <ray.huang@amd.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] drm/amdgpu: introduce new amdgpu_fence object to
 indicate the job embedded fence
Message-ID: <YbrBxEejrB812him@amd.com>
References: <20211215063551.2810601-1-ray.huang@amd.com>
 <202112152115.sqAqnvG7-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202112152115.sqAqnvG7-lkp@intel.com>
X-ClientProxiedBy: HK2PR02CA0202.apcprd02.prod.outlook.com
 (2603:1096:201:20::14) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
Received: from amd.com (165.204.134.251) by
 HK2PR02CA0202.apcprd02.prod.outlook.com (2603:1096:201:20::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 04:34:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a39504f-c23a-4a0a-a24d-08d9c04d5bde
X-MS-TrafficTypeDiagnostic: DM5PR12MB1771:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB17719887C471665A0C747DEAEC779@DM5PR12MB1771.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qu56qTKYXb7VRk717nbeLGUS5peSIde2+Nj0BzVT+sk3uizvMYcm6MiRR9/oGiEX4Xj40L5psOVfcWzZ8pnolAEuirl+CO2Sp2xAeEFPxISWVr20JvL/6K8/2UmiKqNe0Y7FRciTh28eQx257VREztIdteugGfMha5A9VHcVwc+EpkqhJW8qSCxStTrV9jxIwfsa/TXKQWNoadgQx7Q4qKqq7Now3syX3j34dPKJChFFdGE1oiJkqT0SCQ5ilsY7jyIoSBcj6XyizplCh2LExYUZXztckrdLrzYbQ+KNZKmQGXqdCOUvnG5UAJFacCpds5Ci5dsSdTs4oh+nXp6TtO3s1WnMT4SSj6AwIgAgmm3NxD6b1JURBNfhJxOOJetCkyHERjnu3fDcuau/KF1dhrLOBhfkYEj7B7shV4343jk55crKX1CQLPiN/WCd5v5LjddhGHYmQTjzLauh43c/72ijCcydJWrlvhfFfac11Tyypl9Eqbv2hbP4BRHnn1Z+H+QLgzrUsWeZbnzYNtE7PkOJ+ssBC7nHvEZf+o208dxmqN4UXZ/E030iWUN8IM/h4HNwVmQK5x3XWp6WsuyFqgS4YnBnibfCdRaKwVCFGMAAijkcj6wz8ZUug57BtoY0P9PdXY2QnTP+GOUhttNTokZbkmoBQGJGk5pPptL/aRp8zoXcYYdPJy17Q4UeNqlOVGJwynpz0cGiwS8/hMQqJYaFwYqpgVNOhRDeJyYlf9FGK9ifWdU0gw4oqW67ViTHN8RIVHu0twrWlnWBx83QSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2504.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(45080400002)(316002)(86362001)(2616005)(5660300002)(6666004)(55016003)(7696005)(2906002)(956004)(6916009)(54906003)(4326008)(8936002)(66946007)(38100700002)(508600001)(66556008)(966005)(83380400001)(26005)(36756003)(8886007)(66476007)(186003)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x9aP1nqP7nhX3sXZ6BU7LT81kWr/8B4bGVkKhEMxrMtkaTMRPlfAow7lT4BX?=
 =?us-ascii?Q?0nXcInupNVzoLJ1ekM4Eip3Tw2kzwVVOY2Qf8dT/f8Zcx/rHyqwI1Ahfpeur?=
 =?us-ascii?Q?d3xO+8UPlOLOpycqZjJgrahkdXZJcIdtkMTxfD1CUzmxW1y8PSdedCu8ntJi?=
 =?us-ascii?Q?TAAhV6oXwagJ7Cv81HLkYxSlO23J3HKSj9Guy2J5VsJ+kMXWY5R7DdBVetoV?=
 =?us-ascii?Q?NOLRVmCEEshTxWDq4/RqBcI11JkG3XFpQmoUEn65HIh4Uy+0+IneyF0JSJqi?=
 =?us-ascii?Q?ODxzi/gxbRvK1Yb3QKGeaKmL1QsIMQ1B5Zkp2b5OCZjbzxXvAwPMFLsIO0jX?=
 =?us-ascii?Q?t5n3aH7frg4579F8hdnyJwBZcNF/z3FBogn0jygH46ko9Qo0elF2Rfe6vaOT?=
 =?us-ascii?Q?VECzzBlyc1NFb5ZEyRjfgrgOAovcBdXEmBccCk8nqRiGtRMoMvBfOuGZuREz?=
 =?us-ascii?Q?H4VUFHspNVXJlqE0KM6z1/2PfCzeni3JqALUXozP0JWE7iMXCPFRiBQ2sUcy?=
 =?us-ascii?Q?OyISLBP+yCQVTczZK2RGeeNkpSvmqT4Epa/owgOSNwxDdSXvnfkgZDOwe0yY?=
 =?us-ascii?Q?/Z/3kFh9p7ulq27Kr1lo8agInG12Zo9WADmBUhMIvko8kyGRYoOL1vp/bxLt?=
 =?us-ascii?Q?vyGNRohXW5EzjjSoI7i/ooqZv5WAX+XGawNhsQX5ITEGGUgYdV2mAV6xu2lK?=
 =?us-ascii?Q?HZyTlwsdcqBEAku815YdojEivsfpcjvKOfsedp8jtvx0hGwW2jYSgCORy6Zv?=
 =?us-ascii?Q?SORWWa6m50xidEYn4DTkZddN4VlBIAuulgLsbM46RRkKiXn8wBretbz7VKiB?=
 =?us-ascii?Q?no8P+0iBGNCVdKJQoZJfdaQ8NWMHZG/ICV2++QJlcaWHIvez/F0GI9B2ULHF?=
 =?us-ascii?Q?lE2QJk6lq+6Mj2p4IVa/ssl+AQVXDsNo3WRRIyHrGj+OAUScxEbBbrrG71HE?=
 =?us-ascii?Q?ImIb4cS0MLzASzb5Eusb9+xsTVkiVXRt0H1mnahwxOzol2leF7BL/Zh9JCwx?=
 =?us-ascii?Q?CXILHDG8/TizQL0qu826bj8mDbAUdfW1ZPRBynO6zgKTg398qa1pLCT8BTkV?=
 =?us-ascii?Q?+6P8zkSjV0HvodyJ8vvd3ChBD/z1NFzbBRpZ6BGeaor+UFQ1GDNoXSOSjF10?=
 =?us-ascii?Q?qopU6hNjcsEJRZasQWsUQNDN/P20IKvCppcQ7dGEB4j7TUgFhJT38voU5ILj?=
 =?us-ascii?Q?oKHztnF2MUFXm93bYg08gpWGZEJ/157GCf5rpqCo4OOKwuRkGe1mzOK201dm?=
 =?us-ascii?Q?yOLyA3FlVdrhzE4U2Yci0xbNtGisW2GHojeaRkrOFjCZ9kvt8nBAY7tzd/SJ?=
 =?us-ascii?Q?UC3In8qOdUhNKcCMJHXG1NyyWiCL4UvR1+UgyBfMU4mb1SwJnAjpEVO5BPUp?=
 =?us-ascii?Q?3MeGkZzpfBuxgo18wyNH6BT4+PmVhDW1wkfABHYRURtUQfLrfahGqYsVXhMA?=
 =?us-ascii?Q?xpxMvjxd8l+G/0NswF5CFdFgY0+Ke1oQLyRicc+YWInDS01bvERA+Lox+DTJ?=
 =?us-ascii?Q?y7bgiObsO9Updh8/NgM7fEHMKkxjXlhYfedyZc9RofZPmisYyxVxvjnwn4hX?=
 =?us-ascii?Q?2N1mqLRBvRQz+3Nf5r91sVos/rHd93LK6ok7CpCwtkVsjlf+H2u++vPlCnbm?=
 =?us-ascii?Q?4drb2IIgYzDoPoAsjvC01WU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a39504f-c23a-4a0a-a24d-08d9c04d5bde
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 04:34:33.8155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnBHM0Ey1cVrzLA1XXRF9+iLPPaCQQj8ICYiSnlplW7sPvqfeSrUL/v1VeB/412fqcz+4wv6WUq6c+K8fWCFwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1771
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 15, 2021 at 09:30:31PM +0800, kernel test robot wrote:
> Hi Huang,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on drm/drm-next]
> [also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip v5.16-rc5 next-20211214]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit-scm.com%2Fdocs%2Fgit-format-patch&amp;data=04%7C01%7Cray.huang%40amd.com%7C57b8f278a2a14c8dab7908d9bfcf2649%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637751718697946000%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=GHmkohA1RYdTxSAsM%2BGd1QhX%2BOREjXw0xuALuROXd7I%3D&amp;reserved=0]
> 
> url:    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FHuang-Rui%2Fdrm-amdgpu-introduce-new-amdgpu_fence-object-to-indicate-the-job-embedded-fence%2F20211215-143731&amp;data=04%7C01%7Cray.huang%40amd.com%7C57b8f278a2a14c8dab7908d9bfcf2649%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637751718697946000%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=LqI6BC9bWIb9iq9BKIpIZ8R%2FYB2m4x3OkytvPxundbw%3D&amp;reserved=0
> base:   git://anongit.freedesktop.org/drm/drm drm-next
> config: x86_64-allyesconfig (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20211215%2F202112152115.sqAqnvG7-lkp%40intel.com%2Fconfig&amp;data=04%7C01%7Cray.huang%40amd.com%7C57b8f278a2a14c8dab7908d9bfcf2649%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637751718697946000%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=5fJoEJtN2294YWevl8ys2VTHWh1AgaYtDOKuvg3Qi6w%3D&amp;reserved=0)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build):
>         # https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommit%2Fa47becf231b123760625c45242e89f5e5b5b4915&amp;data=04%7C01%7Cray.huang%40amd.com%7C57b8f278a2a14c8dab7908d9bfcf2649%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637751718697946000%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=qbMYgGRhW%2BTUqKoJAodp5V2VNybzmekZLCinmUtQhho%3D&amp;reserved=0
>         git remote add linux-review https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux&amp;data=04%7C01%7Cray.huang%40amd.com%7C57b8f278a2a14c8dab7908d9bfcf2649%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637751718697946000%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=eX6JF%2FjinJTZj9CzP4tvTA3Chd8NODf85oNlSdCpq14%3D&amp;reserved=0
>         git fetch --no-tags linux-review Huang-Rui/drm-amdgpu-introduce-new-amdgpu_fence-object-to-indicate-the-job-embedded-fence/20211215-143731
>         git checkout a47becf231b123760625c45242e89f5e5b5b4915
>         # save the config file to linux build tree
>         mkdir build_dir
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:631: warning: expecting prototype for amdgpu_fence_clear_job_fences(). Prototype was for amdgpu_fence_driver_clear_job_fences() instead
> 

Nice catch! Thank you. It's my typo and will fix this.

Thanks,
Ray

> 
> vim +631 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> 
>    623	
>    624	/**
>    625	 * amdgpu_fence_clear_job_fences - clear job embedded fences of ring
>    626	 *
>    627	 * @ring: fence of the ring to be cleared
>    628	 *
>    629	 */
>    630	void amdgpu_fence_driver_clear_job_fences(struct amdgpu_ring *ring)
>  > 631	{
>    632		int i;
>    633		struct dma_fence *old, **ptr;
>    634	
>    635		for (i = 0; i <= ring->fence_drv.num_fences_mask; i++) {
>    636			ptr = &ring->fence_drv.fences[i];
>    637			old = rcu_dereference_protected(*ptr, 1);
>    638			if (old && old->ops == &amdgpu_job_fence_ops)
>    639				RCU_INIT_POINTER(*ptr, NULL);
>    640		}
>    641	}
>    642	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=04%7C01%7Cray.huang%40amd.com%7C57b8f278a2a14c8dab7908d9bfcf2649%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637751718697946000%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=KIv5jCARD1lYITkfLGINkMIF93OGw2MAf6yAAs64KXU%3D&amp;reserved=0

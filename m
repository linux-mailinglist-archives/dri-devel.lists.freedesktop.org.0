Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EEF3593F6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 06:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5C46E454;
	Fri,  9 Apr 2021 04:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE206E44B;
 Fri,  9 Apr 2021 04:33:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idiLzuyvYMD4DbLDMKrgUpNhYcry9nWzz2wEQmxLBNW4DHbV94CraSb9V6b1AEHMYRPYnSln2QNDKEVZQDfmWfKiLRMi9jsz+mXRaizhbVGmtZmswlBsmOc4e4Rynl7clkPSbXetukr3nses/MtZxxBG28PM40UzC9H6mvRd7ZEHYjKWEDfvDLRVyLfM6b3vqa2epZqemLlQS00u3/KeQRIJ6avfZ39lOHKho4beyztrb6dvaDq0Cu0tIJhdQAh5CuRsruYsWDoMmqd5IMCFTsKkHQePSgKmIocp6HCzL1T2AtbS0RBw4gQ+X8ZikKNxiSS1n3ClPruJs101BLGj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1rgfQoIFofAdZT/oeGetKSVlt/NZh9LGH/qaoDBp3o=;
 b=PpcBKFiThNYud+zflcxxAcPopAuIIysV3bV4zEO0QJeRa1+yDiKllBQu4mxb0QCEac1fIuyrCJREWx9hSvKmCZPwrwfu4Cxfhv3qZIWhAngTYLQNNwfJ9rkCxoPuf9Elr3Oh+C0Q3e4mpylweuIKVZIUfJhibNXtdDG+Yt4/UFZ5Ncxjx4vFFjwpQ6zg0r+aPQF7q9zDC3S8826EI9Q5vujUDyZAzbu7VA+SN7yMclIakLB4YdYDqis1IRXPvWdUq7zgFqdEVue3PItNXgo0lBgM8t84noZl/4nBFyQgREkeRwOT5Ri5ZSticOuWUbXg/dDqR+rRtbMPfXj4HiL2bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1rgfQoIFofAdZT/oeGetKSVlt/NZh9LGH/qaoDBp3o=;
 b=0F3dZYUs3mYIYKUzPqdDVrpfSpBWQ+Ixi6cjOfpjrsai87MJSUBJs//MfLtO4dvDAa212QzB2g0xf1vd3zNw+/0Kll9b2pKFXkrbnuueY/z/gVwprZiGoILsN5LuQx1/1btr+rNRe0pKnqnhyxSbcpGIoSOcCkgHUn18ITPqVHo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3950.namprd12.prod.outlook.com (2603:10b6:208:16d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.20; Fri, 9 Apr
 2021 04:33:53 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Fri, 9 Apr 2021
 04:33:53 +0000
Subject: Re: Linux Kernel build bug with AMD_IOMMU_V2=M and HSA_AMD=Y
To: David Niklas <Hgntkwis@vfemail.net>, linux-kernel@vger.kernel.org
References: <20210408190456.3bf2cc2e@Zen-II-x12.niklas.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <9da019d0-60e8-4336-b06e-ce7b96514316@amd.com>
Date: Fri, 9 Apr 2021 00:33:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210408190456.3bf2cc2e@Zen-II-x12.niklas.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0144.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::23) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.80] (165.204.55.251) by
 YT1PR01CA0144.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Fri, 9 Apr 2021 04:33:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfe65026-4b82-4ca6-4ce5-08d8fb10add2
X-MS-TrafficTypeDiagnostic: MN2PR12MB3950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39500A3EDBA35DDBEF5978F092739@MN2PR12MB3950.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kxr2Lk1agH/hMUi83ELnSIy0oJGFrYpZylQ+qR28DhwdtKQbyUDXEe66TWeuHa8vQk7mXRdYSHtkQl1VTswWm5ALf7vpoPF8QedF118pxArTU0a+ZbF4OPP3iC/sDYyluzOA5jFdZSYd9gS5nC6Dsxw38r+RzA7chu9TA0qifJdDejK4nL1gLIz73R+eQGB7aU9nRfmJBbveLXxrJr7zkpMk5vkrYtbFz0RTZfLpseP7xKLstfrUVABAtEYSsQdWxzNBFfosuQ7tYr5AXPu+L4gXHEsvtRHBzR0bqUMgGLq4ygdBMe43pTivUibCEJxtV4pwxfvtfXqgAQ8YSj894b8iUxGPqNpuGsXspSKZGHRnSbtZ/+fbsHB9YVXveu3AENhQ2GR4SjKNqpS7Vn8otYS2XBKOgF4HXiKVk3Rcd9UI3exUC3oyEAGh6f1+fDqSfWeDp2y+8shZ4hqnj51ZE8Bk7MK3kSN1HKkRxX/c5K0hnE3BfbVVDKATsbC/RiXOohr/aW+ygTu6Snoae+as8noDXFeHuMA8y9IyDDyDuKzoXOyH7vqHdk7bl+yrmjh5YDlmo+3Twx74t7lRvDdoT07dtWNaFQy+6vepxNIWBiUNX5VA2GsKAqrxyoVgprp5JReWGomcnE+yVSbFmghUZwlQwiJPbYn0Q2YkyApAwlX378mmyiCcAlUgJf+ghBnz+l2iLVjk5NEZlA/Qf7G7djXi7oqmXgeGtk/ZU6d5ODMIPIYFhG2yhqfglFNA3OskH30qjoHY95EOmLOoiD5SPSNYok4CeLhOtLJOk4OgUMfbVgVpx2eP9fBjeAXQV1bX78hCPgIVWgTyRgKq/UKUAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(36756003)(956004)(8676002)(86362001)(31686004)(66476007)(478600001)(316002)(4326008)(8936002)(966005)(66556008)(38100700001)(53546011)(44832011)(31696002)(2616005)(16526019)(83380400001)(26005)(66946007)(5660300002)(186003)(16576012)(2906002)(6486002)(38350700001)(66574015)(52116002)(36916002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?yB+iQk8aQ7r4ooEVaLz/SMcGp7/Zbvp//AneA8bIRqSyeU6aCWOaJf2U?=
 =?Windows-1252?Q?+AEhlFK/qewYN8B5crPDRe2CtXqso/qaW0L69OXx+iMDF6v3ZPpH475K?=
 =?Windows-1252?Q?4OAyRmXYNAp3Ynic5z3jSZxeGNsDsByq1Mh9USiGzSHTCF2o72jAjaVL?=
 =?Windows-1252?Q?uZGndOAKZsJ5M/MTMGJkoNTTh12VMl0DOEd0Wl3JLkQc119E/xGRp/j4?=
 =?Windows-1252?Q?VFctXlFbabfqPj0sir1vDGUeXa+04qfev9wibn1aQyapjdwFVnk3pmrS?=
 =?Windows-1252?Q?AbVHmP1m7P9oPdZ9+VMI0lQNCViCK+OOoLqR9B79hXZSOI5KrAN0ul8R?=
 =?Windows-1252?Q?qSVqnZznLDmzjZzloRZy7D2Enzqis0rySX8RxmZ2GP60p5KQEn0UcToB?=
 =?Windows-1252?Q?LLzIwTFXNCagi+N0XaZRC8KVfOHzVv+v6eQe+dMICc/xm+arM1gzMGWY?=
 =?Windows-1252?Q?tsDqdXbg0mQdT/yvDw/FPvFGJarA02YImLfdLN6zQFylZ6NztyYSF0B9?=
 =?Windows-1252?Q?tu4/mrenJMRohSrAdnpSF0ns7JUrL7n6DWgBiVpBsVPlna1id/fG/h2T?=
 =?Windows-1252?Q?Rxcs3yNQw55uZzO6Ri6ksnPSwNI07RBXxd6IMBTG2b/Qz8HraREkivpq?=
 =?Windows-1252?Q?f4oJVtoGWjZE4IPbYu4uVwiE326WZ1ZgaRUM/JwBGOMMwX54UUTZs1FE?=
 =?Windows-1252?Q?ISImZZj/qqek4Phdmzpa2bRM+TX0uT5dpxK4vPRoqyUC/0uEQjflhaii?=
 =?Windows-1252?Q?kht5lD25QvC29QWdy7LfHfN6zCMYplpLDsYlS5cFw+xk9fcCQHOzyShm?=
 =?Windows-1252?Q?uzENxflJT4l5SeeElFERfJ+OrUXUBPAdxeIn1IKLN4xgp7vwXhVHziAW?=
 =?Windows-1252?Q?oMadT7a1i4pAOaOWM+5JaAM/cu8XdqAArgiFpzKRABbYuxZH+L7av5bP?=
 =?Windows-1252?Q?9v53+HVgZ2uuGlSHZo3Rkmlo8uib2Wr2eraCDF8jly1RXvbC20ehmdhw?=
 =?Windows-1252?Q?jQmPpOPML9CB5w7B0U5Epo8uMCm+39FhTFASTyvLAu8o+EITN3yE5ywS?=
 =?Windows-1252?Q?rcsotlpyEIXaFuzBvrZ/GutTsXBf300N3LjEAwmwsHfe6Y6e5Y1mVFDy?=
 =?Windows-1252?Q?QrrRldQYtBJq1CNmmMo2Mpfw0yJbv7VXPocZHjUCHBHPJVOmbXIq/fXY?=
 =?Windows-1252?Q?kQQUs3jG7B4+uSVAyJn1Me9m35EKGCYh/Xeaho6F+WpCV3Yaj8ZLkjqr?=
 =?Windows-1252?Q?RUTseC5Ld5qXrUC4B7CfPvvaiFJLjeTcYNFUws9pkhdF7Sz/3St+D5u7?=
 =?Windows-1252?Q?0NWMQXMA9SX//9pS5vc+gUbdDFUz0YRkxQVphYrXKaPitCx22YWO/5Fs?=
 =?Windows-1252?Q?Ak1fkTGOkMMklXOsZ2bFYL/z2KlR7/FYca26F/6q8VWtUiwMMvrb03Np?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe65026-4b82-4ca6-4ce5-08d8fb10add2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 04:33:52.8926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TlqB8s5MOB+HL8TNF7iDdjuKPz67cM+MRaB0TvifBKBDt07rhGR1iiDghgnuypNgzHARK3hyRedLnG4eBFPog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3950
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
Cc: fenghua.yu@intel.com, jroedel@suse.de, amd-gfx@lists.freedesktop.org,
 ray.huang@amd.com, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 evan.quan@amd.com, christian.koenig@amd.com, baolu.lu@linux.intel.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This should have been fixed by this commit in amd-staging-drm-next: =

https://lore.kernel.org/patchwork/patch/1392368/

commit b8aff1f3a0b3d8434f8ccf5d3017137c29aca77b
Author: Felix Kuehling <Felix.Kuehling@amd.com>
Date:   Mon Mar 8 22:15:42 2021 -0500

     drm/amdkfd: fix build error with AMD_IOMMU_V2=3Dm
     =

     Using 'imply AMD_IOMMU_V2' does not guarantee that the driver can link
     against the exported functions. If the GPU driver is built-in but the
     IOMMU driver is a loadable module, the kfd_iommu.c file is indeed
     built but does not work:
     =

     x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `=
kfd_iommu_bind_process_to_device':
     kfd_iommu.c:(.text+0x516): undefined reference to `amd_iommu_bind_pasi=
d'
     x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `=
kfd_iommu_unbind_process':
     kfd_iommu.c:(.text+0x691): undefined reference to `amd_iommu_unbind_pa=
sid'
     x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `=
kfd_iommu_suspend':
     kfd_iommu.c:(.text+0x966): undefined reference to `amd_iommu_set_inval=
idate_ctx_cb'
     x86_64-linux-ld: kfd_iommu.c:(.text+0x97f): undefined reference to `am=
d_iommu_set_invalid_ppr_cb'
     x86_64-linux-ld: kfd_iommu.c:(.text+0x9a4): undefined reference to `am=
d_iommu_free_device'
     x86_64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: in function `=
kfd_iommu_resume':
     kfd_iommu.c:(.text+0xa9a): undefined reference to `amd_iommu_init_devi=
ce'
     x86_64-linux-ld: kfd_iommu.c:(.text+0xadc): undefined reference to `am=
d_iommu_set_invalidate_ctx_cb'
     x86_64-linux-ld: kfd_iommu.c:(.text+0xaff): undefined reference to `am=
d_iommu_set_invalid_ppr_cb'
     x86_64-linux-ld: kfd_iommu.c:(.text+0xc72): undefined reference to `am=
d_iommu_bind_pasid'
     x86_64-linux-ld: kfd_iommu.c:(.text+0xe08): undefined reference to `am=
d_iommu_set_invalidate_ctx_cb'
     x86_64-linux-ld: kfd_iommu.c:(.text+0xe26): undefined reference to `am=
d_iommu_set_invalid_ppr_cb'
     x86_64-linux-ld: kfd_iommu.c:(.text+0xe42): undefined reference to `am=
d_iommu_free_device'
     =

     Use IS_REACHABLE to only build IOMMU-V2 support if the amd_iommu symbo=
ls
     are reachable by the amdkfd driver. Output a warning if they are not,
     because that may not be what the user was expecting.
     =

     Fixes: 64d1c3a43a6f ("drm/amdkfd: Centralize IOMMUv2 code and make it =
conditional")
     Reported-by: Arnd Bergmann <arnd@arndb.de>
     Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
     Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

Regards,
 =A0 Felix

On 2021-04-08 7:04 p.m., David Niklas wrote:
> Hello,
> (There are so many maintainers for kfd_iommu.c I feel like I'm spamming.)
>
> When compiling for Linux version 5.11.12 using the AMDGPU GPU driver
> with HSA_AMD enabled, I get the below set of errors. To work around this,
> I need to change AMD_IOMMU_V2 from M to Y. This bug doesn't affect linux
> kernel version 5.6 as it requires AMD_IOMMU_V2 to by Y when HSA_AMD is
> enabled.
> I'd bisect and request the removal of the relevant patch, but it's
> possible that building the linux kernel should work this way and so a fix,
> not a patch removal, is what should be issued.
> I'm attaching my kernel config for 5.11.
>
> Thanks,
> David
>
> PS: I made an official bug report in case you'd prefer that:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D212619
>
> drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: In function
> `kfd_iommu_bind_process_to_device': /root/working/linux-5.11.12/drivers/g=
pu/drm/amd/amdgpu/../amdkfd/kfd_iommu.c:120:
> undefined reference to `amd_iommu_bind_pasid'
> drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: In function
> `kfd_iommu_unbind_process': /root/working/linux-5.11.12/drivers/gpu/drm/a=
md/amdgpu/../amdkfd/kfd_iommu.c:138:
> undefined reference to `amd_iommu_unbind_pasid'
> drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: In function
> `kfd_iommu_suspend': /root/working/linux-5.11.12/drivers/gpu/drm/amd/amdg=
pu/../amdkfd/kfd_iommu.c:292:
> undefined reference to
> `amd_iommu_set_invalidate_ctx_cb' /root/working/linux-5.11.12/drivers/gpu=
/drm/amd/amdgpu/../amdkfd/kfd_iommu.c:293:
> undefined reference to `amd_iommu_set_invalid_ppr_cb'
> drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: In function
> `kfd_iommu_resume': /root/working/linux-5.11.12/drivers/gpu/drm/amd/amdgp=
u/../amdkfd/kfd_iommu.c:312:
> undefined reference to
> `amd_iommu_init_device' /root/working/linux-5.11.12/drivers/gpu/drm/amd/a=
mdgpu/../amdkfd/kfd_iommu.c:316:
> undefined reference to
> `amd_iommu_set_invalidate_ctx_cb' /root/working/linux-5.11.12/drivers/gpu=
/drm/amd/amdgpu/../amdkfd/kfd_iommu.c:318:
> undefined reference to
> `amd_iommu_set_invalid_ppr_cb' /root/working/linux-5.11.12/drivers/gpu/dr=
m/amd/amdgpu/../amdkfd/kfd_iommu.c:323:
> undefined reference to
> `amd_iommu_set_invalidate_ctx_cb' /root/working/linux-5.11.12/drivers/gpu=
/drm/amd/amdgpu/../amdkfd/kfd_iommu.c:324:
> undefined reference to
> `amd_iommu_set_invalid_ppr_cb' /root/working/linux-5.11.12/drivers/gpu/dr=
m/amd/amdgpu/../amdkfd/kfd_iommu.c:325:
> undefined reference to
> `amd_iommu_free_device' /root/working/linux-5.11.12/drivers/gpu/drm/amd/a=
mdgpu/../amdkfd/kfd_iommu.c:232:
> undefined reference to `amd_iommu_bind_pasid'
> drivers/gpu/drm/amd/amdkfd/kfd_iommu.o: In function
> `kfd_iommu_suspend': /root/working/linux-5.11.12/drivers/gpu/drm/amd/amdg=
pu/../amdkfd/kfd_iommu.c:294:
> undefined reference to `amd_iommu_free_device' Makefile:1166: recipe for
> target 'vmlinux' failed make: *** [vmlinux] Error 1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86614AEA08
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 07:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17DF10E2E0;
	Wed,  9 Feb 2022 06:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EBE10E2CD;
 Wed,  9 Feb 2022 06:06:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+0om0Tw1Cm6dWoBdWX9WvvFFGC854v8sUtcbDo8J8EFr2f5IB5F1o/AVy9gbf5Xd0YzU4I5pxkfOGJJiRFuWM6IevucJwxf5gMgYkbqWWTvz4T5a2ctFhQ3aE2tgliFgxkH/MhZuSXfPaIPtvqUgkC7tHcyRtzxZUSKcxYkgjvmhNu6M89J+GC/bcE6l1AVcXd7Gky5zrpYJ/6rlMjCzjpLc5uPTZ/fzdWThLde6y9sXgpIgheOkYWF5AMgGrWnkOxRpnqhfJKqPMni0vTMofkCJWwJQ2dAvdEh97MSdRF3yKItiHF2xYng2mtpXXdssg+1fDqkH4vs9w4N75/vqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH8xX2T4rsvspVsRpX91or5mxVBxmDn27+XlHv9EG4k=;
 b=J3zTlj74Zk0jsC57wAKR0wj1pyASp0bv/3M2oxgRhv678UiXLZzCuRU+4TuFPB9a4uPAjEpc6eUFUry9tqzyneXW2T8PqwOPX/L2DRsXcPwN4Cny8PM6+fCvxtFNZtER0fzbVmd/6aR7UCktI9OMs5GGsFyrx8aHmQ/2K5C6yLmB5KdfOAbTiL4XBkTOgGaA8IhuMSJTX0gLZ4eJgZp1pNPng+S42coaHyy7L5lsnr5bC7D6flKiDumf9CuIzTR2AZrMsmbQIFQRgcdG/OAhhmM0983v5Lq9RyMaENRTT0dDZRZC0z2VHCFszXKx3QPCnUs39otDjZFobBWNQscWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH8xX2T4rsvspVsRpX91or5mxVBxmDn27+XlHv9EG4k=;
 b=S+vAHxX5pfIy7yDpm+d21wy+ztIMNJZHnqwE6e+Rui1TjlQaNDFyrdIb34ocO/WsCzoudAe5kWkXbu7pAYg5sgtCqLDb4iaxVt+GlGHkuF60mukPoVhtcfQyPos53x5U2Y1Z0fYuRMAMJfW5Ve1Z9/UVT1mVjoZ6YD+jyYu3fTo=
Received: from BN0PR04CA0120.namprd04.prod.outlook.com (2603:10b6:408:ec::35)
 by MN2PR12MB3984.namprd12.prod.outlook.com (2603:10b6:208:16f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 06:06:23 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::84) by BN0PR04CA0120.outlook.office365.com
 (2603:10b6:408:ec::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 9 Feb 2022 06:06:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 06:06:22 +0000
Received: from [10.65.96.204] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 00:06:19 -0600
Subject: Re: [RFC v3 00/12] Define and use reset domain for GPU recovery in
 amdgpu
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
 <22cc504b-8f40-2c11-c783-ed4548e092b2@amd.com>
 <630601d7-b409-ec99-732f-dd961f737b0b@amd.com>
From: JingWen Chen <jingwech@amd.com>
Message-ID: <6be81743-3e4b-c5cd-fd5c-2e1e98960948@amd.com>
Date: Wed, 9 Feb 2022 14:06:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <630601d7-b409-ec99-732f-dd961f737b0b@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb9f631a-282c-4c26-8962-08d9eb924c75
X-MS-TrafficTypeDiagnostic: MN2PR12MB3984:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB39841BD36A476390E8997C5FB72E9@MN2PR12MB3984.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SWRmI2DeXfS+KRJenCVlGWS624fTWjrkC8ayMy9SC2W9u6ZFeH2s+Qm26mW2Nm0w21wjctus7ls0GjZlnX9HAjJNE7ATzwCXGmUVM9fgEvkgM+IsbOwEGfRgenbWR0hK0TZRN5C5mQrokjLspUrz1is2mWcp6g5jgEr8C75Y2Z+X1CT8+QbZ7zsOJksn6/Cet50RTkwnZvFqWqdg6n6MHrCVsRJ6ZCHW++zd9fhxonB+IQ+vC7OiqWYZf1cVTTVaRyp+XW24ZitRMLoQ1kevyORjf3438AFMqe587Rbi9QxGt9DUlGBT9no9PUIbmnbqOzxWWZM4GQLLFuacBeAd3HKMOW2GBagBnSZIi9B0wS0/PXW4H8cO5yjmTipurc6dwrLombwDH2pMlucJobiHBMVSyEiKaW2tSqFZr82A0WHsngc6tmez9/hTR4850bvhMLNRZZSJ02Hic4rka2e8Li6mR31GCaTUbeUQowFAANqnZPolzVC5vWlW5tUJ5MbQHwFbyC1Q2/kho3nY5Vrsa1yVwxIQbyC1BTgOpwzZ7K92/3MF2qT7mvTwypU7dciuToTIrHwKP4DaBHNqGkOfEQkpLxt77vLBgh9GxTbSxP9sgTdbZbtKdGKpFt1jd+BlXGt0hQZOi1djMsuuFqv/qhLw8fhOr7vujWgMgLRez85Kja0RI5dH/rIeh5CGO/LpF3YNlKxsR8mh86aevCFqJUTNYM1fmNB7hLr2d2ds/u9OS1fo4h8YV6mgIpI+vzGKWCO3pXeZp7ggF9KL8sW4i9d2j//pJPc9V2FOFvKlknN1JS02J18fnJo8A76UGR76cyDQQK5pN9YrIapeopo75vfqdLy5YlxVTEGuAcwOHYnp1BeEk9DZizi1xGqZYg5Y
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(83380400001)(966005)(31696002)(81166007)(356005)(82310400004)(47076005)(16526019)(426003)(40460700003)(336012)(186003)(26005)(2616005)(36860700001)(2906002)(36756003)(70206006)(53546011)(16576012)(31686004)(4326008)(508600001)(5660300002)(316002)(70586007)(110136005)(54906003)(8676002)(8936002)(36900700001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 06:06:22.9534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9f631a-282c-4c26-8962-08d9eb924c75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3984
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, lijo.lazar@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrey,

I have been testing your patch and it seems fine till now.

Best Regards,

Jingwen Chen

On 2022/2/3 上午2:57, Andrey Grodzovsky wrote:
> Just another ping, with Shyun's help I was able to do some smoke testing on XGMI SRIOV system (booting and triggering hive reset)
> and for now looks good.
>
> Andrey
>
> On 2022-01-28 14:36, Andrey Grodzovsky wrote:
>> Just a gentle ping if people have more comments on this patch set ? Especially last 5 patches
>> as first 7 are exact same as V2 and we already went over them mostly.
>>
>> Andrey
>>
>> On 2022-01-25 17:37, Andrey Grodzovsky wrote:
>>> This patchset is based on earlier work by Boris[1] that allowed to have an
>>> ordered workqueue at the driver level that will be used by the different
>>> schedulers to queue their timeout work. On top of that I also serialized
>>> any GPU reset we trigger from within amdgpu code to also go through the same
>>> ordered wq and in this way simplify somewhat our GPU reset code so we don't need
>>> to protect from concurrency by multiple GPU reset triggeres such as TDR on one
>>> hand and sysfs trigger or RAS trigger on the other hand.
>>>
>>> As advised by Christian and Daniel I defined a reset_domain struct such that
>>> all the entities that go through reset together will be serialized one against
>>> another.
>>>
>>> TDR triggered by multiple entities within the same domain due to the same reason will not
>>> be triggered as the first such reset will cancel all the pending resets. This is
>>> relevant only to TDR timers and not to triggered resets coming from RAS or SYSFS,
>>> those will still happen after the in flight resets finishes.
>>>
>>> v2:
>>> Add handling on SRIOV configuration, the reset notify coming from host
>>> and driver already trigger a work queue to handle the reset so drop this
>>> intermediate wq and send directly to timeout wq. (Shaoyun)
>>>
>>> v3:
>>> Lijo suggested puting 'adev->in_gpu_reset' in amdgpu_reset_domain struct.
>>> I followed his advise and also moved adev->reset_sem into same place. This
>>> in turn caused to do some follow-up refactor of the original patches
>>> where i decoupled amdgpu_reset_domain life cycle frolm XGMI hive because hive is destroyed and
>>> reconstructed for the case of reset the devices in the XGMI hive during probe for SRIOV See [2]
>>> while we need the reset sem and gpu_reset flag to always be present. This was attained
>>> by adding refcount to amdgpu_reset_domain so each device can safely point to it as long as
>>> it needs.
>>>
>>>
>>> [1] https://patchwork.kernel.org/project/dri-devel/patch/20210629073510.2764391-3-boris.brezillon@collabora.com/
>>> [2] https://www.spinics.net/lists/amd-gfx/msg58836.html
>>>
>>> P.S Going through drm-misc-next and not amd-staging-drm-next as Boris work hasn't landed yet there.
>>>
>>> P.P.S Patches 8-12 are the refactor on top of the original V2 patchset.
>>>
>>> P.P.P.S I wasn't able yet to test the reworked code on XGMI SRIOV system because drm-misc-next fails to load there.
>>> Would appriciate if maybe jingwech can try it on his system like he tested V2.
>>>
>>> Andrey Grodzovsky (12):
>>>    drm/amdgpu: Introduce reset domain
>>>    drm/amdgpu: Move scheduler init to after XGMI is ready
>>>    drm/amdgpu: Fix crash on modprobe
>>>    drm/amdgpu: Serialize non TDR gpu recovery with TDRs
>>>    drm/amd/virt: For SRIOV send GPU reset directly to TDR queue.
>>>    drm/amdgpu: Drop hive->in_reset
>>>    drm/amdgpu: Drop concurrent GPU reset protection for device
>>>    drm/amdgpu: Rework reset domain to be refcounted.
>>>    drm/amdgpu: Move reset sem into reset_domain
>>>    drm/amdgpu: Move in_gpu_reset into reset_domain
>>>    drm/amdgpu: Rework amdgpu_device_lock_adev
>>>    Revert 'drm/amdgpu: annotate a false positive recursive locking'
>>>
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  15 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  10 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 275 ++++++++++--------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  43 +--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
>>>   .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    |  18 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |  39 +++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h     |  12 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   2 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      |  24 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h      |   3 +-
>>>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |   6 +-
>>>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |  14 +-
>>>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c         |  19 +-
>>>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c         |  19 +-
>>>   drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c         |  11 +-
>>>   16 files changed, 313 insertions(+), 199 deletions(-)
>>>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86324019E7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 12:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCF389A56;
	Mon,  6 Sep 2021 10:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA3E899A7;
 Mon,  6 Sep 2021 10:35:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqSNnnUSaqywkocIkMi6vjCvhXbeiKzPd4JbSpje7Q+bYLd16LeFNpTLA7HTi8Ds9kfotHxpg8uKCk7Z9rAu5vtvwv3gez0PE0QmCxMEQHmbpxcH5S7mMXbG7k6VIbHbqZKzFSt/qmb9iHwmkjQy3uQqTYnnr0tQlzZHJhjBuEIMj52lRgzbdrbJJSwlpz9WgK7loiL2G9LvuRjcmHv3zpZAc4ZXQ3LY/rP/xIb/UKL1cmMk8a2LLZtxgIXStOanj0MnJ4+2CVk0O1Bk5wC4k60FPD1CK1pxoduG2ys8ftVowtUH772oXfeVTwBoaJJXH3xU8FdYTAm0J8eXC60EuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=vdhXvU9hA7MKZMAlt0If381BWwgAj5pDOOKefln5LPE=;
 b=BWW+WmIgyd9Bad14YjfE18LiZh55FsHPV57b6yJE39VCGVUrZBVEmA3FWOvNvHZcOu79lpsfYHK4uF+BQHZvPco5+lGRhSekszpaKtgWxynJtdyloQgpcg9zG0IKUXtnigo4uf2I2ePxdOcc7id/PEpg/uPpqj2M9QAjwt9lRahXYJP6gIZgp1lbbDiFuH731dQ5iG+krTw3RJ89CKZIWJnLiy1o6cRBtU4yLeyIkuESFfZczJAdtmjhRCBhcJVG8Zlr5J5vh3m3AMjvLQzhX6Kfo4i+U41jthaCaaHVrBWJqfcFIbMVWNb5b265CYV+Blix3Ev/tPbMaF7NiTkndQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdhXvU9hA7MKZMAlt0If381BWwgAj5pDOOKefln5LPE=;
 b=S/T+0JR79sbe+9pZylGiEC0s/pmkwfzSeWHilIdB+9zyIWdQ8jJiT7hfDuOXTapjw8wF3XvA6YdCDA5cDadCAaUlOoDNzAOy0gW4oGz5NuqrVDzV/nVVwU/mf/LoPFHaAHBDbUD8ZuLato/SWI7pkhRCmketcGo9BGfkuCQsJVc=
Received: from MWHPR03CA0007.namprd03.prod.outlook.com (2603:10b6:300:117::17)
 by BN7PR12MB2836.namprd12.prod.outlook.com (2603:10b6:408:32::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Mon, 6 Sep
 2021 10:35:24 +0000
Received: from CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:117:cafe::5f) by MWHPR03CA0007.outlook.office365.com
 (2603:10b6:300:117::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Mon, 6 Sep 2021 10:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT068.mail.protection.outlook.com (10.13.175.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 10:35:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 6 Sep 2021
 05:35:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 6 Sep 2021
 05:35:23 -0500
Received: from wayne-dev (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 6 Sep 2021 05:35:20 -0500
Date: Mon, 6 Sep 2021 18:35:20 +0800
From: Jingwen Chen <Jingwen.Chen2@amd.com>
To: "Liu, Monk" <Monk.Liu@amd.com>, Daniel Vetter <daniel@ffwll.ch>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
CC: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexdeucher@gmail.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, DRI Development
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
Message-ID: <20210906103520.xp2r4u5aknxtv4qs@wayne-dev>
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAKMK7uHKX0rSVk_yBPo_KAEJ-UeLk5UxQ2kBdv+FD2j9zAjfZA@mail.gmail.com>
 <BL1PR12MB5269B303372A6251EDD1DC2C84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CADnq5_PUvgt9Cv2L3G4GGBJv_WBhtOp8DN+3WMvoES_80UMKfQ@mail.gmail.com>
 <CAPM=9tz-66nXR8gbMucsBo5Q1VJ5AsrVZh4pF0r0WfFi7CQtzg@mail.gmail.com>
 <BL1PR12MB5269F6B279EDE278C8FDF90A84CE9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <a1f2cfdf-e1af-e265-3d96-b8f5c47a0b84@amd.com>
 <CAKMK7uENdQRw+5a=A_C3V6BpzqhU1asL_Bnm34r5ZjPpqu=gfQ@mail.gmail.com>
 <BL1PR12MB5269F59E4548AD2CF85EC78084D29@BL1PR12MB5269.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5269F59E4548AD2CF85EC78084D29@BL1PR12MB5269.namprd12.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d07917f7-aeb2-4aaf-833e-08d9712208ec
X-MS-TrafficTypeDiagnostic: BN7PR12MB2836:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2836E87C34A0729714ADAA9CB7D29@BN7PR12MB2836.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIOvYBUb185NYkAClK2I3eIulsZF3tdZbaxwy2VYmy+KGepKrXd6XIemYMpx7AQNEMw0RSd8II3irgTp002IIjCmMuJ+Lz6a/SkyWGpQHrcs3TjkhSk67Lwv+NFarwbafx1A4m07UrP9Moo/0LU8W7uzGcZSlg99De/yhar3NUVDpeO9m/Rtaqexyj4tgYF/AM2ctYuXR8JYF1z0Nknw22tf16mUgGopbcmukTgNvax5Q0W7vmgAzHoRHWETYvT67K/GqaNb/2wvbtJB1AbOkMnHrYFBpmwhN8TSR1/joIKfW9LEx+jm06pJ5SyuKP1vPTq8lyF0sAcQKif3Mr7yHxYRCGxAVVfvMsLaqT6NJOjmnmYy0LCVAaaEIvN1WZbUVvDLGkWdXbjf5T1KIn3ju3j9U7ZXUSq+JL3l5BXWJNdwcfzTABdnYS1IexIweuXc94z6hBb9bGzXz9AjVZiJCnp3/figPh8PhlLwpnK8Aa5984jqJSyNsdRWLPVdgF4BZ/QZjRon1xWjNujMotMVqYNl7P1F2l/BjGn2sYwhQ5KDLR0dXC05PTh8wH5z94fo25Fmueg2i+eflB5PLSjEec+4kGsfUwFMEmoxYuCccAfpwwGPT2DIRk/75YXJPQYdaX6x7smf1J42irnV40mvdJhpTHXG/vzViGQmDd9aaImqF+8p28AH2ZrJL4dhoW0Bv4qlNgmBe4hKGodNBdfO6NFW+NSvh5O7s++vQ19Zp6GWGvHb0LJiL2nZGpBaZb7OnmiOygKVK3yRGEg+u2rah3KkuB3k1cdycwLVib/lnWej3/pd8h0m5RZ5/souzvGV24eondwZirA4AIg+AirtvvcAGYv4P0jjVFkJK7Vv8Bg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(36840700001)(46966006)(53546011)(66574015)(316002)(33716001)(36860700001)(26005)(82310400003)(6636002)(83380400001)(81166007)(70206006)(186003)(336012)(2906002)(426003)(70586007)(54906003)(110136005)(47076005)(82740400003)(478600001)(9686003)(356005)(8936002)(8676002)(1076003)(966005)(4326008)(45080400002)(55016002)(86362001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 10:35:24.0498 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d07917f7-aeb2-4aaf-833e-08d9712208ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2836
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian/Andrey/Daniel,

I read Boris's patch about ordered workqueue and I think maybe we can
leverage this change.
https://lore.kernel.org/dri-devel/20210625133327.2598825-2-boris.brezillon@collabora.com/

As the TDR race condition we are talking about is caused by a bailing
job being deleted from pending list. While if we use the ordered
workqueue for timedout in the driver, there will be no bailing job.

Do you have any suggestions?

Best Regards,
JingWen Chen

On Mon Sep 06, 2021 at 02:36:52PM +0800, Liu, Monk wrote:
> [AMD Official Use Only]
> 
> > I'm fearing that just repeating what Alex said, but to make it clear 
> > once more: That is *not* necessary!
> >
> > The shared repository is owned by upstream maintainers and they are 
> > usually free to do restructuring work without getting acknowledge from 
> > every single driver maintainer.
> 
> Hi Daniel
> 
> Anyway thanks for officially confirm to me of working model & policy in community, I don't want to put my opinion here due to that's not my call to change no matter how.
> I only want to let this diagnostic TDR scheme going to a good end for AMD or even for all DRM vendor.
> 
> How about this way, we still have a final patch not landed in DRM scheduler and I would like jingwen to present it to you and AlexD/Christian/Andrey,  I believe you will have concerns or objections regarding this patch, but that's fine, let us figure it out together, how to make it acceptable by you and other vendors that working with DRM scheduler.
> 
> P.S.:  I had to repeat myself again, we are not popping up new idea suddenly, it is disconnection issue, we didn't have changes (or plan to have changes) in DRM scheduler before, but eventually we found we must make job_timeout and sched_main to work in a serialized otherwise it won't work based on current scheduler's code structure.
> 
> Thanks 
> 
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
> 
> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch> 
> Sent: Friday, September 3, 2021 12:11 AM
> To: Koenig, Christian <Christian.Koenig@amd.com>
> Cc: Liu, Monk <Monk.Liu@amd.com>; Dave Airlie <airlied@gmail.com>; Alex Deucher <alexdeucher@gmail.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>; DRI Development <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org
> Subject: Re: [diagnostic TDR mode patches] unify our solution opinions/suggestions in one thread
> 
> On Thu, Sep 2, 2021 at 1:00 PM Christian König <christian.koenig@amd.com> wrote:
> >
> > Hi Monk,
> >
> > Am 02.09.21 um 07:52 schrieb Liu, Monk:
> > > [AMD Official Use Only]
> > >
> > > I'm not sure I can add much to help this along, I'm sure Alex has 
> > > some internal training, Once your driver is upstream, it belongs to upstream, you can maintain it, but you no longer control it 100%, it's a tradeoff, it's not one companies always understand.
> > > Usually people are fine developing away internally, but once interaction with other parts of the kernel/subsystem is required they have the realisation that they needed to work upstream 6 months earlier.
> > > The best time to interact with upstream was 6 months ago, the second best time is now.
> > > <<<
> > >
> > > Daniel/AlexD
> > >
> > > I didn't mean your changes on AMD driver need my personal approval 
> > > or review ... and  I'm totally already get used that our driver is not 100% under control by AMDers, but supposedly any one from community (including you) who tend to change AMD's driver need at least to get approvement from someone in AMD, e.g.: AlexD or Christian, doesn't that reasonable?
> >
> > I'm fearing that just repeating what Alex said, but to make it clear 
> > once more: That is *not* necessary!
> >
> > The shared repository is owned by upstream maintainers and they are 
> > usually free to do restructuring work without getting acknowledge from 
> > every single driver maintainer.
> >
> > Anybody can of course technically object to upstream design decisions, 
> > but that means that you need to pay attention to the mailing lists in 
> > the first place.
> >
> > > just like we need your approve if we try to modify DRM-sched, or need panfrost's approval if we need to change panfrost code ...
> > >
> > > by only CC AMD's engineers looks not quite properly, how do you know if your changes (on AMD code part) are conflicting with AMD's on-going internal features/refactoring or not ?
> >
> > Well because AMD is supposed to work in public as much as possible and 
> > ask upstream before doing changes to the code base.
> >
> > Additional to that design decisions are supposed to be discussed on 
> > the mailing list and *not* internally.
> 
> Yeah I'm honestly really surprised about the course of this discussion here. With Alex, Christian and others amd has a lot of folks with years/decades of experience in how to collaborate in upstream, when to pull in others proactively and when that's not needed, and in general how to plan upstream work with the lest amount of risk and surprises.
> 
> I think step zero here needs to be some training at amd and then re-planning this effort, before we get back to technical stuff.
> Otherwise we'll just get bogged down in pain because expectations about the process don't pan out.
> -Daniel
> 
> >
> > Regards,
> > Christian.
> >
> > >
> > > Thanks
> > >
> > > ------------------------------------------
> > > Monk Liu | Cloud-GPU Core team
> > > ------------------------------------------
> > >
> > > -----Original Message-----
> > > From: Dave Airlie <airlied@gmail.com>
> > > Sent: Thursday, September 2, 2021 2:51 AM
> > > To: Alex Deucher <alexdeucher@gmail.com>
> > > Cc: Liu, Monk <Monk.Liu@amd.com>; Daniel Vetter <daniel@ffwll.ch>; 
> > > Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey 
> > > <Andrey.Grodzovsky@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>; 
> > > DRI Development <dri-devel@lists.freedesktop.org>; 
> > > amd-gfx@lists.freedesktop.org
> > > Subject: Re: [diagnostic TDR mode patches] unify our solution 
> > > opinions/suggestions in one thread
> > >
> > > On Thu, 2 Sept 2021 at 01:20, Alex Deucher <alexdeucher@gmail.com> wrote:
> > >> On Wed, Sep 1, 2021 at 6:19 AM Liu, Monk <Monk.Liu@amd.com> wrote:
> > >>> [AMD Official Use Only]
> > >>>
> > >>> Daniel
> > >>>
> > >>>  From the link you share it looks you(or someone else) have quite a bunch patches that changes DRM_SCHED or even amdgpu, by that case before they are merged to kernel tree I'm wondering if any AMD develop reviewed them ?
> > >>>
> > >>> They looks to me somehow conflicting with what we changed in our repo....
> > >>>
> > >>> It is really a chaos for AMDer if someone else out side of AMD changes our kernel driver (or/and scheduler) without reviewed by AMDer, just like we are requiring your review if we tend to change scheduler's logic here ....
> > >>>
> > >>> This one changes AMD's code:
> > >>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2F
> > >>> lo 
> > >>> re.kernel.org%2Fdri-devel%2F20210625133327.2598825-2-boris.brezill
> > >>> on
> > >>> %40collabora.com%2F&amp;data=04%7C01%7CMonk.Liu%40amd.com%7C6c507d
> > >>> 18 
> > >>> d65341ef53bb08d96d7976e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C
> > >>> 0% 
> > >>> 7C637661190727875969%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> > >>> CJ 
> > >>> QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=BWJSk
> > >>> KN
> > >>> y2%2BwjxbQrfxGPzuJ5PBpBwB4aV0ZH6QoJGEg%3D&amp;reserved=0
> > >>> And I didn't see any reviewed-by from AMDers ...
> > >>>
> > >>> This one also touches AMD's code:
> > >>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2F
> > >>> lo
> > >>> re.kernel.org%2Fdri-devel%2F20200604081224.863494-12-daniel.vetter
> > >>> %4 
> > >>> 0ffwll.ch%2F&amp;data=04%7C01%7CMonk.Liu%40amd.com%7C6c507d18d6534
> > >>> 1e
> > >>> f53bb08d96d7976e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637
> > >>> 66
> > >>> 1190727885929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi
> > >>> V2 
> > >>> luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2F8vIVXCWjH
> > >>> kM
> > >>> 56pcYI9EvuzhbsZhV9WczkKaBJE67KQ%3D&amp;reserved=0
> > >>> Which is conflicting with one patch we submitted (in our repo 
> > >>> rightnow), and neither see AMDder gave a review-by on this one 
> > >>> (let me know if I missed it)
> > >>>
> > >> Monk, this is not how upstream works.  You need to participate.
> > >> That's how communities work.  There's a reason all these 
> > >> discussions happen on public mailing lists.  The patch author can't 
> > >> be expected to know every person on every vendor team to CC with a 
> > >> patch.  If you have concerns, you need to raise them when the 
> > >> patches are being discussed.
> > >>
> > > I'm not sure I can add much to help this along, I'm sure Alex has 
> > > some internal training,
> > >
> > > Once your driver is upstream, it belongs to upstream, you can maintain it, but you no longer control it 100%, it's a tradeoff, it's not one companies always understand.
> > >
> > > Usually people are fine developing away internally, but once interaction with other parts of the kernel/subsystem is required they have the realisation that they needed to work upstream 6 months earlier.
> > >
> > > The best time to interact with upstream was 6 months ago, the second best time is now.
> > >
> > > Dave.
> >
> 
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7CMonk.Liu%40amd.com%7C1de8110d43194346d9b908d96e2c5459%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637661958966011423%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2BvtBN1lBJnUoeSyj6aXTDRNHVQDQP8kPRdSUrhR1MVk%3D&amp;reserved=0

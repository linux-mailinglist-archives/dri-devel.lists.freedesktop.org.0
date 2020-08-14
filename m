Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB621244F94
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 23:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDAE6E339;
	Fri, 14 Aug 2020 21:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770043.outbound.protection.outlook.com [40.107.77.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6DA6E332;
 Fri, 14 Aug 2020 21:38:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGuOXArj8BWG31JhB2x52hYMr5HNbOR5E9M5AH+HJz8wl/ZdYrAj0kWgUG22mZBetHSFBRldqDfZ1mt5opFZT9L8ls2SdZE0/fEu4x5akADlUq1KTsJ4zG7yqEqX85OBX6xgWybEy1M5lg9LE9ZkaXeDxEocs3apRutkKznv/N8Jy9EnD8s2oFvXM6qZRAX2wrKd8/RIMISvmTuatzqruzDUnTepcF6HGqTC89rSp+iHbxBudQM6ihktjwzhOi0nh/9ok0LYLB0j34/0/Cnsygo85eMPOm9PwJAla7zlRF5qHp6jt7OeR/pXcVJnxNVTbSXdKbvKebiX+hopU7ufQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilT0DRQ6s4WHpbSSsq4PvgSUapkgPmfBTey/TgwT+ZE=;
 b=j2pKhiHgWMd9AkwesTyyj+unXgBtMy6R6kFxsuHkxj5NIzmpth90We8Xrpa94PYneARBv/WiuQ1F4BPSRgGkSDZ2PsMGS9a5pOCW68/+a0vHkTIGNDItgBpF4h4idjaSNP7HwqlhdlPaJ7tR54+zNjbRSd0oPkHvCVLftSnn/18cGLAME3g5LAD2fsTTVRyjlXe5gygF0vAHTRMvVdO3nMX+DaSAx4og6OWTdu9Od+/fsrYXhxN6WaRRTDbDFBvKBhwy73biLo/5yCsZ9pdICl8K3Icc1oozWPsYLEGthiFF3ZuVa1B27bEebbL1cSX1jnDMYvkXUpAEdzEtDMu62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilT0DRQ6s4WHpbSSsq4PvgSUapkgPmfBTey/TgwT+ZE=;
 b=BAR86xLqmQpquApR++VQBT0J8Z0JulnZQOCVawcDxZOIESzdceT+gswgoxxz+czBNzi61HmS9CciHOoUM+zZxWAhRis3fFqWGdJBtPhGkAQnFioSE/Ido/o/X1LGC76ga9Rk2iGpWUIE6ytdLWFiMKxwPjE3GUUgdSrtKUv/pLM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB3082.namprd12.prod.outlook.com (2603:10b6:5:11b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 21:38:01 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3283.015; Fri, 14 Aug 2020
 21:38:01 +0000
Subject: Re: [PATCH 2/2] drm/scheduler: Remove priority macro INVALID
To: Alex Deucher <alexdeucher@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <20200814191401.25606-1-luben.tuikov@amd.com>
 <20200814191401.25606-3-luben.tuikov@amd.com>
 <CADnq5_M=T3gQ1pov8gZqbxVbZ_N1TO6HdKnevkQ336m60XBz-A@mail.gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <34e064f6-8c9a-7f26-0974-708f31401fb8@amd.com>
Date: Fri, 14 Aug 2020 17:37:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
In-Reply-To: <CADnq5_M=T3gQ1pov8gZqbxVbZ_N1TO6HdKnevkQ336m60XBz-A@mail.gmail.com>
Content-Language: en-CA
X-ClientProxiedBy: YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::20) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.55.250) by
 YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.15 via Frontend Transport; Fri, 14 Aug 2020 21:38:00 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e194072d-1d05-4133-b666-08d8409a5182
X-MS-TrafficTypeDiagnostic: DM6PR12MB3082:
X-Microsoft-Antispam-PRVS: <DM6PR12MB30825864590F9B417F84C69A99400@DM6PR12MB3082.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pgrkgSX6fQ6o3rXud+j/Cqw/Vf6okC7j6QgdINPp7X13fgTNoiJXybgZOltPbvOTQITt6WvApa8bg5CuIOzqmtQb03rjI+hkFfATmxFd+SU4UNhB2ED9lHzUYXVwbHiVH7f0dfw2Ggh/Tp+vNXI4KGszy52YxK06ny698XvLTmY5iVc6m8PSNhJOnuGO9FYxirbF5EFdXzYx6gndjgjcICCWmPBTRww9LQelOh20SokzEd7qLNoJz/9oXhb9hKCIN9/nATknIQX4S+EvGWmIKBR6h+Fp4yZ769pRoPwezWcUuKLfYHh5Fs4PHI/HtlDEr4Wc7T18Tl/sFlMYsnjCVQMD+UzKtUdkAzNlZxz+RaZD7o/lAy//ziGykGP/jgpn/ED8prZn8/0wAZGocOadYz603Di+PIq0IgCH73ELuvk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(4326008)(66946007)(66476007)(66556008)(5660300002)(2616005)(45080400002)(44832011)(956004)(52116002)(186003)(6486002)(86362001)(16526019)(83380400001)(6512007)(31696002)(2906002)(8676002)(8936002)(36756003)(6506007)(316002)(31686004)(110136005)(966005)(478600001)(53546011)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 0cC1JQ6hQ9qOSsCljgctmXOri+dEkOxhvdM7gTpismjK8RVjHUb3Kf3mdVoLvA9xItvS42pQKNmVDTlgADe9MNjYk04sxMhgeSDwuOXWhtDi5MAvbmn51gEYjoMWuHgDter1bWtCOGjAPMCFTdG2fyRay1SnmHJ2kM+st5dpc8id+hCmy1lRmMTpxgK7/ecl78PZQ8XcHUkfgGw6BOQfzrIqmbbxOXwxxErZoos+d7W5uD5VnGrFdZ+dpjxfpVN2Lyb/K6lmcm8ghu8FLlPfOhoUe3HViUdCv7y5jHTjmuU+9rA4UBNPbiL9KOPpqFd97CX6djvvCjNyns6WEKyqgu+UShmRXASp/eXTHXVAamT85DR/IZ3pRM/NRWxdILOf2IwVrIaJpuHCuxjvgp4sR61HJakx/I6+zV31Tms+S/l46Bb/sFp/G7cUBDV9ghwipzBWRm+epbs2JqPn7Xj/0Ltmu9brYGOA+GG1kwjXsVjYK4ybM2X+CgqSFKlZtZyrJHSIXsy7yOaMtx/0BMSeb7FqXOwZKwH8x3zjj+QD428Pa4THByG7clo3zOHGpSS+FI0erCorisSdCdYnfIptIibBFa4+WJ8o5p81TGKFVo8b5yoEq9GfX/RczLu/0Hyrk+QIvOwMyo8BTUszJ5nGfQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e194072d-1d05-4133-b666-08d8409a5182
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 21:38:01.1815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiGpWcoHMzR35ua3bAi2RjN5ss6O4HRy28IyKEU7TBE4QCid4BLxK/24cBuDY9Yr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3082
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-14 3:28 p.m., Alex Deucher wrote:
> + dri-devel
> 
> 
> On Fri, Aug 14, 2020 at 3:14 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>>
>> Remove DRM_SCHED_PRIORITY_INVALID. We no longer
>> carry around an invalid priority and cut it off
>> at the source.
>>
>> Backwards compatibility behaviour of AMDGPU CTX
>> IOCTL passing in garbage for context priority
>> from user space and then mapping that to
>> DRM_SCHED_PRIORITY_NORMAL is preserved.
>>
>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c   | 21 ++++----
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 62 +++++++++++++++--------
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h |  3 +-
>>  include/drm/gpu_scheduler.h               |  1 -
>>  4 files changed, 53 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> index fd97ac34277b..10d3bfa416c0 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> @@ -384,42 +384,41 @@ static int amdgpu_ctx_query2(struct amdgpu_device *adev,
>>  int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
>>                      struct drm_file *filp)
>>  {
>> -       int r;
>> +       int res;
>>         uint32_t id;
>> -       enum drm_sched_priority priority;
>> +       enum drm_sched_priority prio;
> 
> The variable renaming is not directly related to the functional change
> in the patch and should be split out as a separate patch is you think
> it should be applied.  I personally prefer the original naming.  The
> driver uses r or ret for return value checking pretty consistently.  I
> also prefer to spell things out unless the names are really long.
> Makes it more obvious what they are for.  Same comment on the
> functions below as well.

Sure, I can revert this. Personally, I don't like single letter
variables as they are very inexpressive and hard to search for.
I thought "prio" to be easier to type than "priority", but I can
revert this.

Regards,
Luben

> 
> Alex
> 
>>
>>         union drm_amdgpu_ctx *args = data;
>>         struct amdgpu_device *adev = dev->dev_private;
>>         struct amdgpu_fpriv *fpriv = filp->driver_priv;
>>
>> -       r = 0;
>>         id = args->in.ctx_id;
>> -       priority = amdgpu_to_sched_priority(args->in.priority);
>> +       res = amdgpu_to_sched_priority(args->in.priority, &prio);
>>
>>         /* For backwards compatibility reasons, we need to accept
>>          * ioctls with garbage in the priority field */
>> -       if (priority == DRM_SCHED_PRIORITY_INVALID)
>> -               priority = DRM_SCHED_PRIORITY_NORMAL;
>> +       if (res == -EINVAL)
>> +               prio = DRM_SCHED_PRIORITY_NORMAL;
>>
>>         switch (args->in.op) {
>>         case AMDGPU_CTX_OP_ALLOC_CTX:
>> -               r = amdgpu_ctx_alloc(adev, fpriv, filp, priority, &id);
>> +               res = amdgpu_ctx_alloc(adev, fpriv, filp, prio, &id);
>>                 args->out.alloc.ctx_id = id;
>>                 break;
>>         case AMDGPU_CTX_OP_FREE_CTX:
>> -               r = amdgpu_ctx_free(fpriv, id);
>> +               res = amdgpu_ctx_free(fpriv, id);
>>                 break;
>>         case AMDGPU_CTX_OP_QUERY_STATE:
>> -               r = amdgpu_ctx_query(adev, fpriv, id, &args->out);
>> +               res = amdgpu_ctx_query(adev, fpriv, id, &args->out);
>>                 break;
>>         case AMDGPU_CTX_OP_QUERY_STATE2:
>> -               r = amdgpu_ctx_query2(adev, fpriv, id, &args->out);
>> +               res = amdgpu_ctx_query2(adev, fpriv, id, &args->out);
>>                 break;
>>         default:
>>                 return -EINVAL;
>>         }
>>
>> -       return r;
>> +       return res;
>>  }
>>
>>  struct amdgpu_ctx *amdgpu_ctx_get(struct amdgpu_fpriv *fpriv, uint32_t id)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
>> index e05bc22a0a49..2398eb646043 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
>> @@ -32,24 +32,32 @@
>>
>>  #include "amdgpu_vm.h"
>>
>> -enum drm_sched_priority amdgpu_to_sched_priority(int amdgpu_priority)
>> +int amdgpu_to_sched_priority(int amdgpu_priority,
>> +                            enum drm_sched_priority *prio)
>>  {
>>         switch (amdgpu_priority) {
>>         case AMDGPU_CTX_PRIORITY_VERY_HIGH:
>> -               return DRM_SCHED_PRIORITY_HW;
>> +               *prio = DRM_SCHED_PRIORITY_HW;
>> +               break;
>>         case AMDGPU_CTX_PRIORITY_HIGH:
>> -               return DRM_SCHED_PRIORITY_SW;
>> +               *prio = DRM_SCHED_PRIORITY_SW;
>> +               break;
>>         case AMDGPU_CTX_PRIORITY_NORMAL:
>> -               return DRM_SCHED_PRIORITY_NORMAL;
>> +               *prio = DRM_SCHED_PRIORITY_NORMAL;
>> +               break;
>>         case AMDGPU_CTX_PRIORITY_LOW:
>>         case AMDGPU_CTX_PRIORITY_VERY_LOW:
>> -               return DRM_SCHED_PRIORITY_MIN;
>> +               *prio = DRM_SCHED_PRIORITY_MIN;
>> +               break;
>>         case AMDGPU_CTX_PRIORITY_UNSET:
>> -               return DRM_SCHED_PRIORITY_UNSET;
>> +               *prio = DRM_SCHED_PRIORITY_UNSET;
>> +               break;
>>         default:
>>                 WARN(1, "Invalid context priority %d\n", amdgpu_priority);
>> -               return DRM_SCHED_PRIORITY_INVALID;
>> +               return -EINVAL;
>>         }
>> +
>> +       return 0;
>>  }
>>
>>  static int amdgpu_sched_process_priority_override(struct amdgpu_device *adev,
>> @@ -116,30 +124,42 @@ int amdgpu_sched_ioctl(struct drm_device *dev, void *data,
>>  {
>>         union drm_amdgpu_sched *args = data;
>>         struct amdgpu_device *adev = dev->dev_private;
>> -       enum drm_sched_priority priority;
>> -       int r;
>> +       enum drm_sched_priority prio;
>> +       int res;
>>
>> -       priority = amdgpu_to_sched_priority(args->in.priority);
>> -       if (priority == DRM_SCHED_PRIORITY_INVALID)
>> +       /* First check the op, then the op's argument.
>> +        */
>> +       switch (args->in.op) {
>> +       case AMDGPU_SCHED_OP_PROCESS_PRIORITY_OVERRIDE:
>> +       case AMDGPU_SCHED_OP_CONTEXT_PRIORITY_OVERRIDE:
>> +               break;
>> +       default:
>> +               DRM_ERROR("Invalid sched op specified: %d\n", args->in.op);
>>                 return -EINVAL;
>> +       }
>> +
>> +       res = amdgpu_to_sched_priority(args->in.priority, &prio);
>> +       if (res)
>> +               return res;
>>
>>         switch (args->in.op) {
>>         case AMDGPU_SCHED_OP_PROCESS_PRIORITY_OVERRIDE:
>> -               r = amdgpu_sched_process_priority_override(adev,
>> -                                                          args->in.fd,
>> -                                                          priority);
>> +               res = amdgpu_sched_process_priority_override(adev,
>> +                                                            args->in.fd,
>> +                                                            prio);
>>                 break;
>>         case AMDGPU_SCHED_OP_CONTEXT_PRIORITY_OVERRIDE:
>> -               r = amdgpu_sched_context_priority_override(adev,
>> -                                                          args->in.fd,
>> -                                                          args->in.ctx_id,
>> -                                                          priority);
>> +               res = amdgpu_sched_context_priority_override(adev,
>> +                                                            args->in.fd,
>> +                                                            args->in.ctx_id,
>> +                                                            prio);
>>                 break;
>>         default:
>> -               DRM_ERROR("Invalid sched op specified: %d\n", args->in.op);
>> -               r = -EINVAL;
>> +               /* Impossible.
>> +                */
>> +               res = -EINVAL;
>>                 break;
>>         }
>>
>> -       return r;
>> +       return res;
>>  }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h
>> index 12299fd95691..67e5b2472f6a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h
>> @@ -30,7 +30,8 @@ enum drm_sched_priority;
>>  struct drm_device;
>>  struct drm_file;
>>
>> -enum drm_sched_priority amdgpu_to_sched_priority(int amdgpu_priority);
>> +int amdgpu_to_sched_priority(int amdgpu_priority,
>> +                            enum drm_sched_priority *prio);
>>  int amdgpu_sched_ioctl(struct drm_device *dev, void *data,
>>                        struct drm_file *filp);
>>
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 8ae9b8f73bf9..d6ee3b2e8407 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -44,7 +44,6 @@ enum drm_sched_priority {
>>         DRM_SCHED_PRIORITY_HIGH,
>>
>>         DRM_SCHED_PRIORITY_COUNT,
>> -       DRM_SCHED_PRIORITY_INVALID = -1,
>>         DRM_SCHED_PRIORITY_UNSET = -2
>>  };
>>
>> --
>> 2.28.0.215.g878e727637
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cluben.tuikov%40amd.com%7Cfa26637c8f4243baea4708d84088507f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637330301495842311&amp;sdata=4CH%2Fu%2BbtRqKWJF5ZvRqaEeacOdTXJrLOTOz0Fi9ZwTo%3D&amp;reserved=0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

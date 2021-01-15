Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8E32F7EE1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 16:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6131089D52;
	Fri, 15 Jan 2021 15:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F8889D52;
 Fri, 15 Jan 2021 15:04:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJ5kBHXA2/4i8kq671qXo3ye4jSQo9f2ViYB/Qt5rs9PgcChUO8as6PKlFo2l09H7U2434XRj9GMbdHnKIjE90FaKfjEMVplzNPHTqU6aw9zwfD+te9TjBl92lVzDRbkmBYHYoWuB6yHV64HScfGLqaDsu22rIhXAnsS+Ni8Ho70s+XZ5908kaAJJOlus6i/JCE9rTGTgvK2uvKlbk29LQxjwEZrA/SQAbvz1h2R6DBh2UinGhOqTA/Joi13F27aONaJL7GgyHFCbvN3328EW3lVLiJ4mrsh4LihqRwaY5JOf7AL4U+MotcdLIsIf6iLaIU2GZD1s0kGn8gSPp4+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2u97677o1xT7Y5Pcq8UXX0toGys6bFBdhxtFRH/nl3o=;
 b=Jbf/9EDeMaMkQ2F6Fa3F83sBSgs6OQwuZxRjoKPNOc1rq7jTnC3c0jJH+Mv0jWmIFeNLMbdyUaRBPuq/SYglMRGkevBIxDNC4qf9RJ7Jmji9xZgsnf+le3FWbWBV67hoanQel45BLvrstmXmHm0v081QhEmnCZhOFq9DyLtq069qnUsa5HSrlAQHsCbooU77d1BmR5z1Fo8QpGw3zC1LtnmEStPJQIWb5rzTKd2HcO6dhmIRpYo3PW6Ri4hDbIPov6Tnc/F7nGamY4agkZnoAz22+/mm9oPgEkzJzg3Ic7xE4QGAuUZwrSPB/HXat8ItHJaD1lmbbm01PERzwYTn3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2u97677o1xT7Y5Pcq8UXX0toGys6bFBdhxtFRH/nl3o=;
 b=oL27IsW1dem9HweBMW/8jwgpfBmOiWCAF4zNdU7GS4px3SiH449QVHX58Dr58prr+v8Rr+wDWN8S6U2svd1EJF01y0Fhm5Z49DAvvhJ7sbCgN0/Lq7SrCUukIKIVswnt9QV8QO1feIYcYflqxP0EDhSe1NI5yiUuRwYRlKel/6Y=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM6PR12MB3355.namprd12.prod.outlook.com (2603:10b6:5:115::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 15:04:05 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b%5]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 15:04:05 +0000
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20210115122310.7dd6bb11@canb.auug.org.au>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <9bb019ff-cbaa-3b1e-4688-80440a6d5c10@amd.com>
Date: Fri, 15 Jan 2021 16:03:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210115122310.7dd6bb11@canb.auug.org.au>
Content-Language: en-US
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN4PR12CA0020.namprd12.prod.outlook.com
 (2603:10b6:403:2::30) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.84.11) by
 BN4PR12CA0020.namprd12.prod.outlook.com (2603:10b6:403:2::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 15:04:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 57d19b76-9661-4c2b-3584-08d8b966ccc0
X-MS-TrafficTypeDiagnostic: DM6PR12MB3355:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB33554351990901A7A4BAFDD18BA70@DM6PR12MB3355.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:32;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j/1fVnVLuqPdPeB9IDrcRnfm1IdQiqJnuXgdgxle5wuPNj9/xfEMrqjIc5AHbRyyiMVnAaNb6jaTjipRyIllj7n55p8TZrx7QJrOTSuR5x6jHgvTF4CM82JwikHOXfC2nXoAhjP4mYUg6oarZcMikdl9u14zzl8tFNp3k4qluzyP+8IVZe7qMpg+cZPr3Qkv/knAw5OLvME6HBUOTum/B3QLXtUZmbJ5bip3JkSxXri76uicc8MOCkNzN3Vj0bPBXvSvlpy+cp1HVaS3kjFtdNMcxxf18Nr8pU09p/huRvIEkg3ziJXzkIlGARFPu32Mue9vzJdtv4RKfmntvGhumZNUym7Rprrh2h3HxyRj+hPyn8EavpifM4JPMgTh+7WLDW0VTeyP6bc2UYkCy8naIbqRrioTsBSatMtC4qg5aDoH2XFk0It4pO9H8O8WbF192HDLRweD9lWf+B1ijEhylJzd7E6JV0QzyCv5s1BLfzhA3cDZDEPQLwFHZ2IH8m2DX+Ie9341rwiEj9XInGvKzgSox6ZukVvViLJB//cIdmvAhc9eXYZHEBBwzzDdvbUit548dT24H3xO8fhTQWBZnAIKI6rrYftBu5q9/l2X17Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(8676002)(110136005)(956004)(53546011)(2616005)(6512007)(66476007)(186003)(26005)(6506007)(54906003)(4326008)(316002)(52116002)(16526019)(5660300002)(6666004)(6486002)(478600001)(31686004)(2906002)(8936002)(66556008)(83380400001)(36756003)(66946007)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?sixYt3kUxBbXuRC0BhqQK2XUicZoicliDqMq+tMfVoxEwN3or2oJlrJM?=
 =?Windows-1252?Q?DBlJ97cZMtUcwzsVbukrpCQIH/3LJn61BD9ASvJ7jqfodFJuyG/jZuKY?=
 =?Windows-1252?Q?851GfMZ3mS6GndmYsAf9JHmGbEAtR3Mm+4cUmfxYOuVwUbanbGVYumrW?=
 =?Windows-1252?Q?//sNDVHeXPa5ZrIf6iuW/GrctZVKLxu8KlXdfEOVG3ziCPSfK1MBTPEg?=
 =?Windows-1252?Q?ANPcxIiI+1Zsk2jn7Q2yXW5A9vCyfRuP+FiV+63VUmoQ3j8AQyKFUyN0?=
 =?Windows-1252?Q?k9H6EjvRKG2gE9N4s2ACHUlt1evNlN6gVHwyj/C8h6b+2Od/6BVa0GGH?=
 =?Windows-1252?Q?tjfmVVqu9zEJoQN19g3I8AA3Crxsyl2WvMaMsyUHeln32FWnmh2pLvAd?=
 =?Windows-1252?Q?7JGz8huFgKSJ0Ycj+uTtcAPQErVIHPA1JWOW+YhpfOBW1N7gzDqUf3Aq?=
 =?Windows-1252?Q?UQXqo6IovPrMvdKNOztW6DzvpbEPPm6t1clzCzHNgaHB/1t1+3ku1ze0?=
 =?Windows-1252?Q?JO0/jPE3GS/cytwnIiVL743xOK8TsEceUnrvTLkD5wcLOppKIqoL1rLI?=
 =?Windows-1252?Q?ySxLmdzOc7F9iO1Hpd4VFcW/DFeG5krI+vjDCltcE8cHJTJaaa41rt8S?=
 =?Windows-1252?Q?HYPJ9LnVTwmtKBL9PBVkxue2AZZLVH5vYedmHeEzXwCb1jzP6Jhs402E?=
 =?Windows-1252?Q?LyvEVpU4vLWgifrduSw66GiNrzEMpGM1wteUozk+KlLeB1Ffyzt8tWch?=
 =?Windows-1252?Q?SzfwhzJo62oQ8lCMRjuS2vPeZHrGQFPTn/KV065tVwqsj8XET8tI1YlM?=
 =?Windows-1252?Q?4kfn6X9pl41SkClIXI5kdNHGVpgREWNuCy1klCbf7LVhYIWkIKk6Wx9i?=
 =?Windows-1252?Q?pXK2h2qZjXcwcwl/TW0fIdYWX3LqlyNoQKNWBNgFgVDwswl2AaZFqOEf?=
 =?Windows-1252?Q?01v+1ECatcwEnhqDMsgCajPbXgqKOlblKtH8pRjCQ79E/wrP1ixCFL4/?=
 =?Windows-1252?Q?6cKaLNyyMas0uJt8iFuCDw77bp5Iy8ePeDoIXLZ7U+qDOZemMvl/kI3n?=
 =?Windows-1252?Q?nROFiPlRI7YxXKDJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d19b76-9661-4c2b-3584-08d8b966ccc0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3916.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 15:04:04.8804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/GDQYF7+nRJqDu7o3i+BgHfPqi7cbPxrcr4jwAUv46H7otcZYsSFPWDxq0czzZnjfiqKGrk1oCt6CZHWF6cMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3355
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
Cc: Nirmoy Das <nirmoy.das@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Darren Salt <devspam@moreofthesa.me.uk>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On 1/15/21 2:23 AM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_display.c: In function 'amdgpu_display_user_framebuffer_create':
> drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:929:24: warning: unused variable 'adev' [-Wunused-variable]
>    929 |  struct amdgpu_device *adev = drm_to_adev(dev);
>        |                        ^~~~
>
> Introduced by commit
>
>    8f66090b7bb7 ("drm/amdgpu: Remove references to struct drm_device.pdev")


I just sent a patch for this.


>
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function 'amdgpu_device_resize_fb_bar':
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1109:6: warning: unused variable 'space_needed' [-Wunused-variable]
>   1109 |  u64 space_needed = roundup_pow_of_two(adev->gmc.real_vram_size);
>        |      ^~~~~~~~~~~~
>
> Introduced by commit
>
>    453f617a30aa ("drm/amdgpu: Resize BAR0 to the maximum available size, even if it doesn't cover VRAM")


We have a fix already merged in drm-misc-next for this.


Thanks,

Nirmoy

>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

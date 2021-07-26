Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF1D3D684B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 22:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04146F9CD;
	Mon, 26 Jul 2021 20:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C936F9CD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 20:50:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHW9VCnJUtzJtEsC3NvJ44XKx0ZcXZOHm4vyMJlI2BR5RPx1jfYpW/C7eQ6phywLjHnKkVw3djgxnj+aZZfaIi196cprNycD7MRx6KL8yC3ceQCHxglnYKTyQm8bc8MlGfCc8SZLfiQw1aHw9TxB03jHSxC3rNg3JVJIGRtLjrMvlwC93yVC70s7goAfqAXqYqJ0yBx3FdR0sD1uC7qP3gdKC9co1+C8UMWFMTGXwz1LRgMMPFQxy9EGQdX8OTeZq80y+tTSFRM8DcRTh0GcrA75SA6oGOoL/xDKzVXDDqOqLTopYwHSDlYchpfbVL1U5rrzbDO7twU2KYMimISYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4jxekmigvRqzap89p8Fhl2gLBFoip0BcKU25tm3xGg=;
 b=MNEyZ+T/EDAZyUZu/Xo94MYnqK1P2xiARs+XlX16JAa81QAx3oO4UPwUKsy/Us+yz9WoG0L71uElEZb0Rc3JPPRaBrGE7aSA01PjBhmANwetJUXG/uz+W8E4AkNb9af5e7J4SbOo1Du2aHphnSDQySYePrsjlsse2V1/Jbx+WljXpuS7ovRd/wZbdSSO4xwYpLrMXdydQGxJiNKwxk+AMjVOnxoiLEVQsp9uJQdBfrMmmTzseaNmd1evnE1ahWD1uzPK0UB6OobwoMTr+wDRKJzhpx8mxV89L33bz6NBhXVi1ANQXOFaPYexgxYh0/ljYi4AHILbVGBLVeN1WSRBjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4jxekmigvRqzap89p8Fhl2gLBFoip0BcKU25tm3xGg=;
 b=Gv3b4QJP9UC24cTmDPHCBLJQDFqXesn5Gg2cdgJZMeI4Pcm/ElKLgP+aPlkT+a6isIbQ1tjBeeo0koX5I+VodOvsmpZnVNWY+CKsGi8meMi7gkPKU2r4RwoRSURSVtOzLHUPJJjZlUTR06/OGceF55dT213a1WZXjZl1fy2tyOU=
Authentication-Results: poorly.run; dkim=none (message not signed)
 header.d=none;poorly.run; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB5564.namprd12.prod.outlook.com (2603:10b6:610:65::24)
 by CH0PR12MB5265.namprd12.prod.outlook.com (2603:10b6:610:d0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Mon, 26 Jul
 2021 20:50:39 +0000
Received: from CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::a1f2:ad80:7e9f:db24]) by CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::a1f2:ad80:7e9f:db24%5]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 20:50:39 +0000
Date: Mon, 26 Jul 2021 16:50:35 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [RESEND PATCH v6 14/14] drm/print: Add tracefs support to the
 drm logging helpers
Message-ID: <20210726205035.tegmcrr7tfayxlms@outlook.office365.com>
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-15-sean@poorly.run>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210721175526.22020-15-sean@poorly.run>
X-ClientProxiedBy: BN6PR22CA0058.namprd22.prod.outlook.com
 (2603:10b6:404:ca::20) To CH2PR12MB5564.namprd12.prod.outlook.com
 (2603:10b6:610:65::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:991b:8d60:a76e:ef75)
 by BN6PR22CA0058.namprd22.prod.outlook.com (2603:10b6:404:ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Mon, 26 Jul 2021 20:50:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ecbd256-71ae-4f31-e3e7-08d95077066a
X-MS-TrafficTypeDiagnostic: CH0PR12MB5265:
X-Microsoft-Antispam-PRVS: <CH0PR12MB52653B2E3A35575C0577E78D98E89@CH0PR12MB5265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jNRrQEv0cemGMDr4z/LmPnrT+K38w3i1wEcEoczU5OziHjK7GNDqmwTUn9CTpGlvdwrKPSKcxctQF9iEiYMjlo1+7pDYgVgnVf0m+F/NYs7LKmrimva5fneL3g8f+Ubjno3obx6DqMzvNdzJais1lMW/LcOwU0dWHeDiAC/i1YLpYVO03jNcQZGDjOVJ19OFAkiIPgXHgNoD3mb1Hxrneetf8mHT55QbiuPxLZ00Zr83V4OtV+TXjqoxoizpPAWlWVFErRjC4iQZf4/mMdvdzbUxcnYANx68xDHkg9ubCtLiH+IjYt0WEHTH6flraMlXN28UWMxrDMfaqKmRhUM5pweVQ7aTNoEP6NtJkt2Vq4Bx+m035rla3UIF1GrsqtAN5Z1aQx3NDOJ2Cunyfnsxj+FLt28+9PoCM4zwrz/60xObxcIJSJUpQ8lbIQVyFQBgYHCYIkxFjpScNK0TH/kFjD+Mi5b+VM9FgNd2R6GMM0O1eSHwwrKGzayoYQ9aMKgQvjWbZfdU6l+44QlEKu+wdLmjZBAZ0dsjoDHgtTvT0G2VoW8Ce7mzjl9wBkA5x16ss3A1dV+kbRlktdRwJficXs5chG7ceNp3ddSMVZ5lRsIQxpxZUVHGBGqgkH3rkTkaKDuUTGznm6ATTIs9TeHcjvaPhZgHuYyLPQ1/HXwz3dkT9yFBRFJT31inZC8JOkMl+zLn09DijXWSsji7RJ37JLQ+WupSj0cc4G4JCV2/zvA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5564.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(66476007)(186003)(5660300002)(316002)(38100700002)(6506007)(8936002)(7696005)(8676002)(30864003)(2906002)(7416002)(6916009)(4326008)(1076003)(86362001)(52116002)(66946007)(9686003)(54906003)(508600001)(55016002)(966005)(66574015)(83380400001)(45080400002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9JgUMFlMPNGEoRCND2aqBfsFF0nGm7HsTPuBzZPIQqwtF0TgNZXzJ6yaXh?=
 =?iso-8859-1?Q?dYq51qh1gmESt7+xCTdQHvb2GXafvPEnk/L7c6uHzugpvyFFGqO28LsqCX?=
 =?iso-8859-1?Q?1t0b8uEoynEU8JoW0JqI03kusRHWUK2d4eDaZk4dJmmg6ahnkly45lDBw4?=
 =?iso-8859-1?Q?0luSnJINZLGYuZcDzEaJ71kstONhVHbw4wZGArhLJYoZ5e8Mg1ZkZhMubg?=
 =?iso-8859-1?Q?FUmDOa48ZHe56Tx1TR7vaCCKHSPy7UvfPs1wuPgT+d1bCBralr+sGAVOAN?=
 =?iso-8859-1?Q?B8sGYLXSblm71FD440KbTneIvCcqFPWsEqlv9zye9HZBgrVzGXEHi6Lx6c?=
 =?iso-8859-1?Q?hv1vmm3x0NyG+TZwk55uQvCz5Q+xbvFi9iIQaSmP/CjXdKCtUcua+w0pQQ?=
 =?iso-8859-1?Q?qQFAZXkA+LgIVFvpTjMDs4Xb24csGMD5yNAgLnE8AyiOEImd+Ong7qpqwa?=
 =?iso-8859-1?Q?7ZBCrG4uNVkWExdyu3Wz9X66g92UMVncoHzO4fxW7BwSuwTGO5uO7GNDlQ?=
 =?iso-8859-1?Q?nuaCpzAKaU9SIxoQqzh6uqiJym5JKekElh78n4EpPti87lS0VC0Dh5qAmW?=
 =?iso-8859-1?Q?MsynOFO89UBkk7Cfk1OhR/SzWiJtF+A9/ijx3X2Ub4MxYjYH1Tr1jfVRMm?=
 =?iso-8859-1?Q?0E/6bUuzstZ7r1GB7vKGwUzdQ1eL1IA6jWTa9lJtv2xT5xmRQi6fP3bMuI?=
 =?iso-8859-1?Q?hAHdcR0yqZbUIFLIpZJ8RRj5foWPdhBU//bz0KMG1PGIAOzGqef+7vQMON?=
 =?iso-8859-1?Q?wMSaIW1FkKzpFvwlNjLrWyYRagwzMn39nqnA8RGzXDUtOseGpwd6Fula+P?=
 =?iso-8859-1?Q?pNQ0rZaZVhLK/+ScPLK3N4qUFNLG9I/8/sQLi4u8AdyI/zqvxHiSNzlUTi?=
 =?iso-8859-1?Q?huFdAqUNnRYHABWk3OKaXA73sCqBvGvQn73kKLFHJ6/AcS4IJYWJIfyvTs?=
 =?iso-8859-1?Q?jK6TWTS+3UB5ebBr6Vefuh5ZEpKe//pnO8W4BmXfGJ4pLRP0h554dwAGVx?=
 =?iso-8859-1?Q?pqsu/BNTLUTcwh/F4W0I/Yme4mpH4yDHdwZwdzmn6ZJXjMsqPABhic9iFk?=
 =?iso-8859-1?Q?5mKBpZMlxxPsjrmsjl82W849Lod0sP7P5/6visVuDlpww1PwGwF8OcGMAz?=
 =?iso-8859-1?Q?V5sOJC8VjhYVMHEOsV3EdSH5qqSoCeAEctGNqc00P/TOlh77WBfrEtFsVh?=
 =?iso-8859-1?Q?VKG1Ve5OZYND9m0azYvrTBUtZinbuKYUtzM3r7qk2cuJ8blbOxKgZYZDdg?=
 =?iso-8859-1?Q?DsDOGHTrJ5aptkl8vgXV3Ts9hSwKz9/e59LGqid16Db1hCmU9eeT8qp2Ai?=
 =?iso-8859-1?Q?uf4PfHoVUJTUVfI8Z3s40UEdQeDRthPbybEaYe6pJr6C6rLfoc3sq/7z0s?=
 =?iso-8859-1?Q?i+60CPinmAQMkFXs2lEP76+OGuQG/Zf4nePKSLT8qejgLZuyb7xHYdyzSM?=
 =?iso-8859-1?Q?H3JyjG/WH4x8GQY4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ecbd256-71ae-4f31-e3e7-08d95077066a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5564.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 20:50:39.0874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R78SE9tHMM0Fvg+10VlAksHoGncAZhWYf6a5eeWjr2isQYZ9xzhnPtGs3Zt1r8VqQEAnoMekYia6RFaPFhmytg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5265
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 kernel test robot <lkp@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 airlied@linux.ie, daniel.vetter@ffwll.ch, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <seanpaul@chromium.org>, Steven Rostedt <rostedt@goodmis.org>,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/21, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds a new module parameter called drm.trace which accepts
> the same mask as drm.debug. When a debug category is enabled, log
> messages will be put in a new tracefs instance called drm for
> consumption.
> 
> Using the new tracefs instance will allow distros to enable drm logging
> in production without impacting performance or spamming the system
> logs.
> 
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Reported-by: kernel test robot <lkp@intel.com> # warning reported in v6
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2Fmsgid%2F20191010204823.195540-1-sean%40poorly.run&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7Cbb3d63341a974f70c29208d94c70e119%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637624869979178761%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=NEMZqbDJcEq%2B5Ext3F3%2BLkLNe7JHFa7HNWozh5boJ9M%3D&amp;reserved=0 #v1
> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2019-November%2F243230.html&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7Cbb3d63341a974f70c29208d94c70e119%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637624869979178761%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=nA9bS%2BIsuMxcqdTzf9aClkl3ovccPVnInyFyBpDT8Do%3D&amp;reserved=0 #v2
> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2Fmsgid%2F20191212203301.142437-1-sean%40poorly.run&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7Cbb3d63341a974f70c29208d94c70e119%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637624869979178761%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Vz6I8SF%2BjoajAR48%2BzJmx6llQAHtww9VROLT4krkZK4%3D&amp;reserved=0 #v3
> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2Fmsgid%2F20200114172155.215463-1-sean%40poorly.run&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7Cbb3d63341a974f70c29208d94c70e119%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637624869979178761%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Vcjao5eEZEE6o1Q%2B8CyIalz0UTAiqydOxR8qISbh61I%3D&amp;reserved=0 #v4
> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2Fmsgid%2F20200608210505.48519-14-sean%40poorly.run&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7Cbb3d63341a974f70c29208d94c70e119%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637624869979178761%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=rc1O7r2SQqR3I3Rn0bSRbS9mZBBH%2Fg7%2BEmGcLexheO0%3D&amp;reserved=0 #v5
> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2Fmsgid%2F20200818210510.49730-15-sean%40poorly.run&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7Cbb3d63341a974f70c29208d94c70e119%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637624869979178761%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=PblinqQ5Y8NgHJKGZ%2BwUU7hIlZHwiy0SOsXhB7NPegw%3D&amp;reserved=0 #v6
> 
> Changes in v5:
> -Re-write to use trace_array and the tracefs instance support
> Changes in v6:
> -Use the new trace_array_init_printk() to initialize global trace
>  buffers
> Changes in v6.5:
> -Fix kernel test robot warning
> -Add a trace printf in __drm_err
> ---
>  Documentation/gpu/drm-uapi.rst |   6 +
>  drivers/gpu/drm/drm_drv.c      |   3 +
>  drivers/gpu/drm/drm_print.c    | 223 ++++++++++++++++++++++++++++-----
>  include/drm/drm_print.h        |  63 ++++++++--
>  4 files changed, 255 insertions(+), 40 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 7e51dd40bf6e..ce1ea39fb4b9 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -424,6 +424,12 @@ Debugfs Support
>  .. kernel-doc:: drivers/gpu/drm/drm_debugfs.c
>     :export:
>  
> +DRM Tracing
> +---------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_print.c
> +   :doc: DRM Tracing
> +
>  Sysfs Support
>  =============
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 8804ec7d3215..71dc0b161b51 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1034,12 +1034,15 @@ static void drm_core_exit(void)
>  	drm_sysfs_destroy();
>  	idr_destroy(&drm_minors_idr);
>  	drm_connector_ida_destroy();
> +	drm_trace_cleanup();
>  }
>  
>  static int __init drm_core_init(void)
>  {
>  	int ret;
>  
> +	drm_trace_init();
> +
>  	drm_connector_ida_init();
>  	idr_init(&drm_minors_idr);
>  	drm_memcpy_init_early();
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 4d984a01b3a3..64d9a724c2df 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -31,6 +31,7 @@
>  #include <linux/moduleparam.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> +#include <linux/trace.h>
>  
>  #include <drm/drm.h>
>  #include <drm/drm_drv.h>
> @@ -43,17 +44,34 @@
>  unsigned int __drm_debug_syslog;
>  EXPORT_SYMBOL(__drm_debug_syslog);
>  
> -MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
> -"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
> -"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n"
> -"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n"
> -"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n"
> -"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n"
> -"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
> -"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
> -"\t\tBit 8 (0x100) will enable DP messages (displayport code)");
> +/*
> + * __drm_debug_trace: Enable debug output in drm tracing instance.
> + * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
> + */
> +unsigned int __drm_debug_trace;
> +EXPORT_SYMBOL(__drm_debug_trace);
> +
> +#define DEBUG_PARM_DESC(dst) \
> +"Enable debug output to " dst ", where each bit enables a debug category.\n" \
> +"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n" \
> +"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n" \
> +"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n" \
> +"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n" \
> +"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n" \
> +"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n" \
> +"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n" \
> +"\t\tBit 8 (0x100) will enable DP messages (displayport code)"
> +
> +MODULE_PARM_DESC(debug, DEBUG_PARM_DESC("syslog"));
>  module_param_named(debug, __drm_debug_syslog, int, 0600);
>  
> +MODULE_PARM_DESC(trace, DEBUG_PARM_DESC("tracefs"));
> +module_param_named(trace, __drm_debug_trace, int, 0600);
> +
> +#ifdef CONFIG_TRACING
> +struct trace_array *trace_arr;
> +#endif
> +
>  void __drm_puts_coredump(struct drm_printer *p, const char *str)
>  {
>  	struct drm_print_iterator *iterator = p->arg;
> @@ -166,6 +184,20 @@ void __drm_printfn_debug_syslog(struct drm_printer *p, struct va_format *vaf)
>  }
>  EXPORT_SYMBOL(__drm_printfn_debug_syslog);
>  
> +void __drm_printfn_trace(struct drm_printer *p, struct va_format *vaf)
> +{
> +	drm_trace_printf("%s %pV", p->prefix, vaf);
> +}
> +EXPORT_SYMBOL(__drm_printfn_trace);
> +
> +void __drm_printfn_debug_syslog_and_trace(struct drm_printer *p,
> +					   struct va_format *vaf)
> +{
> +	pr_debug("%s %pV", p->prefix, vaf);
> +	drm_trace_printf("%s %pV", p->prefix, vaf);
> +}
> +EXPORT_SYMBOL(__drm_printfn_debug_syslog_and_trace);
> +
>  void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
>  {
>  	pr_err("*ERROR* %s %pV", p->prefix, vaf);
> @@ -246,6 +278,14 @@ void drm_dev_printk(const struct device *dev, const char *level,
>  	struct va_format vaf;
>  	va_list args;
>  
> +	va_start(args, format);
> +	vaf.fmt = format;
> +	vaf.va = &args;
> +	drm_trace_printf("%s%s[" DRM_NAME ":%ps] %pV",
> +			 dev ? dev_name(dev) : "",dev ? " " : "",
> +			 __builtin_return_address(0), &vaf);
> +	va_end(args);
> +
>  	va_start(args, format);
>  	vaf.fmt = format;
>  	vaf.va = &args;
> @@ -267,21 +307,30 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  	struct va_format vaf;
>  	va_list args;
>  
> -	if (!drm_debug_enabled(category))
> -		return;
> +	if (drm_debug_syslog_enabled(category)) {
> +		va_start(args, format);
> +		vaf.fmt = format;
> +		vaf.va = &args;
>  
> -	va_start(args, format);
> -	vaf.fmt = format;
> -	vaf.va = &args;
> +		if (dev)
> +			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> +				__builtin_return_address(0), &vaf);
> +		else
> +			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> +			__builtin_return_address(0), &vaf);
>  
> -	if (dev)
> -		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> -			   __builtin_return_address(0), &vaf);
> -	else
> -		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> -		       __builtin_return_address(0), &vaf);
> +		va_end(args);
> +	}
>  
> -	va_end(args);
> +	if (drm_debug_trace_enabled(category)) {
> +		va_start(args, format);
> +		vaf.fmt = format;
> +		vaf.va = &args;
> +		drm_trace_printf("%s%s[" DRM_NAME ":%ps] %pV",
> +				 dev ? dev_name(dev) : "", dev ? " " : "",
> +				 __builtin_return_address(0), &vaf);
> +		va_end(args);
> +	}
>  }
>  EXPORT_SYMBOL(drm_dev_dbg);
>  
> @@ -290,17 +339,25 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
>  	struct va_format vaf;
>  	va_list args;
>  
> -	if (!drm_debug_enabled(category))
> -		return;
> +	if (drm_debug_syslog_enabled(category)) {
> +		va_start(args, format);
> +		vaf.fmt = format;
> +		vaf.va = &args;
>  
> -	va_start(args, format);
> -	vaf.fmt = format;
> -	vaf.va = &args;
> +		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> +		__builtin_return_address(0), &vaf);
>  
> -	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> -	       __builtin_return_address(0), &vaf);
> +		va_end(args);
> +	}
>  
> -	va_end(args);
> +	if (drm_debug_trace_enabled(category)) {
> +		va_start(args, format);
> +		vaf.fmt = format;
> +		vaf.va = &args;
> +		drm_trace_printf("[" DRM_NAME ":%ps] %pV",
> +				 __builtin_return_address(0), &vaf);
> +		va_end(args);
> +	}
>  }
>  EXPORT_SYMBOL(__drm_dbg);
>  
> @@ -317,6 +374,13 @@ void __drm_err(const char *format, ...)
>  	       __builtin_return_address(0), &vaf);
>  
>  	va_end(args);
> +
> +	va_start(args, format);
> +	vaf.fmt = format;
> +	vaf.va = &args;
> +	drm_trace_printf("[" DRM_NAME ":%ps] *ERROR* %pV",
> +				__builtin_return_address(0), &vaf);
> +	va_end(args);
>  }
>  EXPORT_SYMBOL(__drm_err);
>  
> @@ -347,3 +411,104 @@ void drm_print_regset32(struct drm_printer *p, struct debugfs_regset32 *regset)
>  	}
>  }
>  EXPORT_SYMBOL(drm_print_regset32);
> +
> +
> +/**
> + * DOC: DRM Tracing
> + *
> + * *tl;dr* DRM tracing is a lightweight alternative to traditional DRM debug
> + * logging.
> + *
> + * While DRM logging is quite convenient when reproducing a specific issue, it
> + * doesn't help when something goes wrong unexpectedly. There are a couple
> + * reasons why one does not want to enable DRM logging at all times:
> + *
> + * 1. We don't want to overwhelm syslog with drm spam, others have to use it too
> + * 2. Console logging is slow
> + *
> + * DRM tracing aims to solve both these problems.
> + *
> + * To use DRM tracing, set the drm.trace module parameter (via cmdline or sysfs)
> + * to a DRM debug category mask (this is a bitmask of &drm_debug_category
> + * values):
> + * ::
> + *
> + *    eg: echo 0x106 > /sys/module/drm/parameters/trace
> + *
> + * Once active, all log messages in the specified categories will be written to
> + * the DRM trace. Once at capacity, the trace will overwrite old messages with
> + * new ones. At any point, one can read the trace file to extract the previous N
> + * DRM messages:
> + * ::
> + *
> + *    eg: cat /sys/kernel/tracing/instances/drm/trace
> + *
> + * Considerations
> + * **************
> + * The trace is subsystem wide, so if you have multiple devices active, they
> + * will be adding logs to the same trace.
> + *
> + * The contents of the DRM Trace are **not** considered UABI. **DO NOT depend on
> + * the values of these traces in your userspace.** These traces are intended for
> + * entertainment purposes only. The contents of these logs carry no warranty,
> + * expressed or implied.
> + */
> +
> +
> +#ifdef CONFIG_TRACING
> +
> +/**
> + * drm_trace_init - initializes the drm trace array
> + *
> + * This function fetches (or creates) the drm trace array. This should be called
> + * once on drm subsystem creation and matched with drm_trace_cleanup().
> + */
> +void drm_trace_init(void)
> +{
> +	int ret;
> +
> +	trace_arr = trace_array_get_by_name("drm");
> +	if (!trace_arr)
> +		return;
> +
> +	ret = trace_array_init_printk(trace_arr);
> +	if (ret)
> +		drm_trace_cleanup();
> +}
> +EXPORT_SYMBOL(drm_trace_init);
> +
> +/**
> + * drm_trace_printf - adds an entry to the drm tracefs instance
> + * @format: printf format of the message to add to the trace
> + *
> + * This function adds a new entry in the drm tracefs instance
> + */
> +void drm_trace_printf(const char *format, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, format);
> +	vaf.fmt = format;
> +	vaf.va = &args;
> +	trace_array_printk(trace_arr, _THIS_IP_, "%pV", &vaf);
> +	va_end(args);
> +}
> +
> +/**
> + * drm_trace_cleanup - destroys the drm trace array
> + *
> + * This function destroys the drm trace array created with drm_trace_init. This
> + * should be called once on drm subsystem close and matched with
> + * drm_trace_init().
> + */
> +void drm_trace_cleanup(void)
> +{
> +	if (trace_arr) {
> +		trace_array_put(trace_arr);
> +		trace_array_destroy(trace_arr);
> +		trace_arr = NULL;
> +	}
> +}
> +EXPORT_SYMBOL(drm_trace_cleanup);
> +#endif
> \ No newline at end of file
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index af31beeb82a1..4609a2f4a425 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -36,12 +36,13 @@
>  
>  /* Do *not* use outside of drm_print.[ch]! */
>  extern unsigned int __drm_debug_syslog;
> +extern unsigned int __drm_debug_trace;
>  
>  /**
>   * DOC: print
>   *
>   * A simple wrapper for dev_printk(), seq_printf(), etc.  Allows same
> - * debug code to be used for both debugfs and printk logging.
> + * debug code to be used for debugfs, printk and tracefs logging.
>   *
>   * For example::
>   *
> @@ -86,6 +87,9 @@ void __drm_printfn_seq_file(struct drm_printer *p, struct va_format *vaf);
>  void __drm_puts_seq_file(struct drm_printer *p, const char *str);
>  void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
>  void __drm_printfn_debug_syslog(struct drm_printer *p, struct va_format *vaf);
> +void __drm_printfn_trace(struct drm_printer *p, struct va_format *vaf);
> +void __drm_printfn_debug_syslog_and_trace(struct drm_printer *p,
> +					   struct va_format *vaf);
>  void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
>  void __drm_printfn_noop(struct drm_printer *p, struct va_format *vaf);
>  
> @@ -219,7 +223,8 @@ static inline struct drm_printer drm_info_printer(struct device *dev)
>  }
>  
>  /**
> - * drm_debug_printer - construct a &drm_printer that outputs to pr_debug()
> + * drm_debug_printer - construct a &drm_printer that outputs to pr_debug() and
> + * drm tracefs
>   * @prefix: debug output prefix
>   *
>   * RETURNS:
> @@ -228,7 +233,7 @@ static inline struct drm_printer drm_info_printer(struct device *dev)
>  static inline struct drm_printer drm_debug_printer(const char *prefix)
>  {
>  	struct drm_printer p = {
> -		.printfn = __drm_printfn_debug_syslog,
> +		.printfn = __drm_printfn_debug_syslog_and_trace,
>  		.prefix = prefix
>  	};
>  	return p;
> @@ -254,14 +259,14 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
>   * enum drm_debug_category - The DRM debug categories
>   *
>   * Each of the DRM debug logging macros use a specific category, and the logging
> - * is filtered by the drm.debug module parameter. This enum specifies the values
> - * for the interface.
> + * is filtered by the drm.debug and drm.trace module parameters. This enum
> + * specifies the values for the interface.
>   *
>   * Each DRM_DEBUG_<CATEGORY> macro logs to DRM_UT_<CATEGORY> category, except
>   * DRM_DEBUG() logs to DRM_UT_CORE.
>   *
> - * Enabling verbose debug messages is done through the drm.debug parameter, each
> - * category being enabled by a bit:
> + * Enabling verbose debug messages is done through the drm.debug and drm.trace
> + * parameters, each category being enabled by a bit:
>   *
>   *  - drm.debug=0x1 will enable CORE messages
>   *  - drm.debug=0x2 will enable DRIVER messages
> @@ -270,10 +275,14 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
>   *  - drm.debug=0x1ff will enable all messages
>   *
>   * An interesting feature is that it's possible to enable verbose logging at
> - * run-time by echoing the debug value in its sysfs node::
> + * run-time by echoing the debug category value in its sysfs node::
>   *
> + *   # For syslog logging:
>   *   # echo 0xf > /sys/module/drm/parameters/debug
>   *
> + *   # For tracefs logging:
> + *   # echo 0xf > /sys/module/drm/parameters/trace
> + *
>   */
>  enum drm_debug_category {
>  	/**
> @@ -325,14 +334,20 @@ static inline bool drm_debug_syslog_enabled(enum drm_debug_category category)
>  	return unlikely(__drm_debug_syslog & category);
>  }
>  
> +static inline bool drm_debug_trace_enabled(enum drm_debug_category category)
> +{
> +	return unlikely(__drm_debug_trace & category);
> +}
> +
>  static inline bool drm_debug_enabled(enum drm_debug_category category)
>  {
> -	return drm_debug_syslog_enabled(category);
> +	return drm_debug_syslog_enabled(category) ||
> +	       drm_debug_trace_enabled(category);
>  }
>  
>  /**
>   * drm_debug_category_printer - construct a &drm_printer that outputs to
> - * pr_debug() if enabled for the given category.
> + * pr_debug() and/or the drm tracefs instance if enabled for the given category.
>   * @category: the DRM_UT_* message category this message belongs to
>   * @prefix: trace output prefix
>   *
> @@ -347,8 +362,13 @@ drm_debug_category_printer(enum drm_debug_category category,
>  		.prefix = prefix
>  	};
>  
> -	if (drm_debug_syslog_enabled(category)) {
> +	if (drm_debug_syslog_enabled(category) &&
> +	    drm_debug_trace_enabled(category)) {
> +		p.printfn = __drm_printfn_debug_syslog_and_trace;
> +	} else if (drm_debug_syslog_enabled(category)) {
>  		p.printfn = __drm_printfn_debug_syslog;
> +	} else if (drm_debug_trace_enabled(category)) {
> +		p.printfn = __drm_printfn_trace;
>  	} else {
>  		WARN(1, "Debug category %d is inactive.", category);
>  		p.printfn = __drm_printfn_noop;
> @@ -357,6 +377,27 @@ drm_debug_category_printer(enum drm_debug_category category,
>  	return p;
>  }
>  
> +
> +#ifdef CONFIG_TRACING
> +void drm_trace_init(void);
> +__printf(1, 2)
> +void drm_trace_printf(const char *format, ...);
> +void drm_trace_cleanup(void);
> +#else
> +static inline void drm_trace_init(void)
> +{
> +}
> +
> +__printf(1, 2)
> +static inline void drm_trace_printf(const char *format, ...)
> +{
> +}
> +
> +static inline void drm_trace_cleanup(void)
> +{
> +}
> +#endif
> +
>  /*
>   * struct device based logging
>   *
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
>

Hi Sean,

Nice patch! I tested and reviewed it and everthing lgtm.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

-- 
Rodrigo Siqueira
https://siqueira.tech

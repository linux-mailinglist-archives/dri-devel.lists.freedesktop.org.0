Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DF65A030C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E358BC96D3;
	Wed, 24 Aug 2022 20:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019E410EF0A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 15:05:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpzGmGMHEcha7L4tmFkHoE3mj7eTeo4hk2qLJCysM23fgv7a1hRuN0SLZjG8WB+dKZv/rd1HWUtn0H0SshtM3L4m1KTMgEoCbGvreJOpUQeyQEmQJuDxLfjU08SBzvOBsu96VIaA7Cvi85gBAp+kHUs/kfpImX1mIpwjDGx7esnoB254uxF0G9tVv3xQaItiMPr1/PfKPDUYWhbd7nurwu0uuKEeuy8y1/T199rxBPepGNfzV504TWHJblZYYG4BE/HWp/uiTJ4b9T7acVWIgNyX89IjeTGpzyEJ6tJxjhEvHlt0cf9HebiUeDqNO1Y67d5JDmzakA/xulI1w0gIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+mcPX5GKTLLm5O1sX+2LGS4zSWqa9L8Y5lR3M2hYT4=;
 b=M+zjbSCIJceJrcdDu3dXQRun5Ty81yvMFAIKaDz3UOIgN86i8V9JK3l78JqsIfreC7DgC1TJWbH44PMbSrFNAQHpbUnkN24gxvOhoDfe70bu6iP2K/xFR/BogTQIev0UI5nmxIHt+AOFOiNvvFqT6nyZsRO2EKoLVErocq6laLz1jVUtbEJLuNkuGuPfxlarTD7IsQdSze6nW+uVzmUMcuoIYfeHggeEY8hkwUXPc7DgLYrtvk4Ht4q6IT/fZov/nG1wTxecWfb5Sc8YD35xRzhjSe5PjQuJId5p0sefR7wZ976zzaSEaJCkTz3W/Q4uUuXtT1TMCSSJcjK0qgsU4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+mcPX5GKTLLm5O1sX+2LGS4zSWqa9L8Y5lR3M2hYT4=;
 b=25zOKOKu7XKwM3xe8l+SUgvSAgCGtMu44Bs0oDLm3kuefcgN22QyCIaJCbEa9r6Lp20ehD6z24A7yRMk2SL3+g7ddq/0YrdkulxUolPTlRhJc4qc3JlQ5yZ/HhxVPkLYSs9u/o8OjKy6hrHkvEH6iOfk2k/pWnqxypsV7ONbDSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB2992.namprd12.prod.outlook.com (2603:10b6:208:d2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Wed, 24 Aug
 2022 15:05:36 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 15:05:36 +0000
Content-Type: multipart/alternative;
 boundary="------------lnLqm2hSVVO5qD9tI0zROBzt"
Message-ID: <19ced073-244a-b003-1a42-a996cc3d8486@amd.com>
Date: Wed, 24 Aug 2022 17:05:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dma-buf: Use dma_fence_unwrap_for_each when importing
 fences
Content-Language: en-US
To: Jason Ekstrand <jason@jlekstrand.net>,
 Jason Ekstrand <jason.ekstrand@collabora.com>
References: <20220802210158.4162525-1-jason.ekstrand@collabora.com>
 <4e8657c4-54aa-ad16-3350-f81c610997f4@amd.com>
 <427467a1466ec7c56616661775d98102407f6fdb.camel@collabora.com>
 <CAOFGe96pKaiH85ReT6y_V4vCKQjXz_hf2O7mqG89aiKXoFiF1w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAOFGe96pKaiH85ReT6y_V4vCKQjXz_hf2O7mqG89aiKXoFiF1w@mail.gmail.com>
X-ClientProxiedBy: AM6PR0202CA0048.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::25) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 720e633b-970f-4241-72ac-08da85e21998
X-MS-TrafficTypeDiagnostic: MN2PR12MB2992:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sQ7COK1SoCstEE9AgbWJuxDLhPA+z9E9Qg4oSq4NoAeOkiLLo/FsL0pfPG9QCcdFmx1bhlYHq9xQaBRLETsD2/OdLARF1duesc5C/Q6qTT1cvF/Qvhw10skx1gUO9G4dSu6C7nQyuGQuaWhBg1F6//dkb+zKPOjXH0sPVtRDpj0JVl34YOUgfOHUdXAb1vwsYfN918hv8eFq++gld7SBzFkLW7PHHWOHAD6Uhb0VTFrOt7BfMbuWKB+fGd3JMJnMnWhjR7/NenDQ/1poPREGFxcVhd2+LhGzzLpAxQd3vFdLHzP3fOmC8gtqcNXQcJIubRqBf2z+ybwkFFnKUIx0XXJsNQlzZr8x2ZlXtwQuh7AVA8TA5+qdrmKNKIG23HTb6VtVtXX7cE+QWptGgUg8QZPkXwaHZw/4y8RFf3KTyEKU8FJEMt5C0TRWJeGhbyyOayJiG78N1X3pkUVulYYwzRO0L9d1ZquNYjcj8hPfpPX5VNNdM1xLJCwjsO52ILF4+wtcRI+Ac28511g1zoGZMsERIgP6pa7tZac6IshUFm107rUnzVrWk+Hi1gcHrdTCl87spln06771JfIX5stTwqEml+hLDm+RbSeicwjzEGrT/6HrEQXiDaa/D5GhI1w7Y9ekUXTLUrN7ZUyiiFbjpkYFZ2yK6nlBXp+c226rEJ+ooqQ1U0YNPbMen8G7+8l6/znXms90HpsAw05x0fclPx5ohcaGwlUE1wWHUFRgR9+tOvqacdF0nNxS3ZRhnH7aeO4lWr3LJZIAaPGBPEX4phCYbm3awo6i6t15gmYD6gg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(83380400001)(66574015)(6486002)(478600001)(6666004)(186003)(6506007)(53546011)(6512007)(5660300002)(316002)(8936002)(2616005)(33964004)(2906002)(41300700001)(110136005)(66476007)(66556008)(86362001)(66946007)(31696002)(31686004)(4326008)(36756003)(38100700002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkpFZzM3cFBIZ3AzVWYzcXI1T3YyMzZKVkZHYnFER21qODFpZDBFWWdMaFF2?=
 =?utf-8?B?RXhpZG1qamM1N3NaSW1hYitGbTY1a3hMWUhYaG5XWE5JSWNudklRd29zdmFk?=
 =?utf-8?B?MG9TVm05ZVJuaGFsOURUVExOMGJyU01KTnNFVWVDMVpWOVlnZ2FhalQwQ0Q3?=
 =?utf-8?B?Z3oxb0hlOWovWFJWMjJKK3IyekF2MDZZNXptbjZZS3NyZ2dtQlZmM21EK25F?=
 =?utf-8?B?TDc5UzlqaDYrcXR3N2xQOWlGMWhpeFdQQTA3amNBZHkzckdlRGwzVTFseEFX?=
 =?utf-8?B?M2JnRkV0RnRrQmZiU2ZxcVpmZTRhN29MRVhiSXpGLytHdzUvUjdQNVdPWElp?=
 =?utf-8?B?bGxGU0xweFVpMzJPYTNTckUxQ1Y1ZkNHY2p4NzhwVFdleUFaaGJZRDRReWk5?=
 =?utf-8?B?cFV1SjdReGdpZ3NjTlh5ME16bHFvbUFKcDRoaFNJazRqSGxvWHppSHBkTFpa?=
 =?utf-8?B?MjVySFRwS21NVFBrY24yK21GZTRLS1M5YkUwWWpscGo1NzIvS3dScittTnM1?=
 =?utf-8?B?MVJUbTBLK2J4Y3JtMUhnTnZSSm5LQWRVV2xncXY0ZHdsa1JQbWVVdFZwTGIw?=
 =?utf-8?B?RGZ5TmFzdVg3d1FEdTFISm1wdlQwTXlnZEorYW04cVg5TDRvYU9OdFdqTzBa?=
 =?utf-8?B?YjlCd3NrMjRhWU5nZzVaVWVxb3JJODQzVUo1U0Q4T0NGelpkM2xkTkFwbjNu?=
 =?utf-8?B?NUJLTGlYZWNKellZaEhTY3lDK3ZkL3gvWXErYlVmdUJkTDVmUHNMaUluYzB1?=
 =?utf-8?B?K2FUem8wWGpkQ1hQRHgzRDBYSTVsaGlwNEhoM3E4RGpMZkpad1VsQUZraVBt?=
 =?utf-8?B?MXBMb0ZMN3RWSzFCT2NITkdwYnJUVjZ5L2syRkFxdlVZSUJBZ1JkSGU5bFRr?=
 =?utf-8?B?MW5lczVmOHpneVdmUkh4MEN6ckNmbWdYTktVbUxsaUk0M29QSUJ6VFB1VEx0?=
 =?utf-8?B?Yk5MV2c1d00wREwzUG1lWEZBeGF3OERzRjY2aGdsTWFUQnA3dXdqM0ZNY25n?=
 =?utf-8?B?WlFud2w5Mm1zNGd1VUY5ak9BZlNVZzlrZytOL1JDOEFpa0RhcFp6MFpFVXBX?=
 =?utf-8?B?b2VkMUFRb1BNcFRYMFY2REpYQ3JjNmRDdWVXNE1hRmNhTWZBTnpKc1doME1J?=
 =?utf-8?B?SmR2MVd0TWNOWW1kdkRxdFJuSHVtRE1rREhvSE1NbE1tQkp3dWNrYkxobGhP?=
 =?utf-8?B?OXgzRGw5MGUwTStJSkFkOU52Z1FsR2QxNkpxMERlVFNjWjk1VmxzQ1BvbHNh?=
 =?utf-8?B?b0MyK25DeGFUWEF0ei9xMVZuOTdPVy9xY1l1QmhXWnFzZzhtUTlmR2ljK3Q2?=
 =?utf-8?B?T3JSZEF4L0M5Um9UaElPR0oydXM2ZmtKdXpQNmxrQnBnUWkvT25idFlCNVgv?=
 =?utf-8?B?TUROTWgyNFNFcmZYUm5GMnVQMXhzakd3dERLVmNxVDNwOWhaQk5vMml2d3RF?=
 =?utf-8?B?aXVOSDUzYWhOSGVMVFhPdHdtM0hJaUNwKzhxVFVES3VnUVh5blBHMXRkL1hx?=
 =?utf-8?B?YXNPRDAxT01EWFg5Ujh3VldNd25TU0w2R1V2eVJENFhWVGF2UDF0cDRZT0tp?=
 =?utf-8?B?Z2luaXRkalMxM1Bzb1JsNGpXTFdxTjE0ZzZFTUQ2TVB1YXkzUHBTZGVXaHhw?=
 =?utf-8?B?YlhwbHdvaU5zOXVHeWNPQ3ZlT0NLWW1TcjBPNm9NcEVnaWJvNUhGSC9aRmo0?=
 =?utf-8?B?SWZXVkE0WkRmUzlIb2tZeDlQb1BPR2Rqek9vUFpuTkZTZ0NWYnpHRy9PRVRn?=
 =?utf-8?B?aHh2Ly8yTnpBR0hvTGtCbEZ5NU5rbEc1RVFTY0pqWmVrYm5lcFNWUyt6cTJ4?=
 =?utf-8?B?TktudjhtMThDRHN6RHFuL09taDA1K1VxMStIdzRERFNNNllnSjZNazhGQW42?=
 =?utf-8?B?T0dvWlNDdFN1TEE0Zi9CdUZxTlYwV1UycGh5cGxLdmw0UXE3dEh5NXM3bEVT?=
 =?utf-8?B?Ly9uMHB1bW1GaktOZUxBdEpPUk9TVmRwVlBmL2p0V1dPVHU1bGRHbzVxUTdt?=
 =?utf-8?B?UXY5NFVaL2J6V0pQYXJsTlY3cSt6WE5tUklDc1o1UEFwejN0dGNtWTRJcFMw?=
 =?utf-8?B?WkhBQy9wK2oyeHFnQVpmc2Z4OWQrQ3VMY0xtd2JPS2hUMmtIYkQzVE1IdkJr?=
 =?utf-8?B?Sk8xa3EzNWRmMWRveGd2MnlnWEtZVGRmYkV4OE5KSWZvajlPSENiWHIrUnEw?=
 =?utf-8?Q?EkjErW4+ROBdMRiWyw2cVbMuif2ciStVA0RGqTB28KYt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720e633b-970f-4241-72ac-08da85e21998
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 15:05:36.6120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRugby8RJfTfKTuF7noaJ7/IU6IubTY2B6KF0ntuBkUmXhrzZbP2KhtZXNPRJJv2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2992
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------lnLqm2hSVVO5qD9tI0zROBzt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 24.08.22 um 16:47 schrieb Jason Ekstrand:
> On Mon, Aug 8, 2022 at 11:39 AM Jason Ekstrand 
> <jason.ekstrand@collabora.com> wrote:
>
>     On Sun, 2022-08-07 at 18:35 +0200, Christian König wrote:
>     > Am 02.08.22 um 23:01 schrieb Jason Ekstrand:
>     > > Ever since 68129f431faa ("dma-buf: warn about containers in
>     > > dma_resv object"),
>     > > dma_resv_add_shared_fence will warn if you attempt to add a
>     > > container fence.
>     > > While most drivers were fine, fences can also be added to a
>     > > dma_resv via the
>     > > recently added DMA_BUF_IOCTL_IMPORT_SYNC_FILE. Use
>     > > dma_fence_unwrap_for_each
>     > > to add each fence one at a time.
>     > >
>     > > Fixes: 594740497e99 ("dma-buf: Add an API for importing sync files
>     > > (v10)")
>     > > Signed-off-by: Jason Ekstrand <jason.ekstrand@collabora.com>
>     > > Reported-by: Sarah Walker <Sarah.Walker@imgtec.com>
>     > > Cc: Christian König <christian.koenig@amd.com>
>     > > ---
>     > >   drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++------
>     > >   1 file changed, 17 insertions(+), 6 deletions(-)
>     > >
>     > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>     > > index 630133284e2b..8d5d45112f52 100644
>     > > --- a/drivers/dma-buf/dma-buf.c
>     > > +++ b/drivers/dma-buf/dma-buf.c
>     > > @@ -15,6 +15,7 @@
>     > >   #include <linux/slab.h>
>     > >   #include <linux/dma-buf.h>
>     > >   #include <linux/dma-fence.h>
>     > > +#include <linux/dma-fence-unwrap.h>
>     > >   #include <linux/anon_inodes.h>
>     > >   #include <linux/export.h>
>     > >   #include <linux/debugfs.h>
>     > > @@ -391,8 +392,10 @@ static long dma_buf_import_sync_file(struct
>     > > dma_buf *dmabuf,
>     > >                                      const void __user *user_data)
>     > >   {
>     > >         struct dma_buf_import_sync_file arg;
>     > > -       struct dma_fence *fence;
>     > > +       struct dma_fence *fence, *f;
>     > >         enum dma_resv_usage usage;
>     > > +       struct dma_fence_unwrap iter;
>     > > +       unsigned int num_fences;
>     > >         int ret = 0;
>     > >
>     > >         if (copy_from_user(&arg, user_data, sizeof(arg)))
>     > > @@ -411,13 +414,21 @@ static long dma_buf_import_sync_file(struct
>     > > dma_buf *dmabuf,
>     > >         usage = (arg.flags & DMA_BUF_SYNC_WRITE) ?
>     > > DMA_RESV_USAGE_WRITE :
>     > >
>     > > DMA_RESV_USAGE_READ;
>     > >
>     > > -       dma_resv_lock(dmabuf->resv, NULL);
>     > > +       num_fences = 0;
>     > > +       dma_fence_unwrap_for_each(f, &iter, fence)
>     > > +               ++num_fences;
>     > >
>     > > -       ret = dma_resv_reserve_fences(dmabuf->resv, 1);
>     > > -       if (!ret)
>     > > -               dma_resv_add_fence(dmabuf->resv, fence, usage);
>     > > +       if (num_fences > 0) {
>     > > +               dma_resv_lock(dmabuf->resv, NULL);
>     > >
>     > > -       dma_resv_unlock(dmabuf->resv);
>     > > +               ret = dma_resv_reserve_fences(dmabuf->resv,
>     > > num_fences);
>     >
>     > That looks like it is misplaced.
>     >
>     > You *must* only lock the reservation object once and then add all
>     > fences
>     > in one go.
>
>     That's what I'm doing.  Lock, reserve, add a bunch, unlock. I am
>     assuming that the iterator won't suddenly want to iterate more fences
>     between my initial count and when I go to add them but I think that
>     assumption is ok.
>
>
> Bump.  This has been sitting here for a couple of weeks. I still don't 
> see the problem.

I've send you a patch for a bug fix in the dma_resv object regarding this.

Apart from that I've just seen that I miss read the code a bit, didn't 
realized that there where two loops with dma_fence_unwrap_for_each().

Regards,
Christian.

>
> --Jason
>
>     --Jason
>
>
>     > Thinking now about it we probably had a bug around that before as
>     > well.
>     > Going to double check tomorrow.
>     >
>     > Regards,
>     > Christian.
>     >
>     > > +               if (!ret) {
>     > > +                       dma_fence_unwrap_for_each(f, &iter, fence)
>     > >
>     +                               dma_resv_add_fence(dmabuf->resv, f,
>     > > usage);
>     > > +               }
>     > > +
>     > > +               dma_resv_unlock(dmabuf->resv);
>     > > +       }
>     > >
>     > >         dma_fence_put(fence);
>     > >
>     >
>

--------------lnLqm2hSVVO5qD9tI0zROBzt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 24.08.22 um 16:47 schrieb Jason Ekstrand:<br>
    <blockquote type="cite" cite="mid:CAOFGe96pKaiH85ReT6y_V4vCKQjXz_hf2O7mqG89aiKXoFiF1w@mail.gmail.com">
      
      <div dir="ltr">
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, Aug 8, 2022 at 11:39
            AM Jason Ekstrand &lt;<a href="mailto:jason.ekstrand@collabora.com" moz-do-not-send="true" class="moz-txt-link-freetext">jason.ekstrand@collabora.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">On Sun, 2022-08-07 at
            18:35 +0200, Christian König wrote:<br>
            &gt; Am 02.08.22 um 23:01 schrieb Jason Ekstrand:<br>
            &gt; &gt; Ever since 68129f431faa (&quot;dma-buf: warn about
            containers in<br>
            &gt; &gt; dma_resv object&quot;),<br>
            &gt; &gt; dma_resv_add_shared_fence will warn if you attempt
            to add a<br>
            &gt; &gt; container fence.<br>
            &gt; &gt; While most drivers were fine, fences can also be
            added to a<br>
            &gt; &gt; dma_resv via the<br>
            &gt; &gt; recently added DMA_BUF_IOCTL_IMPORT_SYNC_FILE.&nbsp;
            Use<br>
            &gt; &gt; dma_fence_unwrap_for_each<br>
            &gt; &gt; to add each fence one at a time.<br>
            &gt; &gt; <br>
            &gt; &gt; Fixes: 594740497e99 (&quot;dma-buf: Add an API for
            importing sync files<br>
            &gt; &gt; (v10)&quot;)<br>
            &gt; &gt; Signed-off-by: Jason Ekstrand &lt;<a href="mailto:jason.ekstrand@collabora.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">jason.ekstrand@collabora.com</a>&gt;<br>
            &gt; &gt; Reported-by: Sarah Walker &lt;<a href="mailto:Sarah.Walker@imgtec.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">Sarah.Walker@imgtec.com</a>&gt;<br>
            &gt; &gt; Cc: Christian König &lt;<a href="mailto:christian.koenig@amd.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;<br>
            &gt; &gt; ---<br>
            &gt; &gt; &nbsp; drivers/dma-buf/dma-buf.c | 23
            +++++++++++++++++------<br>
            &gt; &gt; &nbsp; 1 file changed, 17 insertions(+), 6 deletions(-)<br>
            &gt; &gt; <br>
            &gt; &gt; diff --git a/drivers/dma-buf/dma-buf.c
            b/drivers/dma-buf/dma-buf.c<br>
            &gt; &gt; index 630133284e2b..8d5d45112f52 100644<br>
            &gt; &gt; --- a/drivers/dma-buf/dma-buf.c<br>
            &gt; &gt; +++ b/drivers/dma-buf/dma-buf.c<br>
            &gt; &gt; @@ -15,6 +15,7 @@<br>
            &gt; &gt; &nbsp; #include &lt;linux/slab.h&gt;<br>
            &gt; &gt; &nbsp; #include &lt;linux/dma-buf.h&gt;<br>
            &gt; &gt; &nbsp; #include &lt;linux/dma-fence.h&gt;<br>
            &gt; &gt; +#include &lt;linux/dma-fence-unwrap.h&gt;<br>
            &gt; &gt; &nbsp; #include &lt;linux/anon_inodes.h&gt;<br>
            &gt; &gt; &nbsp; #include &lt;linux/export.h&gt;<br>
            &gt; &gt; &nbsp; #include &lt;linux/debugfs.h&gt;<br>
            &gt; &gt; @@ -391,8 +392,10 @@ static long
            dma_buf_import_sync_file(struct<br>
            &gt; &gt; dma_buf *dmabuf,<br>
            &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const void
            __user *user_data)<br>
            &gt; &gt; &nbsp; {<br>
            &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct dma_buf_import_sync_file arg;<br>
            &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct dma_fence *fence;<br>
            &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct dma_fence *fence, *f;<br>
            &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;enum dma_resv_usage usage;<br>
            &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct dma_fence_unwrap iter;<br>
            &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int num_fences;<br>
            &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int ret = 0;<br>
            &gt; &gt; &nbsp; <br>
            &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (copy_from_user(&amp;arg, user_data,
            sizeof(arg)))<br>
            &gt; &gt; @@ -411,13 +414,21 @@ static long
            dma_buf_import_sync_file(struct<br>
            &gt; &gt; dma_buf *dmabuf,<br>
            &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;usage = (arg.flags &amp;
            DMA_BUF_SYNC_WRITE) ?<br>
            &gt; &gt; DMA_RESV_USAGE_WRITE :<br>
            &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
            &gt; &gt; DMA_RESV_USAGE_READ;<br>
            &gt; &gt; &nbsp; <br>
            &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dma_resv_lock(dmabuf-&gt;resv, NULL);<br>
            &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;num_fences = 0;<br>
            &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dma_fence_unwrap_for_each(f, &amp;iter,
            fence)<br>
            &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;++num_fences;<br>
            &gt; &gt; &nbsp; <br>
            &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret =
            dma_resv_reserve_fences(dmabuf-&gt;resv, 1);<br>
            &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!ret)<br>
            &gt; &gt;
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dma_resv_add_fence(dmabuf-&gt;resv, fence,
            usage);<br>
            &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (num_fences &gt; 0) {<br>
            &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dma_resv_lock(dmabuf-&gt;resv,
            NULL);<br>
            &gt; &gt; &nbsp; <br>
            &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dma_resv_unlock(dmabuf-&gt;resv);<br>
            &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret =
            dma_resv_reserve_fences(dmabuf-&gt;resv,<br>
            &gt; &gt; num_fences);<br>
            &gt; <br>
            &gt; That looks like it is misplaced.<br>
            &gt; <br>
            &gt; You *must* only lock the reservation object once and
            then add all<br>
            &gt; fences <br>
            &gt; in one go.<br>
            <br>
            That's what I'm doing.&nbsp; Lock, reserve, add a bunch, unlock.&nbsp;
            I am<br>
            assuming that the iterator won't suddenly want to iterate
            more fences<br>
            between my initial count and when I go to add them but I
            think that<br>
            assumption is ok.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Bump.&nbsp; This has been sitting here for a couple of weeks.&nbsp;
            I still don't see the problem.</div>
        </div>
      </div>
    </blockquote>
    <br>
    I've send you a patch for a bug fix in the dma_resv object regarding
    this.<br>
    <br>
    Apart from that I've just seen that I miss read the code a bit,
    didn't realized that there where two loops with
    dma_fence_unwrap_for_each().<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CAOFGe96pKaiH85ReT6y_V4vCKQjXz_hf2O7mqG89aiKXoFiF1w@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>--Jason<br>
          </div>
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            --Jason<br>
            <br>
            <br>
            &gt; Thinking now about it we probably had a bug around that
            before as<br>
            &gt; well. <br>
            &gt; Going to double check tomorrow.<br>
            &gt; <br>
            &gt; Regards,<br>
            &gt; Christian.<br>
            &gt; <br>
            &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!ret) {<br>
            &gt; &gt;
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dma_fence_unwrap_for_each(f,
            &amp;iter, fence)<br>
            &gt; &gt;
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dma_resv_add_fence(dmabuf-&gt;resv,
            f,<br>
            &gt; &gt; usage);<br>
            &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>
            &gt; &gt; +<br>
            &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dma_resv_unlock(dmabuf-&gt;resv);<br>
            &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>
            &gt; &gt; &nbsp; <br>
            &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dma_fence_put(fence);<br>
            &gt; &gt; &nbsp; <br>
            &gt; <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------lnLqm2hSVVO5qD9tI0zROBzt--

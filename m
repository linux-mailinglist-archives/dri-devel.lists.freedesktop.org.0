Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FA41BDA19
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 12:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E846EDE9;
	Wed, 29 Apr 2020 10:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392A36EAAD
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 10:50:52 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200429105050euoutp019a47e90bb54ffc64e07c69012ba4992c~KRMluJCSb1860818608euoutp01H
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 10:50:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200429105050euoutp019a47e90bb54ffc64e07c69012ba4992c~KRMluJCSb1860818608euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588157450;
 bh=P3dN9UfZjsE04XLpG+GBXIoph9+0n1rWBNt4DS13DXY=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=Ls1GMVXzcEkVPlhU58bqnrSlx+AgutJ5EMoQnCqCBLgJSWMlXZQ0Jl0v+7uzPLkUt
 FK3xKsh6Q9vjPPe3xvKc08/bri2mL1FX95JeZpOalZneKBrEKpXSItdvs4Y9y1bwbs
 1B86C7yu1h9NGJeKoqL5PWNuZGIST/MpqjX/+JEA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200429105050eucas1p255222f9edd0e6905c93b64b252fbe1a6~KRMlowV7c1748417484eucas1p2X;
 Wed, 29 Apr 2020 10:50:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 40.5E.60698.A0C59AE5; Wed, 29
 Apr 2020 11:50:50 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200429105049eucas1p1261bfce217bfceb824655d0e6bf62b24~KRMlMZLPW2632526325eucas1p1T;
 Wed, 29 Apr 2020 10:50:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200429105049eusmtrp28fb72971645c1040db23a49e5ae2fb3d~KRMlLwOvS2358123581eusmtrp2N;
 Wed, 29 Apr 2020 10:50:49 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-92-5ea95c0a6130
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 75.5A.08375.90C59AE5; Wed, 29
 Apr 2020 11:50:49 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200429105049eusmtip216c467f0823a367b2143dde432932865~KRMk18JgV2417624176eusmtip2N;
 Wed, 29 Apr 2020 10:50:49 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <cc1dc009-c122-0405-ced5-ede952afe574@samsung.com>
Date: Wed, 29 Apr 2020 12:50:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <997e83ad-1966-6ebd-13d1-05617b67b7f8@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsWy7djPc7pcMSvjDI7OEbNY+PAus8WVr+/Z
 LGZP2MxkcXnXHDaLgwvbGC1W/NzKaLF171V2B3aPxhs32Dz2flvA4nG/+ziTx5JpV9k8Pm+S
 C2CN4rJJSc3JLEst0rdL4Mp4Pzeh4CNvxcbpl1kaGKdxdzFyckgImEhMXH2VuYuRi0NIYAWj
 xK/ur6wQzhdGiek9/6EynxklDt78ygjTsujfDXaIxHJGiSOzjrBAOG8ZJc7cbGQFqWITsJKY
 2L4KrENYwF3i+I9GJhBbRMBHYtOyn2DdzAI/GSW+bzgHluAVsJP4/3QiG4jNIqAq8aZjOjuI
 LSoQIfHpwWFWiBpBiZMzn7CA2JwC9hL7nhwAq2cWMJA4smgOK4QtLnHryXwmCFteYvvbOWA/
 SAhsY5foWLEPqJkDyHGR+DC/HOIdYYlXx7ewQ9gyEv93gvSC1K9jlPjb8QKqeTujxPLJ/9gg
 qqwl7pz7BWU7Sqy8cxhqKJ/EjbeCEIv5JCZtm84MEeaV6GgTgqhWk9iwbAMbzK6unSuZJzAq
 zULy2iwk78xC8s4sJO8sYGRZxSieWlqcm55abJyXWq5XnJhbXJqXrpecn7uJEZiITv87/nUH
 474/SYcYBTgYlXh4N/CsiBNiTSwrrsw9xCjBwawkwvsoY1mcEG9KYmVValF+fFFpTmrxIUZp
 DhYlcV7jRS9jhQTSE0tSs1NTC1KLYLJMHJxSDYzT7VIu/fTPPTaf9erlByH7jj/5Urzy4QnT
 3XFh1XMFFseoK19aua38nY2J1y6zGbHpS+svMYdfc5V6MoshQPbxquavJ7M/Rq7M3Fxn7P3p
 6sqTn/hZXico7N3zTiCRm2FJ3JEJtk1/vnt9rjyqtnreqhZ1raw/OwUu/VoobVU9bcM1Nq0o
 verFSizFGYmGWsxFxYkAvPJ2VUADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRmVeSWpSXmKPExsVy+t/xe7qcMSvjDJafNrNY+PAus8WVr+/Z
 LGZP2MxkcXnXHDaLgwvbGC1W/NzKaLF171V2B3aPxhs32Dz2flvA4nG/+ziTx5JpV9k8Pm+S
 C2CN0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mt4
 Pzeh4CNvxcbpl1kaGKdxdzFyckgImEgs+neDvYuRi0NIYCmjxKy/e4EcDqCEjMTx9WUQNcIS
 f651sUHUvGaUOLz/BxNIgk3ASmJi+ypGEFtYwF3i+I9GsLiIgI/EpmU/wYYyC/xmlFh/fBJU
 9xtGiQ1/X7OCVPEK2En8fzqRDcRmEVCVeNMxnR3EFhWIkDi8YxYjRI2gxMmZT1hAbE4Be4l9
 Tw6A1TML6EnsuP6LFcIWl7j1ZD4ThC0vsf3tHOYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW
 56bnFhvqFSfmFpfmpesl5+duYgRG3bZjPzfvYLy0MfgQowAHoxIP7waeFXFCrIllxZW5hxgl
 OJiVRHgfZSyLE+JNSaysSi3Kjy8qzUktPsRoCvTcRGYp0eR8YELIK4k3NDU0t7A0NDc2Nzaz
 UBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAmFoQnK+6NkjyTkyDxXxGW9vPolPXZIXs6Lu3
 hM10Y4On18eOkFtbdj7rLuuzW2f/kfHQ+y2ZFoX7TmbsOhd9gn/Fjkr9b0vcpzyfpft1+WJG
 U8mvyd0+J56UHch+pHmGa87UZS+0Nwsd3ZlS8PfBW/18366YG5c9YorPGKb6uTGkGrwq0mJz
 UmIpzkg01GIuKk4EAKqXnJDQAgAA
X-CMS-MailID: 20200429105049eucas1p1261bfce217bfceb824655d0e6bf62b24
X-Msg-Generator: CA
X-RootMTR: 20200428223343eucas1p1ef3e4998b8063ade8b456611e39b7865
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200428223343eucas1p1ef3e4998b8063ade8b456611e39b7865
References: <20200420130118.7a866fd5@canb.auug.org.au>
 <CGME20200428223343eucas1p1ef3e4998b8063ade8b456611e39b7865@eucas1p1.samsung.com>
 <20200429083329.30ff39a1@canb.auug.org.au>
 <997e83ad-1966-6ebd-13d1-05617b67b7f8@samsung.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/29/20 10:09 AM, Bartlomiej Zolnierkiewicz wrote:
> 
> Hi Stephen,
> 
> On 4/29/20 12:33 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> On Mon, 20 Apr 2020 13:01:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> After merging the drm-misc tree, today's linux-next build (powerpc
>>> allyesconfig) failed like this:
>>>
>>> drivers/video/fbdev/controlfb.c: In function 'controlfb_mmap':
>>> drivers/video/fbdev/controlfb.c:756:23: error: implicit declaration of function 'pgprot_cached_wthru'; did you mean 'pgprot_cached'? [-Werror=implicit-function-declaration]
>>>   756 |   vma->vm_page_prot = pgprot_cached_wthru(vma->vm_page_prot);
>>>       |                       ^~~~~~~~~~~~~~~~~~~
>>>       |                       pgprot_cached
>>> drivers/video/fbdev/controlfb.c:756:23: error: incompatible types when assigning to type 'pgprot_t' {aka 'struct <anonymous>'} from type 'int'
>>>
>>> Presumably exposed by commit
>>>
>>>   a07a63b0e24d ("video: fbdev: controlfb: add COMPILE_TEST support")
>>>
>>> I just turned off COMPILE_TEST again for today.  Please let me know when
>>> this is fixed.
>>
>> This still appears to have not been addressed.
> 
> Sorry for the delay, I've just posted a patch (also included below):
> 
> "[PATCH] video: fbdev: controlfb: fix build for COMPILE_TEST=y && PPC_PMAC=y && PPC32=n"
> 
> which should fix it.
> 
> Please verify it, thank you!

I have tested it with powerpc allyesconfig now and it adds one dependency too much,
fixed in v2:

https://lore.kernel.org/lkml/fe520316-3863-e6c4-9581-5d709f49e906@samsung.com/

Sam, could you please review / merge it to drm-misc-next?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

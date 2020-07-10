Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A721B85E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 16:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86F56EC62;
	Fri, 10 Jul 2020 14:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBAC6EC60
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:23:34 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710142333euoutp0197f5867ab7ceca3fecd4392dff621c8b~gai3NqKSA3221032210euoutp01J
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:23:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200710142333euoutp0197f5867ab7ceca3fecd4392dff621c8b~gai3NqKSA3221032210euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594391013;
 bh=+3zrfGka66d8Hd1/8bYv4IkeX40VaRFQ9+pPGfGJkGs=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=Xmnc3+xLoBrfnTUoRBvgCbMEPPwrox8u4xQAEONMD2VXxWUvooLuXYb5OlWk32v8F
 nr8qbc5pKxljiL63lNEFGFeClpdI5h+UixK5uFkh2vP1fyc34gJwW4m3OFiiExuHYO
 vI8BGcZtOHkhPLtqmYuszsaiXxAhk2AHpfIODet4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200710142332eucas1p15a4aa527426e52114579e7507240f26f~gai2u74mn2374123741eucas1p14;
 Fri, 10 Jul 2020 14:23:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 1E.CE.06318.4E9780F5; Fri, 10
 Jul 2020 15:23:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200710142332eucas1p15870cc15353d0737023e0e0965b6ae9a~gai2aXWqS2365323653eucas1p1z;
 Fri, 10 Jul 2020 14:23:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200710142332eusmtrp26f29957ca3ca53bd22b228429eb0f1e8~gai2Zy_8j1267512675eusmtrp2Q;
 Fri, 10 Jul 2020 14:23:32 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-04-5f0879e4337f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1B.61.06017.4E9780F5; Fri, 10
 Jul 2020 15:23:32 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200710142331eusmtip1e267bb2b7ed07fc124518b26e2b17b46~gai2FjTAU2913329133eusmtip1Z;
 Fri, 10 Jul 2020 14:23:31 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 2/2] video: fbdev: amifb: add FIXMEs about
 {put,get}_user() failures
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <cab5be13-a7df-7765-bb6e-b6302253c1fb@samsung.com>
Date: Fri, 10 Jul 2020 16:23:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVYuk9+=3OTufOo98Dd3ijXS6JBH9RqK2v+9mwogxbnXA@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjmO2fneBzOjtPyZV6ChUGBmtmPoWUlSqP+aPSjArOVJye6Ked4
 Wz/EgmwolF2kXOKsqHlpOUU0FypNbcrSjHWR0cVolRdmMzNYecntKPnved73eb73eeCjcLGB
 kFA56kKGVSvypKRQ0PncMxrt1FCZu1aeRcheL/wgZd8cPZhs6IqbkNnNdaTM4DTispdLVuIA
 Kbf0a5H8U5UVkw9f+i2Qz7dHytudLiyNOCncm8Xk5RQzbGzSaaHy/vRNokBPlLptWr9y1Cao
 RP4U0Htg5vt9shIJKTHdiKDa+IHgyS8ElrlGnCfzCFrfPCDWLWaDDeMXBgSTVx0CnrgQ2O19
 pFdF0glw7XIz8uJgOgMaemtXn6KoEDoa6jw+M05fxMDY0YZ7NSI6Cd7qJ3x6AR0FF6YafXgz
 fRx+TvQTvCYIhmudvuD+dDqMdJp8XpwOBYdTj/F4K3S56nyxgW72g8nxWZKPnQJV7kc4j4Nh
 2trhx+NwWOnWY7zhMYIl7eSauwuB4cbymjsR3o/+Ib0VcHoHtJpj+fFBeDE2hXnHQAfCuCuI
 DxEI1ztv4fxYBNoKMa/eDqaHJnL9bGV3E16NpLoN1XQb6ug21NH9v9uABM0olCniVNkMF69m
 SmI4hYorUmfHnM1XtaPV72Nbti48Qb2LZyyIppA0QNSgoDLFhKKY06gsCChcGiJKHrGdEouy
 FJrzDJufyRblMZwFhVECaago/t5UhpjOVhQyuQxTwLDrW4zyl5SjxJajNTUWkaQ+NVkyUlKW
 bjhRX29z7f4cNpCwL+DcR9MRxmMO7LOuRNu3DQbFiQ6ljc1hLZaa2zlNUUt3Zre8Oya7G+me
 WfCU/GUrlNWl/WhTubLwa8/g0JfDZuOiA3WHh8SbbKkDBWWpysSqXC0Jr0wRAQMpTzUe434p
 GyMVcEpF3E6c5RT/AOEqtZw6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsVy+t/xu7pPKjniDbpWcFpc+fqezeLZrb1M
 Fif6PrBaXN41h81i+ZO1zBbn/x5ndWDzOHS4g9HjfvdxJo+Trd9YPD5vkvPY9OQtUwBrlJ5N
 UX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G4ldTWAvm
 s1Z8ON3B3sC4kaWLkZNDQsBEYtfy00xdjFwcQgJLGSWefloK5HAAJWQkjq8vg6gRlvhzrYsN
 ouY1o8Sn7qvMIAk2ASuJie2rGEFsYYFYiQX7ZjKD9IoI6ErM+ckEEmYWaGGSWPxFB6J3BpPE
 xhMz2EESvAJ2EtfmPwDrZRFQlWh8uQLMFhWIkDi8YxYjRI2gxMmZT8AO5RQIlDi7bQMzxFB1
 iT/zLkHZ4hK3nsyHWiYvsf3tHOYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvpFSfm
 Fpfmpesl5+duYgRG2rZjP7fsYOx6F3yIUYCDUYmHd0EiR7wQa2JZcWXuIUYJDmYlEV6ns6fj
 hHhTEiurUovy44tKc1KLDzGaAj03kVlKNDkfmATySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJ
 pCeWpGanphakFsH0MXFwSjUwdqemBgQZ+k4Tn/uh5adB8JKQj0u/ZmaILT7YuvHcmZdB2TnF
 0eZGb7JWHBK4rb8+lEFA8vnm+II/ujMkTp+c1/DqpPbhuIJly//4Guo9D68LLNK8LRUhtvun
 hhtXUM+lis6p8XNCVi9c+k8yuujW+SUHjRME0va8DEyTXLP03AVmBsZHrU6WSizFGYmGWsxF
 xYkAHAtgisoCAAA=
X-CMS-MailID: 20200710142332eucas1p15870cc15353d0737023e0e0965b6ae9a
X-Msg-Generator: CA
X-RootMTR: 20200504232908eucas1p296927bc7c736ad924cefaea9a546459d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200504232908eucas1p296927bc7c736ad924cefaea9a546459d
References: <CGME20200504232908eucas1p296927bc7c736ad924cefaea9a546459d@eucas1p2.samsung.com>
 <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
 <380c0494-ed02-b2be-65b0-d385627fb894@samsung.com>
 <CAMuHMdVYuk9+=3OTufOo98Dd3ijXS6JBH9RqK2v+9mwogxbnXA@mail.gmail.com>
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
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/2/20 2:03 PM, Geert Uytterhoeven wrote:
> On Tue, Jun 2, 2020 at 1:52 PM Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
>> Since we lack the hardware (or proper emulator setup) for
>> testing needed changes add FIXMEs to document the issues
>> (so at least they are not forgotten).
>>
>> Cc: Al Viro <viro@zeniv.linux.org.uk>
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Applied to drm-misc-next tree.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

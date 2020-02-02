Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF39150254
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25966EB4C;
	Mon,  3 Feb 2020 08:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FD26E595;
 Sun,  2 Feb 2020 00:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1580602565;
 bh=Iz6JnGq++RMIHsnw+FCQtg3vRLAqepeZ+BGIjR4JFrg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:References:Date:In-Reply-To;
 b=L8wlQXKntARNcKFFfwBJh+0xPAOUQs1/q5LBfpyJmlgBMyvhJaapsylinE2lAYS0S
 5JakKh3cg8/ZvcsCO0AMX+uVxkm033aoDBq1OOmtZo3H1Z3CgyVcjwTeqE/y8rDzLG
 B+gBh6USNNyQwYXtg4cfe2g8MAL880wzQjYdwqHc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from chef ([212.114.254.236]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5rU-1jBISj0fNQ-00M06l; Sun, 02
 Feb 2020 01:16:05 +0100
From: Julian Sax <jsbc@gmx.de>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] drm/amdkfd: Make process queues logs less verbose
References: <20200201231101.2127964-1-jsbc@gmx.de>
 <b9b671508d478469c1ad43206dd29d770bfb7818.camel@perches.com>
Date: Sun, 02 Feb 2020 01:14:46 +0100
In-Reply-To: <b9b671508d478469c1ad43206dd29d770bfb7818.camel@perches.com> (Joe
 Perches's message of "Sat, 01 Feb 2020 15:37:43 -0800")
Message-ID: <87lfpl4zgp.fsf@chef>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Provags-ID: V03:K1:XjKgjo79yS+CkYFZyTj8MqnkUUEbS8HMXP9NflgFBKb9W2PPEDF
 weuvBWkVjtKfrd21VgGpBZyxTSpanfQKcEdTRev4+VPYFz3h1hkTruiVbpuUcg0c+5Ah1mk
 N6MuAW3+dOSqp360Z7kTxr66j6wyGT+pxn2sC7qAMaGJCPkwIjRJ3KjRRYyaj6Fo+ateOx7
 fFhIWVGSvfDfDAwOjJVXw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jv17eHekCmY=:WvngTvut/2R2v8Wi/rxAi7
 8wEY/UPppVYO4XdOjeNZy1sgoRb4QgA1v27t6CUhiC9egpSBDe2zmCuU70sga3ntGrPJcwcD4
 lxVE2f44Gv2eFJkeXtmbXURHYkO8vUE+RIlMWVWxp4/ha1kljK4RBLq4RZcac/PY+DVVszvt1
 ufwLl0BZrBmBT6/a5UcHvrsVREgx0TLTNUB3BndHzXs6niAVTTal5DPF2u9ZK8xlK1Zxor6go
 L6tSs5vatLQ1Wbs9/eL+O80vJxhOvksMHjuH4s3FNWQM9deiAEQiffBF3LWpNpm/vSyS4eslJ
 CgLaLOKazHAl/C5LR1ePjkBTsb2TfDgx//ualRo9kYaXWm0OVlOvbVt2miWYhWABzxnZjP3dG
 a4b5uJCfR36XfxAiiBIJdiumNCgrfWF5l2RxohjSNsLdxZG7O9AdV7jP+42JfSyHRnV1DGcpm
 nvM41IwnR/VCog4qv4qR/sfmW1m4INremGiemtkeMjz8seuJq+D5mP2jC/1rJ1Zq2d40T5KBc
 BXJUnHK/vpqYWuD1t3GX8gINLTdahNcGQnki/5gT3LTFdesySPLOglIzTD/b9sjHFe0bHb7+9
 bfX5f5fre55Vx7KERbCZ+q4Jir2/r5uHORYiRphsst9KNe0pGr6jqjRkdlE3Z4i2IlGPezQdw
 Loyl5pnUJN2rkKeLJuQ9wy6lzFgW2dyOXM3GJImrPias5ZgWysTSVIuTyybwpvDcGa34uANat
 2ehWFPOPOFQ2YK6isyiyrmAdA3HPa8q6FIC41qsKSG51prgjXYGf9KiwDZesCyvs7zkdoIxuo
 Lf7cQ1TAjc5nY8tzuwvO5mzF5OfExnnIm9Q/1PBGpacHHW5sdxOIH3lAPQdmZ9zd9tSy9t+6y
 qSXnzzldH++Rc76WK4qsYlFYs5gjsHy0LqrrMRj/Vt/sWGXws+HHWEmqtmCOQtHVOgdEr5HiT
 fpcvIYwNiOsVs2vpjXuaZPLWfNt2qkWDRy25WsMdlSSIcScddVUGcZlOV31zNJ3NF4pHOPMfE
 Z9hb52jAyljGC8YHxEWHH/GJB5ralt8gmorDtivWWpqOJ1yX51uzWKWDY6Qv3EuhLDnYSH3T7
 UUkhrWVvId7DYddMKxvvW9IJVjbf8aZcqeCTwSin0M0kN70ylHxZS2io9X0c1wEP9HULxq+Ws
 Pjqzo4bKEI/+BSmRLQIjdZGzftiC0bEfWY8wARX0SUjHRHRhY2xWRBbsiiM4fhdDB8bOU=
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:10:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6ni?= =?utf-8?Q?g?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Joe Perches <joe@perches.com> writes:

> On Sun, 2020-02-02 at 00:11 +0100, Julian Sax wrote:
>> During normal usage, especially if jobs are started and stopped in rapid
>> succession, the kernel log is filled with messages like this:
>>
>> [38732.522910] Restoring PASID 0x8003 queues
>> [38732.666767] Evicting PASID 0x8003 queues
>> [38732.714074] Restoring PASID 0x8003 queues
>> [38732.815633] Evicting PASID 0x8003 queues
>> [38732.834961] Restoring PASID 0x8003 queues
>> [38732.840536] Evicting PASID 0x8003 queues
>> [38732.869846] Restoring PASID 0x8003 queues
>> [38732.893655] Evicting PASID 0x8003 queues
>> [38732.927975] Restoring PASID 0x8003 queues
>>
>> According to [1], these messages are expected, but they carry little
>> value for the end user, so turn them into debug messages.
>>
>> [1] https://github.com/RadeonOpenCompute/ROCm/issues/343
>
> trivia:
>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> []
>> @@ -604,7 +604,7 @@ static int evict_process_queues_nocpsch(struct device_queue_manager *dqm,
>>  		goto out;
>>
>>  	pdd = qpd_to_pdd(qpd);
>> -	pr_info_ratelimited("Evicting PASID 0x%x queues\n",
>> +	pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
>>  			    pdd->process->pasid);
>
> It would be nicer to realign all the subsequent lines in a
> single statement to the now moved open parenthesis.
>
>>
>>  	/* Mark all queues as evicted. Deactivate all active queues on
>> @@ -650,7 +650,7 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
>>  		goto out;
>>
>>  	pdd = qpd_to_pdd(qpd);
>> -	pr_info_ratelimited("Evicting PASID 0x%x queues\n",
>> +	pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
>>  			    pdd->process->pasid);
>
> etc...

Yeah, absolutely, thanks for pointing that out. v2 coming shortly.

Julian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B814A1DB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 11:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6346EACD;
	Mon, 27 Jan 2020 10:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D143F6EACB;
 Mon, 27 Jan 2020 10:21:16 +0000 (UTC)
Received: from [192.168.242.100] ([93.200.87.82]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MA88C-1ikQwC11wY-00Bfbk; Mon, 27 Jan 2020 11:21:14 +0100
Subject: Re: [PATCH 0/5] drm/lima: add heap buffer support
To: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200116131157.13346-1-yuq825@gmail.com>
From: Andreas Baierl <list@imkreisrum.de>
Message-ID: <ba4969a0-4abf-9749-49a2-5b842544b95a@imkreisrum.de>
Date: Mon, 27 Jan 2020 11:21:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200116131157.13346-1-yuq825@gmail.com>
X-Provags-ID: V03:K1:XQIz0394wgCduvyF7CLAkeT3+1z2XZu9S9bV0brq9gfrxWhtTIr
 z0EpSrS0edBVrZCPEOQIzBmxd5aAnQIGSwfPs8gBLkH9230/Uuu1MonQWaA69atEKnqRHgm
 FUvwOJ5LmmDaf8I05BQY3QO1O0preY9TVJ9xeGPLbMu2XsZGdEhZBBfkVRw1FPDHqx0WdkQ
 1eIMKAwPIXgL21yiS9WfQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0D/lA+JOLD0=:LsaZsRBy6PTBEUmJrU2PSS
 fVboJPUE/u9Foaks9TKXHNDiJO+f9GZM4hOi7i1Ig6p40srPa1tDT25Ywf1/SA4qv/3MBWCtk
 EPTGBLl6rv3UdnvRDXzgmnSZmIYZVsUZpHApnte9qnqu0XuCKRaFuocW9lPDfN8Hd7hqPNF56
 bl/Tvry8k9S3E+T8MEZymW/UPdhlY7h43ScyOeYsY4Nqgsgc4x+8FCgQ4XtAJ8XL3i597Kzc/
 4vPlvk1zWIXof/LwIR9yCMQlcgXpmeWJ19QH9x8UX2gLOAVi80F/rfuPI4gcDxXWb52ipEGli
 PGnNWdsuKb6cTBPT1HIjzRFc8EmCLMnffaC6WgluJBfYQun3i39k4Dt81z/BrZmg+nYnEpkkQ
 5vXdvJboPrlZO8tZf556f8MMePzLnb0cAip2IjGOEjBt863MW2ALpqMIEZlx/SzvNTAg3R8KD
 tzEPr4dPspW5KcdNY2AHGUlpOTyrOmVTMRoL6qTkPBoyZcITe5EPahel9YoHQb5cctqKg7p6C
 19h7j29fEh5ajPQyFWYTUaGxc8hNy8yK+imh1TMSvxm5jcN/TdRUjXNYdOfxLN4tY745yVC7u
 Nn/QlZTInOCrJD/Pid99w+3Bl72hOSPaWy3er7pVfA877AS/NT5NzHSbbKz7YlVLgWAoArOV1
 t5a8pcSOUSqdhn60NFTEqEXOT7WdiXjguUWzPC8L++SvO5LUPw5pljgsroDkfKI0q/UreA1Kx
 CxQKrZVOkQJBoHeQIY3LeulpaWSLUNBEkjVyAdGlbn1P/4VD4CfJJK3OVQ28CJsyjLPD0MckZ
 Hq9SYdUU+I6lDxRQ+IbOcA8SUgHrxhModOtPUuo4OkttqY42mMvDrkYp0LAT8RvQXfGQXxD
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
Cc: David Airlie <airlied@linux.ie>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>, lima@lists.freedesktop.org,
 Andreas Baierl <ichgeh@imkreisrum.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.01.2020 um 14:11 schrieb Qiang Yu:
> Support heap buffer allocation which can grow the back memory
> size when GP has an out of memory interrupt so that user don't
> need to allocate a very large buffer at the beginning.
This was

Tested-by: Andreas Baierl <ichgeh@imkreisrum.de>

together with https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3264.
> Qiang Yu (5):
>    drm/lima: update register info
>    drm/lima: add lima_vm_map_bo
>    drm/lima: support heap buffer creation
>    drm/lima: recover task by enlarging heap buffer
>    drm/lima: increase driver version to 1.1
>
>   drivers/gpu/drm/lima/lima_drv.c   |  16 +++-
>   drivers/gpu/drm/lima/lima_drv.h   |   1 +
>   drivers/gpu/drm/lima/lima_gem.c   | 130 ++++++++++++++++++++++++++++--
>   drivers/gpu/drm/lima/lima_gem.h   |   4 +
>   drivers/gpu/drm/lima/lima_gp.c    |  51 +++++++++++-
>   drivers/gpu/drm/lima/lima_mmu.c   |   5 ++
>   drivers/gpu/drm/lima/lima_mmu.h   |   1 +
>   drivers/gpu/drm/lima/lima_regs.h  |   1 +
>   drivers/gpu/drm/lima/lima_sched.c |  35 ++++++--
>   drivers/gpu/drm/lima/lima_sched.h |   6 ++
>   drivers/gpu/drm/lima/lima_vm.c    |  44 +++++++++-
>   drivers/gpu/drm/lima/lima_vm.h    |   1 +
>   include/uapi/drm/lima_drm.h       |   9 ++-
>   13 files changed, 284 insertions(+), 20 deletions(-)
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B9973B9B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C51C10E6ED;
	Tue, 10 Sep 2024 15:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SZUXWHnZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA02210E2FC;
 Tue, 10 Sep 2024 15:23:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 15BB5A44956;
 Tue, 10 Sep 2024 15:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F57C4CECD;
 Tue, 10 Sep 2024 15:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725981818;
 bh=azgnfMXRXuDA0MFPQPC1rsAJPMjW/ZtwbZeayrxNHfc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SZUXWHnZO8AJV5V4EtjKea8t1LBHr4z9KpVt8WRL9O4OFmS2XgUy5x9sTivYiIHy8
 WDQXJQ0OBG+CXaWJOPk0UfHiMXI3UBxZLwNCiEyezIGkuuZO5sFH04UoxUlfMzRTG/
 CcgyvfX0Tv9zMqm2prPgdVUSvqooLm6zowoeQvcV51J9S1OxMI1R2qbAgcOvyDTkti
 +/U3p1RW598g23FjNgsdshjEwdq6RnThPSx+XnqmqF2YhLcMsKg1W+O3l0KvdAMVnP
 XymvsEfWDxrHPW+qW+FUdl3lIfJ2CVf3MczJOXLdwbMcReUqii6z5SR8y9k9hHXqiD
 5ZnGLQITI2+5A==
Date: Tue, 10 Sep 2024 17:23:34 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?5byg5rKz?= <zhanghe9702@163.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, trivial@kernel.org, 
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/gt: Fixed an typo
Message-ID: <hee6urac76m5vx3fhmndkbrox4jiyd3ygv3v2cu362vrs35oky@iaft3p3zouwi>
References: <20240907092443.81661-1-zhanghe9702@163.com>
 <ZuAQUGMTa4btT-ga@ashyti-mobl2.lan>
 <21386152.c170.191dc452525.Coremail.zhanghe9702@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21386152.c170.191dc452525.Coremail.zhanghe9702@163.com>
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

Hi,

On Tue, Sep 10, 2024 at 10:10:04PM GMT, 张河 wrote:
> :), i think you mean should use CPU column head? because the reg value just
> reflect CPU related information

before getting into it, please, keep in mind:

1. do not top post.
2. do not send html e-mails.
3. read carefully the reviews from reviewers.

Said that, I asked you:

1. include the proper mailing lists when you send patches (use
get_maintainers.pl)
2. Do you really want to use "zhanghe9702" as a name rather than
your real "Name Surname" as everyone does?

Andi

> At 2024-09-10 17:24:32, "Andi Shyti" <andi.shyti@linux.intel.com> wrote:
> >Hi Zhanghe,
> >
> >Thanks for your patch. Please next time check from
> >get_maintainers.pl the mailing lists that need to be included in
> >your patches.
> >
> >In this case you should have included at least the
> >intel-gfx <intel-gfx@lists.freedesktop.org> and the
> >dri-devel <dri-devel@lists.freedesktop.org> mailing lists.
> >
> >On Sat, Sep 07, 2024 at 05:24:43PM +0800, zhanghe9702 wrote:
> >> column header should be GPU, not CPU
> >>
> >> Signed-off-by: zhanghe9702 <zhanghe9702@163.com>
> >
> >Do you really want your name to appear as zhanghe9702? If you git
> >log the linux directory you will se that people normally use
> >the "Name Surname <email>" style. As you wish.
> >
> >> ---
> >>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> >> index 8d08b38874ef..b635aa2820d9 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> >> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> >> @@ -431,7 +431,7 @@ static int llc_show(struct seq_file *m, void *data)
> >>              max_gpu_freq /= GEN9_FREQ_SCALER;
> >>      }
> >>
> >> -    seq_puts(m, "GPU freq (MHz)\tEffective CPU freq (MHz)\tEffective Ring freq (MHz)\n");
> >> +    seq_puts(m, "GPU freq (MHz)\tEffective GPU freq (MHz)\tEffective Ring freq (MHz)\n");
> >
> >This is correct:
> >
> >Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> >
> >Thanks,
> >Andi
> 

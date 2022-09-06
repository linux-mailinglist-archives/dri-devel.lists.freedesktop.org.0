Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC15AF4D2
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF0210EA69;
	Tue,  6 Sep 2022 19:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF8B10EA65;
 Tue,  6 Sep 2022 19:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662493951; x=1694029951;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dskIZY0NrVgrM+PxM/nvZ7gE20s9P1sqP9KsU9Rs7BQ=;
 b=KdGYArT+/+Kwcwktyk70FlP8dYmgt6+wGtjeGWg5QBBBEkmmG17O8M6g
 0jvG2SmswjS4qKKnnPnO0jI7n8xd6jGoKjJDVF9J0opIKxuRVMzPBZkFW
 pKZMXa8kuszMefosvuJ9LOk5XK4vOA27ujRn1XK249dRtWM/CY37bmy4I
 FAMsN0RpZm0WFFLmHatPqamjP9sahKV/WFIWHdtZfQEGf/L+AOoJaBI6D
 /fBZ26Mj1kfiv0YiIoxQyHiP8QY5TgduDGgizBjC7PrVlmNKvm5td+MRw
 9+i3qmpLzkb1jBBrAhfQEHQoj6NYvSnrPL8LPw28MEH9SdMZBE3rf1Yj2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="296691129"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="296691129"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 12:52:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="616820492"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 06 Sep 2022 12:52:30 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.44.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 74FEC580890;
 Tue,  6 Sep 2022 12:52:28 -0700 (PDT)
Date: Tue, 6 Sep 2022 20:58:27 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 16/39] drm/i915: intel_fb: fix a
 kernel-doc issue with Sphinx
Message-ID: <20220906205819.03709faa@maurocar-mobl2>
In-Reply-To: <YtHeySNYE+B3XJ7w@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <5647d7b6ffe47f53b90342e4ad881d4d4e6b005b.1657699522.git.mchehab@kernel.org>
 <YtHeySNYE+B3XJ7w@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Juha-Pekka =?UTF-8?B?SGVpa2tpbMOk?= <juha-pekka.heikkila@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Jul 2022 17:40:25 -0400
Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:

> On Wed, Jul 13, 2022 at 09:12:04AM +0100, Mauro Carvalho Chehab wrote:
> > We can't use %foo[<something>] as this produces a bad markup.
> > Use instead, the emphasis markup directly.
> > 
> > Fix this issue:
> > 	Documentation/gpu/i915:136: ./drivers/gpu/drm/i915/display/intel_fb.c:280: WARNING: Inline strong start-string without end-string.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>  
> 
> Just trying to understand as well on why in a few you had chosen ```foo```
> and here **foo**. why?
> 

No particular reason. I'll use ``foo`` here too, keeping your reviewed-by.

> anyway, not a blocker:
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> 
> 
> > ---
> > 
> > To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> > See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> > 
> >  drivers/gpu/drm/i915/display/intel_fb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> > index b191915ab351..fe72c75a9c79 100644
> > --- a/drivers/gpu/drm/i915/display/intel_fb.c
> > +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> > @@ -276,7 +276,7 @@ lookup_format_info(const struct drm_format_info formats[],
> >   * @cmd: FB add command structure
> >   *
> >   * Returns:
> > - * Returns the format information for @cmd->pixel_format specific to @cmd->modifier[0],
> > + * Returns the format information for @cmd->pixel_format specific to **cmd->modifier[0]**,
> >   * or %NULL if the modifier doesn't override the format.
> >   */
> >  const struct drm_format_info *
> > -- 
> > 2.36.1
> >   

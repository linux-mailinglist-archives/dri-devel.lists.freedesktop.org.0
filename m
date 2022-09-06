Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B4E5AF4D0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8141810EA68;
	Tue,  6 Sep 2022 19:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D433110EA60;
 Tue,  6 Sep 2022 19:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662493948; x=1694029948;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XJySH71IN31M6NVQ6cXy0CSzgJev/B9IC3dLWlVkEf0=;
 b=Zn0yxcu0mhyFcXApb4yftbvMy3QAl164/An01NTCXQyPuP7z3czQp0aM
 tJ7ZnvUUBUM/caoMYFbn4c+fDX1r2ho5+WjpiKgiMmFYEznWj+jGJS36o
 wVFcBEYp88oopnfC+tOPmiWKHz6ztQaoPOoRZRBGbghzevkqXwU6mxQjP
 o1u9nydTzxmkXw/HbyKi0Xi66QBCC1fUhV0mc8M2ibEqGWJWbcOrW0SP8
 Y1zJ5btHl+/OrYJishJEP2ZDZ0SBggNIa14FM+tFzGcGmLu58wdoAhU8a
 FVMQQt4uG4HId2Oa8Hu0MeSOTjgvuHRr9YUz/SNY+tlaActKc+taKdBae g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="382987115"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="382987115"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 12:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="756494906"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2022 12:52:28 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.44.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 71401580583;
 Tue,  6 Sep 2022 12:52:26 -0700 (PDT)
Date: Tue, 6 Sep 2022 20:53:11 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 15/39] drm/i915:
 intel_dp_link_training.c: fix kernel-doc markup
Message-ID: <20220906171716.15bdc72b@maurocar-mobl2>
In-Reply-To: <YvIuKw8KY6xMi0Fj@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <0fac471eb7f6d365e9a7544071114292e08aa5ad.1657699522.git.mchehab@kernel.org>
 <YvIuKw8KY6xMi0Fj@intel.com>
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
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 Aug 2022 05:51:39 -0400
Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:

> On Wed, Jul 13, 2022 at 09:12:03AM +0100, Mauro Carvalho Chehab wrote:
> > The return code table is not properly marked, causing warnings
> > and being badly parsed by Sphinx:
> > 
> >     Documentation/gpu/i915:130: ./drivers/gpu/drm/i915/display/intel_dp_link_training.c:183: WARNING: Block quote ends without a blank line; unexpected unindent.
> >     Documentation/gpu/i915:130: ./drivers/gpu/drm/i915/display/intel_dp_link_training.c:186: WARNING: Definition list ends without a blank line; unexpected unindent.
> > 
> > Use table markups to fix it.  
> 
> cool, I didn't know that

Yeah, you can use almost all Sphinx tags inside a kernel-doc markup,
taking some care with indents and not conflicting with the things
that kernel-doc itself parses. 

The same is also valid for uAPI stuff inside Documentation/ABI.

Regards,
Mauro

> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> 
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> > 
> > To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> > See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> > 
> >  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > index 9feaf1a589f3..23a269fcf6ca 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > @@ -177,12 +177,14 @@ static int intel_dp_init_lttpr(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEI
> >   * transparent mode link training mode.
> >   *
> >   * Returns:
> > + * ====  =====================================================================
> >   *   >0  if LTTPRs were detected and the non-transparent LT mode was set. The
> >   *       DPRX capabilities are read out.
> >   *    0  if no LTTPRs or more than 8 LTTPRs were detected or in case of a
> >   *       detection failure and the transparent LT mode was set. The DPRX
> >   *       capabilities are read out.
> >   *   <0  Reading out the DPRX capabilities failed.
> > + * ====  =====================================================================
> >   */
> >  int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp)
> >  {
> > -- 
> > 2.36.1
> >   

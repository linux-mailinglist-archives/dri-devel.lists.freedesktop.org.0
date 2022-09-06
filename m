Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B77075AF4D4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD20010EA6C;
	Tue,  6 Sep 2022 19:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC9810EA65;
 Tue,  6 Sep 2022 19:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662493955; x=1694029955;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0JkPYEHioOtGLJAxsT5kA+8eXjUWG3XSjrJRIH80fII=;
 b=Uf2BZRb+zdrPjdWwtcIjb4pA3E5yuykRoNit+KoZoJHytQEzg+rd5fHu
 5XdirDxoWZuJHfAiuUhfAGEK0/zn82tT4MhBzGxc8ehZJ6nyxDhPpaokE
 g9DUW7SqnlGZxvfqmCVOCrYDrcP62mr24uH7HTsd6LqulrpQYSmvNzXH2
 tZw8Pb/+QpsOvyiIcZ6RUBks/cGvNak6juzHXQGk0sZHBh4ceEFCskasF
 fdNG1mwHaA5YG3w7cgezM5g9BfAdJgY3lSwo0JbsQHVMdbTdCnHVlwwVm
 RoM3Mvt44E2OqgWoIEMPQM07hYIyLgFYLYpaYMSy9OTb5Vdw6wBVG9Gq/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="360637568"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="360637568"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 12:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="717837480"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2022 12:52:32 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.44.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CA236580583;
 Tue,  6 Sep 2022 12:52:30 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:17:47 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 18/39] drm/i915: intel_pm.c: fix some
 ascii artwork at kernel-doc
Message-ID: <20220906211740.6b92f23d@maurocar-mobl2>
In-Reply-To: <YvIu/oCnkDbdLqou@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <b3657e96ea87a5803ed27d1cc0d9fa44b2f164cf.1657699522.git.mchehab@kernel.org>
 <YvIu/oCnkDbdLqou@intel.com>
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

On Tue, 9 Aug 2022 05:55:10 -0400
Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:

> On Wed, Jul 13, 2022 at 09:12:06AM +0100, Mauro Carvalho Chehab wrote:
> > Preserving ascii artwork on kernel-docs is tricky, as it needs
> > to respect both the Sphinx rules and be properly parsed by
> > kernel-doc script.
> > 
> > The Sphinx syntax require code-blocks, which is:
> > 
> > 	::
> > 
> > followed by a blank line and indented lines.
> > 
> > But kernel-doc only works fine if the first and the last line
> > are indented with the same amount of spaces.
> > 
> > Also, a "\" at the end means that the next line should be merged
> > with the first one.  
> 
> my first reaction was: "do we really need those new empty ( ) blocks?"
> 
> Then I read this ;)

Yeah, it is tricky to get it right, due to kernel-doc + Sphinx here.
Also, I bet that this would be needed even for ReST files with
C code on it, as it is likely the C domain encoding at Sphinx that
handles continuation lines with "\" at the end...

> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> > 
> > Change the ascii artwork to be on code-blocks, starting all
> > lines at the same characters and not ending with a backslash.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> > 
> > To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> > See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> > 
> >  drivers/gpu/drm/i915/intel_pm.c | 33 ++++++++++++++++++---------------
> >  1 file changed, 18 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> > index f06babdb3a8c..d3393752b04b 100644
> > --- a/drivers/gpu/drm/i915/intel_pm.c
> > +++ b/drivers/gpu/drm/i915/intel_pm.c
> > @@ -684,18 +684,20 @@ static const struct intel_watermark_params i845_wm_info = {
> >   * FIFO is relatively small compared to the amount of data
> >   * fetched.
> >   *
> > - * The FIFO level vs. time graph might look something like:
> > + * The FIFO level vs. time graph might look something like::
> >   *
> > - *   |\   |\
> > - *   | \  | \
> > - * __---__---__ (- plane active, _ blanking)
> > - * -> time
> > + *   ^
> > + *   |   |\   |\      (                          )
> > + *   |   | \  | \     (                          )
> > + *   |   __---__---__ (- plane active, _ blanking)
> > + *   +-------------------> time
> >   *
> > - * or perhaps like this:
> > + * or perhaps like this::
> >   *
> > - *   |\|\  |\|\
> > - * __----__----__ (- plane active, _ blanking)
> > - * -> time
> > + *   ^
> > + *   |     |\|\  |\|\   (                          )
> > + *   |   __----__----__ (- plane active, _ blanking)
> > + *   +-------------------> time
> >   *
> >   * Returns:
> >   * The watermark in bytes
> > @@ -731,13 +733,14 @@ static unsigned int intel_wm_method1(unsigned int pixel_rate,
> >   * FIFO is relatively large compared to the amount of data
> >   * fetched.
> >   *
> > - * The FIFO level vs. time graph might look something like:
> > + * The FIFO level vs. time graph might look something like::
> >   *
> > - *    |\___       |\___
> > - *    |    \___   |    \___
> > - *    |        \  |        \
> > - * __ --__--__--__--__--__--__ (- plane active, _ blanking)
> > - * -> time
> > + *   ^
> > + *   |     |\___       |\___        (                          )
> > + *   |     |    \___   |    \___    (                          )
> > + *   |     |        \  |        \   (                          )
> > + *   |  __ --__--__--__--__--__--__ (- plane active, _ blanking)
> > + *   +---------------------------------> time
> >   *
> >   * Returns:
> >   * The watermark in bytes
> > -- 
> > 2.36.1
> >   

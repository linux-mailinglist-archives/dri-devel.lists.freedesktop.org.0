Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814646065AB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 18:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA11610E455;
	Thu, 20 Oct 2022 16:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E10910E3EF;
 Thu, 20 Oct 2022 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666282862; x=1697818862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZMx8gcBbDcKGIWd5wygPZCiGjmEq/+FSfa2Bj1AZEIA=;
 b=ay6jp2vyx5uzFxtJ9jz2Aa/asN0OqpstKin4hsLvBuOGWqpLKHw3DKts
 EpZLqYY2H4KitzWEsLmZbI+gB/kJxT1OeX/NIjE/SCv7tQJHprLMGH5li
 WtG3JTUWFdji7MHPjindCcI4x2qWzMmrXDz0MjCdAdLaTfkYm2W/FT4bG
 8eiOWlwUju+xFA5uvqUJ++JdXWBRLzPtvNTAOQKLWa10DTyZBOjcVSNB1
 9CJCfz1GEplgKMrGD69S3VimMtHFgHAoYbRaqjTe+IqjBdtG5ebjcMACo
 X5XC1RQO68oPWoNMrziWuaUk8Tj+wLpN+ZdToie5SJhUvXE2fSNkIGHEl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="287162562"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="287162562"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772459497"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="772459497"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga001.fm.intel.com with SMTP; 20 Oct 2022 09:20:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Oct 2022 19:20:56 +0300
Date: Thu, 20 Oct 2022 19:20:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] Random submitter change in Freedesktop Patchwork
Message-ID: <Y1F1aEIbdktSYpPG@intel.com>
References: <878rlaqyc7.wl-ashutosh.dixit@intel.com> <871qr2h41x.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871qr2h41x.fsf@intel.com>
X-Patchwork-Hint: comment
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
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, tomi.p.sarvela@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 07:07:22PM +0300, Jani Nikula wrote:
> On Thu, 20 Oct 2022, "Dixit, Ashutosh" <ashutosh.dixit@intel.com> wrote:
> > The freedesktop Patchwork seems to have a "feature" where in some cases the
> > submitter for a series changes randomly to a person who did not actually
> > submit a version of the series.
> >
> > Not sure but this changed submitter seems to be a maintainer:
> >
> > ------------------------------------------------
> > https://patchwork.freedesktop.org/series/108156/
> >
> > Original submission by badal.nilawar@intel.com and subsequent submissions
> > by me (ashutosh.dixit@intel.com) but current submitter is
> > jani.nikula@linux.intel.com.
> >
> > For the above series I believe the submitter changed at v7 where perhaps a
> > rebuild or a retest was scheduled (not sure if Jani did it and that changed
> > something) but the build failed at v7. Also note root msg-id's for v6 and
> > v7 are the same.
> > ------------------------------------------------
> > https://patchwork.freedesktop.org/series/108091/
> >
> > Original submission by me (ashutosh.dixit@intel.com) but current submitter
> > is rodrigo.vivi@intel.com.
> >
> > Similarly here submitter seems to have changed at v3 where again the build
> > failed. Also note root msg-id's for v2 and v3 are the same.
> > ------------------------------------------------
> >
> > The problem this change of submitter causes is that if the actual original
> > submitter wants to schedule a retest they cannot do it using the retest
> > button.
> 
> I presume it's caused by me responding with a review comment that
> patchwork interpreted as a new patch in the series [1], and changed the
> series submitter too.
> 
> Sorry about that. It's a known issue that I sometimes forget to work
> around when replying with diffs.

I just permenently stuck a 'my_hdr X-Patchwork-Hint: comment'
into my .muttrc to avoid that.

-- 
Ville Syrjälä
Intel

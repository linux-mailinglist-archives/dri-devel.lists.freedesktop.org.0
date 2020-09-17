Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA03326E059
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 18:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB386EC50;
	Thu, 17 Sep 2020 16:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79076EC50;
 Thu, 17 Sep 2020 16:11:44 +0000 (UTC)
IronPort-SDR: iDgiZdBcE8ZRqrGnEZ8FEc1Z3danUA8v/NiV53Z9ErA54xHFMuR2rEkqOFpETZk+SP8PE5P1JV
 t5pmsev5Ib1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="147478274"
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="147478274"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 09:11:39 -0700
IronPort-SDR: iDgyiXX3V6oy7RPrYt47B7+FcD/kcMi3LUFjZbkwWNAwBZREVk8D9yY5qqLLaP1VIYzMinBqJ1
 I93ISqh0DFtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="344407542"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 17 Sep 2020 09:11:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 17 Sep 2020 19:11:34 +0300
Date: Thu, 17 Sep 2020 19:11:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 00/18] drm/i915: Pimp DP DFP handling
Message-ID: <20200917161134.GY6112@intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
 <fa772231854424f2b4edc69e23b0edd924695e6c.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa772231854424f2b4edc69e23b0edd924695e6c.camel@redhat.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 08, 2020 at 02:34:24PM -0400, Lyude Paul wrote:
> With the nitpicks addressed (note there were a couple of other spots wher=
e we
> wanted to use Return: in the kdocs, but I didn't bother pointing all of t=
hem
> out), all but patch 07 is:
> =

> Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks for the review. I fixed up the missing/bad docs and =

pushed the lot to drm-intel-next-queued (with Daniel's irc ack).

PS.
Had to s/drm_dp_downstream_max_clock/drm_dp_downstream_max_dotclock/
in nouveau_dp.c to keep it in a buildable shape. I hope I didn't step
on too many toes with this...

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

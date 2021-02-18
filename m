Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC7331EB87
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 16:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715186EA3D;
	Thu, 18 Feb 2021 15:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECB46EA3C;
 Thu, 18 Feb 2021 15:31:57 +0000 (UTC)
IronPort-SDR: ZTWLO+t/eLzImkiRj+9FEAZkJDfRXxe69DLT1Vx194Jrty7zyesMvcXiJgM2/Mq/mCC8OloVEZ
 l/9yVGDSAneA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="183657409"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="183657409"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 07:31:56 -0800
IronPort-SDR: OouBEYarPuLAOdmgvJYlFPhxnKNIZH9nHQGGiQmc7dbK12MVbrWm8kF8ENYlPbTu8HmlXwGg1r
 AZ2p00thMFwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="385998262"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 18 Feb 2021 07:31:51 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Feb 2021 17:31:51 +0200
Date: Thu, 18 Feb 2021 17:31:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [RFC v4 10/11] drm/dp: Extract i915's eDP backlight
 code into DRM helpers
Message-ID: <YC6IZ+BUcA5uDCej@intel.com>
References: <20210208233902.1289693-1-lyude@redhat.com>
 <20210208233902.1289693-11-lyude@redhat.com>
 <20210211041540.GI82362@intel.com>
 <355ce12ec69a9b5f20b4a856a40c8abf413be5c0.camel@redhat.com>
 <87mtw1ai4m.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mtw1ai4m.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 greg.depoire@gmail.com, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 10:35:05AM +0200, Jani Nikula wrote:
> On Fri, 12 Feb 2021, Lyude Paul <lyude@redhat.com> wrote:
> > I think it wouldn't be a bad idea to just address this with a followup =
series
> > instead and use the old DRM_DEBUG_* macros in the mean time.
> =

> aux->dev is there, could also use dev_dbg et al. in the mean time. They
> handle NULL dev gracefully too if the driver didn't set that.

Last I looked aux->dev was random. Some drivers point it at the
connector vs. some at the the pci/platform device.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC802F3510
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 17:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3B16E2DF;
	Tue, 12 Jan 2021 16:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BB66E2DF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 16:07:53 +0000 (UTC)
IronPort-SDR: KwDvTDYdCq0Xxg8sxrcsnj+mqCLAptkmHSgVkLkgG4LBAmFL5pO7hjkZJw7FU18qKuwdx9Qtv1
 OTWkNH2Rg+9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="178155949"
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; d="scan'208";a="178155949"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 08:06:49 -0800
IronPort-SDR: R31Bvkfo5m5MQvwwG+05FJgY54GpTPfxC2ws2S9DcABEu3p/XBN5OSk5k3gWYWZjoXL03y0TW8
 xgEaduuNQyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; d="scan'208";a="381475296"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 12 Jan 2021 08:06:46 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 12 Jan 2021 18:06:45 +0200
Date: Tue, 12 Jan 2021 18:06:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/4] drm: Extend color correction to support 3D-CLU
Message-ID: <X/3JFYg4Y7DVeh22@intel.com>
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201221015730.28333-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201221015730.28333-4-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 21, 2020 at 03:57:29AM +0200, Laurent Pinchart wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> =

> Extend the existing color management properties to support provision
> of a 3D cubic look up table, allowing for color specific adjustments.
> =

> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

FYI I've got a WIP 3D LUT implementation for i915 here:
git://github.com/vsyrjala/linux.git 3dlut

I named the prop GAMMA_LUT_3D to indicate its position in the
pipeline (on our hw it's postioned after the normal gamma LUT).
Alas no userspace for it yet, so can't really do anything more =

with it for the time being.

Rudimentary tests also available here:
git://github.com/vsyrjala/intel-gpu-tools.git 3dlut

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

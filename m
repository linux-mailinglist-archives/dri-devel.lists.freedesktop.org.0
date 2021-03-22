Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717763449C3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 16:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A6589C82;
	Mon, 22 Mar 2021 15:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318B889C53;
 Mon, 22 Mar 2021 15:52:28 +0000 (UTC)
IronPort-SDR: rUqiCCa47+I0RUZh6yFUGfIxJ19t0/Q17/Xi0asCoLHssesx3UCD9ITHKzvqAt4uJhk7Pk9moy
 ElMzEY6flQ9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="190391611"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="190391611"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 08:52:26 -0700
IronPort-SDR: JGmU+FyiVYQ8PW1EMAb4JD2VR/CSA07qiL//ML2IlqvoRI84RskmjPkD+uQuCt69Ci2ovRjLkz
 Rw/QgpgrMnMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="375740011"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 22 Mar 2021 08:52:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 22 Mar 2021 17:52:22 +0200
Date: Mon, 22 Mar 2021 17:52:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: 16 bpc fixed point (RGBA16) framebuffer support for core and AMD.
Message-ID: <YFi9Nu/rAjfEdnBg@intel.com>
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
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
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 10:03:12PM +0100, Mario Kleiner wrote:
> Hi,
> =

> this patch series adds the fourcc's for 16 bit fixed point unorm
> framebuffers to the core, and then an implementation for AMD gpu's
> with DisplayCore.
> =

> This is intended to allow for pageflipping to, and direct scanout of,
> Vulkan swapchain images in the format VK_FORMAT_R16G16B16A16_UNORM.
> I have patched AMD's GPUOpen amdvlk OSS driver to enable this format
> for swapchains, mapping to DRM_FORMAT_XBGR16161616:
> Link: https://github.com/kleinerm/pal/commit/a25d4802074b13a8d5f7edc96ae4=
5469ecbac3c4

We should also add support for these formats into igt.a Should =

be semi-easy by just adding the suitable float<->uint16
conversion stuff.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

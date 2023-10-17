Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EBD7CC2AC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 14:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B4B10E2D4;
	Tue, 17 Oct 2023 12:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314B810E2D3;
 Tue, 17 Oct 2023 12:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697544670; x=1729080670;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nIE6NT2Pk1clEi5GWA+owq3CNDdTVpk0MrTKfRDcdQw=;
 b=YpVBNBYQLncTY9w3PrVC1d25j/tzFD7B6b8yentzRuWsJMQq68OUQug9
 KqorRa4FV649IEiMQmYCIXWEXwcbwa6B4gPMQdi/vKTerTDygwHGHt/Nh
 7v+L7zfHMQ16kYJdDu5a9uEc7Zlv+frLbFQ2dguz8JTTfyDXlTZQ1Qxvp
 FEP5bQSmtOeNW25p4HdtDsedHOxBh9CI+Da7Ocr5k2qvf7f3eCWo1DlpU
 QT9n9qZNitS4A63SVAYkFwZ/iwSYj5f8scRcW6lYWJg8ydVvYQYRJrUcN
 zW0YoazLDss43Ky7H0iMtpFgxf2b/8VxHLWe2834B3zhw0UlaA5Xr0bCo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="376131293"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="376131293"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 05:10:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="826417071"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="826417071"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmsmga004.fm.intel.com with SMTP; 17 Oct 2023 05:10:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 17 Oct 2023 15:10:01 +0300
Date: Tue, 17 Oct 2023 15:10:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 6/6] drm/doc: Define KMS atomic state set
Message-ID: <ZS55mXTSxpXKYbsd@intel.com>
References: <20230815185710.159779-1-andrealmeid@igalia.com>
 <20230815185710.159779-7-andrealmeid@igalia.com>
 <1b23576d-1649-ff5c-6273-b54729ea46d8@mailbox.org>
 <b48bd1fc-fcb0-481b-8413-9210d44d709b@igalia.com>
 <20231016151856.74af9305@eldfell>
 <aa424bf8-5652-4a44-9b93-bdc0a31d835a@igalia.com>
 <20231016175222.7a89e6ab@eldfell> <ZS1ST6XAUHilBg3d@intel.com>
 <8NqDNz1Y8H5I_WhNhOj0ERarBH7nJhGQAsDHbmSnwzoOFtXPBPILwxLlF8-vDPKR06Uknp1BDSt7-6gTmHls62k79ETajXDfPRsmIP-cZN0=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8NqDNz1Y8H5I_WhNhOj0ERarBH7nJhGQAsDHbmSnwzoOFtXPBPILwxLlF8-vDPKR06Uknp1BDSt7-6gTmHls62k79ETajXDfPRsmIP-cZN0=@emersion.fr>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, xaver.hugl@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pekka Paalanen <ppaalanen@gmail.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 wayland-devel@lists.freedesktop.org, hwentlan@amd.com,
 christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 10:00:51PM +0000, Simon Ser wrote:
> On Monday, October 16th, 2023 at 17:10, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Mon, Oct 16, 2023 at 05:52:22PM +0300, Pekka Paalanen wrote:
> > 
> > > On Mon, 16 Oct 2023 15:42:16 +0200
> > > André Almeida andrealmeid@igalia.com wrote:
> > > 
> > > > Hi Pekka,
> > > > 
> > > > On 10/16/23 14:18, Pekka Paalanen wrote:
> > > > 
> > > > > On Mon, 16 Oct 2023 12:52:32 +0200
> > > > > André Almeida andrealmeid@igalia.com wrote:
> > > > > 
> > > > > > Hi Michel,
> > > > > > 
> > > > > > On 8/17/23 12:37, Michel Dänzer wrote:
> > > > > > 
> > > > > > > On 8/15/23 20:57, André Almeida wrote:
> > > > > > > 
> > > > > > > > From: Pekka Paalanen pekka.paalanen@collabora.com
> > > > > > > > 
> > > > > > > > Specify how the atomic state is maintained between userspace and
> > > > > > > > kernel, plus the special case for async flips.
> > > > > > > > 
> > > > > > > > Signed-off-by: Pekka Paalanen pekka.paalanen@collabora.com
> > > > > > > > Signed-off-by: André Almeida andrealmeid@igalia.com
> > > > > > > > [...]
> > > > > > > 
> > > > > > > > +An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC is allowed to
> > > > > > > > +effectively change only the FB_ID property on any planes. No-operation changes
> > > > > > > > +are ignored as always. [...]
> > > > > > > > During the hackfest in Brno, it was mentioned that a commit which re-sets the same FB_ID could actually have an effect with VRR: It could trigger scanout of the next frame before vertical blank has reached its maximum duration. Some kind of mechanism is required for this in order to allow user space to perform low frame rate compensation.
> > > > > > 
> > > > > > Xaver tested this hypothesis in a flipping the same fb in a VRR monitor
> > > > > > and it worked as expected, so this shouldn't be a concern.
> > > > > > Right, so it must have some effect. It cannot be simply ignored like in
> > > > > > the proposed doc wording. Do we special-case re-setting the same FB_ID
> > > > > > as "not a no-op" or "not ignored" or some other way?
> > > > > > There's an effect in the refresh rate, the image won't change but it
> > > > > > will report that a flip had happened asynchronously so the reported
> > > > > > framerate will be increased. Maybe an additional wording could be like:
> > > > 
> > > > Flipping to the same FB_ID will result in a immediate flip as if it was
> > > > changing to a different one, with no effect on the image but effecting
> > > > the reported frame rate.
> > > 
> > > Re-setting FB_ID to its current value is a special case regardless of
> > > PAGE_FLIP_ASYNC, is it not?
> > 
> > No. The rule has so far been that all side effects are observed
> > even if you flip to the same fb. And that is one of my annoyances
> > with this proposal. The rules will now be different for async flips
> > vs. everything else.
> 
> Well with the patches the async page-flip case is exactly the same as
> the non-async page-flip case. In both cases, if a FB_ID is included in
> an atomic commit then the side effects are triggered even if the property
> value didn't change. The rules are the same for everything.

I see it only checking if FB_ID changes or not. If it doesn't
change then the implication is that the side effects will in
fact be skipped as not all planes may even support async flips.

-- 
Ville Syrjälä
Intel

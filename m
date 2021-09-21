Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CBD413100
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 11:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBFE6E91A;
	Tue, 21 Sep 2021 09:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827D16E91A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 09:58:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="203471857"
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; d="scan'208";a="203471857"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 02:58:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; d="scan'208";a="549421132"
Received: from unknown (HELO localhost) ([10.251.218.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 02:58:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: gpu: drm-internals: Create reference to DRM mm
In-Reply-To: <20210920140326.ygodeun2qokb6wcw@blmsp>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210920101334.249832-1-msp@baylibre.com>
 <874kafv7bu.fsf@intel.com> <20210920140326.ygodeun2qokb6wcw@blmsp>
Date: Tue, 21 Sep 2021 12:58:06 +0300
Message-ID: <87ilyutfm9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 20 Sep 2021, Markus Schneider-Pargmann <msp@baylibre.com> wrote:
> Hi Jani,
>
> On Mon, Sep 20, 2021 at 02:01:57PM +0300, Jani Nikula wrote:
>> On Mon, 20 Sep 2021, Markus Schneider-Pargmann <msp@baylibre.com> wrote:
>> > This short sentence references nothing for details about memory manager.
>> > Replace it with the documentation file for DRM memory management.
>> >
>> > Cc: Jani Nikula <jani.nikula@intel.com>
>> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> > ---
>> >  Documentation/gpu/drm-internals.rst | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
>> > index 06af044c882f..bdcdfc4ede04 100644
>> > --- a/Documentation/gpu/drm-internals.rst
>> > +++ b/Documentation/gpu/drm-internals.rst
>> > @@ -126,8 +126,8 @@ Memory Manager Initialization
>> >  Every DRM driver requires a memory manager which must be initialized at
>> >  load time. DRM currently contains two memory managers, the Translation
>> >  Table Manager (TTM) and the Graphics Execution Manager (GEM). This
>> > -document describes the use of the GEM memory manager only. See ? for
>> > -details.
>> > +document describes the use of the GEM memory manager only. See
>> > +Documentation/gpu/drm-mm.rst for details.
>> 
>> Please use rst references instead of a file reference.
>
> Thanks for your comment. Could you please explain it a bit more to me?
>
> I am new to the kernel sphinx documentation so I looked it up in
> Documentation/doc-guide/sphinx.rst 'Cross-referencing'. It is listed as
> the preferred way to reference other documents if I understand it
> correctly.
>
> Should the doc-guide be updated then if a rst reference is preferred?

Please go with what the doc-guide says, sorry for the noise.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BFB1295D7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 13:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D63B6E28B;
	Mon, 23 Dec 2019 12:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81B66E28B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 12:08:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E066580514;
 Mon, 23 Dec 2019 13:07:57 +0100 (CET)
Date: Mon, 23 Dec 2019 13:07:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v1 1/8] drm/print: document logging functions
Message-ID: <20191223120756.GA10745@ravnborg.org>
References: <20191221095553.13332-1-sam@ravnborg.org>
 <20191221095553.13332-2-sam@ravnborg.org>
 <87tv5ruvzf.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tv5ruvzf.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=nLXQkpGwCpP5zMdhxRcA:9 a=CjuIK1q_8ugA:10
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
Cc: Joe Perches <joe@perches.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani.

> > + *
> > + * Each of the debug logging macros use a specific category, and the logging
> > + * is filtered by the drm.debug module parameter. The &drm_debug_category enum
> > + * specifies the values for the interface.
> > + *
> > + * Each drm_dbg_<category> macro logs to a DRM_UT_<category> category,
> > + * except drm_dbg() that logs to DRM_UT_DRIVER.
> >   *
> >   * Enabling verbose debug messages is done through the drm.debug parameter, each
> >   * category being enabled by a bit:
> >   *
> >   *  - drm.debug=0x1 will enable CORE messages
> >   *  - drm.debug=0x2 will enable DRIVER messages
> > + *  - drm.debug=0x4 will enable KMS messages
> > + *  - drm.debug=0x8 will enable PRIME messages
> > + *  - drm.debug=0x10 will enable ATOMIC messages
> > + *  - drm.debug=0x20 will enable VBL messages
> > + *  - drm.debug=0x40 will enable STATE messages
> > + *  - drm.debug=0x80 will enable LEASE messages
> > + *  - drm.debug=0x100 will enable DP messages
> 
> Maybe document this stuff in enum drm_debug_category where they're
> defined instead?

For the logging user it is much more convinient to have the logging
filtering explained in one place.
The enum already tell part of the story but then the reader needs to
hunt for the information.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

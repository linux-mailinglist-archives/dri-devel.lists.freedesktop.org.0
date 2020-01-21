Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A45F143933
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 10:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6F46EC06;
	Tue, 21 Jan 2020 09:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7F96EC06;
 Tue, 21 Jan 2020 09:13:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8FDAE20027;
 Tue, 21 Jan 2020 10:13:07 +0100 (CET)
Date: Tue, 21 Jan 2020 10:13:06 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [[Intel-gfx] [PATCH v2 01/10] drm/print: introduce new struct
 drm_device based WARN* macros
Message-ID: <20200121091306.GA29647@ravnborg.org>
References: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200115034455.17658-2-pankaj.laxminarayan.bharadiya@intel.com>
 <87y2u9jav8.fsf@intel.com> <87muahfbjt.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87muahfbjt.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=ARxESuRSxSw8adp43KQA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 intel-gfx@lists.freedesktop.org, sudeep.dutt@intel.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 21, 2020 at 10:39:34AM +0200, Jani Nikula wrote:
> On Wed, 15 Jan 2020, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Wed, 15 Jan 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> >> Add new struct drm_device based WARN* macros. These are modeled after
> >> the core kernel device based WARN* macros. These would be preferred
> >> over the regular WARN* macros, where possible.
> >>
> >> These macros include device information in the backtrace, so we know
> >> what device the warnings originate from.
> >>
> >> Knowing the device specific information in the backtrace would be
> >> helpful in development all around.
> >>
> >> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> >
> > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> All, I'd really appreciate acks or reviews on this one to unblock the
> rest. I think the patch is fine, but I'd like wider approval before
> merging.

Patch looks good:

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

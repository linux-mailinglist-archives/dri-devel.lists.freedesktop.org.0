Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A092D120306
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 11:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655F66E4AE;
	Mon, 16 Dec 2019 10:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAA76E4AE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:54:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 02:54:33 -0800
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; d="scan'208";a="209265262"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 02:54:32 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: AceLan Kao <acelan@gmail.com>
Subject: Re: [PATCH 1/5] drm/i915: Fix eDP DPCD aux max backlight calculations
In-Reply-To: <CAMz9Wg-EjX=CL9mm0JDuT6BGnB3PcSDwNmKpQy_KRnhni29Q-Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAMz9Wg9tNjYbRyHKRazu8LTSo2AvEn38zxHzkNJxJw9XmjxwqA@mail.gmail.com>
 <87pngs1c8z.fsf@intel.com>
 <CAMz9Wg-EjX=CL9mm0JDuT6BGnB3PcSDwNmKpQy_KRnhni29Q-Q@mail.gmail.com>
Date: Mon, 16 Dec 2019 12:54:29 +0200
Message-ID: <87a77s1qxm.fsf@intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Dec 2019, AceLan Kao <acelan@gmail.com> wrote:
> I tried to reply the patch from the mailing list archive by clicking
> the author name
> https://lists.freedesktop.org/archives/dri-devel/2019-November/246278.html
>
> mailto:dri-devel%40lists.freedesktop.org?Subject=Re%3A%20%5BPATCH%201/5%5D%20drm/i915%3A%20Fix%20eDP%20DPCD%20aux%20max%20backlight%20calculations&In-Reply-To=%3C20191122231616.2574-2-lyude%40redhat.com%3E
>
> It looks like it contains the subject and in-reply-to, I thought it
> should reply to the correct thread.
> Other patches in this series seem work, but this one doesn't.

FWIW none of the replies had In-reply-to: header in place.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

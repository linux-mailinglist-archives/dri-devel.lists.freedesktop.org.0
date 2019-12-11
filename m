Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1011A9CF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 12:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799356EB17;
	Wed, 11 Dec 2019 11:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858C06EB16;
 Wed, 11 Dec 2019 11:25:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 03:12:00 -0800
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="207644152"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 03:11:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v3 12/12] auxdisplay: constify fb ops
In-Reply-To: <CANiq72nPccKZghPM-FrNRnQ8AkN_r40cUmM3ruhyGtiTs_DdyQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575390740.git.jani.nikula@intel.com>
 <31c18e3ce9d6962aabda4799b3051039ff591c92.1575390741.git.jani.nikula@intel.com>
 <87pngx4muv.fsf@intel.com>
 <CANiq72nPccKZghPM-FrNRnQ8AkN_r40cUmM3ruhyGtiTs_DdyQ@mail.gmail.com>
Date: Wed, 11 Dec 2019 13:11:54 +0200
Message-ID: <87wob32k1x.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Robin van der Gracht <robin@protonic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 Dec 2019, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> On Mon, Dec 9, 2019 at 3:04 PM Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> On Tue, 03 Dec 2019, Jani Nikula <jani.nikula@intel.com> wrote:
>> > Now that the fbops member of struct fb_info is const, we can start
>> > making the ops const as well.
>> >
>> > Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
>> > Cc: Robin van der Gracht <robin@protonic.nl>
>> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> > Reviewed-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>> > Acked-by: Robin van der Gracht <robin@protonic.nl>
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> Miguel, Robin, just to err on the safe side, were you both okay with me
>> merging this through drm-misc? Not very likely to conflict badly.
>
> I think that is fine, go ahead! :)

Thanks, pushed to drm-misc-next!

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

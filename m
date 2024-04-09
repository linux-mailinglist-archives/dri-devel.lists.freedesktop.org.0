Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748A389DA45
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0D10E73A;
	Tue,  9 Apr 2024 13:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1C310E73A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:33:12 +0000 (UTC)
X-CSE-ConnectionGUID: DomUzug/T7GEPOuM6pUynw==
X-CSE-MsgGUID: 9CSH93u9TTecrAkZbf8oeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25424039"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="25424039"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 06:33:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="915399959"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="915399959"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 06:33:08 -0700
Received: from andy by smile with local (Exim 4.97)
 (envelope-from <andy@kernel.org>) id 1ruBaz-00000002od9-1FNV;
 Tue, 09 Apr 2024 16:33:05 +0300
Date: Tue, 9 Apr 2024 16:33:05 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org,
 linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Gregor Riepl <onitake@gmail.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: In kernel virtual HID devices (was Future handling of complex
 RGB devices on Linux v3)
Message-ID: <ZhVDkf0P6vRLy-Ql@smile.fi.intel.com>
References: <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
 <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
 <CANiq72kPXsTjzptK7tSC=RygEpWHJHz1-QXuZv8qPHfGLyzrDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kPXsTjzptK7tSC=RygEpWHJHz1-QXuZv8qPHfGLyzrDw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Mar 25, 2024 at 07:38:46PM +0100, Miguel Ojeda wrote:
> On Mon, Mar 25, 2024 at 3:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > +Cc: Bentiss, Jiri
> 
> Cc'ing Andy and Geert as well who recently became the
> maintainers/reviewers of auxdisplay, in case they are interested in
> these threads (one of the initial solutions discussed in a past thread
> a while ago was to extend auxdisplay).

Without diving into this, just sharing my view on auxdisplay subsystem:
I consider it _mostly_ (like lim->100% mathematically speaking) as for
7-segment and alike displays, not any comples RGB or so devices. If
those devices are capable of representing characters/digits in similar
way, we may export linedisp library for them to utilise.

-- 
With Best Regards,
Andy Shevchenko



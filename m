Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C868167D7B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 13:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A57B6F43C;
	Fri, 21 Feb 2020 12:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A376F43C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 12:28:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 04:28:06 -0800
X-IronPort-AV: E=Sophos;i="5.70,468,1574150400"; d="scan'208";a="229837267"
Received: from jmiler-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.38.187])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 04:28:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>
Subject: Re: [External] Re: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
In-Reply-To: <CACK8Z6HWkafL4EzOndRyiA3k-VyUg8bQ=2diw_wJSxSTyqsE+w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200220074637.7578-1-njoshi1@lenovo.com>
 <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
 <HK2PR0302MB25937E2946BF38583B3A905DBD130@HK2PR0302MB2593.apcprd03.prod.outlook.com>
 <CACK8Z6GwuOnJUUscriGwKWGBp5PFKyuqUkFYC8tEXa0UEuEZww@mail.gmail.com>
 <PS1PR0302MB260492DDE243BE0A64A39AA7BD130@PS1PR0302MB2604.apcprd03.prod.outlook.com>
 <CACK8Z6HWkafL4EzOndRyiA3k-VyUg8bQ=2diw_wJSxSTyqsE+w@mail.gmail.com>
Date: Fri, 21 Feb 2020 14:28:06 +0200
Message-ID: <87tv3kxgyx.fsf@intel.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Benjamin Berg <bberg@redhat.com>,
 Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
 Jingoo Han <jingoohan1@gmail.com>,
 Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Mat King <mathewk@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Nitin Joshi1 <njoshi1@lenovo.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Darren Hart <dvhart@infradead.org>, Nitin Joshi <nitjoshi@gmail.com>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Feb 2020, Rajat Jain <rajatja@google.com> wrote:
> Hi Mark,
>
>
> On Thu, Feb 20, 2020 at 11:03 AM Mark Pearson <mpearson@lenovo.com> wrote:
>>
>> Hi Rajat,
>>
>> > -----Original Message-----
>> > From: Rajat Jain <rajatja@google.com>
>> > Sent: Thursday, February 20, 2020 1:39 PM
>> > >
>> > > For this particular issue what is the best way to contribute and get
>> > > involved? We'd like to make it so ePrivacy can be used more easily from
>> > > Linux. I agree a more generic way of controlling it would be good.
>> > > I looked at the proposed patch from Rajat
>> > > (https://lkml.org/lkml/2019/10/22/967) - it seems like a good solution to me.
>> > > We can help with testing that on our platforms if that would be useful.
>> >
>> > Thanks you, just so that you know, the latest patchset is at:
>> > https://lkml.org/lkml/2019/12/20/794
>> >
>> > It would be great to get some additional testing if possible. I can
>> > send a sample ACPI (for our platform) in case it helps.
>> >
>> Sounds good - we'll definitely try this out and see how it goes. I
>> suspect we'll have some questions once we try it out and get more
>> familiar.
>>
>> > >
>> > > I need to understand how we connect that implementation with the ACPI
>> > > controls we have (as I believe what we have are thinkpad specific and not to
>> > > a drm spec; we need to confirm that). We also have the ACPI events that
>> > > notify if ePrivacy was changed by the hotkeys and that seems like something
>> > > that should be done in thinkpad_acpi.c and not the drm code.
>> > >
>> > > Not sure if the two need to be connected somehow (or if handling the
>> > > event is actually not important and polling is acceptable)?
>> >
>> > So there was some brief discussion about this on my patches - but
>> > atleast on  the platforms I have seen, there was no way to change the
>> > privacy screen out of software / kernel control. Essentially, if there
>> > are hotkeys, they would send an input event to the kernel, who'd send
>> > them to userspace, who'd use the DRM method to toggle the privacy
>> > screen. Thus the current version of the patch only supports
>> > controlling the privacy screen via set() method. The get() method just
>> > returns the cached value.I hope that works for you.
>> >
>> OK - on the thinkpads we have function+D as a 'hotkey' to control the
>> feature...and my understanding is that bypasses everything and goes
>> straight to the firmware.

In general I think it's preferrable if the hotkey sends the key event to
userspace that then makes the policy decision of what, if anything, to
do with it. Everything is much easier if the policy is in userspace
control. For example, you could define content based policies for
enabling privacy screen, something that is definitely not possible with
firmware.

I emphatize with the desire to just bypass everything at the
hardware/firmware level, because that is totally in your control (as an
OEM), and requires no interaction with the operating system
initially. Exposing the read-only state of the privacy screen is
helpful, but prevents the OS from building more advanced features on
top, failing to reach the full potential of the nice hardware feature.

That said, we obviously do need to take such hardware/firmware
implementations into account as well.

>> The changes Nitin had been working on in thinkpad_acpi.c was to make
>> this more Linux and friendly - provide a sysfs hook for user space to
>> connect to with the aim of allowing it to be configured from user
>> space and have on screen display when it was triggered etc.

IMO one of the problems with using sysfs for this is that it's not
connected with the graphics subsystem. The userspace has to go out of
its way to make the connection between the privacy screen and the
display. It shouldn't have to. It's a property of the display, not some
unrelated device (although, technically, I presume in hardware it might
be ;).

We've made the mistake with backlight before, and we still somewhat
struggle with it. Please let's not repeat that.

>> I'm personally not sure yet how this ties up with the DRM method -
>> more digging required. I'm intrigued to see if it works on our
>> systems (sadly I don't have anything with that feature available on
>> my desk right now...I need to get my hands on one)
>
> Just FYI, Here is the brief discussion we had about an interrupt
> mechanism to support a (hardware based) "kill switch" for the privacy
> screen.
> https://lkml.org/lkml/2019/10/25/992

I agree with Pekka's mail [1] in that thread.

BR,
Jani.


[1] https://lkml.org/lkml/2019/10/28/94

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

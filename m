Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D9F3571C4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 18:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872B26E948;
	Wed,  7 Apr 2021 16:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539816E0DA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 16:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617811776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GIdD8KXpZXildX/JzoGMDWLdi24taALA9x3SDqt6Iik=;
 b=ZvWEMeslR1E+khlqfNhBwhO+Zqwx0VCh3Fs1X0HAEz693HMNV8tj7KfGFi8DDunZMlh5Jp
 DJylOTRh4v+Z0mDUF2sqp93c82nh9snkPY4awEeA48CySxS/aI+Xh8dhDZQyiIfebu0PA5
 Qdlp/DIjXh8UvgZrw5WfrxuHfi7pFOA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-X2BH8b1uO7e9D9nc_2Pzew-1; Wed, 07 Apr 2021 12:09:34 -0400
X-MC-Unique: X2BH8b1uO7e9D9nc_2Pzew-1
Received: by mail-pj1-f69.google.com with SMTP id lj2so449599pjb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 09:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GIdD8KXpZXildX/JzoGMDWLdi24taALA9x3SDqt6Iik=;
 b=EPesz6kJiQmrVGcu6bXzRoxZFSCY3K0uPO82glmn8l68YfZbqLRytBOG/02FI5qsBy
 fIUvL0NBVtkUyeUDY1CtHOlbS73NmdVENNXlix7Z137dzJeltqiht/zY5xG4FmmmpNg9
 1POAzdnJdqwi3buEBxRx4D7XpBaj62uOWUxDJzVbHya5Ca7Tc2n6O76yb9Uy2GFjuxxa
 +NtE9Wdkr0N2ZZdvccVdhqP8udMRGXkKXtvbpcL/4Ioz+o1XmEDHCOA9YGbLc21BfVDE
 tmXlbWxGb6J0q8SWt4vKD4mRBqk3LK5t/W3mU4wunil+4++qSRNWzam92DruH3HmXnVa
 bM6g==
X-Gm-Message-State: AOAM531HNyXnBd+3kUvu3J89S8AywGgcqlA6YFcmsqK2EQIxGVPhYMMl
 c4Vq5lSMhTJxhmgf4JT61AyhADfctUL3+QjiFTsQ0h1VZeOjtQbtyziuFuWN8wBYNR7egc6x4Oz
 6XPLXKjcwwzrKqiri7MeUch2l3dKsBSzTKFEZFl/71Mzt
X-Received: by 2002:a17:90a:9f0b:: with SMTP id
 n11mr4041300pjp.56.1617811773504; 
 Wed, 07 Apr 2021 09:09:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ/h+B/6MXT+kwdnrI/eZUAdaTH42xPX4Fl95aBz/l50kJXCNcNQsRWwTSkwUMdm87PUkq3Q6JFENBMcJAE68=
X-Received: by 2002:a17:90a:9f0b:: with SMTP id
 n11mr4041274pjp.56.1617811773205; 
 Wed, 07 Apr 2021 09:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210326143458.508959-1-lee.jones@linaro.org>
 <20210406085605.GS2916463@dell>
In-Reply-To: <20210406085605.GS2916463@dell>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 7 Apr 2021 18:09:22 +0200
Message-ID: <CAO-hwJ+5Vd6jC2+0pfHLOw3opdXzKoc9pUWzxmBVhSvQvNWMsQ@mail.gmail.com>
Subject: Re: [RESEND 00/25] Rid W=1 warnings from HID
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=btissoir@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Zhang Lixu <lixu.zhang@intel.com>, linux-iio <linux-iio@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Anssi Hannula <anssi.hannula@gmail.com>,
 Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Henrik Rydberg <rydberg@bitmath.org>,
 Lopez Casado <nlopezcasad@logitech.com>,
 Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Masaki Ota <masaki.ota@jp.alps.com>,
 =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
 Vojtech Pavlik <vojtech@suse.cz>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-media@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>,
 message to <vojtech@ucw.cz>, Jiri Kosina <jikos@kernel.org>, "L. Vinyard,
 Jr" <rvinyard@cs.nmsu.edu>, linaro-mm-sig@lists.linaro.org,
 Michael Haboustak <mike-@cinci.rr.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Drubin <daniel.drubin@intel.com>,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 6, 2021 at 10:56 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Fri, 26 Mar 2021, Lee Jones wrote:
>
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> >
> > Lee Jones (25):
> >   HID: intel-ish-hid: Remove unused variable 'err'
> >   HID: ishtp-hid-client: Move variable to where it's actually used
> >   HID: intel-ish-hid: pci-ish: Remove unused variable 'ret'
> >   HID: intel-ish: Supply some missing param descriptions
> >   HID: intel-ish: Fix a naming disparity and a formatting error
> >   HID: usbhid: Repair a formatting issue in a struct description
> >   HID: intel-ish-hid: Fix a little doc-rot
> >   HID: usbhid: hid-pidff: Demote a couple kernel-doc abuses
> >   HID: hid-alps: Correct struct misnaming
> >   HID: intel-ish-hid: Fix potential copy/paste error
> >   HID: hid-core: Fix incorrect function name in header
> >   HID: intel-ish-hid: ipc: Correct fw_reset_work_fn() function name in
> >     header
> >   HID: ishtp-hid-client: Fix incorrect function name report_bad_packet()
> >   HID: hid-kye: Fix incorrect function name for kye_tablet_enable()
> >   HID: hid-picolcd_core: Remove unused variable 'ret'
> >   HID: hid-logitech-hidpp: Fix conformant kernel-doc header and demote
> >     abuses
> >   HID: hid-uclogic-rdesc: Kernel-doc is for functions and structs
> >   HID: hid-thrustmaster: Demote a bunch of kernel-doc abuses
> >   HID: hid-uclogic-params: Ensure function names are present and correct
> >     in kernel-doc headers
> >   HID: hid-sensor-custom: Remove unused variable 'ret'
> >   HID: wacom_sys: Demote kernel-doc abuse
> >   HID: hid-sensor-hub: Remove unused struct member 'quirks'
> >   HID: hid-sensor-hub: Move 'hsdev' description to correct struct
> >     definition
> >   HID: intel-ish-hid: ishtp-fw-loader: Fix a bunch of formatting issues
> >   HID: ishtp-hid-client: Fix 'suggest-attribute=format' compiler warning
>
> These have been on the list for a couple of weeks now.
>
> Is there anything I can do to help expedite their merge?
>
> I'm concerned since -rc6 has just been released.

Sorry for the delay.

I am currently queuing them locally and running a few tests on them. I
don't expect anything to happen, but better be safe than anything.

FWIW, I am splitting the series in 3:
- 11 patches for intel ish are going to be queued in for-5.13/intel-ish
- the thrustmaster one in for-5.13/thrustmaster
- the rest (13 patches) will be sent in for-5.13/warnings.

Cheers,
Benjamin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F98D167BA9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4438B6F3ED;
	Fri, 21 Feb 2020 11:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDB56E227
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 19:13:50 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id n25so4024102lfl.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 11:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jtGfCZ6Tt9nUtJs/4fCZbyPWZOZzIWbBkr2JPN+tTJ8=;
 b=YGBQF1DwPBtMmghk2sblaYVP5/14qwbXmY/QJcnKFI9whyFZjAeC8/6poFolPl9sHk
 15xN02AviSmyITu7QB9VdCGClnENhzaUzT0+Padx+4z5I0Ml73Z6jKoH4cUIPWi6XRov
 daM0gPriqHZy87AFnXdWz4XDbM3cmh8uagZJoDG5Dohn4QSU6WsDmsp865rsBbyIZB4o
 feMlIJRP/8hJ3IaIIOijFujFaxe9jV5AUZqWb17+Ww08CNgkSteV4cQsRCT1V/LFJOYi
 N/noj6dQi7+yD1icEzllmTVLaR2q20B96dB+5RPMC9I6Jh4uLdPqnIFOxC3MBhxxMMSJ
 uh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jtGfCZ6Tt9nUtJs/4fCZbyPWZOZzIWbBkr2JPN+tTJ8=;
 b=UGx7zGDu1dhkrkMlC5ISGA7IilupI/paoiVvquI6D63t6mPKet6ETpBCyJViUAQPUJ
 8KSWY49ik/SWI/4Jmw7Ni96Y+AHPqcl4GoTnQKKKh64AnEr5eUOZje7J22rf14yHEUGk
 2VYQP4sNo+5yvGO8qaL6KxAAN+7zt/RG4UwwvewRq636Mft26WiixXax4/k9XEN57zEW
 XrIjluFqxWq6uOhKGZ1OZ8w4SJ2k3zmWyaTCUcgMuTWu2Vh+9ZtVQbButH1Ak3rF4amI
 ntvrBHJpnOkNCYY4eFYxGKjqZeHKiRqkJChRavakUNT+UgUa3OL9pvwMlfZrqF/rNpbg
 78qg==
X-Gm-Message-State: APjAAAXw1ARASeWcAXeANMp1OGGq2uCB+olNgtpg1qsK0msn8tieEgI5
 J1Oe1pjyBxQ8Sp8iJ+6en+gUcMmVjMvSO5WCNUK8Pw==
X-Google-Smtp-Source: APXvYqzg8s50xmcwT+LpIu6nvPTBFwgpY+hE0DY/gee/4/ibTmwRrPaemXe5HVlQzJgdENN2Q7BMW397mtDgSpOswVg=
X-Received: by 2002:a19:5e1d:: with SMTP id s29mr17601785lfb.21.1582226028830; 
 Thu, 20 Feb 2020 11:13:48 -0800 (PST)
MIME-Version: 1.0
References: <20200220074637.7578-1-njoshi1@lenovo.com>
 <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
 <HK2PR0302MB25937E2946BF38583B3A905DBD130@HK2PR0302MB2593.apcprd03.prod.outlook.com>
 <CACK8Z6GwuOnJUUscriGwKWGBp5PFKyuqUkFYC8tEXa0UEuEZww@mail.gmail.com>
 <PS1PR0302MB260492DDE243BE0A64A39AA7BD130@PS1PR0302MB2604.apcprd03.prod.outlook.com>
In-Reply-To: <PS1PR0302MB260492DDE243BE0A64A39AA7BD130@PS1PR0302MB2604.apcprd03.prod.outlook.com>
From: Rajat Jain <rajatja@google.com>
Date: Thu, 20 Feb 2020 11:13:12 -0800
Message-ID: <CACK8Z6HWkafL4EzOndRyiA3k-VyUg8bQ=2diw_wJSxSTyqsE+w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
To: Mark Pearson <mpearson@lenovo.com>
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
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
 Jingoo Han <jingoohan1@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

Hi Mark,


On Thu, Feb 20, 2020 at 11:03 AM Mark Pearson <mpearson@lenovo.com> wrote:
>
> Hi Rajat,
>
> > -----Original Message-----
> > From: Rajat Jain <rajatja@google.com>
> > Sent: Thursday, February 20, 2020 1:39 PM
> > >
> > > For this particular issue what is the best way to contribute and get
> > > involved? We'd like to make it so ePrivacy can be used more easily from
> > > Linux. I agree a more generic way of controlling it would be good.
> > > I looked at the proposed patch from Rajat
> > > (https://lkml.org/lkml/2019/10/22/967) - it seems like a good solution to me.
> > > We can help with testing that on our platforms if that would be useful.
> >
> > Thanks you, just so that you know, the latest patchset is at:
> > https://lkml.org/lkml/2019/12/20/794
> >
> > It would be great to get some additional testing if possible. I can
> > send a sample ACPI (for our platform) in case it helps.
> >
> Sounds good - we'll definitely try this out and see how it goes. I suspect we'll have some questions once we try it out and get more familiar.
>
> > >
> > > I need to understand how we connect that implementation with the ACPI
> > > controls we have (as I believe what we have are thinkpad specific and not to
> > > a drm spec; we need to confirm that). We also have the ACPI events that
> > > notify if ePrivacy was changed by the hotkeys and that seems like something
> > > that should be done in thinkpad_acpi.c and not the drm code.
> > >
> > > Not sure if the two need to be connected somehow (or if handling the
> > > event is actually not important and polling is acceptable)?
> >
> > So there was some brief discussion about this on my patches - but
> > atleast on  the platforms I have seen, there was no way to change the
> > privacy screen out of software / kernel control. Essentially, if there
> > are hotkeys, they would send an input event to the kernel, who'd send
> > them to userspace, who'd use the DRM method to toggle the privacy
> > screen. Thus the current version of the patch only supports
> > controlling the privacy screen via set() method. The get() method just
> > returns the cached value.I hope that works for you.
> >
> OK - on the thinkpads we have function+D as a 'hotkey' to control the feature...and my understanding is that bypasses everything and goes straight to the firmware.
>
> The changes Nitin had been working on in thinkpad_acpi.c was to make this more Linux and friendly - provide a sysfs hook for user space to connect to with the aim of allowing it to be configured from user space and have on screen display when it was triggered etc.
>
> I'm personally not sure yet how this ties up with the DRM method - more digging required. I'm intrigued to see if it works on our systems (sadly I don't have anything with that feature available on my desk right now...I need to get my hands on one)

Just FYI, Here is the brief discussion we had about an interrupt
mechanism to support a (hardware based) "kill switch" for the privacy
screen.
https://lkml.org/lkml/2019/10/25/992

Thanks,

Rajat

>
> Thanks
> Mark
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

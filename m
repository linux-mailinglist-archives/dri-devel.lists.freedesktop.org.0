Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F98B167BA4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFC96EF3F;
	Fri, 21 Feb 2020 11:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AC16EE43
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 18:39:41 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id o15so5298505ljg.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 10:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3vyjS+sSAn3HYPmeF1oEJkpsll37OiGUssC+8/K51/4=;
 b=Fet/hAJhRQDtnDP9fg9J/Du5q7cM5Im1hzXwBAPqhu2dstZav58Aai8qQzGCEwopyz
 zMPwaJnL1eR877ocln94AJ6Vpjh7ddFYahar/44+bdmjT5tB438dLnZx/xywAczqBiRD
 igdNTNKR8Yze1Wl0UJPDmfdxu8eYKckGOqDfW1iOhhdPbn9kZv2BE5LoO8eTcyv+QrtC
 tp2Tk4EuXHgorJDZ12DDHBsZ/lLGCqO41vga0yBfiQ5fxGgLuueeB6V5eAtnz6q2uYTm
 QLlKStRRGLoPj2IWAXDSFUIG7hc2LlcmmjwAnXRUrNDn3nczFFgFAa04qDglWe+mey4t
 C+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3vyjS+sSAn3HYPmeF1oEJkpsll37OiGUssC+8/K51/4=;
 b=jTUNpiGZaUNn3bqoiLxffWovzneKXAT3Sfa36oY2+oOmUAUAJ/OaN/HcEsQFFDRK9y
 dpo3rIZoF+Cb0uLXYuzDjGR2/owCJbf3TZl2pL944BZo3+25yN0Hj/lbfQRWqFDpFBx6
 Wiv3PDVBkEnaSckk4dyIwQiNFJmWpUYZUAh1j6yLFrc9hLLVfguW5nf0NUEyWHPataE4
 bSB9EcZMhh5Re/XCPdhMxlEiuJxbjRy5Hi5KHkfSDT0twMRf3zaciW6BIW6coZ4DSm0e
 FbC7IcNRJvr7ZtlP52JGn/MzRh+CjWV/IB3+PW7lvInJefEj+o3vn4JCizqXoPe4F/Ch
 F2og==
X-Gm-Message-State: APjAAAVVzyVRpiWp5Zj/yxiEP+wIGl5yHef4bZo3utt0m5QioPzxFS2x
 d3pjeFErSf5LG/pA3qPmvSSTxqwpOIsNFFMAdbQo5Q==
X-Google-Smtp-Source: APXvYqys1CrHuhdls6fUzfaBKFoB6DGlWqs1OzjbcuZBdCWN4qR+/3UHYv/iiSDM7pzKg5S+L4o+VvdSv2sjVcwdDUo=
X-Received: by 2002:a2e:94c8:: with SMTP id r8mr19894589ljh.28.1582223979390; 
 Thu, 20 Feb 2020 10:39:39 -0800 (PST)
MIME-Version: 1.0
References: <20200220074637.7578-1-njoshi1@lenovo.com>
 <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
 <HK2PR0302MB25937E2946BF38583B3A905DBD130@HK2PR0302MB2593.apcprd03.prod.outlook.com>
In-Reply-To: <HK2PR0302MB25937E2946BF38583B3A905DBD130@HK2PR0302MB2593.apcprd03.prod.outlook.com>
From: Rajat Jain <rajatja@google.com>
Date: Thu, 20 Feb 2020 10:39:02 -0800
Message-ID: <CACK8Z6GwuOnJUUscriGwKWGBp5PFKyuqUkFYC8tEXa0UEuEZww@mail.gmail.com>
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

On Thu, Feb 20, 2020 at 7:14 AM Mark Pearson <mpearson@lenovo.com> wrote:
>
> Hi Andy
>
> > -----Original Message-----
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Thursday, February 20, 2020 5:43 AM
> >
> > On Thu, Feb 20, 2020 at 9:48 AM Nitin Joshi <nitjoshi@gmail.com> wrote:
> > >
> > >   This feature is supported on some Thinkpad products like T490s, Thinkpad
> > >   X1 yoga 4th Gen etc . The lcdshadow feature can be enabled and disabled
> > >   when user press "Fn" + "D" key. Currently, no user feedback is given for
> > >   this action. Adding as sysfs entry allows userspace to show an On Screen
> > >   Display whenever the setting changes.
> > >
> > >   Summary of changes is mentioned below :
> > >
> > >  - Added TP_HKEY_EV_LCDSHADOW_CHANGED for consistency inside the
> > driver
> > >  - Added unmapped LCDSHADOW to keymap
> > >  - Added lcdshadow_get function to read value using ACPI
> > >  - Added lcdshadow_refresh function to re-read value and send notification
> > >  - Added sysfs group creation to tpaci_lcdshadow_init
> > >  - Added lcdshadow_exit to remove sysfs group again
> > >  - Implemented lcdshadow_enable_show/lcdshadow_enable_store
> > >  - Added handler to tpacpi_driver_event to update refresh lcdshadow
> > >  - Explicitly call tpacpi_driver_event for extended keyset
> >
> > Adding custom PrivacyGuard support to this driver was my mistake,
> > There is a discussion [1] how to do this in generic way to cover other
> > possible users.
> > I Cc this to people from that discussion.
> >
> > [1]: https://lore.kernel.org/dri-
> > devel/CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail
> > .gmail.com/
> >
> Thanks for the pointer to that thread - really useful and interesting, we weren't aware there was an ongoing exercise to do this.
>
> I work with Nitin as part of the Linux team at Lenovo. We're trying to get more directly and actively involved in the open source community to improve the Linux experience on Lenovo devices and of course want to make sure we contribute the right way. We're all still pretty new so pointers and help are very much appreciated (we've been getting some great support from the distros to get us started).
>
> For this particular issue what is the best way to contribute and get involved? We'd like to make it so ePrivacy can be used more easily from Linux. I agree a more generic way of controlling it would be good.
> I looked at the proposed patch from Rajat (https://lkml.org/lkml/2019/10/22/967) - it seems like a good solution to me. We can help with testing that on our platforms if that would be useful.

Thanks you, just so that you know, the latest patchset is at:
https://lkml.org/lkml/2019/12/20/794

It would be great to get some additional testing if possible. I can
send a sample ACPI (for our platform) in case it helps.

>
> I need to understand how we connect that implementation with the ACPI controls we have (as I believe what we have are thinkpad specific and not to a drm spec; we need to confirm that). We also have the ACPI events that notify if ePrivacy was changed by the hotkeys and that seems like something that should be done in thinkpad_acpi.c and not the drm code.

Not sure if the two need to be connected somehow (or if handling the
event is actually not important and polling is acceptable)?

So there was some brief discussion about this on my patches - but
atleast on  the platforms I have seen, there was no way to change the
privacy screen out of software / kernel control. Essentially, if there
are hotkeys, they would send an input event to the kernel, who'd send
them to userspace, who'd use the DRM method to toggle the privacy
screen. Thus the current version of the patch only supports
controlling the privacy screen via set() method. The get() method just
returns the cached value.I hope that works for you.

Jani, I'm waiting on your inputs here
https://lkml.org/lkml/2020/1/24/1932 in order to send the next
iteration of my patch. Can you please let me know if you have any
comments.

Thanks & Best Regards,

Rajat

>
> As a note Nitin has been working with the Red Hat folk and is looking at the user space aspect of this (in particularl gnome settings) as well.
>
> Thanks
> Mark Pearson
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

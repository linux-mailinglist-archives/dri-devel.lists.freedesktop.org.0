Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84606165C20
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 11:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EB06ED22;
	Thu, 20 Feb 2020 10:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8362D6ED22
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 10:51:03 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id w4so1044821vkd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 02:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kxfpH7hofI2dT1EmNwZZMlMZMqhtSme6d7SbXx3CYq0=;
 b=Np8DJaVuBXgINq398uI6JEI2yyXyGAh82e7JU+kt0/8soFTOF7YQwPC5PE0wGnizng
 ue5XDE3A+y5lsbRnJzClaOJx6v6ZFg1wgwpYORYjNPerLUsWeb29Yh35FoYYmmI6JAj1
 ZT2DAkdxv3Tiwb4WTCwqVqCinjAbA81UN604IN7J28r4b538GGiRZaoVmlD2tYfIvJmU
 /rHaEx693IcAHpxrikt9vHfdi//+DyrLKz4trG/Dd/Mb2gekSeNATFmbId4UH+odFZaL
 AJ4PR9y1fLZytpGX/rKF5f5KDyk52m9bfbwHZFakl1bsfjT0OqJxfx8EhXy6WM53xPBQ
 QC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kxfpH7hofI2dT1EmNwZZMlMZMqhtSme6d7SbXx3CYq0=;
 b=GyOa+9QtnRCx5+OvUcEiSlR9ZoBvgBa+M4qdEzb2D9isAYK83E2FQFvp2j7ITFNpP+
 lrH5lyoBOnABC4WgBVms0lMFnasxi8cbRYoutl8600TTd2hqfq/jDqjrAAzP/Cq5amwT
 7ahWAtpZzPusqO6n2WyCyXb8YOR6NffHl9x3Ogy8lOZM95O8abGRULNKhtLKwQd3HOmy
 4EuzR8M//WoW7xlmxB6q1QVmv47yDElmKItc7xT3TjYWyKX/qb2IwSQugIHoRTM6sBNK
 6jurJO1KwslP3+VhSLQyUbhzPLJslEOX0DrfbO09g/ObyCWLLMpuOtTGKB3ltxyA6PTG
 68Pw==
X-Gm-Message-State: APjAAAWOzc9V2JuY7X3e/+QeAJGlYbct9PT5t5GHWCxAWC10Hg6u/of7
 COnNjyGwnv+KM+54mfdJo9pYqwJqNieMzOFpiLbn/cI8X2JqLQ==
X-Google-Smtp-Source: APXvYqyHQqwt0fFFU50KayafdANVX58ZyOixQ8mFOe6NZ0nt1CDX7R20BmOadWkafwXoQFVKDWu+YMxD5wBWkSmoyOQ=
X-Received: by 2002:a62:1a09:: with SMTP id a9mr31501241pfa.64.1582195381200; 
 Thu, 20 Feb 2020 02:43:01 -0800 (PST)
MIME-Version: 1.0
References: <20200220074637.7578-1-njoshi1@lenovo.com>
In-Reply-To: <20200220074637.7578-1-njoshi1@lenovo.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Feb 2020 12:42:53 +0200
Message-ID: <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: Add sysfs entry for lcdshadow feature
To: Nitin Joshi <nitjoshi@gmail.com>, Mat King <mathewk@google.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Rajat Jain <rajatja@google.com>
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
Cc: Nitin Joshi <njoshi1@lenovo.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
 Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>,
 mpearson@lenovo.com, Benjamin Berg <bberg@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 9:48 AM Nitin Joshi <nitjoshi@gmail.com> wrote:
>
>   This feature is supported on some Thinkpad products like T490s, Thinkpad
>   X1 yoga 4th Gen etc . The lcdshadow feature can be enabled and disabled
>   when user press "Fn" + "D" key. Currently, no user feedback is given for
>   this action. Adding as sysfs entry allows userspace to show an On Screen
>   Display whenever the setting changes.
>
>   Summary of changes is mentioned below :
>
>  - Added TP_HKEY_EV_LCDSHADOW_CHANGED for consistency inside the driver
>  - Added unmapped LCDSHADOW to keymap
>  - Added lcdshadow_get function to read value using ACPI
>  - Added lcdshadow_refresh function to re-read value and send notification
>  - Added sysfs group creation to tpaci_lcdshadow_init
>  - Added lcdshadow_exit to remove sysfs group again
>  - Implemented lcdshadow_enable_show/lcdshadow_enable_store
>  - Added handler to tpacpi_driver_event to update refresh lcdshadow
>  - Explicitly call tpacpi_driver_event for extended keyset

Adding custom PrivacyGuard support to this driver was my mistake,
There is a discussion [1] how to do this in generic way to cover other
possible users.
I Cc this to people from that discussion.

[1]: https://lore.kernel.org/dri-devel/CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com/


--
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

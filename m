Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EB717A0F4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4336EB9D;
	Thu,  5 Mar 2020 08:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9C16EAEE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 01:32:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id e18so4192906ljn.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 17:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4HMQNCh8vMtS8huYgq84r8uqSM6EgoeBWcfhHoxj7sA=;
 b=IbscVJ4P70dNoJjjSR0QiV/DyYCq0hXkFodHCfvHSxBXyWsHSZDZVJYNFDKigPj3pa
 /FSMSZQxoZ/t/FqRwj6NlivaAFdFFpyI1SJKTu641gQhaIAC3YWjxmAgttClTiN5dqhf
 ygGh6rSsQgCs/kJDBUiulDZKftNDr9hn5nR7sQDEVKitG2bDUQmKhjn4P4jzuJClcyLS
 v3CULB+B/zhm1+0QmZcuseDR/X4PHSQQyIciQum5yjkZn656il4KIfbe9V/9mdZotVqk
 ikRJxdhyBI6yU2XE9+3fS/4YsEp+Srpz0YpR4hplPmyYJcMqmeqttkV477ENMM0UMb0w
 uvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4HMQNCh8vMtS8huYgq84r8uqSM6EgoeBWcfhHoxj7sA=;
 b=JyS76pia35o+vYiSvGFLlKQwM44YgN03oLynqAck5LVVnP8Gz+wCWM/Q5oGJf/kTZv
 y74FUG6W7S11+/byxohQK4zJSLN/Vlsz/mDabiUfwoyT+HdzNrhto0Y3U+eqTfCAuK+G
 x4rK6lYCYuU+Tj/VbzspJA3RANjy+FFYFGUvCdZ4sbl+tWX4q6jglIn6xar3NSpXiDbo
 JfkFKStxrhxr4koFNy08ZML6KtOoRIJLpwo1Ld4kum092w+oN3Cd/k2DQXGNW8bzO7Uo
 VXZr3ku2F3QJgTLcKQw3DVSuhDtILCnw+ts8bNcZ0rxfuYyOaKfXOyVVVz0Gl/GiQd4Z
 D4cA==
X-Gm-Message-State: ANhLgQ0/cEKGs02jQh3FcpcJNpDqcvCOhKAObk6O2MxrwzrmoZ6FPWF4
 muuZki6eq2kD8hF5C1f1m1dXbBXKl1E1idMzFnzhHQ==
X-Google-Smtp-Source: ADFU+vsibVaPx3bCAeKU5DVQeMFImZ4CyqmQaagmYYNUnD0GWRvQYDrsCxTC7PSAw+0kuQYYjGN6XW79WiaDgbR0B78=
X-Received: by 2002:a2e:6a09:: with SMTP id f9mr3438236ljc.107.1583371975482; 
 Wed, 04 Mar 2020 17:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20200220074637.7578-1-njoshi1@lenovo.com>
 <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
 <HK2PR0302MB25937E2946BF38583B3A905DBD130@HK2PR0302MB2593.apcprd03.prod.outlook.com>
 <CACK8Z6GwuOnJUUscriGwKWGBp5PFKyuqUkFYC8tEXa0UEuEZww@mail.gmail.com>
 <87r1yoxgwg.fsf@intel.com>
In-Reply-To: <87r1yoxgwg.fsf@intel.com>
From: Rajat Jain <rajatja@google.com>
Date: Wed, 4 Mar 2020 17:32:19 -0800
Message-ID: <CACK8Z6EG7gX0ehMpmnFeu4bS_qF8L1dKnHGwMRY=HOv6K39VHw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
 Nitin Joshi1 <njoshi1@lenovo.com>,
 Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
 Jingoo Han <jingoohan1@gmail.com>,
 Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Mat King <mathewk@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Shevchenko <andy@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Darren Hart <dvhart@infradead.org>, Nitin Joshi <nitjoshi@gmail.com>,
 Mark Pearson <mpearson@lenovo.com>, Benjamin Berg <bberg@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 4:29 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Thu, 20 Feb 2020, Rajat Jain <rajatja@google.com> wrote:
> > Jani, I'm waiting on your inputs here
> > https://lkml.org/lkml/2020/1/24/1932 in order to send the next
> > iteration of my patch. Can you please let me know if you have any
> > comments.
>
> Yikes, sorry, I didn't realize you were still waiting for my input. :(


Hi Jani,

I have posted a new iteration of my patchset at:
https://patchwork.freedesktop.org/series/74299/

I'd appreciate if you could please take a look and provide any comments.

Thanks & Best Regards,

Rajat


>
> BR,
> Jani.
>
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

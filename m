Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C419B12D04C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2019 14:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046BE8967F;
	Mon, 30 Dec 2019 13:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E918967F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 13:31:34 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id h13so8271382vkn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 05:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oNV29BbOxXflnyWwf2B0CxiU+GnStWQ9JexGoMU2XlI=;
 b=Qr8gscKlr0x3QNw5/UG6H6605ovPfe83GBn13tR7j85Yiotg6vbGAc1/tYVxW65w0L
 3xl6SGCq8hQeq6d7jVn4qp1kIrjC8SkkiXZFfcbKzWAaWEjzfo8yGnqrEnJcJYiM+y+i
 us4nfaGrq0lxpSiObbP+DPDDLtAUNSsUJn09U15Fci3PnTJR8ci02QxipCMwiT6GjX2N
 i3xkh3nQXNM9sVBkVc3H52Gu+FjKxaWE7ZoeNrANH8TMk4JCUjzVVyXtS0xbalYg9luG
 iQSHCzMwwHJNQORoT1anC7Mi3ybsVxNdecXs2n2wNnLcwqOqx9nfJoj9YAbKGj/k7rsm
 gY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oNV29BbOxXflnyWwf2B0CxiU+GnStWQ9JexGoMU2XlI=;
 b=VZqI+BOWHKvmafHTfLXDvsX59xHUAu/YXOtUpvKtZK9/IIVdmQxMpTlXY70WXd2GUU
 Suct1yHJqjAo3xkG5udryIOuMCwQPBJFQaYJYE6futnd+nHpDkuD0vjc4cOk7tsfJgL7
 X0RYiEbPqL2N3/S898PgcD5MnqZwUS/UXQp2mNazx4ZPBQfgcezaN+pwpUFoT+EvcLTw
 qw4XLWTt6CU2W+l2VzYagFISAmDmKN2oM6uGkguRqn7Bg4/FLu9LfTxK+hAVbZDYROnD
 4qVzQpEAjGxk4PYscqxD1e/zsA6xNu1+OCFNNkfr1PO8M7ooToiG1vri0XlUUWZvVOL9
 6NOQ==
X-Gm-Message-State: APjAAAUghMrTeTbKN81LeCTPlk035rlqUsWYHlyN9U5DVq8d5Wh9UnFd
 SrQV3y9cCStvXqDRHjdfxQdmaEb/gvevlZh/yRKadg==
X-Google-Smtp-Source: APXvYqxFag2CvxhfF9l68e0E6H1HTPVbDP+2WETnXmzv5qTwFtUcF8TJWRh54oESNBk460c12mL7WeiqbGkL+w36S/8=
X-Received: by 2002:a05:6122:1065:: with SMTP id
 k5mr38200538vko.14.1577712693691; 
 Mon, 30 Dec 2019 05:31:33 -0800 (PST)
MIME-Version: 1.0
References: <20191216205122.1850923-1-hdegoede@redhat.com>
 <20191216205122.1850923-2-hdegoede@redhat.com>
In-Reply-To: <20191216205122.1850923-2-hdegoede@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Dec 2019 14:31:22 +0100
Message-ID: <CACRpkdaXFSJVkWJGzsVcvbUA9gpgP0Vbkwf1H-HWw8s35R9XYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: Allow modules to use
 pinctrl_[un]register_mappings
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 9:51 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Currently only the drivers/pinctrl/devicetree.c code allows registering
> pinctrl-mappings which may later be unregistered, all other mappings
> are assumed to be permanent.
>
> Non-dt platforms may also want to register pinctrl mappings from code which
> is build as a module, which requires being able to unregister the mapping
> when the module is unloaded to avoid dangling pointers.
>
> To allow unregistering the mappings the devicetree code uses 2 internal
> functions: pinctrl_register_map and pinctrl_unregister_map.
>
> pinctrl_register_map allows the devicetree code to tell the core to
> not memdup the mappings as it retains ownership of them and
> pinctrl_unregister_map does the unregistering, note this only works
> when the mappings where not memdupped.
>
> The only code relying on the memdup/shallow-copy done by
> pinctrl_register_mappings is arch/arm/mach-u300/core.c this commit
> replaces the __initdata with const, so that the shallow-copy is no
> longer necessary.
>
> After that we can get rid of the internal pinctrl_unregister_map function
> and just use pinctrl_register_mappings directly everywhere.
>
> This commit also renames pinctrl_unregister_map to
> pinctrl_unregister_mappings so that its naming matches its
> pinctrl_register_mappings counter-part and exports it.
>
> Together these 2 changes will allow non-dt platform code to
> register pinctrl-mappings from modules without breaking things on
> module unload (as they can now unregister the mapping on unload).
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

This v2 works fine for me, I applied it to this immutable branch in the
pinctrl tree:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-pinctrl-unreg-mappings

And pulled that into the pinctrl "devel" branch for v5.6.

Please pull this immutable branch into the Intel DRM tree and apply
the rest of the stuff on top!

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

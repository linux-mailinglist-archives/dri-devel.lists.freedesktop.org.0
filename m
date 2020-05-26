Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D651E3A1E
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 09:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849B46E29B;
	Wed, 27 May 2020 07:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163A389BA1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 09:09:30 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id s18so7209371ioe.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 02:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=65DH7Yx0+fRXnGfTN5n2O+g3E3WvwmCcWicmHyQ3lkw=;
 b=FCv7xAIGa3GDtpOxxLydbMoT+Iw41+0kjN35MW95QkVD8PAPGZ1TxmVabCgrmY78yz
 YECjqBhJyS3zolx/8xJBac4XU6h6cR1XZeg4CU6PHNTd2M9LqK+5kG/wEL7WsNC0nwh2
 gpV6e5BVy/uEF4hB82amE9VWBObm/w9rtxMNYLCy9RJ2jehRXjw+lDnYVC8orvZjHDMT
 rL1IDBgV7Kaq4tgq+ETv5CEvY8otenJzY1txlxblMAVo2Q6SsJnSDaWGL8pbVwNfm6XY
 8lo7KDJvjfz2uLhMVx5UTVNw3KpZA0aLli0XNP1vDH7YD/+aT6hJGg+YsCdtPHB995O1
 j2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=65DH7Yx0+fRXnGfTN5n2O+g3E3WvwmCcWicmHyQ3lkw=;
 b=OQx21gqqF41Z1BobtzerMZh1BTXVHn6VPgZ+CgJMGDIp31UW+vNvRe5/PcK+dRn+fk
 sYeChPs5kYYDlBsfTIcmeenorUUZ0++yzPGwS/rxB5sqLXSn4rMV28zYh3Ied5Ury8NC
 3dvcxGwKPYbIdoCuhf9iFPzSuhkbKY7ax5dSa9Knun4srL4OV7LGaKbTJ4cihsMq/Hyw
 mWKCecAEcGA9wt5R4u8giHsp0BnLmy9kPWaJATQrYBF6EO4l5uo/mw/1zWwgaP0NchAt
 VYnBbLhYUl5XeyuwSMUFUP5MrmRrTmDyzfxyIg7Afdcfsv3Bzj+Km27wLzFL+9JVU2+z
 85Mg==
X-Gm-Message-State: AOAM531/32O9uhcYBQTE/H95m3qIrwgdOpjsuCSwBdI9OHn658Y8V1Fa
 Y/Bn+fX5n9Jn1HDSXa7YjTM8zkZeWJADnCNsgBM=
X-Google-Smtp-Source: ABdhPJx+ZPvWfEF3Pa4JXfWwedh02p2n1SzhlABrsxCC4DunBcpjHogzclvpkhogi3xaE3bp5rzPidO7NY54+A2lD6E=
X-Received: by 2002:a5e:a80e:: with SMTP id c14mr16354378ioa.3.1590484169175; 
 Tue, 26 May 2020 02:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
 <1590378348-8115-7-git-send-email-dillon.minfei@gmail.com>
 <CAHp75VebSZa6mwAETnM0t42RQCp4iM6_SNjmy3TB48ixsGKV8g@mail.gmail.com>
In-Reply-To: <CAHp75VebSZa6mwAETnM0t42RQCp4iM6_SNjmy3TB48ixsGKV8g@mail.gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Tue, 26 May 2020 17:08:53 +0800
Message-ID: <CAL9mu0+jmcivC6zAXxK0-oXy3n44pAU1QGD7BDq=CT2D7twROQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] drm/panel: Add ilitek ili9341 panel driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailman-Approved-At: Wed, 27 May 2020 07:15:42 +0000
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for input.

On Tue, May 26, 2020 at 3:46 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, May 25, 2020 at 6:46 AM <dillon.minfei@gmail.com> wrote:
> >
> > From: dillon min <dillon.minfei@gmail.com>
> >
> >     This driver combine tiny/ili9341.c mipi_dbi_interface driver
> >     with mipi_dpi_interface driver, can support ili9341 with serial
> >     mode or parallel rgb interface mode by register configuration.
>
> Noralf told once that this driver should be unified with mi0283qt.c.
>
> So, what should we do here?
>
> --
> With Best Regards,
> Andy Shevchenko

from sam's suggestion, we can't setup two drivers to support one panel
in the tree. so, i copy the mipi dbi part from tiny/ili9341.c. to this driver
from register settings and dts binding is keep the same to tiny/ili9341.c.

so, in my opinion if tiny/ili9341.c is unified with mi0283qt.c, this
driver should be
too.

thanks.

best regards,

Dillon,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

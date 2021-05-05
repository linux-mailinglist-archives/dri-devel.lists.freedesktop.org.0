Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B08E373BC8
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 14:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CC06E499;
	Wed,  5 May 2021 12:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BA16E4C5;
 Wed,  5 May 2021 12:55:38 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so770737pjz.0; 
 Wed, 05 May 2021 05:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZhuV1fIZkH25YePI0Y3P6MxQ5i4J7rTme3KQYtyR73Y=;
 b=gRI6Ic2tMSpnsSMhV6oDdci/E4PlN6TPeYZ6VGH7yYcXBOfTtOXVaQvWyKUvhThmrN
 JqBm5/kmvoOPA6RqgKpOkINzlUtnVrtvqDCtkTmqhq5FxJJgmGoLXJGYsRjI4YBcghkh
 A4meN/1fuuQMhxEmvLyhFbeliG/A22YQ7JllWCKLnlzDeMNt4ALzf06o+YabaeOChbg3
 u1LFxMvxUYcUDW4p2t+95kvBwtLAfCAu7Gz/5mOHDlGjI7nwUfPhpmjIH9B/4aQZnKar
 gwZ06pliPHDiHPWGjU7ti2fGSjqdDLxvTiOpPny151NLZtRYjNcsA+2Kmqu4BdeDiSq+
 XjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZhuV1fIZkH25YePI0Y3P6MxQ5i4J7rTme3KQYtyR73Y=;
 b=fCRNQlZBLTfAwWey03Oi67Q0XS55wirSf9vAiqxncg+OIn5DkgVWk8fDBE6rW2C6ey
 PvmwzmNLlDwjYUtGIC82cE59bojuSbOtqVss33aKYBbx/hNRTX9P4EYnOqnwH9bD/o2G
 0AbGPCuhUmxXuTQmWFlvftpLLyfKsVgyIYxb3EA2+RHjAIKmCAN+YZr3ypExHGOdR1Vk
 UcPD6oeTYKYQ9bKxCsN8fD7QR8O0zvktI8T3zAeGdqMCeYzZAUVqXKxvFZPzdsb/RPOC
 RVGgc6I00hg1Wa7AKQw9sE1kIeAKcTW08a2LO6dtJqS2k43yaUZecswyvDQBh60gf/Na
 j3Jw==
X-Gm-Message-State: AOAM530RhXs8j11TTDpZCeGiiAdD2p9fWmceGT1xorxa+7DJtI5Ut4A3
 mK0W07motlKp1JRX3LAb/GkCHeXforbhgojY23g=
X-Google-Smtp-Source: ABdhPJzCTkEkc6x9bPHAS+mMVokm63i+ft0JaoTpGrUgTTekG8+kZol92XMK91SVh8Y2tQwk7nOjar/WpkGDyy7r//k=
X-Received: by 2002:a17:90a:d90c:: with SMTP id
 c12mr11705143pjv.129.1620219337894; 
 Wed, 05 May 2021 05:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-6-hdegoede@redhat.com>
 <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
 <ee230261-423d-0e2f-16b0-852d264afa2b@redhat.com>
 <CAHp75VcfkcaVAu2-8-5he7PN=W_tRHiHAgXYn04gRnLehDVsyQ@mail.gmail.com>
 <ffb46bb6-3548-4ec2-f176-99f3674e7f6d@redhat.com>
 <CAHp75VcHEMaZ67yy7TD8f8Nk=+oiLT-vRCt9A6fT9K6LeR78Ew@mail.gmail.com>
 <adb9be8a-70c7-b515-48c3-7e372e5d8801@redhat.com>
In-Reply-To: <adb9be8a-70c7-b515-48c3-7e372e5d8801@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 May 2021 15:55:21 +0300
Message-ID: <CAHp75Vcd0U0MBisj3jYb2gptNk7JU61Jtv-MbwnsDK2hzuxU7Q@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 5, 2021 at 1:30 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 5/5/21 12:02 PM, Andy Shevchenko wrote:

...

> But we do really need to document the behavior better here
> in the kdoc for fwnode_get_next_child_node() and
> device_get_next_child_node().

Totally agree!

> of_get_next_child has this bit, which applies to those too:
>
>  *      Returns a node pointer with refcount incremented, use of_node_put() on
>  *      it when done. Returns NULL when prev is the last child. Decrements the
>  *      refcount of prev.
>
> I'll prepare a patch to add this to the kdoc for fwnode_get_next_child_node()
> and device_get_next_child_node() once I'm done with readying v3 of this series.

Thanks!

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

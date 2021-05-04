Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF583372A32
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 14:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ECC6EACF;
	Tue,  4 May 2021 12:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DA26EACF;
 Tue,  4 May 2021 12:35:43 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id h11so7320290pfn.0;
 Tue, 04 May 2021 05:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KqcdT0AytEeEDnmzSPRzsUTe5DmaHnZ6X4D1SBv+COU=;
 b=B9T7YBXKHqVxJHLtHOeib4Xb0ga07E594q1u/8YKnkC42vAnZKk1Ew46Zr1IZCt09L
 E7WF0of1wrtEEyfp5coaotoYYgwkaKGwOVH6BXKyzluAYtiXnUT9Mj3a/ULxajOA31Db
 qypPcDi2s+5NYkVwGZzfxzGUDRxPyQpbYjqFSD2u0htBDOQ5utxQqnd611hxvmcWkZ6f
 BKr8qnew1kaC+U/+dB6oMdy5BXw2vDD5gxXLH/rBTi0kCVwGbDRpJNJolH7RnHNrvh+o
 mNDV5rO9FXaDtUDrG4I5+Ec4zktpGqBaBxF37W347EJ8nsF4NAbkP2PdcnJG7D61d7cV
 UEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KqcdT0AytEeEDnmzSPRzsUTe5DmaHnZ6X4D1SBv+COU=;
 b=YXjvcFyseqOWvrWphd0Fdfh6mTNAFcTFy3xmK2SmAax3DF75rNl0Tk3j6e6hB4+7B1
 4lGMylQMDL//MmAa0Wvk7Va757aoCNelM3507gZ5CjlpCdSGA0qLF7ZHsXGXmkayUD7N
 KTHuGUrlPF7IPX6BEhWixsKISmpXaIvpbllPyxO/i/cfEfxuMjaoI3NL5CtZwJOlMc6c
 TVuj7kwG+anW6JfS3exBMPNZ4R/fvO+gNIYh+12VbNpq+TO13ZnDm4uWgjRAescTuD55
 bgQpl4+1060dFXXJrWAwYH2qCUfNpXQFYLF1XTPdAHGDI7dOlXsCfnvIFYEgC1z6fvYv
 shgw==
X-Gm-Message-State: AOAM531+y9nOo1DCFSFELGB1QDPHWf2h3yqYh6mElL+QHYlubwODYQ+u
 lYoy71Bp0ZMLrcAEe8Pg4BS2/SqGt96eayESkU0=
X-Google-Smtp-Source: ABdhPJwSoLhvTnD73IQz/RnLoQJJpiUnljhDPe3utWq+p163MQ3/DiGswekMo/ZKS7WjTzC0d9RxJaV5qSki/pnamGs=
X-Received: by 2002:a17:90a:246:: with SMTP id
 t6mr12653680pje.228.1620131743200; 
 Tue, 04 May 2021 05:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-4-hdegoede@redhat.com>
 <CAHp75Vcv=sUHafBMjV+BMJgmpsXF0iUn5gudb26E2xGapCiMxg@mail.gmail.com>
 <afbfa6fb-8b1d-3d3c-96b4-d3045584d2b8@redhat.com>
In-Reply-To: <afbfa6fb-8b1d-3d3c-96b4-d3045584d2b8@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 May 2021 15:35:27 +0300
Message-ID: <CAHp75VcsyiWQ_LN8qNQU72SgWyzy0TWcq=N0BLTHHWLSA9Rz1Q@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm/connector: Add drm_connector_find_by_fwnode()
 function (v2)
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
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 4, 2021 at 2:53 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 5/4/21 10:00 AM, Andy Shevchenko wrote:
> > On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:

...

> >     +struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >     +{
> >     +       struct drm_connector *connector, *found = ERR_PTR(-ENODEV);
> >     +
> >     +       if (!fwnode)
> >     +               return ERR_PTR(-ENODEV);
> >     +
> >     +       mutex_lock(&connector_list_lock);
> >     +
> >     +       list_for_each_entry(connector, &connector_list, global_connector_list_entry) {
> >     +               if (connector->fwnode == fwnode ||
> >     +                   (connector->fwnode && connector->fwnode->secondary == fwnode)) {
> >     +                       drm_connector_get(connector);
> >     +                       found = connector;
> >     +                       break;
> >     +               }
> >     +       }
> >     +
> >     +       mutex_unlock(&connector_list_lock);
> >     +
> >     +       return found;
> >
> > If I am not mistaken you can replace this with
> >
> > return list_entry_is_head();
> >
> > call and remove additional Boolean variable.
>
> Found is not a boolean, it is a pointer to the found connector (or ERR_PTR(-ENODEV)).

Ah, perhaps giving a better name? `match` ?

And to the initial topic, it's either an additional variable or
additional branch in this case. I think additional branch (taking into
account the length of the line or amount of lines) doesn't buy us
anything.

> >     +}

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC98279386
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 23:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8376ED5F;
	Fri, 25 Sep 2020 21:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6106ED5E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 21:27:55 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601069274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=eCE9IgIpBRrqzinh4uFdyHdFnL8q1y6u187qAngLgcA=;
 b=Ae4wn8p/BJmTSmiLv9Yq2WeyA0GNQq9dsA2duI9fAYoywqnKjJ5c7GAQhl7t3m7d6Xk5ES
 REIu2wE/MOAnGwZgmJKdq3tS78Q7TuKFUXHdES9iVxjr9vMZ7sE5J3dM3oCrCKVn/fCBoT
 xpdXlQxWnefnULUYkfn8dC4nZQdGoQo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-kXZ1msOQPwm7hR3PZsdfGg-1; Fri, 25 Sep 2020 17:27:43 -0400
X-MC-Unique: kXZ1msOQPwm7hR3PZsdfGg-1
Received: by mail-qk1-f200.google.com with SMTP id y17so3087313qky.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 14:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=eCE9IgIpBRrqzinh4uFdyHdFnL8q1y6u187qAngLgcA=;
 b=Vby6uh9B6GcQJD/ahxoA6KXjCL2NLNh1WDiTaqnI1LTbkShlSxUPYa0vm1ld4VGeUs
 jd3juCo0kxrrwz4gvIHbRBf5WugzkX8PNm+3jujB+DjNI7M6EZV3Nz5AGf6UMgkNwpJz
 yPDPDwln0lBAHrz74U6/ZYqK9VtmeiehoSqfs+6Emt59G+UkOdgdo0k6+/PXaOi7DsvS
 1OuYS6jJZ5HroBf2xF6XbNchD3jbF1r0yekP0r110nc06FKwcmqIoR1xADZqiMdlFcn7
 hqUFYGDCMuEXZEcuRVIQegyXb4dkGDv8wTzjaFp+nNtSCp94jqktlEVDzieIDeeWtDJk
 Sfqg==
X-Gm-Message-State: AOAM533V2ZVfd7vidPGzWZKcVX4FJ3yE4kRka2Lsur4S1dLIYtQgg1V4
 K38mQMMEUzdSMf3k+EAezrvpHtxvmAw1M6wIYgq23ebh1JPnbEJ1QvlpziQfWmrlTz46M6NUwO7
 kXLOg9NTLOzczJG4Hx6mtF3GIUiE6S4s4IMZe1qj2UfnN
X-Received: by 2002:a37:7805:: with SMTP id t5mr2005229qkc.157.1601069263075; 
 Fri, 25 Sep 2020 14:27:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRmcRtelReyh19dAZ0XYkEP+FKTJnm/L/0WMJPajleWzOVqy3LGtKMQVjdfA1iW3gz45OlXxfYW4RKflRra74=
X-Received: by 2002:a37:7805:: with SMTP id t5mr2005208qkc.157.1601069262688; 
 Fri, 25 Sep 2020 14:27:42 -0700 (PDT)
MIME-Version: 1.0
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 25 Sep 2020 23:27:31 +0200
Message-ID: <CACO55ts6hfd_v8V8_yJ45wm8MAN7TENL9pZZmijFaB3h-FrR=A@mail.gmail.com>
Subject: Nouveau wiki migration
To: nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
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
Cc: Jeremy Cline <jcline@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everybody,

I think it's time to finally move our wiki from the old infrastructure
over to gitlab pages.

This comes with several benefits:
* full control through git over the ikiwiki pipeline (setup files,
plugins, system packages, ...)
* random users are able to create MRs against the wiki as long as they
are willing to create a gitlab account.
* possible to migrate over to a different wiki generator or mix and
match or whatever.
* no CGI stuff on the wiki as we don't use ikiwiki for the git
operations anymore

To view the migrate wiki visit this URL:
https://nouveau.pages.freedesktop.org/wiki/
the gitlab project lives here: https://gitlab.freedesktop.org/nouveau/wiki

There are a couple of changes I already made:
* convert the perl ikiwiki setup file to yaml:
https://gitlab.freedesktop.org/nouveau/wiki/-/blob/master/nouveau.yml
* reworked the setup file to throw out unused plugins and adjust
settings for gitlab
* enabled HTML5 (does change the style slightly, but also fixed some
regressions)
* pulled in external sources (from the fdo.org server)
* moved mdwn files into their own subdirectory

For now I changed everything inside one big commit:
https://gitlab.freedesktop.org/nouveau/wiki/-/commit/6f2d1669884af186863718ad827f65372a0c5c43

There are a couple of remaining issues/questions:
* the gitlab CI pipeline fails quite a bit, which could be annoying
* there is a delay between editing and changes going live (usually
below a minute though)
* should we disallow direct editing of files for project members so we
could CI the changes are still valid?

Next steps:
* verify everything still works
* fix remaining issues
* final step: point the subdomain to the new gitlab pages URL

If anybody else is interested in moving their wikis over, don't
hesitate to ask me questions or just copy whatever I did :)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

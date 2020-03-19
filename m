Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246DA18B11F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 11:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7586E9DD;
	Thu, 19 Mar 2020 10:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BB06E9DD
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:20:56 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id h131so1679388iof.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3uJMFn0u6UxefMNCwOE+EpY1xkVMEUZdfQJs905Mo2E=;
 b=Tlo9ynl0/5JrUqt87TGFCCZ9Vf+ZY7VhurKDOOeDokSrKWXo+/6u5JNa2yUMyt8Sia
 io4XQ4NG9D33UhB3vjwQTLRHm2Ah7RPluXewGImqqQkybMb8AWDtp/5wmG/ZVQFcoMTq
 PnyKz6Odg2m53v/aAeWggFliHykA8ks7QBe1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3uJMFn0u6UxefMNCwOE+EpY1xkVMEUZdfQJs905Mo2E=;
 b=lY8qLysa7UUspoB8LTPsleTyOfR2+L86+kEoUJQl6j9b5M0qP5fDvw0J1xquQ6FjMt
 dtgJM7IAdfP7BvjxQqsNgIdwePwX4BLEo9toiDg3WAS8eRMSE+qfAjhqrjNvRmdRqVbI
 22GwS+35F2HaZtb75ANvGAsysS03iqu8zikvVFY64Bz71FrnPq1W6xLjaZxINnRytDov
 MH5e5gw9ArkJ+Dml/oj5tSfXM7zQ7eFlK8jvPnhj6/wBsdStTQ54+gMjZ7nkRWMW8DdW
 GxtW7QGJvbbP+6inY7LEIEqojU97gRqg7ElKYR/tjCznS71HZG1ZDU/StkJ0tqXbKm6i
 hx4w==
X-Gm-Message-State: ANhLgQ11MW61ap3jcW93M9Im9+55S++Ila9NzMzcIuOrQ1felzLUgXJP
 C4dNleVUwi5lOj5I4BG4yfoCHrDkLO97ruZbZjpEvw==
X-Google-Smtp-Source: ADFU+vtK3d/gDrUHwaxaJnUYjeJVHLK/PG6GuACnlbXxXQUQIi/qPHvAaGxP4FQ5mOe7IXI4kbNLAEMtUXVPu4O/o3c=
X-Received: by 2002:a02:241:: with SMTP id 62mr2290953jau.103.1584613255796;
 Thu, 19 Mar 2020 03:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200318171003.5179-1-jagan@amarulasolutions.com>
 <20200318171003.5179-3-jagan@amarulasolutions.com>
 <20200318185814.GB28092@ravnborg.org>
In-Reply-To: <20200318185814.GB28092@ravnborg.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 19 Mar 2020 15:50:44 +0530
Message-ID: <CAMty3ZDhVfvYXV7OO+NT+d_2YHbsJXebzjdtYkqtdD+X=Ch0yQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] MAINTAINERS: Update feiyang, st7701 panel bindings
 converted as YAML
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 12:28 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Wed, Mar 18, 2020 at 10:40:03PM +0530, Jagan Teki wrote:
> > The feiyang,fy07024di26a30d.txt and sitronix,st7701.txt has been
> > converted to YAML schemas, update MAINTAINERS to match them again.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> The patch is fine.
> I just dislike we repeat the maintainer info in two places..

Since these are two different panels. and entry similar like other
panels.do you look for single entry for both the panels?

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

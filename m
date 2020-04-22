Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7E61B4DEA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 22:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECAD89428;
	Wed, 22 Apr 2020 20:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E9989428
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 20:02:55 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 709832077D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 20:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587585775;
 bh=vezgGE0FULlzWHW/sVKFB+SlsPkANQPPADxxqiakO3s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Unghrin/L/i+H9af2BbSk1N70pX8seQPK9PJ0vkG6gJcuO6HE4qI4R39XQUmJISHL
 /SRaILbHxISbOfXhwj6Kg2hP+DTvduzPcJxcYHWmrSGc6wMaH+jjxILiINHxrlTSMz
 0H947HdAi75l3OcMojxM8TDyleDIVpkNaLyfRJc8=
Received: by mail-qv1-f52.google.com with SMTP id v10so1611155qvr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 13:02:55 -0700 (PDT)
X-Gm-Message-State: AGi0PubbICk8oZW1pB+a+P6mF4NtHT07oc6SRwMUIp9l+YsmU0RZkF2G
 URiXQqVVxmnwTk561A7TSdOk3+gmsU5BtnmQXQ==
X-Google-Smtp-Source: APiQypIdkXIj8AYOGffsEU3wU7ezGyaQvy4h94PQe9bmu3rIrvrj6rOjlRmAveKIGi/dWjS5sAWPpglXbVJ0fdT7dzQ=
X-Received: by 2002:a05:6214:a8a:: with SMTP id
 ev10mr709719qvb.20.1587585774524; 
 Wed, 22 Apr 2020 13:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <87d082jtfn.fsf@collabora.com> <20200420175909.GA5810@ravnborg.org>
In-Reply-To: <20200420175909.GA5810@ravnborg.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 22 Apr 2020 15:02:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJXa8QxQmLfkCO8_SSsgYm2nTFW1J6wx4bGbZgAy8Sxog@mail.gmail.com>
Message-ID: <CAL_JsqJXa8QxQmLfkCO8_SSsgYm2nTFW1J6wx4bGbZgAy8Sxog@mail.gmail.com>
Subject: Re: Rule for bridge yaml dt binding maintainers?
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Adrian Ratiu <adrian.ratiu@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 12:59 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Adrian
>
> On Mon, Apr 20, 2020 at 02:19:24PM +0300, Adrian Ratiu wrote:
> > Hello,
> >
> > I got confused while doing the txt -> yaml conversion at [1] and it's still
> > not clear to me who should be added in the "maintainers" field.  Clearly not
> > the maintainers as returned by get_maintainer.pl. :)
> >
> > Rob mentioned that "owners" should be manintainers but I also have trouble
> > picking the persons who should be owners / yaml maintainers.
> >
> > Looking at the completed bridge conversions in the latest linux-next, I
> > couldn't find a rule and the majority of bindings are still txt:
> >
> > $ find ./devicetree/bindings/display/bridge/ -name *txt | wc -l
> > 23
> > $ find ./devicetree/bindings/display/bridge/ -name *yaml | wc -l
> > 5
> >
> > So my questions are:
> > 1. Is there a general rule for assigning yaml file owners/maintainers?
> >
> > 2. Is this vagueness specific to the bridge dt bindings only?
> >
> > 3. Who should step up and maintain these bindings? Original/new authors,
> > SoC, bridge, DRM maintainers etc.?
> >
> > It would be useful to have a rule to make it easier to do these conversions.
> > We (Collabora) are considering doing the conversion work.
>
> For the panel conversion I did recently it was simple:
> 1) If listed in MAINTAINERS - use this info
> 2) Otherwise use the person(s) that authored the original .txt file.
>    Using git log --follow foo.txt
> 3) In a few cases I may have decided otherwise, but the above covers the
>    majority.

Yes.

> I would also be great if you or someone else could:
> - teach get_maintainers about .yaml file listed maintainers

It already does to some extent. IIRC, there's a mode to extract email
addresses from files.

I was hoping that the MAINTAINERS file split happens sometime and we
can just generate a MAINTAINERS file for bindings.

> - teach checkpatch that it is OK to convert .txt to .yaml

Yeah, I should fix my bug.

> - teach checkpatch about some simple yaml validation (maybe)

I don't see checkpatch being able to check much of what comes up in
review. Maybe indentation.

> I am looking forward to the day we have more .yaml files
> than .txt files in Documentation/devicetree/binding/*

700 vs. 3000 currently. It's about 60-70 new bindings and ~100
conversions per cycle. At this point we're review limited I think and
at the current rate, we should be done in 7 years. Yay! :( We need a
faster way.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

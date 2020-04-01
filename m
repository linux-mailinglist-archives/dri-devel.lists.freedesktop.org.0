Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD6B19B789
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 23:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150FA6E9A4;
	Wed,  1 Apr 2020 21:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8736E9A4;
 Wed,  1 Apr 2020 21:25:56 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id 204so894561ybw.5;
 Wed, 01 Apr 2020 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pFAu7t21oQYa/wqbaZtjuSSJYj2rJ/710JRjoL97kUY=;
 b=l0khIX4+C47f67PAXwvWBBeCPJJer/RRdYEuo7j7H4DW2y1aHFKPJPDVW+Pi5dsMZZ
 ZQ2X5uJqTJTCIF5yMSr+ICW8Hl+JUedmX0LPhWE6567XCwyAttDP17UXU7yMB6HAMWVO
 5iGebZquMq2LIsRH5GVCk/aT95nt7C6uS7fb2BWaqWGaarsF3Z8wPQ9jQ5eC+hy3vh6X
 agxgJ4D4Qwb15hiEe5QytMKkT8+A+DNfV2yq1OT2WHC3gGlL/suK0VfDl7+mVeGF2LMn
 PMHc2pYqtSHs5KAzM9z5LhhGyJvf+JtsHZW5wxD6APsyMdybpSzm6va8s2rfGDTtqGwb
 YiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pFAu7t21oQYa/wqbaZtjuSSJYj2rJ/710JRjoL97kUY=;
 b=N9BCHe6c/1ZApFCts14kVEyQuHJoeQaQxSyR4eKci1oHJ/BKitG6nOclqthcga8DHE
 wgBAMLc4CMn2z0iQemFhayQJ/GFOWI023x1YoIvxczNQ7cla6gsyw+vPUUfs2ajMAdXU
 8Uqe6z63OmlBShBmbogclPXF64Zihaf+5hUjnClJ6CXKS55cdXt2kfjEeXGt85WAKwFu
 oZ858H589yRL5K6VExCakIK4KhLdPmKL429fvkhdCKy2VxmPdXEnbeVvpm2ImboWdeer
 YQUR8evR0VGHzD6KBwYyMuRuY0+Gbw3Klp59hlHFjvqZtUUbfNvzdlU9i5Q7N6mvg/WV
 MXEA==
X-Gm-Message-State: AGi0Pua0zf7ytESJ9ydzag03XgfJmQRJ0WKkzS8v+K4dH7sH1++lygaM
 sW104S3FNaV/2CBnNQSdfMQCABUgsX/blWolhBOdnw==
X-Google-Smtp-Source: APiQypLrnEJLXNvzrxV85f0NsyiOLrqhFc5l4+CmV8ZG6mV6UtQH9UB/C31OoAeT8kmDkIJvA9o/1/eN1/nVrBHrRXI=
X-Received: by 2002:a25:e014:: with SMTP id x20mr96312ybg.298.1585776355496;
 Wed, 01 Apr 2020 14:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAJgxT3-11eZqvysgCQMCYtKEUVsNWWHd+7au91uNC7SWK1Fyug@mail.gmail.com>
 <qeN5Zly4y6dDc3LU25krLgbaUgERWRs8Rz-ZZzgLctPbV2zEpZZq1JHpt6WKJeCrcGUaouhXMcau7qvgGNx4cfStu9wil6ZIcu0DQGVADlk=@emersion.fr>
In-Reply-To: <qeN5Zly4y6dDc3LU25krLgbaUgERWRs8Rz-ZZzgLctPbV2zEpZZq1JHpt6WKJeCrcGUaouhXMcau7qvgGNx4cfStu9wil6ZIcu0DQGVADlk=@emersion.fr>
From: Matt Hoosier <matt.hoosier@gmail.com>
Date: Wed, 1 Apr 2020 16:25:19 -0500
Message-ID: <CAJgxT39yC9UpBB4RX1in0WLAQpUJir_sjgV=UQPOTG+JyiQkVg@mail.gmail.com>
Subject: Re: Aliases for DRI connectors?
To: Simon Ser <contact@emersion.fr>
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
 wayland mailing list <wayland-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0799183079=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0799183079==
Content-Type: multipart/alternative; boundary="0000000000005cdb6505a2415455"

--0000000000005cdb6505a2415455
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 1, 2020 at 3:17 PM Simon Ser <contact@emersion.fr> wrote:

> On Wednesday, April 1, 2020 9:38 PM, Matt Hoosier <matt.hoosier@gmail.com>
> wrote:
>
> > I'm searching for some sort of scheme that will let my DRI master query
> the set of available connectors and select the one carrying a prearranged
> designation. The problem I'm trying to solve is to allow deploying one
> standardized userspace component across a fleet of devices that have
> varying numbers of displays, with the use cases not always driven on the
> same connector topologically.
> >
> > I had a look around the properties available on my system's DRI
> connectors, and nothing immediate jumped out at me. Is there a standard
> connector property that (assuming I can find the right place in DeviceTree
> or similar to) that would be a good fit for this?
>
> Maybe information in the EDID would help? You'll find the manufacturer,
> the model number and the serial number.
>

That might be a possibility. The trouble there is that there can be more
than one instance of the same display model connected to the system, so the
EDID blob wouldn't be particularly helpful to distinguish them. The
connectors in question are generally something like LVDS or DSI that don't
typically expose EDID properties, too.

--0000000000005cdb6505a2415455
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Apr 1, 2020 at 3:17 PM Simon Ser =
&lt;<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Wednesday, April 1, 2020 9:38 PM, Matt Hoosier &lt;<a href=
=3D"mailto:matt.hoosier@gmail.com" target=3D"_blank">matt.hoosier@gmail.com=
</a>&gt; wrote:<br>
<br>
&gt; I&#39;m searching for some sort of scheme that will let my DRI master =
query the set of available connectors=C2=A0and select the one carrying a pr=
earranged designation. The problem I&#39;m trying to solve is to allow depl=
oying one standardized userspace component across a fleet of devices that h=
ave varying numbers of displays, with the use cases not always driven on th=
e same connector topologically.<br>
&gt;<br>
&gt; I had a look around the properties available=C2=A0on my system&#39;s D=
RI connectors, and nothing immediate jumped out at me. Is there a standard =
connector property that (assuming I can find the right place in DeviceTree =
or similar to) that would be a good fit for this?<br>
<br>
Maybe information in the EDID would help? You&#39;ll find the manufacturer,=
<br>
the model number and the serial number.<br></blockquote><div><br></div><div=
>That might be a possibility. The trouble there is that there can be more t=
han one instance of the same display model connected to the system, so the =
EDID blob wouldn&#39;t be particularly helpful to distinguish them. The con=
nectors in question are generally something like LVDS or DSI that don&#39;t=
 typically expose EDID properties, too.</div></div></div>

--0000000000005cdb6505a2415455--

--===============0799183079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0799183079==--

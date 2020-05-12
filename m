Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 579BE1CEA87
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 04:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FE56E037;
	Tue, 12 May 2020 02:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E45F6E037
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 02:09:43 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 63so1915150oto.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 19:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=hx2GPWhJqt9kxObM/JXtvxzVEbR5wT0H4fhgwGryEc8=;
 b=O/vGt9NfyKba89idN+q8mwW6yuSa7wSvu0UJoJxrB1AM+k2RwLrN/2AsJaz31itG6r
 UxS6WUz3mciyKqOEvq8TbYFGlCkS0jyBFy/DAQiyBg39VZisz727FigVyzNZOHsfmjwk
 ReKUbjPWIreeOqeEjl1aRV0yZU7Qs9j669XPW13n4s9FDjAcXrfYgj4zal08naogFo7y
 VUh7u3+s1Tp26AFBOGQAE+5mc3223x6dqoeOtqkf0t7AzaSDZURYTvcqoL6/B3A2de69
 aFt4nZyHvHr764xyzvTFObsFO2RPTQ/L8/A+ip9YYCc1gimycBIwf2+EfvHhNq/Qv0gk
 UH3w==
X-Gm-Message-State: AGi0PuZbBkcGt4eeGVW278hB7n4kLzoOC4B5J1WatN4Bb3VnQjMw7xv9
 ytjCvlS7p+djc0zw3yFHvw==
X-Google-Smtp-Source: APiQypKIirFNWU90d1Ffrh4CEIScFhMrBN5Ab2uVt6ZLzmIl26jkrZYjHyZQwqCfgrroO/ir5KlD9g==
X-Received: by 2002:a9d:5f04:: with SMTP id f4mr16523087oti.154.1589249383244; 
 Mon, 11 May 2020 19:09:43 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t22sm5101089oij.2.2020.05.11.19.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 19:09:42 -0700 (PDT)
Received: (nullmailer pid 12354 invoked by uid 1000);
 Tue, 12 May 2020 02:09:41 -0000
Date: Mon, 11 May 2020 21:09:41 -0500
From: Rob Herring <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, kernel@collabora.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
 laurent.pinchart@ideasonboard.com
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200512020941.GA2002@bogus>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506155320.GC15206@pendragon.ideasonboard.com>
 <20200511145911.2yv3aepofxqwdsju@rcn-XPS-13-9360>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511145911.2yv3aepofxqwdsju@rcn-XPS-13-9360>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 04:59:11PM +0200, Ricardo Ca=F1uelo wrote:
> Hi Rob,
> =

> What's your opinion on this?
> =

> Some context: It's about bindings that define signed integer properties
> with range checks that go below and above zero. The schema checker fails
> because, apparently, it interprets every cell value as an uint32, which
> makes the range check fail for negative numbers.

The real fix is dtc needs to carry the sign thru to the yaml output =

format. In the mean time, perhaps the schema should have an unsigned =

range for signed types.

Rob

> =

> On mi=E9 06-05-2020 18:53:20, Laurent Pinchart wrote:
> > Hi Tomi,
> > =

> > On Tue, Apr 28, 2020 at 12:49:28PM +0300, Tomi Valkeinen wrote:
> > > On 28/04/2020 12:20, Ricardo Ca=F1uelo wrote:
> > > =

> > > > 2) The definition of ti,deskew in the original binding seems to be
> > > > tailored to the current driver and the way it's defined may not be =
very
> > > > DT-friendly.
> > > > =

> > > >    This parameter maps to a 3-bit field in a hardware register that=
 takes
> > > >    a value from 0 to 7, so the [-4, 3] range described for this wou=
ld map
> > > >    to [000, 111]: -4 -> 000, -3 -> 001, -2 -> 010, ... 3 -> 111.
> > > > =

> > > >    Then, the driver parses the parameter (unsigned) and casts it to=
 a
> > > >    signed integer to get a number in the [-4, 3] range.
> > > =

> > > Interestingly the current example has ti,deskew =3D <4>...
> > > =

> > > >    A vendor-specific property must have a type definition in json-s=
chema,
> > > >    so if I translate the original bindings semantics directly, I sh=
ould
> > > >    define ti,deskew as an int32, but this makes dt_binding_check fa=
il if
> > > >    the property has a negative value in the example because of the
> > > >    internal representation of cells as unsigned integers:
> > > > =

> > > >       ti,deskew:0:0: 4294967293 is greater than the maximum of 2147=
483647
> > > =

> > > I don't quite understand this. We cannot have negative numbers in dts=
 files? Or we can, but =

> > > dt_binding_check doesn't handle them correctly? Or that int32 is not =
supported in yaml bindings?
> > > =

> > > >    So I can think of two solutions to this:
> > > > =

> > > >    a) Keep the ti,deskew property as an uint32 and document the val=
id
> > > >    range ([-4, 3]) in the property description (this is what this p=
atch
> > > >    does currently).
> > > > =

> > > >    b) Redefine this property to be closer to the datasheet descript=
ion
> > > >    (ie. unsigned integers from 0 to 7) and adapt the driver accordi=
ngly.
> > > >    This would also let us define its range properly using minimum a=
nd
> > > >    maximum properties for it.
> > > > =

> > > >    I think (b) is the right thing to do but I want to know your
> > > >    opinion. Besides, I don't have this hardware at hand and if I up=
dated
> > > >    the driver I wouldn't be able to test it.
> > > =

> > > I don't think anyone has used deskew property, so I guess changing it=
 is not out of the question.
> > > =

> > > Laurent, did you have a board that needs deskew when you added it to =
tfp410?
> > =

> > I didn't if I remember correctly, I just mapped it to the hardware
> > features. The hardware register indeed takes a value between 0 and 7,
> > and that is mapped to [-4,3] x t(STEP). I don't mind either option.
> > =

> > -- =

> > Regards,
> > =

> > Laurent Pinchart
> =

> I haven't found any examples of yaml bindings defining signed integer
> properties such as this, what's the norm in this case? Do you agree with
> any of the proposed solutions? Do you have a better suggestion?
> =

> Thanks,
> Ricardo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

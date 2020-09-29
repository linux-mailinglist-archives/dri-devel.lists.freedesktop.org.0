Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C068727D4CC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 19:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EA889BF0;
	Tue, 29 Sep 2020 17:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BC889BF0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 17:46:26 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id i17so6364617oig.10
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 10:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mVned4RG5QRYTOR8H15/jWkAsq+BBK7cREUkxd/Xiaw=;
 b=ERgxXwKUHIH1ek3FsZ38nCoo+aGHiY5SKCkd739VEratjVwuP+1kxA144Xlk1yugAe
 U7D1toSlyw+BGSEQLjfl66WesfCwz+TzbYkARZkNBBH0MTKmOo9fTlIIuFojuJL+xAb4
 yKwpnvrefMk+rJfLXfKI+zYFIojGzEdKhHPOdJB0zYHtaV9F4DH6G+3hapfRwd9USDI1
 UxmlJIH/1/4yTwDtjcDVzImjDuLZ/j1Yc/LUe0EGlC8oIuOWwjEvGPK2QiXJiM8YnUVo
 m1NUrWceIYd6aO+ExYvmhHmTF9JWco/ZUwzQwC2lMEnER5NKk5NZ2dJmrzA8tO6FhH37
 n7UQ==
X-Gm-Message-State: AOAM530G1Eerts74fpirQsAu6k3JZxkzsu9x9meZzw1hGpL5HnCqqs3G
 im5mHRxCWZjPNB5Hoeaacg==
X-Google-Smtp-Source: ABdhPJzPinEAfFDFESHqHJK2pNpDC0q8yKXQiSUiTSjbR/vQnrIORvLad5CBhsZcQqwQ5wDx1PTgIA==
X-Received: by 2002:aca:2106:: with SMTP id 6mr3418235oiz.115.1601401585622;
 Tue, 29 Sep 2020 10:46:25 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v76sm1138615oif.58.2020.09.29.10.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 10:46:25 -0700 (PDT)
Received: (nullmailer pid 847532 invoked by uid 1000);
 Tue, 29 Sep 2020 17:46:24 -0000
Date: Tue, 29 Sep 2020 12:46:24 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC PATCH v1 3/3] dt-binding: display: Require two rests on
 mantix panel
Message-ID: <20200929174624.GA832332@bogus>
References: <cover.1600707235.git.agx@sigxcpu.org>
 <71a9108f3472ba9af4bead01b1b770d1e73eb08e.1600707235.git.agx@sigxcpu.org>
 <20200924193807.GA1223313@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924193807.GA1223313@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 09:38:07PM +0200, Sam Ravnborg wrote:
> Hi Guido.
> =

> On Mon, Sep 21, 2020 at 06:55:52PM +0200, Guido G=FCnther wrote:
> > We need to reset both for the panel to show an image.
> > =

> > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > ---
> >  .../bindings/display/panel/mantix,mlaf057we51-x.yaml       | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > =

> > diff --git a/Documentation/devicetree/bindings/display/panel/mantix,mla=
f057we51-x.yaml b/Documentation/devicetree/bindings/display/panel/mantix,ml=
af057we51-x.yaml
> > index 937323cc9aaa..ba5a18fac9f9 100644
> > --- a/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we5=
1-x.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we5=
1-x.yaml
> > @@ -35,7 +35,9 @@ properties:
> >    vddi-supply:
> >      description: 1.8V I/O voltage supply
> >  =

> > -  reset-gpios: true
> > +  reset-gpios:
> > +    minItems: 2
> > +    maxItems: 2
> =

> reset-gpios is, as you already wrote, defined in panel-common.yaml.
> Do not try to change it here.
> It would be much better, I think, to introduce a mantix,reset-gpios
> property.

Yes.

You also need to define what each reset entry corresponds to as the =

assertion/deassertion order could be important. You might just do 2 =

properties with <pinname>-gpios.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

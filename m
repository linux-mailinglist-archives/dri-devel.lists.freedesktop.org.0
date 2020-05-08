Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 145E11CA86E
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 12:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DB06EADA;
	Fri,  8 May 2020 10:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EBE6EADA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 10:35:18 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id n207so284266vkf.8
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 03:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g1M0dnG6X/ZdLSaJc75kcj4nbxBb95KPAtfkHekjG3Y=;
 b=rwjUpQaWLzhBubkUR3QhhSNC734GFsOjNbxX0y3QmIcvzKwwfQD2+aVBaoi08yh0qR
 gvATQlHOwvq/YQWOxHj+yB/0n0zDaR2bAFpWJvaZYBKm9eTKbHJnTW90L8JMYSxYfCma
 NhZ2K9EIkQeMhhgKQb04Z5L+AKgNCjodZS14PlAhl2S46xL7yBNDJIdxEZ9YkTwXwYdo
 HaWF/a+50wkr9HAXYVN9w7fQ1+UElfIvrpYAx4iqF/D+S6QUweieE6mbUObdYDr+y8gt
 0FkiCWy2jD7KhYusK5DHGYnqC2xiBbG9oBQZqerFrHINpLIgRMg46Vk7U4wZGy9VgOWf
 4cfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g1M0dnG6X/ZdLSaJc75kcj4nbxBb95KPAtfkHekjG3Y=;
 b=miMMkM4yMMlEWr2HKb74w0+zscKtD0d12BFI2WdU80COM6h3EqCET4xotFhfOyB29c
 PLXZ7kKevn9spLiB0KhHtHqldRrBHuN3F3+V9SZboCx52YW66RW0b6eyeHviWLOmE4mc
 iOvuBBk8WJqMmGfyBi4IEWZVXgB21cr9TypYWIYmVG0mwOfHP176e/sTvP8Polwk2yyX
 5Vbu6tbu4Tg/pYRKVjhlvozSlRABWpsQNbSJsdwJQBSvibGl+mpNUxF/B0mY/XlxEe/M
 rEI3u45c7Uw9Sj0uy5whwUc3xXDPOW76O+Rha76WAnevXBnGeuZ8FuiZPOktsN0sRygJ
 o05A==
X-Gm-Message-State: AGi0PuZETRtEGiGg+iUkTiVUzMTp6aV3HyT6lkESjvmk/h6YAFQJeyD7
 lKPS2Iv1d2QWEfY0NqhRXLp2yfVB2OcQhpEtbIr3+C6v
X-Google-Smtp-Source: APiQypJuxr9P/KgaH27GjKEizVyEI5TXONbIe2ekMNjmGWVrroekHLlyMkSERXmjpBua2nXn55i9IHzLgAfA3Cda0OQ=
X-Received: by 2002:a1f:2f91:: with SMTP id v139mr1139060vkv.22.1588934117720; 
 Fri, 08 May 2020 03:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200430192746.1866325-1-paul.kocialkowski@bootlin.com>
 <20200430192746.1866325-3-paul.kocialkowski@bootlin.com>
 <CACvgo51mRse3su4exyTqXYJRPPc0VqaX9+tRyKUuBPtm5Q+6XQ@mail.gmail.com>
 <20200507201103.GH2422122@aptenodytes>
In-Reply-To: <20200507201103.GH2422122@aptenodytes>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 8 May 2020 11:32:46 +0100
Message-ID: <CACvgo52dMPk_KPyNYhBTDOo_+s7hJuGDNjoWun63Jj4uMidszA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] drm: Add support for the LogiCVC display controller
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 May 2020 at 21:11, Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi Emil,
>
> Thanks for the review!
>
> On Mon 04 May 20, 14:28, Emil Velikov wrote:
> > Just had a casual quick look for custom KMS properties, since new
> > drivers made that mistake in the past.
> > Thanks for not including any o/
>
> Yeah I made sure not to include any, I know it easily gets very problematic and
> creates disparity between drivers while needing to be kept alive even when a
> standard way arises due to the no API breakage policy.
>
> The not-for-merge patch that I've sent does introduce some for the colorkey,
> and that's why they are marked as such :)
>
> > I made a couple of trivial suggestions - if you agree, feel free to
> > keep them as follow-up patches.
> >
> > On Thu, 30 Apr 2020 at 20:28, Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> >
> > > +int logicvc_of_property_parse_u32(struct device_node *of_node,
> > > +                                 const char *name, u32 *target)
> > > +{
> > > +       struct logicvc_of_property *property;
> > > +       const char *string;
> > > +       u32 value;
> > > +       int ret;
> > > +
> > > +       property = logicvc_of_property_lookup(name);
> > > +       if (!property)
> > > +               return -EINVAL;
> > > +
> > One could have the logicvc_of_properties[] entries indexed with the
> > logicvc_of_property_parse_{u32,bool} caller, using that instead of the
> > name string.
>
> Do I understand correctly that you're suggesting passing each entry's
> struct logicvc_of_property pointer to the function?
>
> I went for strings to make the code explicit and easy to read so I'd really
> like to keep it that way and avoid passing things like
> &logicvc_of_properties[4] or an index integer.
>
Add a some #define/enum and go to town. Example with sub-optimal names below:

enum foobar {
 LVC_OF_DISP_INTF,
 LVC_OF_DISP_CLRSPC,
...
};

static struct logicvc_of_property logicvc_of_properties[] = {
[LVC_OF_DISP_INTF]  = {
               .name           = "xylon,display-interface",
...
       },
[LVC_OF_DISP_CLRSPC] = {
               .name           = "xylon,display-colorspace",
...
       },
...
}

While the callers are:

       ret = logicvc_of_property_parse_u32(of_node, LVC_OF_DISP_INTF,
                                           &config->display_colorspace);
       ret = logicvc_of_property_parse_u32(of_node, LVC_OF_DISP_CLRSPC,
                                           &config->display_depth);

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

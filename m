Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E86C7D3C3D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 18:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4E210E05D;
	Mon, 23 Oct 2023 16:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620D310E05D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 16:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698078168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8sviLcqtrzQ+oBXbTZRqaovwEitzC/w+7tvYOUmsOnM=;
 b=CXRuLJtIw/Q/rZGeWCeVmTZFODEZewtX8Vg5AACZp1Pe2oIjFvv8AkyGgrmg+Np7nq8QUV
 sCYqsfPbZ24dOkGiPxcB0iBwDf+d8N/vWBv5mbVNbCNfECLnp0/2fMUHva2dPRqgIn62Um
 +fW8ukkXX+XDiK4saNUxvDwyDeIY6TU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-KpDMKESiMp6lj3TzdPPADQ-1; Mon, 23 Oct 2023 12:22:40 -0400
X-MC-Unique: KpDMKESiMp6lj3TzdPPADQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-50798a259c7so3492230e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 09:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698078159; x=1698682959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8sviLcqtrzQ+oBXbTZRqaovwEitzC/w+7tvYOUmsOnM=;
 b=jVKl82V0rdVfTfDbV08Qm/y6Wi7k1ipD7O44m0lQ4FCY4epS5MM0unQ9iLniCjeFam
 Cg502SWf16Rlwko0RB/Eqyh/gu03p12wGVCcJ26trATnpNlinqOWOg/6duCR0KqqXl/+
 +4mSO501avYywTuIL+EBdDSwygri5wgUg9dYfr7oXaM1alycwEYDUssMRL94FVxLS7Y6
 sgdYa/YxlDgedqMCDBA1C0GK8kCmdU0/UOqP2OtUH3wwJOxqjlX3njUB6CP7Bs8T+np4
 TNzUb22V8oJW0/gqidV4L9nhW0WmP/9zwDnTuDEgb/o12GW2rL8xxW7A5Dm1zK93xBd9
 1ZLg==
X-Gm-Message-State: AOJu0YwBCUERZh0viKRaFa8dISGKpuwVUoDUL7bsrvTjxJuTuYTG+79E
 L9qjCg5vDJIWPud3/34Gco7/vSwYJNgNh8EoHCl8qZzRYgcILK2hQ4O0DyjCeJc9o4TqhoO8VK2
 N9ydUppxEXR0GlQlqdCWWPemHnoazZ1WVofu70/e8rx2k
X-Received: by 2002:ac2:48bb:0:b0:507:9628:afb with SMTP id
 u27-20020ac248bb000000b0050796280afbmr6722515lfg.68.1698078159078; 
 Mon, 23 Oct 2023 09:22:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbIRkANsjn89iNuqMdSM4mAotF8J81pYMXXM8hyKKFJUjkJU2kQkUkdRCav68P4tImvumU1W4ItopDKpd3MgU=
X-Received: by 2002:ac2:48bb:0:b0:507:9628:afb with SMTP id
 u27-20020ac248bb000000b0050796280afbmr6722499lfg.68.1698078158729; Mon, 23
 Oct 2023 09:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
 <20221207-rpi-hdmi-improvements-v3-3-bdd54f66884e@cerno.tech>
 <CAKMK7uFQ8yJLKgTrQdmhwmq9uL-hbUsfUeU6cxWdB2AW3i4vOg@mail.gmail.com>
 <fwcn3vlgxq5uygi32pyjuktj62wa7zvdgu7xxlpqr7an3kjn7i@25axhlrrkk6z>
 <12669999-295f-40c5-8c58-ba3ed26efb16@xs4all.nl>
 <tnkfcgkoobxyyhnsmoyayohip73wl6axnd7liefsvof6qwgovd@ropob4set3nl>
In-Reply-To: <tnkfcgkoobxyyhnsmoyayohip73wl6axnd7liefsvof6qwgovd@ropob4set3nl>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Mon, 23 Oct 2023 18:22:27 +0200
Message-ID: <CA+hFU4yeUsGy9rzq3H6hmfkjXsYHxf6W=bJ-1ti1Um9jgkihcQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] drm/vc4: hdmi: Add Broadcast RGB property to allow
 override of RGB range
To: Maxime Ripard <maxime@cerno.tech>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Honestly, the less time people spend on this property the better. Lift
the Intel one into core and be done with it. We'll hopefully be able
to remove it in the not-to-distant future with the new color pipeline
API and adding a new property which only sets the connector metadata
instead of influencing the color pipeline as well.

On Mon, Oct 23, 2023 at 4:58=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> w=
rote:
>
> Hi Hans,
>
> On Thu, Oct 19, 2023 at 10:26:40AM +0200, Hans Verkuil wrote:
> > Hi Maxime,
> >
> > On 19/10/2023 10:02, Maxime Ripard wrote:
> > > Hi,
> > >
> > > On Wed, Oct 11, 2023 at 03:23:18PM +0200, Daniel Vetter wrote:
> > >> On Mon, 6 Mar 2023 at 11:49, Maxime Ripard <maxime@cerno.tech> wrote=
:
> > >>>
> > >>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >>>
> > >>> Copy Intel's "Broadcast RGB" property semantics to add manual overr=
ide
> > >>> of the HDMI pixel range for monitors that don't abide by the conten=
t
> > >>> of the AVI Infoframe.
> > >>>
> > >>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >>
> > >> Stumbled over this grepping around, but would have been nice to lift
> > >> this into drm code and document the property. It's one of the legacy
> > >> ones from the table of horrors after all ...
> > >>
> > >> Shouldn't be an uapi problem because it's copypasted to much, just n=
ot great.
> > >
> > > We already discussed it on IRC, but just for the record I have a curr=
ent
> > > series that should address exactly that:
> > >
> > > https://lore.kernel.org/dri-devel/20230920-kms-hdmi-connector-state-v=
2-3-17932daddd7d@kernel.org/
> > >
> > > Maxime
> >
> > I've pasted a snippet from that patch below for a quick review:
> >
> > >  /**
> > >   * DOC: HDMI connector properties
> > >   *
> > > + * Broadcast RGB (HDMI Specific):
> >
> > Full vs Limited is actually not HDMI specific, DisplayPort can signal t=
his as
> > well for whatever it is worth.
>
> Sure, what I (and the original patch I guess) meant is that it's only
> ever used on HDMI connectors these days. If that ever changes, then we
> can update the doc.
>
> > > + *      Indicates the RGB Range (Full vs Limited) used.
> >
> > RGB Range -> RGB Quantization Range
> >
> > > + *
> > > + *      The value of this property can be one of the following:
> > > + *
> > > + *      Automatic:
> > > + *              RGB Range is selected automatically based on the mod=
e
> > > + *              according to the HDMI specifications.
> > > + *
> > > + *      Full:
> > > + *              Full RGB Range is forced.
> > > + *
> > > + *      Limited 16:235:
> >
> > It is very unfortunate that this is called "Limited 16:235" instead of =
just "Limited"
> > since for color component bit depths > 8 these values are different.
> >
> > I have no idea if it is possible to add an alias "Limited" that you can=
 use instead.
> > In any case, this should document that it works just as well for higher=
 bit depths,
> > but with different limits.
>
> I had a look and it doesn't look like the property infrastructure can
> deal with aliases. I'll add something in the doc
>
> Thanks!
> Maxime


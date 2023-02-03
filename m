Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76756689A4E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 14:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C156710E057;
	Fri,  3 Feb 2023 13:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A2E10E057
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 13:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675432386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PPeIaOgUpyYN5d3lTDBnF3M123TEx8B08kPAaxZlFr8=;
 b=FJx5Rw+V+ePQCWlYxpLoThrbbTJ65qOprgJWbWDSM0MTfJR3bLrtLEoq8PCPzL0NUcRqNx
 rNlQJy3WBpVLJs/fj81wekwncZ0pincpI3vLQi/xbCNA3YS18wLdNYbRlmwZXedZYah0gk
 BdYLBfovWh/tEb62HfqdLuTn7jiWv7k=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-N-DbT-BhPrSJB3YFGWVZ4w-1; Fri, 03 Feb 2023 08:53:05 -0500
X-MC-Unique: N-DbT-BhPrSJB3YFGWVZ4w-1
Received: by mail-lf1-f69.google.com with SMTP id
 u13-20020a056512128d00b004b53d7241f6so2156264lfs.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 05:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PPeIaOgUpyYN5d3lTDBnF3M123TEx8B08kPAaxZlFr8=;
 b=D/46B+6xk1R5DjlLdKikdBcR832p57edjakoW3NtA6CPz4Ixw7XoCFI+tmW+HcwRZD
 rR//wobXw2kO9Bg013uQjzPknFL/8F1bQiiDRiaaR4WFLBbrkUx70IbAwP3M4sU0JCya
 wbwBSK4hTQTSwqH/cPGqMWAy0tCrnbiFAerfub+ynO2KApqWIJVIHZRHACpDTjG6M/5B
 WDxtOHF9Y3b7J4wZPvyZzmFx+T5+T0pl6FfmWvNaMUww06+D32K4tUIGda2zuu4yC3Xv
 rfDvZiLAbb0Ob/JegIFHWH3JKucrgL3g/I5Tl9whmnU+Ee+nGYaeuEyTAk24mpe2uaSZ
 pGcQ==
X-Gm-Message-State: AO0yUKVygiJ9/UjmeW2CzKVuHQqRymdlIsZ4W+nO3GnFmN0y0WqIBzlf
 9gVsx3UMbtKz4Gi5RNedU2s0TP2a9dDrdXzU1TdwK2sr5sGwk+WX0nPox169ES53yjyONj/IbD0
 nUenr/GxJw1Sxat/Fatg+o7L3b2JRtWwCNa9SZkXDfcfD
X-Received: by 2002:a2e:9c90:0:b0:290:60a9:b5e6 with SMTP id
 x16-20020a2e9c90000000b0029060a9b5e6mr1613467lji.62.1675432384063; 
 Fri, 03 Feb 2023 05:53:04 -0800 (PST)
X-Google-Smtp-Source: AK7set8kbVT57YO/rmdVZUqx5me6Uz5HRZkS7X6lkrYpzRlt/o1KInsGQnqA16w0BSc3HPVA7XB9r/jbWrc6sojVdJQ=
X-Received: by 2002:a2e:9c90:0:b0:290:60a9:b5e6 with SMTP id
 x16-20020a2e9c90000000b0029060a9b5e6mr1613446lji.62.1675432381925; Fri, 03
 Feb 2023 05:53:01 -0800 (PST)
MIME-Version: 1.0
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <Y90NkvVabh+ue9hF@intel.com>
In-Reply-To: <Y90NkvVabh+ue9hF@intel.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 3 Feb 2023 14:52:50 +0100
Message-ID: <CA+hFU4xR_8=w=z=Jqs3sujTvnXfEQJVHAMFW-X4-55POF=Bu9g@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 3, 2023 at 2:35 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Feb 03, 2023 at 01:59:07PM +0100, Sebastian Wick wrote:
> > On Fri, Feb 3, 2023 at 11:40 AM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
> > > > Userspace has no way of controlling or knowing the pixel encoding
> > > > currently, so there is no way for it to ever get the right values h=
ere.
> > >
> > > That applies to a lot of the other values as well (they are
> > > explicitly RGB or YCC). The idea was that this property sets the
> > > infoframe/MSA/SDP value exactly, and other properties should be
> > > added to for use userspace to control the pixel encoding/colorspace
> > > conversion(if desired, or userspace just makes sure to
> > > directly feed in correct kind of data).
> >
> > I'm all for getting userspace control over pixel encoding but even
> > then the kernel always knows which pixel encoding is selected and
> > which InfoFrame has to be sent. Is there a reason why userspace would
> > want to control the variant explicitly to the wrong value?
>
> What do you mean wrong value? Userspace sets it based on what
> kind of data it has generated (or asked the display hardware
> to generate if/when we get explicit control over that part).

Wrong in the sense of sending the YCC variant when the pixel encoding
is RGB for example.

Maybe I'm missing something here but my assumption is that the kernel
always has to know the pixel encoding anyway. The color pipeline also
assumes that the pixel values are RGB. User space might be able to
generate YCC content but for subsampling etc the pixel encoding still
has to be explicitly set.

So with the kernel always knowing exactly what pixel encoding is sent,
why do we need those variants? I just don't see why this is necessary.

>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>


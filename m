Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA7E8C3F73
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 13:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5F610E650;
	Mon, 13 May 2024 11:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gDCbu0R6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4AE10E650
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 11:07:23 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-7d9e70f388fso203188039f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 04:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715598443; x=1716203243;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGQJNn0vnDN7oHpQ2fYIvhBcLWv6XEpScm6BqxW6Gn4=;
 b=gDCbu0R6azVt+W3+wmVCqygaT7qe1YOCiN8F8FD/SPKNHY6ZmnjksbDwg4WuJ6WFeB
 wlxEAvosI5gAjRjtHZAnUKl46i1FIrU36WYYbj/7i13j7JXZpA/XBHuORmZiKl+egu6w
 FYFgdOpz6btBzW/OGQm7RLXeZaUapL2XFN/AwYt0Qn4JJGb26TlaxGBEHaizlZzipFbc
 2VzMVdkyjNoY2lopXCCVS7g9/Oty7nbcX4xxHS3bkW8RKHvjb67mr1hQCxKHWSSE8f6d
 +uylAY1lOj33nbHaW7yABU6L4IVkzINZ20H0Bvf+3tze8l7BAfcRDv6j48VcPDvGq3W+
 4tUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715598443; x=1716203243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xGQJNn0vnDN7oHpQ2fYIvhBcLWv6XEpScm6BqxW6Gn4=;
 b=LIvQ6r9XLPL/7YF5tzWBD4KPzvpxL8TUXfaT2f4KZufAVw5/FK7o4dikW7V3jfuxeR
 o1yV//Qd8eWNqNwAP+wHKa95jI41w7HrtEUEHEySN+qLUwbClqAQ1VtVDXM5zLcUldxj
 P8uDeMr8jetwXXJpgzJnGOBLkzkFQRYtoLUn+Jdvb3Bq8e4f2fAa7dcAypxYLrdye6iw
 nvI5BRkJUlbm3viHQUIpPpw3UYqvoU46P3XgeJFu++5ZiVE192eElBlbEdI7EkJkRwHu
 /8IqVh6LhrjDhVgJoWMwRwWh3f6QgQ+uCKSXcR/dsGOMLxOIJRUeyYqIEXX88j8Hu3i4
 jktA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEo9rfRTuTzHjmfqA6JSkwWtkOpLuY8ZMsbENoS56mAcQjO6f75axdhAfZLcCpaaI8GJZ+adwRN5oN9laLNgfJ/8flHur4bnNbr2XO2sFA
X-Gm-Message-State: AOJu0YyvFxBxo8rl/vAkkhM35MPLMi91eXhgyt8OFxVuLVRIUpuiHhhs
 iGUM6JHpQdb1GDfRzLxRrsQaxI7GwRq/MvTB1rkccLKjzvzukECZpLJipgpt1Fy5LUJt9259MS6
 WTWe36NllTn1yC+br/UqRcK5Qm1JUaAK74k+n
X-Google-Smtp-Source: AGHT+IEiadjb+MTc+UlqC6N1rwvvjZDJnAlay8TfzRluxCwQz8iR/sX8wqL+TFk3/kNd86shQakjYT2DoztuTJ1C/LM=
X-Received: by 2002:a05:6602:2992:b0:7da:bc23:ac16 with SMTP id
 ca18e2360f4ac-7e1b520775bmr1054622539f.14.1715598442659; Mon, 13 May 2024
 04:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
 <20240507155413.266057-6-panikiel@google.com>
 <20240510211613.GA751688-robh@kernel.org>
In-Reply-To: <20240510211613.GA751688-robh@kernel.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Mon, 13 May 2024 13:07:10 +0200
Message-ID: <CAM5zL5oBA6Bkk=qAEjx7pvQ5cxa9MFHe9=T3AQMuKskzbjFrzw@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] media: dt-bindings: video-interfaces: Support
 DisplayPort MST
To: Rob Herring <robh@kernel.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, tzimmermann@suse.de, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 10, 2024 at 11:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, May 07, 2024 at 03:54:08PM +0000, Pawe=C5=82 Anikiel wrote:
> > Add a DisplayPort bus type and a multi-stream-support property
> > indicating whether the interface supports MST.
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > ---
> >  .../devicetree/bindings/media/video-interfaces.yaml        | 7 +++++++
> >  include/dt-bindings/media/video-interfaces.h               | 2 ++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.y=
aml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > index 26e3e7d7c67b..7bf3a2c09a5b 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > @@ -94,6 +94,7 @@ properties:
> >        - 5 # Parallel
> >        - 6 # BT.656
> >        - 7 # DPI
> > +      - 8 # DisplayPort
> >      description:
> >        Data bus type.
> >
> > @@ -217,4 +218,10 @@ properties:
> >        Whether the clock signal is used as clock (0) or strobe (1). Use=
d with
> >        CCP2, for instance.
> >
> > +  multi-stream-support:
>
> If MST is a known term for DP, then perhaps "dp-mst-support" for the
> name. In any case, 'dp' should be in there somewhere.

I tried to keep the name generic, for the use case of some other bus
with a similar feature, e.g. CSI-2 and virtual channels.

>
> > +    type: boolean
> > +    description:
> > +      Support transport of multiple independent streams. Used for
> > +      DisplayPort MST-capable interfaces.
>
> Wouldn't this be implied by the devices at each end of the link?

For the case of the Intel DP receiver, MST support is an IP
configuration option which cannot be determined at probe time, so it
needs to be read from DT. Having learned that the receiver should use
properties from video-interfaces, I decided to put this property here.
Do you think that's a good idea?

> The drivers for each device should really list out features supported for
> the link. The mode used is then the union of those 2 lists with DT
> properties only used when the union is not definitive.

The mode that actually gets used (MST vs non-MST) is negotiated during
link setup as part of the DP protocol - the sink reports to the source
if it supports MST, and it's up to the source's ability to enable MST
or not.

The property I'm adding here is only useful for the driver to know if
the hw supports MST or not (in the case it can't determine it itself).

>
>
> > +
> >  additionalProperties: true
> > diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-=
bindings/media/video-interfaces.h
> > index 68ac4e05e37f..b236806f4482 100644
> > --- a/include/dt-bindings/media/video-interfaces.h
> > +++ b/include/dt-bindings/media/video-interfaces.h
> > @@ -12,5 +12,7 @@
> >  #define MEDIA_BUS_TYPE_CSI2_DPHY             4
> >  #define MEDIA_BUS_TYPE_PARALLEL                      5
> >  #define MEDIA_BUS_TYPE_BT656                 6
> > +#define MEDIA_BUS_TYPE_DPI                   7
> > +#define MEDIA_BUS_TYPE_DISPLAYPORT           8
> >
> >  #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
> > --
> > 2.45.0.rc1.225.g2a3ae87e7f-goog
> >

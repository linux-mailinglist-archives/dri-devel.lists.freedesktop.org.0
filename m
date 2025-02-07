Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC83EA2CAC9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 19:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B22910EBA1;
	Fri,  7 Feb 2025 18:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Z5S51b3T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714C210EB96
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 18:05:12 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so130635866b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 10:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738951510; x=1739556310;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OZIsw/eph0Ja1f9gKiHNlo33ou4ZjPNWGIGZAe/rGfE=;
 b=Z5S51b3TcQ9oCpBGVHK38zNBBT10RQrkpKaa6sIzpf9CG23ik3TJ3TQvrtWH3P2t77
 oeiMCDgFqAq4kB1XbRlm57kWwHTfLOLb9LuI8CwX0bdDPa+wlEIE6gWFnsungJ8vZcp+
 JbXB7PrEvHj71vqHROQNjW3F1YJc/EMpOd+L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738951510; x=1739556310;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZIsw/eph0Ja1f9gKiHNlo33ou4ZjPNWGIGZAe/rGfE=;
 b=LMN8dYMzZAMfTMMBMARB5x67Fnev3xXVbSWVTD1VTmiNzMVLhY+k/zAlK9n4FyFF2P
 XRF3TdpQhUdfL65gIrAf9giFXv+1j5xnx4fRKa0tbHN1mvZtauS1lEXjzz3W533RoU94
 kZNc07CUlxjTV+Xtb8i02V8+fAyHRlKhIKUdB4xWVzoRp0SzdqWzmG7VUX99Z5vpXKpE
 VJ8odbfmLzRDyXjA5mJGTtwqElFGUr1yB1yhE009wyQRdyvK9ZzE2hlX2DIuj1ZRjxNQ
 O9yH3e0a1k84zY88PRXlVcHR/KnEMdW0dxd+3bAXtIgpJATMex3oIOSZ5LUN9aD4tQI4
 +xHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd/V1ZyQoPhYyKGs0VvJ4blxldILxbuL0Ibw0hmkEeHraJDjL3wEnPTrsCMfX7yXKOJPhFCHS7TUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzYXEMvIS2LtR58xNg/tNKu7RlzYu3cpe9NrYG5UKPO5y2CJcN
 VrLpWrjECjE29a/p7IQUUQ/ODxKf67oJ17UW1g4bt6eIyZQQ5psx7/m5Cw+MJTqvev/RtzYF+dt
 ltDJG
X-Gm-Gg: ASbGnctaKBa7seH8wZALDaaKPSIjjm3d/GOJYyIXTT5quW69i+WmoB4NL7UwdbuE/HR
 xpoI6KruQzXcQRF++XOTmbCyYrK9RTZRVYNv11lA1Znr8METYpWk128WihGDvCbMmrfgxTBAVFg
 jfUge6vsmNYJy0+amMOdfB1RIClOktvP1gAu5sJDCdc+2yAlP84IrjpjzFS7MulXcQLI8cNyDOr
 O3z9qW0qsCAbKoK5GImhVrUzLE9TSHT/kwGhon0nMgZRAKJPUVq7HejX8m0McjLLoqUYnpvnG9S
 lOL/uKqn0cq3XvwOTpNKjSJWMwCQvkjX//qs8QLZfW6yWkEpqlbYw3Y=
X-Google-Smtp-Source: AGHT+IEwJn0riZ0EMHzV4a9t8IJPlSo3Rzbh+ul7zHU9xgH4px8yrTjuNtpl3wJB1XKvHME83x2EuQ==
X-Received: by 2002:a17:907:1b17:b0:ab6:cdc2:bf57 with SMTP id
 a640c23a62f3a-ab789a9eb28mr444364566b.1.1738951510220; 
 Fri, 07 Feb 2025 10:05:10 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab791fd194esm87913766b.129.2025.02.07.10.05.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 10:05:10 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5dcc38c7c6bso4810141a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 10:05:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUnSMPVGx07Q/kO60zV+VU14kt47Wmlz7nsRsxz/k+Ta334MUgUYNhn16gIMQhct59mCQ4wDBLTbgU=@lists.freedesktop.org
X-Received: by 2002:a05:6512:e9b:b0:542:7053:ef1b with SMTP id
 2adb3069b0e04-54414abb2d3mr1390120e87.29.1738951149433; Fri, 07 Feb 2025
 09:59:09 -0800 (PST)
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-2-yelangyan@huaqin.corp-partner.google.com>
 <CAD=FV=UfWJoUsKzYMkyU3U4Yn1ufAs=NHMCDL+db887Uec9fww@mail.gmail.com>
 <20250206-overlaid-eastward-610a0d6e34cd@spud>
 <CAD=FV=UqUkKXvEJr5JPHgjNnY_1ALv7TiRY1UQjVGD4_su8M_Q@mail.gmail.com>
In-Reply-To: <CAD=FV=UqUkKXvEJr5JPHgjNnY_1ALv7TiRY1UQjVGD4_su8M_Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Feb 2025 09:58:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W-faj7O=pYVeLuM1Fqj4BnyxzD2L2Tf+GRbdkAo3Kk7A@mail.gmail.com>
X-Gm-Features: AWEUYZkN40y1BSrM1hbsqCvffOXn5hViKgff7psR1NbkWrBJyE7Wzq5bYUwiG1E
Message-ID: <CAD=FV=W-faj7O=pYVeLuM1Fqj4BnyxzD2L2Tf+GRbdkAo3Kk7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor: add csot
To: Conor Dooley <conor@kernel.org>
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Thu, Feb 6, 2025 at 11:21=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Feb 6, 2025 at 10:13=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, Feb 06, 2025 at 09:12:45AM -0800, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
> > > <yelangyan@huaqin.corp-partner.google.com> wrote:
> > > >
> > > > Add "csot" to the Devicetree Vendor Prefix Registry.
> > > >
> > > > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com=
>
> > > > ---
> > > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml=
 b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > > index 42d14899d584..375f1f7c79ef 100644
> > > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > > @@ -336,6 +336,8 @@ patternProperties:
> > > >      description: Crystalfontz America, Inc.
> > > >    "^csky,.*":
> > > >      description: Hangzhou C-SKY Microsystems Co., Ltd
> > > > +  "^csot,.*":
> > > > +    description: Guangzhou China Star Optoelectronics Technology C=
o., Ltd
> > >
> > > Doing a `git log` on
> > > `Documentation/devicetree/bindings/vendor-prefixes.yaml` shows that
> > > most patches use the subject prefix `dt-bindings: vendor-prefixes`,
> > > not `dt-bindings: vendor`. If device-tree folks care about this
> > > difference and they don't want to fix it when applying, they might
> > > request you to send a new version.
> > >
> > > In any case, that's fairly minor so I'm OK with:
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > I would assume this will go through the DT tree, not drm-misc. If thi=
s
> > > is wrong then someone should shout.
> >
> > idk, probably the whole series should go together via drm-misc.
> > %subject can change if there's a resubmission, otherwise
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Ah, I'm fine landing it with drm-misc. I'll land it tomorrow unless
> there are objections. I'll adjust the subject when landing.

Pushed to drm-misc-next with Conor's Ack after adjusting the subject:

[1/3] dt-bindings: vendor-prefixes: add csot
      commit: 75e80af7d62e0dde006c23aec67b9ec8037324db

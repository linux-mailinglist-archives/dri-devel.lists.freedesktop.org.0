Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F75554A4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 21:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0683810E4CC;
	Wed, 22 Jun 2022 19:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A1E10E4CC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 19:39:38 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id 59so3999728qvb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 12:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=o69t0ilR7Hk+fBWUIkW0byFF7csFuoYUt8x0EJzEGT0=;
 b=zDwj7Z7XJsqKoyOUeeRZPzgUJAK7nqOO//vwa87996d/w2rMccrCEIAd4XiRHF4jv1
 M83CN02Ox+LGfiTQ/XnTX8sy8YqoxO/JrfceWUj8TR/A0WQwkxsHArGPUv0xlkynIMUs
 b2CTm7xWBa3Vt5BxAZhaVtlwN4XyVTTwU+5kV5lpfCaXzOMR2M37RA+CIYOK08SvH/e3
 5+VHzpcPVBkvKlQDqeS4gO+iH0OhKxzzw/wkm6RkwWmaTYfeT26+pgz9CI75e45VbkDx
 xskF6MIoPzqVZRKI8xdDLED3re7VDozsmHdplmPbev3ZKGYfVqL4mD/1ahLeAi5ObmMh
 qymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=o69t0ilR7Hk+fBWUIkW0byFF7csFuoYUt8x0EJzEGT0=;
 b=NbOxnkBhc4w4wnmLdSbrx2GP97mi+vAVVpiQJCuSmadPvaXwCeLEBnHgSFBo47BrM/
 Sinw8cnEW7W2ZAH2u6N8Qj532+6jMZwI6v4rn4xmERbvfrUFYkTtCnmdYRyGrzLuwXJX
 61TNo9fUS76zQFZTo+fxDeHIH7GSh8SR69MA71o92Aqevlvr16DFVYZDfIVN4QHKENfU
 /nQ66S5PnCFIKTjQPvX7YkbCV7oYO7h/lMhH4dTUW/Na2koDWzI0vtUoIF/lJL2swM+p
 gC1sPeTyOHUK7tSkHzfOKbHiGPT+Jzs+klg3V/gIsHjfr6FQh9OmoURM5egLabCG4t5p
 fOOg==
X-Gm-Message-State: AJIora8GOX4Jx0s5ytT+Am3+zQyaYY06BSZIzXJELTW6vDM8ZyUECcl4
 S5T3xBXq3jG5k+hrT47ueykwKQ==
X-Google-Smtp-Source: AGRyM1uBNURSl9Hk7+t9B98Zy80s9b7OW6cZ2Z/yFvCb5MY0v2TudFXnIjFB6e3Ii3PTZHJaY+JeLg==
X-Received: by 2002:a05:622a:292:b0:305:e2b7:bfa8 with SMTP id
 z18-20020a05622a029200b00305e2b7bfa8mr4668617qtw.243.1655926777927; 
 Wed, 22 Jun 2022 12:39:37 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 m22-20020a05620a291600b006a370031c3esm17833638qkp.106.2022.06.22.12.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 12:39:37 -0700 (PDT)
Message-ID: <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
Subject: Re: DMA-buf and uncached system memory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Daniel Vetter <daniel@ffwll.ch>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Date: Wed, 22 Jun 2022 15:39:36 -0400
In-Reply-To: <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mardi 16 f=C3=A9vrier 2021 =C3=A0 10:25 +0100, Daniel Vetter a =C3=A9cri=
t=C2=A0:
> So I think if AMD also guarantees to drop clean cachelines just do the
> same thing we do right now for intel integrated + discrete amd, but in
> reserve. It's fragile, but it does work.

Sorry to disrupt, but if you pass V4L2 vmalloc data to Intel display driver=
, you
also get nice dirt on the screen. If you have a UVC webcam that produces a =
pixel
format compatible with your display, you can reproduce the issue quite easi=
ly
with:

  gst-launch-1.0 v4l2src device=3D/dev/video0 ! kmssink

p.s. some frame-rate are less likely to exhibit the issue, make sure you cr=
eate
movement to see it.

The only solution I could think of (not implemented) was to detect in the
attach() call what the importers can do (with dev->coherent_dma_mask if I
recall), and otherwise flush the cache immediately and start flushing the c=
ache
from now on signalling it for DQBUF (in vb2 workqueue or dqbuf ioctl, I don=
't
have an idea yet). I bet this idea is inapplicable to were you have fences,=
 we
don't have that in v4l2.

This idea was hinted by Robert Becket (now in CC), but perhaps I picked it =
up
wrong, explaining it wrong, etc. I'm no expert, just noticed there wasn't r=
eally
a good plan for that, so one needs to make one up. I'm not aware oh an impo=
rter
could know how the memory was allocated by the exporter, and worst, how an
importer could figure-out that the export is going to produce buffer with h=
ot
CPU cache (UVC driver does memcpy from USB chunks of variable size to produ=
ce a
fixed size image).

Nicolas

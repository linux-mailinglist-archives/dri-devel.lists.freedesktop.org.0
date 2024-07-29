Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FF393EBCB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 05:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D684F10E2CC;
	Mon, 29 Jul 2024 03:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="EljQsHQW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E5E10E2CC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 03:10:56 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5a15692b6f6so5036274a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 20:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1722222654; x=1722827454;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AovMI4heGjn5SDk0Nj13+4S/I8bK52/EtqojLFqFeY0=;
 b=EljQsHQWJF4g6Ty0KnHbexwI2UuJ6W3boP3xhl3B/pyR0sDSfXuTKE+XQHuGcZ6Se/
 V8qcAoYDYBjsEuex3y5Rtpo1e7cLnKKZkYLI/u9EJOa9KhuWdMv8m7fJVeIFH5N8esm2
 pqUBWmavoqlUzkcz46n7iXLl51xymDgf+YAof79tQYjvQvRMWaSVaHVwYg0qiT8e+UCY
 H7hV1yeZ2PmS/DDACuOwiTaVQmz+x4ho5hGHQ+3heUTZKT27r+1saFlY5cwvaJu8dQap
 oFf3W3hbbUAR+RwNuVHhrWoiTVw5WcmNmOkYiwXKe3frzZbNA7FXmhqMyp+awuBZE9rE
 j8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722222654; x=1722827454;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AovMI4heGjn5SDk0Nj13+4S/I8bK52/EtqojLFqFeY0=;
 b=kYLfpOkKxR5sLbOluB6ecQG4CpG/BG1hDmXQSTOLacu1bCVnbTvphw5aqmrFIu9FR0
 AquQltjYylVtH5bG+HV1RBUZlorzxPZcTjzfDzmmh3UYs//ZcF3rBsElmWVOA1I1qiu9
 8N3EYSl9rJ8bbdPg+IIFhbjE2AjdguwyINBHorrfV+j80MDYHIjKNrWGlKdNWuSGZyqG
 HIXr+2YuoVsDrq+hiLltSRpYca6bWJL9a7ZMPpDvVaYwf/f/ojTwmfOZrAKAYzuyhDgr
 U3eiqZlCXWHXWAij+67yRn1F95EA+aMDZRO4JIvx7u3BP41Ps5o7Fh94gVlx2LKeebiC
 VX5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwMjqpnogbpLDYjBoIkMqeRa0twlA22vRuGnsQsCPtSzsxUNbh3B+r2V9i0Zo3q4BMytFBzvxGjt8t7uRWuQK6GKJpqEMhYZXwkf+NXOTV
X-Gm-Message-State: AOJu0YyDbzsCGGBCXlhUu/xA33rmx4c3+jH9DH/nCCgWixzEFsYQefm4
 oMEax7Pnsc7CX2Pu5yO8/mNAfjLOVIcHJyTBQJqXKn+3l52UGe4sN5YvZ1Ars2nSSkEhy2iDC9+
 adWnAsThjc1w2igxSLdYH5st//zs7GM7ernqqbQ==
X-Google-Smtp-Source: AGHT+IGRTqCqtuC3oYSZw0bgm/HOWiWzOGyrBjLJHhFnBoEcaLQFh/lUCiWS84RXrUoG0RjGP5dU4flhYq2KIZLQSxw=
X-Received: by 2002:a50:d681:0:b0:5a1:73fc:6bdd with SMTP id
 4fb4d7f45d1cf-5b0207ca612mr4170775a12.15.1722222654237; Sun, 28 Jul 2024
 20:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240725083245.12253-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <gq5fcttutomphgfrwrtloqzczia3uc5qpont3lrowocan2xjc5@ubfabhsh3mfl>
In-Reply-To: <gq5fcttutomphgfrwrtloqzczia3uc5qpont3lrowocan2xjc5@ubfabhsh3mfl>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Mon, 29 Jul 2024 11:10:43 +0800
Message-ID: <CA+6=WdQuFYbADjG0i_zWMGYmw95H1U_McqCw4CLW0+Gate50YA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/panel: jd9365da: Move the sending location of
 the 11/29 command
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 dianders@chromium.org, hsinyi@google.com, airlied@gmail.com, daniel@ffwll.ch, 
 jagan@edgeble.ai, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Sun, Jul 28, 2024 at 12:59=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Jul 25, 2024 at 04:32:44PM GMT, Zhaoxiong Lv wrote:
> > Move the 11/29 command from enable() to init() function
> >
> > As mentioned in the patch:
> > https://lore.kernel.org/all/20240624141926.5250-2-lvzhaoxiong@huaqin.co=
rp-partner.google.com/
> >
> > Our DSI host has different modes in prepare() and enable()
> > functions. prepare() is in LP mode and enable() is in HS mode.
> > Since the 11/29 command must also be sent in LP mode,
> > so we also move 11/29 command to the init() function.
> >
> > After moving the 11/29 command to the init() function,
> > we no longer need additional delay judgment, so we delete
> > variables "exit_sleep_to_display_on_delay_ms" and
> > "display_on_delay_ms".
>
> Won't this result in a garbage being displayed on the panel during
> startup?

Hi Dmitry

We just moved "Exit sleep mode" and "set display on" from the enable()
function to the init() function and did not make any other changes.
It seems that many drivers also put the "init code" and "Exit sleep
mode" in one function.
In addition, we briefly tested the kingdisplay_kd101ne3 panel and
melfas_lmfbx101117480 panel, and it seems that there is no garbage on
the panel.

BR
>
> >
> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com=
>
> > ---
> >  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 59 ++++++++++---------
> >  1 file changed, 32 insertions(+), 27 deletions(-)
>

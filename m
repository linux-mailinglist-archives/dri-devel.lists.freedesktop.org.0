Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC07A5E8F7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 01:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F73C10E0E7;
	Thu, 13 Mar 2025 00:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Vr/5chIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE8010E0E7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 00:22:06 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30bf3f3539dso4256011fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 17:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741825322; x=1742430122;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ve1CmfI0K+KYT8TLuMs4lWO1u62BwBHsIfFJVhmEIVY=;
 b=Vr/5chIyoV2Q9J34vR+A/Ab+hS4zzu/BsNPID13xXOQR4/5CnPHtQFpm84QmUhbtcG
 JBuI8Wj+iXMqgu4n93ZExbF3ZCzJpTuKNf4ijV8+dF1zXMUvEdqDOM48DvUtwX4Q1meB
 WuFa7k/GuRszfoIEqhyT7R1XYUcUQbPvWPekg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741825322; x=1742430122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ve1CmfI0K+KYT8TLuMs4lWO1u62BwBHsIfFJVhmEIVY=;
 b=AvGd1UnxuMLyRuNOML6HN258yFAerM5COrxFDWTbN4MzQvMuBNGCm8DjU60NUXCBow
 J0AgE6a9MvgrkgAqtdw7lorL243PpFJNYXU+dTkH/aOZQM3OCD/eEnNn1BmsZMR0kk6a
 8ZCZz3JCggpUEpF8ISpxwRUUtWwqoCfwMPZCCeKyf5bOY37BGaIJ3c2fRInR5zONB42J
 3qyosmRWkWWRdTRHVrp1OA6qRhJombuhesUjhEKh+o428sHomiDkGVCaDnrWw5rHuMgL
 JLkL7SORi9+k01DQvnObJ50OKx2hirItkAQRxDCJa3wPjD3ZVafrR6sJCwogZEUh6gPT
 vqeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJedad0msGBoyC5qS7xWSk8V6JD3CmjOhVrxoB+YboJTceXWC7AMQk2+Kh8ihfYD270fpYgfTL6Is=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysdTua13G/qU/TIhwspQwWLywPJ/H2A8av0VveMMOQoP4P8nmE
 0+/t5/zOqZNQK58k4yq5Pf1vAzsY/djFO2uBc0FRuzlqD3LtYI7U+SXVTqD0cOv2KPQLchAUIVx
 /dncZ
X-Gm-Gg: ASbGnct75gRuhv3ngsJvCGmZJgr3xrT5NHhMgGEWi78ZLZ+LBZi/1AHv4L/1gjG84/3
 hcmztK8QEwg0rgdxPcpZdwYaCds12EOrL3MKJtA6rAmK2HAs5JChIJArJtIv1zjQScE1mP363vP
 9Rhyd81DnOCAWMTKfAAFOD6ejeyhH8IiBd4p9ZZeqIqpDA++2UWUfK9q5FoT6wX3q+GstfwpPi2
 fz22WwORrnv2xSXO/Vm+wYUnIv9Mc9jwSrcbELA6mXkD3ya7PhNxuUKF6GbR8sWKJgJcBlSPKI6
 REZFUgy9yX+HC/ngnAGiSFNE4jVQYJgjNbZCQVCTMqK8AFkuaq0Lv0hELJDVWSx8eXQA8Cq114G
 wrluR5Zzk
X-Google-Smtp-Source: AGHT+IGTQe3MhMFBn+oaMKIbL9Dj9qfBS5DSThoN7mK/NVsJ9f8vslzVTHiYfHSnFtDTGEYyxsmBbw==
X-Received: by 2002:a05:651c:1199:b0:30b:ee7d:1a88 with SMTP id
 38308e7fff4ca-30c3dd6d50cmr1815751fa.10.1741825321668; 
 Wed, 12 Mar 2025 17:22:01 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f1dbf8esm148431fa.102.2025.03.12.17.21.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 17:21:59 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5499da759e8so1683346e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 17:21:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVFgmgyx0nygOeP2lpTlMnDCHCWvQNDnKboZlwm741RHwsQ99BJnvwAi0OLt8tDuCZ676U1ZqMZ1zM=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3c8a:b0:545:2474:2c9b with SMTP id
 2adb3069b0e04-549ba428698mr204467e87.22.1741825317941; Wed, 12 Mar 2025
 17:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-mipi-synaptic-1-v2-1-20ee4397c670@redhat.com>
 <20250311-warm-icy-rottweiler-cefcdd@houat>
 <CAN9Xe3Qwu=E=VVZZ_8EHPF7Xsk6Zcbp=R_b=cRgF=9SWCkmsqA@mail.gmail.com>
 <CAD=FV=XdngrNhUn8jQ3FGitkBCkiQO1dXnPhCKj+S5Jo8_WUrQ@mail.gmail.com>
 <CAN9Xe3RQ_L5a+PbXCBbzpn3VxyWEL1_wqA5trY0h=Xj-YMcA1g@mail.gmail.com>
In-Reply-To: <CAN9Xe3RQ_L5a+PbXCBbzpn3VxyWEL1_wqA5trY0h=Xj-YMcA1g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Mar 2025 17:21:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJDHAdDCD=Mhffawuz8U7=MkzDueXmAvKpJ-o5eOT6DQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqR2ONbIt8VCOUlU6wE07GPZEZIhiBEtbAX58jcej3ZuGEyEk_GhqGWc0o
Message-ID: <CAD=FV=WJDHAdDCD=Mhffawuz8U7=MkzDueXmAvKpJ-o5eOT6DQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel/synaptics-r63353: Use _multi variants
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
 Michael Trimarchi <michael@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tejas Vipin <tejasvipin76@gmail.com>
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

On Wed, Mar 12, 2025 at 5:00=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:
>
>
>
> On Wed, Mar 12, 2025 at 11:48=E2=80=AFAM Doug Anderson <dianders@chromium=
.org> wrote:
>>
>> Hi,
>>
>> On Wed, Mar 12, 2025 at 8:06=E2=80=AFAM Anusha Srivatsa <asrivats@redhat=
.com> wrote:
>> >
>> >> > @@ -106,53 +107,46 @@ static int r63353_panel_power_off(struct r633=
53_panel *rpanel)
>> >> >  static int r63353_panel_activate(struct r63353_panel *rpanel)
>> >> >  {
>> >> >       struct mipi_dsi_device *dsi =3D rpanel->dsi;
>> >> > -     struct device *dev =3D &dsi->dev;
>> >> > -     int i, ret;
>> >> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>> >> > +     int i;
>> >> >
>> >> > -     ret =3D mipi_dsi_dcs_soft_reset(dsi);
>> >> > -     if (ret < 0) {
>> >> > -             dev_err(dev, "Failed to do Software Reset (%d)\n", re=
t);
>> >> > +     mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
>> >> > +     if (dsi_ctx.accum_err)
>> >> >               goto fail;
>> >> > -     }
>> >>
>> >> This changes was definitely not what the script is doing.
>> >
>> >
>> > It isnt. Using coccinelle for the major part of pattern matching and r=
eplacing the newer _multi variant API. Some handling (including a newline t=
hat it introduces) and  the returns depend on a case by case basis, which h=
ad to be done manually.
>>
>> ...and now you're getting to see why I didn't think a coccinelle
>> script could fully handle this task. ;-) IMO instead of trying to get
>> a coccinelle script to do the full conversion, the right approach
>> would be to use a coccinelle script (or equivalent) to get the basics
>> done (just so you don't make any typos) and then cleanup the result
>> manually. Spending more time on the coccinelle script than it would
>> take to do the conversion manually is probably not the right approach.
>>
>> If your patch wasn't fully generated by a coccinelle script you should
>> document that in the commit message. Something like "Initial patch was
>> generated by a coccinelle script and the result was cleaned up
>> manually." If the script is too long to fit in the commit message,
>> it's fine to put it somewhere online and provide a link. "Somewhere
>> online" could easily be a mailing list post.
>>
>
> You know I have been thinking if it makes sense to have this script merge=
d to coccinelle project and add those details in the commit log.... Was hav=
ing an offline discussion with  @Maxime Ripard today and he rightly pointed=
 out that since it is too specific, once all the conversions are done , the=
 script  would not be further useable....
> About having the script online and providing a link, something link a git=
hub link?

That feels overkill. It seems like you could just send an email to
LKML or dri-devel and then link it that way. It could be in reply to
this thread or a totally separate email. lore.kernel.org links are
great.

-Doug

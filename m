Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 578617E9C3E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 13:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8673010E367;
	Mon, 13 Nov 2023 12:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2580C10E367
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 12:36:41 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cc29f39e7aso25500105ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 04:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699879000; x=1700483800;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N7fd3NkmRs1TcP13IIIzHjBYBryAxIazbkG5BgzI5mE=;
 b=2dYc8336WP0fbXCo0DjXMu+7ozn/hDljotBpV4go3G3+Dta9JSiB9pHrAzzbBJd06h
 hbaZrLNA/1BXqszqOkhpWcAwVF9E5KIRvTdtplchnHpERVgdPGDk3VmzKrDb6x86sHSz
 viGtTD/AcTWK0IWQTKGXPuN6Exb9E+DZbdBr4jWZVgpgA0HPB+X9pe+JRGMYkMeqpEdp
 38ElzpiHATCFfa2OwCWyqPaunS3JbM5RhxJMP9aJl6OtdJNPv7wtYlAYFxY93KSd88XV
 oAZXW9hDh13AsqrJxwnM9gOlwbh7/p0/v3aTznlsw+ceRNzeFhlnbsMH3hpSf0M7Rhr1
 ioYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699879000; x=1700483800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N7fd3NkmRs1TcP13IIIzHjBYBryAxIazbkG5BgzI5mE=;
 b=wVXuEnSh5ara10WYVMbF2Um6kmMn5TngfiXz/1y2jefq8VwO8Y2+OPtrkJ/AWmze9T
 UAAz0PYMnOChvX3+NanbKVkGpKV6tfLHdZmKdfHhL6tWCQYdK8P+sFMQDbe8EyMJlbNh
 Fkfk0rAVh9yd8EfD0IEXjAfT7zaJ38denHc/AIiXSD54x7dS4Xaj/xP0YZHrKictT+GB
 dHkEjB/tbB7b3uYFdJJlX243Sk0pmn7RLodJllT/8B5b8VmEAbauG/6XAlUW31oV+S0f
 MM5P7JnnEvYL3YVpYBS9EHQhhyGf7+9kgqoDeA3YXcTTzR7V7fRBe7xXjO6Pq0GCh0KF
 nf1A==
X-Gm-Message-State: AOJu0YxtaCe3zvU2h92/NSYFHhzDt47nY6Z1mzi1JZimZ0zbbwbBTp9O
 rPOYgXLJc2wGyWLo2380ys/TgUO3Qz6pQVvPqvW8tg==
X-Google-Smtp-Source: AGHT+IE2ocVhD2bFAYD17QTNw6/qm9x0sjQXoyVQ3TMdYQ8aX5bC4MlhJ9OsyJAQhpHZmmhVQdbymSnskXMsJuihPJA=
X-Received: by 2002:a17:90b:3b8b:b0:283:27e0:652c with SMTP id
 pc11-20020a17090b3b8b00b0028327e0652cmr3516045pjb.43.1699879000545; Mon, 13
 Nov 2023 04:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20231110094553.2361842-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=UvZ9U1SYjOOBB6o2CmquAevqJZ9Ukp_kx4zGXFbp_VBA@mail.gmail.com>
In-Reply-To: <CAD=FV=UvZ9U1SYjOOBB6o2CmquAevqJZ9Ukp_kx4zGXFbp_VBA@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Mon, 13 Nov 2023 20:36:29 +0800
Message-ID: <CAHwB_NL4P183Y9RaThdEDWPaiLfaU6PxzJS0thSBLW-+FHYtRA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
 panel HFP and HBP
To: Doug Anderson <dianders@google.com>
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
Cc: neil.armstrong@linaro.org, zhouruihai@huaqin.com,
 devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Nov 11, 2023 at 5:10=E2=80=AFAM Doug Anderson <dianders@google.com>=
 wrote:
>
> Hi,
>
> On Fri, Nov 10, 2023 at 1:46=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > The refresh reported by modotest is 60.46Hz, and the actual measurement
>
> s/modotets/modetest/
>
> > is 60.01Hz, which is outside the expected tolerance. Adjust hporch and
> > pixel clock to fix it. After repair, modetest and actual measurement we=
re
> > all 60.01Hz.
>
> Can you explain this more? Why was the rate that modetest reported
> different from the actual measured rate? This feels like it's a
> problem with your MIPI controller not being able to accurately make
> the rate. Is that it?

modetest refresh =3D Pixel CLK/ htotal  * vtotal
measurement HS->LP cycle time =3D Vblanking
According to the vendor's feedback, the actual measured frame rate is not
only affected by Htotal/Vtotal/pixel clock,  Lane-num/PixelBit/LineTime als=
o
affected. It seems that if  change to a different SOC platform,  may
need to readjust
these parameters.


>
> If so then this is a bit of a hack. Someone else using the same panel
> might have a MIPI controller that can make slightly different clock
> rates. I think you're currently the only user of the panel, so maybe
> this isn't too terrible (would love to hear other people's advice).
>
> Assuming this is actually the problem there are probably at least
> several different ways to solve this. One that comes to mind is the
> solution we ended up with for eDP where we allowed specifying some of
> this stuff in the device tree, though that might cause a whole pile of
> debates...
>
> In any case, as I said above this patch is probably OK if you're the
> only user of this panel, but it might be at least good to add
> something to the commit message?

OK, I'll add some instructions in V2. Thanks.

>
> -Doug

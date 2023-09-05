Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3442792E93
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 21:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8EE10E1A2;
	Tue,  5 Sep 2023 19:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A8210E1A2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 19:13:18 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-52e828ad46bso989873a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 12:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693941195; x=1694545995;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BUlpaGleIWzbTmcbFt9fpixpRahjTzIY6Eh3TvOZ30I=;
 b=cpw/MR1Caa0gzhAh5AsjAb5WnVekPHq8WmmiD36eJ0c34OxQf2QhWmXHEEZ7osmuEo
 FH15D0CJrCEK/a7v912lo9gsK5Q5M7hRUqoN/FdaEAoUc9SoQGd6gFWLld69xiaE7luY
 aWHml/gDITFFgFrcNVCRChRG9wLo0gTeu1gck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693941195; x=1694545995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BUlpaGleIWzbTmcbFt9fpixpRahjTzIY6Eh3TvOZ30I=;
 b=AhY7i/hhRE0e4LVlcGmk1z/LweMbJ/FXCbfVDqsrhBhTA9gA98IJyncISXddRL3DRy
 ytrBc77MPb8wEnpA0F0t5YLZ0DMvIuOaYo4MOAlSzsJmg5S964NzG5aPYqyaZG9jWl/8
 fjZGOI+ur4YDXpfIsXl/gTBnPPH0gGV/v66BkLsLhAGTzYXo0RRXvwF6pjEhM+mtAkI9
 z/CcWqA1gSG1di4nKs6V2/GY6GqDrRZGuQ8RiBf/pgbZ/k6dnnf3TIgZpA1y9aox99BS
 tL9zf6yl3qYrMxeYkRdrfq4Q3PEN1hYLm7PRXp0vV8HxpNMKSVUeVZB9Q3tJvX0aoUWM
 h4zw==
X-Gm-Message-State: AOJu0YybzY8uiW8eoWvw6CVwlhaNZ09Ih31qrPax8LvDwmJlbnS6ncUt
 rXiIqjvdA9gGcEstNZvVg2gN3SWtEHmv9In1DtNpMzmO
X-Google-Smtp-Source: AGHT+IF3TrbU9Vqj1x9qUndvQSDiS2Zc1LXOqgLKuoxl4plLdu8htMPDUUQMYBjL0UeutMlLTJqylg==
X-Received: by 2002:aa7:cd7a:0:b0:525:469a:fc47 with SMTP id
 ca26-20020aa7cd7a000000b00525469afc47mr551516edb.22.1693941195003; 
 Tue, 05 Sep 2023 12:13:15 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 f26-20020a056402069a00b0051e2670d599sm7560058edy.4.2023.09.05.12.13.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 12:13:14 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4005f0a6c2bso18785e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 12:13:14 -0700 (PDT)
X-Received: by 2002:a05:600c:4f14:b0:3fe:e9ea:9653 with SMTP id
 l20-20020a05600c4f1400b003fee9ea9653mr25746wmq.4.1693941193859; Tue, 05 Sep
 2023 12:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <bphkopaq76imqzut7xrx7aprqybhx3veajdympqhig2wqlix6c@64ck23rc5cv7>
 <CAD=FV=XiVkoCsjin4R74nkcd8vzOq9uPq+o5cRjd=YOoPXuQkg@mail.gmail.com>
 <lhd6ai7d6swlxhisjhikytguor7pptrymo3bmfwej4k7zqrnv4@hp2gvhw7mh3m>
 <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
 <mumiep5q7x7qj7k64h3cyodxrgk737iy5rum5keguquwymf2gy@3qruwfrqjgy7>
 <CAD=FV=VEene+nr1us87iA+bomxzQ039r-E+wqvizvFGbxXjDvA@mail.gmail.com>
 <wwzbd7dt5qyimshnd7sbgkf5gxk7tq5dxtrerz76uw5p6s7tzt@cbiezkfeuqqn>
 <CAD=FV=XcUVvg5Om__dD=i9zu7ZtQmvWicms9yN7w0c2nWGhqYg@mail.gmail.com>
 <p7okuysh442hulqls3ekbaar2bguqv67fum3gsb2cj75kjvdpx@uebwlgvf46sy>
 <CAD=FV=Xr4nZUeHY-FdiedcV=BuP5szNBEHPKjdRnA7c+3MADqg@mail.gmail.com>
 <nahwibpea2akyg7swbdb3f6xyv7fqs35v5spqbjfzfchxnoqqz@glgg5core75d>
 <CAD=FV=UKSc4mNjWcvLCXT9Tdeok=xRjA0oVoLKVkq+kQ9-4M0A@mail.gmail.com>
In-Reply-To: <CAD=FV=UKSc4mNjWcvLCXT9Tdeok=xRjA0oVoLKVkq+kQ9-4M0A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Sep 2023 12:12:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZOxT58=jx4=iAyjXGnON_qROy4puosT0WfB5yy+2Ndw@mail.gmail.com>
Message-ID: <CAD=FV=UZOxT58=jx4=iAyjXGnON_qROy4puosT0WfB5yy+2Ndw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 5, 2023 at 9:45=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> As per our discussion, in V2 we will make drm_panel_remove() actually
> unprepare / disable a panel if it was left enabled. This would
> essentially fold in the drm_panel_helper_shutdown() from my RFC patch.
> This would make tdo_tl070wsh30_panel_remove() behave the same as it
> did before. Ugh, though I may have to think about this more when I get
> to implementation since I don't think there's a guarantee of the
> ordering of shutdown calls between the DRM driver and the panel.
> Anyway, something to discuss later.

Ugh, ignore the above paragraph. I managed to confuse myself and was
thinking about shutdown but talking about remove. Sigh. :( Instead,
pretend the above paragraph said:

As per our discussion, in V2 we will make drm_panel_remove() actually
unprepare / disable a panel (and print a warning) if it was left
enabled. This would essentially fold in the
drm_panel_helper_shutdown() from my RFC patch (but add a warning).
This would make tdo_tl070wsh30_panel_remove() behave the same as it
did before with the addition of a warning if someone tries to remove a
currently powered panel.

-Doug

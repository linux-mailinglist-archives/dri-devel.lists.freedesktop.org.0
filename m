Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2764FA42C81
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 20:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D61510E4B0;
	Mon, 24 Feb 2025 19:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eDATA/BM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C3810E4B0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 19:15:05 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-307d1ab59c6so53362061fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 11:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1740424500; x=1741029300;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFwWACfJvly3TimpIZIv2QEBJArjKTFr1P6UvNu7FGg=;
 b=eDATA/BMOfaNgU43hDhLrNeWkfceL/Ig9C+Aki4EbEsl4SMdcTCn2BbJGeeu9T0aud
 dy6ZNfMgdIUDIYsJajFEvszGxmAcHkT0fbAc9zVeyNXtQY3BEmqo5I6suvzQU0DIZYB/
 dPZWdojukNsCLmOk/6YzY6D/OTG9s/5ZIzavw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740424500; x=1741029300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JFwWACfJvly3TimpIZIv2QEBJArjKTFr1P6UvNu7FGg=;
 b=NoBiH+KYSm6t+bQ9MUK6ZtHlmGgVZmrtv8yeTGDM0LjHaPkFgzzPKRFMP1m1a3TPxs
 ODKu3mwdpJ5JtHdkwAJTD5LIicRgMErqKZBFMgwiHk5p1IUY+ujhGSH1g1oLeIJ73whL
 UH70kt8b46q7Axh+Cc+ZVClla62hOsHKF4FX7jy1V6yUw+8rhsudpPFhe6Y+rqMo+d/r
 33azBHX5w6B2///U6163w0xPYQDZ6hyRt9JozIMLxBF1aeEwpGoflAKapGjCHw4XhaU7
 yRAO29mV6pSVz7DUz//aVn9PvT0DTYs8V0BKNhAYHptGUqMppILwiaUMgouaSL+hYI1b
 k4Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3L9I99WfLnj7y1bEQMymSjbT5sM8MRypAJW8N86dKpAJaRezzUw1l0I/wya/U8z094rmkHMCfvmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLeLghEZoixg1xvR4OzCsAvFQsiRJxQygxp3PrCTexaE6By+Dn
 bCVG+2NSBPnBcGELxfG14EoM2Efru84EyZsTpK4TeQFZe6/2Ew/diohLnqGTcwxRaHO/v7yaXGe
 aNA==
X-Gm-Gg: ASbGncv9WRWnbqVIXBBnDlUA0g7AJyt9oQQ8H4u9N/4UnAxouTa4OZZvy3P9a66fl8d
 014VCKg5wvTI+R8Jk1uZL7fcfiGebNVJ3nFGuO+PdWIAcIqGgzgIAe1MnlFn5FMGVE7iJWBG+52
 8h+sdxxGpkWi3vlIg6V6JOOaHRJTIj3AY9MIOv9p0n4E0I4HCd+FemnhIhzG+jAh9PQrsVTywe3
 pCPndxt9Zlln6lc1FXJ7AkRp0kS0Ru3oSQxop1phNCkVESqniFkbK+OikK3xv1JpAisLlJmFat2
 nqIUZ8NBKShUWGIRxeO2YdwuH7N6o6ZCu4l48pr4vDwqt/rg523XfnQt7rGzE4HyCkcPHQ==
X-Google-Smtp-Source: AGHT+IE4DgLrrunMPPVnPAZRCMBgahXG5nK3zhmfQ/XgC6XKq5ePNLb8LFYXaCFUmfHL5OSctYtJ6A==
X-Received: by 2002:a05:651c:541:b0:308:f5f0:c403 with SMTP id
 38308e7fff4ca-30a599bb30emr61557461fa.35.1740424499823; 
 Mon, 24 Feb 2025 11:14:59 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819e0c18sm139761fa.15.2025.02.24.11.14.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 11:14:59 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-307d1ab59c6so53361261fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 11:14:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWGbfHwp1/8yq9NGyBjcVkQdT7zMwsbIiCDN3hPogvELHvNuX4xdFAqBJPu8qxcP/OLeli6830KcA8=@lists.freedesktop.org
X-Received: by 2002:a05:6512:a91:b0:545:ab8:2bed with SMTP id
 2adb3069b0e04-54838eff589mr5600639e87.28.1740424498000; Mon, 24 Feb 2025
 11:14:58 -0800 (PST)
MIME-Version: 1.0
References: <20250214172958.81258-1-tejasvipin76@gmail.com>
 <20250214172958.81258-3-tejasvipin76@gmail.com>
 <CAD=FV=U22kToVeyCBy_TV5hNKuMZv-QBUg0WTyXsMSu=bHLd3g@mail.gmail.com>
 <260b1542-a9b3-4541-abbf-0edb796918f2@gmail.com>
In-Reply-To: <260b1542-a9b3-4541-abbf-0edb796918f2@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 11:14:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xn=ZztJVGA46eeRn442BnPAOwefwNid6Lm5ZHnLuCZcA@mail.gmail.com>
X-Gm-Features: AWEUYZmO6vGLyUBmWDxm78XuNqM9mknBitSEQMpTZlilUORJ0saWZ4Ayv5wcIFo
Message-ID: <CAD=FV=Xn=ZztJVGA46eeRn442BnPAOwefwNid6Lm5ZHnLuCZcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: sony-td4353-jdi: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
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

On Fri, Feb 14, 2025 at 8:46=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
>
>
> On 2/15/25 6:12 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Feb 14, 2025 at 9:30=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail=
.com> wrote:
> >>
> >> Change the sony-td4353-jdi panel to use multi style functions for
> >> improved error handling.
> >>
> >> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> >> ---
> >>  drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 107 ++++-------------=
-
> >>  1 file changed, 23 insertions(+), 84 deletions(-)
> >
> > Nice diffstat and so much boilerplate error code removed. :-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> If I rebase both the patches into 1, should I still add the Reviewed-by
> tag?

Sorry, I was away, but it looks like you've sent v2 anyway and what
you did there is fine. In this case my "Reviewed-by" for the second
patch was more me helping myself keep track of the fact that I'd
already looked at all the contents on this patch and I was happy with
it.

For the record, most of the time it seems like you're expected to just
"guess" a bit what a reviewer would want. The absolute safest thing
you can do is to remove the "Reviewed-by" (like you did) but then also
"after the cut" in your new patch (like where you put version history)
indicate why you didn't carry the Reviewed-by. Like you could say:

NOTE: removed Doug's review tag in v2 because it was only provided for
one of the two patches that were squashed together.

Then if I wondered why you didn't carry my tag I'd have my answer.
Some reviewers get upset if you don't carry their tag forward and you
don't explain why you didn't. ;-)

-Doug

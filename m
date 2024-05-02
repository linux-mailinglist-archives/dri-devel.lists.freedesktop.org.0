Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C9E8B9F3F
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 19:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9754B10F6B3;
	Thu,  2 May 2024 17:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bu4EmwIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9188C10F6B3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 17:08:09 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-43a317135a5so18277581cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714669688; x=1715274488;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yfEfgnbI/CxJ5ZrsYiF3f7UnPAi8m4tSyPA7mSTVJvs=;
 b=bu4EmwIV1hy8NsN/q+s5XlkpvV5HfjM5jNJKjFjPjNkdJtPT1krEGMdW7F3tgc+q7d
 K2e6LxcuD/TBDVlN0T1+QqepOvW9fhCSfgh6JWUDSxclo6Ne2TpVhEpnkMoz94xWrOqU
 ix9jHSQg09P2IqF3kRzjN9AiOaipQBUY6516A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714669688; x=1715274488;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yfEfgnbI/CxJ5ZrsYiF3f7UnPAi8m4tSyPA7mSTVJvs=;
 b=nTpYG6gqJNbqjlgSNXj39Ljz7yAAWl0J/temgZ/pzIE+ixuyZBE1OJwZHHiEKTgH8+
 SwKJsNyumMvwK32SDolXuwGTglbhlrE9w3NpLawvLtn0Yylp++tNC6kL/Ta0CgZgvR/X
 PhZFIMrDeBxSHu4zS/F3qLFe+bmYAKak13ymsQOiz5imJkUMIW4eQ++dn/na9bU/6wSn
 gcF4Mg2wLZu1A+Sc7ZgPWv11Ifp/FGYl+FVQkaFlfkpYHCHtz3YM43vLf/L7wWFVGSuE
 kvAARTGHrwS+zBdTJmTf6BD/safxiKA5l/AI61GdbhRBTAcPIc2Y58uriG62EU6/YMNd
 8CzA==
X-Gm-Message-State: AOJu0YwFIw0BsD18RpQZyhHH1rkVasgp8D0WMMUbjSRpud7223eXUm6r
 sTloYXptQ8uW5Ryy/QPni6EM01yjfg6EVfWhgQo3JbToPEOXzuLKwEk686ddRzzb7cqw1X0pPlo
 =
X-Google-Smtp-Source: AGHT+IG11HmXUJFGqeLqYW1XxFB92FESbEWmrlf5wYPOdnTn/3nJ3bhGlRE3SHgOUEar53SzqPQiXw==
X-Received: by 2002:ac8:5a85:0:b0:43a:d398:588e with SMTP id
 c5-20020ac85a85000000b0043ad398588emr634830qtc.23.1714669687907; 
 Thu, 02 May 2024 10:08:07 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 ha14-20020a05622a2b0e00b00434f50f5d82sm645065qtb.14.2024.05.02.10.08.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 10:08:07 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-43989e6ca42so24591cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 10:08:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1449:b0:43a:cfd8:58e4 with SMTP id
 d75a77b69052e-43ca9f346b8mr3920991cf.12.1714669192391; Thu, 02 May 2024
 09:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org>
 <20240501084109.v3.4.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
 <CACRpkdb2eJWVYREhpCUoJnYeutBybBY8mic2SAUuU67MW5Hjbg@mail.gmail.com>
In-Reply-To: <CACRpkdb2eJWVYREhpCUoJnYeutBybBY8mic2SAUuU67MW5Hjbg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 May 2024 09:59:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEi8+FkKvQAXWGJDmPQ6e6ybj12xrfqi8jddBMEsNpHQ@mail.gmail.com>
Message-ID: <CAD=FV=WEi8+FkKvQAXWGJDmPQ6e6ybj12xrfqi8jddBMEsNpHQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, 
 Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Joel Selvaraj <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Thu, May 2, 2024 at 1:23=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Wed, May 1, 2024 at 5:43=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> > Through a cooperative effort between Hsin-Yi Wang and Dmitry
> > Baryshkov, we have realized the dev_err() in the
> > mipi_dsi_*_write_seq() macros was causing quite a bit of bloat to the
> > kernel. Let's hoist this call into drm_mipi_dsi.c by adding a "chatty"
> > version of the functions that includes the print. While doing this,
> > add a bit more comments to these macros making it clear that they
> > print errors and also that they return out of _the caller's_ function.
>
> This doesn't really explain why this takes so much less space.
>
> Please add some explanation like that "the macro gets inlined
> and thus the error report string gets inlined into every call to
> mipi_dsi_dcs_write_seq() and mipi_dsi_generic_write_seq(),
> by using a call to a "chatty" function, the usage is reduced to one
> string in the chatty function and a function call at the invoking
> site".
>
> With some explanation like that +/- added in:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Sure. I'll plan on not sending out a v4 (unless I need to for some
other reason) and I can just add your wording in when applying. Yell
if you want me to do something different.

-Doug

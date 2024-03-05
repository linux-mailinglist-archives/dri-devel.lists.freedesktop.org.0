Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200BA87124B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 02:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB5E10E0A4;
	Tue,  5 Mar 2024 01:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JFMssdXF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BD210E0A4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 01:23:37 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6e558a67f70so4598281b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 17:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709601817; x=1710206617;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ewYmbhQy4LSOG3/UFpUzYg8tk5p9Nq3z57wkElHRIrM=;
 b=JFMssdXFJ6qYWkEqNrTIs5D372Mz55qZBIqll0sSYKUQ8tBG0N9hokDabXwcGkKPpg
 /EK6dBYqYIn3a0P37Ym4uUR2QrF3qQ5B9X3uMpuqOJKNMEH4U8inF2bK3nOTSjVd0VqJ
 rzwLjPT1HlF6Rr+wtPyHKc1692n8hHNR23z4ZeC0+Lh+8NH9zsKYCTN15efBQZQXL6kP
 x3BUIrgHj2Sf3eZhe6f/fcacgcc8jCQxsSByYENwsW5lvtEQgAwq96LDQCUj08r6JQoC
 HYPNzLRU9LyqWxAcOEOcjHo1o/ZQMJ98+HWMSRJwRzWu6HcaRccxGpZUJ1dU7N77djZB
 FNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709601817; x=1710206617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ewYmbhQy4LSOG3/UFpUzYg8tk5p9Nq3z57wkElHRIrM=;
 b=vXIfDY7xxX6rNDgyPaXocC6RCevE3iA01SsFWYduRZcTnmslUXkRJjijHoscEdrqyj
 QKGjXQL4snYyGdOJ1kfXtpv1AFvoiwzSZbcrdPM7e86C6BPFMLzDbpR+hx/6+hAdWSX9
 3npX1IvBkszigE9VpgAVhStAsBlCzNgHA2u3O8B8ZjDSFJTYu1EewOVXZasKJER0G/K7
 PF5POGmMbPZZnUdUfFNOM51GXjSwZTAqo/cs9oYHiMjMWzlzkdlxwWcRXr1oOtMlFaUS
 sDRBe4Y6aegdd91LanGj98HidhAVYj0nhGOysY+PhlkbiVZ2qAivVCurhIQuiMCaMOG/
 cmnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI2vVs0pOgNYSdOncS3AS9x6q7Mwq6vsZ00bmFuVgsk8YozR1LLI/EIEFdahAFzPwPDn4PunI6XZWmr606RJ0/NR18wGgy8Ythp7Anr2CJ
X-Gm-Message-State: AOJu0YzXBcmXnAM3ZEULuDmxhCOXrMIc4U6jK9PCM9qvKmJc9f6Y1lKS
 S2G7dmUA0fQ7B4A8EguJRBmh1JHBXL4gZe6C0sGRCMJlGXR5Q0Y2Mw2E6MgMJfGzyzU4/FMmJZF
 uTzRfnoH6qHumon2I8P/9qhbuZ0ps2rDmyevphg==
X-Google-Smtp-Source: AGHT+IFR/4amAskIyXfoOOnxMmVwcOKFGtK74rfwLLo9y/cbpl6P3c931cDDvgAF5bJ9jcaCB8jsp3EyL4MwMY0oL44=
X-Received: by 2002:a05:6a21:7881:b0:1a1:4fb8:e02c with SMTP id
 bf1-20020a056a21788100b001a14fb8e02cmr423060pzc.37.1709601817178; Mon, 04 Mar
 2024 17:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20240301061128.3145982-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=UP9NxfmT8rqLd-HUq8QwJXa5xO7UbrgYHLw4vOKZO7hA@mail.gmail.com>
In-Reply-To: <CAD=FV=UP9NxfmT8rqLd-HUq8QwJXa5xO7UbrgYHLw4vOKZO7hA@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Tue, 5 Mar 2024 09:23:25 +0800
Message-ID: <CAHwB_NJ0LdO0OK0uUTUP=OzkFN9Dfd_9EtAX1pGf_ygV__Y-UA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
 panel HFP and HBP
To: Doug Anderson <dianders@chromium.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@chromium.org, swboyd@chromium.org, airlied@gmail.com, 
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

On Tue, Mar 5, 2024 at 12:51=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Feb 29, 2024 at 10:11=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > The current measured frame rate is 59.95Hz, which does not meet the
> > requirements of touch-stylus and stylus cannot work normally. After
> > adjustment, the actual measurement is 60.001Hz. Now this panel looks
> > like it's only used by me on the MTK platform, so let's change this
> > set of parameters.
> >
> > Fixes: cea7008190ad ("drm/panel: Fine tune Himax83102-j02 panel HFP and=
 HBP")
>
> Your "Fixes:" tag is not quite right. It needs to have the _exact_
> subject of the old commit message, AKA:
>
> Fixes: cea7008190ad ("drm/panel: boe-tv101wum-nl6: Fine tune
> Himax83102-j02 panel HFP and HBP")

Ack! Thanks, I=E2=80=99ll fix it now.

>
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> A little odd that the patch you're fixing claimed that it caused the
> measured rate to be 60.01Hz and here you're saying that it ended up
> being 59.95Hz. I guess there was a measurement error when the previous
> patch was posted?

Yes, the previous  patch measurement was wrong.

>
> In any case, the argument still holds that this is a panel that still
> appears to be only used by your board, so small tweaks to the numbers
> here seem OK.
>
> Landed to "drm-misc-fixes" after:
> * Adding "(again)" to the end of the subject to make it distinct from
> the previous patch description
> * Fixing your Fixes tag
>
> 9dfc46c87cdc drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
> panel HFP and HBP (again)

Got it. Thanks.

>
>
> -Doug

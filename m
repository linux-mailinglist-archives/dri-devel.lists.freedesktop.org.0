Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491958A0B1E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 10:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530AD10EF6A;
	Thu, 11 Apr 2024 08:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DRobCzl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203C310EF6A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 08:25:42 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6154a1812ffso80907567b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 01:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712823942; x=1713428742; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=edjaUEw2uJ66Vq5BGBZMcM3KK3F8anEzW+NtxKo9Ndw=;
 b=DRobCzl+WLj7POTSWYq8LB0FNTZqfLnw4xao5UirxKEiFsfRmJVjhxCbjcNjJ9g5E6
 oISioP/ooWEeWdfexsPI3/CPnmrJYqMX7e+qOUMqRZ5PpZTn1C1hmh05Sua5QGYMWN+9
 mQJ1l4Vp9Ym2FSlEkySGTn2+9ilJOaKbptuw6/ovEdFd/KX5JxxWTmIxCXfrAv3vqgEj
 +wL4gxTC+oI6+2RFUe0+5PmL1wirygPWv0maoNzhQvViFg1hYUgOZNlYACKaLUaoDZGB
 IuSqx+1kRF29sko59ORBSQX1BH/vasTQvuN70Vw9GMsdJR4POkgL0N00WkCqbwbslpmx
 1t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712823942; x=1713428742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=edjaUEw2uJ66Vq5BGBZMcM3KK3F8anEzW+NtxKo9Ndw=;
 b=BchDUb6DjfAYNEfhuOnpWKkhePPSZEG2eV2wGT+CuhvJDZdn7WNVG0MJgjgJ888kxa
 g3Q0BJVaIZT7suunLAu54oIuk6jN4EHRYwA/NYgZDOpu3R4khOoGO8NXaME2YJ+ChpDI
 wkj8u08iSkE1Q9iPHLDLdQeugHgW/Io8Mmf6yj/VBPUfx+/c8zGmn1iZP9CAyCt3PwlW
 57WN+x9I3nQaUv6pR+Ep7fqZ2bmdRsv+CP5R3ek0Ip6b+Hs56wvvP+H6NRGdOxQtSQ9z
 80tTL/eqdgnurP1U455mm5QA5CivIA99/Agufp6ZxVM3053xrP2Oj61TrTn2MXMIpn7z
 gA5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcsMAuDPYcO6PHIxEcYjOqeMPDGsOaev8KAn/65wTZlmxJvtVukITBo3CP/y3230ko84/aWdk3eQfyuUXxZYUwD86rBB57gFP29kDOWloR
X-Gm-Message-State: AOJu0YyykZ1BnQMxzOIW8aVaDb7yjh1jv6hKI8DCVCrhPdpvBBxAK3mS
 W0JJwQ1EWMak8Xd3iGm1OdMcfD2o+/StlFi2Jc1qkdnkTrozB+kWliwP0bV8yoNQ2rGUahBZB26
 0JQ3M0OcYjMnOg0YLgL6zBK9IHEpSSHWnOS7so+Z4D9NUuZ+UQsw=
X-Google-Smtp-Source: AGHT+IF9pqUlpfdyG5m7u4jEcLSuGnBanWm4vx+2kVsHtqsz6JhvGVog6ml/rhuJaKKjQuzsTC3Fw+qiU/qGdpHU8rc=
X-Received: by 2002:a05:6902:2b0c:b0:dbf:23cd:c05c with SMTP id
 fi12-20020a0569022b0c00b00dbf23cdc05cmr7015891ybb.13.1712823941903; Thu, 11
 Apr 2024 01:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240410071439.2152588-1-yangcong5@huaqin.corp-partner.google.com>
 <20240410071439.2152588-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=V2J=Tth2zhpo-kPo4uvESt70mFneO2V6TV-haac0VZuQ@mail.gmail.com>
In-Reply-To: <CAD=FV=V2J=Tth2zhpo-kPo4uvESt70mFneO2V6TV-haac0VZuQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Apr 2024 10:25:30 +0200
Message-ID: <CACRpkdYtM=5jdQddCqRFgBRXvcJEjk1ULJNKKFz7jhhkGxV59Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] drm/panel: boe-tv101wum-nl6: Support for BOE
 nv110wum-l60 MIPI-DSI panel
To: Doug Anderson <dianders@chromium.org>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, sam@ravnborg.org, 
 neil.armstrong@linaro.org, daniel@ffwll.ch, airlied@gmail.com, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
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

On Thu, Apr 11, 2024 at 9:40=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
> On Wed, Apr 10, 2024 at 12:15=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel, which fits in nice=
ly
> > with the existing panel-boe-tv101wum-nl6 driver. Hence, we add a new
> > compatible with panel specific config.
>
> I guess we have the same question we've had with this driver in the
> past: do we add more tables here, or do we break this out into a
> separate driver like we ended up doing with "ili9882t". I guess the
> question is: what is the display controller used with this panel and
> is it the same (or nearly the same) display controller as other panels
> in this driver or is it a completely different display controller.
> Maybe you could provide this information in the commit message to help
> reviewers understand.

I think at a minimum we need to split out any identifiable display controll=
ers
to their own drivers.

Then what developers see is that the code sequence is very similar
between two completely different display controllers so they have this
urge to shoehorn several displays into the same driver for this
reason.

The latter is not good code reuse, what we need to do here is to split
out a sequencing library, like if we had
drivers/gpu/drm/panel/cmd-seqence-lib.c|.h with a bool Kconfig and
some helpful symbols to do the same seqences in different drivers,
so the same order can be obtained in different display controller
drivers that would be great.

I'm thinking something along the line of

panel_seq_exit_sleep_mode(unsigned int delay_after_exit_sleep,
    u8 *cmd_seq_after_exit_sleep,
    unsigned int delay_after_cmd_seq,
    unsigned int delay_after_set_display_on);

That will call mipi_dsi_dcs_exit_sleep_mode(), delay, send
command sequence, delay, call mipi_dsi_dcs_set_display_on()
and delay where any delay can be 0.

This achieves the same goal without messing up the whole place,
but requires some tinkering with how to pass a sequence the right
way etc.

Are Google & partners interested in the job? ;)

Yours,
Linus Walleij

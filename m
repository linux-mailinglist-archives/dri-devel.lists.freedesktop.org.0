Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F617D8531
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 16:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04AA10E809;
	Thu, 26 Oct 2023 14:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AA910E80E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 14:49:12 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6ba8eb7e581so219487b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698331751; x=1698936551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DemqMHTJ7GWFIe4JoXxR2a522aLtJ6TRXNToeBGIgFg=;
 b=CpBSSNiubCQcu73Bb+a5GV9MnyNVGLc6kSMHnRvs5WeR5aH4tXPphS0GzCkvU4xwBQ
 yA9pU93kqinKtczf1tJGlztN6HTWPUMMoDsy/Xj/eB0ox9rWxeDVsu0QnprkUUSVhdmP
 KR9MabywgMPwD/s5PqJafZWTVQhY+/+xjTS3HIZduDy+XUs/wyshE08KPGdyWyGgIwH1
 g+s4GkOIyhasYC5j08k/XeRWWFVZCVOArtZrKzFPGrSa6dDe6sXxDT5HOD2aR0Oo30X/
 KgDr8lJxqIm2HyeOApIGWaOJDEpZ+YDd7d30XtQVMdT3PjT3iMHqkkXpoxUgaywZKMxs
 D19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698331751; x=1698936551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DemqMHTJ7GWFIe4JoXxR2a522aLtJ6TRXNToeBGIgFg=;
 b=BGWO45b++weGQl+NnnMOSFuJ7/4kPCXasyaf2b+aYFRac8YXjlgZry7CTMPh+vV2WH
 kM1SMdnO5Cx+BMlDBRdeaRm9+ZAmdinBlGfCCbrBO9WJb+/mkej18/hwC7Uf0YGbgjf+
 ingngdKob94MoM0NaiuQ2eSI3pktUZ7s3XuZ8etQwg+PLLWMZcHQZkFgye2dORj/2WwA
 82HCzPiBPI1N6xLcC+SgY3voJdizowu0zsuKs7d+XNJ+04snMyet22bwbrgLnES+6o7X
 NCWmnEWCdQAl4kkRud58OXKz+iC7HxzgIC50XkzXjGhdcwejp883TbipDS4KmVPAIajK
 H84g==
X-Gm-Message-State: AOJu0YzP7RkHmRE6oF17tFxDVKSk1TZQm++qXKE/2gKgLCRb+uneZG/4
 FDfQiJ1Z89bSfVvx11XFswBgTJPUPnv4zqCwnbU=
X-Google-Smtp-Source: AGHT+IG1drwDgHeGi9GVCPQEgJ+tEMYjLrAFiSi1zEu/rEgQh3oKBzjMuE1SkDvJDnpZ1Jeg7uXZvYqOiXPsU15IHjA=
X-Received: by 2002:a05:6a00:981:b0:6b9:7d5c:bb58 with SMTP id
 u1-20020a056a00098100b006b97d5cbb58mr19911690pfg.0.1698331751612; Thu, 26 Oct
 2023 07:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231026113029.575846-1-emas@bang-olufsen.dk>
In-Reply-To: <20231026113029.575846-1-emas@bang-olufsen.dk>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Oct 2023 11:49:00 -0300
Message-ID: <CAOMZO5CqOvAd=U57=jrG0JqcoMJsKtZ-sAox_=8Wtn4a22R0Kg@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: adv7511: fix reading edid segments
To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil,

On Thu, Oct 26, 2023 at 11:47=E2=80=AFAM Emil Abildgaard Svendsen
<EMAS@bang-olufsen.dk> wrote:
>
> Currently reading EDID only works because usually only two EDID blocks
> of 128 bytes is used. Where an EDID segment holds 256 bytes or two EDID
> blocks. And the first EDID segment read works fine but E-EDID specifies
> up to 128 segments.
>
> The logic is broken so change EDID segment index to multiple of 256
> bytes and not 128 (block size).
>
> Also change check of DDC status. Instead of silently not reading EDID
> when in "IDLE" state [1]. Check if the DDC controller is in reset
> instead (no HPD).
>
> [1]
> ADV7511 Programming Guide: Table 11: DDCController Status:
>
>   0xC8 [3:0]  DDC Controller State
>
>   0000        In Reset (No Hot Plug Detected)
>   0001        Reading EDID
>   0010        IDLE (Waiting for HDCP Requested)
>   0011        Initializing HDCP
>   0100        HDCP Enabled
>   0101        Initializing HDCP Repeater
>
> Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>

What about passing a Fixes tag?

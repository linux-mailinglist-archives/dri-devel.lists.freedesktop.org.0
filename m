Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C042781ABF
	for <lists+dri-devel@lfdr.de>; Sat, 19 Aug 2023 20:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D068B10E085;
	Sat, 19 Aug 2023 18:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B4410E085
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 18:07:05 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d690c9fbda3so1967334276.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 11:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692468425; x=1693073225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Im9rn1XEuwbyffzZDItPeZZsQa5Vg8fNdLieMg4PvkE=;
 b=NqMsziR1/EDlqx71St7nvNdRyteFMBEqqaxhW89YDlLNFPiQgX5P3Vt0yz01wXnnK1
 XFYrZaEWsUW/Wg2gp1hJ8l5DWaLhfWAwcJfWThJdKjedv7MtlrvAT9yAzyJ99MXHqepn
 caqDAwRIYe5p5np/BAT5EGNkDF6n7ZCqnLaqZglDDh7IUuMDEbXWyJou4c4beI839p8h
 FtCgohkfYGVItgUrXzNwr28ZteciY4ynQ7kSRHZZya6TxpAx8Q57a+7UOytmeIu/7nnd
 UrOP/5tIS/VsSWq2DS88XAEo6hxE0JYpwyIv7DAAwrxU+XQQYQY+bwT9vJTu5Me6dJNg
 e4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692468425; x=1693073225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Im9rn1XEuwbyffzZDItPeZZsQa5Vg8fNdLieMg4PvkE=;
 b=AV4JzEyK6uUOy8YiOh6bC6Tvt/pz2mirGcl9gJYa8GacI9hEUCq/BfzlOIZhNZAvS/
 K+vV/sspzgFJ6z5RUWi688sU1rgR785o+K6i9liL9WPnD0ZhnFlR1U6cWJ1ZbPwJJYPq
 lVKIcmmJpKAropDgmkwLptVhZlDyHF9j7OooGED/VHN5kymXJ2ZGNu5qelOQif3s6UAy
 7uyVFauSeyTNsRoYYxkDZKPRnGZCC9sVe1zaPVT/tWP8gwb85BWIcbpfnty4EmDR377j
 VogWHF7aIBQro/dhTEC6/ijQZVmWX0nmg9oP2sG9NzusGWLwVG7iAyBpu3gyaqt9NY+z
 TlmQ==
X-Gm-Message-State: AOJu0YzbT0Qi8I7aVxZlNLBBnB0B4GsgLrmmSNM8C7ne2xClEWQtfuAR
 KTpr1mtSuaDG29URCmgQALvElrUZVsixNVbXdzJGIfM0Zsf3p5Ro
X-Google-Smtp-Source: AGHT+IF0LX11cfweHZRJ7yrA4EhpK+oGgZzcdgUhtRV7ilI3RMGxIIUstzyeikU5K4C9AUCsbgaSk6ebzRIVM/ddFBs=
X-Received: by 2002:a25:c505:0:b0:d46:a995:ea7 with SMTP id
 v5-20020a25c505000000b00d46a9950ea7mr2649730ybe.21.1692468424799; Sat, 19 Aug
 2023 11:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
 <20230807133307.27456-3-diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20230807133307.27456-3-diogo.ivo@tecnico.ulisboa.pt>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Aug 2023 20:06:53 +0200
Message-ID: <CACRpkdaCS6CNj6EdRWkf_27gHB43MN2ysTYAycXPixiKxjaLWQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] drm/panel: Add driver for JDI LPM102A188A
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
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
Cc: neil.armstrong@linaro.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 7, 2023 at 3:41=E2=80=AFPM Diogo Ivo <diogo.ivo@tecnico.ulisboa=
.pt> wrote:

> The JDI LPM102A188A is a 2560x1800 IPS panel found in the Google Pixel C.
> This driver is based on the downstream GPLv2 driver released by Google
> written by Sean Paul [1], which was then adapted to the newer kernel APIs=
.
>
> [1]: https://android.googlesource.com/kernel/tegra/+/refs/heads/android-t=
egra-dragon-3.18-oreo/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
>
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

That's a nice driver.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

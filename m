Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F3826954
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 09:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8333E10E1B5;
	Mon,  8 Jan 2024 08:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611C510E1B5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 08:20:34 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5f15a1052b3so10321877b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 00:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704702033; x=1705306833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HMbiqG8ChZxBryomK+7l9NLbRmnfN/R8I1A0uwEXdM=;
 b=TvMp1aGouDCG7a2+CBodDhJrv8QpcaQ34AFHzQ8jO+6AsMfFCeRyB1roQDLcfYo3Mi
 Igp5k5lNGNiD+j9xu63NCDf4oKu+Lr5zJbYBwvlK+gl4l4JovhAXyaUkeUXnlDOFoV+1
 y/A8SE4hXhaj5QFqk5+MnE083Bf9Qp+1Up9jb08po7lbq+akH4dRkCxbwZC7Ap8+tPyB
 zADgBtXk6AwNmLBBYUCw2ZjzaO0D+Ajl/WDPyNbY1zprevKbLxRed8SUdhXj2RcKj04u
 OFT8JlYxw9MF7UAU84LlIrvKs4xlIsKw11eHvNjf4lx6YPuHtmTrEIa6mWgqd4lcztw5
 9hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704702033; x=1705306833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3HMbiqG8ChZxBryomK+7l9NLbRmnfN/R8I1A0uwEXdM=;
 b=AfDB6Mck83Ce7JFY8HOQTwTJTPzxzHqdXUBD73NBQP77/Ah+WvAePtYk5pP98b+5f0
 BWeQJjfGHk8A1AhrY0uAq1Mr9EyOVYCoqk6uqtmkDOcqQ0sF/VgnLHk0lgHfHJl5lXuX
 sfX/L23qKOpLNiLdrjGHuKqghwzNUnkcZVX95v/oxYVuLIHocwR5cqtwjUdWmquWLHrw
 5TeNMv362EuazOZ0FHPt67xsC5GRl13YHO3cf0VanoPj4nXrTIHVt/OObwQ3GBAVpGpg
 lgyBwxsSVGVnqtmhXvP400LtZ/ztoHbpNtIQNoMzhoQbIVy3Cr2M5ssP2VbrsF/srNvw
 7sgQ==
X-Gm-Message-State: AOJu0Yxi9yINmLzPEOtMohZbpQFXbm0YmElyPJoig/N/mTgk2KjVl4qI
 rJVwgioEixF0muh1fRvLNQe3aQjixegVGeEE9kO+HHGV5FpKHw==
X-Google-Smtp-Source: AGHT+IHMiO4upr0AvuxbnYzHHdp5azUyT28gcKKireut/Cz4/IMtjynVPM39+2xqwQ7S9lhur+XAQpuD6Oa5A17sB0Q=
X-Received: by 2002:a25:9391:0:b0:dbe:cf37:c838 with SMTP id
 a17-20020a259391000000b00dbecf37c838mr866827ybm.1.1704702033344; Mon, 08 Jan
 2024 00:20:33 -0800 (PST)
MIME-Version: 1.0
References: <20240103-si902x-fixes-v1-0-b9fd3e448411@ideasonboard.com>
In-Reply-To: <20240103-si902x-fixes-v1-0-b9fd3e448411@ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Jan 2024 09:20:21 +0100
Message-ID: <CACRpkdbcmh-YwKii=2sHfpZ97Z5mQcz_e0Fy=MqgXrL3qG9QjQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/bridge: sii902x: Crash fixes
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jyri Sarha <jsarha@ti.com>,
 Peter Rosin <peda@axentia.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 3, 2024 at 2:31=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> Two small fixes to sii902x for crashes.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

These look good to me!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

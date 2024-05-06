Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4009B8BC779
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 08:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573A2112F0C;
	Mon,  6 May 2024 06:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gR4b/r49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5775E112F0C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 06:21:53 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-61df903aa05so16719547b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 23:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714976512; x=1715581312; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5tenC0j8T9uI7/6pvgOmP23FOqeIIoMHzohX2q3IKgg=;
 b=gR4b/r491scsjkLsZvf64HyoUOQ+nde6ulOrvS67zJVQufyvV6VXU8ik+S/J0xHD+T
 2Gi3x4+4Ic9wiMhlrTSFM16KdB1A5n1VrEoGsAQEd0FZnGO/uh8n29y7lzOIhuqTsmMP
 bS0d3ne+WlvXR8eoa6VlRGL6xcrj7h+zoN6t9AHdaj/IE+2z40shBSFieB2Xhhy10CT+
 RF1B97whnbASd0bK77SRbeHC4n0aR84qxybp1qemnD3eknPUNzK6a4kAZNPIv9+csCoX
 crKC1w45p55i7Zt7F5q2V/0ezOMSZlCzqa/y8SDE+Z2XmTtj+wetj+kmosb9DJfK1+Xh
 rxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714976512; x=1715581312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5tenC0j8T9uI7/6pvgOmP23FOqeIIoMHzohX2q3IKgg=;
 b=v2q096x7LcadcN21oX4GdvN0s51b+PpTJSFiaW4ArZ3gBlTsUgMntID68Bf9xaHOcG
 afRr4T9+QtrIMiF7GOUdmmmRwZExj+J/q7gtNxceZFAFhpGrwPLFKZRGbj4m+TzMbqjI
 Z17P+PXyUFj6fw1zNZRJ908ghcH4mAGrh4OQiWdHlN7rOG5yfmSfXCarZyGqaicAp2lV
 rtW9bMeMhLOzkj392/CR422/Hv8NXaLy45+wnkEN5c4ue+mZ++lsCoVzEnvPTL3XOjre
 n5LKAzGjrwMwODHrmps8dj92kwsYCczUP3G9TGyYm2ZqkymxmR4XcYjpt7DXVLj38p/n
 /3Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMRPCBxgzP/HmZ+nWwWbrLwS7cUz0nB6dg7oVk0pbQ6t3Ia9NW/akiUc76Lz49IxHGr2bXBIIRe5Lb9CrJq6HCTnpRSxHP133xaOeE/o4a
X-Gm-Message-State: AOJu0YzFVN85oTHVBpYsSk5iLCerWFTgSB5E6E7lmI6jZA61jwZ7Eq/U
 44b4bWFdYd/78YEOlYVendCfPwYg0Kknn6S4D0oqJAaatR7wRlLN8Y1ssqYX+xKyj0nKXqif/r2
 H3Lzax/GsG6yd8Gn9ckPrNbW+27UKr6gO9WPZAQ==
X-Google-Smtp-Source: AGHT+IEZYgOJxpOS8RgvqSwa7T9Vce5FOiyRslGmfTswPvAflgTZwuTElXfafN0eRcsZ5PsUlWzd+xot5zeuqDcAm8Y=
X-Received: by 2002:a0d:f944:0:b0:61a:ca09:dae3 with SMTP id
 j65-20020a0df944000000b0061aca09dae3mr10983765ywf.26.1714976512254; Sun, 05
 May 2024 23:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240426235857.3870424-1-dianders@chromium.org>
 <20240426165839.v2.4.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
 <2af446d3-7834-4a6b-897b-b14c6bccff65@linaro.org>
 <CAD=FV=V=EvEGp4tGDd-UQ1R=XkAwDn04ftd8oWU=UE=3Gi7SLQ@mail.gmail.com>
In-Reply-To: <CAD=FV=V=EvEGp4tGDd-UQ1R=XkAwDn04ftd8oWU=UE=3Gi7SLQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:21:41 +0200
Message-ID: <CACRpkdYn+jpGWDcWDUL5yj-pG_oBMLpFO-QhX6Sa-XzJNmhZjQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] drm/mipi-dsi: Introduce
 mipi_dsi_*_write_seq_multi()
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, 
 lvzhaoxiong@huaqin.corp-partner.google.com, 
 Jani Nikula <jani.nikula@linux.intel.com>, Hsin-Yi Wang <hsinyi@google.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, Joel Selvaraj <jo@jsfamily.in>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
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

On Mon, Apr 29, 2024 at 4:26=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:

> So I guess I'd say that I ended up being pretty happy with the
> "context" even if it does feel a little over engineered and I'd argue
> to keep it that way. That being said, if you feel strongly about it
> then we can perhaps get others to chime in to see which style they
> prefer? Let me know what you think.

I'm in favor of this design.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

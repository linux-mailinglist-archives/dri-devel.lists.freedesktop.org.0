Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C917597987A
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 21:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A57210E301;
	Sun, 15 Sep 2024 19:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="jTJ3UW8t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DB010E301;
 Sun, 15 Sep 2024 19:35:50 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-205722ba00cso31354745ad.0; 
 Sun, 15 Sep 2024 12:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1726428950; x=1727033750;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=New3rH6yb16RO+F7ZmxoIv5gWT8XEiNExKpmL8xStLI=;
 b=jTJ3UW8tZInCpJXdXDp3nuoGHsn1d7qOZLBDdM0Qifmz9Mz03XTDUuj4ykgji1Mkd3
 M+eWuARLHY/4ESn7kMlJqsmBY3Jti0fUDMuu0mcRpJNByHhZKi2qjBQxiBmbfNhdDmyB
 OiFxaw2bzwD/mTvTyWixuPhKGSOkfGLG4Omio0rFmtOvDQGMWqQ7M71e6ArGjYQHhoim
 OoNRxhdoYrNy78qDhGBL5lZNmwQ926LEia2poFn8SKQPnxZQrrMBZPHdOccKn60mFJeR
 xRI3DOznmr9kl0EVnBd4Z3Y9IpoWP9CBPaGWTHQmi7W6Hs/BTx6iNwiBdG6Mqn/Mv0v/
 Jobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726428950; x=1727033750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=New3rH6yb16RO+F7ZmxoIv5gWT8XEiNExKpmL8xStLI=;
 b=pG+9BTv1KgMnTvaRb/Ag4+LCj6Xbjh57PKR0ehDsia7iOcbQ/ptDJYcCidi2gKHI6y
 mCgUSgUm+j7G1qp64IQlB8DvidrF/MKwNH5DMQAu22vhLKJHxkUI7cJ9Ge6QiYflgcu7
 ROAOpvYescX65vcPjY3DB48MYKO77FlZkSuMn+BbuEY/FygoGINAoQZVlmuCiU8aOZqL
 2Hi2nbENCr9AtXtQydsX1qtRP/I0WzfYODPu5mL5uVaQCRdaViUc+2c+gOn2QYH+4ZI+
 q7cMiEna74kneZVWmCbJQy9IjP+8eQxO8R5aZYEFJIVUaKOvQJjdnDe2W/Qnvkka91Fd
 Cgrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1d3RlWKPlTPJjncO/nt7twTKWr8MLcQNOyAmxaSRk3kOrbV1tpAnt41mzjKcs3AN4PEgFxadsK5A=@lists.freedesktop.org,
 AJvYcCVWoDDbjjxcdT3DRd6GKdaWlneZHjchheZE+Q2nPkQs7oZyDw/p2OVocV68Fg604flfrvR6zOLOhCo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywd2C+/LUpMDdtoDbrixooptR8C/haXGICfHF9m1JNOkjZIAE+Q
 Nd0SgjBshq/WKC3OgizhaFnZFunZAzRQz85mbiqSgIyK6wK+gW5OedcJidMXlgZ9orY3B8R7NYn
 FUD3S5MaviULVWQFd1/shYqGYpoU=
X-Google-Smtp-Source: AGHT+IEeEBWXAkvZAos6gb/1nBcqfIooFzWaDaf/vow493N7u4RygEa1Dt72D3/O8Hf0ci8+dAfBbMiVeaB8K6wpuVU=
X-Received: by 2002:a17:902:eb8a:b0:206:ca91:1dda with SMTP id
 d9443c01a7336-2076e39c56bmr163749985ad.17.1726428950005; Sun, 15 Sep 2024
 12:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725962479.git.jani.nikula@intel.com>
 <fdc82abdabed667fc85d278cfb03d19e5c472d7b.1725962479.git.jani.nikula@intel.com>
In-Reply-To: <fdc82abdabed667fc85d278cfb03d19e5c472d7b.1725962479.git.jani.nikula@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:35:39 +0200
Message-ID: <CAFBinCDQzHkvo1tQxa2pcgBHngtiXyCgdbnr=9nW7xDHy0RLdg@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/meson: dw-hdmi: annotate dw_hdmi_dwc_write_bits()
 with __maybe_unused
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-amlogic@lists.infradead.org
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

Hi Jani,

On Tue, Sep 10, 2024 at 12:08=E2=80=AFPM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> Building with clang and and W=3D1 leads to warning about unused
> dw_hdmi_dwc_write_bits(). Fix by annotating it with __maybe_unused.
>
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=3D1 build").
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
I prefer dropping this function for which there's a patch already: [0]


[0] https://lore.kernel.org/linux-amlogic/20240908-regmap-config-const-v1-1=
-28f349004811@linaro.org/

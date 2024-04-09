Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D589D2FB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 09:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66D4112B1F;
	Tue,  9 Apr 2024 07:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1AE112B1F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 07:26:24 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dcbf82cdf05so4675398276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 00:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712647583; x=1713252383;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2D2NxqoL1l9jyG6ojmX1gkq9KHg+FeoueDUkr0UItU=;
 b=Ccm27W62VsrhTXuD90FYpkplAenDUbs9r+4xdfTucwVqbKl7c148nrxxLBbpINeuxA
 VLHpWiQKLi5tcAwmAk15W+CM0o86BU2ND/adn5a03oe0MdVI4c1z8dQnenqGfFn71Aff
 lWMIvo7yYuoVKpV30XIuMvJIzLazcEWrTfyRytaFWTQtr7iw6IbaGUQE+QHvZWNENXE2
 /zGzoEWjPLcbMaETfVV1kct3CAjRHRj7x5NS2q2L+Sc7Wb87CZH/7aq1KVNTh09XjgsH
 +302VJzOkBgV4FaqzD3KSBkoeS6p9txenUGBJ4RnfMdcssEzFpx+TLQjQO/CfQ2r9ncI
 68/g==
X-Gm-Message-State: AOJu0Ywaj2Q5KZrdC3kyF3sI0Mp6E8g3N/1eOd+LHEX9ZGgtFSophIs+
 56EEgjAUVqPeisgFqUdVHXT17T5jkTSS3J2QYWRvr4Ceci7fKH/7lD0lyLVlCsU=
X-Google-Smtp-Source: AGHT+IEnOvlDAT/dvqUuiv24KIpN9gIYGCrLsvkvN9xgM/LYn1VbcjlEn7ceUNuVQ6aPYVq1yPhWoQ==
X-Received: by 2002:a05:6902:20c1:b0:dc6:7e7b:4797 with SMTP id
 dj1-20020a05690220c100b00dc67e7b4797mr10816669ybb.4.1712647583033; 
 Tue, 09 Apr 2024 00:26:23 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 s9-20020a25aa09000000b00dcdbe11c243sm1231771ybi.1.2024.04.09.00.26.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 00:26:22 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dcbf82cdf05so4675364276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 00:26:22 -0700 (PDT)
X-Received: by 2002:a5b:11:0:b0:dcd:1f17:aaea with SMTP id
 a17-20020a5b0011000000b00dcd1f17aaeamr9375656ybp.26.1712647581850; 
 Tue, 09 Apr 2024 00:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-21-ville.syrjala@linux.intel.com>
In-Reply-To: <20240408170426.9285-21-ville.syrjala@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Apr 2024 09:26:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGyeGnWOhxQsiPWp8XzAMOUuJGfndQ8c32qCwBe1zrLA@mail.gmail.com>
Message-ID: <CAMuHMdWGyeGnWOhxQsiPWp8XzAMOUuJGfndQ8c32qCwBe1zrLA@mail.gmail.com>
Subject: Re: [PATCH 20/21] drm/rcar-du: Allow build with COMPILE_TEST=y
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
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

On Mon, Apr 8, 2024 at 7:05=E2=80=AFPM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Allow rcar-du to be built with COMPILE_TEST=3Dy for greater
> coverage. Builds fine on x86/x86_64 at least.

Also on rv64 and m68k.

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

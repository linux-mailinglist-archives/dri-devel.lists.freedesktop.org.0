Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C82A32C4E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 17:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D645710E942;
	Wed, 12 Feb 2025 16:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VWBsakXL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE2910E93D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 16:48:46 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-308f71d5efcso28433481fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 08:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739378923; x=1739983723;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NyHRmSw+0ICK2sEynOaKxLDRuSl/oG4kVMvohYL0VYY=;
 b=VWBsakXLVPQHJ688DiHaO4xiiAfjQIvBk3R437c6M4LSacl+Vn5kGbTix7XUlhNyzm
 Q9E2eO4oSblm5EO5G+j9D1uJov3UfSvdwzeGBAUOxiBTg6ETDoz7J8MVEGZ8q09SJVRQ
 wxfWQCK/RupQuz6sA752RmU+fqjgqdgKsvbBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739378923; x=1739983723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NyHRmSw+0ICK2sEynOaKxLDRuSl/oG4kVMvohYL0VYY=;
 b=twJ+r8cgAcpHrmoXJuFUvpAkGTnThRb8jdN4BNkTx+AW7IhSLhAbJt0rWUXSWcvclM
 YpxmxFWkycb+BRUjfHTWkOsaRCSCh+y9FfBtkOcu1QwMyvfD/D/C61USsC+Zv/whmgGm
 eZD0DevnUb9ObzqJWkEcy0maNr6yfaKxcd15/4pae3VMgVtQ2Nd4QpNWHk9mK519sw1G
 +gkYErYbKLOrl1cwRR8AqKZV2HlLEWzJ40crIi8DQ1hMx7j9TYg5WJ6H0KzIuSwATWU+
 3B9A64Rwqgafj9WVWQAubwECk74io96AEe3JwGPS21+4GoIo+3jKZLmjlyf+fKm/jmdP
 ATVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV1hGHcLX7GqVa4beACYa2nQBrdI80JeQAsiiSqgY55OC9QSuf35AjuY/fyfwgYZUS0eF9yLCJeDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yztv7AwOk4cs4pTqPnBBBTj0Fo24pKMSkRp6++zw6n5eNlGqPgW
 2wl+DYQ/KT3MCpkqnmlcrbYSxWXjxyg6qJ3HY08x+nMY2AjKHl1RCL/B8tmJ1wZmeB7cSH+1VJc
 UvaUo
X-Gm-Gg: ASbGncta9v2t7dd42+y0qLTExpw9Ao5F5kQVJt85O7l+i7qhgNKbJ8S530pF0C9q3Ab
 +no5/jVMBdyuAIkLu/bEm2fBl9hKhPwy9Ij/hCw3EI5WE1633NTwVY5ZylP2Cr6pQp9CNhRWsmV
 TNJAL0vB1cXKtqrLkYz74QanZIutTwpKHHsz3B4VROduU24s5uA41LhwLC/rSzB90I+GsYDvFPZ
 UI46CFN0zpmna1pVBT/+YPkNdQLzV5Nmkzgrt62/WHj/N0yq1K0cvY4pFA/KDbnf0GYft83ApXL
 eDKrbAB/jR6LeASe3J7MTG0qcO4CmIAaLskR9f/O6e2Yc7LgYDkuW4M0xAw=
X-Google-Smtp-Source: AGHT+IFlFy6/dwrtCF1H4N4zpKrC4UHKaVDysTfwhjaAdWM5X1lIaSRN86rWj+aFCUBYlev6fsvTxw==
X-Received: by 2002:a2e:bea0:0:b0:308:e803:118e with SMTP id
 38308e7fff4ca-309036a5e2fmr15245921fa.0.1739378922049; 
 Wed, 12 Feb 2025 08:48:42 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308e2d8c400sm14245691fa.76.2025.02.12.08.48.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 08:48:40 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30613802a04so68371931fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 08:48:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUnQgmI6CiLs7hZJT6QxtUWxzOcGkFT0K3rgFIWP3NftrixcxaI29sswtOCGGOBG6aW25cLZmBnZgY=@lists.freedesktop.org
X-Received: by 2002:a2e:a805:0:b0:300:3a15:8f22 with SMTP id
 38308e7fff4ca-309037d6f62mr16328151fa.21.1739378920063; Wed, 12 Feb 2025
 08:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20250210092342.287324-1-tejasvipin76@gmail.com>
 <CAD=FV=WwbNAhiMWN_4PRODByWScdnqAKk7yvGP2KJSoEzvo=vg@mail.gmail.com>
In-Reply-To: <CAD=FV=WwbNAhiMWN_4PRODByWScdnqAKk7yvGP2KJSoEzvo=vg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Feb 2025 08:48:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VENY6b16hYP=E78KjAYPzvT+Bim40rcvYjhPdOAk24WA@mail.gmail.com>
X-Gm-Features: AWEUYZnATny9gDH5jd4FFZMoQQDTKHRshaBDolOTR4ufydHKrJxGl6YS56Vgw9o
Message-ID: <CAD=FV=VENY6b16hYP=E78KjAYPzvT+Bim40rcvYjhPdOAk24WA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: visionox-r66451: transition to mipi_dsi
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

On Mon, Feb 10, 2025 at 7:28=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Feb 10, 2025 at 1:24=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.c=
om> wrote:
> >
> > Change the visionox-r66451 panel to use multi style functions for
> > improved error handling. Additionally, always drop LPM flag after
> > sending init sequence.
> >
> > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > ---
> > Changes in v2:
> >     - Fixed visionox_r66451_enable to return dsi_ctx.accum_err
> >     - Mentioned changed handling of LPM flag in commit message
> >
> > Link to v1: https://lore.kernel.org/all/20250208051541.176667-1-tejasvi=
pin76@gmail.com/
> > ---
> >  drivers/gpu/drm/panel/panel-visionox-r66451.c | 181 ++++++++----------
> >  1 file changed, 77 insertions(+), 104 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel: visionox-r66451: transition to mipi_dsi wrapped functions
      commit: f4dd4cb79f9ec3294e5100223ed90d8ae371f168

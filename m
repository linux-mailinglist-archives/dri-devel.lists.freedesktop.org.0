Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EA688A2FB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7979110E8D8;
	Mon, 25 Mar 2024 13:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e3UdDcRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D35E10E137
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 13:50:13 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-609f1b77728so48101917b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711374612; x=1711979412; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xY4s7Y2TDs9zFkoIeirDMHTppdLgQXMLcHGPVUr4u2w=;
 b=e3UdDcRcEq10UQGnef0ZXCWCwNi1xRISFbKSBljsnelmF7kAXTppDVQtb/acLm8nbS
 50u8RbaHjlHRyQugxTQ0fyLIOrlnZuaBtIoRSAzHYplUk5omm4/7/70Jm8lOl98uP1I0
 877HxJi0wa5WCaRurPrhx/8PVXar/75O3TvyP8pUWuZHS9zKYaRkAAxY0Bx84m18P5jN
 e9KRCv5vFU9E8wUOzqIdV7R+BdUqxEliR4YmdTTnPgnj2iz0OCmLiNuQuXP8F8Tmcz3H
 BAyDw5XEz/1xxX8mWdQNiSEXGVzl6rL/VESWIebiAZUZuzk5XcubGa/2FBldPZPMnSGi
 GFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711374612; x=1711979412;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xY4s7Y2TDs9zFkoIeirDMHTppdLgQXMLcHGPVUr4u2w=;
 b=OfR+EvwplajbghkWAa09svE79mhfLNnaj9TcwpZeSS16k0i/nxro/cpGNz05w5Cqjf
 OsLVIESTC1efyf6nuZTgir/ZNYBV0gLPbk4hZJxhsITECRkR+EOnWFkbVQ7XvM/maV6X
 M2EkLv9IYZYBAzN/Muot4Cvx2A2vwXNyZe/kB6z5wlaP4HWVgMhR1BAvEpXNWRvoxFU4
 DXq0f0uV1LPYHtjuDR10Y5kdre2LPPI/PszRRqePpoTi0Jj6QEZEp8/XH5lmS+RLBU75
 5JEBtYVaUPgJxR9CNQVpJ0Udcp2q8fEakBBgFCwLJtVq5OGzTwo/gsn14Ro9HTP1cUar
 K48Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCbaxKna6q+wfCqui0AsBkDILfwMZLct5uVEFka8LV1VFK5raede47zLExkesZzckrodG1KQgvmGMQsdb2eYkVEtWIxQmc6eCRxXYzDA7o
X-Gm-Message-State: AOJu0YyuuYHwzkoGkHnkGPNbN4Yf0cImHT7eTmlRMRCbB72+D5dvMg0z
 1LH9PbDADJdlPizxvdppeMZtWnSbMekHoLBMV/ZHLohPV2VbUTGoECa51+baxguNfZS/gDgIhtt
 5poQPaaVjZezrdW7vX/q/vB/TVihTsm28y44AJQ==
X-Google-Smtp-Source: AGHT+IHYjl0eFIojoJcLVm6Q3FikVODclbSrKrXlRZtK626pzzHApRK7eCpxDKYvNTGQRZ5CWm9dXvBcGq57I2cLYIQ=
X-Received: by 2002:a5b:941:0:b0:dd0:76e:d630 with SMTP id
 x1-20020a5b0941000000b00dd0076ed630mr5054565ybq.53.1711374612032; 
 Mon, 25 Mar 2024 06:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org>
 <20240324102936.6eojmk3k2qabtasq@hu-akhilpo-hyd.qualcomm.com>
 <CAA8EJppO8zMq5R7hBPG04Zsr9c3-Z9mqpnJQ88Dbjv3uYDbrUQ@mail.gmail.com>
 <20240325133252.o6taik5ezrsqtl7g@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240325133252.o6taik5ezrsqtl7g@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 25 Mar 2024 15:50:00 +0200
Message-ID: <CAA8EJppK6o0gsashG8yCLrOLbSVFDbHYEgzqBgP5ts65uTWgfw@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 25 Mar 2024 at 15:33, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Sun, Mar 24, 2024 at 12:57:43PM +0200, Dmitry Baryshkov wrote:
> > On Sun, 24 Mar 2024 at 12:30, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > >
> > > On Sat, Mar 23, 2024 at 12:57:02AM +0200, Dmitry Baryshkov wrote:
> > > > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > > > need to push register changes to Mesa with the following manual
> > > > synchronization step. Existing headers will be removed in the following
> > > > commits (split away to ease reviews).
> > >
> > > Is this approach common in upstream kernel? Isn't it a bit awkward from
> > > legal perspective to rely on a source file outside of kernel during
> > > compilation?
> >
> > As long as the source file for that file is available. For examples of
> > non-trivial generated files see
> > arch/arm64/include/generated/sysreg-defs.h and
> > arch/arm64/include/generated/cpucap-defs.h
>
> I see that the xml files import a GPL compatible license, so I guess
> those are fine. The gen_header.py script doesn't include any license.
> Shouldn't it have one?

True. Rob, could you please add copyright / licence header to the gen_header.py?



-- 
With best wishes
Dmitry

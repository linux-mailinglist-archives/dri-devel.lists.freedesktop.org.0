Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582188C29AB
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 20:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5668C10E0A9;
	Fri, 10 May 2024 18:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZivbLkVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ED410E0A9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 18:02:08 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51f174e316eso2790817e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 11:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715364126; x=1715968926; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ElFboxhq5Mn4V6HoClPLbitGjO20T62uh+wRM77AIu8=;
 b=ZivbLkVzsaHHkvgzwHOa6iB+wD56bD+9m/l+8sl2VFU7okPbfTpLBBUi0y15NY+6d9
 n651U3u68LNhPRnCjFNd6gV2nt8s2t8+K3pKIaHlOLvnJrxtbs6jdSY+rdlvUCGUZskQ
 5M1PD36TalOFKheJvB2mmEhf8ki3pqkwLE3VlySibKxTVpvAE/XPPNfOh29vIjmk7yie
 IgFqfY9DqVCcB334RW2BLgi1gRlCpjvLGFvdL79p4/DN/6H1LgLxlCC1BNJWzY+wHgDy
 xaWzUJ9jwyNW/2oEpEbW1MLKrui2H3+yqoI/kZ8IJo/cHSSmclWOv/pGTDfcsjdlq0Hd
 llbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715364126; x=1715968926;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ElFboxhq5Mn4V6HoClPLbitGjO20T62uh+wRM77AIu8=;
 b=Nk/gZLv8eplIt7XNMTwkZrf2bNqvigKp+J53LRz+eW+6UEnPsCZLN5xG5Wuq0CA+B3
 4A3Kj1TWm9Ueb4+o1Rh9pUrc72vBGheafwRS5LpS0qbuXH3Ma+4wFiAn4Tet6UWDophp
 k04u/xfFl3N6wDuBRi4OGaMDXnXsZ3p2kYDMDnt/gbbv2pLYFvx9rsShqyXI3NDzc+W5
 n7Ls81gwc9AZMUrT7wUkD4kRUqwRhkXkjY5f3avWypXHrvVGQLQa9K0Dhv9ATvsbXNC5
 T/X2i03/0xjhMXIVi9Ce1+mQmDGUx3zfFffrfVcC1Gu/JDyVF2RIqQE3btTN8PNsag0h
 /hew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXAziTbewvnToKqnnGnp00NeeiDEHlTvmWiigk+WKAP4CWNx3/HE3SDIvefxKLWTZouMnnJbf+tnB7qzolKWjVdguT10ToSJk+aD6DsiLx
X-Gm-Message-State: AOJu0YzawIdxwPC7sgqK1+y+mswhQwpn5EEExsJc71H6koT0yfW+Dm4O
 UcVnB4GaifLE6+gK+JAV50WZ5v9blUjuWYUQw4O+zpAcJDyqV0dJ0mpG60PMufE=
X-Google-Smtp-Source: AGHT+IFusX5MOdbRcwF97iEcqtLVbvmUBFmNSuhXU+WbubEJNOeY/GCO+g7Qgmz8sIfmntnCjhbEnw==
X-Received: by 2002:a05:6512:2214:b0:519:33a5:973e with SMTP id
 2adb3069b0e04-5220fa71886mr3182690e87.6.1715364126158; 
 Fri, 10 May 2024 11:02:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d2c9asm761699e87.275.2024.05.10.11.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 11:02:05 -0700 (PDT)
Date: Fri, 10 May 2024 21:02:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: jdi-fhd-r63452: move DCS off commands to
 disable
Message-ID: <kjlcqkfipct4d54hrtmwdsrifxvuq3qocv5bcmwsufrbxtvvq2@52grw5ijqx4k>
References: <20240509-jdi-use-disable-v1-1-5c175b2ea1ee@gmail.com>
 <rpita5o6za64p7tamasssb2fja6h6ipr5cibh6gs7klkijyk6r@mausrcet2ycx>
 <CAGsSOWWAotJPz+o8HSYTrXtq6H7Vrw9KXZX1jDZLgqfudKsnyg@mail.gmail.com>
 <CAGsSOWX9YcuBpxQZ5kPm6zbMbM6iZqPK3bk=dgKyUZPjq++GXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsSOWX9YcuBpxQZ5kPm6zbMbM6iZqPK3bk=dgKyUZPjq++GXQ@mail.gmail.com>
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

On Fri, May 10, 2024 at 09:10:34AM +0200, Barnabás Czémán wrote:
> On Fri, May 10, 2024 at 8:46 AM Barnabás Czémán <trabarni@gmail.com> wrote:
> >
> > On Fri, May 10, 2024 at 2:56 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, May 09, 2024 at 08:14:07PM +0200, Barnabás Czémán wrote:
> > > > Move DCS off commands from .unprepare to .disable so that they
> > > > actually reach the DSI host.
> > > >
> > > > Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 12 ++++++++++--
> > > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >
> > > I don't think this is correct. If the driver sends enable commands in
> > > prepare, it should be able to send commands during unprepare too.
> > >
> > It cannot send commands in unprepare, there are multiple panel drivers
> > what do the same.
> > Every panel drivers which have DCS commands to be sent in unprepare
> > has similar error messages with mdp5/dpu.
> >
> > [   92.322564] panel-td4320-boeplus c994000.dsi.0: sending command
> > 0x28 failed: -22
> > [   92.322635] panel-td4320-boeplus c994000.dsi.0: Failed to
> > un-initialize panel: -22
> >
> >
> Here is the error messages, these are comes from unprepare by every panel off:
> [  121.295290] panel-jdi-fhd-r63452 994000.dsi.0: transmit data failed: -22
> [  121.295368] panel-jdi-fhd-r63452 994000.dsi.0: Failed to
> un-initialize panel: -22
> [  184.783019] panel-jdi-fhd-r63452 994000.dsi.0: transmit data failed: -22
> [  184.783066] panel-jdi-fhd-r63452 994000.dsi.0: Failed to
> un-initialize panel: -22
> with this patch these errors no more.
> .prepare works because of this flag ctx->panel.prepare_prev_first = true;

The flag should also invert the order of post_disable chain. It well
might be that the drm/msm/dsi driver shuts down the DSI link too soon.
Please consider fixing the MSM DSI driver instead.

-- 
With best wishes
Dmitry

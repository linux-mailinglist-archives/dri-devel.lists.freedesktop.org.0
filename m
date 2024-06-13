Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C9B9069EC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 12:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65E110EA06;
	Thu, 13 Jun 2024 10:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IYCn6llg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470A210EA08
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:26:32 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so1090603e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 03:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718274390; x=1718879190; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O8IPAtm7hl3+DMebd/JJeDAA0E3v2QqYpsHCeHSD4go=;
 b=IYCn6llg4NhPVk9a/ADUkTD0rcZ5OkHsYZsbTSluTwdfDdgPaAxU5QtI2SQh8f/7tX
 t8R/GdCl1ZQ2xyzLlIyExqUUyU6eugIj/DGsuCIo6WT6lmZNOPqAUEs2JupKG/pBy+9W
 N532SOBgTTxwRibXKZJGkTlNZzWhN8GlG4iyzvq1kSMiV7+KsiEAMDKk9Xe9HK6leLlo
 MNg9Rd5/mv9f3LuVtWg6BPjUADobxNmA1jRvax3xdG/LHLS6uJtuOLBDVIVmqjsVbtNj
 M7DpUWPPqwPSCCjPAwvZgdt/Qf7F2UN4wZ0fU4uB9TWmAXC/7OiRqHTjRgFbNH8uKqgc
 xF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718274390; x=1718879190;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O8IPAtm7hl3+DMebd/JJeDAA0E3v2QqYpsHCeHSD4go=;
 b=c+4XY4w+kqKlAc5okeYTClPOVYTgngr0nfyO23cUOgCnM5ut4Z4TP2Xyv67/n0zXes
 e31NuLZfF2xSC5w+3u6vaj45Rf4Mbr2hTKSfHcohvIqBQ7zx/BViarh9rNE/CqNUFL4v
 VxCNV1iu4XnzQ2zK/jxKOJOxzbxhAbsnbcS9kizVxIOmaocfS/ft+4hrrmVdblzMmZOF
 hqtkk9VwUZDaMYAE82yo3VzLYlqN8Fh+5BHO+XB/7h1+rU82DTVexinOruAK3+wiZHDz
 P29iyxFMKWvHyKCjpfz5sG4YcG5oLmrjklsjmI3sJW8W9F3xnUzvJj/he9AEAe+EMUEq
 UXiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcvdluKg4g7XVyV4wYGNr0dbblIFKlooc5ZFkAKx+X8gmDNzVUzNywG6qq9K8BjDMl0PYKVMRTprx/jNhmesc/Li+U7+amjjJAKJxp3dHH
X-Gm-Message-State: AOJu0YwpKROu4Ux6MfYvC5EK6T+NbKNolXtCVkXyH9IpkS9dNbU9Mp4D
 4+ATH97rJmTWv2UHsWvCmZeC37M8Bno1vU5oIucaN7a3mKzatFqlzZQ1E85MYCY=
X-Google-Smtp-Source: AGHT+IGt4VhwL+5yWSqyKfLczUeVBdxDF1mrYotvvGw068d7nYHxPZnASRkoINFHxJR3kvUUUlTy3A==
X-Received: by 2002:a19:5518:0:b0:52c:8591:1f7b with SMTP id
 2adb3069b0e04-52c9a3c7718mr2525584e87.24.1718274390316; 
 Thu, 13 Jun 2024 03:26:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282de0fsm156021e87.67.2024.06.13.03.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 03:26:29 -0700 (PDT)
Date: Thu, 13 Jun 2024 13:26:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, DRI <dri-devel@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH v2] drm/bridge: simple-bridge: Add support for TI TDP158
Message-ID: <rdptet6pxdr3cmulrux24tevnlejgblnl5byjb2ypo7fm6tjn3@e4l6qdbr74ss>
References: <b41f2f86-0d99-4199-92a9-42cbb9d6a6d5@freebox.fr>
 <ddd5joylbkovcdogfwhvzaepd3d6wxsnccgvpq2x3h6fmpo2hk@2sitzl6bjt7d>
 <57959aeb-20c2-4283-b316-c4ae5397177c@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57959aeb-20c2-4283-b316-c4ae5397177c@freebox.fr>
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

On Thu, Jun 13, 2024 at 04:12:22AM +0200, Marc Gonzalez wrote:
> On 28/05/2024 03:13, Dmitry Baryshkov wrote:
> 
> > Bindings please. Also, note that per the datasheet the bridge uses two
> > supplies, Vcc for 3.3V and Vdd for 1.1V, so it doesn't fully fit the
> > simple-bridge.c (which might need to be adjusted for the second supply).
> > Chapter 7.3.2 of the datasheet points out that Vcc should be brought up
> > before Vdd.
> 
> Is something simple like below acceptable?

Note, I'd really suggest extending simple-bridge.c instead to handle the
second regulator.

-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F9F93E03D
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 18:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C6F10E031;
	Sat, 27 Jul 2024 16:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nNkKksOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FF810E031
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 16:59:33 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0468so33393621fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722099572; x=1722704372; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6gk5GM3ctrLM0FMWDo1AQm58vDMFpTA2WEvE44P/cxM=;
 b=nNkKksORbP6ThfyOlKu0ohYCnNHSlZCFpqKDMUxR6+fVzv7C9HrOhebDE41o01UIQu
 o3eGqOtREotJqcC02z0VwmNzfcOOYdWMWAL/3aCDCP5B9/SA+PP8YAtPF7utxmjh6Ebx
 nHfs6sz8LFSCBQLNywM4aRcPNQeu1QPzRgpXFRewO5T4DmIq2SP7r8y4EVAnXgmAlsug
 PHYeq4lKZ3UwVvwKuJ7ajKbNm87YXh3zDIP5U9mn90ZABb7cOICJNmhRxxGyBGQl+Vn7
 7uZwEY07TaN2fG6664migwceTqFBHEAe6Bd5PCH03tmhmp2IPLtCvDOygRen+gsL/u3a
 W8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722099572; x=1722704372;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6gk5GM3ctrLM0FMWDo1AQm58vDMFpTA2WEvE44P/cxM=;
 b=JT4PyNpqks729lWlhy/f3TAx/a099yVc7L70MsAA4Pfced7+tga8ijzRz+dnNr/Ts+
 EUoFSKRzEQLVxtMq48etM0CGAIXw6gz62Tn1DdTNPGy7F+4/mUqnQLimiI1OR8Rw29Gh
 diJ4cyx62Ui6frXq1lB1Mf403DiPG6mr6okpLhQJGNBoC4KtyJLeSe6E8yZj8ijiXOjk
 EuznOkFxXdxOMJCHUHYP3nvFDEZ0Hq8LJcACjL/nIV31WbyImvgd/8W9zrb0wtt/MAyH
 I1y1tvuG57Wj4p1r18u3gYmSYyKjE8IpK2m4JHsgg8OKQxYJAmFB6k9TzyJRh+YXicVq
 +9iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB/F7UVSyQ/y5TjBKnks6qjTKyFSn4IeBrOhWqLpgd0QbNIX07FfDiVlSiuvbjb+Wtcwvnp0Yj08TjmGyzUOr10FKoLGQ8fwb+McFa2vAC
X-Gm-Message-State: AOJu0YwUjiGabK/gBVROKsbQe87njKkyBBCC9VCJYEHuT9BvmzIX7oCv
 MvuXtfh382Sx75mW2UGCiCWrErRyzMiTivlN8Di2QwCJ0pBgcBiBLutpPiJvVIXa2gc2nTPKazB
 k
X-Google-Smtp-Source: AGHT+IE3fVok8jVWIevkO7VjdQYKIoF1cWveKICmqrEYsXNGTEAHv63UrD9YRX8c3o9qZ0t5jmM1fQ==
X-Received: by 2002:a2e:9350:0:b0:2f0:2760:407c with SMTP id
 38308e7fff4ca-2f12ee42005mr18468581fa.30.1722099571545; 
 Sat, 27 Jul 2024 09:59:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03cf0df8csm7343871fa.15.2024.07.27.09.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 09:59:31 -0700 (PDT)
Date: Sat, 27 Jul 2024 19:59:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, 
 hsinyi@google.com, airlied@gmail.com, daniel@ffwll.ch, jagan@edgeble.ai, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] drm/panel: jd9365da: Move the sending location of
 the 11/29 command
Message-ID: <gq5fcttutomphgfrwrtloqzczia3uc5qpont3lrowocan2xjc5@ubfabhsh3mfl>
References: <20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240725083245.12253-2-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725083245.12253-2-lvzhaoxiong@huaqin.corp-partner.google.com>
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

On Thu, Jul 25, 2024 at 04:32:44PM GMT, Zhaoxiong Lv wrote:
> Move the 11/29 command from enable() to init() function
> 
> As mentioned in the patch:
> https://lore.kernel.org/all/20240624141926.5250-2-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> Our DSI host has different modes in prepare() and enable()
> functions. prepare() is in LP mode and enable() is in HS mode.
> Since the 11/29 command must also be sent in LP mode,
> so we also move 11/29 command to the init() function.
> 
> After moving the 11/29 command to the init() function,
> we no longer need additional delay judgment, so we delete
> variables "exit_sleep_to_display_on_delay_ms" and
> "display_on_delay_ms".

Won't this result in a garbage being displayed on the panel during
startup?

> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 59 ++++++++++---------
>  1 file changed, 32 insertions(+), 27 deletions(-)


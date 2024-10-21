Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5819A7238
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 20:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ADA10E576;
	Mon, 21 Oct 2024 18:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="exUxLa9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7BC10E57A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 18:22:39 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e28fd83b5bbso4664216276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729534959; x=1730139759; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7k7BD7pY8wACVBPmoOy5iE04EKB02xBbu0iFx0TdQp4=;
 b=exUxLa9QnUtC69O9OXahscrKW84ScsC4BG76Z+Bg1eMpH3qLTW+70CnuS+7nvLfTFK
 VEpfewJrL8qROjHU8tBFNSSOYQoA9LPDxiusysvi3+PU87392Wgx0Vg2bA6p8px5MZp3
 R/6QdXiYtJyXsbo/1ZHg9ICswuIw1pUJvXnVCKX07qHNK38zfvvV043Os1QM2+akbPu9
 GGtL408ChnZGuAiFcgTASCxuALmgDiQbo19rW2rGfML0pGAAZlUYxxCsALVw6RzK++06
 lnN8XbWpvJSlSFzL0JLagNeEqxZ1lBrTqBskVsQi9ZZ7weRsWXI77Ui+U/K3NSe8t7oY
 /SCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729534959; x=1730139759;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7k7BD7pY8wACVBPmoOy5iE04EKB02xBbu0iFx0TdQp4=;
 b=swLeJg10lQzKkUqPIce/7GcCcd1Wy+yGN+nRXt+Aov/eW7pgA+qkXnA0MVoVFjvRZZ
 nUEgDt8b5hjXIQCcTIZ8znQpwrhI53UNkiE6/zXRLWoZHJpfb2CNVX8J1h8KrmGulBN6
 5KWZZ+bbQPBXDLa5ItucbBArZVY1262P86l7UjqLAVzcRwhYqaCdrEDbo2Fbo7ZS+AIE
 lpfgxrK6IE3RhW1PlmM0sYBe1u4OocV63iLLZnLsDFbaAai1NizNrk/iGhY9dYx13udo
 2vn90FXLbjt7Jj79JrP39X7wFBXqwyinKWmi1r9y7WExLIotqoOax0osG752Zi24I1+w
 s6PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYLbNFgeAWm00uJ1cxVbSeouwGfMN7MX5hGQgCtS0phnRa8BUSvw7jh6bXcKmvvDZNlXZfwFqZi/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1rBEDBgqLfmVYJcjrvaWXH3iBpb0tZViIQljWDk22/jbQMEv4
 58vZaJBoZq4nyUDRNrUyzPSDQxGo4FbANQQ7kFffbhA3bFk6rLk/OY0L7+6A17LBzI54kAWCMq1
 30t3uLlaBBbTkpInTKxrzaUfg0GK238ZXsE57QQ==
X-Google-Smtp-Source: AGHT+IGIMQHSXKfZS5IiFigUoVnDbS0TTJP2IKElXl4CLNq16EHDVx2/Vt4LNIpric/HMhxMB7f3RTFLhbckcNrQFR4=
X-Received: by 2002:a05:690c:2b0f:b0:6e3:39b6:5370 with SMTP id
 00721157ae682-6e5bfa05685mr86769367b3.24.1729534958749; Mon, 21 Oct 2024
 11:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <a2d20619-0724-4b16-a9a5-4a3680f21c99@linaro.org>
In-Reply-To: <a2d20619-0724-4b16-a9a5-4a3680f21c99@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 21:22:28 +0300
Message-ID: <CAA8EJpoy=nYMix3m2n7KkwemCNoh_qg8FH0ENaa8VNcLtqZuww@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/bridge: add ycbcr_420_allowed support
To: neil.armstrong@linaro.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
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

On Mon, 21 Oct 2024 at 15:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> > One of the features that drm_bridge_connector can't handle currently is
> > setting of the ycbcr_420_allowed flag on the connector. Add the flag to
> > the drm_bridge struct and propagate it to the drm_connector as AND of
> > all flags in the bridge chain.
> >
> > As an example of the conversion, enable the flag on the DW HDMI bridge,
> > MSM DP bridge, display connector drivers (for DisplayPort and HDMI
> > outputs) and AUX bridges.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (6):
> >        drm/display: bridge_connector: handle ycbcr_420_allowed
> >        drm/atomic: add interlaced and ycbcr_420 flags to connector's state dump
> >        drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
> >        drm/bridge: aux: allow interlaced and YCbCr 420 output
> >        drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge
>
> How do you plan to merge this serie ?

Once Abhinav ack's the msm/dp change, I'd like to land it through
drm-misc. I think it's the most logical way to go.


-- 
With best wishes
Dmitry

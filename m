Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B6861530
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 16:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A0310EC3E;
	Fri, 23 Feb 2024 15:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QGcs0jWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE1410EC32
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 15:07:27 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dc742543119so956156276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 07:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708700846; x=1709305646; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A7N/x1XZZ13w/J9RvBvRRguBA+rtWAzOoF+dbMHjtzE=;
 b=QGcs0jWw5o5rLiMEVX1St5w2hMb8nfJiylgwSVALkkbsmVYIPfGImmvhvZ6U5fSCkm
 BcbCVhzQ5YkNB14hAAwTLj/W0pCSuV394hdocimpHEwB6XJlGKPwBjg50IVrNTn8uukC
 FsEh1WkDUy9qBHSy+JFw2yf3JU139ebIFxEfRffy1imWnXZaMkNCfjDZ2SkoF06uyl7U
 8ByvxtfkXLXGmoUsk7vksitZouT09hvErE+3Bre+yclFLL8o1wSbgT656dYFUTSikXeF
 pmxUvLAmNU7LOMEERm4ULhbIOAQ0urM9OS/uuADm799zRqVzRbD7ypylLW1O1EJYztcj
 nMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708700846; x=1709305646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A7N/x1XZZ13w/J9RvBvRRguBA+rtWAzOoF+dbMHjtzE=;
 b=DM0Rz4GVmGfhpgnhtDo1zBhFNth9b276aeMQq1CefLmBUNC8XCbgeimQVdddGFYAwo
 uj3juBToud+RICJJykz8CZ/6+P0ptEOOSPBNiQ0Y3acAAvHqlolmWqV8sqJIvsTIUikB
 bUIo6Bzy0eK2HqGY1RQoASl1js3j5C2Jn/PecJDp3OGBnnOCFLrVdy3vxkxVMz0EIOQi
 QEeN67nxiixBUJnH62hl1DqT4vjbKTiBYlTSvRn/lp5SMT2Od3UnnAESCL3+U2bf2jNG
 Vgxj/+CxEt1BnoxFQAF9JYviJs3tutpQs8vKtniBHIjpWK2Yx+RaIJVTsIo9Pdrz0fb/
 EhkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtqqLeXfXmWeqQdfYAvXW1T/PYrMMylebalpBh7U355X2qOU1W5tB0KX7WiN35nRtSOiZ8HNR/1NPkuFJIZ0uyu7fZxA8ZTNoEJJ4TdV67
X-Gm-Message-State: AOJu0Yzh3/mXnvTlJUymlLCyCPxdwAg9ZfEdh6HsikAjtmtiVeEEiuz/
 BYCs7G58UXTMi134KWCaZU2y8axByZ7HdxOljXxvUoSqUD2Li+AI0omVrIlWqfgzqrJlTEAmJb+
 0VbpO+LmGpajfV+GmV8/DO9PyN0/Un5l80WaeBQ==
X-Google-Smtp-Source: AGHT+IHVp3IoavGMPyTgcYZAB/4X0W31P+xAKxbr9Gb+QsxAn1gv0v6QzKKvAYqZ5A5+yYWrSQ0bJyPW0Vw0YbTeOKw=
X-Received: by 2002:a25:86d1:0:b0:dc6:e75d:d828 with SMTP id
 y17-20020a2586d1000000b00dc6e75dd828mr84838ybm.18.1708700846276; Fri, 23 Feb
 2024 07:07:26 -0800 (PST)
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <170868613914.4029284.5549880672870201262.b4-ty@linaro.org>
 <3c4246b6-431a-442e-8ace-3b0d0e67743f@linaro.org>
 <ZdiU2z8rzo542_Ih@hovoldconsulting.com>
 <d4049823-ad24-4426-887b-9c66cdd96318@linaro.org>
 <ZdiqAPPTn9SvsjL8@hovoldconsulting.com>
 <77715ecd-ddb9-450c-98bf-4fcade0e81c0@linaro.org>
 <ZdixFo2EjUQDgeFh@hovoldconsulting.com>
 <b5401b19-09d9-4907-86d6-9aab9dc2970e@linaro.org>
In-Reply-To: <b5401b19-09d9-4907-86d6-9aab9dc2970e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 17:07:14 +0200
Message-ID: <CAA8EJppJL7ha8AQ7g+_b=0omcWRnTpjRc655V58FKoowUDRPeA@mail.gmail.com>
Subject: Re: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
To: neil.armstrong@linaro.org
Cc: Johan Hovold <johan@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org
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

On Fri, 23 Feb 2024 at 16:55, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 23/02/2024 15:52, Johan Hovold wrote:
> > On Fri, Feb 23, 2024 at 03:38:13PM +0100, Neil Armstrong wrote:
> >> On 23/02/2024 15:21, Johan Hovold wrote:
> >
> >>> But it is *not* standalone as I tried to explain above.
> >>>
> >>> So you have to drop it again as the later patches depend on it and
> >>> cannot be merged (through a different tree) without it.
> >>
> >> drm-misc branches cannot be rebased, it must be reverted, but it can still be applied
> >> on drm-misc-next and I'll send a revert patch for drm-misc-fixes if needed, not a big deal.
> >>
> >>> I thought you had all the acks you needed to take this through drm-misc,
> >>> but we can wait a bit more if necessary (and there's no rush to get the
> >>> first one in).
> >>
> >> If you want it to be in v6.9, it's too late since the last drm-misc-next PR has been sent
> >> yesterday (https://cgit.freedesktop.org/drm/drm-misc/tag/?h=drm-misc-next-2024-02-22)
> >>
> >> Please ping Thomas or Maxime, perhaps it's not too late since the drm-misc-next tree
> >> really closes on sunday.
> >
> > I don't want this in 6.9, this is needed for *6.8* as this fixes a DRM
> > regression in 6.8-rc1 that breaks the display on machines like the X13s.
> >
> > If you guys can't sort this out in time, then perhaps Bjorn can take
> > this through the Qualcomm tree instead (with DRM acks).
> >
> > But again, this is fixing a severe *regression* in 6.8-rc1. It can not
> > wait for 6.9.
>
> Right, I can't apply them right now, I send a patchset ack so it can be applied ASAP,

Applied and pushed patches 2-4. Patches 5 and 6 can go through the
phy/fixes. There is no need for them to go through drm-misc tree.

-- 
With best wishes
Dmitry

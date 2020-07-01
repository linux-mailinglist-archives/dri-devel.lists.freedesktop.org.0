Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E77D92111AF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 19:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770C16E988;
	Wed,  1 Jul 2020 17:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805F06E988
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 17:12:30 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id x11so10152652plo.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 10:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PIlFXACKoqWB73ZXLVGFX7w5yXzBN1zvDpdle+NdF80=;
 b=DOAOc949O9CUTB+Gk2mL29U2MdsMP2mbZoYw5KIirj1hGMX9xijMLGqUblzFwv/G/x
 zJLDTmWDlimFSXz69VV7pahROybrgOB8GTQiPcbvVRSnL2MgK3/feKTv1rmquCDZuzZm
 WYqptjyZpI0e2YgEWodOUQ/yOC56fvUSP9Ge8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PIlFXACKoqWB73ZXLVGFX7w5yXzBN1zvDpdle+NdF80=;
 b=tv/McXo7WfoWfMDclqBNdb4uTUq6/fVHZws/OYGFVeBGBS7B8utGYr1S1+aZ0qlY+8
 E6B8/40QZv665SVNVjFtmRoZ75EIpLqX5CIxYIuqbXTo2zoxF7eK8VrP13cG94vUoCsL
 Kadn3q4/m2FrXpRAh2JLQmU82mcIcGqMO8g2+QF6QVX23RCuVzGHEEsco7GyecY7Lw+4
 +CwF6+mus8wwtwBotH2ZDno7K1abjukO0Q6bbCvuKnpjRHfuM9hrPLVDFhwV9xJiD2fh
 NQzD7G3XQxYL2WrW2VqN+ZgPj4ahttzW8IFFRJ/mBZLkTZDI/BnvXaLIiGx7r9fnvtr9
 QJ4Q==
X-Gm-Message-State: AOAM5321qJq7Wv4y0dzM0iDBASFn7cmUq1LPg+LgoeW/pTUXGXlNtZui
 Av5tXwKXCM+I/WZRFr+y++qb7A==
X-Google-Smtp-Source: ABdhPJwFtwJvcus7uKKghQac5nLaOjUhOE2/wVY2iBvspvnGYTdn39aGqR8AXvaIifgh9x8exKT2bQ==
X-Received: by 2002:a17:90b:4d06:: with SMTP id
 mw6mr30824966pjb.190.1593623550056; 
 Wed, 01 Jul 2020 10:12:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id a9sm6736188pfr.103.2020.07.01.10.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 10:12:29 -0700 (PDT)
Date: Wed, 1 Jul 2020 10:12:28 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH] drm/msm: handle for EPROBE_DEFER for of_icc_get
Message-ID: <20200701171228.GC3191083@google.com>
References: <20200701030842.24395-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701030842.24395-1-jonathan@marek.ca>
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

On Tue, Jun 30, 2020 at 11:08:41PM -0400, Jonathan Marek wrote:
> Check for EPROBE_DEFER instead of silently not using icc if the msm driver
> probes before the interconnect driver.

Agreed with supporting deferred ICC probing.

> Only check for EPROBE_DEFER because of_icc_get can return other errors that
> we want to ignore (ENODATA).

What would be the -ENODATA case?

If the 'interconnects' property is not specified of_icc_get() returns NULL,
shouldn't all (or most) errors be propagated rather than staying silent?

Thanks

Matthias
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

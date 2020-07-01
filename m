Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412352111F8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 19:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E34A6E98B;
	Wed,  1 Jul 2020 17:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D416E096
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 17:31:39 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id d4so12048684pgk.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4fNzrypwA+h6/cDmXnWYSRWs2TnExn3KjSMmEODDS5k=;
 b=eij/r8Vh/rQed6wZTqGpOc18VEuPZcxNJDWCztfwt/yJl5o9O50Y0Kioeg4lEoOUYf
 b5COS9gDdoCUd6jRHA4b8V3qeWtiUT35a4EVNWIv1kVBLT60wpQew/R3aqshKT3jEnh2
 6uh9PjDzwpNLFb86pW5QGPdxBz12d7V2eGx48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4fNzrypwA+h6/cDmXnWYSRWs2TnExn3KjSMmEODDS5k=;
 b=uk1ldPCuZoG0XKx/JGdBsmNTWAI2bPyZBhmAwObdqvQRtxrihoTbjORpNLdV+WaOi+
 h6d0X+b3qOn7w3RKkAZPOkZbLj8uiCHZaWjwBNkYmdw0TRe4LXA0WwmMeozw7lENf/bz
 kLErC8GphA+HQhZCRpej1sdfrg0tlluXHqklAeIXJ+lXxAX1JatMom3OmqaJxfzYAxs8
 u/Uu1y0OyMPtW3MsoMfWlrtYAUWmURCKWO9eWRqBbac+TzsvWZ5rcljgF6k0pmEsx0F7
 fSVU+7zy577thwTKHW4WhjxhLuXhi+CuELmnSuRtWlA/rmGjAIdOp00JQvfEXddeKrVv
 pAFA==
X-Gm-Message-State: AOAM530WhDrXxu9cP1qVx7W8IkEqhRO7XDCH8fBt11dZEQf9HWD1BTSZ
 UkGS/+2tudi5t20dSlDUiFf2EQ==
X-Google-Smtp-Source: ABdhPJxDxBe8JvlXms+W1hWSshtDpF7DzlWzhcD8TjKp0cMR4Tp3lor5DHtOOMRLn11J3GiOW8kXnQ==
X-Received: by 2002:a63:fc43:: with SMTP id r3mr20981507pgk.423.1593624699558; 
 Wed, 01 Jul 2020 10:31:39 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id 21sm6435524pfu.124.2020.07.01.10.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 10:31:38 -0700 (PDT)
Date: Wed, 1 Jul 2020 10:31:37 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH] drm/msm: handle for EPROBE_DEFER for of_icc_get
Message-ID: <20200701173137.GD3191083@google.com>
References: <20200701030842.24395-1-jonathan@marek.ca>
 <20200701171228.GC3191083@google.com>
 <49af8f44-51d4-aded-a34e-55c7c5780008@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49af8f44-51d4-aded-a34e-55c7c5780008@marek.ca>
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

On Wed, Jul 01, 2020 at 01:13:34PM -0400, Jonathan Marek wrote:
> On 7/1/20 1:12 PM, Matthias Kaehlcke wrote:
> > Hi Jonathan,
> > 
> > On Tue, Jun 30, 2020 at 11:08:41PM -0400, Jonathan Marek wrote:
> > > Check for EPROBE_DEFER instead of silently not using icc if the msm driver
> > > probes before the interconnect driver.
> > 
> > Agreed with supporting deferred ICC probing.
> > 
> > > Only check for EPROBE_DEFER because of_icc_get can return other errors that
> > > we want to ignore (ENODATA).
> > 
> > What would be the -ENODATA case?
> > 
> 
> The of_icc_get for the ocmem_icc_path can return -ENODATA when the ocmem
> path is not specified (it is optional and only relevant for a3xx/a4xx).

Thanks for the clarification!

In this case it seems reasonable to me to return any error for the
'gfx-mem' path and all errors except -ENODATA for 'ocmem'.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8696E0956
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C61610EA81;
	Thu, 13 Apr 2023 08:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEE810EA81
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 08:52:31 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-94a34c299d8so63777466b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681375950; x=1683967950;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sMMjHV++lPnl4wWzVLV07WrqF25wdRQCEiHAGrnakwo=;
 b=INrZj4xUMYQleS3Tx0LtKxYjZNVyRan13czZwek2zaZq+oy39DSKAYUFN9zXZsSGPZ
 IXQZK/sDw+V0IgvjzKewBgW6py3GA2DRPcWTwNYJ05NvKTvZn7J2kI4A5nD8sI9CbXlD
 RyrJ2xSNhywHxQ3U06eSns8zC8LvAXHccrXpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681375950; x=1683967950;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sMMjHV++lPnl4wWzVLV07WrqF25wdRQCEiHAGrnakwo=;
 b=fAY9I2y7znqCo/Fejne9CzeYXVoiB/Mh0siz/WdHJ+QRMo3x4W3iFxMb5CNNPIeWq9
 1L+syaPlA2/aPKZiMWUGpEpEr+FMLCFVmxZpLorHuUKdVzDgNQ8T+yDqEP6r1x6zENuo
 QOWgi/GEp0ZX0Mjhgm0sJJuwJFoz7tGW9Nou0L6Ezj8Bmw+2gWcWTGHj2hiAW1ESMdW0
 AM/gC2fC36x+5/rslgzEN10Uu8u5I2Nwu8wv1KhXRCF85dHlLSlirWCS+mVB518gflTW
 QpNzEFZItKUDJyZN/hMo/dXiK7ngrU+I6oOnKbz/ESFf6sjsi+xwPc6IZ0keDhyYtXGB
 RbWw==
X-Gm-Message-State: AAQBX9d8Nk7PrZniYRItOLfep94bBSddsJqNWpm+o1CPmcLPoNYxhFpr
 kvbdorV1t/wGA2WFCwaIUJLg0g==
X-Google-Smtp-Source: AKy350a1UdfdCDMoh8AkhQ+QpH0nAND8dfeQm38GUk7NQxrjob5RulYvkLQeppGy8jxDZbBiENNV6g==
X-Received: by 2002:a05:6402:34d0:b0:506:6c2a:528f with SMTP id
 w16-20020a05640234d000b005066c2a528fmr2140795edc.4.1681375950078; 
 Thu, 13 Apr 2023 01:52:30 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 s4-20020aa7c544000000b004fc649481basm535310edr.58.2023.04.13.01.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 01:52:29 -0700 (PDT)
Date: Thu, 13 Apr 2023 10:52:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Revert "accel/qaic: Add mhi_qaic_cntl"
Message-ID: <ZDfCyyljbvTrNpeg@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, sfr@canb.auug.org.au,
 ogabbay@kernel.org, jacek.lawrynowicz@linux.intel.com,
 quic_pkanojiy@quicinc.com, mani@kernel.org, airlied@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org
References: <1681307864-3782-1-git-send-email-quic_jhugo@quicinc.com>
 <2023041201-underwear-consumer-1eb8@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023041201-underwear-consumer-1eb8@gregkh>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: sfr@canb.auug.org.au, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 mani@kernel.org, ogabbay@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com,
 linux-next@vger.kernel.org, jacek.lawrynowicz@linux.intel.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 07:15:43PM +0200, Greg KH wrote:
> On Wed, Apr 12, 2023 at 07:57:44AM -0600, Jeffrey Hugo wrote:
> > This reverts commit 566fc96198b4bb07ca6806386956669881225271.
> > 
> > This exposes a userspace API that is still under debate.  Revert the
> > change before the uAPI gets exposed to avoid making a mistake.  QAIC is
> > otherwise still functional.
> > 
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> And can you cc: me when you resubmit this?  It's not really correct in a
> number of places and can be made simpler if you really want to have your
> own class and device major.

+1 on this, in the other thread my take was that this should go through
driver model tree in the mhi bus, and I guess needs some review there
about safety and all that. We do a lot of funny uapi in drm/accel, but
full generic driver-in-userspace is really not our thing :-)

I guess there's also the question whether this should be debugfs (like the
usb stuff, or did that move by now) or real chardev. Might also make sense
to integrate with vfio/mdev/iommufd depending how the security model
works.

But really this is all stuff where I'm hightailing it asap :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

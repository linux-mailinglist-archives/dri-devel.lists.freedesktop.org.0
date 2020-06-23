Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D5E204D98
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 11:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFDF6E984;
	Tue, 23 Jun 2020 09:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FC96E984
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 09:12:10 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id d10so6965247pls.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 02:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Kz9xCuMfQVP8nB4fJb2cy6sQoAcFe32EC7VXfNzfbBo=;
 b=GmOJj0S22ctiemlOSVI1mu09vrvzTcMTOVbSfvHqpVUqYGi8Rl/n4+HYz4i0KsJ16K
 Gno6hAprmJPOqGa5FjXe5eY4lx53+o4j6nDnmoZs5PGfl3GaXNwANwmhHaIQwvFWoUxy
 Kbfs6w5fulPRHzgMoCMa3rpVRGyND9kUIz9+KwW2JmXS65PsJlOHfYCmO0e7KNAIA0ML
 5jF+BFZ+gyJIkHA1lQ389pf0MJ3EwbLsC6vzRvAcM+2i6RXF5EvBSmjNbCjKNfmPYqOv
 xsBBUub/H8YO790+32pIDtp6qCZ4yHGKRsv06XealLSKAnoYkAz+Nm8OgdurLgXDYe+/
 Cm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Kz9xCuMfQVP8nB4fJb2cy6sQoAcFe32EC7VXfNzfbBo=;
 b=QV5cIQAyETKFJ5ksy2Pj3uRcTSf98aKWJUsu0Gc9bwUCEqOXiBlZcLex9cf10T/i3x
 GqVmJoYQu+46Z+Db2qwTUl1CsIgn7tx6QIC8LB0PVMhUi2NKk1+LMfxUFY573gD5CnsO
 iW2h83jCD+YiSNETCPwDqUO6SHVdawZGWrWVJRRoAL17cuLocihXNkeJ9f/lNI0MqLpf
 zaMF17keTH8yvi7PKQChBekPgbS8TbSrRxJt/uAKJ3I3r2llmdKS+yQt9/FYrq4ZF/tU
 ChSrneY9G09MlZ84e7fUpjkmz50EWhWhwM795gu1lX4UwQxUZ5xIARUHgbHazcBvs8Vg
 NwbA==
X-Gm-Message-State: AOAM531d3EZaEeo9HEXaH5uiLMdhDwatBCZIkgFQJmepe0Ztdsz3TeTu
 L05nLyf3dkq+A8wrKQR6RuE=
X-Google-Smtp-Source: ABdhPJylBD/b7fqsA2zzHIbwr8UEOxTZkL37GEcCozzLqn0bt20VLNTUvoD3HAft0y+BZdcBzWjXLw==
X-Received: by 2002:a17:90a:ea05:: with SMTP id
 w5mr23374362pjy.37.1592903530289; 
 Tue, 23 Jun 2020 02:12:10 -0700 (PDT)
Received: from arch ([2601:600:9500:4390::aa23])
 by smtp.gmail.com with ESMTPSA id z9sm1811156pjr.39.2020.06.23.02.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 02:12:09 -0700 (PDT)
Message-ID: <2699290fb7ab566987da8f648a9234c6a4fbc24e.camel@gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Date: Tue, 23 Jun 2020 02:12:09 -0700
In-Reply-To: <ea38c268-01e6-e43e-343d-a413142d450f@suse.de>
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
 <20200622151913.GA655276@ravnborg.org>
 <ea38c268-01e6-e43e-343d-a413142d450f@suse.de>
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Jork Loeser <jloeser@microsoft.com>,
 Wei Hu <weh@microsoft.com>, K Y Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-06-23 at 09:59 +0200, Thomas Zimmermann wrote:
> Hi Deepak
> 
> I did not receive you pat series, so I can only comment on Sam's
> reply.
> See below for some points.

Hi Thomas, Thanks for the review. I wanted to add you in cc list but
messed it up with final git send-email. Sorry about that. I am not sure
why you didn't received it via dri-devel. The patch series do show up
in dri-devel archive. I wonder if other people also have similar
issues.


> > > 
> > > +	struct hv_device *hdev;
> > > +};
> > > +
> > > +#define to_hv(_dev) container_of(_dev, struct hyperv_device,
> > > dev)
> 
> Could this be a function?

Is there a reason to use a function here?

> 
> > > +
> > > +/* -----------------------------------------------------------
> > > ----------- */
> > > +/* Hyper-V Synthetic Video
> > > Protocol                                       */
> 
> The comments look awkward. Unless this style has been used within
> DRM,
> maybe just use
> 
>  /*
>   * ...
>   */
> 

This style is copy-paste from cirrus, and bochs also have same style.
Perhaps historical. Anyway I agree to I should get rid of this.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

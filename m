Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A615438D6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 18:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45411129E0;
	Wed,  8 Jun 2022 16:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E3E1129DE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 16:26:39 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 j5-20020a05600c1c0500b0039c5dbbfa48so2106072wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 09:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=PlENWwzlCM90o/vUAucZ/2PTf41RpbELMXSIvxOkRsg=;
 b=kUamzuMZKjBGedJ41D2CVba2W72DHDvLXgAu+IRALCFkrP3w078R1o53D+vRCSe01F
 rNkY2vVwnVV2VRLzYbzS3O+P9k5lDvVgJ5mKk0zXBbWb6hvTVl/V8nJzd0Lu6k2UhewB
 bsL613wbo/x5NaZd+K7hm5wT4WUp6zMhwLUQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=PlENWwzlCM90o/vUAucZ/2PTf41RpbELMXSIvxOkRsg=;
 b=m8qat0ADRqH7n3xcuMh/+4L+lNEzazOoPpQEwzUx5+Oy2YXhtPbj6xNp7sYYoP9Y/U
 0ywzDGe1gzY3TAmk6gXnHx+QrCUM0m8fh+cff7aHw5ywOT+Xg+LYADc4xU8SEgiecc0f
 l5e55e0TFyVTuiuBOGcioyqUGU5X720I4ffQuNMjDjFmgnNxEAPx5aOwEMSxSWkGjQna
 gtCoWPynNiB3KDK7bfB184asALSHVo4arr6jSJJc4pBbjdPRA73120Fbej/SUjPWblI3
 NJYZGuN52/XO2blERieKOS0a18oc9LyOWWmSeoU7xTopsC+5zAJ+faHUpwpZJ/07rqSz
 4agw==
X-Gm-Message-State: AOAM531WozpBfFFM2sz4v5rWH8+lb5rj22/3y5GY+6DDycCye+ATgC0U
 o1lRdsw1uWBAUbWBZElidlg74Q==
X-Google-Smtp-Source: ABdhPJyf8Brmkv7/K+wwJLIHpp3flqMDoBonSFPbtVBOY+CiA4pt1qQf2htU+BvHHGfYnZWx/UoWTA==
X-Received: by 2002:a05:600c:a42:b0:393:d831:bf05 with SMTP id
 c2-20020a05600c0a4200b00393d831bf05mr33885940wmq.187.1654705597681; 
 Wed, 08 Jun 2022 09:26:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 e7-20020adff347000000b0020ff4b8efc6sm21701293wrp.80.2022.06.08.09.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:26:36 -0700 (PDT)
Date: Wed, 8 Jun 2022 18:26:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 0/2] video: fbdev: Convert from PCI to generic power
 management
Message-ID: <YqDNuhopLfpHkTS7@phenom.ffwll.local>
Mail-Followup-To: Bjorn Helgaas <helgaas@kernel.org>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20220607231112.354165-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607231112.354165-1-helgaas@kernel.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-fbdev@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 linux-pci@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 06:11:10PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> PCI-specific power management (pci_driver.suspend and pci_driver.resume) is
> deprecated.  If drivers implement power management, they should use the
> generic power management framework, not the PCI-specific hooks.
> 
> No fbdev drivers actually implement PCI power management, but there are a
> cirrusfb has some commented-out references to it and skeletonfb has
> examples of it.  Remove these.

Is this holding up some cleanup on your side and so would be easier to
merge these through the pci tree? If so

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

for merging through your tree. Otherwise I guess Helge will get around to
pile them up for 5.20 (or 6.0) eventually.

Cheers, Daniel
> 
> Bjorn Helgaas (2):
>   video: fbdev: cirrusfb: Remove useless reference to PCI power
>     management
>   video: fbdev: skeletonfb: Convert to generic power management
> 
>  drivers/video/fbdev/cirrusfb.c   |  6 ------
>  drivers/video/fbdev/skeletonfb.c | 13 +++++++------
>  2 files changed, 7 insertions(+), 12 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

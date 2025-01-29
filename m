Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB90A2270D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 00:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C98810E011;
	Wed, 29 Jan 2025 23:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lrktP7p9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E8610E011
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 23:57:31 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3061513d353so1523511fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 15:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738195049; x=1738799849; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/vKmmDClQI5rJLO5/otgMifmCa4Ysla9vgbX9XiyqdE=;
 b=lrktP7p9t34vjsB0/uTK2ccKLanxboyWBlUvcBzwkVkfXd4oy7Ol95fP52ACvN7dz3
 MofQA6XVY2XVaDzRP8dPHtDJFkXrC9qOFsI7J60NWgs8JywCCe73/BZXdW2OZb9DGjJW
 /PwYUIh7gtn7wlGB/h28U9XAgAZOOv4uap0lw6gecyH/xu4HEXE6fuyZPTl+GO28ogg6
 7DyzTKizy1qqW40t6pajWLA6vyrow4SCOowhIRRdivQjmD1OFkEY3zzge5ZinYp1sORt
 WXjYxBgHqR1GsHPL9SrL92/kLlBRjcetLmRVMU/NciYyXxFWbNKz0C16m4r/tV8Cd1th
 3F5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738195049; x=1738799849;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/vKmmDClQI5rJLO5/otgMifmCa4Ysla9vgbX9XiyqdE=;
 b=T2XtZWgJkT4EKQDfKeIZAtSi1B2pnkuf9qcdPmCxaT/onp+4pWoAAp02nfwUYfpKkQ
 6V0k3cG55bHfrx4lyI4Fq7nSt0oXXEiXEaaUfIwb3mAdZtNcQoCCs71oRdzIjyWz+bcp
 Vb/4HXVsmIFpaBqKhhAaiKVi8ZVGWPJGyaK6E3o34RZk4wpXzrrwkZfluzf3jAuWbFQg
 ftoYIAXhSI8QY39fmKOXj/VM+WA/xHWgCJvADJPV+dqm77RR7F03iegTPvLDti72hVCe
 KCW/L+B2KWkgG4FVGcgSeCgIa+3MC8eKNHpHnBH7HTsAWLPLq0iR99aSNK4CiNIQdpLd
 368Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx0WeaEKvmzc41sas7Mnu6aC+3v6zKtx0mAD+ykRoxfLTnOzYkeLwP2eFFmPiQF7SkBgo4DnGSgk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCUaVDyYC6zpUywOr3koeOnQOqTMp+iUSPxdYpDX4xO76Mmt7j
 1FYiIPVVITVLDeCkeqSuYUZXlIMaHS088EAHanScZMWe5rMte/kVbKjHUHq/ZIQ=
X-Gm-Gg: ASbGnctVvcDOo7X+POZ5O1a3u2q8lGJWoT5xWJHfucVZMmSL+sM7fMRYdPoylsbRqJO
 GAOTv9ZbbdW0Hk8bHd12PxPv3cHQhgpvRLFU29zGGonhtdmYLzAEHIKS8/0H5WFahsf/6l99gVY
 ZBWWdva1eAXxFFKsTHOHVWbE3msAHsE5tAcJqDmqIjCmGIe786GXoHvyXn2+M5VCm99ODtF+fXp
 skIam5vdKN+34vhRX+78t1hHz26bz1R90YxPvXwTgxmtFNId/T7ixLAIr5emIhMnQhuyXBqdUKO
 XtliRFrg4H1EDQ/Q7OQxAzkbRkF+4+IR6CkID5jLb4i2g3S+jMW9DtYb06SFwSoXrqESWRM=
X-Google-Smtp-Source: AGHT+IF8IumImt4s4cQn29XrtALCizqOz/GhL2+Z450Kdl2dDZb73AqOTgTtWV4M3pPid4ONCXXNig==
X-Received: by 2002:a2e:bc24:0:b0:2fe:e44d:6162 with SMTP id
 38308e7fff4ca-307968c4fe3mr18537171fa.26.1738195049367; 
 Wed, 29 Jan 2025 15:57:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a33f778asm308621fa.66.2025.01.29.15.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 15:57:28 -0800 (PST)
Date: Thu, 30 Jan 2025 01:57:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jens Schmidt <farblos@vodafonemail.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] gpu: drm_dp_cec: fix broken CEC adapter properties check
Message-ID: <q4ldkifdkqsjnanu6pgp2gt7cfrp7spg4ewezexm7rlm7i3nxq@lkeiymkjhdxt>
References: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
 <44a95f7f-8a7a-4b2b-95f6-5c0b60bfa85c@vodafonemail.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44a95f7f-8a7a-4b2b-95f6-5c0b60bfa85c@vodafonemail.de>
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

On Wed, Jan 29, 2025 at 11:56:39PM +0100, Jens Schmidt wrote:
> On 2025-01-29  10:51, Hans Verkuil wrote:
> 
> > Jens (aka Farblos), can you test this patch?
> 
> TL;DR: Your patch fixes the issue on my system, thanks.

Could you please respond with the 'Tested-by: Your Name <email>' tag on
a separate line?

> 
> Details:
> 
> ### build #13 - stock 6.12.10 kernel
> 
> [~]$ uname -a
> Linux host01 6.12.10 #13 SMP PREEMPT_DYNAMIC Wed Jan 29 22:10:03 CET 2025 x86_64 GNU/Linux
> 
> [~]$ ls -ald /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input*
> drwxr-xr-x 6 root root 0 Jan 29 22:17 /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input30
> 
> # you also get quite a lot of these without your patch ...
> [~]$ journalctl --boot | grep -c 'kernel: Registered IR keymap rc-cec'
> 7
> 
> ### build #14 - 6.12.10 with your patch
> 
> [~]$ uname -a
> Linux host01 6.12.10 #14 SMP PREEMPT_DYNAMIC Wed Jan 29 22:24:47 CET 2025 x86_64 GNU/Linux
> 
> [~]$ ls -ald /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input*
> drwxr-xr-x 6 root root 0 Jan 29 22:27 /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input11
> 
> [~]$ journalctl --boot | grep -c 'kernel: Registered IR keymap rc-cec'
> 1
> 
> ... wait ... let screen saver kick in ... wait ...
> 
> [~]$ ls -ald /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input*
> drwxr-xr-x 6 root root 0 Jan 29 22:27 /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input11
> 
> [~]$ journalctl --boot | grep -c 'kernel: Registered IR keymap rc-cec'
> 1
> 

-- 
With best wishes
Dmitry

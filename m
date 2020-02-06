Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40258155C60
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810996EAEC;
	Fri,  7 Feb 2020 17:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD226FA77;
 Thu,  6 Feb 2020 15:00:03 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id k24so6641771ioc.4;
 Thu, 06 Feb 2020 07:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0aeF5q1G0b73eoVDS2ac2sJ7K68iVciT6eE2yPZtXHY=;
 b=elysSnpttUIUL+HnDwisS+ujdHIotO/snGFPQXZZvkTXPEuR9rfRUl3lzb8v7OoB8C
 9IfMuYl+P+mG0llybzT47GOIwMk1ziCGFBVxjvoqNq+E9VZ8dadJuwv3kGfLtfvSP6pI
 CRz5e9kbOA8HHcDaz3+ATOCjLsjb/Wvp3t7ZtTK/wQSy2rcd5Mlp0Ee94b6bvyR1z/Ry
 +PeFIqdg15wss+TQffZXE6jUFNLu5ngzXPyd7cLfYFOjY6MzAKLNnt7NvAAWEdD/itqh
 zUup/d8x0xdjtjuzO4m3eUgocSc9K+j6Ydaq7UwBb+9OTtOmQJ7h+z/Fa5wl5iNTWvcs
 hEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0aeF5q1G0b73eoVDS2ac2sJ7K68iVciT6eE2yPZtXHY=;
 b=FdUnbu2yXPLWCT84W9E4E312A/R8ivt6EJKhKC0DRqcJYArGs9uFLad0QLBiRh9TUd
 jdymoyE4J5zYRP4UrM6iBj05xygBzmZwTTqMjS9Q8mzFIQH0NZkv6StXj04p0734Rs5z
 Md9fQnh+uZzAdiBPX/6erfxT7XA5FVm7E1nxvDLKrHjyjWAO2gI/1SRWv0MiZdmOTMBv
 fcvbS8gPf4Ni3KNhoVoVxiHwiyR0wdCQzQZdSYtcE6x6+kPnKDWfnAE996S90t6Nrg16
 t4Swomt34enWtzy5Ia920Wf8Xk1DjeFK9Tjpx8l5r3hiDxR73RogrGsbj082hbzedLn1
 1j0w==
X-Gm-Message-State: APjAAAVgNgCUo20eANscRhc+5sFbndmju6ejILSprKbDP7pzgbsHanma
 BvXnp5elnuCuWtXx8HfuevVgJ/kQPZy5GyXQvl0=
X-Google-Smtp-Source: APXvYqxkTC68/mfvtuxSHKMnH0Wkjkd0rk/KuumAHnhmOJfquHLD75sVXLQ73KJAz4U4IFF8i2RAghE1ku4PpNRN+cc=
X-Received: by 2002:a5e:da09:: with SMTP id x9mr31540090ioj.33.1581001203294; 
 Thu, 06 Feb 2020 07:00:03 -0800 (PST)
MIME-Version: 1.0
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 6 Feb 2020 07:59:52 -0700
Message-ID: <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dsi/pll: call vco set rate explicitly
To: Harigovindan P <harigovi@codeaurora.org>
X-Mailman-Approved-At: Fri, 07 Feb 2020 17:01:42 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> For a given byte clock, if VCO recalc value is exactly same as
> vco set rate value, vco_set_rate does not get called assuming
> VCO is already set to required value. But Due to GDSC toggle,
> VCO values are erased in the HW. To make sure VCO is programmed
> correctly, we forcefully call set_rate from vco_prepare.

Is this specific to certain SoCs? I don't think I've observed this.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

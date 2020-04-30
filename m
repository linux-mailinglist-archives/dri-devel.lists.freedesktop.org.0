Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1366E1BF9EB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 15:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114D06E8A5;
	Thu, 30 Apr 2020 13:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C7D6E8A5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 13:49:17 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id x136so3921861vsx.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 06:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=28A0weeEoiRujzoqIsSwBHBfG7zhpIa3rCf2iCQRvYQ=;
 b=rdDudkw/y49miYU01sd2p5S5SUHw0rJvXQUs0nrKLaLpoyz81zU/LovmEaUU+IlRNZ
 lTgiOrYhM1U1IxyUcLXVsrPGb3+uTIid6Dgzr1Zo4hY9Pq1dWpQ7sJnAEJVaH3rrMTaP
 kTGf6nE8DGeT7FYxGrXVNy3q4mdea/v6XWv4ekkBgahS2LRMkheGFujEbscukTErtZ2w
 h5oUrdlbZq7UggaOECtLUaCXuODCpOU2BAt8kzvvtNXSRytrPvzBF2jreTz5XwOvP54U
 E3CzKjaDXYNMcG2PKtUfuD8vrhE/c67aSWkx3aidzBFaihk12n+/7D9xX96ZOXLkD98I
 w5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=28A0weeEoiRujzoqIsSwBHBfG7zhpIa3rCf2iCQRvYQ=;
 b=Nxipmi5iGiNCszXNbx6sEFOOyy5Zk4YupHpQKzc+KbIu9OOCkYHtsPfnocRjL1I+SK
 TjMLJDq5dtN6xBuQC9SR01V6LW6k1o64ww558atkitcK9qISbFP7yqjYy2KtFcxO0T9A
 5uoWB2jt7H1tBdiVuMa82LA6zCHgePqkR8muAj1oOq92tG81yZfGAa/Wly7vzcIiwUKW
 1dB3lWgHgH6iFgfcgIDtHPrbQIiLjqhzl2vKAesKeglhGfF4F41baVcM7HdP+xoJYpX0
 dx4cub9cusyzCHt+wC0mRspzu/wpbyKhyG8gCxTvkrr4/6mww2j9xq1yKVmMsalcy5jM
 yGMA==
X-Gm-Message-State: AGi0PuZCn4EMHaOlVaC5B/ftMvkiGJdt5wJMXhAZmD/QbotFMC+D2Xcr
 GGBtAuNNi0LxcbqElEp+k7sL48bFkLpcgeFhVF4=
X-Google-Smtp-Source: APiQypIcwuHkPvB9WwjY15akeqlBWZO/TpnhtOzgkxYnxoC16miXEsblVgQGPoIIdJlTLgbhnXH3c/UdglVbiRVqj70=
X-Received: by 2002:a67:fe8c:: with SMTP id b12mr3031621vsr.186.1588254556678; 
 Thu, 30 Apr 2020 06:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200221173313.510235-1-hdegoede@redhat.com>
 <20200221173313.510235-2-hdegoede@redhat.com>
In-Reply-To: <20200221173313.510235-2-hdegoede@redhat.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 30 Apr 2020 14:47:00 +0100
Message-ID: <CACvgo51i8_Xyp4=RVfcft9FsasMh4G9ze1jrc0Mg8ObOZCHn5g@mail.gmail.com>
Subject: Re: [PATCH resend] drm: Add DRM_MODE_TYPE_USERDEF flag to probed
 modes matching a video= argument
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Sean Paul <seanpaul@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Fri, 21 Feb 2020 at 17:33, Hans de Goede <hdegoede@redhat.com> wrote:
>
> drm_helper_probe_add_cmdline_mode() prefers using a probed mode matching
> a video= argument over calculating our own timings for the user specified
> mode using CVT or GTF.
>
> But userspace code which is auto-configuring the mode may want to know that
> the user has specified that mode on the kernel commandline so that it can
> pick that mode over the mode which is marked as DRM_MODE_TYPE_PREFERRED.
>
> This commit sets the DRM_MODE_TYPE_USERDEF flag on the matching mode, just
> as we would do on the user-specified mode when no matching probed mode is
> found.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I was skimming around wrt Ville's compact drm_display_mode series and
noticed that this never landed.

The commit brings extra consistency when dealing with user defined
modes, and is:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

Ville this may trivially conflict with your work. I suspect you can do
the honours, and apply on top of your series?
That is if you agree with the patch.

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

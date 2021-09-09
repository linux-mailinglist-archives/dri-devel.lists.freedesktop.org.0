Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 621764057FA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 15:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95636E883;
	Thu,  9 Sep 2021 13:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6066E883
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 13:44:35 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id b10so2324503ioq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 06:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MT6LELj4ua3aahT+trdn6bXJH9gCWz9tbef2rNohf7g=;
 b=IXyY+qdUdaheRneEYpQoeQaywPUici9JGiF9t3WphFb1G7trbxB12r2NpEjXOwCtSr
 9M99G/fDFwvMROTDGAX4O+m4sTH51AVg6zKXEzgcq4Ebs7UyZpLBlwjyyGtQyybTS6Zp
 ennj9eYjrCgyO+gT45uBHdiqbU+TFK9SoPHSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MT6LELj4ua3aahT+trdn6bXJH9gCWz9tbef2rNohf7g=;
 b=klpeero57PVXmpAQyQVXlfJSfRuTtM5amQrGfXE7fQKPLv0mHiOZibxlqBXRgWHrJ0
 OjR7Y2lnCjOrC5i/nD875FAYNkMzx4RzH00rwSuhk+lt28StsgNG7fKwwFixTYJyit01
 dI6vgVFMYHgnlTXCUzmKla6EIbrLONmhQTfNHPqHdt4sPUErK3K/mTUYvOSE79TE7TrT
 XfZuLvo+o9LrdBypUlNXbZcpbfNfJ6PpH2OEZm94ESjvBk4NSu/Gr+AmHzt3vhqDznCv
 cD9tbYcEgbuFTHMJ7eswfxrdYD+nib5EuuTtJYK4G1NqzwKBclJwdXjvINA4q3QYqbP8
 Yl+w==
X-Gm-Message-State: AOAM531xt7g5whn5HfyWKeg6DbXswbYeU4qiHUMRNhwFJocpjI+qjvLp
 XpFwJJR0yPjaa+FTYqJ4vlGf1/CI7jhXAA==
X-Google-Smtp-Source: ABdhPJzaBcroVSjZTqB+acyEDiRyHIyif6PkH5/kB5SSqxyV92ubINkCB1kvGZpynr/IArIhDE71eg==
X-Received: by 2002:a5e:a81a:: with SMTP id c26mr2753871ioa.15.1631195074664; 
 Thu, 09 Sep 2021 06:44:34 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com.
 [209.85.166.179])
 by smtp.gmail.com with ESMTPSA id a16sm614675ila.34.2021.09.09.06.44.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 06:44:34 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id u17so1913331ilm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 06:44:34 -0700 (PDT)
X-Received: by 2002:a05:6e02:e02:: with SMTP id
 a2mr2454160ilk.180.1631195073651; 
 Thu, 09 Sep 2021 06:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210909014623.128976-1-sashal@kernel.org>
In-Reply-To: <20210909014623.128976-1-sashal@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Sep 2021 06:44:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U2dGjeEzp+K1vnLTj8oPJ-GKBTTKz2XQ1OZ7QF_sTHuw@mail.gmail.com>
Message-ID: <CAD=FV=U2dGjeEzp+K1vnLTj8oPJ-GKBTTKz2XQ1OZ7QF_sTHuw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.14 001/252] drm/bridge: ti-sn65dsi86: Don't read
 EDID blob over DDC
To: Sasha Levin <sashal@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "# 4.0+" <stable@vger.kernel.org>, 
 Andrzej Hajda <a.hajda@samsung.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

Hi,

On Wed, Sep 8, 2021 at 6:46 PM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Douglas Anderson <dianders@chromium.org>
>
> [ Upstream commit a70e558c151043ce46a5e5999f4310e0b3551f57 ]
>
> This is really just a revert of commit 58074b08c04a ("drm/bridge:
> ti-sn65dsi86: Read EDID blob over DDC"), resolving conflicts.
>
> The old code failed to read the EDID properly in a very important
> case: before the bridge's pre_enable() was called. The way things need
> to work:
> 1. Read the EDID.
> 2. Based on the EDID, decide on video settings and pixel clock.
> 3. Enable the bridge w/ the desired settings.
>
> The way things were working:
> 1. Try to read the EDID but fail; fall back to hardcoded values.
> 2. Based on hardcoded values, decide on video settings and pixel clock.
> 3. Enable the bridge w/ the desired settings.
> 4. Try again to read the EDID, it works now!
> 5. Realize that the hardcoded settings weren't quite right.
> 6. Disable / reenable the bridge w/ the right settings.
>
> The reasons for the failures were twofold:
> a) Since we never ran the bridge chip's pre-enable then we never set
>    the bit to ignore HPD. This meant the bridge chip didn't even _try_
>    to go out on the bus and communicate with the panel.
> b) Even if we fixed things to ignore HPD, the EDID still wouldn't read
>    if the panel wasn't on.
>
> Instead of reverting the code, we could fix it to set the HPD bit and
> also power on the panel. However, it also works nicely to just let the
> panel code read the EDID. Now that we've split the driver up we can
> expose the DDC AUX channel bus to the panel node. The panel can take
> charge of reading the EDID.
>
> NOTE: in order for things to work, anyone that needs to read the EDID
> will need to instantiate their panel using the new DP AUX bus (AKA by
> listing their panel under the "aux-bus" node of the bridge chip in the
> device tree).
>
> In the future if we want to use the bridge chip to provide a full
> external DP port (which won't have a panel) then we will have to
> conditinally add EDID reading back in.
>
> Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210611101711.v10.9.I9330684c25f65bb318eff57f0616500f83eac3cc@changeid
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ----------------------
>  1 file changed, 22 deletions(-)

I would suggest against backporting this one unless you're going to
backport the whole pile of DP AUX bus patches, which probably doesn't
make sense for stable. Even though the old EDID reading was broken for
the first read, it still worked for later reads. ...and the first read
didn't crash or anything--it just timed out.

-Doug

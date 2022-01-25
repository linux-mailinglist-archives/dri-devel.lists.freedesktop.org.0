Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A4D49BF80
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 00:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B35610E1E9;
	Tue, 25 Jan 2022 23:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208E10E1E9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 23:26:05 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id s1so2937957ilj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 15:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eNJKYs46VCGzLPV+OfVxf1Midd4P2ThRQiu4nw0IrtY=;
 b=R1/UM4avx7+OxXjRSkasjRNLcoEThEMjSr1UTSNm2f/yVyt4fYcbXY6UdGSRzfaNMk
 yrF4YWEeW+98KE7jhKn2fdcMuiaBpnwFeVtKwSKPYO0dDdqi1Tv2A70qCv/c/dcFjNSY
 1C/CrhAzqK9wSAlSBkZwYY+8BBCFBlGw1wED0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eNJKYs46VCGzLPV+OfVxf1Midd4P2ThRQiu4nw0IrtY=;
 b=yHWTlPo5I5xR8sfdLTjoK5V1+EzDVtag/15cC6WwG7qq1JT7EdhISlk5yga34FsrzA
 fmMl+FtCz0TDLy/iRyV3fUNLQt6D8YxFuI1PgEpR5aLKM8seTsvW3Rr6iJaEuK5dGhAk
 48qkcUz+/YxPARg+gIDAzvf6U6XReU2Z9vrvhHf0w/zJXwRmO7IlOQAUUht81dObY5LZ
 4MpT23arj8mXgVDD3kGp7UxeW+uWm4aHEEZZGcd8s11Hdqsep0LvUmTV5a1NLxBin9/g
 KeLgOqWAM+8VEkSbj2rKeblRIIs1W2jW9KbgZNfGK8O9EeSeXQQtfK5AMFjOqh9xRnjd
 Zr2g==
X-Gm-Message-State: AOAM532xRLk6DqoXdSjcX2L9K4Y9Csvy84I4IouEiev3rbHrJy/5kdJf
 jC4M15A/0DC7O3H63NPEnq8J7n8KpfQB+w==
X-Google-Smtp-Source: ABdhPJzNiB3t0/0cqr2776cuz3O1GXG/d1++1vl+IHqJVa1MnrQbQ99hr6GI4XJuimpUGz+KWiw3WQ==
X-Received: by 2002:a92:c265:: with SMTP id h5mr12052118ild.290.1643153164447; 
 Tue, 25 Jan 2022 15:26:04 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id y6sm1014961iow.48.2022.01.25.15.26.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 15:26:03 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id s18so9122291ioa.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 15:26:03 -0800 (PST)
X-Received: by 2002:a05:6602:2d81:: with SMTP id
 k1mr2426978iow.98.1643153163354; 
 Tue, 25 Jan 2022 15:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20220125135406.1.I62322abf81dbc1a1b72392a093be0c767da9bf51@changeid>
 <e89dbc7b-b3ae-c334-b704-f5633725c29f@redhat.com>
In-Reply-To: <e89dbc7b-b3ae-c334-b704-f5633725c29f@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Jan 2022 15:25:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U8VGnRXv8MgofKzZF22_x0_X3M+AMfyPQ1u=yTXnFBQA@mail.gmail.com>
Message-ID: <CAD=FV=U8VGnRXv8MgofKzZF22_x0_X3M+AMfyPQ1u=yTXnFBQA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Allow querying the detected panel via sysfs
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, jjsu@chromium.org,
 lschyi@chromium.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 25, 2022 at 2:55 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Hello Doug,
>
> On 1/25/22 22:54, Douglas Anderson wrote:
> > Recently we added generic "edp-panel"s probed by EDID. To support
> > panels in this way we look at the panel ID in the EDID and look up the
> > panel in a table that has power sequence timings. If we find a panel
> > that's not in the table we will still attempt to use it but we'll use
> > conservative timings. While it's likely that these conservative
> > timings will work for most nearly all panels, the performance of
> > turning the panel off and on suffers.
> >
> > We'd like to be able to reliably detect the case that we're using the
> > hardcoded timings without relying on parsing dmesg. This allows us to
> > implement tests that ensure that no devices get shipped that are
> > relying on the conservative timings.
> >
> > Let's add a new sysfs entry to panel devices. It will have one of:
> > * UNKNOWN - We tried to detect a panel but it wasn't in our table.
> > * HARDCODED - We're not using generic "edp-panel" probed by EDID.
> > * A panel name - This is the name of the panel from our table.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Patch looks good to me.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks!


> Should this new sysfs entry be documented in Documentation/ABI/ ?

I'm not sure what the policy is here. I actually don't know that I'm
too worried about this being an ABI. For the purposes of our tests
then if something about this file changed (path changed or something
like that) it wouldn't be a huge deal. Presumably the test itself
would just "fail" in this case and that would clue us in that the ABI
changed and we could adapt to whatever new way was needed to discover
this.

That being said, if the policy is that everything in sysfs is supposed
to be ABI then I can add documentation for this...

-Doug

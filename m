Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F21454B63
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 17:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF776E12D;
	Wed, 17 Nov 2021 16:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913236E1EE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 16:50:48 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id h23so3445176ila.4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 08:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jLYkMtFnDmV7z5mlviZaA8HEm3Bspty3ASVJh0ASF+0=;
 b=a3S9Zdzy3vVzknJ2+MHEl7tGolYPQfJtco92MsePu1QameG4aar+6NG8EaO27mYF5Z
 ZmXJl913QfJWkppAjJFBObbxLFbQcPWz03bylfP1u6elDT7gvVP06/iicHQBbHg3OrKv
 BT3bDdw9OgsRnmKwfL9qUvicbYLejYZH/f6RQRlWfo9ke4vnkpeyY8iAj+oJf9Bv/rgv
 SmmRrxajfQ+l2ylCDENTpMOKpMg6IYevTI/DoAA3OL5vZs4BRjHfSCpKgxooL1LvwBx5
 KS7xc5YiqBBxkPGILVUw2uysiZcrNYzDkx3pPMRdWviyGmbh5iLnLTb3hgwxHA/dYtoi
 B+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jLYkMtFnDmV7z5mlviZaA8HEm3Bspty3ASVJh0ASF+0=;
 b=KWhu24lOZ2Cx67vk6tSv2+jpK8ZU2dn0gLQ0TfuynKb5vwSf5G+vpGfGubPVK6vYJM
 xipauTn4CWTP0jnNIWq8LJLzGnq05tltIBT4FNwITG4kI36W/QEEqkRlpRskLyvTpdul
 4gLIKFT8E6PFT/wcaaPaO28Ovj1j5N3q6dvOjrE2KL0VxQweh/3mgtU38OCZ7TRMBd+7
 rFBtvEq8cVosjPBYEGV4SVrRRINmA1jlImVbBSj4qstWXnleN6X7khyRJxfmCEh3OStY
 LorAPmKXtU5xglYXJiz9EO7nNm6+5818oqVT4p5DLdj30AxMCjHJfLu+KhgEJjF/4VQO
 Id9Q==
X-Gm-Message-State: AOAM530p8/xass4l/CrFlAfg0yNwrvOs1E/zboE7RguI+HPlML7L/mS3
 Fa/sTdujEZ5sl3P90cgnDAgS6NE7BNleo4rPVzEpNg==
X-Google-Smtp-Source: ABdhPJyHO2KLqbPMiL7hCboUwfUWjOcp+fzSzCmfoiGYW7MY2QXlhJC/3FBFB/CsoleOuaxPymfWFzGOKO4POP7mF+8=
X-Received: by 2002:a05:6e02:144e:: with SMTP id
 p14mr11313033ilo.180.1637167847569; 
 Wed, 17 Nov 2021 08:50:47 -0800 (PST)
MIME-Version: 1.0
References: <20211112084302.2447931-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=XWdA5kC5VpRPNWzCQDJjmDg5s7bP=sa7yVuqnRcxWf+w@mail.gmail.com>
In-Reply-To: <CAD=FV=XWdA5kC5VpRPNWzCQDJjmDg5s7bP=sa7yVuqnRcxWf+w@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Wed, 17 Nov 2021 08:50:36 -0800
Message-ID: <CAD=FV=XirCUp3t8sM_zXwZJ_x5-zbXzLQCdHHyor=5q2jr8ZrA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Fix additional suspend/resume
 at bootup
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, philipchen@chromium.org, jonas@kwiboo.se,
 airlied@linux.ie, robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, swboyd@chromium.org, a.hajda@samsung.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 12, 2021 at 8:32 AM Doug Anderson <dianders@google.com> wrote:
>
> Hi,
>
> On Fri, Nov 12, 2021 at 12:43 AM yangcong
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > Through log and waveform, we can see that there will be additional
> > suspend/resume when booting. This timing does not meet the ps8640 spec.
> > It seems that the delay of 500ms does not satisfied drm_panel_get_modes.
> > I increased it to 900ms and it seems that this problem can be solved.
> > To be safe, I'd just round up to a full 1000.
>
> Do be clear: I'm still not convinced that the old 500 ms actually
> causes any real problems. I think someone is just measuring with a
> scope and upset that they see the device power on and then power off
> again. In any case, if we can avoid an extra power cycle at boot then
> that seems sane to me. Since this is a tiny change, I'll plan to merge
> it some time next week unless someone yells.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

aa70a0996b0e drm/bridge: parade-ps8640: Fix additional suspend/resume at bootup

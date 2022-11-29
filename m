Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E97963CB0E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 23:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A9910E09C;
	Tue, 29 Nov 2022 22:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5C410E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 22:29:00 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x2so21761146edd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6TrUzytMxBgpuzK57XjYnA/tMg3rSbk1sqf4aWr+LLU=;
 b=eW+60F5ZaNSC2vEWF64zkR5vH38+E1w332c473FboCrBKMdYPCULVkM1vLD2EUZaFX
 6SOjRXQZffEKd3kUKL7JfsONN9tZY9FK1LGnH4GJCJ0XsqM3CJ4Wsxh7XDVz9egSx93F
 /IuBBwVFWzHypybwJ9Kp+s91qbenBEmwrD5Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6TrUzytMxBgpuzK57XjYnA/tMg3rSbk1sqf4aWr+LLU=;
 b=SjyWae2nM4brJb0W0utQ30lE2Lcknwr2GiKDmnkd+cCXzX81ZeVpU6q9R0kNSTQgFD
 e/KNv8EumoWBdi18ey5p+2tylH/0ZK966ulLjxPQ1CXOwPdwN/nyOzFIrerZozpDpIc6
 1h4/AUKpp1L+PSz8yLVMDFHL3qOyhkNTOYMqi/6nGAVVBzZWDRKCnfO4giaeLYDxVLmY
 aGXAXNAgkR1z5wK2oPYqxe3Q5era7S7rr+t7yEjO/F9nJjUhu4lA4xOtAKgvb8WiO8+p
 moxFwoLos9dYz0kyaFwbNT4v9+mkurrvIKRI3ToW8X8aWeeaSrHHtJ6ZqDmGcRzfxtCq
 WM5A==
X-Gm-Message-State: ANoB5pm09ulndBW8uWKj52LmDjQ8IAT8rg4QUN/YenZ4Pyk/vCplPwYp
 sAO81NiBmucvaK415HzPptlDfPhqI/iXPSgW
X-Google-Smtp-Source: AA0mqf5C590iD2B7h67wFYBk/57+87+S8bsnjB6ONdDLFTpuE6CGsHaUpQSKM6aCRo7BpSiqbhTTyA==
X-Received: by 2002:a05:6402:2b8c:b0:468:ebc8:7476 with SMTP id
 fj12-20020a0564022b8c00b00468ebc87476mr36314222edb.223.1669760939002; 
 Tue, 29 Nov 2022 14:28:59 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 i25-20020a056402055900b0046730154ccbsm6737368edx.42.2022.11.29.14.28.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 14:28:57 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso96852wmo.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:28:57 -0800 (PST)
X-Received: by 2002:a05:600c:3c8e:b0:3d0:69f4:d3d0 with SMTP id
 bg14-20020a05600c3c8e00b003d069f4d3d0mr2921033wmb.93.1669760937284; Tue, 29
 Nov 2022 14:28:57 -0800 (PST)
MIME-Version: 1.0
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
 <20221117133655.3.Iebd9f79aba0a62015fd2383fe6986c2d6fe12cfd@changeid>
 <CAD=FV=Wna4BXgr2CyGGe=m+crf3WMy6y8-dp_CH1Ga-Q8TQD7g@mail.gmail.com>
In-Reply-To: <CAD=FV=Wna4BXgr2CyGGe=m+crf3WMy6y8-dp_CH1Ga-Q8TQD7g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Nov 2022 14:28:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U9HwRRHo_Q9EQVMFM9kdPyyjzibdV-44+seJRXzLYRkw@mail.gmail.com>
Message-ID: <CAD=FV=U9HwRRHo_Q9EQVMFM9kdPyyjzibdV-44+seJRXzLYRkw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/panel-simple: Use ktime_get_boottime for delays
To: Drew Davenport <ddavenport@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 17, 2022 at 1:14 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Nov 17, 2022 at 12:39 PM Drew Davenport <ddavenport@chromium.org> wrote:
> >
> > ktime_get_boottime continues while the device is suspended. This change
> > ensures that the resume path will not be delayed if the power off delay
> > has already been met while the device is suspended
> >
> > Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/panel/panel-simple.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

7e682946db98 drm/panel-simple: Use ktime_get_boottime for delays

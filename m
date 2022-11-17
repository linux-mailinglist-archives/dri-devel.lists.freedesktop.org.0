Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393CB62E69C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 22:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF6E10E689;
	Thu, 17 Nov 2022 21:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6B810E67D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 21:15:08 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ft34so8199419ejc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AJq99VDc3uDQq7O+HFYnDWAxxsnyohDRV5q4kWwOTKw=;
 b=VajPH4qUqNXInYGFZBCL1XWvY2DoBv+EJ4EMb3tvm60Gk01Rx9OYP4Z8n7nK6QFbEI
 aJhw0Ynf1HnZfQutJfEDy2uq/T0OMnQNGGHFyE7oKBsVtjz9rx1j4Ob4eTaNZ2/QIswE
 Jm14XbI8RwHFRdLPGhPGiR8Bl8w5dzM+1jF6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AJq99VDc3uDQq7O+HFYnDWAxxsnyohDRV5q4kWwOTKw=;
 b=NhFcrNva5iuP0XYbgrBBHDmIXMcyAIoe40riVQsS73PQD28Wkq6eWSdL2iyGY/BQzp
 Tl+X7eo7AgPmVG690ePrsr3Cd0KU+K4djiG+oZBH+FYtBbvVSzG0eDJL07YdY3+BLAxe
 ar5nG9j/K0f2tu3fMMP7hDqnARxcJ5uJ4AW+GKa90ry1k+P79rCB5mPkMfMNla+ZxFBp
 vCp7RTWfHgpIb+MAhExoQVjCwLfnh6u9MBIst2vzOiiwB4U77f4W5plZJn3KoSkSZkTA
 CzaXEHu15lmmC+b25LggV2EUrulnwbCUipQWD49a73SYgyrd38AuVp0GxNbYtMEUxe/f
 IlgA==
X-Gm-Message-State: ANoB5pnbS+wYEZz3I9B+e3h2d8rlPi930H3mG+BNPg/qpLACtFyH4Ga/
 AEUYDz0+RfE1ntiDy0OtIbuVZZ6UssZxB+56
X-Google-Smtp-Source: AA0mqf6sNUxMB6hmsr4WRW1sXPtnfdc0zN8oQGYILTisakuSdb2nWk47yaijYB7WgC7kDVIqn2Y3YA==
X-Received: by 2002:a17:907:1006:b0:7ad:9892:91e8 with SMTP id
 ox6-20020a170907100600b007ad989291e8mr3669208ejb.620.1668719706693; 
 Thu, 17 Nov 2022 13:15:06 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 o5-20020a1709062e8500b00779a605c777sm820511eji.192.2022.11.17.13.15.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 13:15:03 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so5122558wmi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:15:02 -0800 (PST)
X-Received: by 2002:a05:600c:5118:b0:3cf:8e70:f34f with SMTP id
 o24-20020a05600c511800b003cf8e70f34fmr2871562wms.93.1668719702670; Thu, 17
 Nov 2022 13:15:02 -0800 (PST)
MIME-Version: 1.0
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
 <20221117133655.3.Iebd9f79aba0a62015fd2383fe6986c2d6fe12cfd@changeid>
In-Reply-To: <20221117133655.3.Iebd9f79aba0a62015fd2383fe6986c2d6fe12cfd@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Nov 2022 13:14:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wna4BXgr2CyGGe=m+crf3WMy6y8-dp_CH1Ga-Q8TQD7g@mail.gmail.com>
Message-ID: <CAD=FV=Wna4BXgr2CyGGe=m+crf3WMy6y8-dp_CH1Ga-Q8TQD7g@mail.gmail.com>
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

On Thu, Nov 17, 2022 at 12:39 PM Drew Davenport <ddavenport@chromium.org> wrote:
>
> ktime_get_boottime continues while the device is suspended. This change
> ensures that the resume path will not be delayed if the power off delay
> has already been met while the device is suspended
>
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> ---
>
>  drivers/gpu/drm/panel/panel-simple.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

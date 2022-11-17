Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C19062E6A3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 22:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE5A10E68C;
	Thu, 17 Nov 2022 21:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA5710E68C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 21:15:23 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id bj12so8198746ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H8azmGXIzeJiOhQpt5DFohCPxp1zDOuXjCtNAqmteBs=;
 b=K22a6BoFnPxV6N5ez/90iIJltU50Hl3k+/slP43Q/9IymNZe1iJFK14T8sfCc48yI1
 9Bw5ItYztLZhwKt4GjaTuhiMqHLt9Zke7s575opvOGVXlWw8yiv0BAn+cxNW5KNRb6YE
 BAIFRlv9h/+wHI0q1Mj9gR0JloFw7GlSyRNeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H8azmGXIzeJiOhQpt5DFohCPxp1zDOuXjCtNAqmteBs=;
 b=g0gAvyznMQI04FCtngD+X6oDn+Km92xhoIFsrzUUf2gTBogdpgPFIyGgPD4O8hLoS2
 ZPXwojYef0/P5AZYCQNVTZUC8qon8gZK3ksoAO3GSccrNm1tdU0UfyoQNqM9spnggTPA
 qMb6CDWZ582XUKZz+5jaB4zrvLwjiSX/v01tCz7kPuhQDocLLZbz+M2VVeoPfrvcwfYn
 KK56o/oIlFYgqzPr5XqiLKbjoSZGEZ8LjUHWt329YCn6Ev9/dyanYC26iQi2c70/pUpC
 x92xv2DwQeWTXEJQbVRYsSzw0MsZpp8ISZ2APVQ7nfrOZZYh5JJ6fwfKndzA4lxL7xfr
 yXbg==
X-Gm-Message-State: ANoB5pkmEafFqigxaqyUhUmAp8KjZ9Fc9bo7/AhBGbZSn/6Kl21W6y17
 rlmchLf09XZVRnse72eL8cYFjGHS+OqYaCsQ
X-Google-Smtp-Source: AA0mqf7Z9t67GzmEkZ1kPqRXTNJcSiGC8zdx+9yC6wm94BXINqjpkpPlAi+D6/mfGnF2ywBc0OKSAg==
X-Received: by 2002:a17:906:b14f:b0:7ae:6d3e:a02e with SMTP id
 bt15-20020a170906b14f00b007ae6d3ea02emr3543409ejb.626.1668719721431; 
 Thu, 17 Nov 2022 13:15:21 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 lc14-20020a170906dfee00b007ae07e63a85sm836781ejc.211.2022.11.17.13.15.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 13:15:17 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id g2so2277662wrv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:15:14 -0800 (PST)
X-Received: by 2002:adf:fb4c:0:b0:236:5270:735e with SMTP id
 c12-20020adffb4c000000b002365270735emr2510203wrs.659.1668719714379; Thu, 17
 Nov 2022 13:15:14 -0800 (PST)
MIME-Version: 1.0
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
 <20221117133655.5.I96ce2a565ff893eddcbee70174c991179311a3ae@changeid>
In-Reply-To: <20221117133655.5.I96ce2a565ff893eddcbee70174c991179311a3ae@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Nov 2022 13:15:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W_P3BbxRsPH0vQ4qRW_fiyM+u7RzRj+i0N9G3_4Zhtcw@mail.gmail.com>
Message-ID: <CAD=FV=W_P3BbxRsPH0vQ4qRW_fiyM+u7RzRj+i0N9G3_4Zhtcw@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/panel-samsung-atna33xc20: Extend autosuspend delay
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
> Avoid the panel oscillating on and off during boot. In some cases it
> will be more than 1000ms between powering the panel to read the EDID early
> during boot, and enabling the panel for display. Extending the
> autosuspend delay avoids autosuspending during this interval.
>
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>
>
> ---
>
>  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

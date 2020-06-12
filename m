Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FA01F829D
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92826E40D;
	Sat, 13 Jun 2020 10:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219A889ACD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 21:28:28 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id n2so4237198pld.13
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 14:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=q50EF1oi6iVj0g/hX2lXZBGzTAbXnNZchr5c5rsTc8U=;
 b=CP8z1KxPyKGd6QZi4PnOdQpR8ev8eekuKH/CynZh0Exe5JIjxFvJUaJvmjOBXdjTM4
 GXzKPX21EqBTryBElczC/QqQ1+VpQqkM/DZKOaAIT8tgiBlJjAlWlKRXQRXNk7SyZNMn
 Bxa+KmFCqY56wgY2Pfb0R5JtUhx4g1t6PpKLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=q50EF1oi6iVj0g/hX2lXZBGzTAbXnNZchr5c5rsTc8U=;
 b=HSzKh/QS9cDge+6GMiCEucqhEfvq1wGTWuzWLcEVVqZrE7Ku9yKTAhx2swnsLn3ePI
 zA0YASck6JA+BCy/5rCM2uSh0VCSBF35UjRo2QBoT4iQJjzTmQ81rqlcWMmUgFDPzKih
 FlcQnkh85GgU7R3E0W9UIB0PvayUSs3+KHCzPsznoVd1I00Dtty1DMrxtYvsYUe5+BRw
 I1JyiltdtKmP6W1v6kdiHyP3SpDR9Brdudu9frUvilqdU2gz3KpZ0z3zmHFp6WIHix3n
 ZFekrIt7ppC5+NNQIWrpQ66iJVOzN9UzO8RSen1kI6RoCnAyFyzumFmY1pzRjN6n6gD8
 q1ww==
X-Gm-Message-State: AOAM533Inyt6QdWVPsfRyUE/0u26hIbPzkb4Reil3q9CErUmx91eX9eM
 Hneo0EvaNW/ieDeoB/s3XmEfCw==
X-Google-Smtp-Source: ABdhPJzNsJkluvv0T/kJePCV/uW7PiR/CaUosJPHKH78onXcX0T8ami55T1bac/+kv0z7GN7hv7Qsg==
X-Received: by 2002:a17:90a:f87:: with SMTP id 7mr817869pjz.3.1591997307711;
 Fri, 12 Jun 2020 14:28:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id z11sm7194528pfk.141.2020.06.12.14.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 14:28:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200612123003.v2.4.Ia4376fd88cdc6e8f8b43c65548458305f82f1d61@changeid>
References: <20200612123003.v2.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
 <20200612123003.v2.4.Ia4376fd88cdc6e8f8b43c65548458305f82f1d61@changeid>
Subject: Re: [PATCH v2 4/4] drm/bridge: ti-sn65dsi86: Check the regmap return
 value when setting a GPIO
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, a.hajda@samsung.com,
 narmstrong@baylibre.com, sam@ravnborg.org
Date: Fri, 12 Jun 2020 14:28:26 -0700
Message-ID: <159199730620.62212.13255273805624622339@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, spanda@codeaurora.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 bjorn.andersson@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-06-12 12:30:50)
> The ti_sn_bridge_gpio_set() got the return value of
> regmap_update_bits() but didn't check it.  The function can't return
> an error value, but we should at least print a warning if it didn't
> work.
> 
> This fixes a compiler warning about setting "ret" but not using it.
> 
> Fixes: 27ed2b3f22ed ("drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

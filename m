Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B98345857
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7956A6E835;
	Tue, 23 Mar 2021 07:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3736C6E835
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:10:54 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id l1so10747440pgb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=OTthsKtOcH7+5b1h2hSE3Hi7N35EUQSGFHNAvucSefQ=;
 b=SPdx1dfspvXVtTtUqDNDHDlEX4O1qt3rDkuETcTLYLQ5JNiwXWZn2GucU4/qLxRkmm
 6g9+Tavvr1cf8DbBl23KTXBCtlMfALBHdWhIzm+SeerNv8SlchacLT5BFRXF0zTzBl7V
 OzckXfhz8mAaa8t9gXp+EHmmMG3P9eHJk0Xao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=OTthsKtOcH7+5b1h2hSE3Hi7N35EUQSGFHNAvucSefQ=;
 b=Ellvv+kzp/9RJcbymX0b6L2JFZjiHVFSwIQX5OK2FvUQUYSjne4gwpEFvUFLHg0ji/
 iPzm1FEmClpWoEOeKm8RsdwjmCMnjqCkEYtQL1bdEFvs9SoAPysXjG9Q1YrYwyMWQndA
 e0QMbJHiJFUImh1rKvZIVLrxUojTyidP0FD8SLTT3IBsuG2KugNIGIxf0z/DFqL1obL/
 S88LdMW/le1ULCVJuPWV8qKqPEcwYsIENbZAok1DLRL1hJ23JVGtYILbjXniRYWag/P2
 Vbi2KgILI0hlGigyxM++oigBleuve26RLTlD0YIl9FvPZSeLDuGoKTXdl8xmyYbOWNPq
 92ZQ==
X-Gm-Message-State: AOAM531YuHCTBDEW88j2dZyxm5p5iYbJCzLLAUCSafTULmP9t0b5CQ8I
 PgdnxhDg48R+ozQ3DMIY18EspA==
X-Google-Smtp-Source: ABdhPJwyiEPAoqpnxs0oSYEStjvutu2YYkkVVstSNl3urHgQUzsIobHrocGv/nTEeRXxtXndcn6Rvw==
X-Received: by 2002:aa7:8a58:0:b029:1fb:8ab:866e with SMTP id
 n24-20020aa78a580000b02901fb08ab866emr3797125pfa.0.1616483453880; 
 Tue, 23 Mar 2021 00:10:53 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
 by smtp.gmail.com with ESMTPSA id s28sm16161503pfd.155.2021.03.23.00.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 00:10:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 03/11] drm/bridge: ti-sn65dsi86: Unregister AUX
 adapter in remove()
From: Stephen Boyd <swboyd@chromium.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Tue, 23 Mar 2021 00:10:52 -0700
Message-ID: <161648345208.3012082.937476389048930443@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2021-03-21 20:01:20)
> The AUX adapter registered in probe() need to be unregistered in
> remove(). Do so.
> 
> Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

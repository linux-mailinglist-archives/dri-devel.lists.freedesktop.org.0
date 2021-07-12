Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976E93C462D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 11:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1138289BA3;
	Mon, 12 Jul 2021 09:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6901F89BA3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 09:06:33 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 37so17595073pgq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 02:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9IQU1XJBFQYQ15MTVRnNOF1cm13VQasnGNEcBzZoe/w=;
 b=oLIAQ121oScItTcx8m5R/ZfOo0TfiXMwRtNYEcvauLq7LcgV8jgTiCvP9M7lF9ZAsZ
 DD/KsrBAZ4GxLeQnvodo+wj+/ezdbS5e1LjuF8FLh+lUPwYsAgBgkLMZ17e6Ynoh1zec
 /CvmrR9Vs4PXCdtXGu1mdWGoQ/TFvS143qEEJtPfuCOU4Ku9fKcPv6vyBXdg8tLm1tL6
 zMbuR05KFS6CZDEuyrcVMK8/vihYhFvHLm5RkrJW0H1DsDPoWTxBOgNZmOkr35M+VHaa
 nhNDsqL5nXar0bl5ltX8jFCpIcS7IzONolBr5tFzuUqkWRcffAYhnEm0Ttl3BchUhnZn
 rSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9IQU1XJBFQYQ15MTVRnNOF1cm13VQasnGNEcBzZoe/w=;
 b=MoOWa4TR6Pj0tqmnSf0fBI/+4QchtE9Pgl0TpvHXuqsKkyXSASjA+1YUvR5iMxVCZR
 1W9QxRiKABQh0RPA8TeaZ6n1W+DtOFJKkOiEe8GnNY/qD50WCIEtR99kWj28cNYBhgQ8
 rl9MSYFBCXN/XXIGucPK4+5zR48d/rjY6QlUro/fucaQKENE6eyYot+QwcjCxqJnVmA0
 blMC10hqdwdCEavWvhubyXfUtqejYvRPnNr5mUohscC4IQ7TrqEH9xHspYytg0EIEmgn
 FMP9bS8w1WQEnV/PHaSglbTZ5GofjGTKswhfZ7+lP0OQWxMdX0AN37UiHybUAaSb35ge
 9M3w==
X-Gm-Message-State: AOAM533bxsOolWyoPTcbuXaPmuHyNhVU+8JvLxz4Rde/mJyTBaaJQ5dg
 vKZb7W6SDiML6VaXvAG2Uuxe8RfKD7wpnPib/LbxSw==
X-Google-Smtp-Source: ABdhPJxImfuuET+9vna9WB+tlPcbjyrbgf+SbTnM7Ydv8QyP3BdwPDQOD7IZSDNsZoV6zPJmM4DiqzztgyKEyS3QyDk=
X-Received: by 2002:a62:581:0:b029:301:9082:7283 with SMTP id
 123-20020a6205810000b029030190827283mr51475094pff.37.1626080793051; Mon, 12
 Jul 2021 02:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210704140309.268469-1-jagan@amarulasolutions.com>
In-Reply-To: <20210704140309.268469-1-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 12 Jul 2021 11:06:22 +0200
Message-ID: <CAG3jFyumpONBLoafj9o4V0ddFvs7BaRDYHAiu50CN9VhHga3WQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Find the possible DSI devices
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Jonathan Liu <net147@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

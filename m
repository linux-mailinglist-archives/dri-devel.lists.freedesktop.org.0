Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64E4EDE0F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787F410F408;
	Thu, 31 Mar 2022 15:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE2710F408
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:56:21 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id c11so135201pgu.11
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=DHy40vcgqWmM1RXVh4uSylBFkNjjnS/Krhz3AACJHEpAxdWr5Orw5RqSKFtW+FEDnm
 coaC90f0XPcfftD6KrR5svhq3NDHTqvYS2h85lR0zhte1FyFGV30OROs8TbTSfksdDf9
 qqAi6+gqhwMGbDB1457ruhuP0gTa3HguSu3/t93OxjhjFhAtWENF81WoK5WYqMVq8vR4
 HYdJ2vt/JEVPVVMvu1X7ryJv6XNk4tiQM8YXboqm20KwjRy3J40KsQFPGbZQzIp+mMd6
 NZymXuyC9IWBIfRrDffrrjHQW4IJDqk2TI3+TwPhYXTxWgcIJ57lTaeKfSaijlByZUK+
 3flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=Wa/I4Mv6UmTy0E3VeOiP/25qDFUgb1tHRZGOTZgAFmo+XEHCA50LfLnHihEmrw2fPb
 Sf9oUriRvG285d7ELiBtEjeBNF//QUsr7AsDxps5TCPXlEyMuX6rnDu271R2AOdeMw2H
 QsCS27+65A1WKX2kTK19crTfmhaTPkrJivJ65fyWEcyIWpeCK/qKaNNPiTQQwWiC+viB
 LPk8P3I62repPQ1SR4Q+uPtxjCXQ7wSX0ulsvYiot5z3j4hL7MmhAoQn9BCu57YBOpQh
 447FahQDjjunQryCzCIkA6kH+2d7GJ9GXbCevR8v8s7G+UL3n3otrd4uglu+sERrekQG
 2FMg==
X-Gm-Message-State: AOAM532Zp9zFE1FHeZ/9qSmHKjUBGsmGP3INFw67m1qBb/wc3KZTJ1s2
 +awBbaWgUnGajxbNki0jC5ZXLS9Yd4XEBU3nstDGuw==
X-Google-Smtp-Source: ABdhPJz9JqKjLHdqLUSvIwQZIa6Ye8XxuXy1ZbkZcAkebL6ETIf3fSpy+X3lP3xkDfNhWA22c2KxWUmPQkAGKEGkSDA=
X-Received: by 2002:a63:3648:0:b0:398:a0c9:7c58 with SMTP id
 d69-20020a633648000000b00398a0c97c58mr9041370pga.201.1648742180762; Thu, 31
 Mar 2022 08:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220331154503.66054-1-jagan@amarulasolutions.com>
 <CAG3jFysdZ4chY3CC1JZJvD9aShjDOr9dwXOX8rpVnR3QF8KE1A@mail.gmail.com>
In-Reply-To: <CAG3jFysdZ4chY3CC1JZJvD9aShjDOr9dwXOX8rpVnR3QF8KE1A@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 17:56:09 +0200
Message-ID: <CAG3jFytAmpNd_OsYj0Zf7odMOGQTQ_SwEf++HFtGdqzh0BSCiw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] Revert "drm/bridge: dw-mipi-dsi: Find the possible
 DSI devices"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.

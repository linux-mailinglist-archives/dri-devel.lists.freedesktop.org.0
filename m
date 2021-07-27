Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34C23D7281
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 12:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EBE896E7;
	Tue, 27 Jul 2021 10:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55597896E7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 10:03:20 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id l19so17086217pjz.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 03:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xbq9QWxbvPd3Ex/7ehiQ//FvYDyflKiEA2zaoPSUUMg=;
 b=xq8SztoFusZOuKEHPHsxf+kDj7xILPciXnRFCd4Ep6hEbCl9/Scoq6l0bwwrTeLZ62
 2zAZnz/1JYTSMgzBUzWVvpvB81jsZEYTx9BmNw7e7AaztX2ZLH73FJiwN2r6DehgtvkI
 g8kAom+PHhbZmyWK4vTHp7zJXR+6sFen6LfBKl6/w9t5kdfFnXE9Z3tHQzt5Srw6132h
 M9bySDLsQzpRH1BF3sN7uRM3WgUyv9kLNeeAYxsuoP4ZslQ91xx5OBmLlX4+Mf9h9E33
 rEc13Kft56nes1m9kzB9H5letw/s2mnIDY9rSI1RZuhzL25KGSeC7mXofVL3EDxrQ5bk
 ee3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xbq9QWxbvPd3Ex/7ehiQ//FvYDyflKiEA2zaoPSUUMg=;
 b=eAPF7wVOuWzSJuX3ZH8MPdFF68HiWrU2RR1KQwISsWqOkFrUTMJ1oOknZFyasAKDzD
 ZrmCDgnMVUmpuyi10iOWxZuANgBQprtD8ima8cqQN6bVmIEUsxm49FhepYFXOiCwIzDu
 hnYfz9y7IDwHKt59SB9P3yEyZvSiZHgaH2ZRoYBggXqALgKKYakWUGjjKlf+UtimsWet
 bi3EiZ4S/ldiLFd8FOlrktTf87a6bN8LG5MGKSq2uZP45HboO5AlPQzqhWhYPLDqfpul
 mZd9TBfq5YDJand8SpXatjQfwJsfTpy1LNd8EHyIeaEA253I2I4bz8xKWO0s/WxVwcMM
 4nog==
X-Gm-Message-State: AOAM531qaLA6SZrFHELUsBOYmbb4IPVfztKPlRRMJJEw+1SahDKsAPRu
 l8TmeiT6o8ggX0uTE6e6BuMfZW/RMqfEtiF5XMJTAQ==
X-Google-Smtp-Source: ABdhPJx3XNDvCiLqXu77rXCJS5kd4qAypwbtHwYRXrq0bCzY7tSYPrXJnWrd+u7HWvCvunSKRBIr0Bts+j5xf2sTkJ4=
X-Received: by 2002:a63:ee0a:: with SMTP id e10mr22774606pgi.385.1627380199920; 
 Tue, 27 Jul 2021 03:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210704140309.268469-1-jagan@amarulasolutions.com>
 <8327301.GXAFRqVoOG@diego>
In-Reply-To: <8327301.GXAFRqVoOG@diego>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 27 Jul 2021 12:03:08 +0200
Message-ID: <CAG3jFytkBZpjWF0NMzavhBruk2hsprgvprJ=Uhd8dqJaSxXRRw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Find the possible DSI devices
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
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
 Andrzej Hajda <a.hajda@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next

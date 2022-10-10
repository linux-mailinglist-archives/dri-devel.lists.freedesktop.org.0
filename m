Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC785F9ECE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 14:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DCE10E20C;
	Mon, 10 Oct 2022 12:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31F010E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 12:39:03 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g27so15687482edf.11
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 05:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=e9/WVu6GSIA88gNW8uLOLfEV/6IfxtSxFStrZAJscU/9Dv1PE+6heRcN1M+Wk8jv7Q
 9e8F3eXQJx6srRbZyZAWbPTpic0shvSeF8gQA8n8fz23N748s3C91upomjYXt9Yd8aXL
 5MkXOI/mOwntP+3zwJcKbva/wqRnjusKJyO49+JhnDu87vmr2lzZ14uiwtuxdISC0tWC
 38T+ldsKaUDpgXN4jFop1IjsSDZ6GAUtef6LeKM7zWTa4LR3wx310CoINlD61352KlCM
 yL3Z4Xbe/wD5ChdOvY3mFI+Ej87F2ev0p//+6sKzLcaz8r0q2WXYM4wRKYrliyCxdJGA
 lZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=fT9KlrNCyuOcl9b/r5vvFW/PwC1qzWqRnB5aruibj7b0826oQh2bF9hR/D92qltY1/
 VXXjHD9C0pIR6NEkcGi4+pIfL/1B9j8I8+lXCJ4Nh0aUJCBe8CbeB9eXt7T8m8A9nhJ3
 VRUR5GqNxAKvJzZtByD7bTZZx8RYbUXGvXrBaRincPC+AxQWukeImBX3PM50WEVxF5jy
 JHse0EJB+svPZR6ujXQ9pl1eIjq/m/XAmeA7kktGsOSi1ARZsyXO8HUQzh0MWzD9zhFh
 sAhXr5SiLANkCRYg5le5J7AWht6PB6FbaVMWr/t6BdD+fV++GVDxAT26UByXl23WyZyN
 +yBg==
X-Gm-Message-State: ACrzQf3YguvnkyDuS0cJDpbSpUW/dCDJIkp/zrj9gVBZXFu1eiQJLl/M
 A0iRX7QFdNxusr0DtVW+tMvOX9jCFammFGvgfWJt1g==
X-Google-Smtp-Source: AMsMyM5yTqRTvCW85FG/n59vVNLXIS2HyewCooCiL+thwax6yy8XHQ8qqI0YCmGCYywIw76aZzXfto6HBRaIibzsQrA=
X-Received: by 2002:aa7:c792:0:b0:453:98b7:213c with SMTP id
 n18-20020aa7c792000000b0045398b7213cmr17552370eds.159.1665405542435; Mon, 10
 Oct 2022 05:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220901131951.1116512-1-t.remmet@phytec.de>
 <CAG3jFyu_c5=rM2o_jDJriAKMtroHupGgx0ZZADMYM9jkmv-eeg@mail.gmail.com>
In-Reply-To: <CAG3jFyu_c5=rM2o_jDJriAKMtroHupGgx0ZZADMYM9jkmv-eeg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 10 Oct 2022 14:38:51 +0200
Message-ID: <CAG3jFyvh=xgZxnHiXp9oBK+5YGcdXouJvAAx7GDcu8oNZOgmbw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: tc358775: Do not soft reset i2c-slave
 controller
To: Teresa Remmet <t.remmet@phytec.de>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, upstream@phytec.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.

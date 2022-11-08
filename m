Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8267621578
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 15:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6142310E28C;
	Tue,  8 Nov 2022 14:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8A110E28C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 14:12:37 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-36a4b86a0abso134719017b3.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 06:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZS4/7A7uR8ROGh/drdouQHQube7YpqT1U80rwDMtwgM=;
 b=UFXVWbkyTwY5gAbT6ZetyNc5MaK1NDLLXVD8Bhg7TqB85/MJikG2vcrubqMJZ35VfU
 xQ68Khvh9c5ysFVu7HYlcfaQKQoME+Irk1sU52tiayJ1dGEx/bsVj7jFyN1m+lxY0Tji
 TtLEPXS1naEgT8GWEV1LuQ3Q2TimkKqk1bRbCphM/UqZ92CXnhLeIZY6RkaTXwk5ZpE8
 FL2bHXBf1sl1flLGnonMKaTqVrcj/THk+9xYXFKt7Tkvyt/wHVk4gVUZhZS2WIzrvKis
 7gZNP8tfx/4n1n5S6MhdYqNZs+c2tB2iBkkEt5zCyDix6dNfzWZ2+I1Pc7t6xnu7kdTI
 ZCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZS4/7A7uR8ROGh/drdouQHQube7YpqT1U80rwDMtwgM=;
 b=3R9dEJbdfSHDcJ/Q5p5vqSCOBHc1HvN8Cm2UdJE5R3kBwWDytJICGCndRGsKDZZWKf
 VetMCtD+d/utFKpAOdMmo9a+NRly16kXHarSLUFa9it/yVII3NTE6HYYBFKqKIaueCw+
 SnWl6n1/4+Au6lZWr/TMH0NRGsg90p7SgKrgkpGSpV5vaW14wTUCSQ1DySyXsDj9mO+j
 ywV+iNTrMv0s/uqcIuU0SI+YcOZC6XrE6icIAMo6c05htsK9y9EEpKwY/qwcLGv2Lqlw
 Z2zRGTlcd0UnTcTqoTbkcwuxPFgg7xqmtaGwLjtPP+ZjS4SGfadvPRLxkXFAU7AG6j68
 e7dw==
X-Gm-Message-State: ACrzQf36oKLft1nJ0gOwFvVzScZFZsKGg9w2IOFNR8sQRNjeaY3wTMFn
 tthhcYDxfgXfzH2OBYPBEHlUxfzFBHegAwzclbkc2Q==
X-Google-Smtp-Source: AMsMyM4OP2zUGBnfwEM1zz9G6bDnE/vktJzs0yVSbH49S3Z3kfDvLLQpg1pNbtjU6PCODa40ClvlgZ2qadooOqTSNwo=
X-Received: by 2002:a0d:dd49:0:b0:36b:f81c:ceb8 with SMTP id
 g70-20020a0ddd49000000b0036bf81cceb8mr54401842ywe.171.1667916756940; Tue, 08
 Nov 2022 06:12:36 -0800 (PST)
MIME-Version: 1.0
References: <20221103141155.1105961-1-jagan@edgeble.ai>
 <20221103141155.1105961-4-jagan@edgeble.ai>
 <CACRpkdYEW4z6EZ7UC9wT3NtRVnE=0L6AAHJDxtu5Jb-UrB+WSA@mail.gmail.com>
In-Reply-To: <CACRpkdYEW4z6EZ7UC9wT3NtRVnE=0L6AAHJDxtu5Jb-UrB+WSA@mail.gmail.com>
From: Jagan Teki <jagan@edgeble.ai>
Date: Tue, 8 Nov 2022 19:42:26 +0530
Message-ID: <CA+VMnFxyx=NP2QUiJ6RnfapZ9c=S4-cj+0kQn8PYyaMTBP3i-g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm: panel: Add Jadard JD9365DA-H3 DSI panel
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Nov 2022 at 19:31, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Nov 3, 2022 at 3:12 PM Jagan Teki <jagan@edgeble.ai> wrote:
>
> > Jadard JD9365DA-H3 is WXGA MIPI DSI panel and it support TFT
> > dot matrix LCD with 800RGBx1280 dots at maximum.
> >
> > Add support for it.
> >
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> > ---
> > Changes for v3:
> > - updatd to WXGA
> > - use JD9365DA_CMD_DCS and JD9365DA_CMD_DELAY
>
> My comments on v2 have not been addressed, for example I asked to
> remove the delay from sequences and just use an explicit delay and
> to then use the existing sequence sending macro.

True, I responded on the same day [1], since I didn't get the reply I
have posted by assuming my comment is valid. Would you please check
and respond?

[1] https://lore.kernel.org/all/CA+VMnFz0w-6O=wt3iuJo1BhQgPZ2XbpX6JdDz6vg_JW9nHTR2A@mail.gmail.com/

Thanks,
Jagan.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848B530D4EA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D4E6E9FA;
	Wed,  3 Feb 2021 08:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3280889C84
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 18:22:02 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id c132so15446949pga.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 10:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=H3Ktduf2QxtISjs8SRv/RgHUJLdczDldyTBeCd9r9t0=;
 b=JZKF6L+xZ0ixNqQkugWKwkTH8BX4f7XZ4EnCXuycwHUkO/STif4yShPRGkSWv3WnE+
 TwlGVsIE8o5elNHxDk0dHruDHycMm1uiXsGRWUc0OFaLyRiAts55Zaz1i15DK9kVzLlu
 lHiC7/zQ3USfSRYNLs3uhIfeK5ibwcw69YygY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=H3Ktduf2QxtISjs8SRv/RgHUJLdczDldyTBeCd9r9t0=;
 b=hT3DlwdXOKfPxdewrP3aBC+Aw5T24mZMwL/DYtsEq1vpxCQ9hPApbpQXZXfTQ/tEks
 gJHzmo2azUqcCfwnx4bO3NuxnKLB/l9s1x5EHuU7Ph+b1KwvuAaMgDJLO1UE9OLvb9Fz
 cKCptthwB6UZLcTvW6y1ooC2U6Siwpfx73BZCpIzVSOL9ua/Pv85gwZB1nZC1ZBw9zYD
 +G/gXS9q1m2bHb4ClpkGepYkFFzwy4Bc/SXf1z04TRtHOIzGxyX6dldqfx5I56QCzGg9
 mk1JmK0onSccJnqET3Fj4Y3cETpMZIT4VdjjWAynbF03mtmPcDcCdMtRTVOM0Yud1JPO
 zuHA==
X-Gm-Message-State: AOAM530DoW0+cV5Azkxr7AIlqCEwEFvdqIt+P2fD7rbEM4oUD6wExWrL
 ChD9WKbmn+4WehVAKwnXQTazZg==
X-Google-Smtp-Source: ABdhPJzmldyf2y2Wk1vWOl94CphO+LqXsIC7rCCdsLOlh0sJJeqoonhUJhmjgpgtFexAJ0nzN/uNuw==
X-Received: by 2002:a65:4101:: with SMTP id w1mr11472979pgp.323.1612290121838; 
 Tue, 02 Feb 2021 10:22:01 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3571:bd6e:ee19:b59f])
 by smtp.gmail.com with ESMTPSA id q2sm20238115pfj.32.2021.02.02.10.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 10:22:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20210202123214.15787-1-bernard@vivo.com>
References: <20210202123214.15787-1-bernard@vivo.com>
Subject: Re: [PATCH] drm/msm: remove unneeded variable: "rc"
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, Bernard Zhao <bernard@vivo.com>,
 Chandan Uddaraju <chandanu@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 02 Feb 2021 10:21:59 -0800
Message-ID: <161229011920.76967.17860389589804358045@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bernard Zhao (2021-02-02 04:32:03)
> remove unneeded variable: "rc".
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

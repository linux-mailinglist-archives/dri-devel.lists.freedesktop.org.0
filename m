Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189BB1F82C6
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F02F6E45E;
	Sat, 13 Jun 2020 10:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1FE6E8C7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 09:59:56 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id x11so2139875plv.9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 02:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=oB4mtb0xksSziQYWuiZhgrSJVGcBjygHK5uCltGAA6I=;
 b=cCqBVJogoMW54JT8hCGAAwmvRhaNP2+tdxBdl9ysnVAUWRoWcq6dO+Xv4oLyAu6Shu
 fWqLlu+2FrhtBN2ypp9U1dVi76fmzo7Z+vSuo3q6hq6qk6a5QRp6Q7k+S4byXUVI8SDz
 kgFkpRgObJ021BKn+r+PvZ/mBUXPy//f77/AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=oB4mtb0xksSziQYWuiZhgrSJVGcBjygHK5uCltGAA6I=;
 b=nXhveV2/gpqoaGJe/3xXOoNHhDLPJk1og96hnzXzy8/hwSppuZ1ttl7iSbZEz4xcY/
 8fstvM1HQBj9f2GVXzEPzu3vuE9ahTZFYERGLymBQ8l8dit6x8HrkeggvDCKhzXB6UHf
 dsCGEE+D97YFBHzoxNJkQ0fOvXkKccIHTmEteGEoLGLHX+BGh30pYdHtmW129OxKHNsd
 sKCIWnuGjrdKDtkuRrQSSUHC7dV22dCt3+vtQJ23G10ztB9qSaGUr4LMDOr6ocYqKMH9
 hr0LA34hqYjZhPxfziGAakggCHCWqIW+V029aqN3MDpTayFncwFLz83QqUSQPuPdhEEH
 0wJQ==
X-Gm-Message-State: AOAM532UMzgEoGSN4VnIggEgG9SsIiLe/OHC+4D921dUyGT+4gJPGbEQ
 VdXuWPmiGnif2uJTa84d5+82Vw==
X-Google-Smtp-Source: ABdhPJxEX6EPj5ivY6YNa2MMUScYAvFF56H/mo5xEMT0vW/YhejhIW0EkdgS65SMEAveqlDt5qSx8g==
X-Received: by 2002:a17:90b:714:: with SMTP id
 s20mr6577390pjz.99.1591869596069; 
 Thu, 11 Jun 2020 02:59:56 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id k19sm2792046pfg.153.2020.06.11.02.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 02:59:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200608104832.3.Ib616e311c48cc64b2cef11bd54d4a9cedc874bb1@changeid>
References: <20200608104832.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
 <20200608104832.3.Ib616e311c48cc64b2cef11bd54d4a9cedc874bb1@changeid>
Subject: Re: [PATCH 3/4] drm/bridge: ti-sn65dsi86: Fix kernel-doc typo ln_polr
 => ln_polrs
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, a.hajda@samsung.com,
 narmstrong@baylibre.com, sam@ravnborg.org
Date: Thu, 11 Jun 2020 02:59:54 -0700
Message-ID: <159186959470.242598.5120667136602798347@swboyd.mtv.corp.google.com>
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

Quoting Douglas Anderson (2020-06-08 10:48:34)
> This fixes a kernel doc warning due to a typo:
>   warning: Function parameter or member 'ln_polrs' not described in 'ti_sn_bridge'
> 
> Fixes: 5bebaeadb30e ("drm/bridge: ti-sn65dsi86: Implement lane reordering + polarity")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

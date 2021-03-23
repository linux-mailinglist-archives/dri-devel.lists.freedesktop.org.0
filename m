Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D65345861
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE2B6E838;
	Tue, 23 Mar 2021 07:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12276E838
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:14:30 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so9510586pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=o4jQ/HAg2zzn6VXOsLRxOATgDFZomMzaCwsHyYG7+S0=;
 b=Awr0J/TWCAuW1+ZeBWqd9HE2uWSsSki1YqvHdrZyR194nao7xCzhO6TpyU2Wqj6+/l
 LxA1yhbYtkWYvweFxiUGiVqyR8tNUAj08kmAgKuIKvktwnx1djshUMUh1lGoBsHt6esq
 R8gMtAdxsn7lF0OzymWfB/P0X70sA6FYxmMBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=o4jQ/HAg2zzn6VXOsLRxOATgDFZomMzaCwsHyYG7+S0=;
 b=VezPNpL+U1ZwMqJDlBb9uIPH3gv7C2+7CMQFEjvpFXWn3FcPT0R9EjyS4czM6417OE
 tGCTymJ1MaGe8hAEg/UYKGXqMOWEud8j9Lcz43lb4C5n6cb7ln+RqB9SFyyLqK9vAsJT
 A55sKmV4xAqR/InQxzp4p+6c4uGtu1pSfrTNhGWMt5oiSAihhjRqeNRcNV2vQu2QoQcP
 vWZpsM8WA+Mhd10UJ1dpV6QKookH9dXAj81w4Ex8DMxhBY7i1Mkkcsh4hW23xykk2qdT
 L2YX2m8KskUMnBgK+oFDC0ViahZ94ckmp3IbTgwZM4WY5kZng3VwHUj3xX2+bN3akwNQ
 KK7w==
X-Gm-Message-State: AOAM530UZW+mM5ZEFk2VFvLswP86ewvR/6XeRKNRGK937Fcp18riFryO
 9xyqBL4BAlcqxdiE4gbZANtBdw==
X-Google-Smtp-Source: ABdhPJy+TA/NcPaSnxnHe/+lxvHzzNKXcLzOmpdTkrfnAfUxmH64ryNFeH7o4IqTuQ0UILyCXIx0Mw==
X-Received: by 2002:a17:90a:b293:: with SMTP id
 c19mr3142455pjr.193.1616483670308; 
 Tue, 23 Mar 2021 00:14:30 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
 by smtp.gmail.com with ESMTPSA id y17sm1485194pju.50.2021.03.23.00.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 00:14:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210322030128.2283-7-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-7-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 06/11] drm/bridge: ti-sn65dsi86: Group code in sections
From: Stephen Boyd <swboyd@chromium.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Tue, 23 Mar 2021 00:14:28 -0700
Message-ID: <161648366852.3012082.5399469001009313940@swboyd.mtv.corp.google.com>
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

Quoting Laurent Pinchart (2021-03-21 20:01:23)
> Reorganize the functions in sections, related to connector operations,
> bridge operations, AUX adapter, GPIO controller and probe & remove.
> 
> This prepares for proper support of DRM_BRIDGE_ATTACH_NO_CONNECTOR that
> will add more functions, to ensure that the code will stay readable.
> 
> No functional change intended.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

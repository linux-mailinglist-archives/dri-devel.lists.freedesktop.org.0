Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F3D345867
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F916E83B;
	Tue, 23 Mar 2021 07:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72E46E83B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:15:49 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id u19so10770208pgh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=n9dAeyLNAQM1DR9JWXFsA91zKjf2FCCWvKSDEYq/hpQ=;
 b=n7UoauAu4Xeijdwod1hTKv/5+txQuO2VfiD6VWCwqva0bQfiwVCCr09WOlyL6Cr4LT
 1miVQyUcI7BmWnD+d6lVVHuNRSfc/PJybw+ulJKbhUrSbhc8jhy4rUXhG6AOsKxZbWco
 3G/u377DrsG/giFZW58YEprUCgKJAakBLVRWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=n9dAeyLNAQM1DR9JWXFsA91zKjf2FCCWvKSDEYq/hpQ=;
 b=HJunkW5vQGGlenAVbaVud/7dfrVnt4OMKHwlM57XWHwenXq5CUWRQJ7MqeHQFy2kF/
 1RfrkctG3effSb4hSPy3Pyl8UmThTEHhzSdNWVwRspToHus8FiO1od2/J86505O39jC6
 iJEavz7zU+69eq7zlARjPY3sFJfQ+/58d1y75djLcmpE2mIRb6bJFwxYTM4Ll0/Se8W4
 55MdDw92YSn3GE2G71yLaLipEfIDoMBzBuaayzeua4JU3xl9a4vtGwEVRHnnnQuQTLKj
 t53SAkqo//034ZQJHrMB9nEuQUrVmbgPqvfR8Z7O2d/jxSXFhTgsIHIefqu5MuH9WVlQ
 dAfA==
X-Gm-Message-State: AOAM532EnWSI9JCLjV2oX9TiKamjWalCcZ1+lzheRl04F+2pH6s5x7bT
 EAe9wNxkzCsk2FHPB7l91xIJlA==
X-Google-Smtp-Source: ABdhPJw3UbUwdf5rwIwYgdLSC8XaOPuDB+nRfEXKFoM4C1O6RrUcDUCjSVnALslLFnlI7M02ZP+xVg==
X-Received: by 2002:a63:5fc6:: with SMTP id t189mr2819490pgb.17.1616483749658; 
 Tue, 23 Mar 2021 00:15:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
 by smtp.gmail.com with ESMTPSA id r23sm1495676pje.38.2021.03.23.00.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 00:15:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 08/11] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
From: Stephen Boyd <swboyd@chromium.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Tue, 23 Mar 2021 00:15:47 -0700
Message-ID: <161648374789.3012082.2966786788232174257@swboyd.mtv.corp.google.com>
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

Quoting Laurent Pinchart (2021-03-21 20:01:25)
> Implement the bridge connector-related .get_edid() operation, and report
> the related bridge capabilities and type. The .get_edid() operation is
> implemented with the same backend as the EDID retrieval from the
> connector .get_modes() operation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E493E24957F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258546E1B8;
	Wed, 19 Aug 2020 06:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D306E192
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:42:24 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t10so9819499plz.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=e5nsLglQi6iq0gXD4/ZLbxZPHmUiCWsoxGRyVuLjB/c=;
 b=oekTgrwzSs/TnRji4n7Ia1KRw2sKFuCY6qwuXQcuT84qxYNIQBTvSVH5zSdQoh3F1L
 uAmAKAJagFUtKA5NCI6262idBc6YE3mg3C8P5KXEG9A53xdLiIZsbpEfCEA3ovO+r+bw
 D1Dbnfw3JW6d3gniWTVyrMYPGrYKyffZ21TC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=e5nsLglQi6iq0gXD4/ZLbxZPHmUiCWsoxGRyVuLjB/c=;
 b=sx2BRtbxlj//k4CSwlCYKlX7WGlSsFsQv5Qe4uX1I47KDXlbMXVhZz7j9XodgrLboK
 ncxQ4eO4ySyZKaQfRGtaVOOffUvYkMtwukpXTLPyoTDWm6xyruSv9/aRIwCQFQFLR6Up
 uUM2WE8fZ3Lst1qqI5WPaCFAmFnsElBPHwGOHTuIhaN3+s7FfuRFRs/tdgXph3m/ERnN
 dwWylK6smh+bm+KLDbFwpCdI5yruC70eT65YcUjviA310C/q+m79c0s6+JDx/as22r2C
 yVEAg1Gb3hbW7WyDUwekwIdxZjMDh8j5LnSNVvfqiWxqp2Q8Klg6s4Bpy6xKsv3+9B2t
 ZhEQ==
X-Gm-Message-State: AOAM531XEHMtVO/pL1nagFXOu1oSpieMVyHG4Rd/fo/MaJxdClynxWt0
 kgh3dQ7A7knXZN/HuVfnRKnbQg==
X-Google-Smtp-Source: ABdhPJxNWxWkdy4uYKtZpGauvgOCAqO43bYBYkbW03fwXdZ7RgGCLEOkwT4RULfvoamziaSpULpFwQ==
X-Received: by 2002:a17:90a:d597:: with SMTP id
 v23mr1471836pju.24.1597786944417; 
 Tue, 18 Aug 2020 14:42:24 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id e7sm22363954pgn.64.2020.08.18.14.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 14:42:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200818033657.16074-1-tanmay@codeaurora.org>
References: <20200818033657.16074-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7180: Add DisplayPort HPD pin dt
 node
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, devicetree@vger.kernel.org
Date: Tue, 18 Aug 2020 14:42:22 -0700
Message-ID: <159778694245.334488.3352871644651964381@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: Tanmay Shah <tanmay@codeaurora.org>, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-08-17 20:36:57)
> This node defines alternate DP HPD functionality of GPIO.
> 
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

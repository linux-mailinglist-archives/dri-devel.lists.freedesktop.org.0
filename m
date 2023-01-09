Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 608196622F6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4B510E3C4;
	Mon,  9 Jan 2023 10:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B6210E3C4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:18:19 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso3268313wmq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=le6UecpYkd6s1IgJwYmbxfNn3ne8GJa+7Qrb/t3pfow=;
 b=rEIZ4b7rHvMLjUxSavtHGZU0O5u3LYUtMqgSKHcfjCdrnTrIWUMsr+u1hqBzU7vfHC
 l7dy5RmZg8dA7J9Rw8tBJnrim29yh9CREnZ0g1ybTnj4CpbeZeCwg/f2zte6fEjrmvCV
 WYc6qJw94uR/XCq1j46mVITpd5fd2bDsZngLbvcUqVxGXkzPzPNLnM+hLgrLSYjJZH2U
 nPpx4q+rihKDzMjPLp31vLu0ACkJyN1qNvHvKsBcehBLBGHcCeLv1XM7pqtLRo4NWv5a
 CshF9EYYs9kOBq1MJkyB5YqkNHotlpXDgZKTMumKfDIQuip9Wl78em20c+l59hY03NEx
 VapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=le6UecpYkd6s1IgJwYmbxfNn3ne8GJa+7Qrb/t3pfow=;
 b=zsl0Ygfe2KRHQQlZ4DyY09TL6EueIDz+wEu156qWuDDp8BSsEnlfwGqCzkQQJMd0Jh
 YROvVYIWDHCzuosSFESqgVksp76NcaJFxdX282+lSjyuCVxmXyVphN0tv7g6V/axv/B5
 IeRGhE8E45elCN7uCPRAOhqpcvro2uTfEpYFdChwlo7QcAYvEoKPaZOfHKkYvFKvUdMj
 Cemaf/E55SknLOkOPoGit+FIRE8YAIQ2tUT+EbiRmjSKj1s8JWj6abv+1dtuQpEVEZc6
 8mdmD4Avj3iGiXAdx2aW+0jtm+cLvQhnkJMGyFZhCkSd2hYygx4EbOQGJiA4obWfAPNY
 9h3g==
X-Gm-Message-State: AFqh2kry1OX+V85VYdAd7Umw22CCjbehGVb+CHkif9mcn4IlUtm41wCp
 PyjF/Yb9aadtTK32Hn7xfsl92Q==
X-Google-Smtp-Source: AMrXdXt08Gf1g3sCj195fhecOdNnHaC4SmsdCQ+KvR4WGo5EayS3wHMCJ77TSvczIqZSzIRcvtVLsw==
X-Received: by 2002:a7b:cd99:0:b0:3d3:5506:1bac with SMTP id
 y25-20020a7bcd99000000b003d355061bacmr46541929wmj.30.1673259498469; 
 Mon, 09 Jan 2023 02:18:18 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003d04e4ed873sm17288894wmq.22.2023.01.09.02.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:18:17 -0800 (PST)
Date: Mon, 9 Jan 2023 10:18:16 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH RESEND 4/4] backlight: tosa: Use backlight helper
Message-ID: <Y7vp6AvXg3HtJtPZ@aspen.lan>
References: <20230106164856.1453819-5-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106164856.1453819-5-steve@sk2.org>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 05:48:55PM +0100, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
>
> Signed-off-by: Stephen Kitt <steve@sk2.org>

For the tools:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


D.

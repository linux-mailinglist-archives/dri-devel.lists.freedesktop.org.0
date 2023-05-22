Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89F70CAA7
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D7E10E37F;
	Mon, 22 May 2023 20:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4198710E37A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:16:18 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5346d150972so4728134a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684786577; x=1687378577;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IXAgSSaBSjm1CetJruAB7G9vGtE1c+hHoYZB1utEDWk=;
 b=QQTUxhTD+GBKEguQUQDkEE7nMOAe18rTZR4yd2iaOBBDSLRz7YTvTiKzOUoz/KfNRX
 53a/09Vvla3KWcqtTiP3yI89difUnrz+iE00qjLf6kPKp7r7w0Bkpvbvvp7WqhswLcI5
 P7LmB9YrcotM+OM13H5iyJWT/jIaabCUXsyr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684786577; x=1687378577;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IXAgSSaBSjm1CetJruAB7G9vGtE1c+hHoYZB1utEDWk=;
 b=KPEy8j8+zAwAZkTvfSIypRe0SrK9XhgJElY18ynjCaFhFvaDgvUmH4LB2FlRthLirj
 gU1FET+a96UD54eaR+PQuAD6+WC9ulR0ukDSmelS+mGOTQv5bmZRm4ciSbD4sC8uURfx
 579eTHgULrT0crxP/oQqV4xq8FWSEmowpWmMwaXYtk3r0/49EhPnR74KI96hTOZeWWz3
 Dg9GRj1baDHR6jG/OmFriV3Go2FOWiqqm7XIQP9Nh2Pizo5rMX8fwUCeNenzC19OW10I
 5wkxLaAgv8HU4sEj74nXM/69B1JH9pZ760D5k5x3/ueZxaUQiBrO+3s3Y5u7UCkBNSK5
 jbsw==
X-Gm-Message-State: AC+VfDxr3Ie7g8XhG6rVnTiWQzn6Sl6gYWDscmtk/ddkfH3VYTqrWl0G
 ZzHPPuq0Oa7cxlagBUEJ93cA8g==
X-Google-Smtp-Source: ACHHUZ51FT7XO9iVtfE7W8pRe2pp+oF+jrhOC7+wSnz9QKew8znPQk021RvlTVHrkhez485O6aBqLg==
X-Received: by 2002:a17:90a:a611:b0:253:2dc5:4e12 with SMTP id
 c17-20020a17090aa61100b002532dc54e12mr10854532pjq.46.1684786577531; 
 Mon, 22 May 2023 13:16:17 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 fa12-20020a17090af0cc00b0024de3dff70esm4445821pjb.56.2023.05.22.13.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:16:17 -0700 (PDT)
Date: Mon, 22 May 2023 13:16:16 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: [PATCH] drm/sun4i: hdmi: Replace all non-returning strlcpy with
 strscpy
Message-ID: <202305221316.FE9BC18975@keescook>
References: <20230522155331.2336966-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522155331.2336966-1-azeemshaikh38@gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 linux-hardening@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 03:53:31PM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

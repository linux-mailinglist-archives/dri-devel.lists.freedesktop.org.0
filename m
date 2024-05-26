Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3118CF612
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 23:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1E110F540;
	Sun, 26 May 2024 21:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="leWHJU76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE3310F540
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 21:19:10 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2e97c9be323so1425031fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 14:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716758348; x=1717363148; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OEIFM+ukt26ot774C0FBgnpAZ7Ab3pUhoDY2KfgwdKw=;
 b=leWHJU760/1zdStdvczII+Bbdt0ZvhSgBioOcYkrdZhagm6FSVhZykeD7KKWqUqa+w
 vjqFcnnlQweOSRYkW7l+nnjelWQpTWuqZ9ItRuqq7Qm3YY7ni7yXaj3VqB6yVuCz0sFa
 d/98dqwAnP14jWPCHQ1qqjEpQ9hOAEw6nLE0bpUw2T9Ps45GCaPPTiPVCoBkQkwTQ1Dg
 qYcaziqS10yBDUT5r2THQiTcYkt56ahny1pNvGnJI3AdVDnyDzI3iqEbuT+nDI8vH4PT
 OBy0D6BfskqK93M932RUsRRd1MGte75m+SuNgM1Kcy/s1v2KhbwFDI2hRNw/viMeMkCk
 5aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716758348; x=1717363148;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OEIFM+ukt26ot774C0FBgnpAZ7Ab3pUhoDY2KfgwdKw=;
 b=go49W6lA8e8Y8+Oux3hvlIy+/xIBsbAQbTNHRSMw3DT5R0h1emm/rcWB8eTkCkY56G
 xDIZXO0ixphAGPGng6Hop2PLyySFPHnuX7k+cvf2DeyLMXFz5A6mFn18uJCNiP7m4nrK
 DmXePrECLvps4m0vYFopRwvMolkuA4xE91VkOGM4us8Dq1yp6Y6YRq2HOPCgbJP+jqe8
 D73JwTo+FkkolNz6IrGhtPS9i4WR70ah1trBz0GRHqjFe6kqglp/8zsP4pJvZU+PJUTf
 SbL8Mu1ksNoKBKSkJIzf/Ijr18wbvO/EP7zaBQ6O6WOQ0LCDAym36ClOKX+/MiCEm389
 dF3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQInebLVwSEV/jYq2CS1H5hxGghNE8tF7DK1395Ki4GlEHAyG9jZioWpGd6G6GL3zhrOGLQABBx6mWFIKqtliNKsQyCScPR4qgCjmrNtTW
X-Gm-Message-State: AOJu0Ywf0TkPdiRAr+b8lRjkerg3pd23fNysoV4pSF+WOQG+YQ4Ccctc
 J5XVaSAZBgS7mHedrRVN2UrpeXqGLXkZYO2TQnyTYMCl92/15p68AI1HOqB0KKhJFYZgdqwCJXd
 U
X-Google-Smtp-Source: AGHT+IFrJTTBkEiw1EI5YgPKR8vkpSp697fOmBeacYJpaNOQSuBqiiQeMhcGuKW0GUoctcDWYbgGhg==
X-Received: by 2002:a2e:2e10:0:b0:2e5:87c1:e845 with SMTP id
 38308e7fff4ca-2e95b278a70mr44542691fa.48.1716758348145; 
 Sun, 26 May 2024 14:19:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcf47dasm15796671fa.55.2024.05.26.14.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 May 2024 14:19:07 -0700 (PDT)
Date: Mon, 27 May 2024 00:19:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/10] drm/bridge: Set firmware node of drm_bridge
 instances automatically
Message-ID: <lfgb24qv22sohgizlmt7kq3ymnshjeawlkwwcndivbeiloip55@x3qnu4ss3x4y>
References: <20240526202115.129049-1-sui.jingfeng@linux.dev>
 <20240526202115.129049-3-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240526202115.129049-3-sui.jingfeng@linux.dev>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 27, 2024 at 04:21:07AM +0800, Sui Jingfeng wrote:
> Normally, the drm_bridge::of_node won't be used by bridge driver instances
> themselves. Rather, it is mainly used by other modules to find associated
> drm bridge drvier. Therefore, adding a drm bridge to the global bridge list
> and setting 'of_node' field of a drm bridge share the same goal. Both are
> for finding purpose, therefore better to group them to one function.
> 
> Update the drm_bridge_add() interface and implementation to achieve such
> goal atomically, new implementation will fetch the device node from the
> backing device of the drm bridge driver automatically. For the majority
> cases, which is one device backing one drm bridge driver, this model works
> well. Drivers still can set it manually by passing NULL if this model
> doesn't fit.
> 
> While at it, Add a 'struct device *' pointer to the drm_bridge structure.
> As it already being passed in by both of drm_bridge_add() and
> devm_drm_bridge_add(). A lot of driver instances has already added it into
> their derived structure, promote it into drm_bridge core helps to reduce
> a batch of boilerplates.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---

[trimmed]

> @@ -231,7 +243,7 @@ static void drm_bridge_remove_void(void *bridge)
>   */
>  int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge)
>  {
> -	drm_bridge_add(bridge);
> +	drm_bridge_add(bridge, dev);
>  	return devm_add_action_or_reset(dev, drm_bridge_remove_void, bridge);

This breaks aux-hpd-bridge, which gets of_node as an external pointer
rather than dev->of_node.


-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C4D64D888
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 10:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24B910E50B;
	Thu, 15 Dec 2022 09:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAB010E50B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 09:26:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id ja17so10351451wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 01:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rT5nYetbt/rUXKIwgJbVz9fS9IuJsFVtRBisMphoNoo=;
 b=uuryZsdS88lObitkX7oxZa7cfGT9633pRc4WZIgl5bJUbG9D8CBtD15kZGCxNXmd8W
 SRwLhAR2eiJIhtAEZS9smEviFkVCL4zLFUaDE7JDGN1o0y6dDq5KSuqrYfCGczRFjXLj
 PRVNRc9lFvKfpmul5ElCdoG0EIX0ixYU9SENXyrO6n0qDwLTyWlK8mOiKjQ7ktNyxmUl
 2RIPHyh1eqJzELF1iNAtxlDnABfR2/fXoi3rbIIMnqkxUTRC/8qhTx84nZajQjMSYIDm
 gdF/kr5djm6fIGjajwNgGSaXkRThEWBLjPNuOWiBwU6h+w1/gQEknxYtY+LQMgPwu+rI
 2kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rT5nYetbt/rUXKIwgJbVz9fS9IuJsFVtRBisMphoNoo=;
 b=X0NR6q4a7AdeW6i0CG9R/8hpIh3fbs2fdtpaufLmn6UiWceqKxXATnQCQlotX5uASP
 cOykk4pEIJs9hN05FeVz7GfyOATmnE+L2pTEVh7pTGP1PoMSW+huJ7Nhso3u5m92vYTZ
 X8A5XOyXxUKqnjQ/9WBwASlyL/ck7c+0tJBzninF6Q+4hjBLbrNDwYPHWQQACskJoM8Q
 ZviLeJl6CzzkxmzICa1T2GGLTkdmfNs4jKuCWUJIsO5MjqIkn84NJvPzLfJj65DopSw+
 L3FPNXEpe7q1Np1jaeHASSSLV8DQyQAa4EQhCjQW5INQWgrJTWNhwaTA6h5f13OmC1Q4
 2qsg==
X-Gm-Message-State: ANoB5pnwy0pLZO/eLBk15bB9ZiW+DEWZBmidS1q5bg1wn1i8DLVEvSiC
 7Cz8SyFZW1HaxVdw0PxKwfbDHA==
X-Google-Smtp-Source: AA0mqf40a/Y200wMJ6a9mSLz6nlNT4JTAlNOWT8f3KhBY+g472ukIetY/DrD+llEO7lEN4DsR6KLsQ==
X-Received: by 2002:a05:600c:4f05:b0:3cf:85af:6a4a with SMTP id
 l5-20020a05600c4f0500b003cf85af6a4amr28838749wmq.25.1671096367213; 
 Thu, 15 Dec 2022 01:26:07 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 v6-20020a05600c15c600b003d33ab317dasm1152748wmf.14.2022.12.15.01.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 01:26:06 -0800 (PST)
Date: Thu, 15 Dec 2022 09:26:04 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] backlight: backlight: Fix doc for
 backlight_device_get_by_name
Message-ID: <Y5roLFINjM/GjWPK@aspen.lan>
References: <20221215071902.424005-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221215071902.424005-1-linmq006@gmail.com>
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

On Thu, Dec 15, 2022 at 11:19:01AM +0400, Miaoqian Lin wrote:
> backlight_put() has been dropped, we should call put_device() to drop
> the reference taken by backlight_device_get_by_name().
>
> Fixes: 0f6a3256fd81 ("backlight: backlight: Drop backlight_put()")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

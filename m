Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8622F4D1504
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 11:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BE410E208;
	Tue,  8 Mar 2022 10:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD5010E208
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 10:44:56 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id l10so7016536wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 02:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sHxA9Ld6Wu8Hd+SfF7WzN4p3d70QNOTgHg1o9QMZk54=;
 b=bo0A1UtjPuz9iqMy5rGLOoKWqhM9zUra4nPcNHqTCC5H/pqmbWlYdKOXMJ9vE1ah77
 sQYwMAzxt9eJhGqspS72toUh/fLgCEsyXxTfH3wmsjnxSYaix9wHzmhIbzaOx4hDx7hb
 mXEdSdYvEACUutTBo3UCOsP0kgd7irD64tx/oaaW4l3IPcmzdqHai5l4b34nQBvd29vl
 eVeNvhcm7GDC2bYqcQjnAegW24vZ81t4EeaZJPifvDShnYH/RVTDQTImzE0Cn/510x7x
 aEcHgekGBna8z2v0K+B8n6G5uT2oKXwMIMdQMYqfHP20h2/r9Zz5C7jK1ZfBfGqGKN6p
 PV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sHxA9Ld6Wu8Hd+SfF7WzN4p3d70QNOTgHg1o9QMZk54=;
 b=R0pgzEEE9jTLpgz5NkVntbi3Wr5BvDHPPqp1C8VUG/4kRyoFJWUsBmtrO2AHIo07nh
 TkfeBUp7vULT8uC1b6SxdWgXSAEWn3g6KzeTmc/Hyz9uVscUgcLMyDZll0svCiNscx6G
 tdoC6r2e4iJaVl5smeiS+kkITBSGOPQInXBdiZMf/9AwjcIG8Wi5iNJgKKspGaBnp/gK
 CfRQqOh1QknFHebOBc+0cGtvkDNE8rUE9k3O67CEDMj0k3VeMWJL8wAk7V3Je406ODU+
 wRyGhjvtJNeahBqos1N1bP5Ppz9qtE5MUlj6WY5EUPLDlwTbyquixgwiDr3Tw7EEONP3
 cJVQ==
X-Gm-Message-State: AOAM530ca/EpcQJFJVcDXvwvma27qR9rcmc1x0dz1M24DmnjlL97Iizc
 lmuTJVSZE9bdKct4SBo6GTfP+Q==
X-Google-Smtp-Source: ABdhPJwof7f+BbquaM3QrH+C6BkplJ0XCOiqzDXkMUoAGwSdShrOqVMOf6WU+qu/h3z5GfDH8ZsFgQ==
X-Received: by 2002:a7b:ce95:0:b0:386:bc81:c912 with SMTP id
 q21-20020a7bce95000000b00386bc81c912mr3004398wmj.4.1646736294834; 
 Tue, 08 Mar 2022 02:44:54 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm13298020wrx.47.2022.03.08.02.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:44:54 -0800 (PST)
Date: Tue, 8 Mar 2022 10:44:52 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] backlight: backlight: Slighly simplify
 devm_of_find_backlight()
Message-ID: <20220308104452.55arvejyjix3t4zb@maple.lan>
References: <f998a4291d865273afa0d1f85764a9ac7fbc1b64.1644738084.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f998a4291d865273afa0d1f85764a9ac7fbc1b64.1644738084.git.christophe.jaillet@wanadoo.fr>
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
 Helge Deller <deller@gmx.de>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 13, 2022 at 08:41:39AM +0100, Christophe JAILLET wrote:
> Use devm_add_action_or_reset() instead of devm_add_action()+hand writing
> what is done in the release function, should an error occur.
> 
> This is more straightforward and saves a few lines of code.
> 
> While at it, remove a useless test in devm_backlight_release(). 'data' is
> known to be not NULL when this function is called.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

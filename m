Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A01364829A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 13:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE69910E534;
	Fri,  9 Dec 2022 12:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C29D10E231
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 12:51:32 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w15so5084701wrl.9
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 04:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OtnZ1kdjAPZRqPqQ9rwdeEDxyI3IJgipy4lZ3Z6DHOU=;
 b=mzhiuYzLh5MXO4d2/CaGSLQRvmAHHQmyihleIadBSeVx0urmsuaZmDMUhlN6s6G8Up
 KGqJ2YNpR9+iZiOaO1gzAodX6jigmaayrqo/LY5geqBf0KGwQiN28ak0hr+qKVhp41/h
 lwiBFZuTLTdW/6SDBpJfuU28ZTjfX0BYytaoyOD4VdJvI5R6qLbslN8pJoYKU/RUfBxc
 yqvA/kxuhhz9o5Y6B2qx95QtRTxAjXm4uEfj31X4efvNKWuxnGeFyjDP1kIh0Lgasnb7
 uO+8X9prY1dZNpqTfVJp2HvUy4jyN7/6zqEDrct7rMKKm1K8MijdUSHqH3O6ArIOH3Pl
 9/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OtnZ1kdjAPZRqPqQ9rwdeEDxyI3IJgipy4lZ3Z6DHOU=;
 b=i5nJSLDQ5tZioFTQc+pmjzAGeL8sdc/osbmMcye+x9n/SMAtMOOPDK7ONQFO4H6i/L
 V/ck87QzY2HAfyNAl7wEavx1MTmHSqrluGyzygRevlVBpFAUyFGAu/yO97YitZKrQizQ
 pVtcnAMzlVhK6I0j2P4tCrA/ngpQYQQ+D7q9PfIz8446iwlRiBrIy7bN/T1RZZMpLjHu
 4f3quMe2dO6iky7EhArdaTZC2uDsfoZrppznSzdgcSusc6g5iC2rV8Sy3VCGL6yoleek
 CayCDcglfTwM9A8ukUavc5SlliBw4NZODNFpUcfEGMZy5vdZ+SDpo/esOrAR9lCRM4SE
 JB9w==
X-Gm-Message-State: ANoB5plMA2iKoUdqOBl8695zsuDVJnvBgQP71d5831Ytaj6Ay1cK994d
 h2oVBkkw6WtPV2d7KuYD8N7JpA==
X-Google-Smtp-Source: AA0mqf44qDADYcbcErOKO4f1THlbbJ0Qbkf2oOidypUvsQ4ltBNeY7SL3mw7aTGkms7BkKrITifFxA==
X-Received: by 2002:a5d:5111:0:b0:232:be5b:44db with SMTP id
 s17-20020a5d5111000000b00232be5b44dbmr3931759wrt.67.1670590290559; 
 Fri, 09 Dec 2022 04:51:30 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 e4-20020a5d5004000000b0022e57e66824sm1538868wrt.99.2022.12.09.04.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 04:51:30 -0800 (PST)
Date: Fri, 9 Dec 2022 12:51:28 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ye.xingchen@zte.com.cn
Subject: Re: [PATCH linux-next] backlight: use sysfs_emit() to instead of
 scnprintf()
Message-ID: <Y5MvULWEnqp7pzft@aspen.lan>
References: <202212051556478226726@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212051556478226726@zte.com.cn>
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
Cc: linux-fbdev@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 lee@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 05, 2022 at 03:56:47PM +0800, ye.xingchen@zte.com.cn wrote:
> Subject: [PATCH linux-next] backlight: use sysfs_emit() to instead of
> scnprintf()

Isn't this a v2?

(this isn't just a "nice to have"... I ended up delaying review for
several days until I had time to look up where I had seen these changes
before)


> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

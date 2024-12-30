Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA6B9FE715
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 15:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD4A10E0A2;
	Mon, 30 Dec 2024 14:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gsFQLUyZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF1F10E0A2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:30:47 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso1743973566b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 06:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735568986; x=1736173786; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/KYkN53WI+JNUVPnu1L7iFZzO5YGuruzvwyya/+uFx4=;
 b=gsFQLUyZ6NUv81DIH1LRzUSkE54cky+o9uUDCRtw430O+wmpIYpKHJVD35zvg9p+5s
 YEEANSK7K8Qc4Cbt5Z+g0RZrN4yQffQyuogAL5rdMpvuZTM1sVnm57RKLBkTmgfAyDF2
 I7XUxeAvN8F+f8EhoZKZtqCjdGjA/dmg82ku2goH/WxfYkQHS0Vtct4c/VbQOGHd8Afm
 hcSr0Fg8B+2dKcq6+G8713VvU5OkfZ4qT11pwFCqEN1wpWGtDC3+APPZyUhylDHsOlbi
 fTlRzAStnkxf6L18BFBd1rMJqDXvSl6xus6+KrMk2jrx8wHURqZ3UDPl3j+QSy/TmR9O
 dX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735568986; x=1736173786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/KYkN53WI+JNUVPnu1L7iFZzO5YGuruzvwyya/+uFx4=;
 b=tU0msipnwIusAwKFXqM8/WxPZSs4cE/bwsmgMTt/Q9IozKCUGcQCqyPVxbQIZN1XSA
 CSU1n4StB3KG6PIQRgwfjJcgUtHbQXgHg/4YNKglSpu2eamZfF92Hck6jcmOPz8sCQ5F
 CHdrMtQ9FH5MkhS5T6wo/yFU6XgU+rl21v9DjAomwth1VHYk7x7lyl8GsCkxgBW6uO43
 UhsmLCTUxd/fEiJPu6lQulsmgQHUiH3+4hxekxfyvNLGeFFTh5fsgVU7jyikjSlaP+sb
 aMNOysiljY9Y3C6DkFdJDgncCSXK2zE2Th2OYFZVRmwZVhwIbF3O7XWaD9aMZxDepfXd
 fweg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Cy4n0R13Q4eQPGuZnw0RFvyyrquoEimP0UEAEY4MOgXDzZvld3aubu469Zhl7pu4t+HuM40kWS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyixot1R/ktCDcF4ht+xEcFZ0hnxIn87wYsFrvXG8sRd9wYVyKl
 H3Bzn0tc+OtK0ZsoPHysRyl7K4ThcqM/8L97wPvuqSnzJ0hlCREe5rsmPaO6oqs1vzs7ma5hwES
 o
X-Gm-Gg: ASbGnctJr2SlkhrZxhQQ7/1mRncYUYo0tt1XkiiLMH0pN9kitPw2/5r3VVC0U1jYYGG
 qFoPP4mG7n/miEdlEhOsls8cCwv+a7AleEvVcHdDf3DiMavfhzElMt8kfCR/Kswn4J+UtTFTNV+
 R+pW1AuPic8Zkw6ZW766Vcfmpv9sHotv0edaOiTNfTr6BMj8rjYsJKfGElwyZ2q+dJamIJOy5wS
 rJVm67c208etkgL4yhrl2JsUO+Zv/0zC1QEtm3dClR9D5DT7HeIOHTMOu+8wMya20uQyb1E7wE0
 58l/w38379LtkaRVhUG/LNlZSsCYgAWz0euH
X-Google-Smtp-Source: AGHT+IFuphrsUAmtBsapn4MuuZ4zkhPDCYfwZQ1OQx+nK20jXRfJS5fbhwKtwh7lTAQAKIeTPggikA==
X-Received: by 2002:a05:6512:334f:b0:542:2990:722e with SMTP id
 2adb3069b0e04-54229907232mr9337220e87.15.1735562010862; 
 Mon, 30 Dec 2024 04:33:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5423d3b5697sm1688236e87.133.2024.12.30.04.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 04:33:29 -0800 (PST)
Date: Mon, 30 Dec 2024 14:33:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 05/17] phy: phy-rockchip-samsung-hdptx: Supplement
 some register names with their full version
Message-ID: <nr7ilsmyu5kubahmq5pjscgpf5wrnzn456zoohatpftr2zjpfv@fl2mx4y3cel5>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-6-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-6-damon.ding@rock-chips.com>
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

On Thu, Dec 26, 2024 at 02:33:01PM +0800, Damon Ding wrote:
> Complete the register names of CMN_REG(0081) and CMN_REG(0087) to their
> full version, and it can help to better match the datasheet.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

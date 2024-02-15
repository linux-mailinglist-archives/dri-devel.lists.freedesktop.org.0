Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BEA85628E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 13:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834FF10E6DE;
	Thu, 15 Feb 2024 12:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ta9fjbLa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74B910E6E8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 12:08:51 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-511898b6c9eso922364e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 04:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707998930; x=1708603730; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CMPSk5mRkCdtbGnML4bam7URPGZ7ac2FrMUz1ttH53I=;
 b=ta9fjbLaQUUJg4pwzLYmLMn56B12Q3VG/x22f24SwPzF0NnoW2/SFmJikdM7QPA+9W
 CIN2CRR+cYdH0kbg3P4MGcZ5dXTQjjbNH+EXubSOJzvb1OyOadh6IfAm9+xy/wLOAzhE
 betJ/aWwifLHxw7sS35rI7vSsTUunX/DELLZmXWbZ2vB7aayxYmTKOUNUq1/uD6HpFFd
 AbmpkRrd+i+DnZ8jkH13KWwwl18rv0DWQfJLg0yghxjFfO7CFwFbkdX8dMxUapm1n8GF
 s6LZPCEOpLHrrLM34p8gMhI42Bd5MkrFFKsEu7OWtlHYYHKOY08wnE/xddmBVsWDxuZV
 PWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707998930; x=1708603730;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CMPSk5mRkCdtbGnML4bam7URPGZ7ac2FrMUz1ttH53I=;
 b=YOkwxESANAAXA6eRmHPn5sNH1gb0rcHjuRspHSsmKs2reVvpLCN0Ep3FQvkZ1thgrL
 74M06I5mLngckCt4rLQmcjtSwMyro5L/gVNJIaWUFXmzXiu4dk8ppQTY5Q/RnAU4q87I
 Nwbemi3bdU3MMAejHv7uAH/cQPBFHL5g1zGnWFhJXFW1DD3kLiJYtkMRCks/E9Go4Dua
 7Qk+4gEJTGdSbIse8VsPivNre54ZZSI5IKcSZH+xKfrMR+6YlhB/Bpux5GGCpz9NSwSj
 Fgt9HuRtLEpm8kMHS8ah2Sf4SUWU14BsE7A//mCQhQt62vj3xaRRM3leyshhEJFqmANC
 VNeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuXsfR74+rAFEyUBLfFh7RtpgayXKO6Zm04+u/c8P7lQ2tH+hqBA38t/m7Uh7xQuWqpRbyR0ef4ZiBSKEAPqbjGxUDxfzcgPMM9C9fpcCK
X-Gm-Message-State: AOJu0YzrTL73cYZabC3HCCUY572lX5sHXgBEoYQn/NybhhBm3XHXtNdZ
 +KVyXNYXq+cwr3PgW1ywvuoaPfVjnSw9DO27Di2YwJ8ExDkMnIAUS0VuFl+zCQw=
X-Google-Smtp-Source: AGHT+IEk8U8CzLPp2+OgEkY6TQx1yyJAi+cZTYkgA0XB02c4f/pVDHTN6skxieBxdeZZPbKcDe7kKA==
X-Received: by 2002:a05:6512:3685:b0:511:8cd7:e17a with SMTP id
 d5-20020a056512368500b005118cd7e17amr1067467lfs.36.1707998929916; 
 Thu, 15 Feb 2024 04:08:49 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a05600c4fc400b00411d0b58056sm1879272wmq.5.2024.02.15.04.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 04:08:49 -0800 (PST)
Date: Thu, 15 Feb 2024 12:08:47 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 06/10] backlight/pwm-backlight: Remove struct
 backlight_ops.check_fb
Message-ID: <20240215120847.GJ9758@aspen.lan>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212162645.5661-7-tzimmermann@suse.de>
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

On Mon, Feb 12, 2024 at 05:16:39PM +0100, Thomas Zimmermann wrote:
> The internal check_fb callback from struct pwm_bl_data is never
> implemented. thus the driver's implementation of check_fb always
> returns true, which is the backlight core's default if no
> implementation has been set. So remove the code from the driver.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>

Yay! Cleaning up platform bus legacy at the same time ;-).

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

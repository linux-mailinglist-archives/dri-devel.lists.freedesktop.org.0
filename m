Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB411996C91
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 15:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C64110E726;
	Wed,  9 Oct 2024 13:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LcaYXt58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC0F10E726
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 13:47:14 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5c896b9b3e1so9467655a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 06:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728481633; x=1729086433; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=txQkDRS98qxQSlLjIHl1ZL3viMPBW7fCCoQ6NND/4GI=;
 b=LcaYXt58o4KyQUxXeGhseCX31gU72HhbaPEVIWO0mUYHYJUjpU8vhRvC8nq2kpx6/W
 niwSmcZ3BTJBOlXq4YE3T+v5IYMQXHpwOVm9+++z7juJrc+NDAnNTLc9ecTez94OsTKD
 cifxcYJlFu6EnON0XTDocbC5J2Io2sCzv9Yob/Zbfzlvl0iJmqqPaUEhdOWG9m5y1abt
 rFQIx0XTDE8LbDFfBg44h6qmB9n5WSsiIz1iRBgSei92KMlquzRpr2IG0cJ3+K20/0Sz
 /peNSedkBshq2b2OgruYRZ0Pq3iUnZMOCnsbN01+NGK5A/HgvU2PKNGOyzCtZM8dhHsn
 Oi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728481633; x=1729086433;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=txQkDRS98qxQSlLjIHl1ZL3viMPBW7fCCoQ6NND/4GI=;
 b=Dgn6iVSxw2fKk/aBKDgC0GTP0N8eKCiaDHwNREtSYtT6a6xy3c3d8NfNuxHXF7oLDk
 YeUERnK77WRBsiOC/LcotwPVPh1Gl/hcNQ598IhHmEkrrO3ps5JrCU7/EPnKzt8xTCA3
 srplcc8653joUaM5QBfsD3Oh+gWorKZjnLM+b7uGpq8yoQLaEaboAFFYt91yqoMJvh9T
 z8v/YcXjBTvCpT7ya8aD8czdpaSzyw1aft8MQPH7lgRxSwbiWLefRVexrTLn63sPsx/P
 c8tzJ+p/Ugrf2JiWLRDQaePcPNUKLk/ig5kU/uYHDEaSahZB+YfqhgLEYsBQOWheryMd
 zzxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbygVObymGPIOLKBJO2UgiMjSUbb7u9E+7eGHUoZS8j7aIHgeuCCW4Lt9mXtfvHDv6NVQp601Qruk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvJO6UAyV+UJqTzYo1nF2Vj1huoLh8swjUD3OKYfkIpIlnByy3
 2612SENE68k3qjXCnL00/DO9pbO2D9+LQE7zrvOTrugIS7GDNUGOasotpRnUf4o=
X-Google-Smtp-Source: AGHT+IFkWiknZr5mm3FCX6LuZw6eRJb1JJkxWWCDxW/CnP8EG2UoaocNNAuDZ7WJQ9/IeyPs62+vKQ==
X-Received: by 2002:a17:906:d7d1:b0:a90:41a5:bb58 with SMTP id
 a640c23a62f3a-a998d19eb5amr227845266b.16.1728481633056; 
 Wed, 09 Oct 2024 06:47:13 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994f4b91aesm462581466b.194.2024.10.09.06.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 06:47:12 -0700 (PDT)
Date: Wed, 9 Oct 2024 14:47:10 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: linux@treblig.org, jingoohan1@gmail.com, hdegoede@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: Remove notifier
Message-ID: <20241009134710.GA16179@aspen.lan>
References: <20240919232758.639925-1-linux@treblig.org>
 <ZvKgo8RUImafDRPE@phenom.ffwll.local>
 <20241009102230.GC276481@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009102230.GC276481@google.com>
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

On Wed, Oct 09, 2024 at 11:22:30AM +0100, Lee Jones wrote:
> On Tue, 24 Sep 2024, Simona Vetter wrote:
>
> > On Fri, Sep 20, 2024 at 12:27:58AM +0100, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > >
> > > backlight_register_notifier and backlight_unregister_notifier have
> > > been unused since
> > >   commit 6cb634d0dc85 ("ACPI: video: Remove code to unregister acpi_video
> > > backlight when a native backlight registers")
> > >
> > > With those not being called, it means that the backlight_notifier
> > > list is always empty.
> > >
> > > Remove the functions, the list itself and the enum used in the
> > > notifications.
> > >
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> >
> > Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
> >
> > I think Lee Jones or Daniel Thompson will pick this up.
>
> I will pick this up with Daniel's review.

Thanks for the patch... sorry for the delay. I just bumped this up my
TODO list a little ;-)

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

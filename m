Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF85690783B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 18:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0106710EB12;
	Thu, 13 Jun 2024 16:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U/2682FP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E352710EAF4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 16:24:48 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-35f2c0b7701so816387f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718295887; x=1718900687; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xm9fvtFl5M9ClXulLO7X4Jg5vRT4Wu2KsAzkRuWsuxo=;
 b=U/2682FPo8Jx6MyRJP1HFyb8wDfAvr8JKEB4NKxnPp75QpqBQHYxTfxeJLwbr+4zcz
 fhwNyRmPkFgdR+sto1iseoPVKkCH2ZgAeB0hibQbvqzwh0yOWfNbfJuJVcBQlVolUr9e
 NERIAxfGdEgFl177qfYEV0h87OAzqPzYPYJSvJS0ve0/IpeEDVhVQO6MDLQw0FXR3+j5
 1F7Zn36IJNcxwAzgzjmYmuYAx3FGiWJrMh3UJQTy4tnZk7ZojST+hK1fZhp9sB1ukVzc
 5mYzXaSvrEac9iOE3aUWS9APqFgvmhAGsYECdu9BOTKdJ7KUqhRCYgCWX+sMADX2G2BQ
 9sLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718295887; x=1718900687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xm9fvtFl5M9ClXulLO7X4Jg5vRT4Wu2KsAzkRuWsuxo=;
 b=JRmq3n7yTjz43YaPgOm/nplD92+5pQtbLgE4MEJXt5wS//mc5+rAsNF6uK3YzQugPZ
 HU1WVC6vFftO7Umwz2GktgBwV54lCRRnyhd8TmLeasfNiSAvNJUwnirPBtOXT4161EDa
 drlsyLarRiny7n4mp2S+YmRfvpM6hmrkHZRmY4fN1tiNamOPmYs63gdASUnZfR2xvy6D
 OEbSmjubHJ/Gz9HOFz0rdWSuPn5erzsQ0uRA8ZPcSmZaglP+pcmCoCw8n/LjkMIoik30
 ZPDjRClD/hIY4kb+nx66T3/6wwfqFeneiGk6/t+GWaF+LYer2n+u7Jy9/owjeuKGKQuU
 p9Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn+zRtB3TUsZZ/Mh92bpIwf5u+JIOr1nIy+4jwHx6WNFZ38QdeaxOfWMahzXYjBDBOEGi8J55e55BiTRxSdMBtrqVqC6fGdP6PH6idtWEW
X-Gm-Message-State: AOJu0YxG+iAyUgDUeE7lndOH3gNMPctVgZGeKlxzlS9AgDHpt9lqktjh
 Cwj3dHuSIZ0iHyfnjBfaTfMHBUmkwFWaCZanNrGNiBxN2rw4SjSpLJ7rt2rZC5JVE4AZxQr9P87
 NOMo=
X-Google-Smtp-Source: AGHT+IGBrxpjL2E0pgPBIEJnLIDsTzjWGoMfXeByIRcty/Uu7p3y+ZFY9bPpjqA6DX/92MrGE37OOQ==
X-Received: by 2002:adf:f88c:0:b0:360:7386:1a49 with SMTP id
 ffacd0b85a97d-36073861df9mr2356972f8f.32.1718295887142; 
 Thu, 13 Jun 2024 09:24:47 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750ad20bsm2130332f8f.54.2024.06.13.09.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 09:24:46 -0700 (PDT)
Date: Thu, 13 Jun 2024 17:24:45 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Patrick Gansterer <paroga@paroga.com>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] backlight: lm3509_bl: Fix NULL vs IS_ERR() check in
 register() function
Message-ID: <20240613162445.GA24098@aspen.lan>
References: <187b5bc5-a010-46c2-8ead-980df9efae79@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <187b5bc5-a010-46c2-8ead-980df9efae79@moroto.mountain>
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

On Thu, Jun 06, 2024 at 04:10:23PM +0300, Dan Carpenter wrote:
> The devm_backlight_device_register() doesn't return NULL, it returns
> error pointers.  Update the error checking to match.
>
> Fixes: b72755f5b577 ("backlight: Add new lm3509 backlight driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

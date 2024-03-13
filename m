Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ED387AD7C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313BA10F4FD;
	Wed, 13 Mar 2024 17:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WdRGz0OM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B52F10F4FD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:36:12 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso83877a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710351371; x=1710956171; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hy3ZcXqWsGnwgMjCN3gWHOD5wGz+6TfcBmfAdzS1Ayk=;
 b=WdRGz0OMVshhp425GkGkMpNieSME1hbABmukrPb9S945W1yNMYQ8Atcg2TOqktta5a
 fYoHhUXQ+P7tFeeXCa4cqRiSYaXj06yMnav5YmjFPxaE9Irhb1XcBN5VIV75CVdjbNjE
 3RmSLkz7BTvs6tvcOkijptRjISL4MNuZ45F2YsCY7fdBsTc/bE2wpIIlbcW1Ux3oD/I/
 lb91k2QG0aMX4n6D6AxBQDGfwRNmJZ81DuRlTVrE68A5An0aO1GKe60+nsjHwtLOga/w
 Xx5eyc72xfFSbT2m/9zya1dAtPfOdg+qnQ+hoHfYJwn+sDbweYEqbvaSwxoyruetfFGY
 SSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710351371; x=1710956171;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hy3ZcXqWsGnwgMjCN3gWHOD5wGz+6TfcBmfAdzS1Ayk=;
 b=hz2xTnvPdjOT14gCqsxSkOM7PGog+4gw4ekqrguBQGHEyYo96Lrncy34/5XOK9dzsX
 lCuWV2NldGuT69HcW/mI0fW3FvrdgvLSM4l52lit/A4PxF2P9DFdKqSX1xGqnk8tiO2F
 6kuc1qWgLlZNMYy5dIyslx9dWNMjXLxqsT5SY5pItTD2P8us/2255/PIjrOgBqHQVsr9
 V8PGgYfKYkJisSwVaYnefub9PshHwC0Jlubl2ajP+lYqd2i7BRM/Ks3OMMC67mS58+h2
 E2E+SroR8FJIYtgvRMYSfnmo7nNkacWVoZ7coYvsXsYA8AAAzOrtGJ8YCAmPdn5iCpJV
 Wtiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiofBGDRQu940/6TbfVG8ud47YbLqKj7QWNt54+0HSGoiovt8UP8E4EExg1XPFE/fSXyeIJi/kFJevBrf+EUBZiaz1TZSyULOFVXyNfvPy
X-Gm-Message-State: AOJu0YwwRO9XKu3SebmrbwFsZ+qk//wERs+qcnkdaKsgEJ0mlJgmiaLp
 ShFJ2rhKsXySHiqeezxmJMnnh2ZpdGd3ogxauyf5jbLreHrC+Z+45i+d1xKh38n59J6YeepdiIo
 0
X-Google-Smtp-Source: AGHT+IExQoPPhPaloxTdBAgfGGayI9aL78L5ibhJ6FmItWzqbpizfE4VIcY03GGG4q3JsKWFKpVR0A==
X-Received: by 2002:a50:aad2:0:b0:567:f643:fc5c with SMTP id
 r18-20020a50aad2000000b00567f643fc5cmr9870160edc.20.1710351370355; 
 Wed, 13 Mar 2024 10:36:10 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 g16-20020a056402091000b0056886827496sm764414edz.70.2024.03.13.10.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 10:36:09 -0700 (PDT)
Date: Wed, 13 Mar 2024 20:36:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/6] backlight: Remove struct backlight_properties.fb_blank
Message-ID: <8c6cb7ac-54ee-421d-b36d-644667309310@moroto.mountain>
References: <20240313154857.12949-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-1-tzimmermann@suse.de>
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

I was only going to comment on the staging bits but, heck, I reviewed
the whole series.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


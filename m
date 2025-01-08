Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCD2A06459
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF4610E912;
	Wed,  8 Jan 2025 18:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FUNF+OC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE3310EC64
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:28:41 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-aab6fa3e20eso25758466b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 10:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736360860; x=1736965660; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IwQrVGC4AevRuhRSD9REIQqFf4rX/3i8qI+WqGHpZXA=;
 b=FUNF+OC7C1aSqvnyC6EERgWKlFd32v3UfDIVnV/LUI/ij0WHNQU1AcBuOxlY50c0K4
 GHdYSFlNWciXM87FGB1YK8aYL0Tl2G3Ft5Y44qQYeYDjSiCknhsG2I3hPOkLs6WBz0B1
 dWoWubRD9xupD2ohG+momDe/qCJvF3prv9+zNbQfJD0GwhEW+N12w3d4dSTKtV27AXQG
 6LYXHb6bj5yYPAewK4YPI7PDYA6emK6ZatjcvZRP6qgZUS+/fEXZgol9k+Eqs2YzEDwj
 yEZIzGvvcO/JB78A+iBvaHNIAjRkEPLWtjb8eQPz7wLERrA5fFU6gtNu8oLlz6EZnbNl
 PSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736360860; x=1736965660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IwQrVGC4AevRuhRSD9REIQqFf4rX/3i8qI+WqGHpZXA=;
 b=ILYsesq0sTQg2J01KFLxoEHFTdsjdYGAsLdcwqULzAqcRpNzogvL9Aqq7jlNzPhDJe
 jzfYxpxoz8BRgwBMYKqxcogMfJqx2hRAveYKAKL8wtvcSZGymFP02Ipeq5tW/nL58veQ
 Dl+/nmokof4andRwvXNVYZ8ekKN1Vve9hQLkfMjKOCreB9XnsOXgOIb35tJum2tayQmd
 vCasIYTRY4Ta+sViJsyEAhS1bYeB5pVGDVMzAm0UyM0eve/NF46e/f8/N9kFWlxHj0Qc
 UhNf077lJoCLsOYLmWn5ExfmviBAyDkB9zm7hMmmRUpiW+nL8reJHZ0WpeuZcn/L8Hj1
 Uu1Q==
X-Gm-Message-State: AOJu0YyHzvQGapOfKES50xc79/XaiLFU0VZ2WJSt3JBY+ddLnZudhxFF
 wMT0Lz9YUFn1miuPh6LW3ckQdmSzefH1ZsbHeqChW4EkZOV78BR8LUbS8JlflZuKxsH0++Mkh3h
 I
X-Gm-Gg: ASbGnctmUSQjN3tzSBi9lGzYKl/Be/GxsSxZTMIl/yv7+rEampzMB+kORaeb+tIU8eb
 hI8LAF85CpkQSAlb4UWxSS6hw8YSY/wCg/ftAcxtLo9j9n01yBMaxPn1vCbkZSLxb1Dw6M0IOxg
 18yAKh7mqDYfLVEmTboBu2rQF1HNF6JBhynMQjx1EyXUrLYUvoxhaxeWDVbw3t3x7mRYuVZeVTV
 Va/kjVknlKxyU1XnJuZsX9OTPxzeUGeYZkLn8Kr1DI3ARlplEItJ8CqyxQFJg==
X-Google-Smtp-Source: AGHT+IG58Q2MvlWvOcXuCBSbp8/vm5v768G9RtuYqUVooan86JW9q8PNa1S8wicALdCoUNOk2Qct8w==
X-Received: by 2002:a05:6000:2a3:b0:385:efc7:932d with SMTP id
 ffacd0b85a97d-38a8730faafmr3128032f8f.46.1736360385446; 
 Wed, 08 Jan 2025 10:19:45 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2ddd113sm29407735e9.25.2025.01.08.10.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 10:19:45 -0800 (PST)
Date: Wed, 8 Jan 2025 21:19:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [bug report] accel/amdxdna: Enhance power management settings
Message-ID: <2709d6f4-ece7-4def-b5e7-e99f4f01bd8b@stanley.mountain>
References: <202267d0-882e-4593-b58d-be9274592f9b@stanley.mountain>
 <47966a55-0272-b4c7-3717-fabf85cc0f3d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47966a55-0272-b4c7-3717-fabf85cc0f3d@amd.com>
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

On Wed, Jan 08, 2025 at 10:14:47AM -0800, Lizhi Hou wrote:
> 
> On 1/8/25 00:40, Dan Carpenter wrote:
> > Hello Lizhi Hou,
> > 
> > Commit f4d7b8a6bc8c ("accel/amdxdna: Enhance power management
> > settings") from Dec 13, 2024 (linux-next), leads to the following
> > Smatch static checker warning:
> > 
> > 	drivers/accel/amdxdna/aie2_smu.c:68 npu1_set_dpm()
> > 	error: uninitialized symbol 'freq'.
> > 
> > drivers/accel/amdxdna/aie2_smu.c
> 
> Thanks for pointing this out. I will fix it.
> 
> I actually did run smatch_scripts/kchecker and it is clean.
> 
> Maybe I did not use the correct command. Could you share the instruction to
> reproduce this?
> 

This requires the cross function database which is simple to build but
takes hours. ~/smatch/smatch_scripts/build_kernel_data.sh.  Each time you
build the cross function database it adds a level to the call tree.
Having a one level call tree is slightly annoying because it give Smatch
a false sense of confidence.  I rebuild my database every day.  Probably
seven times is where it stops adding data.

regards,
dan carpenter


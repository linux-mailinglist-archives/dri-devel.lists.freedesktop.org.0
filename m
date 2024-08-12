Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB1994E72F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 08:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E9D10E036;
	Mon, 12 Aug 2024 06:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FgplDMlQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C78010E036
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 06:52:28 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ef2cb7d562so39639621fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 23:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723445546; x=1724050346; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vYvutISkLRUGH6JLFpRcjOxTE3aMRs9JKjHJPpsTDJM=;
 b=FgplDMlQ/LH69T8ymWcK0F0psl2K44qcOrGvyn8TSRLIKFSbzXeeW6QAQRTJkcMnl9
 D/lFMyhWh4fyIvSrECPO6drTGMAnLXErmZCF3PUQSDCn9ndIy+43roihnCBSN3TKS6Hx
 NNCKNvksKDRTeTVltnX5LUJbcCcteRuDmESIFvLt8Q0NVeFgmOf277M+wuh3r0EGccX8
 n85HItIVS7XI3i/VcCPF09eCXlaMH8gizoss5PgCxIY4QgoWHJGbetfMV8BTEC8ftajm
 IdBD5Fy6BjI92ijhmUzLtVB7JXY6Q7KOjtguwHlqalrf7t3Vm/r5MQnov/6Ganqn2IBq
 L5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723445546; x=1724050346;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vYvutISkLRUGH6JLFpRcjOxTE3aMRs9JKjHJPpsTDJM=;
 b=nerq+dmqjDhXXUcdShQ6tNr4gYzP/kQk7R0YIrLbJdDiO7eI5XH9ECMuHSHW1O0emF
 eR7WwJiO5CtH/CV6xlUrhdDqV7CbDnYV59QdGuxZRqzJGDQdOvakGvKhkxXBjWlc5Vjs
 gjOWw8RUoh3pb6Bdt2DNKi5LcRL7IUVqCDtNY8lkEjxgJ2OqBTc/Wr6ePHEZcJcXDuG0
 2gNIIu/RekSX4ObopU4HMME+DDyoXRGJqhVQJO2GfMAY7PzyF8tXwhlm+pGzHsO01sQ0
 EZ61/3w2bgaxHeJHBKUkiAacJalb9bY4KIVh1DHvI3+9K2tLinXzUdVu4I/ePn4vaDoX
 Y/Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsQ69HoMDLC5/H3WBh+CtM4nTt7hFgyGA51ROCM9NeG+fsCHUvRb7YOVzGnsPnCgR4Xd4R3zHfG5cunJibHUL7jpATGzbXJyNOG54dI59a
X-Gm-Message-State: AOJu0YxpGdsp27XvmEf1YHfmUM8je3Rt7gnZbbmqV0qGIRZouUQgVPYV
 zyq622Wa5gsgvbv/vjUWHtLMLoNvI+oPyhg6uTwiLtWRfpAfga408ME72wCsofI=
X-Google-Smtp-Source: AGHT+IEhleIQEZN/9JGTRhxG1EPnf++IP7O/xu5A3Y0gWPhqCZnhmQaXR3vNN1OTOTN5uX1Y1o4fGQ==
X-Received: by 2002:a05:6512:b02:b0:52c:adc4:137c with SMTP id
 2adb3069b0e04-530ee984de9mr5848753e87.20.1723445545776; 
 Sun, 11 Aug 2024 23:52:25 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd1a602220sm2012351a12.82.2024.08.11.23.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Aug 2024 23:52:25 -0700 (PDT)
Date: Mon, 12 Aug 2024 09:52:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2] drm/ast: astdp: fix loop timeout check
Message-ID: <989ba8b4-19b4-4053-bb00-ccced42a8829@stanley.mountain>
References: <9dbd4d2c-0757-4d5f-aa11-7d9e665e7633@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dbd4d2c-0757-4d5f-aa11-7d9e665e7633@stanley.mountain>
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

On Mon, Aug 12, 2024 at 09:42:53AM +0300, Dan Carpenter wrote:
> This code has an issue because it loops until "i" is set to UINT_MAX but
> the test for failure assumes that "i" is set to zero.  The result is that
> it will only print an error message if we succeed on the very last try.
> Reformat the loop to count forwards instead of backwards.
> 
> Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during atomic_enable")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: In version one, I introduced a bug where it would msleep(100) after failure
>     and that is a pointless thing to do.  Also change the loop to a for loop.

I mean this version also sleeps on the last failed iteration but at least there
isn't always true if statement to try prevent optimize away the last sleep.
I'm okay with a sleep on the slow path but not with pointless if statements. ;)

regards,
dan carpenter


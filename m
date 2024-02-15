Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07446856288
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 13:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079BE10E6E5;
	Thu, 15 Feb 2024 12:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xF7ZtNTQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AD410E6E5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 12:07:01 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d0f1ec376bso8872321fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 04:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707998819; x=1708603619; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6HsBMbgzYfxwG4TUH3pKnkkz/36cZRYAsjlWFRO45NM=;
 b=xF7ZtNTQdTdc2fJ8+7BdU7Qcoy5fmK9nMHGZlZ7d4kHEXICKophS41U7RWCbmVpeKP
 mcI2b2qJHKSD2lPRXbUJnZFmpgHIpLxBilf3DY4jaYZiyyQ4HcapAIXmygII9gVASC5y
 ZZkHaFihUxQ2fF9JRcWvI0hWr3RYGRorQc7QexSiufrUikK5xkSAfoYll6L3vo+Xb8UF
 01RD1b0GH0Yg2XrPB5nGKY7hP3L7czeHWQSRpoJyZsR5foMjQcbG1+JgFnnMkv4LDKH7
 p4haDv3doEaakiQuOOO/SfdxsC82+SeIXSZoTQmxv42HTqnJpTCSayaNnPpDD//I6F61
 YcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707998819; x=1708603619;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6HsBMbgzYfxwG4TUH3pKnkkz/36cZRYAsjlWFRO45NM=;
 b=vzNnGDv9VCq73ACUqaYLROZ2XdgOL2s4TcN2dTFZm8qbBsgeMw5rQLabe6O6bkKZ6y
 P78rwKGT0JjNLzlq4hO5FvCvrHU0LqasXilZggIEOdu4Ptk6ubokuTU/siAFUqOqmARD
 GF3rVTx69dOSqAOZC7+oFIJyK08iIfZIMA3l8wbJSYEl7RiaZbc7xpKzShOaAsG6dKmj
 PrCOup6n/tUh9w9Ykb41K7yr4hafaMYkIjNlloFn/Iq+B0qkhAgObIKNIRWbWkmjpajX
 delukDnBq4p0FW9uekcDKlLF1+FDpowkmqaiokKZ5O2cAvlPYeOdI9fpPTC2q8KweQcM
 Vihg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfGW2pwQs6JDLYAS6p72iMPUFJ0QYosQxkGitoPsV2gMuyEdl0Pz3CzX8/6fToAJm60MWUHX2sbZmuSl3ZpTYFyVeKH4dVv6t4ne+lIXDO
X-Gm-Message-State: AOJu0YyPKFLCGahe3lIab147My42LaQ95sil4ihr6oPfASFEM72XRnyb
 Crg23N2zUkRA/GSKpfT1Tge/ptuf6gYhd0jJHs6AoWhS9PdfgitGB17Nn/aSfVw=
X-Google-Smtp-Source: AGHT+IEvCAE2Hh2zJZuwx6DONXdXfWx3DTN1g6LukJQSKZzMSvJwK0E8L2N9izM+RVK89lmD04+0vg==
X-Received: by 2002:a05:6512:3130:b0:511:82b7:9fb7 with SMTP id
 p16-20020a056512313000b0051182b79fb7mr1408077lfd.13.1707998819594; 
 Thu, 15 Feb 2024 04:06:59 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c450a00b004122cfb5c5asm171291wmo.12.2024.02.15.04.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 04:06:59 -0800 (PST)
Date: Thu, 15 Feb 2024 12:06:57 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 05/10] backlight/aat2870-backlight: Remove struct
 backlight.check_fb
Message-ID: <20240215120657.GI9758@aspen.lan>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212162645.5661-6-tzimmermann@suse.de>
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

On Mon, Feb 12, 2024 at 05:16:38PM +0100, Thomas Zimmermann wrote:
> The driver's implementation of check_fb always returns true, which
> is the default if no implementation has been set. So remove the code
> from the driver.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

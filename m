Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D311C8083DD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A12C10E105;
	Thu,  7 Dec 2023 09:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEF210E105
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:10:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33340c50af9so689035f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 01:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701940233; x=1702545033; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kVL972CQGLcSJW3AciqVNZzuMMM19Q2E2yNZVzQKrFU=;
 b=K3Y1WCYbWkL+UlTVUJDlFNfrSppsWzAzoeArNxcPUqL0Mrv11/KwGwcz6J6F0ZY5hL
 +5WaEhtdrmYd+BKbsFnMbk821b533gYWkgCyVcmhYbQEO8PEVgt7f44iND5gtKSQ4OgF
 d0KElIAbNb1PAiPrVYw2SVlrkAVeZvB7pSkCnEpU/o6Xtf8LwmsIxkGAhbIW3NRhigBD
 lUw7XaLGH8uK43x/wXHvi856N3gx5KUfwXybPYwJIlkBYd5SjeFtLLf7jSioo6MTnZmQ
 rKhaww9/B0W6jHABpOf1B+fwq4dgenMVTs9Mk5OcWDLNklStJuXwK/RkKFRbM/A8AGJY
 lrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701940233; x=1702545033;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVL972CQGLcSJW3AciqVNZzuMMM19Q2E2yNZVzQKrFU=;
 b=SosrWDN3WCD2QXbYk0wQuOLCfrnawIoNq2snjaen0QsYyHaaEcAFtsu0t2nQJqcVaR
 VTr7BUCrHP72nko5Rp+LWW0WHxjedDrY+IIzU0HNcJTamB3SwgcFL/mpQ93DaEpG6rk4
 MIOByk+ljdqwbFVJvKVJonc4n3R0E2a1kdEQ4dmS4A+aorWG9+jYMI151pzc8UjIlcXd
 2exFWthLLuPF5usdqNs6vpcqF0ogoFkQW/BsNN17JMERvTiG86AJTDPbMPfeNd6cnG1p
 rW1twaRz0MH8gGwEsRftBUuRLFph8ADv5dLnhhGPEvcNG63z3+h8B/8gWJ6x6eIrdpOk
 vuMg==
X-Gm-Message-State: AOJu0Yy9j+k0zvM1vpdFZv8H/+NXzxX/x2AW0VFFxrxd1ejwTD679ruz
 E20zsvwdBt4vJFANVEpTTAWvBQ==
X-Google-Smtp-Source: AGHT+IH+IApGH4/piJWGesyPfGeXa/LPQoTSHnDHwNL1K1eexST0rVyhW3P9trJFOjmQKc/vrkG3AA==
X-Received: by 2002:adf:fe8e:0:b0:333:41e2:6221 with SMTP id
 l14-20020adffe8e000000b0033341e26221mr911521wrr.102.1701940233141; 
 Thu, 07 Dec 2023 01:10:33 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a5d5252000000b0033330846e76sm887112wrc.86.2023.12.07.01.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 01:10:32 -0800 (PST)
Date: Thu, 7 Dec 2023 09:10:34 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] backlight: ili922x: drop kernel-doc for local macros
Message-ID: <20231207091034.GA135517@aspen.lan>
References: <20231206174525.14960-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206174525.14960-1-rdunlap@infradead.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 09:45:25AM -0800, Randy Dunlap wrote:
> Don't use kernel-doc notation for the local macros START_BYTE() and
> CHECK_FREQ_REG(). This prevents these kernel-doc warnings:
>
> ili922x.c:85: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * START_BYTE(id, rs, rw)
> ili922x.c:85: warning: missing initial short description on line:
>  * START_BYTE(id, rs, rw)
> ili922x.c:118: warning: expecting prototype for CHECK_FREQ_REG(spi_device s, spi_transfer x)(). Prototype was for CHECK_FREQ_REG() instead
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

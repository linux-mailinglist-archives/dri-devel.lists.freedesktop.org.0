Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9ED9D0727
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 00:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9460F10E477;
	Sun, 17 Nov 2024 23:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cbSLl/xC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B904B10E476
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 23:57:22 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53da353eb2eso1637232e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 15:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731887841; x=1732492641; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kwqxsYwUO43vdOaCtFFLKl7sa6jND5eVDewqFn0TLtU=;
 b=cbSLl/xCncnSjX4j6eoK7MX1fAjFaK5zKUjlT7TV0xfDlWoLHDHeA2TSfgW+C7F+aD
 VjcPtMl7YT6v3EpBXRv3QseQBJhr8Xxcq4P299J4glEgvsIRx+KGybmHvi8u5t5TklBk
 QDGfI+56Tm3yNqRRcZSxG07NhhqbPc7+bhq+mKT7cUReRhRzGpHVTDepbFcEGH2GY8mW
 xGglwQFq4tR2Jk6jlExswqsXJuVqYDiMfFLqTatjZboxDBzj+AahsDEDLzWFJ1lIqXkA
 pRxMlQsC+iWSSIYZw8a9O+7V9PdKO80YKnd1/kmh0UZGMZahs/tJ11wBOciv4DWtuu+U
 IkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731887841; x=1732492641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kwqxsYwUO43vdOaCtFFLKl7sa6jND5eVDewqFn0TLtU=;
 b=K8HbANYi0MbO7tuDBlzEaRexBzqIWQQMqGwl1gSxOwkuFq0Re1uKNTHJ6b9TZ6jsTr
 TPcw1OMfEjiNXi2xysGqrPm9jiOl30LiOZ1OqnoI8Iqre2QMULLHI47uf0Tkr4bE20lo
 2vksyzdlRjAf/nRTkQaNkcUWJ1KZB4n1bG0aAkAk1DHrsz3Vgdnh6uUU/gniBGB4+BVH
 d8l/FNqXBBZIy19AR6JocieHXfH9KRfTM3/37WUrN0a4KO0aBu2KrDSmtyx7Mi53os3o
 eE/HQ61RtVX+OMjlutooZQyKejPJ6c8Ee+866WY8eKlyHA9X325jvT0y8JTOBF7w3ft4
 OUmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5BWPfPV1htuH9J/yB/oBfO245XN4uWI8y6wdl0l52C+Hfdy0Mb1RWTn3QISyAaWHol2NDqHQDp/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNYeE1GLlo1rltoU3XOjDOE6MDYgGlKwfGIJEGz0X23XfeeXAg
 4enkV7mCIVMWPlnHjMbL5s5cJY/EP7JqFZtYS8k7L0sJGKt3a2Ult9LGJsz+Q1Q=
X-Google-Smtp-Source: AGHT+IFS7ogIxK01B+f9C7GEP3JYj6qh422gYguOCg+9snr6BIQRNXEcNKLdHNrYNPE4FaVnXmRyJQ==
X-Received: by 2002:a05:6512:31ca:b0:53d:a87e:f77d with SMTP id
 2adb3069b0e04-53dab2a6845mr4748208e87.26.1731887840560; 
 Sun, 17 Nov 2024 15:57:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53da698c237sm1353809e87.129.2024.11.17.15.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2024 15:57:19 -0800 (PST)
Date: Mon, 18 Nov 2024 01:57:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, andersson@kernel.org, 
 quic_yabdulra@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] accel/qaic: Drop redundant vfree() null check in sahara
Message-ID: <njcfea7jb6kyixhh7mlmsyzdp3rm7r5c4jmra7uqzgjcpyp5if@jvgx7xyh2jab>
References: <20241117202629.1681358-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241117202629.1681358-1-quic_jhugo@quicinc.com>
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

On Sun, Nov 17, 2024 at 01:26:29PM -0700, Jeffrey Hugo wrote:
> The documentation for vfree() says that passing in NULL is ok. Therefore
> we can drop the null check as redundant.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410301732.abF5Md4e-lkp@intel.com/
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/sahara.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

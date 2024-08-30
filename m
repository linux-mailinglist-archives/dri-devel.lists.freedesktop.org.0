Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C241796591B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 09:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9513C10E845;
	Fri, 30 Aug 2024 07:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N7lzJz+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540D710E845
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 07:51:22 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2f4f2868783so16158421fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 00:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725004280; x=1725609080; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EMykQbUJVW9W9sXQRmc6M1cASoIaLQkUOCZZdts0xts=;
 b=N7lzJz+65UO4w6y1CBpe1EDOeqTG9gS+DGVzYFymvma/G4AH7eB5XAghcKS6XfyUdm
 OH7MEso3Xwx3ogxajFMO7Jhk5hrD4T9fVYP4UzBz5ZgsfEvoAPvNEi1M+QRXzKhhHJVr
 Xpea1xBviPB1m9ratB1VkehZs2EUblZXBYijxuYlseCben0WpjDM8z6mVSQTwlkIApV9
 J2+mIKWDQNW49rSoAcv5X9X8qogyEgOdY1fYVoMT3jmt3jDc+0cGtu8zctiCi54w2yYT
 FRTlqRIviuvh1E9Jnw1tsZhPWXefyIM0IXFJ81B0PKYIFkRFWz3IhS7jgVCq2Htj4nmQ
 ibCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725004280; x=1725609080;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EMykQbUJVW9W9sXQRmc6M1cASoIaLQkUOCZZdts0xts=;
 b=N7ZB5bPMB5EvWLTl4BlPlqKKK7OZh2bZl4NkraR3pPsjMhudDJNvk/FZG8Xt8EEvEp
 uaV3kesofGyfsia9MEtO8+LY+Uan59LUejdZRqClXvg+3/yER6MbaQ0yrD7VV4hNlls5
 zsQ7BjQoKsLwCiSdh5uP4udHV7J+yJjSms+2TJFeTaa6aTiLgbUXEM81CumXzgMv7G4K
 YrlFUUIUtQPTilkRrZkCS7m5R4S+dXc5AnpyYToRwbPkNcuXHKJVxyFLShSoOaJLCDhX
 9tJCbWftfFzSWIkK/wgTv9xqp3myAEPnFn+B542d9ESppnAzcyx3PV8exBm79MUHqe4o
 Ekuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGML9UyywzwPIsylhYEql6Th9XqmzvULvSqNRnpgegkQ5tAjNZmDeYkCeqmEe9mTO5Uw5ye+SsWwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyENpcJUQb99fVWVg2SLwpVunEAd8nNVqFaMy83m1YAlfJUnZjW
 qz5mMumbt0XSUQSAFVVwLJsmoIr4N5PQS5WggQDDTS7pTUQtxg9nJDsB8NBzqvw=
X-Google-Smtp-Source: AGHT+IFD8xmWdEqG4hdLLMpP5UGoKymovpPF1vANY5dTJv/PkTuwIIAOL72iFTwhOFpAPYmHZn+NBg==
X-Received: by 2002:a05:651c:198c:b0:2f3:d560:ed9f with SMTP id
 38308e7fff4ca-2f61e025823mr8837721fa.5.1725004279543; 
 Fri, 30 Aug 2024 00:51:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f615194f2fsm5315721fa.134.2024.08.30.00.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 00:51:19 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:51:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, amahesh@qti.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 stable <stable@kernel.org>, Ekansh Gupta <quic_ekangupt@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
Subject: Re: [PATCH] Revert "misc: fastrpc: Restrict untrusted app to attach
 to privileged PD"
Message-ID: <jof6sunnfydjp34o543jnhwz3zmjn32f6cwre3etbn27ov2mxl@mdzkojaqeteq>
References: <20240815094920.8242-1-griffin@kroah.com>
 <b93eda80-828c-4873-a52b-34428f3570df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b93eda80-828c-4873-a52b-34428f3570df@linaro.org>
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

On Thu, Aug 15, 2024 at 03:55:01PM GMT, Srinivas Kandagatla wrote:
> 
> 
> On 15/08/2024 10:49, Griffin Kroah-Hartman wrote:
> > This reverts commit bab2f5e8fd5d2f759db26b78d9db57412888f187.
> > 
> > Joel reported that this commit breaks userspace and stops sensors in
> > SDM845 from working. Also breaks other qcom SoC devices running postmarketOS.
> > 
> > Cc: stable <stable@kernel.org>
> > Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reported-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> > Link: https://lore.kernel.org/r/9a9f5646-a554-4b65-8122-d212bb665c81@umsystem.edu
> > Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
> > ---
> 
> 
> Lets fix this properly by updating existing device tree entries and bindings
> to enforce misuse of "qcom,non-secure-domain" on all Qcom SoC's.

It is not possible. We must remain compatible with existing DTs.

> 
> As this patch is only doing part of the job and breaking existing platforms,
> 
> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> --srini
> 
> 
> 

-- 
With best wishes
Dmitry

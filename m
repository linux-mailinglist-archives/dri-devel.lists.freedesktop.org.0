Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FADC86FF3B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862BC10E5BD;
	Mon,  4 Mar 2024 10:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JlAAGRrq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273D010E5BD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:40:40 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d27fef509eso59231031fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709548838; x=1710153638; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LV8quPQ0BDxx7ykFaUd7lwn+4n54fD34S7jVpq0GKn4=;
 b=JlAAGRrqPcpSWpfUzAVfRrt0tA6+qImvTse+uG7hsT4sygCtQajok3yPU66kKjBsfQ
 Dx2l/dSthtprX/J/k5cR0JGWomVchC/guSJgqSM/AAtXFfpWvntWZya74WliI9r/Nh9T
 7YJR6tCHPlD+8ZRLJ9kvcfqSb6FbPQJ5l7xTYnwiuk9ThHJ7qTAPG/S/zcmJFkAqFymq
 fhjZzwXhy2CanFxrLeOSubownqP75uGmRfnA0uM1f10yoQXuOI9myWDV+s4Vs9A3g9lY
 SDdZMtw3ZS8+obABQSscsJqQFOnp6b5aEAK6qcp14U2k/82SMbKzGeOd2Hja7uxJF7Q0
 c05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709548838; x=1710153638;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LV8quPQ0BDxx7ykFaUd7lwn+4n54fD34S7jVpq0GKn4=;
 b=Y0HCcIM45JLDqLXwWF0at9FBO+A7ou7li7UM6Jilq1vCqHSceD/T8EKLERbRAwq9/P
 YFQZRHw0xKnkuiOcWtYpNUJN40MLMRsaG1YdxAejuArh0Jnd4sYt9J+sAA1D/FXOpfdi
 a+MdiHxsrDIGrGWArdpCOxVoc4GCnlFWDKJShc/eXJQIuR+s+EJcxjf+f7BPWR0SNfnM
 EJCjAI89l5sevm0cpr+wDVEV8urp5tQB0AI6BAESxaKLw8+nJf42puQh6ho0EY2Co/Ci
 SuIez55MEzCjus8BW7xOzdOZNjX/fOtL41WKNu43zYynuM6BAwO0JtYtioAoo3s8Ji9x
 dCxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXNVbp4XzpWC+i2omBEIUrWbv1Lit15LcYC3EbO1ZKvFaPt98alhidDf3/fdKl3wkMtM7bn8XYPno+2DhlFvynGhmW8rraBktw/NsNmh1l
X-Gm-Message-State: AOJu0Yw8o/PK8H/V8SRvlDnqxcQLF2kiFBetiEQ0T1mmw6XnWZoC8Lag
 iNS1MFJr31n9hSi7WmgSFuK3ICupvGjNF4+Ck4nRaxTZmVVo+J0T7KYHud5r6cvdP3wS+4zK8PL
 c
X-Google-Smtp-Source: AGHT+IGTmL9yC/OS8kNpqDK7pMYoQDFJesM5bEsJqIwKV3qwMLEueQFYtNsHk9OfYIqoZ7jPztpoQA==
X-Received: by 2002:a2e:3c09:0:b0:2d2:9b77:6e38 with SMTP id
 j9-20020a2e3c09000000b002d29b776e38mr5294389lja.27.1709548838155; 
 Mon, 04 Mar 2024 02:40:38 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c4ec900b00412e0e899a7sm3897575wmq.27.2024.03.04.02.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:40:37 -0800 (PST)
Date: Mon, 4 Mar 2024 10:40:36 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] backlight: l4f00242t03: Simplify with dev_err_probe()
Message-ID: <20240304104036.GB102563@aspen.lan>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
 <20240304-backlight-probe-v1-2-e5f57d0df6e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-backlight-probe-v1-2-e5f57d0df6e6@linaro.org>
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

On Mon, Mar 04, 2024 at 11:11:39AM +0100, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA6186C28B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 08:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F1310E174;
	Thu, 29 Feb 2024 07:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T0RMOVev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB90A10E16E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 07:31:26 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-412af1c91f3so4290715e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 23:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709191885; x=1709796685; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RiWXS0Lycg9PCC0fyWU9eT4uTxRcxADLMUayXiNfgPY=;
 b=T0RMOVev3w1xxi0w0pHHTurWDPRslvNyUdeIbmJm1vHw7ho79OZuRseur0HB9gGggU
 oEke7vR5hdRPg1OVrbFy+73ZRPwprrklIjlXxL08Oq+NItIsDu4V7sDGp4ZKUvvJDp5N
 tXKFQeUYDBfarKjxfKbuQTm8uiR1O+8wpSfvc/PpA0WRz7ROEqRLRLXi9sc9RT5olR8M
 tq0iRCcUFfWOkNGHyDuu0SNvrJLtxwAc6Pg+S2kIgHV2udTd4dVOETLRW1uyKtWxGj9r
 mGQnzSYvK+6t6dvRGHd6tJhempFn6DaBAGOqZ6wBJ3Yq7XKCYWRNE9SWOTMzWQtbRdBu
 t2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709191885; x=1709796685;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RiWXS0Lycg9PCC0fyWU9eT4uTxRcxADLMUayXiNfgPY=;
 b=R5tL7WJAmcRe89/W7JzZNW6a3FSsXvO+3fgseCjtIs9FmryYokyk3OVHDVHaLXefou
 i1s3DrfdHY6aYYMU65eIxtBFcCvPPHz10rxP/wC1u3W8FyDmaKLi4sbvWtTIVdXO4QPs
 HuAA4cST41faDMuD7P9HFBJfhA4sPslgQLgnQXsrXPcOqRlz53Ou20t2ZzhwlnkJ/4vy
 T8+jEHNqbrZnH1Zb0NnXHdgJ6XsczlmN2fwZPRsgHDHkQr1dL73yBdfa9En+uRBFDHlw
 wI5scjD0zlEZy0NjN+mQ3urImTaRYoI4WWVNkhlbWoy2wOAZL+K4k8UdLHyjiM8EE71z
 SiVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOLKkgptqkswjHkgud9Wf42kKE1L90pt4pnHU8ezxG0NmS8xdfLLMKoFzSF+9dCi5YWTY6uz9jQSOmA53wPu0qMTO711bVxKh1/CbFx7oV
X-Gm-Message-State: AOJu0YyZPDEb9W+WYXcVKcBAs8Hniuhf4EhuIUqwc705BO3Q+ZBEJHzx
 mFqkH/M/u5EHq+VEY2wQ4m2o4gcSVN8mhs590wdNCShFIXeCgxkWEyV69cd/hwg=
X-Google-Smtp-Source: AGHT+IFm2NXimeRlzG6mxS8tXCGpz0iq1MJcSQj/J2MMs2rGLvivZnF1HI63cA99XXODIDWyyxPCYw==
X-Received: by 2002:a05:600c:190c:b0:412:b8cf:150b with SMTP id
 j12-20020a05600c190c00b00412b8cf150bmr973212wmq.10.1709191884805; 
 Wed, 28 Feb 2024 23:31:24 -0800 (PST)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 q16-20020a5d6590000000b0033d56aa4f45sm928856wru.112.2024.02.28.23.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 23:31:24 -0800 (PST)
Date: Thu, 29 Feb 2024 10:31:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Use common error handling
 code in pmic_glink_altmode_probe()
Message-ID: <fefbec63-df17-4515-8e63-66ba3a3b9cd2@moroto.mountain>
References: <29b63eb4-2342-4ca8-a313-5de2a6ec6a83@web.de>
 <c25aa425-f350-4ad2-b92e-67de996daed3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c25aa425-f350-4ad2-b92e-67de996daed3@linaro.org>
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

On Thu, Feb 29, 2024 at 12:26:49AM +0100, Konrad Dybcio wrote:
> 
> 
> On 2/28/24 19:05, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 28 Feb 2024 18:45:13 +0100
> > 
> > Add a jump target so that a bit of exception handling can be better reused
> > at the end of this function implementation.
> > 
> > This issue was transformed by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> 
> (+CC Peter)
> 
> Hmm.. this looks very similar to the problem that __free solves
> with <linux/cleanup.h>..
> 
> I know no better, but wouldn't the same mechanism, down to the
> usage of DEFINE_FREE work fine for _put-like functions?

Jonathan Cameron has created something like this:
https://lore.kernel.org/all/20240225142714.286440-1-jic23@kernel.org/

It hasn't been merged yet and it would need a bit of adjusting for this
use case but it's basically what you want.

regards,
dan carpenter


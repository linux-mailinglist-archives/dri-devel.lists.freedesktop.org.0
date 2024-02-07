Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C063A84C7B4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A946A1131A5;
	Wed,  7 Feb 2024 09:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QajQWTFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15661131A5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 09:41:28 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40efcb37373so3434205e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 01:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707298887; x=1707903687; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nJcQua4beKi5Q7c6WQ4fkxE+hTunNvGHG1uvhFXmM7E=;
 b=QajQWTFPGOl/K902bZYPXjykG92k6U0QQoFDhEeVsxywKwmVJ6C7jLgLsPK3IYuBqi
 MquU885sty3HmC+bWUFxvevPD2Z5L//Z5yK5fMHKB31o7L/626vZNl+PDnD1W1akofVl
 xjJYPzSrN5SAvDGalhTDTft4hrlIMfyN9kTV5axIstgwB/9iGKVznkfVw8TuJlfkND56
 8GI73/8eDmTGNKnVyBmeV/NgKiI3FzKILdFQNF77UYpyMqdlvnZqSAwgOHyUopPWBjgS
 J3o5G8NdbWOKbjFBgnrGuGNQgbVyILP5EAIURoanmogQZBi+6LyXZ4G8cD8uDvF/OnIR
 Glbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707298887; x=1707903687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nJcQua4beKi5Q7c6WQ4fkxE+hTunNvGHG1uvhFXmM7E=;
 b=rSHLZFEtls/14DfE7fOldOmoANSpKpaF6GIkNBG9AzWJoG0C7lg3mkfM+e0vZEClp1
 4NfZjtS74dCKrdEv4NNYW6PSVLZW6Cm79GP7I7PxWA3pJjQUPXUms2utvqpXsJ+e4G+6
 yCkv8OZoRwTQyRuZHEI/fTF7f5OZ/BbZWcYSfEhlKBhMiOymjAMSHV/AraRqrcXyrfDX
 Zp1gpoDlfUfFFNfeF0jHEqu/aJ0mmCjzSxuho3xq1oTlC5haRzE3S579pfrdqrjbrp+y
 c1RiPzDJd4rtPGLA1AWZIZxeqVaAkczWMsMfu4BzzVbVo3xNxgq/KF8xA2o3O5jhAy24
 GIug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcg70A9HhFnaX3FHzQ/I982OY65cZ6DXxrVBjpeHp2feYeZ4MEflRVDBR+zrEDgbBpZwt0syzHqpi6+T+1UjpNtrk6BtSnQPGDfw+mDF1f
X-Gm-Message-State: AOJu0YwXF/S6wEOaWR/pivDAjW/iI89pZW+42Jgbmo9mytHjzJA6SMJv
 7QHGeGxZRmCwR0TZLufo2fPBAwjCVP+4L28qEzfc20MBu0WLXpC7esaGPRgDLgP/iiQmKoSPTgj
 AWHc=
X-Google-Smtp-Source: AGHT+IE20vw+DGyUgaFh2+PusZg0M3tzgwfUl7M4aCVMH8JlS57IagVjAAokJEc9q+vbj9wA0X1WkA==
X-Received: by 2002:a05:600c:5782:b0:40f:df2d:870f with SMTP id
 jx2-20020a05600c578200b0040fdf2d870fmr4685383wmb.41.1707298887344; 
 Wed, 07 Feb 2024 01:41:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWeF+6CVSJPghSLPHwnbJR/9GtW3yaOq26rnr1j+FWYU/htOGgZyubHmRuckeAJ0ew0JU+/beTTHiGM9SlKA+U9OBPXzxlQjt48B1sTEokJW7Av4hTTWUADV5QSUuWXF4usFskRUL7Vy5AoMhxFCz/imHznv7KlZK/n0bLGg0drcFDYlRgzqlvcu34FtCb3yztbHAqQ7FsSgXQ333/PNi1ot/qYRNnLYYsEWjYdPJ1Ebm1ivKwmvbSvs5Kw2P3iSPyL4JSn3c3Pot+npagmYrVpCthhBg7j6Fm4UVfFYqmoqTos+eYbRnSAfjl7p3IXTzxA9Q8Z1BDw4ThQHSxFSGh6qyvkCaFzb2xRd0BxTP//Ydh1y8VTeA5ogyytMGZ+fDUnymosPFe6t8WCIzXE/QqX/HizTsWFwqY/suznxCsvCmCbtwTS2fWYSgeOqaf5H8dvLoPYwk1imInriygOOp2D
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b0040fdd7cbc8dsm4661402wmq.47.2024.02.07.01.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:41:26 -0800 (PST)
Date: Wed, 7 Feb 2024 09:41:24 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: lee@kernel.org, jingoohan1@gmail.com, pavel@ucw.cz, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 andersson@kernel.org, quic_kgunda@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: backlight: qcom-wled: Fix bouncing email
 addresses
Message-ID: <20240207094124.GA7924@aspen.lan>
References: <20240202180151.4116329-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202180151.4116329-1-quic_jhugo@quicinc.com>
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

On Fri, Feb 02, 2024 at 11:01:51AM -0700, Jeffrey Hugo wrote:
> Bjorn is no longer at Linaro.  Update his email address to @kernel to
> match the .mailmap entry.
>
> The servers for @codeaurora are long retired and messages sent there
> will bounce.  Update Kiran's email address to match the .mailmap entry.
>
> This will help anyone that is looking to reach out about this binding
> and is not using .mailmap to pre-process their message.
>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

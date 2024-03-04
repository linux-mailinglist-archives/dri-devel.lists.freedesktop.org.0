Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3F386FF49
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8BA10FF90;
	Mon,  4 Mar 2024 10:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MT0A7OzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034A210FF90
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:42:28 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d22b8801b9so59125981fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709548947; x=1710153747; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vjmJ3VVomkutMCjUxnHOro2eYzLmhZJ6FnvYbU/rEBo=;
 b=MT0A7OzHjJGRbB32IIVZ0hAzYNr1QWl+7MyiEMk/+EbhWm2kCug5DNuJTaBRXTcOtj
 xeRqzRfYl5ZOwjxVoEXqpfCs8d9bhowU7QQ4iscTr/UoXASXIpX8kOWD0nzxT/637qdD
 dxt8mBJaum59Zc33Qhq1QMJPFENa6f3mBMyLB/PkvDxGly5/BPQYuaTD1Sww5aNgGZhg
 Gxow3F4LV/sJlvR+bGzR2KZ6wv0HJudKPfLgys3kNPJ3GVx1QfAFrJ+OVO1tqCNp5t67
 W5DFAsOIXFSJA695arZ7tk7SeoIp/Zqy+HIAplGVKJFrwVzughoMKPd33Di5Og4bYm47
 QKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709548947; x=1710153747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vjmJ3VVomkutMCjUxnHOro2eYzLmhZJ6FnvYbU/rEBo=;
 b=I7VE2vJLMOn0hVyFX5u7i2ciAbb/zRn9+2OUZch6DZeTfHCtedbG/2uMJbC6Jls+Rg
 lfgeWFzQ2YDsTPS5TXNuLMYkmIVjOVWrNPbnb0T9UpTBc8kkNDl4dBjCBuj7SxIE/+4V
 wWX7G/KQh1mJWaX3z0ZWRJJcKQxxJQso1nAfQ9Kr/KlcPnp2dcnqhP80QxmfairYg9Tm
 9SL3RDZXFzs0SjN2T6Px96g93glXvheA3+Y0br+hUOIAX6GLBWHJqTSDyLQTpCjMllF1
 I33VZu01LakT2oIq1n0GydvBX693bDX546wP095w0HOcHp2kFefRfR2kwkDhbFhDI/H1
 5ZIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFbqNXKcf3I8G9WHqzAkvuyvSRn/yH9WZV1sn2otyuOtcdwqFYbfEfI8/sbStFQjsxka0wP6CJv5mhlofbTdNLAwgftyo8utkWbxE+KKnJ
X-Gm-Message-State: AOJu0YyloewCdGAlsTjczoLD8j2/J4+9VETKznWj+Ixyk+idE1d49WCa
 HZMWtBRNPu+iVW4u7CS7eycGwNeg6CxDyxJ1cZ8WjZotkR3vWBLRpHGg6pSJan4=
X-Google-Smtp-Source: AGHT+IHtvy7qmcHQLaVLkUnxVi4LgTQC5QXqMaha1pxVW9OFHezE7iDeVI/fRt3Ls8gat7CbfyqlAA==
X-Received: by 2002:a2e:3306:0:b0:2d2:346a:f199 with SMTP id
 d6-20020a2e3306000000b002d2346af199mr5394143ljc.47.1709548946966; 
 Mon, 04 Mar 2024 02:42:26 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a05600c3aca00b00412e8370a93sm498803wms.27.2024.03.04.02.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:42:26 -0800 (PST)
Date: Mon, 4 Mar 2024 10:42:25 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] backlight: as3711_bl: Handle deferred probe
Message-ID: <20240304104225.GD102563@aspen.lan>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
 <20240304-backlight-probe-v1-4-e5f57d0df6e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-backlight-probe-v1-4-e5f57d0df6e6@linaro.org>
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

On Mon, Mar 04, 2024 at 11:11:41AM +0100, Krzysztof Kozlowski wrote:
> Don't pollute dmesg on deferred probe and simplify the code with
> dev_err_probe().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

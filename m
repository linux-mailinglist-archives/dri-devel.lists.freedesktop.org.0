Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341AC895157
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 13:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B93810EFE1;
	Tue,  2 Apr 2024 11:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rn9WScRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9085C10EFE1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 11:03:51 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4161eb1aa1fso270185e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 04:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712055830; x=1712660630; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pkXDCtAWQf5f4/vhlPOEJz9BIk+NlDOJWtNC7X7Jx58=;
 b=Rn9WScRQuXIs5eU2jFVSukQt2RHYJxWIMZ+9bupA5Q3BnS2xXSx5FpYijsw14y+K8+
 ljnqXdAKwwJTF5q5SjGN2mWIGRHtXHHOM1Yz8wrKfPAwfYUEBnzo/j3VdLpDr+VfE6hn
 hlAjoUQerlwjunxdkoshfOkKLL7jG1Qkjcr6n3ftjVjUKI7ePYrFY45APgXR/CelSsNF
 /gBEzWoSAZCKnU3/Ud4A+U9Gv3VFIl3FrijOxy6TRlilrc9WUwBk+dOhAEccpIemayTB
 ffDmADpjZ5uJBpOoicZ5c88yaQ7XyIqEH7APP4NSOOHPoVJ1M60TO1TN5hKtoOBN1P5k
 85Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712055830; x=1712660630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkXDCtAWQf5f4/vhlPOEJz9BIk+NlDOJWtNC7X7Jx58=;
 b=eTCunp3zVUdikBwztMZ3z5KuknYT6eK1TX9mcHZUAXFPJGuo1eVk6pZYbLnLQ3HXML
 CH87zKbI14bNKmyfXqtYY+s5WXy1L3LNpj74aL6QIOZBaRaNI3RKPW5h1YyCZKgygR71
 3YCCQ5LXlBsRx4Yw+DKj1bOWsDHm9HYkhrSRvVmRWYwnPM9C+i4dQ1KDyIES9wSSAYEk
 gdAJk/+1FaeWGBs/VWQEqKQc+TYl2rYH4vcPQGsUPfgJtwxaqpOssXZM5z4RZSWj8qL7
 SOPo1wF9l9SJPI/k77LO7X2BcUbOLH+yqgkxfnbyaDxSRu9UqSegECxa5+VX49O+gbZD
 7oSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrJoZBV3YMrh5qFY8EXlDQ/WDYxL2qDo+ohf8UwfbhcC7QpFcOjeqi2+Wn+P3ID2N/nvw1jnp1lnKtZ78dzC8astQb8kj0vxY5FFjSmd8E
X-Gm-Message-State: AOJu0Yzv0hJ0twjp1WJ1Jt5IIMwE4mgvmlg1rwe2YKGwIw/ZcwrGclA3
 BWyUk1/S0ADlv1qgJM3tGS4sHkOA3I8/mtyeYWEMnnqw6275bcbaMt0z0EEBIRk=
X-Google-Smtp-Source: AGHT+IEufhh5jSbZqDrpUvGWVHbbF5VFV6RhofXz9rzUdYYsBctfugfPGPViWxk05N45/wOGrEewjw==
X-Received: by 2002:a05:600c:4753:b0:414:7bd1:4060 with SMTP id
 w19-20020a05600c475300b004147bd14060mr8803238wmo.2.1712055829600; 
 Tue, 02 Apr 2024 04:03:49 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c3b0400b004161b8a0310sm1466450wms.1.2024.04.02.04.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 04:03:49 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:03:47 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] video: backlight: otm3225a: drop driver owner assignment
Message-ID: <20240402110347.GB25200@aspen.lan>
References: <20240327174714.519577-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327174714.519577-1-krzysztof.kozlowski@linaro.org>
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

On Wed, Mar 27, 2024 at 06:47:14PM +0100, Krzysztof Kozlowski wrote:
> Core in spi_register_driver() already sets the .owner, so driver
> does not need to.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

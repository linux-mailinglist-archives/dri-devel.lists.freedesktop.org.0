Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C9CAC699A
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 14:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C358410E29D;
	Wed, 28 May 2025 12:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jlToSbBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA2C10E273
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 12:41:59 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ad572ba1347so785379166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 05:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748436118; x=1749040918; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fcybqgDD5oDZApETTyhThYIrRhfcS6l0d/FaIxiSIYI=;
 b=jlToSbBEx2VZzZJWL6xmTdRpPvaGIaL7sRFOkNc9MBFl86wUn0SJKKss114y6r6y17
 VvQDMZiRDP3SqcU1eKZeePeazusmr8987QkIon2RzwF0nB15DJtIoVUXRAykd78Y/XLg
 b2PjkTVP3tiZAbGhD2IWWGmRj04yRKsO/giohMxFYMMPrdkQyFuTTAQ0vXPaljqS3M/Z
 tCGxcoZbDlDthETcbIhBlvnNTuPhFqXOUU9ItD0RJ5ZZw5GfgCLu0VEcLq2QBEWVsftJ
 flapzOUVBHpEssrM2Din2NPDIOFLcXaNf/q9mSgW3JDaJEAWKzske0vnN/omW24yhZyg
 VTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748436118; x=1749040918;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fcybqgDD5oDZApETTyhThYIrRhfcS6l0d/FaIxiSIYI=;
 b=frPO2OFydVRuSDhw+UIMYt94RB/7EDluFqmgqLRWOvf3Rxd8zt7zuHqk0tWXrb5kgJ
 L+ctMBTWvEu0ayxZvTpxMEEilzW9qEyFxyoauJJoXRvZPbGf48aIXuyD8Fh6MaKbjpsW
 OsezIA+fdvas7lNFFvBwZBE9sgmV7+Q6YYnjEoh89FUxY7Y+KMGjwGUgnMfHgYTMxe5U
 kn6+1dK3x11+CG6YmhmdjuS8lYzuUp37Yp715dE6XwTCEM/oy+48YKc8Y7OEYE5nPtB9
 ImP7MOoRDle2+WlsTy3w6VFs32Rtn3E88xw3zxSAMEmgslyxtFfnrRwm2MI6YWjqoETk
 Nwnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAfp95yREA1fOc89el1EkD6yxmixHXDd03uOkG/uP9v4VFSoa/1IjWNVa/3JXsk4KTN/X14q3Yw+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHr3N7AhVy+/cJ5NfXYVSJf3oBTxHw/+y53+Q7i7kNsNHRuUEW
 sCRoG7O2cu0xRmChgJ/372QDhyRT35x/JAoaylIT3eTu7cA7vqzUA5+g
X-Gm-Gg: ASbGncvlGsmzRGcTeP39dLAp6f7aQAmTdJn9jRWlNEtflUzZXe48+MPS8AGfb7KpVUi
 ewtBGA9MMXy+gNJ0sLm+/4lI+PvKgZDvGhXDz3n9Cq8xR40OEzeuAR32QOkSJ/k2gwL6tCh51+L
 fkhKCpPyrdoTXsdehjvU0WZyxp3uxC4UmXt7SvgxmhPoPAD6n3snY5ZMuVSeE8LVVFURhcTbuUR
 L8qRG81+sry6r3uQuov2EfWf8VLY3VlzQV7JBu23+cdKnt/IVLl6tShJjX337FW5VGxct9XSO6O
 3hMygjEYFs13gDNSPWNz/kjUrVT+++vtLPs27+G9zSoXfPp+MrGVDhpTcnYDbftBM92R81R0aJe
 jwQBFKOoqNSmDoHXTD8ayac/uAz1j/iQboQqodMpUIsaFNVkULMc=
X-Google-Smtp-Source: AGHT+IE3Rw4thyp1GWN412ZEdK69IMZD5DtxtrS1IfAeV52JV9OhYNh3EcnK3Cxlv7eNgKS/ZDA8kw==
X-Received: by 2002:a17:906:d7e8:b0:ad8:9b24:9d16 with SMTP id
 a640c23a62f3a-ad89b249d8emr334723566b.6.1748436117922; 
 Wed, 28 May 2025 05:41:57 -0700 (PDT)
Received: from ernest.hoecke-nb
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad8a1b48b06sm100900566b.154.2025.05.28.05.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 05:41:57 -0700 (PDT)
Date: Wed, 28 May 2025 14:41:56 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: Doug Anderson <dianders@chromium.org>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com,
 max.krummenacher@toradex.com, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 kieran.bingham+renesas@ideasonboard.com, linux-kernel@vger.kernel.org,
 max.oss.09@gmail.com, devarsht@ti.com, dmitry.baryshkov@oss.qualcomm.com,
 ernest.vanhoecke@toradex.com
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
Message-ID: <7256zmyip7iaenbrcfvggnrsh7qvg7tcbfgr7htywpxqkhnggp@2jlfcqn7oaxb>
References: <20250508115433.449102-1-j-choudhary@ti.com>
 <mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq>
 <CAD=FV=U7XJZg4Vh4xMKEiAuaJHNA1H11SiD19KLBazPmMEVduw@mail.gmail.com>
 <0936a042-8ebe-42f7-b3eb-a4606120cc47@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0936a042-8ebe-42f7-b3eb-a4606120cc47@ti.com>
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

Hi Jayesh,

On Wed, May 28, 2025 at 05:48:56PM +0530, Jayesh Choudhary wrote:
> As per the bindings, I see that we should have "no-hpd" property in
> the device description for platforms with bad HPD or disconnected HPD.
> 
> Then we can read it in ti_sn65dsi86_probe() before resume call and use
> it as a conditional instead.
> Since I do not have any "bad HPD signal" board, I would need some
> help validating this on such boards from Ernest.

This sounds like a good approach to me, during my investigation I also
thought the "no-hpd" property should enter into the story.

I will gladly help with testing and will add a jumper to my board so I
can turn it into a bad/good HPD signal board.

Thanks for the efforts and kind regards,
Ernest

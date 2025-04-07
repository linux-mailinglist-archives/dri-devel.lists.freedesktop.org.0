Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C436A7E65F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 18:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDBC10E508;
	Mon,  7 Apr 2025 16:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NkSJL/BP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836A910E505
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 16:27:48 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso2027896f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 09:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744043267; x=1744648067;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gmt4HX/iSNiSTqkD3t3ALwtpmvWnuIuBQoVi+iO2Lmc=;
 b=NkSJL/BPFYRBvi/M9C66kfampad52tgOLSV5Idlcsy0yjNbLdIquYhXrKdnXTPwYhc
 tgboBFFHPTdMNRJ37O/NGJKMi6mDOTPDErhTZR3+IZCTgKxzFZ9ndiTfMviET94H8cZD
 N00z4FQfBoXk+2uNCmal1sFad6C1lgwSi+MpvRIEWdjgrOaAm981cTFd2cDZnhIA76Gt
 +9B5sR0kUroSUwOLMcC+S8PjZWa7/peKPUvXMds1QEB+D/WkXVUQiH+1BYRVW7KCs9Y3
 Wa3dp5XSujUf7SdJqklI66bbP1zQpgJSuaZFQ7AjDfNY+/j7OMZicc0+tqu+aX89jplU
 dS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744043267; x=1744648067;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gmt4HX/iSNiSTqkD3t3ALwtpmvWnuIuBQoVi+iO2Lmc=;
 b=SFv0LK90hFtGA57HPHVG3gCleG55SMwjQ+xPWz+xtiZZRQs+tEMgrx3sSerM7glQCx
 ek9euYaukEdPsJ7D5btFXb89x5tKgHGdGmcAz5cqUeH1pD/bSJcAj4wDoh56QP4iEyJf
 HLXM/KtzTehLGQs1hwCjBpRmgrB7OQ3Lv/vVLmL8M5ZPrS+ztPO/NA+Z4fXmbgp7iNH5
 kbp8rMQVFJ/A3kEBIyoVSLVFk1/jRgBs5ruzrZLxKCNUD/XPtOMEM/vKr/wcXX45Db4u
 7h1nlz7keyu45LB98SR9D4ZblJ996h/uR4zKiiiAxvKf7YvpJjkSObS1AXlXT1et3uf1
 //ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/qUz7bqPR9smyMdpkDlCfljETNOd86fGs3ZJTd4OlwVPCHpLprg3rqNAyPKwaWPHFmP0MeXBRfTw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxn/PVn4YaFUSAyMu7a6e3ei6SKTyoofmy9vV+XSnEizGOFkezN
 hE0mUkQTUr/U6zo/iqGzJair2RIKIiFjmyvVa35VWgRyRM3MudCIdbDMkbHH1FU=
X-Gm-Gg: ASbGnctcaqIzeTiYBupHb5ADcOao3GSVRFAhlQN4awP9zckFlck335LBYSH8iaJYNOO
 QQvr1jrarcILe2/0UlVKcgnnfY/agsTLf5DadxwbUaJAqaQX6MuOBkJOtKWanwRjCrHVFehG421
 dc8xKPZJ6tqSlbU89ZxDCY0Thq8CjLSc/Ab7XDdbdJci50/7rGRGW3hqt9EumMIJ1qI1JoWDSMM
 CjrxUMxnVMHuW9xLFdbxCTHyZsnTVYWexgIGhe+RlvjxPBWxf29t/YaQC7ZYm6lQYWktadXX4zc
 zff5d64zGei+cC2im1wK5Uik/YbKlUliaTME6DJZMwQl5CGGOxneKE+VgmcpJbF+nGrQNNVCE19
 ClCAEMT8+EOiAIjoAHR6FLUa3iJs=
X-Google-Smtp-Source: AGHT+IG8J3er1iyXQBPMxITzMvfz9EFr3jDi7ygtRVXk9vTgIkpVU04qGBBpxMY6//a+NXkI/WoaMA==
X-Received: by 2002:a05:6000:1786:b0:39c:1f02:449f with SMTP id
 ffacd0b85a97d-39d6fc00d2dmr6036975f8f.2.1744043267049; 
 Mon, 07 Apr 2025 09:27:47 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34a92desm134263455e9.14.2025.04.07.09.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 09:27:46 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:27:44 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/4] backlight: ktz8866: add slave handler
Message-ID: <Z_P9AEGq2sBYShgv@aspen.lan>
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
 <20250407095119.588920-3-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407095119.588920-3-mitltlatltl@gmail.com>
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

On Mon, Apr 07, 2025 at 05:51:17PM +0800, Pengyu Luo wrote:
> Kinetic ktz8866, found in many android devices, nowadays, some oem use
> dual ktz8866 to support a larger panel and  higher brightness, original
> driver would only handle half backlight region on these devices,
> registering it twice is unreasonable, so adding the slave handler to
> support it.

Is there anything unique about KTZ8866 that allows it to be used like
this? I think it would be better to add support for secondary backlight
controllers into the backlight framework, rather than having to
implement driver specific hacks for every backlight controller that
appears in a primary/secondary configuration.

Also, the kernel seeks to avoid adding new instances of master/slave
terminology. See the coding style doc for suggested alternatives:
https://www.kernel.org/doc/html/latest/process/coding-style.html#naming


Daniel.

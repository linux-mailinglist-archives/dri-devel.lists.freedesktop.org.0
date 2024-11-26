Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757AA9DA454
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 10:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354BA10EA55;
	Wed, 27 Nov 2024 09:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PDUZLvTf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA6E10E998
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 18:25:56 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-724f74d6457so3300275b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 10:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732645555; x=1733250355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pGO4VEjmMCTpy6yKK70GikOB6XhW54AbxXkx7kdm35k=;
 b=PDUZLvTfRS9EV2DVCgFtgqwmMM1r+XXvqwfrORQrUIe+FtYWSUdcAXn/Zw7fujiPAR
 3Sk+QBdsaoy0+deh7Cn8SWisum8SLyAgusWJZ9Uhb5Odbu8jP4g1uEkaBkMs72QnIVmZ
 vJG9LXZNXCiipRI2Vr4Qe5vSkXVfAUov7qWMODj2rbAyKptrG67KArp4AhlAnrr0VtBT
 iYMTcAfFG2d4vI6J6VgFaK9po8i8kWAC2/2/S3UCza+kItkTSswl9W/hZ2DFJctIF0RQ
 Wd6x1MYftGDwhx35bkGqmNz8m/9bq3jrwRvrFSSg0ocq4Upd4r6L6FfsANPUS1LvX03S
 kviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732645555; x=1733250355;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pGO4VEjmMCTpy6yKK70GikOB6XhW54AbxXkx7kdm35k=;
 b=tM3fLJvgiblmInF1SoQ+L7uC5eXJxY/IfnTV7MuNq3JiCwcas4hzVSd8zkRfDLIzt4
 NH+1rwGyutSPIN9Bca5762fUO9X4Bm+1GwEgHxbJeVpU8yl48uFYboSt2PvsrzmVO4uU
 hMkppSh+tmV53N32iNoeWPNnHCmQGCnvv8AFcHLPXuuYoGavzW9zmeuZy0WwqyRDSBuc
 u823q6qv1U4gtMowhsYjlsytOKjBTnZbhUbfaoFl9cZtyGQWDBYeY8x7XMuxY1PAt6b8
 yeZoDyAHK03n7lsgc5A1sWeV9G+DWnc5h4p8N1bwwcmytTcKMFUsvAO+74s9k13ZPIUd
 XOXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8WlEXSYqoksSjcf67n+4HQax3nTGpnIlz+y/db+Yhma4i5GbMIk+a0NwmqaMNIOdSt6NaUYoRMPA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaRb3u3QXzdUggwWdgJXeKzD2UU1V/w8vN6QSdYrsI0leI7SLb
 6cEehfnG7QWqLm9/us9JvqVM6Nf7EDMU3oT6c+I5V+z+GFCgBsFM
X-Gm-Gg: ASbGncsafcKQA1gSuGYng0Se4Wmb7kAJZF0AMGjsDDzHyrIUJTIOcekfzx9HQzOeSJu
 kM8i/HHX5g/6QbPmlulRMFn0A0cFnKp4lkhcBudfaWIeXzq6dsM6EoNjQ2fcxQgKNeAvEqU5p2L
 RjkFQekl5DiwIS9kokhY9CZlZMcE0r5KQherGq6nzzjVUWvdp7IHl5Bp1Vc99Ox9JZS0+bPW1Wo
 HuiBhgxRt6/UVgR9CgUTV7ltiQ9ETVpk2SAJq2V9ain1OdGHM0NE3W8gg==
X-Google-Smtp-Source: AGHT+IGIW8YWKhxplj7PnOWubg8KaT/VQiw22cMgLmX8nunNS6CMBCZlxtxFLFqpa21jqQ2K9VRpzA==
X-Received: by 2002:a05:6a00:3d52:b0:71e:cb5:2219 with SMTP id
 d2e1a72fcca58-7253004b06bmr165886b3a.9.1732645555470; 
 Tue, 26 Nov 2024 10:25:55 -0800 (PST)
Received: from [192.168.0.122] ([59.188.211.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724de531b50sm8971221b3a.101.2024.11.26.10.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 10:25:55 -0800 (PST)
Message-ID: <e0f78e42-6454-4855-9004-05d90ba6895f@gmail.com>
Date: Wed, 27 Nov 2024 02:25:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller bindings
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
 <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 27 Nov 2024 09:01:48 +0000
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



On 27/11/2024 00:34, Sasha Finkelstein via B4 Relay wrote:

[...]
> diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2cf2f50e9fc7329a5b424d5ddf8c34cad2ebb6be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
[...]
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: mipi
> +
Drop. Not needed as there is only one reg now.

[...]

Nick Chan

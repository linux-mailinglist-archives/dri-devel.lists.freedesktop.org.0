Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C438E90D8DA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 18:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F6310E0E0;
	Tue, 18 Jun 2024 16:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="bRb9IHrG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76B010E0E0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:17:12 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-421b9068274so50362385e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1718727430; x=1719332230;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6FzirBsHs0R3JqR4YNWkZT3Jk6K5qZO8hZgNAdkFmfQ=;
 b=bRb9IHrGisWoJny29CP7yY8d4uP++aQ2X8r8h1Me6jrLBZ5s19H0o1uN/xmQG1A0T/
 tgt7sQj/1rO12mqiyG++fGjvOC/HIdabC8+QvMvtuNZ8r18OO9Y41cr3YALoJUEZSdUw
 40stAqAMZ/TlGzSq3Y283Rk8PWx19jTuCgr0aPHujpz2StpLHwlIOxloXYuoV07UK+X2
 klEnzZBfgcW64/4Tn2Ci4EwINPeWRY06nqEogdiEr4YmS4Cd7Yx6m2x2l1RY5edmyrlN
 KaBHjK95ftOGklVDt5Ee/Jqo4VQxujYkcLaapjEF7HFUAb2S10bevGguct3D2diAOAAa
 cnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718727430; x=1719332230;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6FzirBsHs0R3JqR4YNWkZT3Jk6K5qZO8hZgNAdkFmfQ=;
 b=sy9KnLlbDRDREqLbIfF9t/oeE4ZZLYfspqQv0PpYu4O3qBOxXkbUh3SkJeycLN0u5y
 BFPaOYbQSAEjQY5VNdMPdZjE8KepJziVcPmpJioQXUUsssObM+BWpccSsmIolbdJl6QU
 m8+VIrISErDYUVLAOBRiHbCe5CyMMhpEvxdLd591NdNTLOFYwGCkFCBreBWyx3HNPW7B
 TtiOurUAukE25b0DrPCeQMKp88jLbZnPPFuLFXTCjpwQzn+QEi/z9RIQ3/ZVf7Tv46on
 Jx58tul9268Ofxo4O1IwDKG5151dgJIoyTRbsfxSxRvQU4xoa68xOL6WEkJ7nhGxsPk0
 YPnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6rJ7LdcF35zwpuJx1Hf0bYuQLaps5S9HjNUw7PSy3Q3vsCpf7jocxPZdQdF2YbCiYCChGlY9zUZWnyHP7SdS01q1nWCtVh/vGSnSjoq5p
X-Gm-Message-State: AOJu0YyG+dyuDvWFj7uKhhdQgNaVKM9/q7iiP9cc2Ba4ZiesbBr8X1Jz
 EJMKJyTpI1YlWS1Ms4KbYR40ZCGNgNnv8L3lKBq2EASpS5/wOyP1rR4xnfF0a/Q=
X-Google-Smtp-Source: AGHT+IF+K+0VwyL4Nz2qQsPpxwaMm6n06pjMOi71rdpTsWHLKiONMkYyVEv1qp7d+YAKTtxVv/0VTQ==
X-Received: by 2002:a05:600c:45cb:b0:421:7983:f1a8 with SMTP id
 5b1f17b1804b1-4230484d391mr123768525e9.32.1718727430252; 
 Tue, 18 Jun 2024 09:17:10 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874e7060sm229060085e9.40.2024.06.18.09.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 09:17:09 -0700 (PDT)
Message-ID: <1b34489e-6449-4023-826a-b0e1331319f6@freebox.fr>
Date: Tue, 18 Jun 2024 18:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Basic support for TI TDP158
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
 <fac01fa5-f257-488a-854e-716bd2634d85@freebox.fr>
 <20240618-impetuous-passionate-jaguarundi-d7bcc1@houat>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240618-impetuous-passionate-jaguarundi-d7bcc1@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 18/06/2024 16:36, Maxime Ripard wrote:

> On Tue, Jun 18, 2024 at 03:07:16PM GMT, Marc Gonzalez wrote:
>
>> On 17/06/2024 18:02, Marc Gonzalez wrote:
>>
>>> Marc Gonzalez (4):
>>>       dt-bindings: display: simple-bridge: add ti,tdp158
>>>       drm: bridge: simple-bridge: use dev pointer in probe
>>>       drm: bridge: simple-bridge: use only devm* in probe
>>>       drm: bridge: simple-bridge: add tdp158 support
>>>
>>>  .../bindings/display/bridge/simple-bridge.yaml     |  4 +
>>>  drivers/gpu/drm/bridge/simple-bridge.c             | 85 +++++++++++++++++-----
>>>  2 files changed, 71 insertions(+), 18 deletions(-)
>>
>> Series has been NACKed.
> 
> That's a gross misrepresentation. It wasn't NAK'd, changes were requested.

OK, my bad.

Changes have been requested.

This series is obsolete.


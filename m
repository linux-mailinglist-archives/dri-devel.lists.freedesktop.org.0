Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA967BA34E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 17:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458AE10E02B;
	Thu,  5 Oct 2023 15:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E315710E02B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 15:53:21 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-405417465aaso10797805e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 08:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696521200; x=1697126000; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6on8ffrySqAq/m4pO8p/bA0nUIKSyU+b6e/OY+Ah1XA=;
 b=VtWmuXMSQt/pPsUhHoXxPJxZKNBZKIDkCjpHkiDN+S6MtMDYJAH04KfA0cIpERwuwi
 aa5o+LGntxdS1Te8OL/urxc1RL6+R4T4ongtzaUHUoVYwZ/qppvI4ejw0ialQ2/bPmLP
 9trNFReBPNIqJn4a/lAcoWvzU/oS29KoIFsDbBcFMEQSDeqp1MPGUvZ/5dtPMOoOTxus
 96+ahD0JgN92PvW6OmQ3zG6k5dtWjgEBhQeD1sATBcgeqjpt6jOLC2/bQGKfO2fi3AZ8
 8V9V+5ZtTn03sUAGS0UgeAd7j0q+AnNlnZUX+upM5FxqUb+5f75o89ZHNk/cCHj6NVaM
 unWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696521200; x=1697126000;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6on8ffrySqAq/m4pO8p/bA0nUIKSyU+b6e/OY+Ah1XA=;
 b=UROLghp+EzeS+yra0vPpcp72VmLXFhkHYzPjBl+bECqLpuQ7lsa+SoZqIHO3AFW/Gq
 gML1zHyqw29OPCmqs06jBaNNh07twdX7PwDL7fNsFUb8GpRyZ+2msaorohZgSMEMkV9V
 scAOwbDPAvbQXIT0KL5NhPQJjlPx1OT9rLEwj5UQeobZ+tCtiV5G0kM/q8kp7wOvY1i1
 E9/zHrlnI+JI8jD8wphbnkWz0sXxoyHqtPLxl7mnIlIprmCCzxXCbYzGTUryCP8/HAie
 ZdNKMdhhrOcAn9K2zfnqR4qNPcjliKvtKWgYHNkPzQjvYGFI+Cln7Fh8BMykIUW9MxTj
 es7w==
X-Gm-Message-State: AOJu0Yw7CdV9G36Hr8mU7SakBVGWQgixd0X0lTppbpYjJpcy/aysxjOz
 0Sth/BBBYN9CBwUy9ccw4N/dpQ==
X-Google-Smtp-Source: AGHT+IGGeY3ThKEEt2JmsAquN6pbjtqahVAImq5gq47rbdTM/UI+nWpdZQeOUKarnDKT/gIYk/3Q/g==
X-Received: by 2002:a7b:c8d6:0:b0:405:3803:5588 with SMTP id
 f22-20020a7bc8d6000000b0040538035588mr5204388wml.22.1696521200000; 
 Thu, 05 Oct 2023 08:53:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a7bce8f000000b00405391f485fsm1777093wmj.41.2023.10.05.08.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 08:53:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: devicetree@vger.kernel.org, Chris Morgan <macroalpha82@gmail.com>
In-Reply-To: <20231003163355.143704-1-macroalpha82@gmail.com>
References: <20231003163355.143704-1-macroalpha82@gmail.com>
Subject: Re: [PATCH V4 0/2] Support Anbernic RG351V Panel
Message-Id: <169652119904.115752.1507145837573801131.b4-ty@linaro.org>
Date: Thu, 05 Oct 2023 17:53:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 03 Oct 2023 11:33:53 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Anbernic RG351V panel. This panel is mostly
> identical to the one used in the 353 series, except it has a different
> panel ID when queried (0x4000 for the 351V, 0x3052 for the 353 panel)
> and will not work without the inclusion of the
> MIPI_DSI_CLOCK_NON_CONTINUOUS flag.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: newvision,nv3051d: Add Anbernic 351V
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1b063368ee71f252c5a7f86e100b3b67271608ae
[2/2] drm/panel: nv3051d: Add Support for Anbernic 351V
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=eba90a7aa2258cae4caeaa8f748506c315c30bd1

-- 
Neil


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 643E7958570
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 13:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C64410E73B;
	Tue, 20 Aug 2024 11:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B15D10E73B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 11:10:20 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-428e3129851so43926315e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 04:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724152219; x=1724757019;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fInxDh63lUo1pJrQRWGa0VqFjDqKSYMTvciu7osvTj0=;
 b=sh4x4WvqqJfvdTkBCd4iIP+bmWDmQqeEM5dCHKnqKCCwJb1ZNBlfhnyt9Zac/6Eytu
 ePi9p5o8HungdEF49g6YT9uXInyCs0s3bjlLDUQzV1XSMTekLZW0wdbSnlkn79gFfpYX
 ty70kjUmaJBKbi4LT77+nfFRJa1tKxQ8oPX3SiFhlth64ILQ7SazyZ28SeytN1jeyUFe
 cseL7XFd4vJnnoRzQInuC5Wrol4zfPoq4JgBtaTuFZbqtK6PLH+ug8ZhdhPc2X/Jo2Hz
 cDxGEytKwtwgiGGbdt1ORfR0nrHT5+bAd6x/3ITcVqcnKyFgn1FtQvDCu6QzPxYFFb2H
 MWgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUElxnZ5zo3c/6AfHOXy8yaL3sDzuTRHZB3t14mHKAykPzh0CKcDfLVb9yRHhPdogKWhZX8s7NWfq4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCMIy3uja9KdNGbaCM80oip+ydAUSSqy1xaCNbsAD2Jgt6QmPH
 /PANVnUQrgaCuY22uDMQ7exOskhyl93RkdglBoVTFcvCgBxcGZBN
X-Google-Smtp-Source: AGHT+IFKueD4kujwz2iAYYiHm0x6pXa7zOH0dqc0XttMsjnIJ4KVsIzJEoUzeluMlqGg4HQjTlqfbg==
X-Received: by 2002:a05:600c:1d07:b0:426:5f02:7b05 with SMTP id
 5b1f17b1804b1-429ed7a6156mr84932665e9.2.1724152218409; 
 Tue, 20 Aug 2024 04:10:18 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-429ed784726sm139348495e9.35.2024.08.20.04.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 04:10:17 -0700 (PDT)
Date: Tue, 20 Aug 2024 13:10:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rohit Agarwal <rohiagar@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, 
 jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: dpi: Add power domains
Message-ID: <b5wtwpkwgg3tbwya6zllmymaaf2qvnyfbspkynr2ruzncej2ql@qloslxfinvos>
References: <20240820080659.2136906-1-rohiagar@chromium.org>
 <20240820080659.2136906-2-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240820080659.2136906-2-rohiagar@chromium.org>
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

On Tue, Aug 20, 2024 at 08:06:57AM +0000, Rohit Agarwal wrote:
> Add power domain binding to the mediatek DPI controller.

Why? Who needs it? Why all devices suddenly have it (IOW, why is it not
constrained anyhow per variant)?

> 
> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml     | 3 +++
>  1 file changed, 3 insertions(+)

Best regards,
Krzysztof


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0418848A5A9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 03:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E2E10E4B4;
	Tue, 11 Jan 2022 02:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C6310E4B4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 02:30:57 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 w19-20020a056830061300b0058f1dd48932so17126988oti.11
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 18:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XZ6qY2NyUzWmYuoeyElwy9FNNeOjoQhUf3oXFfCJ4iA=;
 b=4aO4kVreVw5KP5bjwMgYiYjHK7ma/DGvGFWnot3COKG4UQCBoaZbza0OYWMnokc7Rx
 sjnId39DE88/+37O+khOkAj8Slr64EU7/Slbl0FBr3SWchwVJwV3NKB9IysB2fgbKjYf
 2gE+G7j+5zOg8JoaPv+E86vO6hNhuQf+kMW5fusb6lcscT1NFFkNn8l98TXKTU5JiYq3
 y0UgGy0blr3/FDtqLOMbi8fKQ/GaB3NuZXCDN+WPggVNPb4a7xhDCwTXoKQkyrqwlo+z
 95ynUtnjN2O14Cd1OelwFLEfuqHe2dGkEid4rr0Oj1SSatADwpckl6wr484q1YM1FGKh
 ukfg==
X-Gm-Message-State: AOAM531lpOcLqhHcfWq4wadvrFlC5y8C4aVcLU3WA3i1Hs1lkXKYILa5
 XuaKATqE0lNyn9/kdfqr3A==
X-Google-Smtp-Source: ABdhPJwG7XftaQmtporrAXDbTikcT99aDcNsf0YS1tzhLNrZ7gYJ9rsWlBkC/vnzQeCYzRbMH7iyiA==
X-Received: by 2002:a05:6830:18cd:: with SMTP id
 v13mr1920964ote.158.1641868257241; 
 Mon, 10 Jan 2022 18:30:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k9sm1798095otp.71.2022.01.10.18.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 18:30:56 -0800 (PST)
Received: (nullmailer pid 2022764 invoked by uid 1000);
 Tue, 11 Jan 2022 02:30:55 -0000
Date: Mon, 10 Jan 2022 20:30:55 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/panel: Extend ACX424AKP bindings to ACX424AKM
Message-ID: <Ydzr35IoHtjWwTI4@robh.at.kernel.org>
References: <20220103093501.637323-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220103093501.637323-1-linus.walleij@linaro.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 03 Jan 2022 10:35:01 +0100, Linus Walleij wrote:
> The panel ACX424AKP seems to only be used in prototypes, whereas
> real products use the 10 pixels shorter ACX424AKM. Extend the
> ACX424AKP bindings to also cover the ACX424AKM. The ACX424AKM
> was used in a few different mobile phones from Sony Mobile.
> 
> Cc: devicetree@vger.kernel.org
> Cc: phone-devel@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/display/panel/sony,acx424akp.yaml        | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

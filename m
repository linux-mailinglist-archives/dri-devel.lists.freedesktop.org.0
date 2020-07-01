Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06E8210871
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 11:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F196E87D;
	Wed,  1 Jul 2020 09:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443356E87D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 09:42:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w3so10047918wmi.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 02:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=06M80py+OrOgo69F5ZheKoyECC0h3DXpLoaktfAfRwM=;
 b=BZMdSzzKohTb/7VicWrbhG4fuxnN6HgOaTsN/zRCkNGZ+SfNmABsWGhqTa3MZ+yyLq
 gJLi4P0sH8sQlpS8xGYI41yw2JiDwRV4XtcgmIEAtV4Fi33WU2Z88/NwFTq2XFC0CExX
 busWarjHtqpntXHojK6YMwaKr1vHzGk6o6Ay9BViYSC98mPqm4Y5YRK2vMueum+qYVUW
 HWnZByJn5HcIlHuXDQyEfDYJ0BztBV+eXhBPnGg5bvqyTlZ40dbNVZSg5NbunG+XFHh8
 KFY5AN11S1oD/meXVqVIq/GviNUoWp1FjiYm9kOUwcfSE8hl+dWu1ZE/6wlgzznVMruY
 mmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=06M80py+OrOgo69F5ZheKoyECC0h3DXpLoaktfAfRwM=;
 b=layyKHO0fQJs7lEo7QYl77BtEyIRIZGZlW+jyIcLL4J7p3J3lYMLl+LQQ5CfS7DYEo
 ZElyoJgwqoeKnT0vA6WctEJzNAuqK681SXQj2ha7U/uYGS4UbNsnM2VqjbvMZCRm6FRB
 k41rgNVs6R3npfRz+dK6DyfhnbS7FgyQtGE93T8hC7mJj52oPmNNYE7uVFJWeODwlBcl
 NXn9vF4o99HbBOB1I1rEDX1RIL0GO8cyWzGpJLdoqflDn4TJmq4Wmj1QuADAimxuBfjc
 YUO/t2RSuoIvf1A3TaHJB+mn7sAS9gb9b+cv+dE7O/OzyYvamrJUcv6ZkDkby88A9K/z
 CaXw==
X-Gm-Message-State: AOAM532xPJNkzRSkBkVpeUNHLIKLjTlYe6cMCuZfNr6CaRh+80RQgKht
 H4MEwp0nokaOfzt7p9/Bs573EA==
X-Google-Smtp-Source: ABdhPJzxuDlqL4/J7vHnWwTdpty33VmdJcFIrzjoj3XSwPzBFnpmEPFuyVZHlx1dh6d7XyOkEjX08A==
X-Received: by 2002:a1c:7216:: with SMTP id n22mr19263777wmc.189.1593596527996; 
 Wed, 01 Jul 2020 02:42:07 -0700 (PDT)
Received: from dell ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id b18sm6855206wmb.18.2020.07.01.02.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 02:42:07 -0700 (PDT)
Date: Wed, 1 Jul 2020 10:42:05 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: lms501kf03: Drop unused include
Message-ID: <20200701094205.GB1179328@dell>
References: <20200625232512.282178-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625232512.282178-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNiBKdW4gMjAyMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhpcyBkcml2ZXIg
aW5jbHVkZXMgPGxpbnV4L2dwaW8uaD4gYnV0IGRvZXMgbm90IHVzZSBhbnkKPiBzeW1ib2xzIGZy
b20gdGhhdCBmaWxlLCBkcm9wIHRoZSBpbmNsdWRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvbG1zNTAxa2YwMy5jIHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0
aW9uKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlv
ciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVu
IHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBU
d2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK

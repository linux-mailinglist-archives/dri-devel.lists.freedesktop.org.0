Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3854EEA6E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 11:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644AE10E26E;
	Fri,  1 Apr 2022 09:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139F010E26E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 09:29:49 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id ke15so1564109qvb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 02:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mbn8b1Y80pAlAHrT4xLFWR4kpzjIAzXFAHvkgLMTl5k=;
 b=FKp67qcp7ziPvP93i2jFmH8Z8tyYaMtb3DTskFWFsbILCFFdFIeI+kqOBDcp0IqXhq
 Uu1n4VQhxH1Cxo1nLzqGsdcjweQLy1xuwIjj0OVXUAwByWfdIGZFvfKgX24SWiwhRGYF
 /0WuSSis5I/w1lxF0zFOMr9bc3eR4hWOQoOByFMh7qGhD1AujWnPPVHuSqcsCokKa1G5
 RU53gP1iKeW5HIAF8XdLSNzSnKqb8ZJ6d51IVvNbpG1R2FTZT5ahzx1JNBz4yBuIRfBq
 5MJXKz05BfgcNjzyxuYWNCQB8GeXyzxOrGQZ4mp3YqBdXlq4/KEGRf8BnbhxappT/cfX
 VqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mbn8b1Y80pAlAHrT4xLFWR4kpzjIAzXFAHvkgLMTl5k=;
 b=3YoIkVK/0lqNvYKV2Rqt4cTB2D6rv1Jr6x5VdcBDC08fWysCtjfhY0sAKHSaVOUWv1
 Z7d82JEX0CcVzxJQk7qZvtTpOZEo2fQa7A5kzRmSxq97ua0Gljx1/IospH9DIK7QZmNE
 1SrjtyhGt0SxwajUq5+t9AROYdXI0fcmkE3Gc3ZCcTaLfRAYK3q5iH1VwXmW3cmHnWcK
 Sc+cMs6ejmwBMGUcfmZpdDJhwnNnecjI+QdaxLGQeewt/64jbpUah/KZB/oihNWfvoJc
 pbGpQ9v3nXHeplfKI0HGutvKpReY5UkTAvRB6Bpj5vcy8sMHydN/m6Z2X1ew+ujYLJLz
 dp0w==
X-Gm-Message-State: AOAM532GIO9ttEj//Sev2+sLToXzjkZQFh14rM6PFPf/uTq/zXxtsMnT
 fMQmG7hf7fY3feavqqIYFhKynlbSDCuInvXo5okUEw==
X-Google-Smtp-Source: ABdhPJyX0SuUj89u/sz5RsjvJfjF14dXw4PXUljF/o1zjASCFOWMvq4ztJN6DGCU+uI8uCxbH9PsJWQuMBWNtSqCL4s=
X-Received: by 2002:ad4:4eaf:0:b0:441:7ff6:f639 with SMTP id
 ed15-20020ad44eaf000000b004417ff6f639mr7092394qvb.73.1648805388087; Fri, 01
 Apr 2022 02:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220330190846.13997-1-wens@kernel.org>
 <20220330190846.13997-2-wens@kernel.org>
In-Reply-To: <20220330190846.13997-2-wens@kernel.org>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Fri, 1 Apr 2022 11:29:37 +0200
Message-ID: <CABxcv==6imu7Vc3p9ji=_+RFQZm2O65JCY7LLERsbAsgaRaUag@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add prefix for SINO
 WEALTH Eletronics Ltd.
To: Chen-Yu Tsai <wens@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Chen-Yu,

On Wed, Mar 30, 2022 at 9:09 PM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> Add a vendor prefix entry for SINO WEALTH Eletronics Ltd.
> (http://www.sinowealth.com).
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE8348A05E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 20:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A17910E197;
	Mon, 10 Jan 2022 19:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F65C10E197
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 19:44:26 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so16138906otu.10
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 11:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EZBK0oFNH2/W2DrO7l+FshtEaU1QbkTH5JA6mptoxOM=;
 b=ZYzh3FXpMATQK2pAg91y1yioTMuXvFfng5VpoD1EF738VQs+W16aeIHlTk6laHXFQ2
 yRKedIweUJwVIj5PNO6De4ZzZqEABETLxgywfMY0AgptmJVzcBHEvIt8AYaYtqbld7bM
 eEab58MoC5aERYwxVhfK1Ngl0EpXicy3aVqsnCJ9lDdoWWFCSl64LmkIB4Bz9ibjRv7P
 wzd8sQiq2IRcl4EPXzq2tCFnrrmP/COf96yGvJqE9XF1JQo9Ro6dgSX6CvIBWMh7NqyQ
 e31QmB/UdUtGydOiwdPU2R59hTiFXgzpvZgiZyfFha+EiyX9940D/pkR4oo8sAJs4/3Y
 +FRg==
X-Gm-Message-State: AOAM530mKuV9UQEfRNerrcZ8j9dIDTPw5bm8JCiryIPtC6fEPqkHCI1U
 YkZAaQfI7fUwwyNzfXSbnA==
X-Google-Smtp-Source: ABdhPJyPWXNo9u1HoK1u2CGHhc5RKtLNjdegJxxJSZbcZE0nSiaSrAtzDQPyqq86BxZNsxnLhcpDcw==
X-Received: by 2002:a9d:65cb:: with SMTP id z11mr1011382oth.241.1641843865304; 
 Mon, 10 Jan 2022 11:44:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 186sm1304268oig.28.2022.01.10.11.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 11:44:24 -0800 (PST)
Received: (nullmailer pid 1374641 invoked by uid 1000);
 Mon, 10 Jan 2022 19:44:23 -0000
Date: Mon, 10 Jan 2022 13:44:23 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH 1/4] dt-bindings: backlight: qcom-wled: Add PM6150L
 compatible
Message-ID: <YdyMl5Ma6yM0Cbga@robh.at.kernel.org>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
 <20211229170358.2457006-2-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211229170358.2457006-2-luca.weiss@fairphone.com>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Dec 2021 18:03:55 +0100, Luca Weiss wrote:
> Document the compatible for the wled block found in PM6150L.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

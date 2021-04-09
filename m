Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADDF35A2CA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 18:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259746E4B0;
	Fri,  9 Apr 2021 16:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD81B6E4B0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 16:15:11 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 s11-20020a056830124bb029021bb3524ebeso6251506otp.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 09:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P0YqXjiG5XlL0d3JhTX/lPRzYOHWj0/xwr5QmzvfrXk=;
 b=nTLTJ7eg8nx4LqdLDWluiIQs5iMgHOzI/m5Hs1uXYjwZPT6y7h2LUKMkk80fXpVG2H
 jXshSrRUHUSNWlv3HUokG1jnOUlApK/39jWQj/EMWOvGL0Jh9HXCIQ4A0wer7CwmOS/0
 oDnyLu76P83gPLwo+oAaV44zAcgTYmBScwrAyFWEJvF1ixCjrktx6Vd73tWW9u49PUz7
 OU9S3AQxmThjv6uVe0lB431ilRC6QYq75x/gGSRnJ0HDehZogkZGCAvdss/Cqar2IVXq
 krpjwB1eVVj7TKXX/0aPHOItH7mzt/Ol6ZzWrc6kRDFAxd7FRXAPUqb2bRqyx0pTTBXn
 WJHQ==
X-Gm-Message-State: AOAM5322IHtaHb7alAt/NeWjsg9JSbLzQpVDmIA5N2g8HmuK11M7l0Jr
 28F6ttpWjOcIgyCx4yN5YA==
X-Google-Smtp-Source: ABdhPJxQAUJozP7dkE3TP4Ru1Wndxn5VXn5j0lIv7IW6cHFLR+sFshV5R3A5dQLyD6v3Ti1cKH5O+w==
X-Received: by 2002:a9d:68ce:: with SMTP id i14mr12368642oto.151.1617984911083; 
 Fri, 09 Apr 2021 09:15:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j11sm601021ooo.45.2021.04.09.09.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 09:15:10 -0700 (PDT)
Received: (nullmailer pid 3745702 invoked by uid 1000);
 Fri, 09 Apr 2021 16:15:09 -0000
Date: Fri, 9 Apr 2021 11:15:09 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel: Add DT bindings for Samsung LMS397KF04
Message-ID: <20210409161509.GA3745656@robh.at.kernel.org>
References: <20210405234713.3190693-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210405234713.3190693-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Apr 2021 01:47:12 +0200, Linus Walleij wrote:
> This adds device tree bindings for the Samsung LMS397KF04
> RGB DPI display panel.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../display/panel/samsung,lms397kf04.yaml     | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

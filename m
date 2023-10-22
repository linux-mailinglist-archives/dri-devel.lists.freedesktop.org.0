Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4477D2675
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 00:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5E910E10D;
	Sun, 22 Oct 2023 22:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7B710E10D
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 22:03:14 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-5a7db1f864bso26132027b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 15:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698012194; x=1698616994;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZftAID17R/O5TnG/ZVb5CfzK+0hZMm/GujeNOI0vgU=;
 b=I9ZaPpb5+TpV41caT/JornmhY3oKDZpnoTcks0i1n0EZwnf50SXDGLzCA4YnlOqrpJ
 a9e9HN3TViKZJYj0qbV8Yggih0NdPygKCgXnV4Jr+FNYB65df5FJfNwEKRY6K4zs6yg0
 ayRS7b8P1VglQH+WPRcNbYexFuYg2I5Mg5DBxHjz7XMY5awM6iaJ6dd3O5DOSRR5gkpb
 mh4iQpLtM/edM+5u+4If+xwrC3/TOckaQMYXvzeJ+cF7U1BqNfDKauok5jMDtL8Xw0D7
 qnnwkJDFf6ACI8wIVl6ECKO75nvKILxAwt0phHmK0e+hnvj9kOm8R7135MOXyMD8Y6t3
 KV3A==
X-Gm-Message-State: AOJu0Yyl/fOBw216r5ILpzf/l30FuKOx+0dSaqKFD7ESPCh2BGbkzpGB
 Jg1mrkkf4kwklZe+xZ0/4v9H2fhGWw==
X-Google-Smtp-Source: AGHT+IH4GRHWPyIQ6ZD5MzSOi2sQSkpySm5ebijuBH3eIFTLnditkED8hYytsoWJLBPv7KNhjOWCUQ==
X-Received: by 2002:a81:d442:0:b0:5a7:fcae:f3e2 with SMTP id
 g2-20020a81d442000000b005a7fcaef3e2mr8072387ywl.43.1698012193731; 
 Sun, 22 Oct 2023 15:03:13 -0700 (PDT)
Received: from herring.priv ([2607:fb91:e6c1:8e5d:a109:ceb8:bec4:d970])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a81d253000000b0057736c436f1sm2555919ywl.141.2023.10.22.15.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Oct 2023 15:03:12 -0700 (PDT)
Received: (nullmailer pid 747792 invoked by uid 1000);
 Sun, 22 Oct 2023 22:03:10 -0000
Date: Sun, 22 Oct 2023 17:03:10 -0500
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] dt-bindings: display: ssd132x: Remove '-' before
 compatible enum
Message-ID: <169801218855.747717.5658253186246322717.robh@kernel.org>
References: <20231020223029.1667190-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020223029.1667190-1-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 21 Oct 2023 00:30:17 +0200, Javier Martinez Canillas wrote:
> This is a leftover from when the binding schema had the compatible string
> property enum as a 'oneOf' child and the '-' was not removed when 'oneOf'
> got dropped during the binding review process.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/CAL_Jsq+h8DcnpKqhokQOODCc8+Qi3M0PrxRFKz_Y4v37yMJvvA@mail.gmail.com/
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  .../devicetree/bindings/display/solomon,ssd132x.yaml      | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


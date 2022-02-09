Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9694AE76E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 04:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0AC10E19D;
	Wed,  9 Feb 2022 03:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D3110E19D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 03:06:50 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id 4so1146734oil.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 19:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LVeDVNu/BCICylDILAovuwAjxje6g+Ysjhgt1fngzyo=;
 b=CCoPCkaF2reFstZmAJiFV3fDuXtx1P87tXUdSvSb+MnpKRD5WWnCsFeslepihkYmz+
 hiizBy43OsE3NUV8HigwvMqCJ95wqU8QljnklLhRy4GD26xRh97rjiZ0moyHpeGwX1Fw
 3SaSpMuPvIzpxr68WbjgJzfkaknPLE0ZHiOatdOhD0locUJXJMgEkJ+FqTkxoP3wb35O
 l6IH9nSl3FIAtnwdeqoNyAAOQL3WS44WMgqXN/mjT0vqZAk4ng/AsKsmNI/feo+MbQ4X
 iaInp/9kJEqd75qaOwWxalMV9MphJHxYRDuI40fN4SerDoLehBPDJdIns197f5F5lmDP
 pL1g==
X-Gm-Message-State: AOAM532g0FpiW4Wca7qJ9w1/l+t8Rh3e2IpS5Jlvd5Bbz4W+IcfqTkPI
 zBPpDq5jBhTR2BPLlmcvIQ==
X-Google-Smtp-Source: ABdhPJx7cq9TDX0KZTFuW81BDWG1EoY4kxSCvCuwLrOluU5T0RnjLOr+uJoVJdCOGfn8uJmNHIWu7Q==
X-Received: by 2002:a05:6808:1702:: with SMTP id
 bc2mr484788oib.214.1644376009186; 
 Tue, 08 Feb 2022 19:06:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j19sm6006307ots.21.2022.02.08.19.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 19:06:47 -0800 (PST)
Received: (nullmailer pid 3546662 invoked by uid 1000);
 Wed, 09 Feb 2022 03:06:46 -0000
Date: Tue, 8 Feb 2022 21:06:46 -0600
From: Rob Herring <robh@kernel.org>
To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 3/6] dt-bindings: display: visionox-rm69299: document new
 compatible string
Message-ID: <YgMvxpbUpgw3XdxS@robh.at.kernel.org>
References: <20220123173650.290349-4-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220123173650.290349-4-caleb@connolly.tech>
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
Cc: devicetree@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <keescook@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Tony Luck <tony.luck@intel.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Anton Vorontsov <anton@enomsg.org>,
 Harigovindan P <harigovi@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexander Martinz <amartinz@shiftphones.com>, Andy Gross <agross@kernel.org>,
 Colin Cross <ccross@android.com>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Jan 2022 17:37:41 +0000, Caleb Connolly wrote:
> Document a new compatible string for the second panel variant.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../devicetree/bindings/display/panel/visionox,rm69299.yaml   | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

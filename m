Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2419498404
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD2210E2CC;
	Mon, 24 Jan 2022 16:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F3110E2CC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:01:18 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 s6-20020a0568301e0600b0059ea5472c98so7097204otr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 08:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=4oDy0h+Kn1sS1/A4tfxNkpnbvwT3eD0GbpthjgEWnmw=;
 b=bvxuILGwk09zygW9Il2+VKBYZwCWMaRo1WIH3YG5d02dEwm95TWkYUebrz7zjYOLU+
 +zp8ud7vYWOzkgQkCu8o2UHMsm86Apd5OvpINnw1Ddz/uwmZpbOFyQ1GJJBQ51TQyCsk
 S17m9ZJocfXa6SGqsfmCzsrLOJkIIE5vzfWQDKGfEVmCVLlfIaS4wigcSaw2J35aUXkD
 3amqaBHloxsbSUwZJI9lcH13M0kJInpoR9EFJVaJvL0mXRPfJPZUpPAefKSFmLzr6F0n
 VVnZwQsKZIVcrQtsbswFR0QR6emgxmz0J0dSa5+5QtCikoCbbi3BB9kxTgLbne/vaZhT
 p/Eg==
X-Gm-Message-State: AOAM532sd5BX013Wpfl5E0yhJKJBLnVLAm7PuY0YaNbdO0bg+qpNhjrj
 emYgruTMlr8dgfYmEXBe8A==
X-Google-Smtp-Source: ABdhPJwRM5ALOhU/Vs9GjW7lmhl/9UMYuTfoILSHm228ySaR1KNsxNhbTvaDMWCOm/oq3fu6Ovy/Qw==
X-Received: by 2002:a9d:4b08:: with SMTP id q8mr6966159otf.181.1643040076418; 
 Mon, 24 Jan 2022 08:01:16 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i13sm5353082otl.46.2022.01.24.08.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 08:01:15 -0800 (PST)
Received: (nullmailer pid 3901529 invoked by uid 1000);
 Mon, 24 Jan 2022 16:01:12 -0000
From: Rob Herring <robh@kernel.org>
To: Caleb Connolly <caleb@connolly.tech>
In-Reply-To: <20220123173650.290349-2-caleb@connolly.tech>
References: <20220123173650.290349-1-caleb@connolly.tech>
 <20220123173650.290349-2-caleb@connolly.tech>
Subject: Re: [PATCH 1/6] dt-bindings: input: touchscreen: add bindings for
 focaltech, fts
Date: Mon, 24 Jan 2022 10:01:12 -0600
Message-Id: <1643040072.587317.3901528.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 Alexander Martinz <amartinz@shiftphones.com>, linux-arm-msm@vger.kernel.org,
 Henrik Rydberg <rydberg@bitmath.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Harigovindan P <harigovi@codeaurora.org>,
 Colin Cross <ccross@android.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Andy Gross <agross@kernel.org>, linux-input@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Anton Vorontsov <anton@enomsg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Jan 2022 17:37:27 +0000, Caleb Connolly wrote:
> Add devicetree bindings for the Focaltech FTS touchscreen drivers.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../input/touchscreen/focaltech,fts.yaml      | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.example.dts:21.9-14 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1583161

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


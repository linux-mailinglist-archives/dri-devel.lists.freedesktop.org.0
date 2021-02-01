Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A21E30A977
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 15:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65244894EA;
	Mon,  1 Feb 2021 14:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DE7894EA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 14:16:51 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id t25so6244977otc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 06:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=j5AzmbtQLD6qvkbcKGfw8vqLisCSy+bTOHK7NQK+zqs=;
 b=qm+JpAByxF43wIJW4ttNw+VOPupTb6HE2tPxf6lCXFVta5xGkyKrhC/HWyv8lvbC9X
 wvPn6FJJzOW5S4KsHOq2r02PZ40KaWgEzW6J+ArIkVIREjeAFnH1ensmvuyodlduJE+M
 kkovEO+7nIBnZZugD2YNQo4V1/SZJDlMVn41TkK69Twp8r7suVOJiEzHspNsFCfPWhHU
 fzk2hqtFFWkhzt29aPmguKCNV38v6bt89rbiB89SjWpIaEVEL/yjkRzQzNIWJy5Ne+7r
 T4vT/f9OwfBqkxpUV4nF1a6hpRo9M6U+Xp1PjhBsjgrQ/NY6In6/FwDJ5P0gwIHlURP8
 sazQ==
X-Gm-Message-State: AOAM531h4uJZe15ghsgsyjRYBsGXDm+NXGnsytfLEWA5NkIaBBGmSDin
 HlNB69kVb7I+nr3rB06V/w==
X-Google-Smtp-Source: ABdhPJzh31Z9pmkLhq6hmLPPwSnMKUcOAuOdroAZX6HoZJrMnw++Uk+pF8jLAepwKUo1G9Ca2sSgmg==
X-Received: by 2002:a05:6830:24a2:: with SMTP id
 v2mr11469559ots.298.1612189010707; 
 Mon, 01 Feb 2021 06:16:50 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 69sm3922712otc.76.2021.02.01.06.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 06:16:49 -0800 (PST)
Received: (nullmailer pid 1041707 invoked by uid 1000);
 Mon, 01 Feb 2021 14:16:48 -0000
From: Rob Herring <robh@kernel.org>
To: Iskren Chernev <iskren.chernev@gmail.com>
In-Reply-To: <20210201103712.1619585-1-iskren.chernev@gmail.com>
References: <20210201103712.1619585-1-iskren.chernev@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: panel: Add Samsung S6E3FA2 panel
Date: Mon, 01 Feb 2021 08:16:48 -0600
Message-Id: <1612189008.116859.1041706.nullmailer@robh.at.kernel.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 01 Feb 2021 12:37:10 +0200, Iskren Chernev wrote:
> The Samsung S6E3FA2 AMOLED cmd LCD panel is used on the Samsung Galaxy
> S5 (klte).
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
> OK, miraculously the panel turns on and off now, so the simple-panel can
> graduate into its own driver.
> 
> v1: https://lkml.org/lkml/2020/12/30/293
> 
> Changes in v2:
> - move bindings to separate file, add 2 regulators
> - add standalone panel driver
> 
>  .../display/panel/samsung,s6e3fa2.yaml        | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.example.dts:28.50-51 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/display/panel/samsung,s6e3fa2.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1434112

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

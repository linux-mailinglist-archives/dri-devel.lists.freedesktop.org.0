Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056D253A078
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA8010E6D3;
	Wed,  1 Jun 2022 09:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1358E10E6DD
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654075999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VuuX8qrSGJ4hyfsiDt/rM6t9GO/71AZB53O3hdvqWXI=;
 b=bdhC3W64gChtxoHObZd7iUZujqSUpNJcWAzohxM3p4miDLAyhzRz3gmGiCcjfvtb5yJZ9x
 7r/2utIx+uA61BMON2Giq85gauC682+cyglTmiWCxVtPcFdSF4+q39jSSOSi0r96HYWTj7
 kRQh9YA5nmiXwX2nWOf1lpPhonHvw2Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297--40dUVQgNe-z3nhEAkvJvA-1; Wed, 01 Jun 2022 05:33:19 -0400
X-MC-Unique: -40dUVQgNe-z3nhEAkvJvA-1
Received: by mail-wr1-f72.google.com with SMTP id
 p8-20020a5d4588000000b0021033f1f79aso170248wrq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:subject:to:cc:content-transfer-encoding;
 bh=VuuX8qrSGJ4hyfsiDt/rM6t9GO/71AZB53O3hdvqWXI=;
 b=JHIaTrpQRS4eq3X0q+NyJ9yOwjjVfJb3vQUpOlh1zUHvBY+1Mcvfnwll9NsNvHe/gU
 SfLQBLP5FT0xuBZm8LVFXAkL8jcP7w0LkEaEmVY/frZqrbcGLWMXgZQJ9mOv8XOxvVqJ
 jJkXXEcmZHqlBcbjPvQqWvWrkQ7e+bAm2aTbz0nZ7CDKRRLLDwk01DhsYsI+/Ic1vq3z
 NiGMboYvjyHZ7E3kllxfMyr9GCOGBLZfrswvOvEGCuE48sfU/PEuK6M7bBQrxLRianK7
 qbXza9DWcj8rZC5Y2j411HA/uINnchdtyb6NxWkifgf7PdlOr3R+UuXXX+6gK6pneHW6
 aWWQ==
X-Gm-Message-State: AOAM533LsOxGI62BBsJ34ha2VRBpQxtj6dhznARAsOkF7uugllN4fuav
 NapeNhPRVCktig/1lGIoqzE+V62H4ZQm3rzMK1fR0Ne7/dq5RpS+/k3gZJbt4OsF5TmJjURn47p
 MOvWuQ4xDnGcZssL3gbnqj9zrUaOL7eiXWR7kmQG3iHqyrYR/kduOy0AaE78KWPiY4JevVXIUIe
 xh3s3b
X-Received: by 2002:a5d:584b:0:b0:20f:ec17:30b8 with SMTP id
 i11-20020a5d584b000000b0020fec1730b8mr35520940wrf.461.1654075997593; 
 Wed, 01 Jun 2022 02:33:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvPKsSO/EFfPQVcpaiIDFTmJhbxQDRZXO4y+u2IxIwew8MR3rn8Ub+0M0Zn3HNAQ5cwMZZdA==
X-Received: by 2002:a5d:584b:0:b0:20f:ec17:30b8 with SMTP id
 i11-20020a5d584b000000b0020fec1730b8mr35520919wrf.461.1654075997356; 
 Wed, 01 Jun 2022 02:33:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b0039756cdc8e1sm1362865wmo.37.2022.06.01.02.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 02:33:16 -0700 (PDT)
Message-ID: <d84ba981-d907-f942-6b05-67c836580542@redhat.com>
Date: Wed, 1 Jun 2022 11:33:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [REGRESSION] VGA output with AST 2600 graphics.
To: dri-devel@lists.freedesktop.org, kuohsiang_chou@aspeedtech.com,
 David Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: regressions@lists.linux.dev, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I've found a regression in the ast driver, for AST2600 hardware.

before the upstream commit f9bd00e0ea9d
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f9bd00e0ea9d9b04140aa969a9a13ad3597a1e4e

The ast driver handled AST 2600 chip like an AST 2500.

After this commit, it uses some default values, more like the older AST 
chip.

There are a lot of places in the driver like this:
https://elixir.bootlin.com/linux/v5.18.1/source/drivers/gpu/drm/ast/ast_post.c#L82
where it checks for (AST2300 || AST2400 || AST2500) but not for AST2600.

This makes the VGA output, to be blurred and flickered with whites lines 
on AST2600.

The issue is present since v5.11

For v5.11~v5.17 I propose a simple workaround (as there are no other 
reference to AST2600 in the driver):
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -146,7 +146,8 @@ static int ast_detect_chip(struct drm_device *dev, 
bool *need_post)

  	/* Identify chipset */
  	if (pdev->revision >= 0x50) {
-		ast->chip = AST2600;
+		/* Workaround to use the same codepath for AST2600 */
+		ast->chip = AST2500;
  		drm_info(dev, "AST 2600 detected\n");
  	} else if (pdev->revision >= 0x40) {
  		ast->chip = AST2500;

starting from v5.18, there is another reference to AST2600 in the code
https://elixir.bootlin.com/linux/v5.18/source/drivers/gpu/drm/ast/ast_main.c#L212

So I think someone with good aspeed knowledge should review all 
locations where there is a test for AST2500, and figure out what should 
be done for AST2600

Thanks,

-- 

Jocelyn


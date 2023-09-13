Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01F379E653
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 13:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7CB88697;
	Wed, 13 Sep 2023 11:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7DA88697
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:14:43 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-307d20548adso6774243f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 04:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694603682; x=1695208482; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Sz/2Xhp1w0ethYXV/2klfVqKt4JNZvE9WLZJG9+QLJc=;
 b=GEyuBq6A3pMbPS/fJjMMopVCWH8Rs46zKYr2wbrRtZKqR7dL7prUrJtvhG/yA+yqes
 74r+EdnutSKNSGmdgr4lnft9MYGnWTFMRrdvNUmEra5lGw/kiESRNWjfpWEya9CzUdlG
 hTrk6/1fvw47pnSlhquOZ6ib4U7vIAO3KZvPfipHdcghWtdImzp0rpq9sj/2cTPm5RrG
 bEGg5UgZMAEXTL8edZSZu2KzZX8ibR5NcnRfXIg6JYiI5l7K6uQhNZY6HhgsPdehtBvl
 SHoxu/0X16RB4d5Y4+PbbW1m1LMbbcQ/sK61qcn5SIxFq+9xYo5kSpZJq4F0EEH1fCEf
 HgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694603682; x=1695208482;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sz/2Xhp1w0ethYXV/2klfVqKt4JNZvE9WLZJG9+QLJc=;
 b=D3RWAYknB8w7R04w0KLDYGdrnQBaLvPt4KGkfBzBKAnqbPgt3wO3p4Y+ue0NkX849Y
 b+BDWIFhopLMWjjruxl2zblh2rO43Ufx9W0w68zfxk+XCgmGl5ZW5CaZGfUTpLZrHgri
 LufKRauHezu4O9MMnoB/Ed+LZ0/+etTSog0XKq8q3yz8Ss0/7SeHRCWj2NuoAYbYV0iG
 10JLvOPaeZOIdp6G/nw3Pnw6UfGWMp2LnQm4jpwCaQDbYOIbqvTCdtK3rKFSdL/QJaO0
 CoxtwYUNxKKucKKwK4S0DhK92FiqMZzPGYolI2PKzXjrbE4CSlITIkD+2GiBJmQGuG2Q
 fOTA==
X-Gm-Message-State: AOJu0YwIFeZ3TM/zHv5CfgrhUZUm0N7J7q7STjjSoeSiPoSSwKggsuSt
 P/BYNHvYCDiNHmPstD66m8irSg==
X-Google-Smtp-Source: AGHT+IFKzaCiQkryqApXLRa+CYcF3hfZn25Ngb2HWUfxb6L7XhhpPpyalv8q/7qHay4WnBD23TidEQ==
X-Received: by 2002:a5d:6650:0:b0:315:a1bb:4d7b with SMTP id
 f16-20020a5d6650000000b00315a1bb4d7bmr1947207wrw.35.1694603682309; 
 Wed, 13 Sep 2023 04:14:42 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 h17-20020a056000001100b003197c2316ecsm15115280wrx.112.2023.09.13.04.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 04:14:42 -0700 (PDT)
Date: Wed, 13 Sep 2023 14:14:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johannes Zink <j.zink@pengutronix.de>
Subject: Re: [PATCH v4 3/3] drm/panel-simple: allow LVDS format override
Message-ID: <e6a2df72-46cb-4f22-b983-ac5ad2995da8@kadam.mountain>
References: <20230523-simplepanel_support_nondefault_datamapping-v4-0-e6e7011f34b5@pengutronix.de>
 <20230523-simplepanel_support_nondefault_datamapping-v4-3-e6e7011f34b5@pengutronix.de>
 <96898dbb-3fdf-7a74-ae80-f18ae2244f50@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96898dbb-3fdf-7a74-ae80-f18ae2244f50@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dan Carpenter <error27@gmail.com>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 patchwork-jzi@pengutronix.de, kernel@pengutronix.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 09:04:34AM +0200, Johannes Zink wrote:
> Hi Dan,
> 
> do you have any input on this for me?
> 

Sorry, I was out of office and the truth is that I'm never going to
catch up on all the email I missed.  :/

Looks okay to me.  I can't remember what I said about this code in v3
but it looks good now.  I'm not a DRM dev so I'm not sure my review
counts for much.  You should always just assume that if I'm quiet
then I'm happy.  :)

regards,
dan carpenter


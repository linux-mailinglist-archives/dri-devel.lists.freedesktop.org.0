Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB98F7EE52A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 17:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A19D10E622;
	Thu, 16 Nov 2023 16:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B062A10E622
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 16:28:58 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-1f03d9ad89fso490388fac.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 08:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700152138; x=1700756938;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SHpsolomr1O8IoNZNmWuKJghrcMhtNlGZuOKvxu4Hyg=;
 b=d/Wg5vbNXnxmOArQFmh6RNKM84bpuxAXaL30Gjq4O83F2rQU5gqA/eFmtBvRg9THEy
 D5tUwe2xd1j+s5mh1nu3wLQ5yAs6MXVWdOgdMLA4sbbcjR8ym1l9QlNmgntkXMFIhgaq
 4SWC2vtX2kxOaajGoffV3tPfEK5RLf0pGkDmEZS2d/XOed8/rCjLGH1+6CWM/yzf5Pfd
 zijCgBhth3ZOfy7LutghjXM90tJHaz5czkbiiqPnKzROQFh6XM5LT7pvwZrbZoKpRbVj
 fK8XLMzhIsvADZCQhanKAkQJGO35cMa2A7FFEd0okI5geCrNt59JqRXwKkmtiE9Jn2fm
 migg==
X-Gm-Message-State: AOJu0YyMGI2RkTYaez75ThPuQfiQICwPs5sys9047Dzk4EtLHrafQ6Cm
 ScahVdscRv2Lzh9ppIk9i8ROa071Wg==
X-Google-Smtp-Source: AGHT+IEN7OCfu+AaT2L23F6tUrWC+9ztcQ5rH5Mxyh/0SpCy8jBoSr8cd13j15tMtuSmOolw2nIBzQ==
X-Received: by 2002:a05:6870:6c05:b0:1f0:6931:e301 with SMTP id
 na5-20020a0568706c0500b001f06931e301mr21055183oab.0.1700152137858; 
 Thu, 16 Nov 2023 08:28:57 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bp9-20020a056871280900b001eb79fedbb1sm2156514oac.17.2023.11.16.08.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 08:28:57 -0800 (PST)
Received: (nullmailer pid 2438161 invoked by uid 1000);
 Thu, 16 Nov 2023 16:28:55 -0000
Date: Thu, 16 Nov 2023 10:28:55 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: gpu: samsung: constrain clocks in
 top-level properties
Message-ID: <20231116162855.GA2435337-robh@kernel.org>
References: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
 <20231112184403.3449-3-krzysztof.kozlowski@linaro.org>
 <20231113-sultry-cold-d63dd9f015d9@squawk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231113-sultry-cold-d63dd9f015d9@squawk>
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 13, 2023 at 01:51:30PM +0000, Conor Dooley wrote:
> On Sun, Nov 12, 2023 at 07:44:01PM +0100, Krzysztof Kozlowski wrote:
> > When number of clock varies between variants, the Devicetree bindings
> > coding convention expects to have widest constraints in top-level
> > definition of the properties and narrow them in allOf:if:then block.
> > 
> > This is more readable and sometimes allows to spot some errors in the
> > bindings.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> Åcked-by: Conor Dooley <conor.dooley@microchip.com>

  ^

Not an 'A'. I only caught this because I go thru everything 
Acked/Reviewed-by first and this one was missed.

Rob

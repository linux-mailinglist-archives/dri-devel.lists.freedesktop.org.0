Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A04727298
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 01:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FD310E56A;
	Wed,  7 Jun 2023 23:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848A210E56A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 23:00:06 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-33b6c47898dso10159495ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 16:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686178805; x=1688770805;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NlONoXmbAqzEpekRPJhtmbZIlf4yXIja9vsOSA5b5Fk=;
 b=Qbyxd+TFZMso/l3UwNsonykTy/S3LsbVNaUQ+9XgFtLplIjwlURClWOOMZeTMI4MLu
 zJ4HAC9vncp391ws/s+cs+L/vHAShI0wAVle5xesIPgNCmql2FC0cObIr8zEoZvCKTZo
 BtNTaQrrRl0WOntOEnI+q71I7//nKw2S2/5+f9z+GozEOXt87fArINcr8GPETHH9DaAF
 TxiuPa3UFwEM+erPTbSukSq5vgYY8cxEfkbA1JdhkvE3FFF+4F36reeQX3E3Rr7mw/Fx
 xMsdj37/s+ldwkoDSsB3WyMazXtEDUEgCZYxdViZE6z5lE7kLkDXpjMG02nVTK7jgv2+
 ENgg==
X-Gm-Message-State: AC+VfDwoR/WUzKEnhKf8td0L7NNXoXXyeuYya6bBWHADIP8rwzSlDiAi
 wglywWAR1BSBMprXoHC4hA==
X-Google-Smtp-Source: ACHHUZ5XLGT5D0LNOOpdM+A2ktKD23DvK+8Pd9h0qT0PM3ZSd2vUjHuHYKrVV2oicPsU+kmTe/2MfA==
X-Received: by 2002:a92:d5c2:0:b0:33a:a518:653f with SMTP id
 d2-20020a92d5c2000000b0033aa518653fmr11105782ilq.15.1686178805332; 
 Wed, 07 Jun 2023 16:00:05 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a92bf03000000b0032b72b5c1c3sm33498ilh.9.2023.06.07.16.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 16:00:04 -0700 (PDT)
Received: (nullmailer pid 141320 invoked by uid 1000);
 Wed, 07 Jun 2023 22:59:58 -0000
Date: Wed, 7 Jun 2023 16:59:58 -0600
From: Rob Herring <robh@kernel.org>
To: Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>
Subject: Re: [PATCH v1 2/8] dt-bindings: display: panel: mipi-dbi-spi: add
 spi-3wire property
Message-ID: <168617879603.141215.16607194482665688976.robh@kernel.org>
References: <20230607115508.2964574-1-l.goehrs@pengutronix.de>
 <20230607115508.2964574-2-l.goehrs@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230607115508.2964574-2-l.goehrs@pengutronix.de>
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
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 07 Jun 2023 13:55:01 +0200, Leonard Göhrs wrote:
> Some MIPI DBI panels support a three wire mode (clock, chip select,
> bidirectional data) that can be used to ask the panel if it is already set
> up by e.g. the bootloader and can thus skip the initialization.
> This enables a flicker-free boot.
> 
> Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


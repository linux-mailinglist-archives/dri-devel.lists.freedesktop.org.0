Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53DC7CCA50
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 20:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADC510E30D;
	Tue, 17 Oct 2023 18:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4436B10E30D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 18:04:49 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6c63117a659so3633289a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 11:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697565888; x=1698170688;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EQMZZNtwxKp6PHrZvBpFDkR2RCeELkDJh7t0tRAV+Uk=;
 b=qLSw8X8JQ1HG3FSl9vHY23X4fbnUk8LXvtHPp8O5d6s9zaOMk5Z6uMD6tc8nVXnP+l
 za9PQVoN/cZAxOVDw/SDhFXQW1P1SvgVhARJtT3alLUWAn+mOJKM1A2BNDvSxOzRUgfy
 O8RCJOweVff5PvBGsDTQqCVqm5KcSrUdDs3ZPgNDLhSkKTIKUErgOTcfnM2cs3A21k+e
 zfmgVUm6jNfel87nZnQ6EAOk3Ug+qOu0AHR6P762yEurqanUqYJCvKVhv987Z2tM3Ouv
 +kSQobB1PLwqo8Dg4UzJC23KW77IcUwxg0RVxChTnhDql2k9cfP+tXJPFFRdZY98b8Lc
 dSHQ==
X-Gm-Message-State: AOJu0Yz0r5rUFlJ7z0m3+jypdux2VYub7V08mkA5CGQJiQFYlExbqb25
 mie5ib3QqgmRTorzsFRxoh5PSb4U6g==
X-Google-Smtp-Source: AGHT+IEIu8IPZQgV4rX5TrvEag75rqOcwwjFqP0xMOKHnwKuurJMGdtfsuM15VDdYSV6q3G4M5GkGQ==
X-Received: by 2002:a9d:65c8:0:b0:6b9:c49f:1af7 with SMTP id
 z8-20020a9d65c8000000b006b9c49f1af7mr3029577oth.20.1697565888470; 
 Tue, 17 Oct 2023 11:04:48 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b7-20020a056830104700b006c6311b15f6sm338959otp.38.2023.10.17.11.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 11:04:47 -0700 (PDT)
Received: (nullmailer pid 2258965 invoked by uid 1000);
 Tue, 17 Oct 2023 18:04:46 -0000
Date: Tue, 17 Oct 2023 13:04:46 -0500
From: Rob Herring <robh@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v1] dt-bindings: backlight: add brightness-levels related
 common properties
Message-ID: <169756588486.2258419.14570431419592615885.robh@kernel.org>
References: <20231016150554.27144-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016150554.27144-1-f.suligoi@asem.it>
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
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 16 Oct 2023 17:05:54 +0200, Flavio Suligoi wrote:
> Both files pwm-backlight.yaml and led-backlight.yaml contain properties
> in common with each other, regarding the brightness levels:
> 
> - brightness-levels
> - default-brightness-level
> 
> These properties can then be moved to backlight/common.yaml.
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  .../bindings/leds/backlight/common.yaml       | 17 ++++++++++++++++
>  .../leds/backlight/led-backlight.yaml         | 19 ++++--------------
>  .../leds/backlight/pwm-backlight.yaml         | 20 ++++---------------
>  3 files changed, 25 insertions(+), 31 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E5FA3D57B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 10:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E352C10E8FB;
	Thu, 20 Feb 2025 09:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IoS8UXrk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 403 seconds by postgrey-1.36 at gabe;
 Thu, 20 Feb 2025 09:54:32 UTC
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A25F10E4BE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:54:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 22F2361359
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DFAC4CEDD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740044868;
 bh=La+sxiVQ7AWcdVq9kE+VkWAJmsPFAHXzrxjh2HY8auc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IoS8UXrkbtnnXof8REZkmHcLgC/gAUPDqsvLUzwJAX9c25C7PbE29py6GStdHv+MM
 9yNQ6AeU9eAuGrT4QNyN3HwzJQm+3yWHodCiPdC9eLcyb+4xo8jTZKCMpy4UjAqzu3
 76iAYQ6v62HqDrnHkGVTLSCszJUY/g1k6F8eJANLjGzmX0FGcZCWzrw3SkurdCoRZI
 rMm9JVAIWj2PAlPF34Xxesi45Eul4B+zfAhYslYzC6/LJk0FJiKlciG+7ka+r1sEdS
 cXNI0BkQiYmWxHykgmPZe2sFFy5GY5mhdgiCtBsUdZWhUXgQ56Dkm0iPgdajyYNVXF
 zSVJEDS1SP8EQ==
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e5dd7b439e3so687315276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 01:47:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMPD83hoETcsxiydikaPiRoQqrwHFR1HsAWlPkLniPXuP3p1pQyPm+cgDuwb0gorrh8pYcILMkKJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyU0fVNz4XpD9borIllWyPNBf15SF3ZKaxFMiEYgVxx2Kv5aax9
 /+Hhv7ikhA5uykhVAZ52F08gAa0gMrpeSkcSVTPgIMB3N5OYugeQJ51Y4TxsMh83pGbF+oCqrV7
 mbingRfMxxRfo7V4zYDbY/DrG/+nn1wsGxf7LqQ==
X-Google-Smtp-Source: AGHT+IHIa6JFxmshc6YyvYZzzJ5a3QNr0lJKaEbO7W6d5prUyZMBmpbGtD5ipRmOSKb6VA36xGLD4sBdhsm+2e5NeV0=
X-Received: by 2002:a05:6902:2a8b:b0:e5b:2a51:deb6 with SMTP id
 3f1490d57ef6-e5dc9082a7emr18061275276.25.1740044867684; Thu, 20 Feb 2025
 01:47:47 -0800 (PST)
MIME-Version: 1.0
References: <20250220094456.32818-1-clamor95@gmail.com>
 <20250220094456.32818-3-clamor95@gmail.com>
In-Reply-To: <20250220094456.32818-3-clamor95@gmail.com>
From: Robert Foss <rfoss@kernel.org>
Date: Thu, 20 Feb 2025 10:47:36 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4QZM_=wLyDtvS4BNu=HVt-z8vQFi8cYSYz+JfEWZTLrA@mail.gmail.com>
X-Gm-Features: AWEUYZm2ZrgMrQ1lqXfTXo8N61qlQPJPfTxrhTlmDHmEkkrmyL7gWUf2VCo02F8
Message-ID: <CAN6tsi4QZM_=wLyDtvS4BNu=HVt-z8vQFi8cYSYz+JfEWZTLrA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindigs: display: extend the simple bridge with
 MStar TSUMU88ADT3-LF-1
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2025 at 10:45=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.c=
om> wrote:
>
> A simple bridge used in ASUS Transformer AiO P1801-T.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/simple-brid=
ge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.ya=
ml
> index 43cf4df9811a..8308e833938d 100644
> --- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> @@ -31,6 +31,7 @@ properties:
>            - ti,opa362
>            - ti,ths8134
>            - ti,ths8135
> +          - mstar,tsumu88adt3-lf-1
>
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> --
> 2.43.0
>

Reviewed-by: Robert Foss <rfoss@kernel.org>

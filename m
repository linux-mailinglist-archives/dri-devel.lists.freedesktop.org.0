Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF2EAEB34C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDD110E9A1;
	Fri, 27 Jun 2025 09:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="lkGQC6Op";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F48010E9A1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:48:50 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-607cf70b00aso3716296a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1751017728; x=1751622528; darn=lists.freedesktop.org;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DCDsaW+29dJd0Q/+M489tK44pMH2jQe/+cBTe7kaALo=;
 b=lkGQC6OpAVMuDAfx/dwzEd45mlSilk+zFRjoSdtfM0sd5lQ+B86LupdwT53nsJc4jX
 buK5P7r89H1G+zuPPbvf7aUM7r5orCaaAD0jPUW5A5q7vONf+K0Gx7FY0bTEnKME26Cd
 OvXRK0tFDeqMecJJdkar2vCgc/Op2gPH6nV5MQrSVW8SBhDFvyiYXTdCveZH/SsO4MbL
 yIhbRiFz8OJgIOKXZXCVvPai8vGZig61J+d2DfZh1nwC8N70XHH2MEzlDAVVr3GVAnUV
 Dht2DIrdr33PgQ3JwogwaGVuq/dOwyh84c5Mo+oGKzIE0ExwzfsWXr3V3hmF3sWazzeR
 0cCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751017728; x=1751622528;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DCDsaW+29dJd0Q/+M489tK44pMH2jQe/+cBTe7kaALo=;
 b=UIujXXfk1d2vyBoWr6bNsjr9VoEGHMJNZVkB8mKcnv9nPULskpFZ0y3k0NQZk5cgZV
 SXf5qxNhPes2w6WkIKRHrdl9K5kB71I+9ZmG1SJbici6+1nqjlXKM37EU8CGkOu4Gnaa
 jt4hdEOfcrfi8oJf93bs3/0JRqff7GPhBs3azkfiH/yF+Rdm9p09KrlMwioziE7R6RIj
 fEZWkQ+UNasdZMEV0i2wnS0fMscBkgYnMa8jO6RWMiUnTB8xnT2xyHdZLqRug33PlF/Y
 U8EhZjzId72ROIl6yfdecFKyxlV0SKbepj1/GJK+QuQSEezhVH/MFEc1hbGj8nILTURH
 F1WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBK887/c+cPsVlETd3iaVpRGht2fqKNCYxpyn3FeXsL7yNAkZ3AVEVj6GIdwCkQGIm3VLGL+lEAIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAEokzK4oXLE752U0DCOVdp8CvN0ruizi3F+Wf7xVjsbMCZtUo
 Ufhk1gSI0rIPYZBfHbGWKDj4/i8Bs2hbydWIEAjT+4MewFh6PUx6rgZMx7Eyn7TgTXI=
X-Gm-Gg: ASbGncu/tQ08r2qzTqLcIpDhTOciBGk4R1WhTbqfV4VbRzd3gbwAh3XdSoFD/rLse+3
 oYDil8StTK2QAmUnRl/ZWFi4CC7k0IATrD9xrXO5sbzMcp89wIDLNnFDpMBRay6RyUN0VTTOMFH
 JWviCTUyPQOZ6OGNT6XzXay+rqbHkbz4WrcoTr4iDXA2pE3hLhPN2Z6SK6Wx+CYiabwc/A9JFrW
 BRTos1cL/1phLaKL2MaYjsoWf86nPdcjTJdKw2jE56pT23FnAq84PZ+nQ7CuCeGO+7r46hlgQUE
 ahlzH1QzNTq8jYIJKurqzboLcL3GCCq7gJebQknupy78n+ppsfvhvuETN6K6vJ9snd4ND55Un45
 GkIq7tTD5TypzC0R1eHmFCXqW0lUVUEE=
X-Google-Smtp-Source: AGHT+IFvxLKtOUHTAM6IaJNk+LxRIz+Sbrpu2XNC5tbYBRY8piKKH2knwTobMqopOBPkPqKUqvHZeA==
X-Received: by 2002:a17:907:1c0b:b0:ae0:6dab:1a83 with SMTP id
 a640c23a62f3a-ae34fd0783bmr221032566b.7.1751017728509; 
 Fri, 27 Jun 2025 02:48:48 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c0427bsm92425166b.84.2025.06.27.02.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 02:48:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 11:48:47 +0200
Message-Id: <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Hans de Goede" <hdegoede@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Javier Martinez Canillas"
 <javierm@redhat.com>, "Helge Deller" <deller@gmx.de>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
In-Reply-To: <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
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

Hi Krzysztof,

On Fri Jun 27, 2025 at 10:08 AM CEST, Krzysztof Kozlowski wrote:
> On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
>> Document the interconnects property which is a list of interconnect
>> paths that is used by the framebuffer and therefore needs to be kept
>> alive when the framebuffer is being used.
>>=20
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +=
++
>>  1 file changed, 3 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffe=
r.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c=
654b80e2e80850cd 100644
>> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>> @@ -79,6 +79,9 @@ properties:
>>    power-domains:
>>      description: List of power domains used by the framebuffer.
>> =20
>> +  interconnects:
>> +    description: List of interconnect paths used by the framebuffer.
>> +
>
> maxItems: 1, or this is not a simple FB anymore. Anything which needs
> some sort of resources in unknown way is not simple anymore. You need
> device specific bindings.

The bindings support an arbitrary number of clocks, regulators,
power-domains. Why should I artificially limit the interconnects to only
one?

The driver code also has that support added in this series.

Regards
Luca

>
> Best regards,
> Krzysztof


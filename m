Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722A7A54D0B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF04F10E8B1;
	Thu,  6 Mar 2025 14:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D135F10E8B1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:10:37 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7c3b4c4b409so108798685a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 06:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741270236; x=1741875036;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p5tWRsmAkNRl3CcCpEBYNoShz/dMC+I168fgqmDeCw4=;
 b=iNAFbRwl+PdzVtNcpYGiuHqmV3SfMdNcY5MKhPZy9AEIRdqA9k7NI5AQVWLf+nw0wf
 t8gPCe0Yx6N6lTgIJ0ke8Tyysp+EDlopRqODY2+evFSn+RIG9YTXdAKBBNcwBa6j+ESD
 gNaQRc0dM2t1lOiyxblFO8x4OTBUVP/RM8fiWwUvsegPpWnxC3I5MZD+FPRXS/s8vcZM
 dO6kn2LPiL09DfsiQ8CdZAzIgVgZN0nz4Dr6OVwDXmeC4LoIjWwmb5qtgXvGOV0W/1+4
 CPiMouSxq5tPTwcUKG2VDC5KTZ8bGrYpjYgRk/W+ICBcsdszvVnstMBb29ppcW9Y+oOH
 Wsxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmsRuHdHEeoLPV8DfyuZl1h6Wo4v4Nkpz6xaq6A09BpiuapbmaduslCJw1c+3gms1AqObKc2l/0a8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlHjnbHgWi8waxr7XAf5Vdycd162C7+mn8xUbV6YcnFNz+alFy
 rEQ6rFHlR+xLJ0bdGcyc56eWzDTCPJQVltKYYhGgFCFtyhHKAIbdRiPBUFya
X-Gm-Gg: ASbGncs7t6zNa6rfad8ubYlb1rciQeg3V9ZuMQXHIgbPig5lOvKnxmj+IQK8/XWKUpi
 MdXKeKT+U7w3vu3RGu8jIyUTat4UBXyja45SslpzgElVQO7ON7OPQ8qvzw8/V+OdYPsI+iVDeul
 RS6hMLSAOpufZjjw50J9JkDaCjdmhoww8XmjBSMqotw/V1eAl6bIDUkdttKn/3dtnbccGZcCdqc
 HW3KO5O7OOG2UJt9yNLdKkhqZfEs291v9Rdp+hxs2UCVs4qdc9aUx2a2AgfxrqyTdvCux0AbGYh
 1Quuf9RlCTS8SeYhietZNNt/mcmJhzpd6hhWRBTUiLxCDcj3oeBPwurQgMUUlkDcuofN+BtWHpa
 6nTCDKLc=
X-Google-Smtp-Source: AGHT+IEj0tQbEXMufrSkPLTy4XZgV+NUO+3L0hfmBoP1yLIiHDtSwnMb/NYl3Np7F6nc8WwAFGN/ag==
X-Received: by 2002:a05:620a:6285:b0:7c3:9645:354c with SMTP id
 af79cd13be357-7c3d8e41794mr1307728385a.21.1741270235690; 
 Thu, 06 Mar 2025 06:10:35 -0800 (PST)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com.
 [209.85.219.49]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c3e54ff91esm94771285a.88.2025.03.06.06.10.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 06:10:33 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6e8f05acc13so6774526d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 06:10:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWuydGYHxGs7Rf34WY7g9kIKPq+MsKL0Lkbz2ssCjLEO4I0ut10o4VH2wZJYph1E6xEkZEV81JAqVk=@lists.freedesktop.org
X-Received: by 2002:a05:6214:f26:b0:6e4:4393:de7 with SMTP id
 6a1803df08f44-6e8e6cc7519mr101951716d6.2.1741270233688; Thu, 06 Mar 2025
 06:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20250225210316.3043357-1-robh@kernel.org>
In-Reply-To: <20250225210316.3043357-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:10:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUc1Gx8bQu0ePZFxNgy0=MZv909V74A-2y6wPTy8=MEDg@mail.gmail.com>
X-Gm-Features: AQ5f1JosAcu1iTpm2frNZuQquQZI0u4F7EQoGM3oNMP34Y7utGYqLFLTZUH1d1A
Message-ID: <CAMuHMdUc1Gx8bQu0ePZFxNgy0=MZv909V74A-2y6wPTy8=MEDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: mitsubishi,aa104xd12: Allow
 jeida-18 for data-mapping
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 25 Feb 2025 at 22:03, Rob Herring (Arm) <robh@kernel.org> wrote:
> There's both a user and the datasheet[1] indicate that 6-bpp is supported
> as well.
>
> [1] https://agdisplays.com/pub/media/catalog/datasheet/Mitsubishi/AA104XD12.pdf
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

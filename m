Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252076EAEE4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 18:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD6910E263;
	Fri, 21 Apr 2023 16:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB7E10E263
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 16:15:54 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-74de7182043so113365985a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682093753; x=1684685753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9QZZtA/5NWdnQgb0jJuRZbKZ4eCkzSLiidtnIgHAhGA=;
 b=ctHvTjO/5U4CovqOB/IKUYhR5Rb84nnSGabYqdPB4zLuTXbLdPUDXWNgiX5PxrfrC+
 M1BwvxR2MVfL5nSisBMT8K22lGTd5mopnPhKLw8gHS6j4pJPDj5w3TTEsiewVZeH453B
 8+tiS0Bdao4gH8YxugF/N7GrF+RNYmINQeVa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682093753; x=1684685753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9QZZtA/5NWdnQgb0jJuRZbKZ4eCkzSLiidtnIgHAhGA=;
 b=BZqxicpbJmWfC6gMZwdaOeQ9M+p1P9E0RtDj5HDDNag3UNmeMxyoeDhIiSDQ+yaUSF
 lByhjlAgv6hZKpAjZdnJ1ICv4GdauSzhAkPfKF04keNh3GCN7QtC196wh3avx3ZgF4Rn
 znp1aJf7thX8HuEzpI3tHzdF4R9qoj/hqzTrTabMZ7Lspzo/m8x0An79xYvSeEFlZjnJ
 v5qnSPQNcXVt0CItFMTH4r5qVF6SeG7o25F7Lm/8Fy4bw0xRJ9nVRIWjWIGJWbKKLJAr
 B7Z8wjgJyC0WnEKjKuk7IXm4xlTC2TKx6dS7U8JIvjxZwq2Zoeqb0aW13HNTMu86TmQL
 0lHg==
X-Gm-Message-State: AAQBX9cNYLqaFsnYfCEVPw1ofdsdyECdJBncqiizer1JNVZY43dIRCvY
 qHJ6fb/6S5QHg4zAofmir5tHC22/P2fzqulS8BY=
X-Google-Smtp-Source: AKy350al6Zz5k317R8zp76YfDScjZic//SirD3UdDA94zn6+N5aGJH7OGh1oMMB5M6NGmbdjJgWhhg==
X-Received: by 2002:a05:6214:d61:b0:5f1:5f73:aed4 with SMTP id
 1-20020a0562140d6100b005f15f73aed4mr9468935qvs.15.1682093753020; 
 Fri, 21 Apr 2023 09:15:53 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 u15-20020a0cb40f000000b005dd8b9345cbsm1262875qve.99.2023.04.21.09.15.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:15:51 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-3e0965f70ecso1169871cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:15:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1906:b0:3db:1c01:9d95 with SMTP id
 w6-20020a05622a190600b003db1c019d95mr440522qtc.4.1682093750390; Fri, 21 Apr
 2023 09:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230201-innolux-g070ace-v2-0-2371e251dd40@skidata.com>
 <20230201-innolux-g070ace-v2-1-2371e251dd40@skidata.com>
In-Reply-To: <20230201-innolux-g070ace-v2-1-2371e251dd40@skidata.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Apr 2023 09:15:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJCtqep+92h3gLfs4o2TwvL4MORjc9ydTSpZiZ0dsR0w@mail.gmail.com>
Message-ID: <CAD=FV=XJCtqep+92h3gLfs4o2TwvL4MORjc9ydTSpZiZ0dsR0w@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/2] dt-bindings: display: simple: add support
 for InnoLux G070ACE-L01
To: richard.leitner@linux.dev
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 13, 2023 at 12:51=E2=80=AFAM <richard.leitner@linux.dev> wrote:
>
> From: Richard Leitner <richard.leitner@skidata.com>
>
> Add Innolux G070ACE-L01 7" WVGA (800x480) TFT LCD panel compatible
> string.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>

nit: as I understand it, ordering of tags is usually supposed to be
chronological. You signed off on this patch before Krzysztof acked it,
so the SoB should be above. I'll fix that when applying.

> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 18241f4051d2..fd3e5ad769dc 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -174,6 +174,8 @@ properties:
>        - innolux,at043tn24
>          # Innolux AT070TN92 7.0" WQVGA TFT LCD panel
>        - innolux,at070tn92
> +        # Innolux G070ACE-L01 7" WVGA (800x480) TFT LCD panel
> +      - innolux,g070ace-l01

I think panel-simple currently has no active maintainers. Given that
I've touched all these files in the past, I don't mind applying.

Pushed to drm-misc-next:

4b4b96826ba9 dt-bindings: display: simple: add support for InnoLux G070ACE-=
L01

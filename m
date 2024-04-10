Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2545689EEB4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 11:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AC710E9A6;
	Wed, 10 Apr 2024 09:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mbJCbIPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BC610E984
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 09:23:30 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-5dbf7b74402so3984380a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 02:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712741010; x=1713345810;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKpQ/L+90YOrIxKPpVkHyeppvZjvg0QRhX3flaz/X3Q=;
 b=mbJCbIPPUx8/wxVsmFyO3wPH5Dkud8SnVDYIyvAA7Z0KSK06H3w9h/aWhCgEu+uujM
 SG77Q7HuGY1eTev48hAwdXKXfnOulsDBvNW79OQM/u4pQfbWrKS/dhYgZmAFh+2b001H
 z5Smzs9lmU8PeMEVmHyql7ewRI0pNc+ERNrxIicLAsR5IO3MMNzRw8WW5RGQvOnAycXd
 tWyiJWGy8QYNpUisLugQifITnYDSuAfGSnYFL0GBHF8gFvvjTj/nP7Eop2H5vKK94J9I
 Gup/FXZcGzgxWeUAYIAzirqcHTp3eLjADqvVNvRF7N2Zu4VUIklYfwbJYlLh8VgBd85K
 J46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712741010; x=1713345810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uKpQ/L+90YOrIxKPpVkHyeppvZjvg0QRhX3flaz/X3Q=;
 b=EwHuIGQQsNYbtDkfJm88ClvWSd2Tf9zV7ybeppj48FbOIqfBf9qCBNntsyP6xcaX/6
 JzFEu2J74kpzy3YONcJnmnd7S5XZU+M4SKS9Uad68Jrd6SHl7pdYCpjKilFGRUTeQsp2
 Gu92eQpbNke2UFG+JKJ1nPXbJAuqfQy8EWjxR5QkjvWNMdiXOF9cpTYukPAvw7qdEHIP
 NJz3yYJWSnos3q4NM+H9WPtaCOEoFqhElFL6Z/quwy59E7JkX0/7Cv5kMp3B4D21bU5w
 NZ6CNySZO+IVysThYBvo6i4HQBe8j+MAOaGZrXG2nlVXqatIYS1Jy6f4kBQKTWDSbRss
 9gyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSPiNW6wV6NwyvFO/TP/uSb+qZQy0lFhxzJ8UMsn3YSxJSCNLpzmNmJqPlPkN7UUfnYw73v8tpQUMwzbA1qLWiQSoSzhnjo4CaqJNqRNfD
X-Gm-Message-State: AOJu0YxNIlZQfD0JU+9BDn/qyog6/vLefnRD0VATfxhDghq0HnImg9m9
 ATl9MgpCdu7gNcgHATs3G1Xwhap6m+BmLTd9Dxqv9H+CtiduIEF98i2nhd+5DtEY08Za0Vi5JfY
 kyzMYTxy3kmzds1CrUW4Ytci0t2iq8r5AeZx88w==
X-Google-Smtp-Source: AGHT+IElz4DqrpJ78tcUJP8vBVt1F3CCqpzdboJS4Xw/zdtxyKv3r/O2V8DOVdDDoRjGh/Au6/LTGURoB0u7Q1jOkAo=
X-Received: by 2002:a17:90b:1b08:b0:2a2:1900:493 with SMTP id
 nu8-20020a17090b1b0800b002a219000493mr1789164pjb.40.1712741009799; Wed, 10
 Apr 2024 02:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240410071439.2152588-1-yangcong5@huaqin.corp-partner.google.com>
 <20240410071439.2152588-2-yangcong5@huaqin.corp-partner.google.com>
 <0eed83f0-5f5e-41b3-a66c-f46845ddc3a3@linaro.org>
In-Reply-To: <0eed83f0-5f5e-41b3-a66c-f46845ddc3a3@linaro.org>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Wed, 10 Apr 2024 17:23:18 +0800
Message-ID: <CAHwB_N+X5v3nFhtWTH8TRv8to2tcBTu8hn1guGXa7T-MuV3L6A@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: display: panel: Add compatible for
 BOE nv110wum-l60
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@chromium.org, airlied@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi=EF=BC=8C

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E4=BA=8E2024=E5=B9=B4=
4=E6=9C=8810=E6=97=A5=E5=91=A8=E4=B8=89 16:24=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10/04/2024 09:14, Cong Yang wrote:
> > The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel, which fits in nice=
ly
> > with the existing panel-boe-tv101wum-nl6 driver. Hence, we add a new
> > compatible with panel specific config.
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101w=
um-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-=
nl6.yaml
> > index 906ef62709b8..50351dd3d6e5 100644
> > --- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.=
yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.=
yaml
> > @@ -36,6 +36,8 @@ properties:
> >        - starry,himax83102-j02
> >          # STARRY ili9882t 10.51" WUXGA TFT LCD panel
> >        - starry,ili9882t
> > +        # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
> > +      - boe,nv110wum-l60
>
> Isn't the list ordered?

Sorry, will be fix in V2 patch . Thanks.
>
> Best regards,
> Krzysztof
>

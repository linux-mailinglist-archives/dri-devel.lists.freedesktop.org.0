Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6FBA1DB56
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 18:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746CB10E096;
	Mon, 27 Jan 2025 17:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gcK6ViTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989A810E096
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 17:33:25 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30036310158so40021551fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 09:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737999203; x=1738604003;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EDIJjS17Z0cKxHytk07h/hYFHTsGXB25W2Fi4Mqsrss=;
 b=gcK6ViTWSRcQyBDx1s3sjK2SXP7QYtsC2dLYb9JFWlFNadKUhK51IgkZHVdB8AuyhI
 KxACwoBvhUru0Ghu8hD+s9fCy9/HDQwwlVQoYCpR+RzoPkAqoQKBWaklOtUC9DTPYf5Y
 nSUFTJMVZS5rCQB1VPT3EivHQ5oo1vGTTCDOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737999203; x=1738604003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EDIJjS17Z0cKxHytk07h/hYFHTsGXB25W2Fi4Mqsrss=;
 b=ZSrJy3o8hb0bwND3Cdlb7cn0DeK3xJb7okaPTx2TTsMTFYMpzFym37kEC1e4VrOO+w
 GmTbJF4qzIe1vtDGv13p1XN90sOX5P9PaDDM/gXCOQTY9vKeEwuaj3tbbrDketMesQCi
 ejLJ7CeMwnckVkW8CYynGIiLuap0rGpsqiqgnFX7/1kjqokKyhIpiaV4dP+XqGnif/0T
 VD8oN+gLGc7QtpKsfGLdX1s/2DLYxwAnkonFat2Y4WqJLrVX3Ho7rL25rRmr4K1mr9ui
 j8og3x6Ia5+sI5guCLa0keeYOEV0tHVYOJgTU5Iq4QSGPtPbpFYG6I9/N0/ZI+QddKg2
 xAUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXFi8f200WVNPWsdHS/8Q3GfrunE6cMPTggW4IsZ/Xp22yClKIHzWXNnLrc0orEER8uAp/x52hbqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPKIZfqRzSdkYy5IQrIUrGlLEwNDBgjdxEVJ26MTJyOBFnm6Mg
 FDS+3UbY4Vz6nhDCTcZfjPWvG2/IMOKGpFxx7V6arWgv7zXIfH5j/XRLLFU0rWyK/RdWlZUyELU
 =
X-Gm-Gg: ASbGncsEm9TtnHn3SLiO15HIJPhE3W7H0emqNaSCN7oss7F98WAi7stYl8TquyGtOjE
 FLZrHlMZG//23mDSUlV2JTp80GiD59KAmGLffr7BTmUVesZFn2QKlXJEjBa4gQSyAHkEX5qXg7Q
 WdppMOAlzXge3UuznCYSw2ftEtPxrDguMXd4Xd2riLgTukiCrZ1XW2LK9FfgI4FM4/K+OdiDFd1
 cOseU97htUMzpw+XJr6qFL/eLiJFZuzQaNWxueJ9noNbq0bA5MjATg8/hAsSAMtGPJnVL2X9UjX
 3a1M27XLyyAnkoMewdQbArpq3ZqH5w95aDmrfc76X7R/AFr+
X-Google-Smtp-Source: AGHT+IHxhKLf10STyWBeZdsLyqGNNtEAq7TZQmLbpBVF3Bk1G2r6Z5GEYVNwKAVmUUfC9mlQb0PxCA==
X-Received: by 2002:a05:651c:887:b0:2ff:caf8:3007 with SMTP id
 38308e7fff4ca-3072ca9c230mr157143141fa.19.1737999202675; 
 Mon, 27 Jan 2025 09:33:22 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bc198b7sm15225171fa.81.2025.01.27.09.33.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 09:33:21 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3072f8dc069so51258861fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 09:33:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX6nJv6IIASfmaqf4RQnJk4AeEJ9Bufqil6Gg66jbgftlQ5QifTo6r7tBzlI/pFqdxkG66S3n3XYeQ=@lists.freedesktop.org
X-Received: by 2002:a2e:a4c9:0:b0:302:1c90:58d9 with SMTP id
 38308e7fff4ca-3072ca7fa0bmr113889451fa.16.1737999200851; Mon, 27 Jan 2025
 09:33:20 -0800 (PST)
MIME-Version: 1.0
References: <20250127014605.1862287-1-yelangyan@huaqin.corp-partner.google.com>
 <20250127014605.1862287-2-yelangyan@huaqin.corp-partner.google.com>
 <20250127-copper-dalmatian-of-excitement-c474da@krzk-bin>
In-Reply-To: <20250127-copper-dalmatian-of-excitement-c474da@krzk-bin>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Jan 2025 09:33:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XcVnkYSzanqinLX65gRc5434WGbvauavBZPpabfT-2Yw@mail.gmail.com>
X-Gm-Features: AWEUYZkdPPfcTVvf2U86dKbCSDMihhgNkb4v-_QGXFo1taQ6eo6FgJO1X5WUccw
Message-ID: <CAD=FV=XcVnkYSzanqinLX65gRc5434WGbvauavBZPpabfT-2Yw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: Add compatible for
 CSOT PNA957QT1-1
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
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

Langyan,

On Mon, Jan 27, 2025 at 12:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Mon, Jan 27, 2025 at 09:46:04AM +0800, Langyan Ye wrote:
> > Add a new compatible for the panel CSOT PNA957QT1-1. This panel
> > uses HX83102 IC, so add the compatible to the hx83102 binding files.
> >
> > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> > ---
> >  .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83=
102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.ya=
ml
> > index c649fb085833..d876269e1fac 100644
> > --- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yam=
l
> > +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yam=
l
> > @@ -18,6 +18,8 @@ properties:
> >        - enum:
> >            # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
> >            - boe,nv110wum-l60
> > +          # CSOT pna957qt1-1 10.95" WUXGA TFT LCD panel
> > +          - csot,pna957qt1-1
>
> You need to add such vendor prefix first.

Since you may not know what this means, Krzysztof expects you to add a
new patch to the front of your series adding an entry into
"Documentation/devicetree/bindings/vendor-prefixes.yaml" for "csot".
Based on my experience with eDP panels made by them, presumably "csot"
is "China Star Optoelectronics Technology Co., Ltd" ?


> It does not look like you tested the DTS against bindings. Please run
> 'make dtbs_check W=3D1' (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.

It's important that you figure out how to do the above so you can
validate your bindings yourself.


> Point us to your DTS so we can validate that you really tested it.

Krzysztof: not sure what you're asking for here. I assume Langyan is
posting support for this panel for hardware they are trying to bring
up, and the device tree may not be officially posted anywhere yet.
This is not really a requirement, is it? Given that Langyan is just
adding a compatible to an existing binding, it seems like we can be
fairly certain that the binding is fine without needing an extra dts
example, right?

-Doug

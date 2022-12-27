Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23F656E54
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 20:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B2D10E07E;
	Tue, 27 Dec 2022 19:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A6810E07E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 19:28:21 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 u4-20020a17090a518400b00223f7eba2c4so14011784pjh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 11:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F3yGec1v/pAZdlsdz4KptKUFtToX+P4HKect6tvS0bM=;
 b=eZBHoAftWthVp/W6i1eY7oWJRD71Y9IPWPP49BSMuDdLH48aPJpqXUHhnHjcQ3vxWA
 ZElU5SN+QVdH4rtn71R3XmF1NZb/hHZiRp4vSIr57NzmfzKvfF2CpsWiOmID82+AKp6Y
 WoFCh9ct+g0Kcltcu1FrAU32Xw5daqNdSiPPaPVWMqdfsM5TWGAuWgvIEOl4KvauhwWS
 VBWOYYOLzHxRJd+P24Npz/HegJMC3wwrVJR3mkGFj1Zc1ovw21WVJ5h5BEBd0orRN8S5
 JZdt7pjgX64uGwkPxT0pUtDPeh4DIwUJB+37rVEhy4erYpHB99SzJTCDyNADiLzEMlX6
 kzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F3yGec1v/pAZdlsdz4KptKUFtToX+P4HKect6tvS0bM=;
 b=oIYG2GCLF8AVEvIQXrSYpb+eYic7KJtwFMVJfpCuBmIrIq/fj9qpxgIn2FDkvvLsQJ
 wzB8PiUeglHcWMXW9b+aOZFeR7mE78oiQnK8X18eKIqVCi/1Hni7LGLF0Z4Cq72W12j5
 2zoX9XvdPLTf1O0k8q/2FctXKSkboSf9PllTV1/MiILPNEkIxUSneNOpMTqOyIMARb6B
 M5wYXgN1Y5NXC8nvZ1ifYhCkS27E9QTgaAPvg2OnqGPCDF5xSYKDGm7v+RI985ztU+2/
 FRo99eaJiymaX/pGcuFr6K19yDEhnNP9FWjVUGklHeCRxV1Q5JdHlpxRcPrSttEK8YXa
 G5Kg==
X-Gm-Message-State: AFqh2kr5uOoLUOd+XLwCeSLNYNk6hbRoD2b7nd+jATxZHl0hmHlD6FZN
 HkGscEBzx1UDHbwEnBN42+rOVL/ol28vHIpJrrCjdw==
X-Google-Smtp-Source: AMrXdXsOvBld3xBN5qjRM49UlgQSR/vTb5qkj6SsVg9Om1xjMhqlnlFj5FBPS6mSldhVyUhf3qbUFTbJ4PIqwLf2jHQ=
X-Received: by 2002:a17:902:7089:b0:189:9cfd:be76 with SMTP id
 z9-20020a170902708900b001899cfdbe76mr1390560plk.21.1672169301016; Tue, 27 Dec
 2022 11:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20221227110335.2923359-1-javierm@redhat.com>
 <20221227110335.2923359-2-javierm@redhat.com>
 <CAMty3ZAaHKJ21D8mE=HU3D3KOGAiZ7vfmW_Hgc-E5JO5S+tMNA@mail.gmail.com>
In-Reply-To: <CAMty3ZAaHKJ21D8mE=HU3D3KOGAiZ7vfmW_Hgc-E5JO5S+tMNA@mail.gmail.com>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Tue, 27 Dec 2022 20:28:09 +0100
Message-ID: <CABxcv=kwtk21UbOwaV4tq=BpPsrYmnTrzuhybjbknipqk5R-fA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: Add Himax HX8394 panel
 controller
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Jagan,

On Tue, Dec 27, 2022 at 7:16 PM Jagan Teki <jagan@amarulasolutions.com> wrote:

[...]

> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      # HannStar HSD060BHW4 5.99" 720x1440 TFT LCD panel
> > +      - hannstar,hsd060bhw4
>
> Parent controller can have a compatible where the associated panels
> will be enum list.
>

I'm not sure to follow what you meant. Could you please elaborate?

Best regards,
Javier

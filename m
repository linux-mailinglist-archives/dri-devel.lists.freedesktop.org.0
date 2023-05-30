Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C222716A54
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 19:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DE010E250;
	Tue, 30 May 2023 17:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0585810E250
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 17:00:12 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-77483f80522so333370339f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 10:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685466011; x=1688058011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfTlpnHMOZxiUbtco4W6+o8TVl366P2iW1YkCqnywqM=;
 b=jRXauzNHnPa9RUyLTlRsAIVWueXptvjw/3xeiajL0rSmjqOHbAx8emWXTdxJrvBQcH
 AMTrwGIYIQkpJW8dQ4j0iyOpAMqptil/q8BqgideigYpO5DXocbiaaXIqi73F80qlhq5
 EAVNxUlt3wJyFGu0od4f/IQK2R4WS0uSoOj78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685466011; x=1688058011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfTlpnHMOZxiUbtco4W6+o8TVl366P2iW1YkCqnywqM=;
 b=jt2BvDERiBcPhTJPeWoAmjkbWJJmT7Tj5qHqGh/9Z/y++BR5YH4xnZaI5U3DPZ+CvY
 1W/pYm8KNP9ysE9B8/Jj8fOLF8NtAlqqXf/XvsRQZjveTCNKz3zY5Kcz3OFlAEfMDYDR
 MxBILP+rNjIf78UcJb8uZTOPdVKlqFfshz6AivqRdOkcB+veH9OVML0F/hEcEytLS1Yj
 aMVczupPbcdTxLUXq7pK25EPvP9SLsuZ7bL3uT1faFkKfGPJw1RM/CyF9aNR1RsrMT4j
 16qLIdm8uoKc80QuTIoIbHrS7Lf8SRcLKfgdM3RT2Bl7YwJzAMn6yYJXLnypJA28KFeq
 45IQ==
X-Gm-Message-State: AC+VfDw+9Kyff4FixwoFjaX0lhqJWD4DIp4zYIz9X9CCebbye1qgvcJP
 Lsf9DwYEE1UpPWjG1YTFnpiRc5xBXL4/c66UeUc=
X-Google-Smtp-Source: ACHHUZ6nTwuG3YXzCN6akWdbaQwA2jMjwvbh0rQhs/m4l0EfCBenfBFnWm+FuObhrdOBGlW3ZwhJrQ==
X-Received: by 2002:a05:6602:4243:b0:76c:826f:2188 with SMTP id
 cc3-20020a056602424300b0076c826f2188mr2147954iob.6.1685466011379; 
 Tue, 30 May 2023 10:00:11 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174]) by smtp.gmail.com with ESMTPSA id
 f42-20020a05663832aa00b0041cea93e589sm805561jav.152.2023.05.30.10.00.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 10:00:11 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-33baee0235cso3905ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 10:00:11 -0700 (PDT)
X-Received: by 2002:a92:c24e:0:b0:338:3b6a:4719 with SMTP id
 k14-20020a92c24e000000b003383b6a4719mr165620ilo.17.1685465557498; Tue, 30 May
 2023 09:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230523193017.4109557-1-dianders@chromium.org>
 <20230523122802.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
 <10457cab-f9b0-c38b-9f11-36853b71c7e8@linaro.org>
In-Reply-To: <10457cab-f9b0-c38b-9f11-36853b71c7e8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 May 2023 09:52:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJhVaFNcLZ_wA=vnYCVVxjq1NFxdV794C0mmxpqvPL6g@mail.gmail.com>
Message-ID: <CAD=FV=XJhVaFNcLZ_wA=vnYCVVxjq1NFxdV794C0mmxpqvPL6g@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: HID: i2c-hid: Add "panel" property to
 i2c-hid backed panels
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-input@vger.kernel.org,
 hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 30, 2023 at 8:34=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 23/05/2023 21:27, Douglas Anderson wrote:
> > As talked about in the patch ("drm/panel: Add a way for other devices
> > to follow panel state"), touchscreens that are connected to panels are
> > generally expected to be power sequenced together with the panel
> > they're attached to. Today, nothing provides information allowing you
> > to find out that a touchscreen is connected to a panel. Let's add a
> > phandle for this.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  Documentation/devicetree/bindings/input/elan,ekth6915.yaml  | 6 ++++++
> >  Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 6 ++++++
> >  Documentation/devicetree/bindings/input/hid-over-i2c.yaml   | 6 ++++++
> >  3 files changed, 18 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml=
 b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > index 05e6f2df604c..d55b03bd3ec4 100644
> > --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > @@ -24,6 +24,12 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > +  panel:
> > +    description: If this is a touchscreen, the panel it's connected to=
. This
>
> Hm, can there be different setup? Touchscreen without panel? What would
> it be then?

For a touchscreen that's a discrete device (not sharing logic / power
rails with the panel) you'd just leave off the panel node like we've
always done. Assuming folks like this series in general, I'll try to
improve the wording for v2.


> Why only these touchscreens? This looks generic, so maybe in
> touchscreen.yaml?

Ah, that makes sense. I guess we need to add an include of that file
from the elan and goodix bindings. The hid-over-i2c.yaml already has
it, though. I'm not 100% sure the existing "hid-over-i2c" driver in
Linux actually calls the function to parse all those properties, but I
guess that's a Linux problem and not a DT bindings problem. ;-)

-Doug

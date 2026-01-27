Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEc8DHvFeGmltAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:02:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F496954B3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E2710E57F;
	Tue, 27 Jan 2026 14:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29BB10E581
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 14:02:30 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id
 71dfb90a1353d-5665171836cso2384189e0c.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 06:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769522549; x=1770127349;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y3iP0W+rICWiFtIz9Lnj4u7VRlu+Bycye5GdS1BEDSM=;
 b=MvAAwHNxGZS5tLvQXEGFB1ClqAo5lnIFv8KR/fTzUNdYp/JeVNa2m4n74uqLYB4sWq
 f2Qp1kXJA3S8H4WNiiH5HvBiIagqjFcX8Qqx0DTko+Y5FO6l2ZW5To9NwDa2iQ0QL1aI
 xZ+d1gTUuixnMoXDzLE8NqrqXpat4YI123JIYMfGbj8DzgVgWSe/nLIpR316cUccuq2T
 sUlSnPp5iiZdt42uKw7QP6/JcoLK0LDqq+hbbrWV63Ixxuk4S4d2Z4AlhARwfWtJUPXZ
 0KElWQPHB38p6e6E8WeLq2CDdtmf9C4jLZIsnyc2STf4bUNC3FOgsvHVmH2HAz0QKe5U
 i3IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7tVcb1At84Mpro1nsj8CMWDoTpB+ykFggBYMNwyoJYfKYEqksHp2w2E2OkT/IarZyUV03cbafj1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe39sEHZ3xS04edH7KIQZw6dmSV1SC7EdX3i1fE1V5Y2cediNM
 Ey1zOM1zOS8GDikAbN9B0uoZoX251/G3u8som7VDOtajaM1dl0W5l238IHVnhPECqDs=
X-Gm-Gg: AZuq6aK0ki4dAZE2NzLsMvC2bO4jggLvMoHVW+jOr5N6hFJQWRrugrRTnWtVEKMJ3An
 7R0v5DPE4VgOuu+UrYXdsrBjowZHoHkRNiPGs9+25eIk9PiXQPf5P86DWdFsM9LWAWpX3TjDqSk
 z4rvoSmqHaYY9k5g4KlZH834RbjcMXaV84t+v10+jSWUvFcSKy3OmHNyHd1oDpNC28+P0Tf9ZyK
 c3/IuwO/HIc0soVzMJfFWbYJ/lLlRz3XpjXaukqNFVmJXI0M0xctscPB2QcmrWE6IeCryR9EMSu
 g8BY23LkxTiOKsTxH7LB1LiL1BzUClbE7cvXCfwpCBe7GJ7dFesaYjdkTCTvTLXwhZzPyQ63eGY
 1YAXRrWgyPD7DVOTPRfvliJP+xyKHbBNlhGBwcE1cJF+w+5YFHoMp6tp1mDXXD5338llk8YmRul
 UIL6RZgVh/0b5VMnlM3+M9wsqf/ywIglBvfziBXECL54xsYs6H
X-Received: by 2002:a05:6122:3488:b0:563:5070:ab40 with SMTP id
 71dfb90a1353d-566795c7c14mr698533e0c.14.1769522548988; 
 Tue, 27 Jan 2026 06:02:28 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-9482e372889sm2383165241.11.2026.01.27.06.02.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 06:02:28 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-9480ad20274so4381984241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 06:02:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVs+tJUAUDUMGW86QMsnKnLLLW+4EXKlqyjyHSg3I2WBx9gzfGJtBx1jxyZ0p7e0Kvm38hC44QslO0=@lists.freedesktop.org
X-Received: by 2002:a05:6122:340e:b0:566:2568:df1b with SMTP id
 71dfb90a1353d-566794c0a54mr742458e0c.2.1769522547250; Tue, 27 Jan 2026
 06:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
 <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com>
 <6e8c3d6b-8cba-42da-bafa-28becfa15d60@linaro.org>
In-Reply-To: <6e8c3d6b-8cba-42da-bafa-28becfa15d60@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jan 2026 15:02:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=u280N2HUgpiHtRXuMv0RhtDeEFDaSLFQ0Wg8frt+6A@mail.gmail.com>
X-Gm-Features: AZwV_QhN9K-WsMdmqL2nfJrvZ40lsYIN6kZoo7JRPE4M6cKNWw4lsg30FvWZJqY
Message-ID: <CAMuHMdV=u280N2HUgpiHtRXuMv0RhtDeEFDaSLFQ0Wg8frt+6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,linux-m68k.org:email,linaro.org:email,0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8F496954B3
X-Rspamd-Action: no action

Hi Neil,

On Tue, 27 Jan 2026 at 14:55, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> On 1/27/26 11:20, Geert Uytterhoeven wrote:
> > On Tue, 27 Jan 2026 at 10:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
> >> which connects over PCIe and requires specific power supplies to
> >
> > Here: "requires"...
>
> Sorry I don't understand

Please read below the continuations ("...") below...

>
> >
> >> start up.
> >>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> >> @@ -0,0 +1,55 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
> >> +
> >> +maintainers:
> >> +  - Neil Armstrong <neil.armstrong@linaro.org>
> >> +
> >> +description:
> >> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
> >> +  The UPD720202 up to two downstream ports, while UPD720201 supports up to
> >> +  four downstream USB 3.0 rev1.0 ports.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: pci1912,0014
> >
> > Just wondering: how does having a new driver
> > drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c matching against this
> > compatible play well with normal PCI discovery and probing of
> > drivers/usb/host/xhci-pci-renesas.c?
>
> In Linux, power control is implemented as a platform device driver,
> so it doesn't collide with the pci driver.
>
> The pci driver won't probe until the device shows up on the bus anyway,
> so he power control will attach as platform for this purpose.

OK.

> >> +  avdd33-supply:
> >> +    description: +3.3 V power supply for analog circuit
> >> +
> >> +  vdd10-supply:
> >> +    description: +1.05 V power supply
> >> +
> >> +  vdd33-supply:
> >> +    description: +3.3 V power supply
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >
> > ... but no power supplies are listed here? ...
>
> None are stricly required, they can be supplied directly without
> a passive regulator. Not sure they should be required

So the goal of this binding is to document the required power supplies
which are not required? I am confused (but that could just be me ;-)...

> >> +examples:
> >> +  - |
> >> +    pcie@0 {
> >> +        reg = <0x0 0x1000>;
> >> +        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
> >> +        #address-cells = <3>;
> >> +        #size-cells = <2>;
> >> +        device_type = "pci";
> >> +
> >> +        usb@0 {
> >
> > The actual DTS uses "usb-controller".
> >
> >> +            compatible = "pci1912,0014";
> >> +            reg = <0x0 0x0 0x0 0x0 0x0>;
> >
> > ... also not in the example?
> >
> >> +        };
> >> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

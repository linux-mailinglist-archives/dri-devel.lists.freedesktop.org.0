Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B6930AFD8
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 19:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419416E870;
	Mon,  1 Feb 2021 18:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3AE6E870
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 18:56:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46E5764EA5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 18:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612205790;
 bh=Fl3Npf+4pVvNh31RXdPU8dppcbyE9HjVP7yvitbpn4g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=U8WNAvciv/P2kJz7GaZrM/Pg2nPahp9pPbQPyB9ZjyivmN3KcvwNAR+S7+v6ICxg4
 SFKio0B4h/2MqVwcMZ+SnSzki0337HqV1SCYyQBlwBrt0mEulo4AKIuZGU7tpzOSMs
 4FHWrIL8Jql6anPO7p1NA7D/+sf8sjUGxdaWtYDg22BQAwL3wUJrp6Kaj683tPdF06
 QFBPhanrAdp0hOyVuLfcoinugPlRTld5TcQs7gB4pUXRVN3tpzJ5K/hRFrpDgjYDKw
 lZ98A3OxXLbINNsTJsdQYemhnDwnK16IAUffggLeIEl3UiHQ2RZ5kvLjCjpTGRfD4v
 /wauWqWFM8Orw==
Received: by mail-ej1-f43.google.com with SMTP id rv9so26004580ejb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 10:56:30 -0800 (PST)
X-Gm-Message-State: AOAM531rCASVPwsKvmaao1kV4HJCH/malNPwNu4zhJ+x5K1m4kakWkoN
 sm6wTcC9z1Eji1Nf/hlh2Xki3ptaivyDBkEoyQ==
X-Google-Smtp-Source: ABdhPJxqcJ2ZL6F2eAzG2R/j7txAlsnr/4awa7SBSOph3dZPuXrRGALcN4hda5NsXyK5yi82Kn0svJRpym9dDzklP/U=
X-Received: by 2002:a17:907:16a2:: with SMTP id
 hc34mr786372ejc.108.1612205788803; 
 Mon, 01 Feb 2021 10:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-14-maxime@cerno.tech>
In-Reply-To: <20210111142309.193441-14-maxime@cerno.tech>
From: Rob Herring <robh@kernel.org>
Date: Mon, 1 Feb 2021 12:56:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ3QBoJVXnpeMz1X56F6VWEe_HzTKs9efrDWh3ccdr=5A@mail.gmail.com>
Message-ID: <CAL_JsqJ3QBoJVXnpeMz1X56F6VWEe_HzTKs9efrDWh3ccdr=5A@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] dt-binding: display: bcm2711-hdmi: Add CEC and
 hotplug interrupts
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 11, 2021 at 8:27 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The CEC and hotplug interrupts were missing when that binding was
> introduced, let's add them in now that we've figured out how it works.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml   | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> index 7ce06f9f9f8e..6e8ac910bdd8 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> @@ -53,6 +53,24 @@ properties:
>        - const: audio
>        - const: cec
>
> +  interrupts:
> +    items:
> +      - description: CEC TX interrupt
> +      - description: CEC RX interrupt
> +      - description: CEC stuck at low interrupt
> +      - description: Wake-up interrupt
> +      - description: Hotplug connected interrupt
> +      - description: Hotplug removed interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: cec-tx
> +      - const: cec-rx
> +      - const: cec-low
> +      - const: wakeup
> +      - const: hpd-connected
> +      - const: hpd-removed
> +
>    ddc:
>      allOf:
>        - $ref: /schemas/types.yaml#/definitions/phandle
> @@ -90,7 +108,7 @@ required:
>    - resets
>    - ddc
>
> -additionalProperties: false
> +unevaluatedProperties: false

/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:
'additionalProperties' is a required property

And you missed the DT list, so no checks ran.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

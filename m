Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181E963FA28
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 22:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF85E10E674;
	Thu,  1 Dec 2022 21:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEF410E674
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 21:58:21 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 r9-20020a05683001c900b0066e6e7a751eso1871915ota.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 13:58:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jMmEEW9nhsYjLdoVEX/XJSzRD/PGxz+ahARY6QfwUlw=;
 b=jVsFfvo5yfH2LB6g2ZZkl9NbvuYqV3fJBgoViDRhawUzwQ0Hs0QqbIrRD1Lv8LY3q2
 CMzTsiPYh2+r7sVNBzQr1d/6OFaKYOebv3dhdnBr+S60W8FAIevb6LWHwozsLqWghdhe
 gU4oG51kAFged0GujiyflqLCFlAWKGlaYlQrMeDw22ggmsNcQqyJJoUuliG0DFw9aCKW
 S/bd/HSnvKLB+v6HqyeRSuzMRxcumRx23Kn+NqtuVxSEdDvCpF60Gvg4L2RcNh78pgps
 vqlBNFW0lv51JpxI1zJRLT7gAsA+xJmU1VrRWjOnUFl09aMPIIuo6tk7GlnPyOHn9en/
 IKQw==
X-Gm-Message-State: ANoB5plcGeYGeL75NqsApPsZBCJX9nYgLHPTk7RObFdNyqL0NLg3ZEHB
 OtMysX6aUt+TxwXkzxymTg==
X-Google-Smtp-Source: AA0mqf6AYmSS9hCCipjLKVxHNWwf4lMfqM82+JjJbYgzcji3aY0tw19h/MvlDxIM1yeUomemkeRqjA==
X-Received: by 2002:a05:6830:374a:b0:66e:76f1:23e1 with SMTP id
 bm10-20020a056830374a00b0066e76f123e1mr2134223otb.35.1669931900561; 
 Thu, 01 Dec 2022 13:58:20 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a7-20020a9d4707000000b0066e7e4b2f76sm362989otf.17.2022.12.01.13.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 13:58:20 -0800 (PST)
Received: (nullmailer pid 1518708 invoked by uid 1000);
 Thu, 01 Dec 2022 21:58:19 -0000
Date: Thu, 1 Dec 2022 15:58:19 -0600
From: Rob Herring <robh@kernel.org>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Subject: Re: [PATCH 3/4] dt-bindings: display: panel: mipi-dbi-spi: Add
 missing power-supply
Message-ID: <20221201215819.GA1510935-robh@kernel.org>
References: <20221127191433.1363395-2-otto.pflueger@abscue.de>
 <20221127191433.1363395-4-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221127191433.1363395-4-otto.pflueger@abscue.de>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 27, 2022 at 08:14:32PM +0100, Otto Pflüger wrote:
> The power-supply property is only mentioned in the description and not
> listed in the properties section of the binding. Add it there.

That's because it is described in panel-common.yaml already.

But I guess it is somewhat useful to define it corresponds to Vdd.

> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>  .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml  | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

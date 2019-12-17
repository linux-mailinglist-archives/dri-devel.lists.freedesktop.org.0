Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E153E122CC7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 14:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A953E6E9DB;
	Tue, 17 Dec 2019 13:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5299F6E9DB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 13:24:00 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id p17so3162527wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 05:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PQlX1CippGd67ZwxHkuay5EF78Hj1hgtVRyyvUvbgwA=;
 b=NbsupXoXkoUxdXWJ5I+nDlbNjjBFRbGnW++u7+wMaRoowpooaJa9NZ8a8kHxnJ2wPY
 yjrV4LeS0AmQaqOCi6s3b/oVrIYcvTb+jtQj2l8ND691H3mb8+I+vm0UgQXq8pKEHQuc
 1PJSW67lMqQ22/KiEc1BFcySzglw3JXcgMVjPUTSbcrMhsixbqDUiFzuJvSzXB6sQ0Jm
 x4yHFI70eKABcMmbZSR4TC6Om49u2kxu8eX/WzpYs7eBdvnSFntGr7hj2lHfp84FGQVD
 2MbQQme7Rt5Qifg6ORTnIZ6R1og5SK1LafVUIkLIxNo/7PZScyX1RSYVIVNpGEUG7bzO
 hOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PQlX1CippGd67ZwxHkuay5EF78Hj1hgtVRyyvUvbgwA=;
 b=MfywO2yxlfKlLP2vD0FmsNz+OR5Yp1kYb35y0JE5PwmcEeEir6GRTCqnX/PNGDreLV
 t0DF5u/91TQTbheBCtFTTHOomP7tymZheQqW52jdAXuzhB+EEJ1FjR8y5UY08xkDKhzE
 bjx3sfF2B/n/qXOgI18s0WphBNdRwlP/HWg7oWcsqwZkL0A6dg2qSQ3+40DhsMaZs6Gu
 e0XH3opea6OpsHjfNPcmFwbe5Uf6wXexU8povumx41zzSLuMO60cwmOnJn8+iQfGeFZr
 cgDkm2G8SBIumxh1C2n88VUJtqh/rRBvE7BCwHuhbC0+cJkyS0t/5syN1jQm3b746twz
 6SoA==
X-Gm-Message-State: APjAAAUfD6sqe9i6MIrJxkieMwECt2w+EMMbzcTYBd0WR7k/OWYZ3sZa
 YcjG4HZd86ubRYK7iVJdq+dnje9ISl2qaQ==
X-Google-Smtp-Source: APXvYqxFFKuODBfddylGkAaPFHaOyvlkKl+G2xUkKBxpD1UN8cL+aNqlAfmrTRKAAzKFgA/cxT8KUA==
X-Received: by 2002:a7b:c30b:: with SMTP id k11mr5555495wmj.36.1576589038461; 
 Tue, 17 Dec 2019 05:23:58 -0800 (PST)
Received: from [10.2.4.229] (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr.
 [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id o66sm3109390wmo.20.2019.12.17.05.23.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Dec 2019 05:23:57 -0800 (PST)
Subject: Re: [GIT PULL FOR v5.6] R-Car DU & LVDS decoder
To: Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191128024524.GC13942@pendragon.ideasonboard.com>
 <20191217124344.GS624164@phenom.ffwll.local>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <476b05bc-af6f-7156-bbb4-a882fae70c9d@baylibre.com>
Date: Tue, 17 Dec 2019 14:23:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217124344.GS624164@phenom.ffwll.local>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 17/12/2019 13:43, Daniel Vetter wrote:
> On Thu, Nov 28, 2019 at 04:45:24AM +0200, Laurent Pinchart wrote:
>> Hi Dave,
>>
>> The following changes since commit acc61b8929365e63a3e8c8c8913177795aa45594:
>>
>>   Merge tag 'drm-next-5.5-2019-11-22' of git://people.freedesktop.org/~agd5f/linux into drm-next (2019-11-26 08:40:23 +1000)
>>
>> are available in the Git repository at:
>>
>>   git://linuxtv.org/pinchartl/media.git tags/du-next-20191128
>>
>> for you to fetch changes up to c43bcd64c7c703ff7196f74cb6bfc67e35b562d9:
>>
>>   dt-bindings: display: bridge: lvds-codec: Document ti,ds90cf384a (2019-11-28 03:55:56 +0200)
>>
>> ----------------------------------------------------------------
>> - R-Car DU Color Management Module support
>> - LVDS decoder support
>>
>> ----------------------------------------------------------------
>> Fabrizio Castro (9):
>>       dt-bindings: display: bridge: Convert lvds-transmitter binding to json-schema
>>       dt-bindings: display: bridge: lvds-transmitter: Document powerdown-gpios
>>       dt-bindings: display: bridge: lvds-transmitter: Absorb ti,ds90c185.txt
>>       dt-bindings: display: bridge: lvds-transmitter: Document "ti,sn75lvds83"
>>       drm/bridge: Repurpose lvds-encoder.c
>>       drm/bridge: lvds-codec: Add "lvds-decoder" support
>>       drm/bridge: lvds-codec: Simplify panel DT node localisation
>>       dt-bindings: display: bridge: Repurpose lvds-encoder
>>       dt-bindings: display: bridge: lvds-codec: Document ti,ds90cf384a
> 
> Why bridge stuff not in drm-misc?
> 
> Also, and the reason I've not pulled this:
> 
> dim: c43bcd64c7c7 ("dt-bindings: display: bridge: lvds-codec: Document ti,ds90cf384a"): committer Signed-off-by missing.
> dim: bb29b64ac196 ("dt-bindings: display: bridge: Repurpose lvds-encoder"): committer Signed-off-by missing.
> dim: 5db8ae664da4 ("drm/bridge: lvds-codec: Simplify panel DT node localisation"): committer Signed-off-by missing.
> dim: e94bb2bf88e2 ("drm/bridge: lvds-codec: Add "lvds-decoder" support"): committer Signed-off-by missing.
> dim: b6fafff0c335 ("drm/bridge: Repurpose lvds-encoder.c"): committer Signed-off-by missing.
> dim: 1c060450177f ("dt-bindings: display: bridge: lvds-transmitter: Document "ti,sn75lvds83""): committer Signed-off-by missing.
> dim: d2f2a148ba7c ("dt-bindings: display: bridge: lvds-transmitter: Absorb ti,ds90c185.txt"): committer Signed-off-by missing.
> dim: 07e5c8731999 ("dt-bindings: display: bridge: lvds-transmitter: Document powerdown-gpios"): committer Signed-off-by missing.
> dim: 0fa9d2323ed3 ("dt-bindings: display: bridge: Convert lvds-transmitter binding to json-schema"): committer Signed-off-by missing.
> dim: ERROR: issues in commits detected, aborting

Laurent, I can push them into drm-misc if needed, so it will unlock boris.

Neil


> 
> *insert small sermon about if you do your own maintainer, pls do it right ...
> 
> Cheers, Daniel
> 
>>
>> Geert Uytterhoeven (2):
>>       dt-bindings: display: renesas: du: Add vendor prefix to vsps property
>>       drm: rcar-du: Recognize "renesas,vsps" in addition to "vsps"
>>
>> Jacopo Mondi (6):
>>       dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
>>       dt-bindings: display: renesas,du: Document cmms property
>>       drm: rcar-du: Add support for CMM
>>       drm: rcar-du: kms: Initialize CMM instances
>>       drm: rcar-du: crtc: Control CMM operations
>>       drm: rcar-du: crtc: Register GAMMA_LUT properties
>>
>>  .../bindings/display/bridge/lvds-codec.yaml        | 132 +++++++++++++
>>  .../bindings/display/bridge/lvds-transmitter.txt   |  66 -------
>>  .../bindings/display/bridge/ti,ds90c185.txt        |  55 ------
>>  .../devicetree/bindings/display/renesas,cmm.yaml   |  67 +++++++
>>  .../devicetree/bindings/display/renesas,du.txt     |  15 +-
>>  drivers/gpu/drm/bridge/Kconfig                     |   8 +-
>>  drivers/gpu/drm/bridge/Makefile                    |   2 +-
>>  drivers/gpu/drm/bridge/lvds-codec.c                | 151 ++++++++++++++
>>  drivers/gpu/drm/bridge/lvds-encoder.c              | 155 ---------------
>>  drivers/gpu/drm/rcar-du/Kconfig                    |   8 +
>>  drivers/gpu/drm/rcar-du/Makefile                   |   1 +
>>  drivers/gpu/drm/rcar-du/rcar_cmm.c                 | 217 +++++++++++++++++++++
>>  drivers/gpu/drm/rcar-du/rcar_cmm.h                 |  58 ++++++
>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |  71 +++++++
>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |   2 +
>>  drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   2 +
>>  drivers/gpu/drm/rcar-du/rcar_du_group.c            |  10 +
>>  drivers/gpu/drm/rcar-du/rcar_du_group.h            |   2 +
>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  93 ++++++++-
>>  drivers/gpu/drm/rcar-du/rcar_du_regs.h             |   5 +
>>  20 files changed, 829 insertions(+), 291 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
>>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
>>  create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.yaml
>>  create mode 100644 drivers/gpu/drm/bridge/lvds-codec.c
>>  delete mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
>>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
>>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h
>>
>> -- 
>> Regards,
>>
>> Laurent Pinchart
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

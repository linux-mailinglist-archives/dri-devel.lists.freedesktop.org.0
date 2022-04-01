Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374E64EEA79
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 11:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF6210E376;
	Fri,  1 Apr 2022 09:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E8510E376
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 09:32:45 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id kk12so1559430qvb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 02:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MicAAIxYy/iDzT2iR5+kPbLoF8E6ss/329hg63ZuCOU=;
 b=3CnCTumz9YY76lxgWN2UlTVuzhev3Nna6J9Du2HqvA02Ij7ZZAjLKRk12K5FieougC
 d5Zn5GbFenpld2+RH3IV09sfmWtBZyk1Xi9A5PPqT8XBxUS4Hm27jFj+tIRNbIMTOuCn
 DPvka0Ye9GhRE0FfJMhXRxRE54vxK2VkbEkY9dPdmEeTQvKxlTdwMYaFo7/SG8p+d/0W
 8AGA75haiy9s12RjV6772ct/rs/eS23jKFaTL26ya6TVYy+VkYskp6iAsh0MTs8ffZMv
 CB0qHW21RXJLAHtsWEQTVIBYi0Qlnrs2d51fNiVgvgUGiA8oQBDRln13hNzk+D4yc313
 29aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MicAAIxYy/iDzT2iR5+kPbLoF8E6ss/329hg63ZuCOU=;
 b=bVXCbK/QHplsNpo0X7ak0fVT/YhFmHnA3C+cfQBPAxTXlP7NyEhGdrtyMjiFdm0Hya
 nGyEqf1wM6pHT71/c+kFlveg+c+nx3DBPvP3spAdovB4vdiwgP96xtudiCvu1+FHIA6/
 zPaXG4xdxn6+2ydUamv+IxbVguZZAIVbG9B8VPkQ76d6w2aD00nY/EgRXGlahjIZllwi
 FBEHifClAcaaPtsVWoKvWAAhBSnsg7Fy56Ic/f3AxKdudXnwfTCP8qQOWDMy1+mdO5oV
 WyAyc+Zo3zu7EQhMLRrlaMsuRMCgSRQOOLS1bd2ztqhf+4254mbP53yUSDi9o2t8gd71
 HijA==
X-Gm-Message-State: AOAM533iZGxgXxP1pc3p8qf799g+fC6CDyQQo1UpjV7c/0BlCiWYT+Gm
 l/iBsjcGrFzDi/aZuQp3KUXg5JDUZOdi9CwdVdXh3g==
X-Google-Smtp-Source: ABdhPJxMrWFRgnJ0HABbALsyEWn++3TYT3GlrWCdJTKoJ5qhP66rEVIDTbtidg6sinbHg72xQektuQEkP9W4JCYNA8A=
X-Received: by 2002:ad4:4eaf:0:b0:441:7ff6:f639 with SMTP id
 ed15-20020ad44eaf000000b004417ff6f639mr7098344qvb.73.1648805564076; Fri, 01
 Apr 2022 02:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220330190846.13997-1-wens@kernel.org>
 <20220330190846.13997-3-wens@kernel.org>
In-Reply-To: <20220330190846.13997-3-wens@kernel.org>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Fri, 1 Apr 2022 11:32:33 +0200
Message-ID: <CABxcv==csvqsxM46ce2LecDh4E-UxxD2DG+3E-hCFoyrdtRv7A@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: display: ssd1307fb: Add entry for SINO
 WEALTH SH1106
To: Chen-Yu Tsai <wens@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Chen-Yu,

Thanks a lot for your patch.

On Wed, Mar 30, 2022 at 9:09 PM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> The SINO WEALTH SH1106 is an OLED display driver that is somewhat
> compatible with the SSD1306. It supports a slightly wider display,
> at 132 instead of 128 pixels. The basic commands are the same, but
> the SH1106 doesn't support the horizontal or vertical address modes.
>
> Add a compatible string for it.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> index 9baafd0c42dd..1ac016a2d847 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -13,6 +13,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - sinowealth,sh1106-i2c

I like that you didn't include a "fb" suffix for this, the existing
ones are cargo culting from the previous fbdev driver to make existing
DTBs compatible with the DRM driver.

I've been thinking if I should post a patch to compatible strings
without the "fb" and mark the current ones as deprecated...

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

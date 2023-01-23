Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5AD678384
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 18:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC77410E1F2;
	Mon, 23 Jan 2023 17:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E878810E51D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 17:45:36 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5018be4ae8eso119949077b3.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 09:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d01zSTfGwrlLeoMTvhp7fTs/JenLOvU/1msLaleXMQQ=;
 b=RQFR5laQW/95zTnrVDFLNbt4F2okD98YOCaKDt9M5Fy8B4k+UBnVpviU83NyfYyiXl
 P0ziLLc4tDftsJbJS10OdOSLeqK8EDMh/OSCAKJV43PMrBteRPbCA7TzFFxotpeT+Qce
 7AjEBxUm94Kubw+Bz8yAffEW3Q5EqrQdX5Mk03F53e7HRKTHLRP9sUuWd1U8RjDvd17s
 jJsVEzbcHsB309If22D059exzNDf6GHPQmVbGH3KJtLChJDlRHOPLB+mhvsKocGpD09R
 Nj4nD4nR3Nd88daDHLWzfmWfTnZ0t4vVYnMDl5dHIaDhS0jrjAMi0XAiF4zuusoOxQ1Y
 OPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d01zSTfGwrlLeoMTvhp7fTs/JenLOvU/1msLaleXMQQ=;
 b=ECuKYY5BZrRGN8D0oVhs4hGWV/FZ7G3Vy2zNPru/f72kDaPJBxv/3VuiZVWG3p9z0c
 8oWNND1nofSfh4MC37B13BEZs2hpkpuUt/ukgzN/2Z1BapiPlfnX5EPskYrZ9s41PJEL
 Ks7YjSgzQc686sAjArLb+BvoC309BUgDs9t6vi/CYaRPIoGwgVB+iCTfQH/hDBj9lXNt
 JVXctI/FBhZvt5XCOHD/qjLpnZW+xf0QufyqOcvoqhWROf8SMsjpL8JXMA7ReFzcF9Ru
 nPz49SWxLEOPhpuhCUCZc2tUaD9VVeq38mlsI9lt50SL0+1JVRit1X9lNGjGTUiqMod/
 ywyQ==
X-Gm-Message-State: AFqh2krqS9GAUpOIFqJJleuYe5gFA5AasINsJXr13crx/E+HNtLY8WHx
 41siA8oo7E8RYX0eM7/9nwpDiJ3SKk7B1rPLP1CuEg==
X-Google-Smtp-Source: AMrXdXt5IObiQj67C6S85jBL24ByAnHR7lXdpVBWRz8FNgT3v9kaaI4HgA+mDKA2qzz73vgg4qS0HOkIMztpBLnTn08=
X-Received: by 2002:a81:6145:0:b0:4db:fa5d:c681 with SMTP id
 v66-20020a816145000000b004dbfa5dc681mr2845868ywb.48.1674495935743; Mon, 23
 Jan 2023 09:45:35 -0800 (PST)
MIME-Version: 1.0
References: <20230123164018.403037-1-jagan@edgeble.ai>
 <ae50541f-7456-6088-b310-c67f653176ee@linaro.org>
In-Reply-To: <ae50541f-7456-6088-b310-c67f653176ee@linaro.org>
From: Jagan Teki <jagan@edgeble.ai>
Date: Mon, 23 Jan 2023 23:15:24 +0530
Message-ID: <CA+VMnFyfK-eZhneJuf54EngcS8XmhnOPXXzdjzBsiChpJV-7rg@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm: panel: jadard-jd9365da-h3: Fix panel vendor and
 model
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Tom Cubie <tom@radxa.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Jan 2023 at 22:52, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 23/01/2023 17:40, Jagan Teki wrote:
> > The initial datasheet claimed that chouzhong designed this 10"
> > DSI panel on top of JD9365DA IC, but later Radxa mentioned that
> > chouzhong is the manufacturer.
> >
> > So the actual design of the panel, gsensor, and customized FPC
> > is done by Radxa. The panel model named is Radxa Display 10HD
> > with AD001 is the part number.
> >
> > Fix the binding and panel driver with the proper panel vendor
> > and model.
> >
> > Fixes: <6b818c533dd8> ("drm: panel: Add Jadard JD9365DA-H3 DSI panel")
> > Fixes: <bb3098eead99> ("dt-bindings: display: Document Jadard
>
> Does not look like correct syntax. Did you run checkpatch?

Yes. I did check with --strict as well.

>
> > JD9365DA-H3 DSI panel")
> > Reported-by: Tom Cubie <tom@radxa.com>
> > Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> > ---
> >  .../bindings/display/panel/jadard,jd9365da-h3.yaml  |  4 ++--
> >  drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c    | 13 ++++++++-----
>
> Bindings are always separate.

Correct, but separation here triggers a warning for compatible not found.

>
> >  2 files changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
> > index c06902e4fe70..10ba1b813304 100644
> > --- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
> > @@ -16,7 +16,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > -          - chongzhou,cz101b4001
> > +          - radxa,display-10hd-ad001
> >        - const: jadard,jd9365da-h3
> >
> >    reg: true
> > @@ -52,7 +52,7 @@ examples:
> >          #size-cells = <0>;
> >
> >          panel@0 {
> > -            compatible = "chongzhou,cz101b4001", "jadard,jd9365da-h3";
> > +            compatible = "radxa,display-10hd-ad001", "jadard,jd9365da-h3";
> >              reg = <0>;
> >              vdd-supply = <&lcd_3v3>;
> >              vccio-supply = <&vcca_1v8>;
> > diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > index 48c1702a863b..ea89cecad0cf 100644
> > --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > @@ -167,7 +167,7 @@ static const struct drm_panel_funcs jadard_funcs = {
> >       .get_modes = jadard_get_modes,
> >  };
> >
> > -static const struct jadard_init_cmd cz101b4001_init_cmds[] = {
> > +static const struct jadard_init_cmd radxa_display_10hd_ad001_init_cmds[] = {
> >       { .data = { 0xE0, 0x00 } },
> >       { .data = { 0xE1, 0x93 } },
> >       { .data = { 0xE2, 0x65 } },
> > @@ -364,7 +364,7 @@ static const struct jadard_init_cmd cz101b4001_init_cmds[] = {
> >       { .data = { 0xE7, 0x0C } },
> >  };
> >
> > -static const struct jadard_panel_desc cz101b4001_desc = {
> > +static const struct jadard_panel_desc radxa_display_10hd_ad001_desc = {
> >       .mode = {
> >               .clock          = 70000,
> >
> > @@ -384,8 +384,8 @@ static const struct jadard_panel_desc cz101b4001_desc = {
> >       },
> >       .lanes = 4,
> >       .format = MIPI_DSI_FMT_RGB888,
> > -     .init_cmds = cz101b4001_init_cmds,
> > -     .num_init_cmds = ARRAY_SIZE(cz101b4001_init_cmds),
> > +     .init_cmds = radxa_display_10hd_ad001_init_cmds,
> > +     .num_init_cmds = ARRAY_SIZE(radxa_display_10hd_ad001_init_cmds),
> >  };
> >
> >  static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
> > @@ -452,7 +452,10 @@ static void jadard_dsi_remove(struct mipi_dsi_device *dsi)
> >  }
> >
> >  static const struct of_device_id jadard_of_match[] = {
> > -     { .compatible = "chongzhou,cz101b4001", .data = &cz101b4001_desc },
>
> This breaks ABI. When was support for it merged?

It was merged last year, in September

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6b818c533dd8615a803a72733eace58fd06e5a3c

Jagan.

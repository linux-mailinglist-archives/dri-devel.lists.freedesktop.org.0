Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A144232CE48
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 09:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D3D6E217;
	Thu,  4 Mar 2021 08:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BC36E217
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 08:21:04 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id m11so31377971lji.10
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Mar 2021 00:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9AL08l20kDaPVuLk597Zm/T67XJS41Kni3JLdRMWhiY=;
 b=rLSvZs8dq65OgpOsJHRzPx3CUz870MeurmxeOq+Es6ornwbydz6CJyhQTlG0iOcbdS
 P3PXzTrgEtzzINlkT87osaOCkmWMNKnasSqHBOxi6o4clszQOOV9BMtA6mur3ojt4jP3
 MkEQuag69pYlkPxLcjqRp3br/wtdeDDtbWFYRflTn78IwqqN46KHxkUxkVgrBahfT058
 0TazYUJpjEaaM5W6UiG+4BlMlA6lODI5D7XGBYYG3O7yed7ADrw01cykzYvydddd4NWu
 XKGZtOem70KxgMeTpNSDKR56zBszmeInuaOlEdnPIDBbiY3c3jAiXqmldCp5RLQJafzu
 Zwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9AL08l20kDaPVuLk597Zm/T67XJS41Kni3JLdRMWhiY=;
 b=ZwLTLOpmxHyFXA0Uhp6y8AveovO4eExOueK700XQTg9je0N9X7x45+Z9ECPdu5cK2+
 7GuVgsw6SjKNO10iMdgmukI0Vt9kYI0vmm5YYLQXC0qEwPhTXnYr0HkoVhlW4i6wS48V
 HD09SJn1SW0azYQrotESBz162NY3ZeONdHEl4GVAntKkCVoYxw4qWtPbSJelM8psqY8G
 0tSiJcjfxGD2U9zttPXe9B2CrI3C6RaOzXOFKq5EVg1LEMFszu/yaAHO8OD9BAzw2gbp
 DEkxEvqQOZ/lhtSXr3RIQo4M6Hr+txG1l2cnpasXztkocW7ydFr94gz4NPvQqH1ZoIEK
 VCTQ==
X-Gm-Message-State: AOAM531o5P+qLbg5hjQMoPkHBMC3PWFfl+FtTd/EqqMW17poFZv1207J
 SV34tSbVJqZelAi1u9rMYyI3318qDhEXvkRKJTsXYA==
X-Google-Smtp-Source: ABdhPJyELnkhjKH756+TT58T3ytYAeeG9nYJVMvVKvNWPPMV0hqlzoSjroskiX2muHQP/6qn1BO6PcwU7zO/48I2laE=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr1584415ljj.467.1614846063320; 
 Thu, 04 Mar 2021 00:21:03 -0800 (PST)
MIME-Version: 1.0
References: <20210304004138.1785057-1-linus.walleij@linaro.org>
 <CANMq1KAiYK+0Y+j82R2Smt6Hhc3jwZ==DD2Vu4xRKcr8cOm3Fw@mail.gmail.com>
In-Reply-To: <CANMq1KAiYK+0Y+j82R2Smt6Hhc3jwZ==DD2Vu4xRKcr8cOm3Fw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Mar 2021 09:20:52 +0100
Message-ID: <CACRpkdbHYSnpYB1nJ3Z0ATTU6qZKooUMtmJYUb5dotzgbCXTTw@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde/panel: Inverse misunderstood flag
To: Nicolas Boichat <drinkcat@chromium.org>
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 4, 2021 at 2:57 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
> On Thu, Mar 4, 2021 at 8:41 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > A recent patch renaming MIPI_DSI_MODE_EOT_PACKET to
> > MIPI_DSI_MODE_NO_EOT_PACKET brought to light the
> > misunderstanding in the current MCDE driver and all
> > its associated panel drivers that MIPI_DSI_MODE_EOT_PACKET
> > would mean "use EOT packet" when in fact it means the
> > reverse.
> >
> > Fix it up by implementing the flag right in the MCDE
> > DSI driver and remove the flag from panels that actually
> > want the EOT packet.
> >
> > Suggested-by: Nicolas Boichat <drinkcat@chromium.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
>
> I wonder if it's worth adding the fixes, should be:
>
> Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
> Fixes: 899f24ed8d3a ("drm/panel: Add driver for Novatek NT35510-based panels")
> Fixes: ac1d6d74884e ("drm/panel: Add driver for Samsung S6D16D0 panel")
> Fixes: 435e06c06cb2 ("drm/panel: s6e63m0: Add DSI transport")
> Fixes: 8152c2bfd780 ("drm/panel: Add driver for Sony ACX424AKP panel")
>
> But then you'd almost need to separate the patches in multiple bits
> (these patches landed in very different releases).
>
> I'll leave that up to the maintainers to decide: this would only
> matter if anybody tried to use these panels on LTS releases with a
> non-MCDE driver (or MCDE with other panels).

It's not even a regression until someone else starts to use these panel
drivers (currently noone does), so I'd say let's just apply this and then
rebase and apply your cleanup on top.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

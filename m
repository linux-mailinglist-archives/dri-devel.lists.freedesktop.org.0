Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C13246EFFA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98C610F2FC;
	Thu,  9 Dec 2021 16:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931C689FFD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 15:34:29 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v1so20997263edx.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 07:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v7q+b8ru+Ky6lO25qRsnx8MdjQIu6CL1OnWNn18j9rA=;
 b=CKUdXy3kgh5kOICc3cQf8Jmegb7VQw0+KBnTRYoNebDTfC5UxxgRzbmDvpxAktKFeK
 NKy7BcU1YI7AHWjgUVcT7siUYtEkr0oEbqiqTFTGVcu/WR7AcxGs2aYBHIpEKuPEp263
 jXdWJEsFZbIwWrup+zP8mIHtn7swj3o2HjRdCfjAKXmZN25AnGcSn1PKyH5McF+m/C/l
 nWy+KShSstXIV1bA3bikl/TB61SQdsvOrcgrikSkddBnDx0gMNK/7WYXcRNdQnV7nIQu
 PnxvlErkDP2puHqlJ/d7cPeBhq5lcfcp+JK7IrDguPTNELhDqhCGKxqx7KDlfO0DSAH/
 ydIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v7q+b8ru+Ky6lO25qRsnx8MdjQIu6CL1OnWNn18j9rA=;
 b=UjEyn72IZycnkgeU//gMi8I6kx0ZI9XwwtVyDX4yBxWXhITGO7jX2zvr0S++Qh1a6a
 I3O1OMcffCGgZhspEuhBdqtZaSbsp7WOAPK6eu5vAvwDEc/c5rGivzJHBcc2HMXCS91y
 J6LZt5iJ+UuYjcHXtub0moI2k3zs5YOKQx/pvyuf15jCbErwXCTtVU56TeCXtaoWVdkd
 g3ThWBT6k6OqbAiIS1DIz02Pi8ZraNPsAZPjXeN6YH9BQtIZCGNdl8WKRRulw+Z53Zd5
 oJSqdbXdCfi7uGt9zQorGO0ozfqBjoQywx/7QvVumR+ZqoTflCOO/6q6s0GjKTDS2XId
 yGQQ==
X-Gm-Message-State: AOAM531jNjgb6iCoLWd7ediFPiAT404W42sGvSRzK5Yfv/uCbYQZQLE2
 As2jdPd5j5OAoDSp7apzz5G4np3m/r2xwpGJV9w=
X-Google-Smtp-Source: ABdhPJyWpLtmhRm6GMN81/OCA7635jv2GlCrohxEtBVOLvosfETIwBbIKp5yfLk3RuimXXe/lW1fNxtfojs8t86sG3Q=
X-Received: by 2002:a17:906:bccc:: with SMTP id
 lw12mr15968050ejb.128.1639063946054; 
 Thu, 09 Dec 2021 07:32:26 -0800 (PST)
MIME-Version: 1.0
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-2-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1639062321-18840-2-git-send-email-akhilrajeev@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 9 Dec 2021 17:30:53 +0200
Message-ID: <CAHp75VeP_9P+GaD=vXZdQdOjZpdWxUWp+0=yPy0zJefi=qh=oA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: tegra: Add SMBus feature properties
To: Akhil R <akhilrajeev@nvidia.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 9, 2021 at 5:05 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Tegra I2C can use a gpio as an smbus-alert. Document the usage of
> the same.

...

> +optional properties:

Optional

> +- smbalert-gpio: Must contain an entry for the gpio to be used as smbus alert.

-gpios (the suffix in plural form, the singular is a legacy one)

> +  It will be used only if optional smbus-alert property is present.

-- 
With Best Regards,
Andy Shevchenko

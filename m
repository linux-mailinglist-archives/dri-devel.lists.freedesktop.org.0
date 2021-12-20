Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954CB47AC8C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 15:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2183612B31E;
	Mon, 20 Dec 2021 14:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1F112B31E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 14:45:43 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 207so16322461ljf.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 06:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=azjMHpzBKIXpLt7eJVZY7S68Lm7tOTiqCXYMcxNQyMw=;
 b=NSwokfIWL3IYHZk7p47iqPecEFM8m5oq0dUK2kM41oRLglP60RumIfoIigeeo7DBQ9
 LfgZY3yyL4OsCxIjuVyovga4Yh/NoYMKnAXgfmDIda5lkIxJ7GmYxyJEaJpm3ujnN/iD
 f9qJ8CwvxNq04bWTAx4WX+OlDyrt5k0WL5FxCy5r9dGzhLlMfnBMt9lGJwouhzfqeQtL
 TeOdHThyrp5P9dySiaNGHQWW2W8/9V4unIo0NA2V8eSyAqAcCp1EbRzEOh0xPKoTmwnG
 OsLAQ7yGyfrmnKhJxJGwDrjybKSkAkGnFh1Zfofi4jBkm+gmUGiM3IZUcTHntZHlXzcy
 KWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=azjMHpzBKIXpLt7eJVZY7S68Lm7tOTiqCXYMcxNQyMw=;
 b=FZTbC62JnpputGqVkjtLOdcTSi25o986OAigFG3TpAWF5CPgTMLkNj7BXORtBdOCeB
 2u06DCuBwXyLy19d0p9Li5TXU0IEgTGCA5xvq4UOxUk8mbCVi4AF+lY3y7vEVFmZT/oW
 1gClqshgBJsUNzfX6U0KVkxx0MdgQHTy4toslk0asSyZJHhKKPcBEGxJ3uo4qwlBsbVa
 aOH9jzw4OAJWdXXAdpxkWg1pt+iSAXnhoyqbMXASEk2kfE0zMFenDT/1lbusdLEf7QRk
 sdo/Tp4hxi/Id0gS118bD1vhbVYSO0OCZrIIuvRRgxgMtjgPgmHgqqZ6MBOUce5Mf9mI
 c1TQ==
X-Gm-Message-State: AOAM533xOqHLoIwRIw3T6H6o1ZJ5rFMdRPTIIk0PcjPINAjAwqxq14Pg
 Y4SzpxxTrUeEL8S3iVfm5nM=
X-Google-Smtp-Source: ABdhPJyT/qvGCamv86W2+M/tpdesBDYT/OiccGpGA+lWbcSgb+7k1s16tg941SAxvaxQ5zClzTB6uw==
X-Received: by 2002:a2e:8396:: with SMTP id x22mr14769311ljg.255.1640011542276; 
 Mon, 20 Dec 2021 06:45:42 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id c19sm398456lfc.245.2021.12.20.06.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 06:45:41 -0800 (PST)
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com>
Date: Mon, 20 Dec 2021 17:45:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220104855.428290-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

20.12.2021 13:48, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> this is an alternative proposal to fix panel support on Venice 2 and
> Nyan. Dmitry had proposed a different solution that involved reverting
> the I2C/DDC registration order and would complicate things by breaking
> the encapsulation of the driver by introducing a global (though locally
> scoped) variable[0].
> 
> This set of patches avoids that by using the recently introduced DP AUX
> bus infrastructure. The result is that the changes are actually less
> intrusive and not a step back. Instead they nicely remove the circular
> dependency that previously existed and caused these issues in the first
> place.
> 
> To be fair, this is not perfect either because it requires a device tree
> change and hence isn't technically backwards-compatible. However, given
> that the original device tree was badly broken in the first place, I
> think we can make an exception, especially since it is not generally a
> problem to update device trees on the affected devices.
> 
> Secondly, this relies on infrastructure that was introduced in v5.15 and
> therefore will be difficult to backport beyond that. However, since this
> functionality has been broken since v5.13 and all of the kernel versions
> between that and v5.15 are EOL anyway, there isn't much that we can do
> to fix the interim versions anyway.
> 
> Adding Doug and Laurent since they originally designed the AUX bus
> patches in case they see anything in here that would be objectionable.
> 
> Thierry
> 
> [0]: https://lore.kernel.org/dri-devel/20211130230957.30213-1-digetx@gmail.com/
> 
> Thierry Reding (2):
>   drm/tegra: dpaux: Populate AUX bus
>   ARM: tegra: Move panels to AUX bus
> 
>  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
>  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
>  drivers/gpu/drm/tegra/Kconfig             |  1 +
>  drivers/gpu/drm/tegra/dpaux.c             |  7 +++++++
>  5 files changed, 33 insertions(+), 19 deletions(-)
> 

It should "work" since you removed the ddc-i2c-bus phandle from the
panel nodes, and thus, panel->ddc won't be used during panel-edp driver
probe. But this looks like a hack rather than a fix.

I'm not sure why and how devm_of_dp_aux_populate_ep_devices() usage
should be relevant here. The drm_dp_aux_register() still should to
invoked before devm_of_dp_aux_populate_ep_devices(), otherwise
panel->ddc adapter won't be registered.

The panel->ddc isn't used by the new panel-edp driver unless panel is
compatible with "edp-panel". Hence the generic_edp_panel_probe() should
either fail or crash for a such "edp-panel" since panel->ddc isn't fully
instantiated, AFAICS.

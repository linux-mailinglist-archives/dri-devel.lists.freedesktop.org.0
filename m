Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFB5494EFD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 14:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B1510E806;
	Thu, 20 Jan 2022 13:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CF210E810
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 13:28:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso20482673wma.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o79zmIgM+0ygHLPIofxNguMisbIrS5RcmJsJrzjmaPQ=;
 b=Xj7UKsSlDlKrCE2AIAP0jK14mFJPZQ6XVUdmOf0NO2O+eQn8fA69i3yrf2cTGf73nT
 tcLTUQsVkA2upYrCJYN+XWCsLabv4GNy5J0PT7+IiAjbbYwWmUm+O6psOlFWwIIy7u9N
 D1FsHzOf9kVonNk56g+QCtmB3s1imUSTq2blX8TOMy04a0PEmGLL8861MtDtzATA91nF
 3rQg4Nw0c+ZVi6FLmo/NXBeb88AWhERtowV4m56WbiRvMPbexwawbmBEx/31AEHaUejD
 /4BUJ5wGtl8IbmWtscWIxFrfU9hdpOmMdogn8UBHmUSdi0ctF0bJMq0pjPOrk1bqTP8V
 ffUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=o79zmIgM+0ygHLPIofxNguMisbIrS5RcmJsJrzjmaPQ=;
 b=E8CxbZ5r5vJQ/TDi/Slb/9px9UqT8LVSnVf66+58YeWVkb7U3+3RWY52QwWngj8XaP
 6spQtCJNmBX3x6dpHZEdy9CkgxWfLqSbThbQqchAx4+OocB5dx+FbXGSums4EcUrhgu1
 NkeuuCEyPX8BkTwsJqDCJNyXyUmti6oznhVWcRGP5BsZk5j0wF3epLX70DSXSOhrfijU
 mgapWZhPniZNNdaEsNvjs0ayVQqaYSRKLaAha7XKp9oaPCBC8z41EVA4JhIjBG5xkFHM
 F7rurcJD7sD8c+mafVKRmosej5Yzd8mjtYdl6nJp40Jr8X3fxXFndexg+SbsgFpkXKpZ
 SJPQ==
X-Gm-Message-State: AOAM532eJEQLkVtlJ3Ei/g9rd3W/bfG1NFTenISJHmH8TdbZ5zZ3ptbt
 fs6Fo7ut4gyLAIwrLio9JZAKWNE232jVhA==
X-Google-Smtp-Source: ABdhPJwr0AR9fJdYR/gs6Ax3XVyox+sS0VTouqDzQdsMfO6OQs1paqSXdhIUYrUei1KpgkaOylRuRg==
X-Received: by 2002:a05:600c:1c99:: with SMTP id
 k25mr8710099wms.159.1642685292800; 
 Thu, 20 Jan 2022 05:28:12 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:ced2:397a:bee8:75f5?
 ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id i8sm4537859wry.45.2022.01.20.05.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 05:28:12 -0800 (PST)
Subject: Re: [PATCH 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
 <20200907081825.1654-7-narmstrong@baylibre.com>
 <CAMty3ZBEmafG8LS_yv4eektvUoHwYFoV=-8wohUXgsvpRbZqtA@mail.gmail.com>
 <70d1af3f-bc00-4afd-1157-1cf70d3b2c88@baylibre.com>
 <CAMty3ZC9Cp=8=iF=KYCWjwb-wk+VrPBzH+6L14H6iZcSm3CZjA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e1fa9887-da2e-3a69-0e2e-3a6d07e13cb5@baylibre.com>
Date: Thu, 20 Jan 2022 14:28:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZC9Cp=8=iF=KYCWjwb-wk+VrPBzH+6L14H6iZcSm3CZjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 20/01/2022 12:03, Jagan Teki wrote:
> On Wed, Jan 12, 2022 at 1:49 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Hi,
>>
>> On 12/01/2022 08:24, Jagan Teki wrote:
>>> Hi Neil,
>>>
>>> On Mon, Sep 7, 2020 at 1:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>>
>>>> The Amlogic AXg SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a), with a custom
>>>> glue managing the IP resets, clock and data input similar to the DW-HDMI Glue on other
>>>> Amlogic SoCs.
>>>>
>>>> This adds support for the Glue managing the transceiver, mimicing the init flow provided
>>>> by Amlogic to setup the ENCl encoder, the glue, the transceiver, the digital D-PHY and the
>>>> Analog PHY in the proper way.
>>>>
>>>> The DW-MIPI-DSI transceiver + D-PHY are directly clocked by the VCLK2 clock, which pixel clock
>>>> is derived and feeds the ENCL encoder and the VIU pixel reader.
>>>>
>>>> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
>>>> DW-MIPI-DSI transceiver.
>>>>
>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>> ---
>>
>> [..]
>>
>>>> +
>>>> +static const struct component_ops meson_dw_mipi_dsi_ops = {
>>>> +       .bind   = meson_dw_mipi_dsi_bind,
>>>> +       .unbind = meson_dw_mipi_dsi_unbind,
>>>> +};
>>>
>>> Do you thought of non-component based meson DSI like STM DSI? It
>>> require changes from meson drm but just to understand if you have any
>>> such plan.
>>
>> I have no such plans for now, note this serie has been rewritten at [1] but still
>> with based with components.
>>
>> If worth it, the plan is to get it with components and than yes if it's simpler
>> drop components completely.
> 
> Dropping components make the pipeline well suited for bridges as we
> are moving bridge-driven pipelines in other areas.
> 
>>
>> I'll have a look at how ST does
> 
> ST has no components. As I said above, eventually there would be
> common bridge driver for dw-mipi-dsi if meson and rockchip moving away
> from components.

ST driver is much more simpler.

And having a common dw-mipi-dsi is unreal since each HW has a different glue HW
me must handle. Even if we moved all the glue handling under drm/bridge/synopsys,
we would need a different set of callbacks for each HW for each compatible
which is basically the actual situation except components.

Neil

> 
> Thanks,
> Jagan.
> 


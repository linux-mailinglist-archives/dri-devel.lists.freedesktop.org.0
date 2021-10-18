Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D75BC431195
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 09:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DCD6E97E;
	Mon, 18 Oct 2021 07:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02556E97E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 07:49:59 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso7679064wmb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 00:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T/qx6dvcDkO1aEfmrGOeAb9WXZdVZKpvlTMRbcmlbAg=;
 b=v2pQOhbcutTJ6Ai/KVzZj6lkpmfHXo+VLK9KyltkpnhAPqUqMH2p8q0GMh2PCXif7+
 +qTlYgBeKCX4qazwHZU2eB+u2auOcwfQSTWvqViCeWi3dS5A8K2boiGjewnvkffZroel
 oblW4qX8LRKJFsPG+zfaTvTwIUBuEaRhSnMAyT7W/vRYTbWBP5FEOM/Ge7oqnBfZPWiv
 ghTNXo9ahfQ3Xd5RBiTVEOOzuP/JE6uweRvIQjSYtzxTZwewSjYrWdpW4LimUBCZbseQ
 lh9HiBEqSmvFFNE8Gi9/LbbWgzuo/VC1T0adTfJPUrVm7s+r4041jV2k6PJmISMvTy01
 Utrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=T/qx6dvcDkO1aEfmrGOeAb9WXZdVZKpvlTMRbcmlbAg=;
 b=D1UhGduKuLWcWAOceV4d3EJwHPLvqSXCoTsFGZdd2EnJgCjfpqCNVAWy1RDN/mD9ni
 hpC8zFKfDVmCqDS6uZWHhU9dL7Bm6E55ny5v0Eer4z49nF8TPvCGInSinTXvlKcQ78Nw
 8+8gtmiimwQ++s4z8byMHE2rqbANqXio532TI2OQgKi9apNaCjH9UlD2pn/MXGDjQwrt
 C7NG/R1ECjh6v4sLBxS1jKqZWlrsWQ6F5CV69AVRRPi/5DQoEpb9lZJHGl+NpiKXSYp0
 oFdyKPE+tJeWlpTt30Ap0o9z97OfbTXYLPvy6+PzRh3ESZbpZ6AOeUDg7e9IV0CFHZGE
 jF9A==
X-Gm-Message-State: AOAM532DeoMUhXh5Mj+WNd87VQxTdzpfBryf57cUDwIFBLZHC//XqKBZ
 cY7dWCEF4Ybo2NZ9tXaq4PMAsQ==
X-Google-Smtp-Source: ABdhPJwYyhnLt4aqI4jUYRQVzmEWl7fxodIOaaHM4325FF2WV3XJQPVTYW3pID+zVKG5yz0eTko1IQ==
X-Received: by 2002:a7b:c741:: with SMTP id w1mr1938097wmk.9.1634543398107;
 Mon, 18 Oct 2021 00:49:58 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2dd7:d5eb:6e87:f924?
 ([2001:861:44c0:66c0:2dd7:d5eb:6e87:f924])
 by smtp.gmail.com with ESMTPSA id u2sm11453082wrr.35.2021.10.18.00.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 00:49:57 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] drm/meson: encoder_hdmi: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-5-narmstrong@baylibre.com>
 <CAFBinCB_Z+errWL4C-K3WrPu2B7gxr3NRFsF3_Xoy48XDsOb-A@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9cba6fbf-a8f7-4831-5774-1e270932816d@baylibre.com>
Date: Mon, 18 Oct 2021 09:50:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCB_Z+errWL4C-K3WrPu2B7gxr3NRFsF3_Xoy48XDsOb-A@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 16/10/2021 00:07, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> This implements the necessary change to no more use the embedded
>> connector in dw-hdmi and use the dedicated bridge connector driver
>> by passing DRM_BRIDGE_ATTACH_NO_CONNECTOR to the bridge attach call.
>>
>> The necessary connector properties are added to handle the same
>> functionalities as the embedded dw-hdmi connector, i.e. the HDR
>> metadata, the CEC notifier & other flags.
>>
>> The dw-hdmi output_port is set to 1 in order to look for a connector
>> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> another great piece which helps a lot with HDMI support for the 32-bit SoCs!
> I have one question below - but regardless of the answer there this gets my:
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> [...]
>> +       pdev = of_find_device_by_node(remote);
> I am wondering if we should use something like:
>     encoder_hdmi->cec_notifier_pdev
> 
>> +       if (pdev) {
>> +               struct cec_connector_info conn_info;
>> +               struct cec_notifier *notifier;
>> +
>> +               cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
>> +
>> +               notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
>> +               if (!notifier)
>> +                       return -ENOMEM;
>> +
>> +               meson_encoder_hdmi->cec_notifier = notifier;
>> +       }
> and then move this logic to meson_encoder_hdmi_attach()

We can't because we create the connector after the attach.

> This would be important if .detach() and .attach() can be called
> multiple times (for example during suspend and resume). But I am not
> sure if that's a supported use-case.

Attach for now will only be done once at probe, and detach only a remove,
we don't change the bridge chaining while suspend/resume, we only reset the
pipeline state and put the old state back when resuming.

Neil

> 
> 
> Best regards,
> Martin
> 


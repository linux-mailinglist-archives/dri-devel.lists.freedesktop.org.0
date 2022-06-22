Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF34554DF7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EBB1123A3;
	Wed, 22 Jun 2022 14:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72218112457
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:53:43 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id u15so7141986ejc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 07:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HksIOYQ04JYg2f0eKNPT7IHZR7tMMF0Xa3OeTT746VA=;
 b=mqARrPAKxR8z0ETRJaLvggdZ3s8/6oH8pOtcLK9EdQ//wTAN9usE69XpKc36A4DGCj
 KXP1LUdMWuA7uY3EXWy3Ax0bndxwsEfh4x54N6zuYD54JzzSZJzwaSw6Zh7QCX8xO2zt
 IXCZhg2PcrezimwVFqLzo5Ify3K8cbljOnS9ygVFx0TBXMH9iserpKW0ArD3uZyfXcwu
 wWsUuSJ2HnnMkIkozcHGcalwpQYi/w+0yGZ2LSRWeIRXYv+ulbucy72N+UU1PgQRbbG+
 eGtfsDJIECXsQNbilsyqaLxFMDKbc4Dct24TG3VuHWkoGv0zqmjrK0PBeDb/5TrrbYJ9
 HY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HksIOYQ04JYg2f0eKNPT7IHZR7tMMF0Xa3OeTT746VA=;
 b=Zd1j7fSzImOAgnpzfXRCc1MoohWunzNoSOsk6QTHb3UdNLrdMM2h7f/65LleGVguUs
 ywUQ90FDvvOw29Sdvy15FRdmWD5wFT9cJkgK16iXhWHdnRo9ha1tlhniJP33USSBjuPO
 Ra+rl6sL3eEDlZOHRFd47YVXtetExVZXRD8uS8N0EVuPSh6FiTOfExKB5JTQQJp8AJKi
 Bn5tJ+TFOdT9p8DM7fn+02aSolZppAcCYTVCADYLwOUStPAAkEPiy8sNPdbdDY9FZiMX
 lXr9XKDb4zhQr+oZPgPGtfulXN02ZJo+DFifS7rydpxNNBExjGQJ9sdnZE7Hh7sbC75C
 MIhA==
X-Gm-Message-State: AJIora9LlZfrvKK+GCjROr0KiiWP6r1MZDGP7JbQGsLLWTjoQgvV2Y9e
 NsQvV2lEr8ozyA+fCfMoAhNpTA==
X-Google-Smtp-Source: AGRyM1u+K1u+xwGtx13m+HGTMXIlqo/MNWEzkQKKWF4vAOgxf/oC3jSGonkXzyloIphNK0YGE1ME8w==
X-Received: by 2002:a17:906:ca91:b0:70d:52ca:7e7d with SMTP id
 js17-20020a170906ca9100b0070d52ca7e7dmr3505720ejb.552.1655909621956; 
 Wed, 22 Jun 2022 07:53:41 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 u22-20020a17090617d600b006f3ef214dc0sm9423261eje.38.2022.06.22.07.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 07:53:41 -0700 (PDT)
Message-ID: <8f0501c5-84f2-10f1-ae06-4b3936c50b12@linaro.org>
Date: Wed, 22 Jun 2022 16:53:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 0/7] usb: typec: Introduce typec-switch binding
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Prashant Malani <pmalani@chromium.org>
References: <20220615172129.1314056-1-pmalani@chromium.org>
 <CACeCKaetgayTS+yX0cuNiK7j6Yqd4o2ziX6nCoGTt64A3jFT=g@mail.gmail.com>
 <YrHE9KrF0HG9rVi/@kroah.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YrHE9KrF0HG9rVi/@kroah.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2022 15:17, Greg Kroah-Hartman wrote:
> On Wed, Jun 15, 2022 at 11:13:33AM -0700, Prashant Malani wrote:
>> I should add:
>>
>> Series submission suggestions (of course, open to better suggestions too):
>> - Patches 1-3 can go through the USB repo.
> 
> I will take patches 1 and 2 now.
> 
> seems the others need reworks or acks from the DT people.

I just gave for patch 3 and before for 4, so you can grab these as well.
Thanks!

Best regards,
Krzysztof

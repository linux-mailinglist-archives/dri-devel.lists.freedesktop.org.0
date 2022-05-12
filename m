Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03703525155
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 17:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680F61122F6;
	Thu, 12 May 2022 15:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05E91122F4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 15:33:07 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u3so7809201wrg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 08:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lJYjLsOwmK98ck5i9BA7AMHyM0+m23dl9hRD8ezZWsg=;
 b=7175BeiZTNnqicYIMG/cOrNiBlDvLKZRf1+0zm252nF0IbNg5cux+zMTmEhDwfdwjj
 D8y7WGXTRdBo9lGN10jQCjFjp7pJWpudmv1c6xod6aiIDaee9K72/VExLTRrN7jWxdE5
 C10ZP+ZKBU60oLVrauNVP14wSVba01uWfQREMogbhDXsfJgOF7ZGdkzwkvSqLXtdUmuo
 fYp/kJSJKcY/bwejIU9LcYeE6Y2TXIJsv7d27xixdHP9ZnErc6a77xHNuvfztBdeJiuu
 hyzdVNNhqH3JgJXfH3iFTFvJSFe00qzD8P13AW/XCioV+1dPbiyQcRb6AxQBqLRVMuZo
 Cjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lJYjLsOwmK98ck5i9BA7AMHyM0+m23dl9hRD8ezZWsg=;
 b=j8Z5vyExXwtL/8fbl+lazDHznSV5ebtmPerk4qI4GMGZw2Skh9gzugYEnprIAlRhHM
 28+/0OmTn3D1ty2+iqoMI4pRbVPP5EDtKVIHdnbImZ4GGA00Z9IHYcEQvqODYL7VEPyf
 i4djOA5ufSQRvdViuc9cdOrRS9BIpMptSdX7M+ekTvIs3Nc3G/qU7YAKjobDpIpjNaxj
 n36L2jO6xx2QZ08PDbqRBtXP70opuLfx/Orav01dVu2Qh7McEbm5ej2ckVM73DcIju+t
 +8bpf8XJ5XZZGs2+hel8Lmwa/1ddKbgZYN7LPIzhayEe0HnAKikEPrU2TTXpfvbZCko2
 hbEA==
X-Gm-Message-State: AOAM530WfVXKevAMLF8Vnn5fi+dOUDDgXIxEZPP+OsCU1g/o5h/fkdlw
 Tzue1AJntSJBrStgpQxi+DeFvw==
X-Google-Smtp-Source: ABdhPJwxvzdMxbrTjFcSe+SbbqUc4+HBjEVB6/fb0QRLLMg1yy6dIz3V8d6rId8zYFdHJl8rC71Tow==
X-Received: by 2002:adf:cf12:0:b0:20c:dc8b:ae99 with SMTP id
 o18-20020adfcf12000000b0020cdc8bae99mr211414wrj.550.1652369586258; 
 Thu, 12 May 2022 08:33:06 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:4b80:c5a9:17cd:ed1e?
 ([2001:861:44c0:66c0:4b80:c5a9:17cd:ed1e])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b0020c5253d8edsm4505077wrs.57.2022.05.12.08.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 08:33:05 -0700 (PDT)
Message-ID: <f3a08514-a92d-df2b-48f6-b29d0be42861@baylibre.com>
Date: Thu, 12 May 2022 17:33:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miaoqian Lin <linmq006@gmail.com>
References: <20220511054052.51981-1-linmq006@gmail.com>
 <CAFBinCAQaCNcYmF0kT6o7zOCHy3eV+vHOHC10XULYXvDO6_-6w@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAFBinCAQaCNcYmF0kT6o7zOCHy3eV+vHOHC10XULYXvDO6_-6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/05/2022 14:38, Martin Blumenstingl wrote:
> On Wed, May 11, 2022 at 7:41 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>>
>> of_find_device_by_node() takes reference, we should use put_device()
>> to release it when not need anymore.
>> Add missing put_device() in error path to avoid refcount
>> leak.
>>
>> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> Thanks for sending this patch!
> 
> Neil, while reviewing this I noticed that on module unload we're also
> not calling put_device().
> This note doesn't affect this patch - but I am wondering if we need to
> put that put_device() during module unload on our TODO-list?
> 

Indeed, it should be fixed.

Neil


> 
> Best regards,
> Martin


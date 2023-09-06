Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6BB793879
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3157610E184;
	Wed,  6 Sep 2023 09:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B2010E184;
 Wed,  6 Sep 2023 09:40:18 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so4986161a12.1; 
 Wed, 06 Sep 2023 02:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693993217; x=1694598017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X9Vb47gswGc4CRFmCgVTREKIby3QhfxygfFTeY7yqU8=;
 b=Ao9wuGckfQOQNZwPOzx7K6e9yNXhVQPkqL46S/jz+BEc7PlFwgf2/A7elpqb8oOUr0
 8m+cKSLmBoZihy1/oiXUiZJeKhdFo2PpTn2THvHYyxOvCQoMTZ81pfJXUonn5aQ8xIR3
 tUTsrjA3wVpEXzpaBwNZf+/alUCygXv004qVqsEGSJNBXiZd2eJ2UKns2xryf9UV0ywL
 +K1lWSQfhF7tudjhRxb9NUcy5pbIraQ9ctJrivU6Q0dxwb3QqKicsVdd2jfb5KgoJVB9
 VNuV1GFi+rVvabSA+4TVUzGdL8K0jj5Mm+Eus1HUV5g5QyFXdpXxJfElI0i+OAoocQsy
 6QqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693993217; x=1694598017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X9Vb47gswGc4CRFmCgVTREKIby3QhfxygfFTeY7yqU8=;
 b=OKCom0vVX+Y7pQFwM5dJxsprj/hOEuChgGyn/L9ifOurqXAioFZd1S5X1iY33VxXfp
 KAMeLuAohil66wX5wXQELIjGVlsU9AYxkwDCT0O9fWD4JCkjS4w8pqFKtaLqsKLsAex2
 ECzRMLRqAmiops+dherw4Kx1qIbN9DaVye9BSciqd1upZE/6JK1KryHl5Aq9ls1ol04a
 lJ6u+WUIpdJ7wYMpzINwv7eyylSmgLi2VfESsQFXbd2wGm/N5QWfXvk6aeNckp+idM5+
 1tc8I/zj5AR5Sq7t04MM88TZ9mXPzlxk6KZPDLLOnbT93ZKy66+U6CsuhIlp455+MXzJ
 aH4g==
X-Gm-Message-State: AOJu0YwFcoz6faH++xv1tEhBl87VCYV8qozyR3vIgbZuJXVQb/Q7glrD
 auxxhzSMHAu0LE1RUCbrWYw=
X-Google-Smtp-Source: AGHT+IGAFjVUBWoiL4jFZIhLJ5+kFxpO6Qwb5IlvPalw7IqLnbbVI5DXHgXOw/07cUZAyzy2ptzREw==
X-Received: by 2002:aa7:c750:0:b0:522:3ef1:b1d with SMTP id
 c16-20020aa7c750000000b005223ef10b1dmr1598365eds.6.1693993216912; 
 Wed, 06 Sep 2023 02:40:16 -0700 (PDT)
Received: from [192.168.178.25] ([134.19.97.6])
 by smtp.gmail.com with ESMTPSA id
 es9-20020a056402380900b0052e9b50dafdsm599052edb.33.2023.09.06.02.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 02:40:12 -0700 (PDT)
Message-ID: <10509692-ce04-e225-5a27-abc955554bdc@gmail.com>
Date: Wed, 6 Sep 2023 11:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <2adfa653-ac35-d560-be52-c92848a1eef5@gmail.com>
 <b51d49f3-e3de-6b8d-9cb4-df5c03f3cdc0@loongson.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <b51d49f3-e3de-6b8d-9cb4-df5c03f3cdc0@loongson.cn>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.09.23 um 11:08 schrieb suijingfeng:
> Well, welcome to correct me if I'm wrong.

You seem to have some very basic misunderstandings here.

The term framebuffer describes some VRAM memory used for scanout.

This framebuffer is exposed to userspace through some framebuffer 
driver, on UEFI platforms that is usually efifb but can be quite a bunch 
of different drivers.

When the DRM drivers load they remove the previous drivers using 
drm_aperture_remove_conflicting_pci_framebuffers() (or similar 
function), but this does not mean that the framebuffer or scanout 
parameters are modified in any way. It just means that the framebuffer 
is just no longer exposed through this driver.

Take over is the perfectly right description here because that's exactly 
what's happening. The framebuffer configuration including the VRAM 
memory as well as the parameters for scanout are exposed by the newly 
loaded DRM driver.

In other words userspace can query through the DRM interfaces which 
monitors already driven by the hardware and so in your terminology 
figure out which is the primary one.

It's just that as Thomas explained as well that this completely 
irrelevant to any modern desktop. Both X and Wayland both iterate the 
available devices and start rendering to them which one was used during 
boot doesn't really matter to them.

Apart from that ranting like this and trying to explain stuff to people 
who obviously have much better background in the topic is not going to 
help your patches getting upstream.

Regards,
Christian.


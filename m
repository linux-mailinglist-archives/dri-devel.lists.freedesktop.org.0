Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4F4542B79
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1C910E826;
	Wed,  8 Jun 2022 09:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FC110E7DC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:27:01 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id n4so10215602vsm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=2lZGbCRWT1o/aFofNx6AhoO+aw7BhW/JA9MZQKTHd/A=;
 b=gghKvqxf+FCHVDQ0z8HltpRkE8orGonRmXkKDy3rmBAp4EZQKHdsHHdU4aIflo5h3Q
 j0LgQYXetLu4RrItKOeALnnTFjY7yBiNLGdf+nKg0aYppRWaSzQB/Io67FwlVpW0tE5c
 sPmZN5/QTgMUwDrqd6SIOSHwLEVhlnUiUYkmVBJL694o0w++4y936SyyttRj6IBnT2O7
 fYTFBoumOxSpOzAI0cDnYV2VKsu8+FkSzKRMTKdLEj/wUvmuvhyQbfKopFivvjgsWPf9
 JvgR/+k6+9xWjotlEIQkG6EvnantGcxj5clGTezaKvMNHnSZGTyqva4a44mh/cDaGcsJ
 PqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2lZGbCRWT1o/aFofNx6AhoO+aw7BhW/JA9MZQKTHd/A=;
 b=SA86BWUx87YZylREqhoe1hjwlc7E7baY9Uxt66oVZj6gJijPCRhxTkBmMQmsQn7DIs
 F+r31Gxk5rNhvqvr4TdxlUA94IN44wSM14x1HVsmFOyuiI3VYAKtmIbPZ9phqqQe8yDn
 3moGpOY7Jli8//FC1KNTRRDLXrz2CkOYyyJ0CpgwFcVBAbpvJW9QGxJGpTGKA+OpxCHm
 Uykj4BsxYXHXWwIUJpcEpSAMPJC5J+n3GSvgZPMrTF0zGIIG2o2EeJbxGaShXiblz048
 b1PN329SANh/U2NH+lqr8rWY6tTksMK2o9lkHPJZIMC6jhN+wRKpexSKN76gdQN2NyQg
 tZ9w==
X-Gm-Message-State: AOAM532KrfoM9wuPWU5vxxme3+2hJ8vVGb6o9/N8aBF1KgFoUF4kf5Oa
 +UtEVEfwcoRjI9jAigJWYok=
X-Google-Smtp-Source: ABdhPJwb+4C4QqoFxe2xD91wcP2Otm6U+nHmZkfFm+cVa1X13myEiC0QY82/QebeolbF5AVif/+lhQ==
X-Received: by 2002:a67:ae44:0:b0:33f:7baf:852c with SMTP id
 u4-20020a67ae44000000b0033f7baf852cmr15204678vsh.78.1654680420627; 
 Wed, 08 Jun 2022 02:27:00 -0700 (PDT)
Received: from [10.230.29.214] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 bi9-20020a056122188900b0035ca960eeacsm2679782vkb.5.2022.06.08.02.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 02:27:00 -0700 (PDT)
Message-ID: <cadecbfd-e174-eadb-276c-577bb2bf70f2@gmail.com>
Date: Wed, 8 Jun 2022 11:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 0/6] Raspberry PI 4 V3D enablement
Content-Language: en-US
To: Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 bcm-kernel-feedback-list@broadcom.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, javierm@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 maxime@cerno.tech, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20220603092610.1909675-1-pbrobinson@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220603092610.1909675-1-pbrobinson@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/3/2022 11:26 AM, Peter Robinson wrote:
> This is a follow up from my v4 patchset. The power management pieces have
> been split out to a separate independent set of patches by Stefan [1]. This
> version 5 of the DRM patches are independent and given the V3D driver has
> been upstream for some time the two patches to enable it in defconfigs can
> be taken at anytime independent of the enablement for the Raspberry Pi 4.
> 
> I've tested this using mesa 22.0.x and Wayland/Gnome on Fedora 36, it's
> more or less stable with basic testing.
> 
> Changes since v5:
> - Update the DT compatible to match the others that were updated
> - Adjust the Kconfig help text
> - Add review tags
> 
> Changes since v4:
> - Fixes for device tree and bindings
> - Split out the power management changes into an independent set
> - Rebase to 5.18
> - Individual changes in patches
> 
> [1] https://www.spinics.net/lists/arm-kernel/msg980342.html

I can take the last 3 patches through the Broadcom ARM SoC pull request, 
but the first three should probably go via the DRM tree unless you want 
me to merge them all?
-- 
Florian

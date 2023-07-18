Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD4E758E41
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98D310E405;
	Wed, 19 Jul 2023 07:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F82110E352
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 14:25:27 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1b8b4749013so45042775ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689690327; x=1692282327;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RecCA8vAFQXqohj5TOPR9rOC0edp+q0SVjbjIuPLS2c=;
 b=Gw2kPAo65Kv8O7eN2R3imSArpp3sl+zwXomh/gx/glI7B/aOOkZRdJYBo9niQUcWUs
 cxiLx/U1ALQC33BgIDYK5UpG9UV4Tcv1X/R5w5EFtphYvzbXh8QfuimjDQp5y1k5sx+x
 zJGn3juBl49+O+GoqubCevXG3mUHDriuufo3xQDGHvtelOtA4Kuf/rhnI2HmvpV/S8Lo
 BZ9RaiGs37K4zzLSc1dGFAHFXDIr21RKayxi5q68ielyUMVpcNXPNz5NUI5I2X2p8n/A
 Vb9eyqxtFG/0qO4N8sqKhlPGD+OciG51JX4xiUu/6OrWkPXr0Pej73u3HkfbBGRqBsm1
 N49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689690327; x=1692282327;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RecCA8vAFQXqohj5TOPR9rOC0edp+q0SVjbjIuPLS2c=;
 b=UZLVeCawc+zuanVHYYe7j33hg1aSwKhBnmHgH8qKzHb0gI0oO93qUJ4S2FhfmTb+hI
 4MdBnWNrB+WMK5WkBFjSvwgs0ivxunz/RQSXKKjyrhOLMGC8R9jNrkXN5QSeh5oS/Ui8
 CvBuAyj/J0/Sj9pbwBAPZB2CHUmVqAfRyJCMl1xNcNX3A6VFMERz3FskyFg+WRGmb1G2
 wGXHXZqBfMK5kZKB42KGTJTE33BgLqNbBFaBl0BUDvackXuy0GGCn2IBygvvWjbjVM0d
 IRrlRhwneqEtkIcK9aGgKeT2Ab4nMjKsfzwXb5ZC9GVxn/+JkrpTUdCz9jGdS4kVj2yb
 ehLA==
X-Gm-Message-State: ABy/qLaqO31nwQFiJZpl+zDp9clnlH/O/xYMVC9RR4lA7bb05ddJJQcw
 6oX9ODIhozRKn85MymGqanY=
X-Google-Smtp-Source: APBJJlGTNBTi10xRnLxTNvbAGliZrTe+7oB/h3WGBUx3s26ABAxe3uDi+qg37LchChzL4lbfZStnfg==
X-Received: by 2002:a17:902:ce81:b0:1b9:e23a:f761 with SMTP id
 f1-20020a170902ce8100b001b9e23af761mr18256106plg.63.1689690327104; 
 Tue, 18 Jul 2023 07:25:27 -0700 (PDT)
Received: from ?IPV6:2601:1c2:980:9ec0::2764? ([2601:1c2:980:9ec0::2764])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170902ba8a00b001b50cbc0b4fsm1952851pls.111.2023.07.18.07.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 07:25:26 -0700 (PDT)
Message-ID: <f52eb3fe-e141-5fc7-047f-185ff6e74735@gmail.com>
Date: Tue, 18 Jul 2023 07:25:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] TinyDRM display driver for Philips PCD8544 display
 controller
Content-Language: en-US
To: Viktar Simanenka <viteosen@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230718080727.323426-1-viteosen@gmail.com>
From: Randy Dunlap <rd.dunlab@gmail.com>
In-Reply-To: <20230718080727.323426-1-viteosen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 19 Jul 2023 07:01:14 +0000
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

On 7/18/23 01:07, Viktar Simanenka wrote:
> Support for common monochrome LCD displays based on PCD8544 (such as Nokia 5110/3310 LCD) SPI controlled displays.
> 
> Signed-off-by: Viktar Simanenka <viteosen@gmail.com>
> ---
>  .../bindings/display/philips,pcd8544.yaml     |  92 ++++
>  drivers/gpu/drm/tiny/Kconfig                  |  11 +
>  drivers/gpu/drm/tiny/pcd8544.c                | 506 ++++++++++++++++++
>  3 files changed, 609 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/philips,pcd8544.yaml
>  create mode 100644 drivers/gpu/drm/tiny/pcd8544.c


Why is there no change to the Makefile?

-- 
~Randy


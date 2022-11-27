Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412DB639AA4
	for <lists+dri-devel@lfdr.de>; Sun, 27 Nov 2022 13:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2A910E07E;
	Sun, 27 Nov 2022 12:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2402510E07E
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 12:52:57 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id e15so2415836ljl.7
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 04:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ss5EUFYPSLGMMtCcaAzc2NEgCFyiqQz6TqOrspmzT7k=;
 b=yRgWk2ZV1ZvWEkkGQ2sMm4idAV4jCqZTJZQZWul9VNq35/Jecpnaq6m+o/bBLof/KK
 B+n1vE5uih+kG4sLFEEi+Bt3+GeAM6gTFPlAmnWMXKF+d32BXBBJKJBqnhI8Rc519SoB
 Ote1mVtEkWMdz0xQkc5NmNpevAlj+hBvhLH9D1NabJnZr21UGhYwIoSxbIVFdVx1LXjr
 p60xa+1EcWNgvsikg9hVQnkQ/2q8m5OPQi0eDBHoyb8beuVZLeBmpxCCl7zHL5njZ5ka
 DcZ1NHXZL+Iawih3/XT5Nx4Ohdnp1HUJxD5Wye2/FSzvU004n873jje7koAuMLBXOYqj
 Mmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ss5EUFYPSLGMMtCcaAzc2NEgCFyiqQz6TqOrspmzT7k=;
 b=ZyOdPQqlaxfnwDBICoOjMrmHhV+zdVE8B4xjiU1IGpRWY43wLiYMfGXRt87TnD/lyU
 r/7rLo6ujcc8pID1OdFmJESkxomSRzSq7BW4hMM1Z1L6jBa7TFg7vtbSfMAjxTQ/6hI2
 87tY8J+Be+N3R1EGjLKIEnfO17HZYWPTxwfxtohQdbWxvTZCKZ6wW18srYVE1ZBEGa7J
 g6RDfDrabuFlgxmzOCCNvBYEV57SzNe9aIdh14/7DKq2B15IZI/fevFSz93BweuQC754
 T6XdCPB60J2sJDeEg879ILenjHe1vb6Pt4I0Kcuq46La6gV8K8STp8Prvg4DCOygzvgP
 MyoA==
X-Gm-Message-State: ANoB5pkngwRWnCzwe9DQD/JLLVebCni/fXvqkCAIKOSqIJn/Z17j2zBJ
 +pJ36g/sETlVWbdNDDBdITmpsw==
X-Google-Smtp-Source: AA0mqf4FJ/CyuhoSCfxd/ghP9L2qHeHhWw5y9hR1vY3+aLslf998u7GsJYanC/tq9NL8S+7j7DpLzA==
X-Received: by 2002:a05:651c:220a:b0:277:2428:3682 with SMTP id
 y10-20020a05651c220a00b0027724283682mr16171606ljq.291.1669553575358; 
 Sun, 27 Nov 2022 04:52:55 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a19c20e000000b004afd23cf7eesm1276073lfc.168.2022.11.27.04.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Nov 2022 04:52:54 -0800 (PST)
Message-ID: <0a5cd856-c819-b084-a0e8-e97d551dab88@linaro.org>
Date: Sun, 27 Nov 2022 13:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/4] dt-bindings: display: panel: mipi-dbi-spi: Add
 missing property
Content-Language: en-US
To: Affe null <affenull2345@gmail.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <43ccb0fb-119b-1afe-758b-e413729dd704@gmail.com>
 <81722eba-3910-2117-8b07-bb030ab754dd@gmail.com>
 <CACYkpDr204QaCEmfFfuVH_=CWxH6mRixeRoyv6QXav9T7YP-sQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACYkpDr204QaCEmfFfuVH_=CWxH6mRixeRoyv6QXav9T7YP-sQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2022 19:16, Affe null wrote:
> Sorry for the spam, unfortunately I can use neither git-send-email nor
> Mutt with GMail, so I had to use Thunderbird for sending the patches.

GMail does not have problem with git send-email or mutt (I was using it
a lot), so you need to fix your setup. Unfortunately some of the patches
are heavily corrupted.

Best regards,
Krzysztof


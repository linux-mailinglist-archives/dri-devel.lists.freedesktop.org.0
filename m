Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7280F765896
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E72910E5BF;
	Thu, 27 Jul 2023 16:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790A310E5BF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:24:59 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fbc77e76abso12053675e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690475098; x=1691079898;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9Dtb8/XWikrPjhh1ZH6jlcJvc4+s8I+X0vtKuEd4mMc=;
 b=akxN6PqS7K8KjKHHO4u8jzlPtXTSPnqPrDK4GrhDg/d1kWuMxW6wunjd0hoy0JTkiw
 PYSznbnThXx34aSaXUSyDdWuDuv3IcruuomCIWB0zIwGDb1rg+v1zfS4v4N5FvCDb/1d
 j/ShUUgf73BKW5aaO9Sktjna54v/Y/QjR6+j2xNB5na4tYsYOl5Zy1XPmi9m29k3h1b/
 sfOFTRnB5OIgoanLgCpZ0iujZyUwsn3pQxiCgF4qVgZ49O3ndsKl0UaptrkDpDsKuWGm
 0CTWkdM1ewgRCIU3g8/Q7DbdwIhC8veOpaXO51Z8yxYCd5efA3Rd888qq9/xUUj+jH14
 unwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690475098; x=1691079898;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Dtb8/XWikrPjhh1ZH6jlcJvc4+s8I+X0vtKuEd4mMc=;
 b=HpHXURVEgp//OBSJhZsEuLtxj97i0Jn6hQgmMJ4MY5ZXvSbgPfl7AiQq/DWePY8eLL
 I/zSd2+T7u7cdO9oe/yO0olyzkwFofIz6td00pVKdBr4Tu2xR538ZngS4RubM8YH9Hqo
 DdayHPu36HTftl7AnyxnB9ZjZ2yB82gUXlmZB2dJC6r4FJTWCXia7UaY29KZ3uWsr2pf
 weSt6ZvNCdLJa7SsvfQv7Fi1C6C+vPJvSLaPcY7rArdZRf+20HjgsrV8RHZjw2KIeV6Y
 RbJfFOUQUW9AQ5tBRRLs2AMklCzI++H9OJb1I6u/HpzK7JycnfulMQp/sk6lyrkkMh/4
 RKmQ==
X-Gm-Message-State: ABy/qLYDaIP/ujE9u7VzEv34nsNmTRKejHbf56k0I3G0bN7X/EXq7FQl
 nHtNQ0MEfcBHn3txxy/EAWU=
X-Google-Smtp-Source: APBJJlELdV2E51r0DbzX80QIKtgJQqds7CnqjhWhCRk68TR+/SG2Y3BxIAb/3ANSX/BU4owykrCV8Q==
X-Received: by 2002:a05:600c:2294:b0:3fb:9ef2:157 with SMTP id
 20-20020a05600c229400b003fb9ef20157mr2104746wmf.28.1690475097580; 
 Thu, 27 Jul 2023 09:24:57 -0700 (PDT)
Received: from [127.0.0.1] ([46.211.28.141]) by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b003fbb25da65bsm2188169wmj.30.2023.07.27.09.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 09:24:57 -0700 (PDT)
Date: Thu, 27 Jul 2023 19:24:56 +0300
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 0/2] Support bridge/connector by Tegra HDMI
User-Agent: K-9 Mail for Android
In-Reply-To: <ZMKIonuTnoXcuc95@orome>
References: <20230618085046.10081-1-clamor95@gmail.com>
 <ZMKIonuTnoXcuc95@orome>
Message-ID: <97EE0F0B-D1EE-43B1-A13E-510DB8FA2798@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



27 =D0=BB=D0=B8=D0=BF=D0=BD=D1=8F 2023 =D1=80=2E 18:09:22 GMT+03:00, Thier=
ry Reding <thierry=2Ereding@gmail=2Ecom> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=B2(-=D0=BB=D0=B0):
>On Sun, Jun 18, 2023 at 11:50:44AM +0300, Svyatoslav Ryhel wrote:
>> This patch adds support for the bridge/connector attached to the
>> HDMI output, allowing to model the hardware properly=2E It keeps
>> backwards compatibility with existing bindings and is required
>> by devices which have a simple or MHL bridge connected to HDMI
>> output like ASUS P1801-T or LG P880/P895 or HTC One X=2E
>>=20
>> Tested on ASUS Transformers which have no dedicated bridge but
>> have type d HDMI connector directly available=2E Tests went smoothly=2E
>
>If I understand correctly, we still need the drm/tegra patch to be
>applied before the DT change, otherwise the driver won't know what to do
>about the connector, right?
>
>That shouldn't be big problem, but it means that the patches need to be
>staged in correctly to avoid breaking things=2E

Patchset contains drm/tegra patch

>Thierry

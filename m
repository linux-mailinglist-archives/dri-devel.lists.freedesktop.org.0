Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E2963A2FF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 09:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278D810E2B3;
	Mon, 28 Nov 2022 08:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7465210E2B3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 08:29:44 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id n3so15516985wrp.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 00:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=IOpIkVTZ1HCSepxMCiPIVLc3Du6eeySPU1lvrDaAkA0=;
 b=iP2YYiwl9QvU5Fj9JzDa1Ner+PSjuXkcCMEmS9tW23BnczYppbVvnJU9HQsJRJDFNS
 HZGopcus13C3caspnBXrNSgkN7Ofp4VoMRbERqTmkFgkdmRtkTLT6WoY7RMoq/jRUGCv
 vLXOswkWlJEKu1Hyy0pOgM4fW9NcyhRx/KCsxN9lehS7MgaxFxnjENjvvO1kv/WI2S9d
 k+q36KaGkqU7wTycEHYnKklfdJNfqs5rXFwBvKF9R2aa+qcM7CxT+KZAjTHmr/sD9S25
 tE6J9yWHEhkDhFeHXd5X3qJCiBLzVZW2PI/+Ma07Rz8x6BR/OgIeJ1Hp4kPTGRy0NY0p
 0bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IOpIkVTZ1HCSepxMCiPIVLc3Du6eeySPU1lvrDaAkA0=;
 b=N7ivkiKDg5KXIZRqlSVXBRviRC2CnU9Ega1PRiRXrhrI7ebbNoU+VS0hXrZnI48R6H
 edxJXfvZyMz+W8JecBskisOjgZTEfHdiH51PwJgi5JkcBcWQaLVGmlM0J5DSpOz20pP1
 FR/HrI95w2RuZyssCt5QUZ49CwkiAEXzu7C3jFokiwdRYq4wwIesuZEHxwoE72fK8Aoq
 kVR2tfIesIpBaVlchZ55UDoG64sakuLt3XdjpPOOziIWDKz7NDpasfgLRnkktd+WrpyY
 DpcgRyhqhjfrHf6IXb9yb1Ecu+PcX4X3H93xBW4XzRKc/RygqPPdhbFXlXxCw8zrgVKM
 XoPw==
X-Gm-Message-State: ANoB5pkyrxZhjglJV9QbuyogOFBT6tvTkPJgXp7B9iB0jdJ6WudvmJwX
 TAvBugMDLDTu88MjS6H0p/k=
X-Google-Smtp-Source: AA0mqf5o3omyFNxLGgAAlS7h9m5pGaApcXCeWfag+9dMe/kyf/xcUF+n/HOzhL9shN+Mov9HNNGpdg==
X-Received: by 2002:adf:d0c2:0:b0:242:a37:7abf with SMTP id
 z2-20020adfd0c2000000b002420a377abfmr7101743wrh.190.1669624182677; 
 Mon, 28 Nov 2022 00:29:42 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:78ad:176c:d7ef:5797?
 ([2a0e:41a:894f:0:78ad:176c:d7ef:5797])
 by smtp.gmail.com with ESMTPSA id
 i17-20020adfe491000000b0022da3977ec5sm10020436wrm.113.2022.11.28.00.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 00:29:42 -0800 (PST)
From: Carlo Caione <carlo@caione.org>
X-Google-Original-From: Carlo Caione <ccaione@baylibre.com>
Message-ID: <a896ab20-6a08-fc41-ff2b-250ef477d801@baylibre.com>
Date: Mon, 28 Nov 2022 09:29:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 0/2] Make ILI9486 driver working with 16-bits SPI
 controllers
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/11/2022 10:42, Carlo Caione wrote:
> This patchset is trying to fix problems seen on S905X boards when interfacing
> with an ILI9486 equipped SPI panel.

Gentle ping on this 2-patch set.

Cheers,

--
Carlo Caione


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF146DAFDC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 17:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76B710EDF8;
	Fri,  7 Apr 2023 15:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3E510EDF8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 15:47:21 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id bx42so15822294oib.6
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 08:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680882439; x=1683474439;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=qB2M0BoOW9oaDa+VZga2Sa+0CVpbvNAMFJ6jBr8adc4=;
 b=W9vuUYRI92ldZRHzq2CMZKG5ZLeulX1EFpCXq2jVtrk7gb8aed3kzeM6l9/9xBKKoG
 3ZempnAh9kt6a5zjPFU0VqympiQCEQwprHwGPEL/jhzVSLiEd/USo49RfBUQvTs59sgJ
 BPq1d0xXBJcEBxH+FIfpQwJInS+ZmAUdU2+VQBIKjpfT44ZOJqNG0cAjEhyOdydmotsc
 VzmWEMD9ysXraekT6BPp5NFsTI/dbX8jM4/E7O+h37gPn2RJ7BT9nqa/hg6Vk1c8AagF
 5ma5njPBTlwOFShFIVFXCmgTPPqFG5pyE3/RK2wKHG2ekZKyPhVXFMy88621KGrZ+BZG
 O6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680882439; x=1683474439;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qB2M0BoOW9oaDa+VZga2Sa+0CVpbvNAMFJ6jBr8adc4=;
 b=u59PV59mYHAq3auiS911js6wc92MSWGWBHQp+OyzePcDimSBdwIXHYBlCjsJblhoyU
 DvUyd7lYtQ6gk9XgvUNKcUOOz9msT/B9VjFB6z1qavwMj0BLlezeloVWcMFesW5XSQsA
 Oxa1WHt5PrqDsYeWVcGk1DChk7KjCAP6y7/B1Czy5YRdHYywt+t3IRfN2qgpF9j+S1Kj
 O3BfbVbxTBt/OjtkSGEEAeta2M1gO77SzjfcbIxAEOmFvTeRD6A1g7t/Nxq9PiPZXYW0
 ZRDVU7xv/RvtDq36RzyzAt0d7xdBfhnKWwuHaHwzXFlG4LrL3UxAPVQkR1jKsvsr4NBj
 UR4w==
X-Gm-Message-State: AAQBX9dvUH/RT+5WqKqSZMoYzLDHkAqjSmbtuqKFSzBRVCknSnk0ktKo
 0AfJP3IuTWFyLMdApncVrkY=
X-Google-Smtp-Source: AKy350YRF1944XUhqK/zTgNLfplv2fuVJn1EoSRBMg7fIxIGXzJQxyVmCTTaZMkiFwyAd7YAHs4E7A==
X-Received: by 2002:aca:a84e:0:b0:38b:7eab:a482 with SMTP id
 r75-20020acaa84e000000b0038b7eaba482mr1145836oie.58.1680882439549; 
 Fri, 07 Apr 2023 08:47:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a05680809a300b00389509965e3sm1770396oig.58.2023.04.07.08.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:47:19 -0700 (PDT)
Date: Fri, 7 Apr 2023 08:47:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 01/68] hwmon: constify pointers to hwmon_channel_info
Message-ID: <4127ea84-4217-4ae0-b88d-14e7ab5c6eff@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Eric Tremblay <etremblay@distech-controls.com>, Tom Rix <trix@redhat.com>,
 Jean-Marie Verdun <verdun@hpe.com>, Clemens Ladisch <clemens@ladisch.de>,
 dri-devel@lists.freedesktop.org, Tali Perry <tali.perry1@gmail.com>,
 Rudolf Marek <r.marek@assembler.cz>,
 Aleksandr Mezin <mezin.alexander@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Luka Perkov <luka.perkov@sartura.hr>,
 Benjamin Fair <benjaminfair@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, linux-doc@vger.kernel.org,
 Jonas Malaco <jonas@protocubo.io>,
 Derek John Clark <derekjohn.clark@gmail.com>, UNGLinuxDriver@microchip.com,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Aleksa Savic <savicaleksa83@gmail.com>,
 Jean Delvare <jdelvare@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, openbmc@lists.ozlabs.org,
 Robert Marko <robert.marko@sartura.hr>,
 =?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Agathe Porte <agathe.porte@nokia.com>, linux-rpi-kernel@lists.infradead.org,
 Nick Hawkins <nick.hawkins@hpe.com>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, linux-hwmon@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Oded Gabbay <ogabbay@kernel.org>,
 Iwona Winiarska <iwona.winiarska@intel.com>, linux-kernel@vger.kernel.org,
 Jack Doan <me@jackdoan.com>, Michael Walle <michael@walle.cc>,
 Marius Zachmann <mail@mariuszachmann.de>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, patches@opensource.cirrus.com,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 10:29:56PM +0200, Krzysztof Kozlowski wrote:
> HWmon core receives an array of pointers to hwmon_channel_info and it
> does not modify it, thus it can be array of const pointers for safety.
> This allows drivers to make them also const.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Series applied.

Next time please let me know the base for your patch series.
It took me a while to figure out that it is based on linux-next.

Guenter

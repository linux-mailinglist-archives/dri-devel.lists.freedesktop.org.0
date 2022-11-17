Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B00B62EA5C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 01:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2658410E6CD;
	Fri, 18 Nov 2022 00:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3C510E5FE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 14:05:37 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id m22so5226967eji.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 06:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=u6c8fBhfPadc8cu0krt5hkpFlG+n4LiTHELzXtnJeR0=;
 b=kRWk6QWNDibLsq2IbAq4If83VQOALIw5xVilUxzS34YjdBCn7F+w2xkgVRLq4DO8+a
 gl/cLqQwm82EwHWDNLqBb9Cb7Zjp2+vupdMC1ZTlnWkihuQvDxEJKOy4eZ/cOyxNeyKD
 +9UXTCAtdAmLJqFMDSJnuBPI0b0xWVcZgHHirImwxGi/qjI0KePyp0M0haL1sXq0foNI
 w9Sa7cxtJUcHNMDDEz9Qeh9mJSzl41jSdavSrS0/5TwFXa5fup2kLpgjuWLykR+bMlNF
 AsqAAbdc814rG+tIBgkci99DXVfF5Xp0yEDnMptkcAxJ2eUbN8CZBufVcpCzNahfjvV5
 2tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u6c8fBhfPadc8cu0krt5hkpFlG+n4LiTHELzXtnJeR0=;
 b=vaVGY9kPpPiRMXMt6vKiUGCmfQXCF6g8jCHJ2s4Q+YFhT4Yco8k5QtvLjEsc17n2VH
 uLGf7kSldw7JxvUtL72dJgUSAGVOsqtWVLMAbtNzTRg7WAzujRCnw7InZUMvEt6Kk7KE
 Jz1SjTuQwDAIrYOSJTW/cgCn7eGsOM8KTIc7lCNh+Dt9QqdvJiRdAph7p2JnjQ77qA8f
 Dv336PsUJQlsailmsyUan4/wx32wDi1+UDUrfZgjDcB6ayqgQJ/oCPw08vnSm1sl8ksJ
 J7dqaFILgOa6kQw+AY0O9SXtaVRdCr7SN7556vjBDDsjAnrd94h5HU9dEXDp061K7E38
 rtrg==
X-Gm-Message-State: ANoB5plKYRwnZVfx3aGqSc4MTq72vyzWY25ioXRQZR/fswc5Y+ooEWMb
 7MUKAwnYQFjZrRmUcSovF3s=
X-Google-Smtp-Source: AA0mqf5eoLeMemC/Xj2W2AaH0lSZZn6rPS8GtVUMR7f1tz2ZshG8CzKSuB65mlB+x22wpyvJ69fmMA==
X-Received: by 2002:a17:906:698f:b0:78d:93b1:b3ba with SMTP id
 i15-20020a170906698f00b0078d93b1b3bamr2348324ejr.66.1668693936035; 
 Thu, 17 Nov 2022 06:05:36 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:7a60:27eb:954c:5ab1?
 ([2a0e:41a:894f:0:7a60:27eb:954c:5ab1])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a170906125500b007a7f9b6318asm415839eja.50.2022.11.17.06.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 06:05:35 -0800 (PST)
From: Carlo Caione <carlo@caione.org>
X-Google-Original-From: Carlo Caione <ccaione@baylibre.com>
Message-ID: <3bfffc60-a4d3-ddc2-7811-f0fbec22ba65@baylibre.com>
Date: Thu, 17 Nov 2022 15:05:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] spi: meson-spicc: Lower CS between bursts
Content-Language: en-US
To: neil.armstrong@linaro.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-3-630401cb62d5@baylibre.com>
 <098b923b-ff46-5ef5-9c21-19c974c9274f@linaro.org>
In-Reply-To: <098b923b-ff46-5ef5-9c21-19c974c9274f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 18 Nov 2022 00:32:52 +0000
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
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/11/2022 09:54, Neil Armstrong wrote:

> I'm afraid this will actually break SPI NORs for example where CS 
> actually splits transactions.
> 
> Isn't Amjad change enough ? The CLK pull-up should avoid this.

It looks like it is not enough unfortunately.

> If it's not the case, then it's an HW issue and the CLK line pull-up 
> is too weak and an external pull should then be added.
	
Alright, I'll drop this patch in the next respin if needed.

Thanks,

--
Carlo Caione

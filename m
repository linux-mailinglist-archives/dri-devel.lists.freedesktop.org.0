Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9645555B812
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 09:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DF510FD7F;
	Mon, 27 Jun 2022 07:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36BD10FD7F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 07:01:00 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 i67-20020a1c3b46000000b003a03567d5e9so5236072wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 00:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JQ6BJkIBB0iuDWSouR0v+Ao2Lgbe3w3R+14xG93o9xk=;
 b=2AWfMwMcTegs4b4opzBhY/wwU3S/mkbyFO3l+vsapib2LNgKheHE6IppogNvVtk5uP
 UlRY3k27QNO9mipLmBaqh6+12cRTCRxvUc6+Wfkb4aWceHfMVRKuv7amS0eNwSLJbAS2
 AUOLOpig137iD7NSOLfT0WBxA2FXBDx3Nrl7iqbRCXzBPXg8ZfDAOYAL7RwbymvSBTMq
 TS9+mAdBfsJBGrBIiR1+H00qKcc9vA+4HYRYvZcEHvj+0VW5JVi5k5p+N7Xxb1QZY8SI
 MhJ6OYcf0c6Zun9pri+O+LnyadlbsBSUez3Qjl176C2JQHVySFCOTJCb0faG6sLxIyct
 U90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JQ6BJkIBB0iuDWSouR0v+Ao2Lgbe3w3R+14xG93o9xk=;
 b=OnsHyS8fiYauuPXjkBnAw5r7dWkX+4xor1ariI9FMzbu2VHI9fhLMSqojUPZdQCObs
 r8k3+xzjIn8rxHWQERheBLQMNAZk5xvr8PyvhzCD8A/oGY7dapwqrOlv7sAsPbATBdWN
 wVaXQujHfD9xRq8UbycXD3j1LFtUVaUP0A5lqO7uUyBpewgL5doxbo2m0fff/MvI57vb
 0zGRU7Yn+Wqe4xkg1/cWYKMZP/CzV6JcFDNBFyebmKmSA+3rW96X0Ol26Fd0zXZyc5Vd
 Q5H3ZmpA4zOndYdKlWfWAMS/pPHsTfOq6GcmB5U7gJQht7SuJfsbIZmb2iIKIVVORVYY
 ic7g==
X-Gm-Message-State: AJIora9tphdzjhvkjMeXwmBsqY7cGmP6kwxEzQhJgTJShj057uOPvAfB
 GnJxJC0mbI2SOCb2q2bMdbP5fQ==
X-Google-Smtp-Source: AGRyM1tsboWv7CmBuSib/MKQWOTP7R/cF8DQ1rA0QOY3EnXdzt4uRTN9+gNDfqLJF0pteDC8B0fi8g==
X-Received: by 2002:a05:600c:1d85:b0:3a0:3d28:bdd9 with SMTP id
 p5-20020a05600c1d8500b003a03d28bdd9mr13908668wms.114.1656313259081; 
 Mon, 27 Jun 2022 00:00:59 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c?
 ([2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c35cf00b003a0375c4f73sm11304434wmq.44.2022.06.27.00.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 00:00:58 -0700 (PDT)
Message-ID: <9cdf2ca0-4f86-09b0-8834-c0c39eb70054@baylibre.com>
Date: Mon, 27 Jun 2022 09:01:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 6/6] drm/meson: add support for MIPI-DSI transceiver
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220617072723.1742668-1-narmstrong@baylibre.com>
 <20220617072723.1742668-7-narmstrong@baylibre.com>
 <CAFBinCB=RJeaqVi+d6gGAsQTWAU68iFF6T9bXAQVYUWKxgiYaw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAFBinCB=RJeaqVi+d6gGAsQTWAU68iFF6T9bXAQVYUWKxgiYaw@mail.gmail.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 27/06/2022 00:32, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Fri, Jun 17, 2022 at 9:27 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>> +/* [31:16] RW intr_stat/clr. Default 0.
>> + *             For each bit, read as this interrupt level status,
>> + *             write 1 to clear.
> Do you know if an interrupt line from GIC is routed to the MIPI-DSI
> transceiver? If so, we should make it mandatory in patch #1 of this
> series (dt-bindings patch), even though it's not in use by the driver
> at the moment.

Probably yes, let me check

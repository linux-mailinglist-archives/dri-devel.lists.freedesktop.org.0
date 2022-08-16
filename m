Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025975A00B4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166B7A6D1B;
	Wed, 24 Aug 2022 17:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AF110EFBE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 10:55:43 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id x25so10136826ljm.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=CBKTj5rqOn3nvVZvcReemvDBMrFOZ0r/iVEgRvVlj7w=;
 b=Svwnc6Ps2mgT9rljkrmJhSM3ngCsPTTHBKJzpTazCrTqpdidG8FwIHPuGIgyAoVs8a
 HQf+fS7Z8nY+INAGOTIma8iZTmjlJQI6M1kimeObK88koD6bClhAhI3AA+jdy7lAUVjG
 /UzHgVuP1lc+egFn6Tj6VjKaIDM85G1ccfHfakvvt7QDc20ARPnoV91A8nTk8SlcKdvY
 q+1uL/sXiTezwoEdVtr3ENmibRF/kVtU5AHCoz5bvmo2xDCz4H3WhJKBOvFhwIoRt/L9
 ewgVblpBi4+u/eSvyR0Mf1rDOoUV8sYQQfyh00MJD3Ps1jU/IwqksR70UzMOkYqSWLzA
 FoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=CBKTj5rqOn3nvVZvcReemvDBMrFOZ0r/iVEgRvVlj7w=;
 b=1LoK8MUEClEHrSPrszjV5TqVGlUq+NnzSVNc6W4FfAjNUvfQ1mBtLvyqgTG6oRnP7z
 Fxb3L6M3sCckhBMIBEw9RG1ZpfM9ZImW4AJdvGIQLGQMveIImjmHlUvzZ+vou+VhlOng
 jnwfdjCiW75BH6GGyh5jgZ6v9hhAYxSK5dIOygaEDjhxx5uuhKqLe5MjIX2jsRqDJEmz
 7NfvT5LPasuG76O7xbrqQ/dDMmeMBGHPPYbsJaJaRn3UcpCfbH1CEGVe9iOSVKDL1sYj
 fDAg3WP5nXGi482jxJLy69rbmpla02pdDmG9CNLVntin/tiGtnoR5wJiAQnfeuDyyoB9
 TugA==
X-Gm-Message-State: ACgBeo3FXlR1dnWYcXA9Edt++2zpGEoyjKd7mXg5ASxAav8/N3B5Xb9Y
 nZcgDprk7PKkLKVg7fI+Jkl5yA==
X-Google-Smtp-Source: AA6agR7vC+j/ek79i+GD6KzISBYbeOBbqXj7aSllLfYBky7D81Wi0pnmae4dvqzohY1PwIPgyMwKyA==
X-Received: by 2002:a2e:a410:0:b0:25e:4bca:6287 with SMTP id
 p16-20020a2ea410000000b0025e4bca6287mr6589533ljn.31.1660647341625; 
 Tue, 16 Aug 2022 03:55:41 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4?
 (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
 by smtp.gmail.com with ESMTPSA id
 s27-20020a056512203b00b0048b4690c78esm1345283lfs.288.2022.08.16.03.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 03:55:40 -0700 (PDT)
Message-ID: <a9c71f3b-0c7b-ee8f-d350-0ab453018558@linaro.org>
Date: Tue, 16 Aug 2022 13:55:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH 01/14] drm/qaic: Add documentation for AIC100
 accelerator driver
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, airlied@linux.ie, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
References: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
 <1660588956-24027-2-git-send-email-quic_jhugo@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1660588956-24027-2-git-send-email-quic_jhugo@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/08/2022 21:42, Jeffrey Hugo wrote:
> Add documentation covering both the QAIC driver, and the device that it
> drives.

Thank you for your patch. There is something to discuss/improve.


> 
> Change-Id: Iee519cc0a276249c4e8684507d27ae2c33e29aeb

You need to drop all such non-standard tags. Please run
scripts/checkpatch and fix all the warnings.

Best regards,
Krzysztof

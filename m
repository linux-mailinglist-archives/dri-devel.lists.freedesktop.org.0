Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738FB780A35
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 12:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B855F10E4C4;
	Fri, 18 Aug 2023 10:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A6710E4C4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 10:33:43 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99df431d4bfso90846866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 03:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692354822; x=1692959622;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V6EQXmWlbAP8xGzA5SqpcYw1xup/7LEAqhVr+3MCg0w=;
 b=GB07Z6G/G0+fjW+eJK9+aXtCaNKh1tmDFClnHoQGt90vR72x+qxWrZ+8LYKyIbiBlJ
 /FC/3aFNqETNRfIQqA/VEKo2HZyp8fh5QXSgehRZIrOiQy8dqJGjNPVDV3loRkPWc8WD
 yCVDlKK4anE56FymK6EesEs4UQ7cGpPbCOIfvS4UBmXCHrSA+DrHvNGOltGk/gxAQ44u
 mv8c3d5Io2cuNQV8Jht7D5q8lSALmsqzUykwckx7lsLnw3N0ICJQ3gqtkUezytwqaCka
 +c43beXWL3ZxH9ahcT2WflY6AIVBvpEEGrHgksDFRpeH1xOpNy7Mx8ewllDL3OSGo7/Q
 qB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692354822; x=1692959622;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V6EQXmWlbAP8xGzA5SqpcYw1xup/7LEAqhVr+3MCg0w=;
 b=U2uidi3E8WX0/5vwFjLacEGXPILgXhWhk/kYyzE6ySQke3jTMQRb6MPbtyC3K7B/Ps
 TMrtguO+mRKvvOZeR5XBSgChwiYTzA9YQeqGRcag6Um8LnJfHG6OZ+wdX20MCfh+XkQ6
 oorcqu4TRid+IgZjOkC4vWL6LDA+Xaa4JhRscw+BQEX13MwCsq8/Vi7vrl4bG19NuDoR
 vGMpZJzP4dnL9jZkXZ8hS+xZcTkmnDBUrRJg/pr9FFmMQ84eOlFNUDiB0im2mnHVgHVl
 bPSHNUDTan+NJpAmP1F018lkk+2seSgvGnYrBZRCjfNMssUVn9Dp7++Z+YaINYwrZhWR
 zN9Q==
X-Gm-Message-State: AOJu0YygfdFBhUPIXB95Sgaa7a0XkiV3Ylm+DihYBwLMnuw0rDa2OEJX
 c5HrTe+H0Gg/QwPxsOBX5XM75Q==
X-Google-Smtp-Source: AGHT+IG63pVTdWE6Rqr+M8TcAltplCPu5q2+b9QCNW4PgQwhl1RSBnJMIcWD2yodknH0su3SWujtRw==
X-Received: by 2002:a17:907:60c7:b0:99c:440b:a46a with SMTP id
 hv7-20020a17090760c700b0099c440ba46amr1386439ejc.1.1692354821787; 
 Fri, 18 Aug 2023 03:33:41 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a1709061c9100b0099b5a71b0bfsm1028327ejh.94.2023.08.18.03.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 03:33:41 -0700 (PDT)
Message-ID: <a3b74f31-905d-8b57-5e38-7f1efe37f554@linaro.org>
Date: Fri, 18 Aug 2023 12:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Sarah Walker <sarah.walker@imgtec.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <20230816082531.164695-3-sarah.walker@imgtec.com>
 <CACRpkda-XnS-DQE-5WXnTFdycwVnJwffhhR=V27gp8vnxkHTrA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkda-XnS-DQE-5WXnTFdycwVnJwffhhR=V27gp8vnxkHTrA@mail.gmail.com>
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
Cc: matthew.brost@intel.com, hns@goldelico.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, afd@ti.com, luben.tuikov@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/08/2023 11:36, Linus Walleij wrote:
> Hi Sarah,
> 
> thanks for your patch!
> 
> Patches adding device tree bindings need to be CC:ed to
> devicetree@vger.kernel.org
> and the DT binding maintainers, I have added it for now.
> 

This won't help, I think. Patch will not be tested.

I was already asking for using get_maintainers in the past... sigh...

Best regards,
Krzysztof


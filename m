Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6001A6EAEFF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 18:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9CB10E195;
	Fri, 21 Apr 2023 16:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B11410E195
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 16:26:55 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so314368466b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682094413; x=1684686413;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vIEVML4IO5anh889+aalXEgSW3X6EwyG+xKSv5s4BBU=;
 b=vNf7B7OMSpTvkt/QhbB/PsdtgWBg1pW9dMi93H7w5lWvBEWhimVzdKHM56ubv9YdOi
 MhSrry6TwNkGNklCPZ61WR+7zLhsd1Cp/go24HmMDtFzKEaH0KV3bPz+YzXwGXo3NdFa
 AZqalVa8nxwpxvHRp77seyGRegReWeSrY7c+XCBK741gPSfK13cdMNmKo65eIZSU4jCj
 irpenpQa2kKEPFolx2roZEow6EovgxA3f+ypHKWdATTLEmonSrskN/EDE0xdJ3gSoUol
 QfjO3WbZ6W1HG4z7biEvEPaZ4rGDWbPI3rvS2yfP9tiTxb3SYT5RsEk1ClZTElkIxVu2
 ikHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682094413; x=1684686413;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vIEVML4IO5anh889+aalXEgSW3X6EwyG+xKSv5s4BBU=;
 b=XXLAJvj1+0DeSOlYVNjN/7xpU2AdwvasZpJKN4mij0GYDf3ZDGsim3JP81CTfbTJFA
 QEH4pV+IQ5JYS2cnIuLi7CWg/ENDLE0sx+KFd65IrhpV8B3qcGweCmpemPUxCIUrW6EW
 bp/5mpWn0mND1SSBmQodGCb5e3viYHME0WdhaKDG1ZeAnfTviJIW06ZlR7JeuigmqBUd
 WAV2zA3V0E2evt//7XlHuGN8Mrrwub89xh1XhEDWlPlgJFo9esjuIRp5AO24oBxkQDXp
 MXEwjyN2cUAvynrxmA4ey8dXr2jElRFPddy1wKFIXk7yQ3Ce//gpMWiKoJ3j6HZ9HDRM
 Aeiw==
X-Gm-Message-State: AAQBX9e+KV2FpECFPmVuZDtfJY4RDsXVm0d7LNCENIRsC7Ouo/cy/wYT
 nt5A0FTXWNZz1+X4Uv4tWXxTwQ==
X-Google-Smtp-Source: AKy350ZlepiYHICnCvkKxXgRvs5qFi+tujr0SqeW/avud6pnNBIJ6AakgyIPJCcworE7G0FK8U1oBA==
X-Received: by 2002:a17:906:194d:b0:94e:c938:1987 with SMTP id
 b13-20020a170906194d00b0094ec9381987mr2928538eje.7.1682094413624; 
 Fri, 21 Apr 2023 09:26:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883?
 ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
 by smtp.gmail.com with ESMTPSA id
 gn5-20020a1709070d0500b0094f29a53129sm2190915ejc.205.2023.04.21.09.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:26:53 -0700 (PDT)
Message-ID: <fb93e95f-181f-917d-9216-a81dec1a2959@linaro.org>
Date: Fri, 21 Apr 2023 18:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v2 1/2] dt-bindings: display: simple: add support
 for InnoLux G070ACE-L01
To: Doug Anderson <dianders@chromium.org>, richard.leitner@linux.dev
References: <20230201-innolux-g070ace-v2-0-2371e251dd40@skidata.com>
 <20230201-innolux-g070ace-v2-1-2371e251dd40@skidata.com>
 <CAD=FV=XJCtqep+92h3gLfs4o2TwvL4MORjc9ydTSpZiZ0dsR0w@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=XJCtqep+92h3gLfs4o2TwvL4MORjc9ydTSpZiZ0dsR0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 18:15, Doug Anderson wrote:
> Hi,
> 
> On Mon, Mar 13, 2023 at 12:51 AM <richard.leitner@linux.dev> wrote:
>>
>> From: Richard Leitner <richard.leitner@skidata.com>
>>
>> Add Innolux G070ACE-L01 7" WVGA (800x480) TFT LCD panel compatible
>> string.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> 
> nit: as I understand it, ordering of tags is usually supposed to be
> chronological. You signed off on this patch before Krzysztof acked it,
> so the SoB should be above. I'll fix that when applying.

Some people agree with this... but b4 disagrees, so I would say the
tools should implement the right process and right decisions. We should
not be correcting the tools' output, unless the tools are not correct -
then fix the tools.



Best regards,
Krzysztof


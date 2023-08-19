Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A50781999
	for <lists+dri-devel@lfdr.de>; Sat, 19 Aug 2023 14:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351DC10E110;
	Sat, 19 Aug 2023 12:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE6210E110
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 12:51:57 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ffa94a7a47so1452323e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692449515; x=1693054315;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/nauYnXDm92Wk/8xh+HfUpmV7pJLWSptdaV1nMXTUtM=;
 b=ZxdWyNY1ioE6olKzzf0xknirLXka0bMJNbcMnUJCrje3X2+oK4RPLWUSNY/+Km6I3F
 v2Q1CnK/Nv2Kbdm/Ob5DhRh5m4RTtWJp4E+suS/qEkldeZUffmsaYbRFPbUIqbKMjGge
 kS/8ofLI7bi5hcNtgTXBlOjiWjE0ml4rE7JfFyvp6wMK2o4DYd1pACgZf9Z72wV/HOtf
 K7Kg4Ih1YlpIiNseWplRPLzvOuDzZ4/v38RZgWppc1+bb8q1qvsZ9mv1xXYBJCJWMSQn
 CP/kKjUxOJxr3OOTl5AbOAdMWp3cY8ecdhZDCSovhSDHJX2knRGaoH+IQCnp586BfUMh
 Juig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692449515; x=1693054315;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/nauYnXDm92Wk/8xh+HfUpmV7pJLWSptdaV1nMXTUtM=;
 b=OYRBrcBB1alsolb7Kktxw7z3/B/rJeQw4S8iJvQLj6odWADUU7MRos30rW6lO+IZFh
 5tddmU68669ZPpHFhCwd1hlzT1xDJ2EY3G68b1zYLv5GFKHYzxFYxkHv8ebZHuYOEIFF
 ljwemgGOd9PjO0WTGdLdHW9/i/ev5UF5p20RzYsi5/pjDXWAFHQpCWhuCpJtQfeGB9Q8
 U4mEN7NcuLsLTJ4K+svwrPlUEUTIODhLInaqdfNwhCkfAY2qST/2HB85h9KPSZItpvwa
 5+xH2mxKOJ6Vh4QeRjhOvSzJJwdCChyhVHChAaM4F6zHpQw2T3FQZeF1g4yFn/x3XbJ2
 EeHw==
X-Gm-Message-State: AOJu0YzpgzfFvXflJm4GxKtDRjRU7M6x8igqFuHdfHMc+2nV0OlcPv9I
 0DjGY3HUxsQHKOGlvvZ7ia7RGw==
X-Google-Smtp-Source: AGHT+IHGYkGAGQbuidgr8BddnCfOf+7iMfBc4p8yzRZw8ipG1/9UYUiG8Cbsm+iCJqVulZBcHQn8+g==
X-Received: by 2002:a05:6512:3d1a:b0:4fe:18be:ef37 with SMTP id
 d26-20020a0565123d1a00b004fe18beef37mr1710065lfv.61.1692449515336; 
 Sat, 19 Aug 2023 05:51:55 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a50fe91000000b0052228721f84sm2464003edt.77.2023.08.19.05.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Aug 2023 05:51:54 -0700 (PDT)
Message-ID: <ba07e9b6-ca69-8837-896b-26982facd510@linaro.org>
Date: Sat, 19 Aug 2023 14:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display: ti: Add support for am62a7
 dss
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230818142124.8561-1-a-bhatia1@ti.com>
 <20230818142124.8561-2-a-bhatia1@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230818142124.8561-2-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/08/2023 16:21, Aradhya Bhatia wrote:
> The DSS controller on TI's AM62A7 SoC is an update from that on TI's
> AM625 SoC. Like the DSS in AM625, the DSS in this SoC has 2 video
> pipelines, but unlike the former, the latter only has one output port on
> VP2 to service DPI display sinks.
> 
> Add the new controller's compatible.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


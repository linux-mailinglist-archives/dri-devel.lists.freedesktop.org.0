Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8492876AB13
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 10:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25C710E360;
	Tue,  1 Aug 2023 08:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479BA10E35A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 08:29:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31792ac0fefso2480799f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 01:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690878546; x=1691483346;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WYnO7NVMy8vqqJmXyvQjN5oh85upVgzswILIEEvIPpE=;
 b=qud6mcLvrfFoikZUF+e1cv21pLDKc8kBb5xguY02S0VygDJ5zlCGjkC52azrokEer9
 ejTTGNB92YqDn21JvKkCYrPTSy1dfpjhHzD07aNLiYQhYvwj1mJDu3pRMTewgfMy9mla
 PbKY9DEG29Xq9fIYEnBYZeyf8A+Kn60wTriSqDf+Qt52QZWh94Mtad7aF+ULIjTkvofB
 XkTv6i0sd3hMH39B8YXoW2HP4qPoKE/pMbTxitH2LX7/0xoPcZ1lsDvrrdbVleDzPVJq
 87B6pYL6oX27ilIUvIb5MtSynbHPmupYmp7+ZZ0qd8COUxtcrYuyTdVuB3Zz6vK9SJqK
 WmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690878546; x=1691483346;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WYnO7NVMy8vqqJmXyvQjN5oh85upVgzswILIEEvIPpE=;
 b=IdFaT6OMDLkKMSPGnL4Hhi0qw9EepgVvL6RwDii4uOBNajFFcB/a3LVWfjC09D3VEs
 sFrUoorRUMs7EFDAeyP4BfFOYXF1IYdMnLZoYzdr1GmvNkC5bYNbucDqLoUCzl++4ldG
 2VFJxfJ1vSpZphtvTGAaIlPdHB6Swhv+yL7FD+z1cGmHeT8EUAR310RQ6+VodiLdoIP6
 wfcn2Qsy+vLUiQE6JSELiUTjCcMuQD2hCm/rHc3A+PiuS34Kjc0oPcBFQXwf1p1panoB
 /uJYXp1yBFCcLVyvQPS+AJ7maw1AQhbTucBFe/EqcbsjUuImLCyvshzi8uf3IH3/Dlpj
 mzNQ==
X-Gm-Message-State: ABy/qLZTiUkuvXIHF5l7CFKiQw6VD6QhN/iNvqD7hKbYF7GKUbL5yEZc
 fKXh+7WQHIK96B5+ahn2wqucUUHdFEb3xfEtztTQjp3h
X-Google-Smtp-Source: APBJJlF/4I/WyfBJVB/DDb3Wz3jJtaa+sswo9qQQQ2pIhGNnbmDCJTqHdmejcIsPkPETCm+T8Y71kA==
X-Received: by 2002:adf:ea4b:0:b0:317:5a71:9231 with SMTP id
 j11-20020adfea4b000000b003175a719231mr1603178wrn.51.1690878545706; 
 Tue, 01 Aug 2023 01:29:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3?
 ([2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d6212000000b003143c6e09ccsm15511591wru.16.2023.08.01.01.29.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 01:29:05 -0700 (PDT)
Message-ID: <72163283-198e-05a9-c7e9-22b250738010@linaro.org>
Date: Tue, 1 Aug 2023 10:29:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 00/19] Sitronix ST7789V improvements
Content-Language: en-US
To: Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org
References: <20230714013756.1546769-1-sre@kernel.org>
 <20230731220336.zfpiofvhzgjycr4d@mercury.elektranox.org>
Organization: Linaro Developer Services
In-Reply-To: <20230731220336.zfpiofvhzgjycr4d@mercury.elektranox.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

On 01/08/2023 00:03, Sebastian Reichel wrote:
> Hi,
> 
> Each patch in the series has at least one Reviewed-by tag and the DT
> binding changes have an Acked-by from at least one of the DT binding
> maintainers. It has been pending on the mailing list for two weeks
> now, so can it be applied?
> 
> P.S.: Looks like I missed Neil in the original recipients list.
> Sorry about that. If you are not subscribed to dri-devel and need
> the full thread it's available here:

Indeed I wasn't in CC and missed the thread.

> 
> https://lore.kernel.org/all/20230714013756.1546769-1-sre@kernel.org/

Applying it now,

Thanks.
Neil

> 
> Greetings,
> 
> -- Sebastian


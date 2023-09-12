Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A6079C73F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 08:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6872610E35B;
	Tue, 12 Sep 2023 06:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF31D10E35B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 06:55:35 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9a64619d8fbso666498466b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 23:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694501734; x=1695106534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3UdEjw89xtRW8XyxN513r2SYC0QheMnj/7RDlqM7y9k=;
 b=ddRtXhep6ganEGIOXNcgptLBwPNCi84tw4sWXrHG3775QXUoyXqRkZffw3CE8L2uSo
 2QrRMQDfZEcdPIhV3LaunP5r+GPlfzso/JvVlo+nGLCENId5s0L+KiCmZhTeIK31Xs1i
 jlXlrnJUrEHaWw4eKdSc7VoxuiJZKVv0H0shM+Gh1j7/PGW7jxoL3pQ16PDJ/1jCNz5Y
 0QzDOcnXv285T7B/JNO0V9ncMrfQoS5nOxJCqkWwHVXNaOIn7CPsKd4q8WpY0xSXNq6T
 uJH42yhQePOKFvXkSUybLZzfZAyE5IAghY02FLstRwdAgQ1AMvVdaDeH0iqdxlxU9cyq
 8PwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694501734; x=1695106534;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3UdEjw89xtRW8XyxN513r2SYC0QheMnj/7RDlqM7y9k=;
 b=iLQyoN0xp7T8UVTc/fXU7+wg0s8ybhd5riUxSbfPnQLqKPbDIcmXMTIZ1FqPcONaI1
 cO8aTLgubU0SQYe2m6sE8YwxhNiJZNJlaW5l1r1NoYuneimTLwUIN/IjWAigR5UhMcQo
 qmkqbhZLr9yvS61IelzfR0Z5Us9gPckD/w/ZJuY+D29uwd5vIObzBNIIve5fug/5aRkK
 hdR9Bkqb7nu+hkaa7TWiaMhzVtDMwmMawTt8Ax6rE4WsjHNYlT9GONxGLX+rpmnC+xmx
 l1JEvQASD1wXSBn3dhKC0OmPC3ZN2KNNCkgpi61cnW1WuI8JUFxs3qQSjD926QQGRYSR
 26cg==
X-Gm-Message-State: AOJu0Yyi53qyO4wcjzBMHLXwJfX4VfdsopY1GD0FaiaIvMV/SJ6F9WIO
 CWRD2OIekxSL64brPmx1XvwAhQ==
X-Google-Smtp-Source: AGHT+IFcuy18lLCYg37sLw9dN4gufAkL/iLkcLMRlzH6Im91UhNina1XwBw8LssvrESeml35trGiUg==
X-Received: by 2002:a17:906:8a54:b0:9a1:e8c0:7e2e with SMTP id
 gx20-20020a1709068a5400b009a1e8c07e2emr9747485ejc.14.1694501734263; 
 Mon, 11 Sep 2023 23:55:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a1709064a5600b00992ca779f42sm6377184ejv.97.2023.09.11.23.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 23:55:33 -0700 (PDT)
Message-ID: <42d4878a-4574-377e-e307-0dbef2354aa9@linaro.org>
Date: Tue, 12 Sep 2023 08:55:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 8/8] dt-bindings: display: panel: add Fascontek
 FS035VG158 panel
Content-Language: en-US
To: John Watts <contact@jookia.org>
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-9-contact@jookia.org>
 <e22e61e7-02b1-8127-888d-e470838f4a18@linaro.org> <ZP7il27e9cExVWaL@titan>
 <c4d89d97-f8d4-da2e-dea9-6c054cf07eb3@linaro.org> <ZP9Eoh06Sirl_97l@titan>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZP9Eoh06Sirl_97l@titan>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/09/2023 18:47, John Watts wrote:
> On Mon, Sep 11, 2023 at 01:49:39PM +0200, Krzysztof Kozlowski wrote:
>> If the other panel has exactly the same case, then yes, you can do like
>> this. But it depends on the bindings - to which ones do you refer as
>> your tmeplate?
> 
> Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml

The file is indeed serving as poor example.

Best regards,
Krzysztof


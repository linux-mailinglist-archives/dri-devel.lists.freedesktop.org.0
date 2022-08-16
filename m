Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7660759562F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 11:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB898A1C2;
	Tue, 16 Aug 2022 09:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1EE11AB77
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 09:27:09 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id r17so14063477lfm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=YuhzrIsKzKoxljsJquJ+N3MzsaKkJkpZ8K+pC1+WTlM=;
 b=wvHYOe7vCMOWiQ0nymIOzn6F2Mne3tojRiURaRTfDlx8FNTjviNmtXGdZM75UXUnsI
 4IJv3jaEffif/5cR/jc3VDh/QkFxJ/mVnVnpvjn/oYVEMe2zWGUM0jzGCHv8NkZDcROz
 6Vk+KUYDHLL6g3rS7ddA57gEnvLXZoxKtLKPZ5RrmtNpILJQMwIzy7LZDxvUdy086HUL
 CV7KHiz9zQsx4F/1AbNzNU4AzslfxAnj7G76D02AoxRcoE1yWk+vm+b+RpiyetKqSKg6
 f0A/pYcy5s2efGQypmfyLv8jQT2zNLjBHrHR492VnDTElyGmysFM4varqCcY2u4yJ+wD
 qWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=YuhzrIsKzKoxljsJquJ+N3MzsaKkJkpZ8K+pC1+WTlM=;
 b=hx+JOk6V9IRZmyNM88h/U04G/QXBOVKpQXp4cS6v3fJdlMvPK087RTGkpxcSSts4ij
 djiQXQPEt2uAPnG+po/nmk2gOgI6i1ooK4bIe1gO00Pj5xTYTjKWnZsCwMWP/kA6xFPh
 csAHx84etEy4Rbt8tLu66JyYs1Kgwvw+EVYhaDYbtAdBSTxSP4QA5AE7oIlPVKVpa9Xg
 wBWI5W9STV2yq+PQC2VWVFSSpJcVphGxLyr1rvDhlr27NXoX10qZwpPL2LPJ2g8b6ozc
 w+LI8gcuxoGHLx01CCDQv21jzynRWQYET7vNGXA83K433i5c672FZbKX1z2yLq+EME6M
 5Aew==
X-Gm-Message-State: ACgBeo2h11TEbOMOCk8StKnlvdH/6z+b44L6Pwqe56koAJXV3YmwWRqL
 CTDC25Ez4+lluOhkezUa8ZBXkw==
X-Google-Smtp-Source: AA6agR6s2p78Qi53zblpaHXfrGi//J3wJqGVT9FrxyRs6MqrWgTRPUjHp/ZhteJLKa8SqLm3gh6NhA==
X-Received: by 2002:a2e:7007:0:b0:261:6dd1:e0f5 with SMTP id
 l7-20020a2e7007000000b002616dd1e0f5mr6503137ljc.394.1660642025713; 
 Tue, 16 Aug 2022 02:27:05 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4?
 (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
 by smtp.gmail.com with ESMTPSA id
 e19-20020ac24e13000000b0047f8e9826a1sm1331015lfr.31.2022.08.16.02.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 02:27:05 -0700 (PDT)
Message-ID: <d6acd450-a3bc-d5bd-eda9-9664e6beadf9@linaro.org>
Date: Tue, 16 Aug 2022 12:27:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705215213.1802496-5-mail@conchuod.ie>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/07/2022 00:52, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The k210 U-Boot port has been using the clocks defined in the
> devicetree to bring up the board's SRAM, but this violates the
> dt-schema. As such, move the clocks to a dedicated node with
> the same compatible string & document it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Does not apply to my tree. Please rebase and resend.

Best regards,
Krzysztof

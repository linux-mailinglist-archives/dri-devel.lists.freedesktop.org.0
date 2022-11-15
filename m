Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6133E629A3A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6507010E3AC;
	Tue, 15 Nov 2022 13:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E956C10E3AC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:29:28 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id h12so17490028ljg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 05:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m8/571RzD8HO7x98AMQxlDHgd69AGcRueUaHlHGZA2k=;
 b=jpMA+aALKoFqugZ/DkuZDU0yDcLbzWdAdLvx3bKcWcJ//U9YlKIJvT2cIrb0dvFALa
 Vdol+cwrROakLQObmfWUefKh3YtiSn7RBeIfeRy/AkVgZ4iOSpSIUqNDkR27/pzHtVz3
 zHPCF1JqSz91LM3GKf2U+Yu9/ce/ZzwYC2QoVPI+4SVNYN2eYeJNDmV2ZokCwNEbL4PG
 7B+IvRTKPyyodKgHStyhW9VTSGji+cknjHJYAF+cu3MXKY8JPzINY77xyKaArIcTabmw
 5qg3F+wPC991MR1+cPNvTCCJ8ynDlsrEG7O0npmzdAoIe8v6T9JwYT3cWCn04lH6CuRI
 ZcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m8/571RzD8HO7x98AMQxlDHgd69AGcRueUaHlHGZA2k=;
 b=OEqlLvbvKafxfAZS6xFHNgwksekPnhmHZUs5n4bsGNuUPF1qvga7c1t3dFNU3/obwJ
 cVtGu27j8AkB6FHp+FnxqZY8qem3Y9PmawTLHSMNiADmuHHGPTZaYM1V90jmqj8J478k
 w/Pdut2k3uN/cqTPOX5ORxfno8aNlVN7+SdCDBbZ8pvJ37tvU2adFWwd8QxW7V/4vMEz
 TuwK4t3yUglyxeHnJ1UTc3c+HIoLF+deCCeCV5qF9FYsmq1d3Dz6rX3PwF2zbzCAInRo
 H5VUCMG7IZIUB1OfzaUHrsKBI440V3DQezKKfIPaBF5HlKy6PNNZopkuFlw7dc4us8DO
 i9sA==
X-Gm-Message-State: ANoB5pmyEceIDJTZdwEx/Sdg11c3xM8KkC+NuVJNm+Y4UCEUYWP3NHy5
 CNcOF4Y5nCHtHxqD2dqA/T7azw==
X-Google-Smtp-Source: AA0mqf5lYIIfVeBC99+U3iZHmg7EN30sHOtE2HHltdeEpz34+ahL7J381NXgO+cbaTjJO1jB9Ljdmg==
X-Received: by 2002:a05:651c:2314:b0:26e:2772:ffab with SMTP id
 bi20-20020a05651c231400b0026e2772ffabmr5568604ljb.97.1668518967304; 
 Tue, 15 Nov 2022 05:29:27 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a2e0c52000000b00277351f7145sm2415833ljd.105.2022.11.15.05.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 05:29:26 -0800 (PST)
Message-ID: <205120bd-7178-0c2e-b131-e296d3d3cca8@linaro.org>
Date: Tue, 15 Nov 2022 14:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [EXT] Re: [PATCH v3 00/10] Initial support for Cadence
 MHDP(HDMI/DP) for i.MX8MQ
Content-Language: en-US
To: Sandor Yu <sandor.yu@nxp.com>, Jani Nikula <jani.nikula@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>
References: <cover.1667911321.git.Sandor.yu@nxp.com> <87iljp8u4r.fsf@intel.com>
 <PAXPR04MB9448612AD6C7744B7C706D6FF43F9@PAXPR04MB9448.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PAXPR04MB9448612AD6C7744B7C706D6FF43F9@PAXPR04MB9448.eurprd04.prod.outlook.com>
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
Cc: Oliver Brown <oliver.brown@nxp.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "penguin-kernel@I-love.SAKURA.ne.jp" <penguin-kernel@I-love.SAKURA.ne.jp>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2022 14:50, Sandor Yu wrote:
> Run get_maintainer.pl for patch 1, 
> Your email address is list as follow,
> Jani Nikula <jani.nikula@intel.com> (commit_signer:2/8=25%)
> 
> And I add the email address that comment as "commit_signer" into Cc list.

That's not a maintainer entry, but contributor. No need to Cc occasional
contributors, except people interested in the driver.

Best regards,
Krzysztof


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546CE41859C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 04:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82C76E400;
	Sun, 26 Sep 2021 02:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3166E400
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 02:22:37 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so19040677otx.3
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 19:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nj+G8GkuNT5hGMd8K9aymkYSN+enFAuUPMyNPjlyK48=;
 b=kTBdGOpfjzQt9bXyFWTkT1NODUtydsYiq+h61BC9MuikRdLIS4XcSDV7ZbMBUgzHtq
 lllJgpPKmNayz5W6Aq2DyT2DgjhYRmtm1EuxRaZw0II1F5kYzRRXDSXMQXLBp3IQsXP/
 t5htX+l4Jg2pZbE3hZqRvnvE8FA1qmaeb0OqBV5Xl5czV4d0m2R9n8MIGkU/XR4yQezG
 iORd6PglvfhONgXzXHZ7omviB4JBlhVOA3Dq4dmkiXgAYNgibMLPQpNYJ3spJYxoRg81
 n5qC3xjBSpn80pIVwudqiuABtg8o4Gq9CYKNEqcqsEi4mM1Mjv/+arObdvlZOnSPDUyv
 01Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nj+G8GkuNT5hGMd8K9aymkYSN+enFAuUPMyNPjlyK48=;
 b=bVoprJTrPk39iDFcfHAuhz7CYYBFugqi726kLtjAGMVQfqBjWqWQDoPMGRlr43kxXX
 lh8xB6kmCPJBFmzLfdjeU+DMIwDlJQ4gu9heAa2EcpVK2cK8wq48fWuADEWShhIjp0G2
 hffJVPC36HwBg7gW00kqbonIlFTMryVqeXqcXd3H6KiKUglUlAsaJXnEkvUXs/O13TVk
 BHbjAYPvTe2HZ9+fK6Ydv6+dPvlDJU5Mu5dMYi9a5IXEry3y4RXPdfgBmLhzOO6WOF5A
 zXvoNo3asbgsUGffHSM7a8yih7QDD/a7jk+PAMD/jAIhoUseBSLUb9U7TTEcxPQTgJyz
 BpLw==
X-Gm-Message-State: AOAM530tpevwV+o2iQIWFGuva76gaF3J3lJV3f0H168f7mg37+ZBUjLF
 4eL16V/vikzBgx1OlW1HcO4=
X-Google-Smtp-Source: ABdhPJzcgkOiRZFHSghvqK//AMjMoDWJYEqNMKVMMnLqpdVnNwS/QUI+IP7Uh29kWFPfCn1sLajIcQ==
X-Received: by 2002:a9d:7d0d:: with SMTP id v13mr12022342otn.289.1632622956517; 
 Sat, 25 Sep 2021 19:22:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:dfe0:49f0:a90f:da5:ff6e:aa3e?
 ([2600:1700:dfe0:49f0:a90f:da5:ff6e:aa3e])
 by smtp.gmail.com with ESMTPSA id u15sm3475737oon.35.2021.09.25.19.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 19:22:36 -0700 (PDT)
Message-ID: <2cb4144b-7250-1e6d-88d1-cc4efa3f59dd@gmail.com>
Date: Sat, 25 Sep 2021 19:22:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH net-next 0/5] brcm ASP 2.0 Ethernet controller
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Justin Chen <justinpopo6@gmail.com>
Cc: netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Doug Berger <opendmb@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Chan <michael.chan@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>
References: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
 <YU8xX0fUWAoEnmRR@lunn.ch>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <YU8xX0fUWAoEnmRR@lunn.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew,

On 9/25/2021 7:25 AM, Andrew Lunn wrote:
> On Fri, Sep 24, 2021 at 02:44:46PM -0700, Justin Chen wrote:
>> This patch set adds support for Broadcom's ASP 2.0 Ethernet controller.
> 
> 
> Hi Justin
> 
> Does the hardware support L2 switching between the two ports? I'm just
> wondering if later this is going to be modified into a switchdev
> driver?

It does not, these are just a bunch of Ethernet ports sharing a few 
resources (clocks, network filters etc.).
-- 
Florian

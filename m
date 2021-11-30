Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97770463AB0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 16:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087106E598;
	Tue, 30 Nov 2021 15:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DA56E55C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:54:37 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id f18so54960911lfv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 07:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U5qik7JkxsV5L1nyIiJAzLGGqdU8Lv8lfNJJdZtpwB0=;
 b=RylwZe89Gypz3GfzQSBHd0yTJdUBDZytxEh0mEKj30BcarBB4LEdiIcNBm+4gc2f7l
 6lhx7QrVSHrj3DhV7qmkd8tGWUmyM8xsXbocB6Z+O9SVijMvhXlnAVxD8CwuZTCXCDgV
 HP81x3lmR8wGcfB3cd/sQYSjmGp/Xf3WrdKqFn4XEuN/KMnCjrnnSdclgF7AL81C6wWA
 U1ssQsizpD3vG2qtB1jbdA2tLh+79Z8NWh53EhmDBdL6vWrQz1/FKKY7REB/ckXWLN5d
 yIBhDKP5SSC2QUxiovsBjVhKbpimlyiEKhoFpIH+46pR8ZI6VuAaB50DCxAjtSlytoJU
 t8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U5qik7JkxsV5L1nyIiJAzLGGqdU8Lv8lfNJJdZtpwB0=;
 b=7pgLMOR6H6hnCSRQtAfymy1RuipGmVPdGECFkcqdDyRztGvqpqmsZwqsfe4h+dnMCE
 G+ctfhUwb8BXy8kI60EO7mcUQRmCJOUQlJDJPDLWxhopknkCqRcFix60xtwO3RngML/F
 DQhkTH/WDAwSs/aXmyt216cwvTrHr4bk5tdgl0YZob+xVVYm3Nd3z6PPCdQ5TQ8GRWkG
 s6qjwyuC5V7bP1XYMuh0lFSKKzq3iIe5BbydbuDSWrAz+BVaXEsa5Z0VMMwj3mEBLvpJ
 7xlSMDwHgTOMq1cPqorUqc5enLJPW6styVoDY6pQfW3xbgx7rxlyEIoDCuo0plq4TLCs
 Q2zA==
X-Gm-Message-State: AOAM533Lk6bd9eIDdR8ceAUzbMCdyPNWfBpznZxrtZuP7qaal2+HG2sl
 G83eLJg1VABC6l1VwEou8Co=
X-Google-Smtp-Source: ABdhPJy7QhmKwfLB5R6+JEk12Qsc2zj/1kqkJEqaJM8bGr5pAdx1OFEqLSkVbe3uceco1zRz+Cg/Gg==
X-Received: by 2002:a05:6512:39c7:: with SMTP id
 k7mr10824lfu.571.1638287675500; 
 Tue, 30 Nov 2021 07:54:35 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id b13sm1985266lfv.200.2021.11.30.07.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 07:54:35 -0800 (PST)
Subject: Re: [PATCH v1 1/2] dt-bindings: sharp, lq101r1sx01: Add compatible for
 LQ101R1SX03
To: Rob Herring <robh@kernel.org>
References: <20211114200717.28986-1-digetx@gmail.com>
 <20211114200717.28986-2-digetx@gmail.com>
 <YaVG93LCF6MQYiSi@robh.at.kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a8f05850-1c18-1a7d-e529-08d9a6bd9923@gmail.com>
Date: Tue, 30 Nov 2021 18:54:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaVG93LCF6MQYiSi@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>, linux-tegra@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

30.11.2021 00:32, Rob Herring пишет:
> On Sun, Nov 14, 2021 at 11:07:16PM +0300, Dmitry Osipenko wrote:
>> From: Anton Bambura <jenneron@protonmail.com>
>>
>> LQ101R1SX03 is compatible with LQ101R1SX01, document it.
> 
> Then sounds like '"sharp,lq101r1sx03", "sharp,lq101r1sx01"' would be the 
> appropriate compatible value. Do that, and you don't need a driver 
> change.

Apparently you're right. The "sharp,lq101r1sx03" should be a slightly
improved revision of "sharp,lq101r1sx01". I see now that LQ101R1SX03 is
sold as a spare part panel for ASUS TF701T, hence these panels should be
entirely compatible with each other.

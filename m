Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBB02EEEEB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 09:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62FF6E819;
	Fri,  8 Jan 2021 08:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A816E5C1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 02:55:44 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id y8so4919435plp.8
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 18:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EG9c/QrlglkgwfRJUmQKNCPIJwJMfMxdpeBqAUmgOZk=;
 b=E9WhvDhXJQdf3y2rdal5JO3AXwTEwU1jVVEuc6F2eI+a/CgUB9710YFUxBN3Epz9rt
 CtM/qYL5hG734uFnQcymzO78uKgcphlwoNlsTILgh27HKID2rMlfyd8oPx3tpV/mdzkE
 3yafqJfaAPYHbZQHlO01JWTBvwtXn3LZetnYT6+j0JAHqbV4UAsPqu/yNzikLwxMth33
 ifC67tCL2PAHvZtVjx8hCdrU/uQHC1YFbP0CUIditJKqGAhMn9Lzz/dPsb6ESBgiSs26
 lOMDcpeinmxpMsB+H6bJXl1kXwgaq5Gb8znKenjfqGyVAhUGJBiW0fhT6weUEDrNfctJ
 yNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EG9c/QrlglkgwfRJUmQKNCPIJwJMfMxdpeBqAUmgOZk=;
 b=S0cTgPRw77Fkhobjg+ou4AKwcTB0b39uG9AIGOw9lU6navbLHlxloo6E97wlZYOdF7
 POzGUKc7Ki15UsYVCjjeoQwmad0xljhoU1OiGJbbRGNX9otT6eSbqYME+airR4xtPjYd
 TJpq9joMlsCTkoGyJf93vCRkz63SJh4v4g/+cCtB2VwsnGIpVxYPmk/BTyofIPjNV+Z4
 J4m54+1tbulG7iVu/Df8s4V35Y1yOccZa14cTNPepfx9edku9BOqxfjt+ttTpGftkUAv
 UU7wbnx8Q3XAGimfe0AytlYZuxlsHUgh4XQ3dur4cdHkYR2lwBUH6dStE/fXuTbibf4J
 JGhA==
X-Gm-Message-State: AOAM530IrJq5IKuzzlA563W16vVhM2tAwaIqTnvjIE7uPSFVF50MXdLO
 27JPl1sM3hgENGaQbtqPr+o=
X-Google-Smtp-Source: ABdhPJzug/UItPAiUdNY4Kcu74DHwKQvsoTGi0xD0+uXuBVy+3GMxnsh5FcV6z+mzzlH7pdExirSpg==
X-Received: by 2002:a17:90a:394f:: with SMTP id
 n15mr1498276pjf.121.1610074543889; 
 Thu, 07 Jan 2021 18:55:43 -0800 (PST)
Received: from [10.230.29.29] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id q4sm8166487pgr.39.2021.01.07.18.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 18:55:42 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: bcm2835-vec: Add power-domains property
To: Rob Herring <robh@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>
References: <1608751473-12343-1-git-send-email-stefan.wahren@i2se.com>
 <20210108024209.GA1769120@robh.at.kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <623a71eb-ac4e-7b75-db96-5dbbca98c4b2@gmail.com>
Date: Thu, 7 Jan 2021 18:55:39 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108024209.GA1769120@robh.at.kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 08 Jan 2021 08:55:35 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/7/2021 6:42 PM, Rob Herring wrote:
> On Wed, 23 Dec 2020 20:24:33 +0100, Stefan Wahren wrote:
>> Adding the missing property power-domains to the bcm2835-vec schema to fix
>> the following dtbs_check issue:
>>
>> vec@7e806000: 'power-domains' does not match any of the regexes: ...
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>> ---
>>  Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

I thought you were going to apply this directly?
-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

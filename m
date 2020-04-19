Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B844F1B01F3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4587C6E207;
	Mon, 20 Apr 2020 06:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBC76E079
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Apr 2020 12:11:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 188so1577659wmc.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Apr 2020 05:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qDWwN7dRk5pqZLvOlJ3z/P/6xlKYB15KnptTZqFY7ac=;
 b=WHzw1v+6PR34pG/FOKkcHRN2/DDqhMhjR/iJO5meFbj8IrqQe8AdPrjKLYw8HAJHsE
 tnUALuEXuRfa4Y4+pFausKpgN7dakbYI5x9TLjyiBlxqHbnLIfJc7RZKWKbJCt35b7Pi
 NXiAm5gg+h0iMcY6MQcTP6Nyp1Jq5p2wn47CPrY13BElvgWT/0Cl6p47HafBgEMhiBYC
 /w/kNua3p7dHgIsdHGP1YBhZ63pzTcSQSXUce/pkRClm89PM2o+F+mA4CExEKGz2Wmd5
 +H+NlCZ8TG9awAjgbjTgMs9HoHeIOR+WqyDKgsFJKYdvx5kss4aGK8QRz48OoO5kj+wg
 NhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qDWwN7dRk5pqZLvOlJ3z/P/6xlKYB15KnptTZqFY7ac=;
 b=ME+PR3a4nokADZKHJ6XRq1LX0n2p0VJ21g70eVrrVdwFw444TFzEn0CwdMm2ayui5t
 wb5/IexSXkT9W3gIzjVIthlcftx5pGoWk/P9VmYwGURz7C7pKc5mB6ysMUJnIY8C3aCi
 fyg/20M/c20PVfKil0aGMqT+x82cK5sr510MRCPTVSrdQTTMy6CiLdFG1Wn46kwtqz8y
 Igd9vfl0TjAD5bCUPVn7C8LNq4mma6nkcCngXktQDF+Y3ce2ujb6fAL2F4373KNxK66k
 23KoxzUDyPQSnwAZFTxq95oKJiHsUphav792tr+0qs10zR1PRB5sRXCTjNNai2NVX7CZ
 S63w==
X-Gm-Message-State: AGi0PuYBiKHeCFldb0wyyDpVv8XImqntJLRwy7Zlv2LpvfKpmyBmvfJv
 fKQGFkS2m90PuEN9MXngTDM=
X-Google-Smtp-Source: APiQypKgu/b0k3pBd8Nqh1Je1Us+ItJulva0YmJp72MQ6GXdsWl+kPbc/D1tHvSbT4zMsffzpOZNMg==
X-Received: by 2002:a1c:3281:: with SMTP id y123mr12454056wmy.30.1587298317543; 
 Sun, 19 Apr 2020 05:11:57 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id 36sm24581283wrc.35.2020.04.19.05.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Apr 2020 05:11:57 -0700 (PDT)
Subject: Re: [PATCH v2] dt-bindings: display: convert rockchip rk3066 hdmi
 bindings to yaml
To: Heiko Stuebner <heiko@sntech.de>
References: <20200403133630.7377-1-jbx6244@gmail.com> <5903181.62QgbpdqVa@phil>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <2cf39dcb-1057-5c52-02bd-cc81607414cd@gmail.com>
Date: Sun, 19 Apr 2020 14:11:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5903181.62QgbpdqVa@phil>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko,

On 4/19/20 2:08 PM, Heiko Stuebner wrote:
> Hi Johan,
> 
> Am Freitag, 3. April 2020, 15:36:30 CEST schrieb Johan Jonker:
>> Current dts files with 'hdmi' nodes for rk3066 are manually verified.
>> In order to automate this process rockchip,rk3066-hdmi.txt
>> has to be converted to yaml.
>>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> 
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
>> @@ -0,0 +1,140 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> checkpatch complains about the licensing:
> 
> -:100: WARNING:SPDX_LICENSE_TAG: DT binding documents should be licensed (GPL-2.0-only OR BSD-2-Clause)
> #100: FILE: Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml:1:
> +# SPDX-License-Identifier: GPL-2.0
> 
> please consider adapting the license accordingly

This is a conversion of a existing document. => GPL-2.0

> 
> Thanks
> Heiko
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

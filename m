Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D006071CB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 10:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC00010E637;
	Fri, 21 Oct 2022 08:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDCA10E491
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 08:10:16 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 3-20020a17090a0f8300b00212d5cd4e5eso281787pjz.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 01:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lXzKjs0QuMJFHhHxqVj+9SnjfrHwM3NF7YIpt7TNTaI=;
 b=Mys3W+v6NhbOdm7NK0w/s1vYs/tSmZ9FEvVzZmbw6YJc//vUdLNLAE6ZH2f35RE+1F
 gPEDc9WjHtuOxTpj1+IrzWgUObf4K3kneIO9OE8z5a2ndn0U5sXu8UbVyxR70Pd7pIPo
 rAr4qbDHfPu/RSlFI5p3AyhkdVbFatymvOUxjquprgHcdi5UAvqc4Qx99rbZq0qyZTdY
 KwJO9pgLRPE/YA49BxLSXCPZcRnXKe1aCWmKmxLtoY6glHeVvY2BR4ubrAx40DDW574j
 OqMGYuaSqT2k0oK+Xvcclc96aSkwxK/nln9vF58um4Y7Z4MTvv4ERaS7rs+iLY4cMeiu
 kn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lXzKjs0QuMJFHhHxqVj+9SnjfrHwM3NF7YIpt7TNTaI=;
 b=Tf+vqOeFDGrORL+4HXQ7631ZX3gDnB7cYwO/OfxwkNd5LdbW5WoVUWXba3InAZ92YE
 8vDzipVWjp7/maKssPikrMlS9ihcvhGlk6jCaJpIojmQAZO1GysjeprVE0SIFuD94VV1
 NySNOIExzn3bZz6PbXcfLK9ou0ouZ4UOzOiG/psV7FIIuXNv41hLz11UXaS9HMrlB8vH
 k05C4w3IGbE/Kcic4sBlkw3ZOxe2QnGmROI6mKpaDMkQMqpvPPxXA+ckdLUGIePzZUoC
 pzNVDM/mXoL+2R5rdx0EzFUOdyD2p3WNZa60SrtaVRiixGn9LG+IRiGs1mjz9zPyCOFO
 MxFw==
X-Gm-Message-State: ACrzQf1W4h755hzgc/53x/7uxdOtPgZjtS97G2g2xOzIZdxXqw9cYB+N
 4VhJUF4wp7vg4FNimYnFBJ0=
X-Google-Smtp-Source: AMsMyM5sAFDn2m7eU1IO1HLR+Dj5DRv48PD66GqVJlKBjSno4da6VVojeRmW/AHTGunJwekUL3XgVA==
X-Received: by 2002:a17:90b:350d:b0:20d:5438:f594 with SMTP id
 ls13-20020a17090b350d00b0020d5438f594mr57585559pjb.216.1666339815632; 
 Fri, 21 Oct 2022 01:10:15 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-84.three.co.id.
 [180.214.232.84]) by smtp.gmail.com with ESMTPSA id
 33-20020a17090a09a400b0020647f279fbsm1108879pjo.29.2022.10.21.01.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 01:10:15 -0700 (PDT)
Message-ID: <12aeed77-081c-ac40-4b6e-0415d551804e@gmail.com>
Date: Fri, 21 Oct 2022 15:10:06 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 01/10] gna: add PCI driver module
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
 <Y1IeJplXNHM+VvCJ@kroah.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <Y1IeJplXNHM+VvCJ@kroah.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/21/22 11:20, Greg Kroah-Hartman wrote:
> On Thu, Oct 20, 2022 at 07:53:25PM +0200, Maciej Kwapulinski wrote:
>> Add a new PCI driver for Intel(R) Gaussian & Neural Accelerator
> 
> Please drop all of the (R) stuff in here, and in the Kconfig file and in
> the .c files.  If your lawyers insist on it, please point them at me and
> I will be glad to discuss it with them.
> 
>>  Documentation/gpu/drivers.rst    |  1 +
>>  Documentation/gpu/gna.rst        | 64 ++++++++++++++++++++++++++++++++
> 
> Why not just put the tiny documentation file in the .c code itself?
> That way it stays up to date and might actually be noticed?
> 

I think the documentation should be on separate patch.

-- 
An old man doll... just what I always wanted! - Clara


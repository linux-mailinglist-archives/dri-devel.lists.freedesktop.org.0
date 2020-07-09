Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C593D21B0AE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6610D6EBC0;
	Fri, 10 Jul 2020 07:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EDB6EB26
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 20:01:24 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id l12so3574320ejn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 13:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d0gYY+wvsRxBQmwzqJnWeCjIuXvxeaWsWRCnx0ubZOg=;
 b=GkZHcqMUxKmjdVenudvdvqrkXbo+JquPTX2QSgtNobUDUV+vraMZmE9cpIcAdHZJUq
 BsNZoufFprGyxI+wF74biz7ZS11pt7kce+6MsuFWiTDxGPiFDCBKH/FQV0TSZY+pJnKZ
 aQgYU21P8pRSAHEIpMjQaSk+/2UWcXpEmWTHqU2pnGGc+WJE2vTWQaeOqT9pS6Wvbnc+
 FHkBOL1YGb2IRejD/iE8bAHlYDJJb7i6xs3ZqMC0TUpFxaYPBos1PzAaPH3oFvaWN425
 C2K8MZOf+/7LZ1SzGQPQTHQjCyQFHQkVSe9p2Uwwgk+FPt9rtQwguKi6C2OAdfptqC2j
 oImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d0gYY+wvsRxBQmwzqJnWeCjIuXvxeaWsWRCnx0ubZOg=;
 b=MVU+4jqC6g7Ri0KYrWfCTfeFxfGpvEqQ3YSlfnC07ptagONsnbnYh2CFRUc2DE4Lhd
 dJgy6DyztTBxFFwaZupD7xAp8G9AtIYWsNkzB5SDsOZrlQb6Hk/EdaLa7dCEwNmPG0On
 2o02UeAcot76U2kS/AYsqxAnBSEs89uaTw5gQ+AV6o/Wty7xvbiOSC6Al1Sj4Hsahvit
 Jvb8SUORWhZawmVBVUDvIA+vxG+AKSBXxBScuY5UxtqIMg86Ce5cqIVJpd1MuSZ3KSLO
 2jQfGgS40mm47l3dNsXzVnWfUIrQ1P8MA6wCyuKsoKrp7AaYVpsHjO0vAROpV0Ivxl2b
 1b1g==
X-Gm-Message-State: AOAM533Z474EIWD5aRJCuc7famHcTZMadqK4Ls3GdxnqRTletnXXMY/r
 y2MTRNGN140SLSrI0/lMaZI=
X-Google-Smtp-Source: ABdhPJxPlnTPprrTFBMP+KVIniKNlWppnSrNKOcRmi8sX8QVrNf9GjrPlFc+WTiAQakw0xXsLbAzEQ==
X-Received: by 2002:a17:906:3a04:: with SMTP id
 z4mr51246240eje.441.1594324883183; 
 Thu, 09 Jul 2020 13:01:23 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:2066:8db:696f:8073?
 ([2a01:110f:b59:fd00:2066:8db:696f:8073])
 by smtp.gmail.com with ESMTPSA id t2sm2728139eds.60.2020.07.09.13.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 13:01:22 -0700 (PDT)
Subject: Re: [PATCH 11/20] Documentation: leds/ledtrig-transient: eliminate
 duplicated word
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-12-rdunlap@infradead.org>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <16035116-2154-d0fe-6655-a829a9d36ceb@gmail.com>
Date: Thu, 9 Jul 2020 22:01:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200707180414.10467-12-rdunlap@infradead.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dan Murphy <dmurphy@ti.com>,
 linux-mm@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Douglas Anderson <dianders@chromium.org>,
 Wolfram Sang <wsa@kernel.org>, Jason Wessel <jason.wessel@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/20 8:04 PM, Randy Dunlap wrote:
> Drop the doubled word "for".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: linux-leds@vger.kernel.org
> ---
>   Documentation/leds/ledtrig-transient.rst |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200701.orig/Documentation/leds/ledtrig-transient.rst
> +++ linux-next-20200701/Documentation/leds/ledtrig-transient.rst
> @@ -157,7 +157,7 @@ repeat the following step as needed::
>   	echo 1 > activate - start timer = duration to run once
>   	echo none > trigger
>   
> -This trigger is intended to be used for for the following example use cases:
> +This trigger is intended to be used for the following example use cases:
>   
>    - Control of vibrate (phones, tablets etc.) hardware by user space app.
>    - Use of LED by user space app as activity indicator.
> 

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035551CE52F
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 22:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B636E566;
	Mon, 11 May 2020 20:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0090D6E566
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 20:13:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id 50so12064887wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 13:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=7MAlurekzES9b2KPWTRbo3GRCIe+n4yOAw5eVv5+rMQ=;
 b=QA9H4bjtTLql6WbAJzbRgcAJ8RF/WtnxvHt2nh8s0+EhTSfdXZ2bEwE7PX1vhu541f
 vaIH1DiopakA1j8I59jPWdOZD1DKWDiSBTTHhdpE2jzNpwONLO1dM9xAgnvr4Mc9F9oH
 QGnAvMKfO5rRJBJEYNYSa+HM9ID1GMkihdFyqvW4jsmgQJcgsjRDfMLiU6MtMrcAmHL2
 Ak0EL0NXRmjnl3xWJjomf9sl80iMqOMb2VdSdDf+HnsqQtEJZ9wBVz2b5xlYBFrdPNra
 K+AzwAbjjg2n3dR98nJRIRKpJCcDn9aMTegkvls8PcwkdaNiImKQ2hJaQYUQzsM/MYaF
 /GMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=7MAlurekzES9b2KPWTRbo3GRCIe+n4yOAw5eVv5+rMQ=;
 b=pwXFfEJfS6Dt4QmpWhiQ01/Ipm2sQGVCw1S3qs/v7BQzJyDoP0mBpIfvV0JFdNdQdy
 xo/tHd4tp+o0jOket313G/G/+HCbRfILPzffDN/waWJxBzORxHt0DkcAKc3NJ5q6raYW
 VMaCyliFdfrZaC9RK5Tc5kXbgvIAAsMBKiSBJXvL8J1VqW0j8pC4VpC6KnCsDlgNsxV+
 DjVMgubqDFXd9pN3YgWVW7M07rSm2XWh7+rQ8k4PJajdy+4N+ERiwzbV4ixJdoNGXFuE
 y1fjPtmWwwPMPLKJA0KN6GsREcVbkGfYh3kRC7K4/NeXdxG7PKWZ+V1yB2uxP7wENNzl
 Q6mg==
X-Gm-Message-State: AGi0PuaeXivZQVnwyznaVDYe0ErCnzCzmCsT4PFGxrFqLG94sgrxhxI7
 lEio0MX8l3YE60OR9UchQ6ljIi+a
X-Google-Smtp-Source: APiQypJyo09kynoCkzgrln4aZPn+JcWw3uy2UZz14kg/7RKlfKqa+JQ3sMZaCJuhZeb6rkthq+PZqw==
X-Received: by 2002:a5d:4043:: with SMTP id w3mr15664890wrp.368.1589227973293; 
 Mon, 11 May 2020 13:12:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w18sm19597960wro.33.2020.05.11.13.12.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 13:12:52 -0700 (PDT)
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f57bb3dc-6888-9b19-d2f6-c432eb32a480@gmail.com>
Date: Mon, 11 May 2020 22:12:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.05.20 um 21:55 schrieb John Paul Adrian Glaubitz:
> Hi Christian!
>
>> Well let's face it AGP is a total headache to maintain and dead for at least 10+ years.
>>
>> We have a lot of x86 specific stuff in the architecture independent graphics memory management
>> to get the caching right, abusing the DMA API on multiple occasions, need to distinct between
>> AGP and driver specific page tables etc etc...
> AGP isn't exclusively used on x86 but there are also a lot of PowerPC desktop machines (Apple
> PowerMac, Pegasos etc) that employ AGP graphics.

I unfortunately only have an x86 Mac to test this on, but as far as I 
know the Radeon AGP support for PowerPC is disabled for years already 
because it didn't worked reliable.

>> So the idea here is to just go ahead and remove the support from Radeon and Nouveau and
>> then drop the necessary code from TTM.
>> For Radeon this means that we just switch over to the driver specific page tables and
>> everything should more or less continue to work.
>>
>> For Nouveau I'm not 100% sure, but from the code it of hand looks like we can do it similar to Radeon.
>>
>> Please comment what you think about this.
> I would be against such a move as AGP graphics is still used by people running the powerpc
> and ppc64 Debian ports on their vintage hardware [1].

Please note that at least the Mac I was able to test with Radeon 
hardware just continuous to work. But it is certainly possible that some 
pre r3xx generation hardware will break with this.

We just stop using this bogus idea of trying to use uncached system 
memory as "extension" of the on board video memory and instead switch to 
the reliable device internal GART.

Maybe we should just deprecate the configuration option first?

> I have also CC'ed the debian-powerpc mailing list so that other users can voice their
> opinion.

Thanks for that.

Regards,
Christian.

>
> Thanks,
> Adrian
>
>> [1] https://cdimage.debian.org/cdimage/ports/2020-04-19/

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

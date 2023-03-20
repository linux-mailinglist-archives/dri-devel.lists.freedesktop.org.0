Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EF96C0E49
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F5610E2D4;
	Mon, 20 Mar 2023 10:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8419C10E2D4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 10:10:33 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id a11so960994lji.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 03:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679307032;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ROGny04CILeyCPZ4vkWe21NJxi6A4EiVeLCtFyNlFs=;
 b=ZR/0YZ46z2R1px//N0p0Im+diR1oI2cClyXVOcochUiM28WB8AS+2KbuoIuF+y2w2S
 SGp3e4N/2V/31/W1P50/3k0BC39KHANQCUpz1USm3bFshWR5pXt9NXXO3Yp5W8IHH0no
 4SDSiTdBo6lgcBUM1Jpm7j8p/hvMt24KAADG17vwxvPiIBIOC0Ukw3/BKWPOVI/jqX8S
 xFijGUWy1xQu0pdt+ZJT1f3OVeUXoM4YcfmUXqDKY6Rwp5XMngmCmuPb9KEQaEvDwGtR
 Y77LAdLVSwhv1LD+KnIzGE1VqKuErkQyRl5PMAJd9E92k+90oeHinlMJHlZD6qOcoIMk
 IPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307032;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ROGny04CILeyCPZ4vkWe21NJxi6A4EiVeLCtFyNlFs=;
 b=voDWvTqOjc7ljVIySIlU/7LG3O6yRvg56cDoe8iHgUcga/Er2HuybcLeBdFZ0KWyZY
 1GfFBffGeBbUHYLRX+o9kPGm2UfqfITsLBh9O6l2ReI61Cpt+dprbnudlUoZ4ZdR79RU
 aqaxom00GIi41q7fIvzPdOfK/mUxslE6Vep0/T5TylFUToeQMeFrTa63y+EfgjH6cybL
 KxLSagQX37myulj+xGOS4x/wT41CO69DrzWNwx2pSxmxC6Zl+PFqey5wUz20+LNNS78C
 VeC1zUbzAP7tJHalKRcuXcFoPesS7CN4wgcJWYz3C0+/pHJ+WZrSheCghQ469D6EvT6G
 l1cw==
X-Gm-Message-State: AO0yUKU3uRi//uSKB61zTShU38ZdPvoGjI1vKxl+G6tPgmA5X2mTDPC/
 Lb+5Nv2Sho1xn5AY2YBJ+1w=
X-Google-Smtp-Source: AK7set8BlupRJrQbxc3VqBd1QIZwBQ2zzvWSnLrmb+RqyM2N/9W7Y/lQ3XFjGIiv9rqyjE24i67KWA==
X-Received: by 2002:a2e:9990:0:b0:29b:6521:887f with SMTP id
 w16-20020a2e9990000000b0029b6521887fmr2287242lji.51.1679307031576; 
 Mon, 20 Mar 2023 03:10:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1?
 (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2e3a17000000b00295a9be8764sm1673368lja.117.2023.03.20.03.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 03:10:31 -0700 (PDT)
Message-ID: <98ff1aa3-2c7f-0503-4e72-32a711638153@gmail.com>
Date: Mon, 20 Mar 2023 12:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, en-GB
To: Jonathan Cameron <jic23@kernel.org>
References: <cover.1679062529.git.mazziesaccount@gmail.com>
 <20230319165744.10e49cc0@jic23-huawei>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v4 0/8] Support ROHM BU27034 ALS sensor
In-Reply-To: <20230319165744.10e49cc0@jic23-huawei>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zhigang Shi <Zhigang.Shi@liteon.com>, Masahiro Yamada <masahiroy@kernel.org>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, devicetree@vger.kernel.org,
 Paul Gazzillo <paul@pgazz.com>, Liam Beguin <liambeguin@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shreeya Patel <shreeya.patel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/19/23 18:57, Jonathan Cameron wrote:
> On Fri, 17 Mar 2023 16:40:16 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> Support ROHM BU27034 ALS sensor
> 
> Hi Matti,
> 
> For ease of when this is ready to apply, better to just keep
> key mailing lists and individuals cc'd on all patches.

Right. Sorry about this. I kind of rushed the sending at last friday - 
which resulted bunch of errors in the process. I forgot to do the 
spell-check, missed a header and messed the recipients... I should 
really learn to not try meeting artificial deadlines like friday EOB. 
There is Saturday and Sunday - and even if I spent weekend off the 
computer there will likely be the next Monday. (and if there is not, 
then I should probably not care about sending the patches).

> Mind you cc list is random enough I'm guessing it wasn't
> deliberate (like the maintainers patch 8 only went to lkml
> where no one will notice it)

I am using a script which generates the recipients "per patch" using the 
get_maintaner.pl underneath because in many cases certain people are 
only interested in seeing a subset of a series. This avoids polluting 
inboxes when sending large series. For v2 and v3 I did manually add the 
relevant lists / recipients to MAINTAINERS patches which only pick-up 
the LKML list.

> I can scrape these all of lore, but it's a step that not
> all reviewers are going to bother with.

I appreciate the extra mile you're ready to go here as well :) However, 
you should not need to do that. This whole series should've been CC'd to 
you and the iio-list. Sorry again.


Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


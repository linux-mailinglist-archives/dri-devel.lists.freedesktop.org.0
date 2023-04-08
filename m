Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8116DBAF1
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 14:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B83810E16A;
	Sat,  8 Apr 2023 12:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DA110E083
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 10:33:35 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 bu14-20020a0568300d0e00b0069fab3f4cafso418541otb.9
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Apr 2023 03:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=protocubo.io; s=google; t=1680950013; x=1683542013;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=atnnfYB8H/1cRTIRhOKd2CzwH9WdqCAcJhjKRDN3luY=;
 b=f36p8T3+z/J6u/o8geXfldjzGTUKvuBwnCOq8aVhPB5Yq0scv4lu22t0IvydiWVBM7
 CU08wz3QuGcIPb3yAdVhAgW3usOu6fLAX0B9dTUyF+DdJBVTJT8oOMZeeGHVuzEsk8U/
 ACJmBPiPbyDgvFE4BNoYWI2q2/7yDxQ5j48C6PILBZX/SdxNHL3oqGlqu/dDTMUrJmJs
 0bwnWui1/dIDcDI/PfO4ScpNdmG7VY3T6R/tIZlS7SRCQlputLk0u0J6wwKpSjlPmnKv
 U/RapLU0djwI0HQLlzVT8qQP9mV23Tbd/Y8AXD8hueIbuxcQessr9EfpsfZaTW/UQGCf
 bfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680950013; x=1683542013;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=atnnfYB8H/1cRTIRhOKd2CzwH9WdqCAcJhjKRDN3luY=;
 b=Un49vIJcjenv3ql30s9jSLeX2wZlfDXGUV+qdASwCrCbuHllR6iznAqMoUnX4LCK8U
 xhwqw3z5UREheNZNzd+9h9SZgyMcqHujiFxpfpXLUp6fFA9s4zH+7bWWmF8GxdgbyB0W
 Le5prA5JSlMOSfKR56rfPNeSxhNQ/BONii67CIydYUfHDteVodRost282p6PqSHKxKH2
 +pcF19nMR+y6oIWRvLsk2ezb1SVz1+kyqDRVuUMwRJzL6ogn4GkS6fbckwrGq58U8Wbi
 yxagrDF0SNMKcCiXvad4YDPxM3paHwqyybtXyVZ6sSWpQhHNoNpX/IkRmIT7rmWrn4HN
 3o+w==
X-Gm-Message-State: AAQBX9fC1RkU6bJ339b8v4jDRj/lHfeY+mufM9o/JOzzIJGxmf4M5UkI
 n/8BwZSCf/FtETKIStDn2sDWdA==
X-Google-Smtp-Source: AKy350absmUQ6HrjCN8ybKL7JT651jVYn5RTh9izjX/ysr91076zOIBiNMnDzdw113Fn8tlB/GuQ7Q==
X-Received: by 2002:a05:6830:101:b0:6a1:7f69:ffbf with SMTP id
 i1-20020a056830010100b006a17f69ffbfmr2146604otp.36.1680950013453; 
 Sat, 08 Apr 2023 03:33:33 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5e:5d5b::1000])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a9d6ace000000b0068bcf7995aesm2442533otq.64.2023.04.08.03.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 03:33:32 -0700 (PDT)
Date: Sat, 8 Apr 2023 07:33:20 -0300
From: Jonas Malaco <jonas@protocubo.io>
To: Aleksandr Mezin <mezin.alexander@gmail.com>
Subject: Re: [PATCH 48/68] hwmon: nzxt: constify pointers to hwmon_channel_info
Message-ID: <jkptl4g7jwhz3mij5wffbw2qlwvxsmnwpqhyalq2ayd76pde2h@jfdw7jisg4at>
References: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
 <20230406203530.3012191-7-krzysztof.kozlowski@linaro.org>
 <CADnvcfKwHJ=dOFH1+DsDfn6Y5k6xdzA7QR1uVDv1afwCsiso3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnvcfKwHJ=dOFH1+DsDfn6Y5k6xdzA7QR1uVDv1afwCsiso3w@mail.gmail.com>
X-Mailman-Approved-At: Sat, 08 Apr 2023 12:37:55 +0000
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Eric Tremblay <etremblay@distech-controls.com>, Tom Rix <trix@redhat.com>,
 Jean-Marie Verdun <verdun@hpe.com>, Clemens Ladisch <clemens@ladisch.de>,
 dri-devel@lists.freedesktop.org, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 Rudolf Marek <r.marek@assembler.cz>, Michael Walle <michael@walle.cc>,
 UNGLinuxDriver@microchip.com, Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, linux-doc@vger.kernel.org,
 Derek John Clark <derekjohn.clark@gmail.com>, openbmc@lists.ozlabs.org,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Aleksa Savic <savicaleksa83@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Robert Marko <robert.marko@sartura.hr>,
 =?utf-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Agathe Porte <agathe.porte@nokia.com>, linux-rpi-kernel@lists.infradead.org,
 Nick Hawkins <nick.hawkins@hpe.com>, Tali Perry <tali.perry1@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, linux-hwmon@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Oded Gabbay <ogabbay@kernel.org>,
 Iwona Winiarska <iwona.winiarska@intel.com>, linux-kernel@vger.kernel.org,
 Jack Doan <me@jackdoan.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marius Zachmann <mail@mariuszachmann.de>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, patches@opensource.cirrus.com,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 08, 2023 at 06:14:19AM +0300, Aleksandr Mezin wrote:
> On Thu, Apr 6, 2023 at 11:37 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> > -static const struct hwmon_channel_info *nzxt_smart2_channel_info[] = {
> > +static const struct hwmon_channel_info * const nzxt_smart2_channel_info[] = {
> 
> In the rest of nzxt-smart2.c there are spaces only before "*", not on
> both sides (and there are a few "*const" already). Would be nice to
> keep it consistent. The same seems to be true for nzxt-kraken2.c
> (although I'm not a maintainer)

While I don't have a strong preference for either `* const` or `*const`,
it would be prefereable to use a single style in any given file.

As the kernel seems to favor the former style:

$ rg -F '*const ' | wc -l
2593
$ rg -F '* const ' | wc -l
15359

it would be better to change the other two locations in nzxt-kraken2.c
to also use `* const`.

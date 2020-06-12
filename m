Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D191F7BE1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 19:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5D76EA0E;
	Fri, 12 Jun 2020 17:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2536EA0E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 17:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591981204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RSxETv919iNwwn2Qchkd484q2EDMbODrI/YRurJgmf8=;
 b=UU19SMokum1/Mqxwzg59tf2rC2KDGZQK1mMwHjJr/OxYmuGrOLXCCHaWLDZZLbwOLr2Di1
 H4DPS7LrxLdl4z47t9eSNUWVdJ0rYT6svydxDlmIBQE3dAH93jXa03kMtNXaqYLDVHSZVy
 gudWUqvsxVw8CSs9m6xmwnls5GCVTIM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-bAaDChqkNPOK3AVz2QTcnA-1; Fri, 12 Jun 2020 13:00:02 -0400
X-MC-Unique: bAaDChqkNPOK3AVz2QTcnA-1
Received: by mail-ed1-f72.google.com with SMTP id y5so3171081edt.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 10:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YZefpytQS9Nuutazh9XOblfbRG+wXV9orLCiC5J8cHs=;
 b=TgGof+dJkn55mJkPRTHTSyrIBLWDxxSmEl4BIeVL47PDrgT7NKAQ5wzaf7YJ0/Ji24
 D42FjVQuW4UiHQnMkLLrr6rzgdFzA+4wH/kEscRsGVERVrv0XhMcncZEuTmimqqxnjq3
 mK81axyvpfTnlL1dYhD0+8iivmlvFbaD6d+FOR3kn+A9HYThTEsYlScGJqb6PEZJAjHE
 jCd1KBcDl1iI5T3mdDuqH+r5ELu3vZt1MlYfL2+2KWqRtQuLufFNz5+W2NLss+DaCEhD
 0Ewh0YztvPQSUsOhaHRzeCCqqeTWqu309N0aDFn8S5mjt8t5Z1aOU2eGXHBHDxRFce+j
 t3zQ==
X-Gm-Message-State: AOAM533p/hUZKAFI4RGZkAES/WtkGlMCWKkeCI6JY6eqEuqMnl594h1S
 mz9YZC/wg7iMP802kQ+7IUD1orQVkwgWZxU4APobYqv1uMW5G4JHCe/Ska9ryvMf23MG7kVrqag
 i0Pn+YKvOVEz8MB75jfWTv2LiWe37
X-Received: by 2002:a17:906:a387:: with SMTP id
 k7mr14926627ejz.408.1591981200773; 
 Fri, 12 Jun 2020 10:00:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbjRA0DxcpKz6XFn10/ujz+AwaKQghqUPzhohiLhOX8HiLCbiRGn+Y5AlGw1zWUhaDAf5BGg==
X-Received: by 2002:a17:906:a387:: with SMTP id
 k7mr14926611ejz.408.1591981200562; 
 Fri, 12 Jun 2020 10:00:00 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id h16sm3865328ejq.62.2020.06.12.09.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2020 09:59:59 -0700 (PDT)
Subject: Re: [PATCH v2 09/15] pwm: crc: Enable/disable PWM output on
 enable/disable
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20200607181840.13536-1-hdegoede@redhat.com>
 <20200607181840.13536-10-hdegoede@redhat.com>
 <20200611222029.csyo2wxof7nuhjws@taurus.defre.kleine-koenig.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1af668ef-7b42-340a-8aa2-f66c266ac6ef@redhat.com>
Date: Fri, 12 Jun 2020 18:59:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611222029.csyo2wxof7nuhjws@taurus.defre.kleine-koenig.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/12/20 12:20 AM, Uwe Kleine-K=C3=B6nig wrote:
> On Sun, Jun 07, 2020 at 08:18:34PM +0200, Hans de Goede wrote:
>> The pwm-crc code is using 2 different enable bits:
>> 1. bit 7 of the PWM0_CLK_DIV (PWM_OUTPUT_ENABLE)
>> 2. bit 0 of the BACKLIGHT_EN register
>>
>> So far we've kept the PWM_OUTPUT_ENABLE bit set when disabling the PWM,
>> this commit makes crc_pwm_disable() clear it on disable and makes
>> crc_pwm_enable() set it again on re-enable.
>>
>> This should disable the internal (divided) PWM clock and tri-state the
>> PWM output pin when disabled, saving some power.
> =

> It would be great if you could also document that disabling the PWM
> makes the output tri-state. There are a few drivers that have a
> "Limitations" section at their top. Describing that there (in the same
> format) would be the right place.
> =

> Also note that according to Thierry's conception getting a (driven)
> inactive output is the right thing for a disabled PWM.

Hmm, the tri-state thing is an assumption from my side and we
don't have any docs for this PWM controller, so I'm not sure at
all if that is true. So I think it will be better to just drop
the tri-state bit from the commit msg for the next version.

Regards,

Hans


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

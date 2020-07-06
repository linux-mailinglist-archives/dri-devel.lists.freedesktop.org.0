Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48E92160C3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 23:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31E589E08;
	Mon,  6 Jul 2020 21:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B9889E08
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 21:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594069429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u2xBI7L7/bRusaUj7ybhjX+7o8f1ehsGo1yH3AbF7cY=;
 b=c+JIbjd5vBR9/KWhbOzbTCJFNvvnacl4NtAXsnPAu3zGVYZmUOirRjpmMa+4+Hcmljnnv2
 18BqvWiDrR7O4Ye1lvHAb2Lxz83vs02tB3Cxg97yFLu0Xyv2m9CnMDGoXzpBe9990kDOix
 rCiKx3Y8O66REbZJEf9U+0n63cBKPrs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-tHQT31e4ML6Vw6Tey57Jww-1; Mon, 06 Jul 2020 17:03:47 -0400
X-MC-Unique: tHQT31e4ML6Vw6Tey57Jww-1
Received: by mail-ed1-f71.google.com with SMTP id b11so41339820edx.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 14:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BTzxL0nmmerH9+ZRGzb1Zo8OQvzYnjQNO+ZtTHpjgQg=;
 b=nyCrchVzKgE6Hzz1WTJkWwWK8SHBZXpcLazf6NDtK16S7upo87j/wCtl85Mk4K78Q3
 m3cmd9nVI930vWmKRl0r/ZbiZrAbE3iy0JX2XPEuWmB4jjnMNIB+nqvI5vQV5AzHOdmb
 2JhR1Qv7r8Uiq5bUouZRQtqfwPVPi7bcy0YomLQUo0dQ4hTO1uSwR/e3CSkgkOyJvdNI
 QnBg6BY/09FSVdiuWHgQ2Ts7Ujd1q74pUgaob9iD2iXJvGAVHPgg9/Ly0urfv5DcV9rb
 hKgCTnsnEX1LlAcKgK8LRtdSXzooMRPHCZybwj0hH7hEFQPnvyZz2315K+H+9ayTu3KS
 Y3mA==
X-Gm-Message-State: AOAM533ROmQVUMrCCxeJ7B23rkF6Gaxy8dAjj72+6ke0J+8oT+n0OeI5
 07mFCDjn4E1iPMAy8Z2E4s5A8+99N5i2jCZPzvsAIC6FADKAQaSFjFrPHdxgMcCtAYFFyao3Hdx
 eEHMRTc7u8nn2k6n/PMeuJ23T+po3
X-Received: by 2002:a17:906:f101:: with SMTP id
 gv1mr39884585ejb.327.1594069426605; 
 Mon, 06 Jul 2020 14:03:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjA0LYkm1LHaUC+ExTwhMlXLbDOBs9EYsgOgpkInQkLnvDLvDn7e4k+oEWoeQSDcDXZetHkQ==
X-Received: by 2002:a17:906:f101:: with SMTP id
 gv1mr39884570ejb.327.1594069426394; 
 Mon, 06 Jul 2020 14:03:46 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id a8sm16961111ejp.51.2020.07.06.14.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2020 14:03:45 -0700 (PDT)
Subject: Re: [PATCH v3 09/15] pwm: crc: Enable/disable PWM output on
 enable/disable
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-10-hdegoede@redhat.com>
 <20200622075509.v4jlvqeyjip6wr6c@taurus.defre.kleine-koenig.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <f1fb632d-3578-7dee-889f-71ee6787c637@redhat.com>
Date: Mon, 6 Jul 2020 23:03:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622075509.v4jlvqeyjip6wr6c@taurus.defre.kleine-koenig.org>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: linux-pwm@vger.kernel.org, Shobhit Kumar <shobhit.kumar@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/22/20 9:55 AM, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
> =

> [adding Shobhit Kumar <shobhit.kumar@intel.com> to Cc who is the author
> of this driver according to the comment on the top of the driver]
> =

> On Sat, Jun 20, 2020 at 02:17:52PM +0200, Hans de Goede wrote:
>> The pwm-crc code is using 2 different enable bits:
>> 1. bit 7 of the PWM0_CLK_DIV (PWM_OUTPUT_ENABLE)
>> 2. bit 0 of the BACKLIGHT_EN register
>>
>> So far we've kept the PWM_OUTPUT_ENABLE bit set when disabling the PWM,
>> this commit makes crc_pwm_disable() clear it on disable and makes
>> crc_pwm_enable() set it again on re-enable.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v3:
>> - Remove paragraph about tri-stating the output from the commit message,
>>    we don't have a datasheet so this was just an unfounded guess
> =

> I have the impression you spend quite some time with this driver trying
> to understand it.

Yes, my initial plan for this patch series was to just convert this driver
to atomic PWM, but it turned out to need a bit of TLC first.

> What I still think is a bit unfortunate is that there
> is quite some guesswork involved.

Actually for 99% of the changes I'm pretty sure they are correct.

This patch is the 1% where I'm not sure, and in this case I'm playing
it safe by keeping the code as is.

As the commit message tries to explain I strongly suspect that
bit 0 of the BACKLIGHT_EN register really drives a separate GPIO
pin on the PMIC which is earmarked as backlight-enable pin (many LCD
panels have both a pwm input for brightness-level and a separate
enable/disable pin).

If we can get information that my hunch here is correct then the
right thing to do would be to change things so that the PWM driver
stops poking bit 0 of the BACKLIGHT_EN register and this gets
done by the CRC GPIO driver instead. But the poking of that bit
is already happening now and since I'm not 100% sure that my hunch
is correct, the safe thing to do is to keep this as is.

Note that for the main consumer of the CRC PWM, the i915 driver
it does not matter. If we change that bit into a GPIO then the
i915 drv will need to be modified to drive the GPIO high / low when
enabling / disabling the panel. Just like it already enables/
disables the PWM when enabling / disabling the panel.

So the end result will still be bit 0 of the BACKLIGHT_EN register
going high/low on LCD panel enable/disable. So even if my hunch is
right functionality wise nothing will change. The code doing the
poking will be technically more correct, but that is all that we
would gain.

> I wonder if it would be possible to
> get the manual of that PWM. Do I understand correctly that this is IP
> from Intel? There are quite some Intel people on Cc; maybe someone can
> help/put in a good word/check and ack the changes?

IIRC last time I asked no one from the Intel folks on the Cc has access
to the Crystal Cove PMIC datasheet.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

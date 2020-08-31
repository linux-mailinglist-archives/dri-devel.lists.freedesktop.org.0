Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41452578A3
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 13:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399286E122;
	Mon, 31 Aug 2020 11:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3106E122
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598874393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5/anrGd7uQ6Xp6+JOcArKOnuOKa+n2o/F2RZEwWOhO0=;
 b=XCulRvtIAlMvT0FZVVGqpNhQ3uAGqI7fRyk1lJLs9gi5ULmpsvRPCrEMf9D1xH7JJVI1sv
 1s0H2FdlPaSPBYGd01I/7GENRP7uah/s8q5vCDU32fJ8addnAzeA1pDQUZwVC380tHO3B0
 T5Xzj63TtwEcP2ZwhYxTxz2AUEqUAEc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-pYLDVbDqNIeopUxbSUZJXg-1; Mon, 31 Aug 2020 07:46:31 -0400
X-MC-Unique: pYLDVbDqNIeopUxbSUZJXg-1
Received: by mail-ej1-f69.google.com with SMTP id i21so398861ejj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 04:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5/anrGd7uQ6Xp6+JOcArKOnuOKa+n2o/F2RZEwWOhO0=;
 b=P7AqYRTOJApzAfeAiLYgOGtnajQpX6d4hhV27Ue1MFOFFtZF5wsGiJVOUubaXWitLx
 EfjGijX7yRoNttMf4KdoS6Zs09zid26huKbJ7tp6zS7AQPg4KHaJG0qmZbm/Z+5IKrjS
 5iwwZIINhvopv4znmWIEJnSfPZF4x5TSdmbBZ46m7ixvlPP8RIivd2tvt35SqYQqFsa6
 Slv9kz3vP8bzu+bbgLwZrPsXsevL3UzuH139KjFcX8zNcGwSapO9T8Wot8s88N1L8P1e
 Ow/FQ6AmMS+UmLwJcluA6LjvmYwNnQr4B+IxsNeEqGLJgLVCMfiJ0Zqlfju/8GJctpmc
 1fsw==
X-Gm-Message-State: AOAM531rW3fawmLrSqgky3+j3EUV0fpHz0LLTY8buKKaCJ+nONPs1R7Z
 byO9rwmQ+o98J8oY4vm36l4prf1qXVRfT2JFH1rVAgWEr1rgPmMgC4Op/2/reFKleNFc4zZlCvB
 OPKGgyz5XjfMxnNwAkv6ncbkb5ged
X-Received: by 2002:a17:906:813:: with SMTP id
 e19mr750743ejd.101.1598874389854; 
 Mon, 31 Aug 2020 04:46:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTGD70Vbg4KutUamFyVZ0XcAB0Nwv9m97e2zOwuxmzF82ggTJo2ViiJafScbWW2xDAtiv7aA==
X-Received: by 2002:a17:906:813:: with SMTP id
 e19mr750723ejd.101.1598874389587; 
 Mon, 31 Aug 2020 04:46:29 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id m12sm7272015eda.51.2020.08.31.04.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2020 04:46:28 -0700 (PDT)
Subject: Re: [PATCH v8 06/17] pwm: lpss: Use pwm_lpss_restore() when restoring
 state on resume
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200830125753.230420-1-hdegoede@redhat.com>
 <20200830125753.230420-7-hdegoede@redhat.com> <20200831111006.GD1688464@ulmo>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d63a89d2-84e5-ca05-aa96-a06291503c5f@redhat.com>
Date: Mon, 31 Aug 2020 13:46:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200831111006.GD1688464@ulmo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0.004
X-Mimecast-Originator: redhat.com
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 8/31/20 1:10 PM, Thierry Reding wrote:
> On Sun, Aug 30, 2020 at 02:57:42PM +0200, Hans de Goede wrote:
>> Before this commit a suspend + resume of the LPSS PWM controller
>> would result in the controller being reset to its defaults of
>> output-freq = clock/256, duty-cycle=100%, until someone changes
>> to the output-freq and/or duty-cycle are made.
>>
>> This problem has been masked so far because the main consumer
>> (the i915 driver) was always making duty-cycle changes on resume.
>> With the conversion of the i915 driver to the atomic PWM API the
>> driver now only disables/enables the PWM on suspend/resume leaving
>> the output-freq and duty as is, triggering this problem.
> 
> Doesn't this imply that there's another bug at play here? At the PWM API
> level you're applying a state and it's up to the driver to ensure that
> the hardware state after ->apply() is what the software has requested.
> 
> If you only switch the enable state and that doesn't cause period and
> duty cycle to be updated it means that your driver isn't writing those
> registers when it should be.

Right, the driver was not committing those as it should *on resume*,
that and it skips setting the update bit on the subsequent enable,
which is an optimization which gets removed in 7/17.

Before switching the i915 driver over to atomic, when the LPSS-PWM
was used for the backlight we got the following order on suspend/resume

1. Set duty-cycle to 0%
2. Set enabled to 0
3. Save ctrl reg
4. Power-off PWM controller, it now looses all its state
5. Power-on PWM ctrl
6. Restore ctrl reg (as a single reg write)
7. Set enabled to 1, at this point one would expect the
duty/freq from the restored ctrl-reg to apply, but:
a) The resume code never sets the update bit (which this commit fixes); and
b) On applying the pwm_state with enabled=1 the code applying the
state does this (before setting the enabled bit in the ctrl reg):

	if (orig_ctrl != ctrl) {
		pwm_lpss_write(pwm, ctrl);
		pwm_lpss_write(pwm, ctrl | PWM_SW_UPDATE);
	}
and since the restore of the ctrl reg set the old duty/freq the
writes are skipped, so the update bit never gets set.

8. Set duty-cycle to the pre-suspend value (which is not 0)
this does cause a change in the ctrl-reg, so now the update flag
does get set.

Note that 1-2 and 7-8 are both done by the non atomic i915 code,
when moving the i915 code to atomic I decided that having these
2 separate steps here is non-sense, so the new i915 code just
toggles the enable bit. So in essence the new atomic PWM
i915 code drops step 1 and 8.

Dropping steps 8 means that the update bit never gets set and we
end up with the PWM running at its power-on-reset duty cycle.

You are correct in your remark to patch 7/17 that since that removes
the if (orig_ctrl != ctrl) for the writes that now step 7 will be
sufficient to get the PWM to work again. But that only takes the i915
usage into account.

What if the PWM is used through the sysfs userspace API?
Then only steps 3-6 will happen on suspend-resume and without
fixing step 6 to properly restore the PWM controller in its
pre-resume state (this patch) it will once again be running at
its power-on-reset defaults instead of the values from the
restored control register.

So at step 6, if the PWM was enabled before, we must set the update
bit, and then wait for it to clear again so the controller is
ready for subsequent updates. The waiting for it to clear again
needs to happen before or after setting the enable bit depending
on the hw generation, which leads to this patch.

I hope that helps explain why this patch is the correct thing
to do.


>> The LPSS PWM controller has a mechanism where the ctrl register value
>> and the actual base-unit and on-time-div values used are latched. When
>> software sets the SW_UPDATE bit then at the end of the current PWM cycle,
>> the new values from the ctrl-register will be latched into the actual
>> registers, and the SW_UPDATE bit will be cleared.
>>
>> The problem is that before this commit our suspend/resume handling
>> consisted of simply saving the PWM ctrl register on suspend and
>> restoring it on resume, without setting the PWM_SW_UPDATE bit.
>> When the controller has lost its state over a suspend/resume and thus
>> has been reset to the defaults, just restoring the register is not
>> enough. We must also set the SW_UPDATE bit to tell the controller to
>> latch the restored values into the actual registers.
>>
>> Fixing this problem is not as simple as just or-ing in the value which
>> is being restored with SW_UPDATE. If the PWM was enabled before we must
>> write the new settings + PWM_SW_UPDATE before setting PWM_ENABLE.
>> We must also wait for PWM_SW_UPDATE to become 0 again and depending on the
>> model we must do this either before or after the setting of PWM_ENABLE.
>>
>> All the necessary logic for doing this is already present inside
>> pwm_lpss_apply(), so instead of duplicating this inside the resume
>> handler, this commit adds a new pwm_lpss_restore() helper which mirrors
>> pwm_lpss_apply() minus the runtime-pm reference handling (which we should
>> not change on resume).
> 
> If this is all already implemented in pwm_lpss_apply(), why isn't it
> working for the suspend/resume case? It shouldn't matter that the
> consumer only changes the enable/disable state. After ->apply()
> successfully returns your hardware should be programmed with exactly
> the state that the consumer requested.

See above, apply() was trying to be smart but the restore of ctrl
on resume without setting the update bit was tricking it. That
being too smart for its own good is removed in 7/16 as you
rightfully point out. But this patch is still necessary for the
PWM controller to be in the expected state between resume and the
first apply() after resume (which may be quite a long time in
the future when using e.g. the sysfs API).

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

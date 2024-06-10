Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D26902088
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 13:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327DE10E1B2;
	Mon, 10 Jun 2024 11:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="BBUAIxwW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456CE10E1B2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:42:35 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ebdfe262feso14664261fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 04:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1718019753; x=1718624553;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uTu+bAq+6DSbTOKmrHTmCENmmWUt/DoDQafzCFL3Sw8=;
 b=BBUAIxwWq/qhUWguvpWOm8e46nZCyuF1O3crSwjwDYpyeC+UYXagov51vfULL9bWPW
 PKu1ojVwL5z3l6cNM2f2u90V/fg+DD33CcQrNWalLybOSem/cx4rbuF2PNy5u6fKSHqj
 wJUn+Xj+xUszr8hxd3/Dyu4sTG8mLqCYGfHnDoQmklTOTed8Jo057N+1fxlfexLoVOOw
 GPdZNzN8rDFJJxmU0KZJvnM2KdFKA76Z3WsZVZnaIJTJbDvOEeCgfSTnjcbZ39uVo1fr
 b19ZrUwoGxJxaZS7AKoeODpaWLG/plX/a2P9k5rWc8jkKCvDrcbpDoyA/jXMPnxA2Gdz
 baaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718019753; x=1718624553;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uTu+bAq+6DSbTOKmrHTmCENmmWUt/DoDQafzCFL3Sw8=;
 b=gEPuXkxJUZWuWRCms6zuTsTqekKHNJ22fhT/s9hsB+HWXDpiqhKuWQRR/qH2/QmALi
 X+AcL9jfd8/eBEpBeTc2drxx/gD9UYR75i7ZDVIhQg78qROl6GN0WInXgrts40O7hVwY
 TVlrc6YMhaBklYeKjz1KFg3s/oD4PqQyP4vdAl7Qf2qONk0rbEVkEgkzYKiVtSrNNJSc
 n5T8y9kV8GS/hwx7PiKcO9U6bbP9e7k3088y0PtZd+MiQLPwKpYoYxfcH8ElNylLkqqW
 fgcBwWDoHh6rtO1omhO9b2ABRvbLAijZpH6hlae3e5mLZQEx87ykNHh4XpaCoGgacBBo
 vrBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnoC4esi1wyc5vqAWAcm3C4EbF2xKvU88pK1qWP3al3dN3lNjRLPTgw35WxOz6RLkuD0KaZjlMpmT8cCIV+aDuye5DK7SDvBLGnDFEfVhl
X-Gm-Message-State: AOJu0Ywn18hZRqF825oTJvwe2XLb6/w1Rd+PTYFB6rFm+HuS8pOPhJoP
 BrOgJdtJpW8o9xMBu9Yv1LX6TzqUdq+TNYqywUeb3/AcX1tIiRI9b2dBb6jnNBc=
X-Google-Smtp-Source: AGHT+IHp6sGh1Y6KM30xckWvJTYFPXxr9kAkTsgkTNFrd8I2+KxU/iVTtMQ2niMNPOZhhJtte5xC0g==
X-Received: by 2002:a2e:bc14:0:b0:2da:a3ff:524e with SMTP id
 38308e7fff4ca-2eadce208c4mr63120231fa.9.1718019753014; 
 Mon, 10 Jun 2024 04:42:33 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c19e97dsm139380425e9.5.2024.06.10.04.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 04:42:32 -0700 (PDT)
Message-ID: <ac40fa93-cffc-4fa8-9ee7-2414faac95bf@ursulin.net>
Date: Mon, 10 Jun 2024 12:42:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Delete the live_hearbeat_fast selftest
To: "Niemiec, Krzysztof" <krzysztof.niemiec@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: andi.shyti@intel.com, nirmoy.das@intel.com, janusz.krzysztofik@intel.com, 
 chris.p.wilson@intel.com
References: <fe2vu5h7v7ooxbhwpbfsypxg5mjrnt56gc3cgrqpnhgrgce334@qfrv2skxrp47>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <fe2vu5h7v7ooxbhwpbfsypxg5mjrnt56gc3cgrqpnhgrgce334@qfrv2skxrp47>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/06/2024 17:20, Niemiec, Krzysztof wrote:
> The test is trying to push the heartbeat frequency to the limit, which
> might sometimes fail. Such a failure does not provide valuable
> information, because it does not indicate that there is something
> necessarily wrong with either the driver or the hardware.
> 
> Remove the test to prevent random, unnecessary failures from appearing
> in CI.
> 
> Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Niemiec, Krzysztof <krzysztof.niemiec@intel.com>

Just a note in passing that comma in the email display name is I believe 
not RFC 5322 compliant and there might be tools which barf on it(*). If 
you can put it in double quotes, it would be advisable.

Regards,

Tvrtko

*) Such as my internal pull request generator which uses CPAN's 
Email::Address::XS. :)

> ---
>   .../drm/i915/gt/selftest_engine_heartbeat.c   | 110 ------------------
>   1 file changed, 110 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> index ef014df4c4fc..9e4f0e417b3b 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> @@ -193,115 +193,6 @@ static int live_idle_pulse(void *arg)
>   	return err;
>   }
>   
> -static int cmp_u32(const void *_a, const void *_b)
> -{
> -	const u32 *a = _a, *b = _b;
> -
> -	return *a - *b;
> -}
> -
> -static int __live_heartbeat_fast(struct intel_engine_cs *engine)
> -{
> -	const unsigned int error_threshold = max(20000u, jiffies_to_usecs(6));
> -	struct intel_context *ce;
> -	struct i915_request *rq;
> -	ktime_t t0, t1;
> -	u32 times[5];
> -	int err;
> -	int i;
> -
> -	ce = intel_context_create(engine);
> -	if (IS_ERR(ce))
> -		return PTR_ERR(ce);
> -
> -	intel_engine_pm_get(engine);
> -
> -	err = intel_engine_set_heartbeat(engine, 1);
> -	if (err)
> -		goto err_pm;
> -
> -	for (i = 0; i < ARRAY_SIZE(times); i++) {
> -		do {
> -			/* Manufacture a tick */
> -			intel_engine_park_heartbeat(engine);
> -			GEM_BUG_ON(engine->heartbeat.systole);
> -			engine->serial++; /*  pretend we are not idle! */
> -			intel_engine_unpark_heartbeat(engine);
> -
> -			flush_delayed_work(&engine->heartbeat.work);
> -			if (!delayed_work_pending(&engine->heartbeat.work)) {
> -				pr_err("%s: heartbeat %d did not start\n",
> -				       engine->name, i);
> -				err = -EINVAL;
> -				goto err_pm;
> -			}
> -
> -			rcu_read_lock();
> -			rq = READ_ONCE(engine->heartbeat.systole);
> -			if (rq)
> -				rq = i915_request_get_rcu(rq);
> -			rcu_read_unlock();
> -		} while (!rq);
> -
> -		t0 = ktime_get();
> -		while (rq == READ_ONCE(engine->heartbeat.systole))
> -			yield(); /* work is on the local cpu! */
> -		t1 = ktime_get();
> -
> -		i915_request_put(rq);
> -		times[i] = ktime_us_delta(t1, t0);
> -	}
> -
> -	sort(times, ARRAY_SIZE(times), sizeof(times[0]), cmp_u32, NULL);
> -
> -	pr_info("%s: Heartbeat delay: %uus [%u, %u]\n",
> -		engine->name,
> -		times[ARRAY_SIZE(times) / 2],
> -		times[0],
> -		times[ARRAY_SIZE(times) - 1]);
> -
> -	/*
> -	 * Ideally, the upper bound on min work delay would be something like
> -	 * 2 * 2 (worst), +1 for scheduling, +1 for slack. In practice, we
> -	 * are, even with system_wq_highpri, at the mercy of the CPU scheduler
> -	 * and may be stuck behind some slow work for many millisecond. Such
> -	 * as our very own display workers.
> -	 */
> -	if (times[ARRAY_SIZE(times) / 2] > error_threshold) {
> -		pr_err("%s: Heartbeat delay was %uus, expected less than %dus\n",
> -		       engine->name,
> -		       times[ARRAY_SIZE(times) / 2],
> -		       error_threshold);
> -		err = -EINVAL;
> -	}
> -
> -	reset_heartbeat(engine);
> -err_pm:
> -	intel_engine_pm_put(engine);
> -	intel_context_put(ce);
> -	return err;
> -}
> -
> -static int live_heartbeat_fast(void *arg)
> -{
> -	struct intel_gt *gt = arg;
> -	struct intel_engine_cs *engine;
> -	enum intel_engine_id id;
> -	int err = 0;
> -
> -	/* Check that the heartbeat ticks at the desired rate. */
> -	if (!CONFIG_DRM_I915_HEARTBEAT_INTERVAL)
> -		return 0;
> -
> -	for_each_engine(engine, gt, id) {
> -		err = __live_heartbeat_fast(engine);
> -		if (err)
> -			break;
> -	}
> -
> -	return err;
> -}
> -
>   static int __live_heartbeat_off(struct intel_engine_cs *engine)
>   {
>   	int err;
> @@ -372,7 +263,6 @@ int intel_heartbeat_live_selftests(struct drm_i915_private *i915)
>   	static const struct i915_subtest tests[] = {
>   		SUBTEST(live_idle_flush),
>   		SUBTEST(live_idle_pulse),
> -		SUBTEST(live_heartbeat_fast),
>   		SUBTEST(live_heartbeat_off),
>   	};
>   	int saved_hangcheck;

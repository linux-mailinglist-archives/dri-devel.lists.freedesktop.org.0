Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C20390223F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 15:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A7910E3E0;
	Mon, 10 Jun 2024 13:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="L+jUegAT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B518910E46B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 13:00:42 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e78fe9fc2bso63040461fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1718024440; x=1718629240;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PiGNdAdKUJAJRkcEp4N3pF6HEQpxy6kGOhN3PURXgGU=;
 b=L+jUegATSc9RWXVSWGO+tandZRa5CcfZn6dDYYqlnfWLHT0D0hw38VUxU6TAN2vVsV
 G4uUssOOFxwUv3Cm8uO240Xjip2Wc+nObELMTg3At0wzAeU5yF5cnifLosjobYY7VKH/
 djG6y53OAc2FVNq42UMofnbmNz/0zpyVvyqiP7i/rCkUZ/qdBdibHZpDUXN9h4iIbEjJ
 PxjJSathX0j06VJuKnBR9aOawnorPA+brMYm3/Cu94TfMZNeDR8oDil0puXMuqo/3ny6
 Qf0H7Y+5XogqvHoJ+N8BqeQlsJUi4o2Wv/OxgrDqlu8L4uZ21HYsG8zbEzEB3Kz5me3c
 Bahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718024440; x=1718629240;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PiGNdAdKUJAJRkcEp4N3pF6HEQpxy6kGOhN3PURXgGU=;
 b=o/hJSd1jqYeaBh0nwVkurvKijbuFQ8R9P8BN2iOADlfzpLWiS2VobzP3RG6uakIbol
 K9uVB8B+Elhd8KBRqZ3APZiy364LI7GBIUHGdlg0gF0D2Zpjsw9xrrJiL9kXwnNsimT7
 UmILJji/fRenIzuD+qbm4mAsER7ISckN1hyqOKkZJke461fNBjzcUnSM071myEWFftME
 Ex7uRBkLIgo6wRLeKak+yDR2oKiYFoZDNmtsu3wr+0uK2/KF0+gnvNrNxtq3NIJlPPaC
 8xxAKpdMW9r00zac9RJ6fDa5MhC2qlqpIcYq+Q+iVM2UJAZKnFZIaZegvWu/Os3kE1kh
 oQ4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNfgETXIXYPI1zmwZmi/Oc83eHWofJxaxcsVsdWhj1nJfurPXjfjPAHTlJ9yyZ87mfsXswSO8gVzdG+FKQe2iOz2bgCcKl6Ql1HF9Q+L4h
X-Gm-Message-State: AOJu0YyNos9GuuovAdq0S12zKu4VxdEZvQhGFJ85RlR/GW62orUke0cR
 GaCYzbyYjvtp87OXXulFtwXkk414dE/17MxUQ0zlz8F7I1aJKUQ2HksQaoLzKc0=
X-Google-Smtp-Source: AGHT+IHWJEFvZMLwBy65ONbWoxBY8/B9uHxeyZDRKaDqDjyLB9KZ9VRsbh5n1um47b1/h8nuZNPo3Q==
X-Received: by 2002:a2e:8ec2:0:b0:2ea:e773:c5a with SMTP id
 38308e7fff4ca-2eae7730d0cmr47952821fa.9.1718024440309; 
 Mon, 10 Jun 2024 06:00:40 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42211c7b680sm14808165e9.45.2024.06.10.06.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 06:00:39 -0700 (PDT)
Message-ID: <4a669959-12c6-43f9-962c-005d22076ff3@ursulin.net>
Date: Mon, 10 Jun 2024 14:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Delete the live_hearbeat_fast selftest
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: "Niemiec, Krzysztof" <krzysztof.niemiec@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nirmoy.das@intel.com, janusz.krzysztofik@intel.com, chris.p.wilson@intel.com
References: <fe2vu5h7v7ooxbhwpbfsypxg5mjrnt56gc3cgrqpnhgrgce334@qfrv2skxrp47>
 <ac40fa93-cffc-4fa8-9ee7-2414faac95bf@ursulin.net>
 <ZmbtHOm0oNNFOgrJ@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <ZmbtHOm0oNNFOgrJ@ashyti-mobl2.lan>
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


Hi Andi,

On 10/06/2024 13:10, Andi Shyti wrote:
> Hi Tvrtko,
> 
> On Mon, Jun 10, 2024 at 12:42:31PM +0100, Tvrtko Ursulin wrote:
>> On 03/06/2024 17:20, Niemiec, Krzysztof wrote:
>>> The test is trying to push the heartbeat frequency to the limit, which
>>> might sometimes fail. Such a failure does not provide valuable
>>> information, because it does not indicate that there is something
>>> necessarily wrong with either the driver or the hardware.
>>>
>>> Remove the test to prevent random, unnecessary failures from appearing
>>> in CI.
>>>
>>> Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
>>> Signed-off-by: Niemiec, Krzysztof <krzysztof.niemiec@intel.com>
>>
>> Just a note in passing that comma in the email display name is I believe not
>> RFC 5322 compliant and there might be tools which barf on it(*). If you can
>> put it in double quotes, it would be advisable.
> 
> yes, we discussed it with Krzysztof, I noticed it right after I
> submitted the code.
> 
>> Regards,
>>
>> Tvrtko
>>
>> *) Such as my internal pull request generator which uses CPAN's
>> Email::Address::XS. :)
> 
> If we are in time, we can fix it as Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> 
> Sorry about this oversight,

It's not a big deal (it isn't the first and only occurence) and no need 
to do anything more than correct the display name going forward.

Regards,

Tvrtko

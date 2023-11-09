Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF97E62CD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 05:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6718F10E1AD;
	Thu,  9 Nov 2023 04:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113EE10E1AD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 04:23:58 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-778711ee748so28936985a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 20:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699503837; x=1700108637; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Xxr55e6xvOo9DSvCZX4hr2RWmfnTSdp4kCAcBQGQTB4=;
 b=ZYy7jrDG12DWGyRJeZirg9PcbiLPOjM/yIusRzbUStm3FPP2nOPPtNR8U9g51TZ1yB
 rBb+KHK1BPAFwFFLlMqJmDvPuiIbXDQx0Lr91amEUa0z6ZRmGU8PCLI+nlbxCpeLSQ/q
 NoqhYyqkyTFT32hakLjj3KXGMIMwV6ylJ2inIpzPjco1vcOS+J67OAbjwv7yc6dUsVMJ
 qGXOTO8hTeOFfeECBqa8S2xHw+PFqzYM+QOh79NQIAzi99Pz2GgGyw3ntKlJo15ZIN/L
 C68nCUppW31ephfAlb6Jb2Tm0gaFhOUNoyi8LKW+Re6Pv9U7cw64rG0a8vZLy122RzYI
 HtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699503837; x=1700108637;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xxr55e6xvOo9DSvCZX4hr2RWmfnTSdp4kCAcBQGQTB4=;
 b=sBQVoLvpQX0Ku7IUWwUEUlwxkvpd4YKIU5d4kwaMnjbuQoEPHFjkWzugSNxDYrbp3o
 uWvKprHzCZbxOEr7w3MFzF/s6dU1VhxMK6gnRL5uWmXpYTlNxM9ul0MTPtXaR4YuJTV5
 X2U6wOHVbU7L43DTqdPi7fMqj9u92J0bfkiteZpF+kF0w9toGNAYmkxI1Whr8oNsgbW7
 zKRZL4tijXz6OytomelAgaQTw+/eNvQuuA6tybKl8e8GXUqsAibFnV/ZTUzCwMqBFxZ9
 6Sbq8yznbOOkHS6li7KvMHN6wVQEWkOQAMlYxzrWnhlCNDsu8YZXdpkF9ee6nqyhmcYQ
 idiA==
X-Gm-Message-State: AOJu0YxFYpn9yjprSwm0RFwB3y4Y1BhZC+f+uo3O67f8U4yCI0ZDp521
 NsPM6WMpjeL5Lxb2u+uW8hk=
X-Google-Smtp-Source: AGHT+IE4dXxmxuSH4NgGbMTVmz6MqPuuULS0TJLiMp5uFDMHXCwxVZ7loOVBoFANafpDOqg/aKJpaQ==
X-Received: by 2002:a05:620a:4606:b0:778:9341:6707 with SMTP id
 br6-20020a05620a460600b0077893416707mr4047040qkb.22.1699503836977; 
 Wed, 08 Nov 2023 20:23:56 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 bj28-20020a05620a191c00b007756f60bcacsm1701201qkb.79.2023.11.08.20.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 20:23:56 -0800 (PST)
Message-ID: <4c64c9f2-78b4-4309-8cca-5dbd0e5b445e@gmail.com>
Date: Wed, 8 Nov 2023 23:23:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.2
Subject: Re: [PATCH] drm/sched: fix potential page fault in
 drm_sched_job_init()
Content-Language: en-CA, en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 christian.koenig@amd.com
References: <20231108022716.15250-1-dakr@redhat.com>
 <fff7a8db-be77-4c5e-a4dd-82b254adbb78@gmail.com>
 <242188d1-2232-4e37-8ad7-f2cdebacddd9@redhat.com>
From: Luben Tuikov <ltuikov89@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <242188d1-2232-4e37-8ad7-f2cdebacddd9@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pBjJ593y9L801m200aPLQuPY"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pBjJ593y9L801m200aPLQuPY
Content-Type: multipart/mixed; boundary="------------w01BAv4W9TeS1wRW73GqJbI0";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 christian.koenig@amd.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <4c64c9f2-78b4-4309-8cca-5dbd0e5b445e@gmail.com>
Subject: Re: [PATCH] drm/sched: fix potential page fault in
 drm_sched_job_init()
References: <20231108022716.15250-1-dakr@redhat.com>
 <fff7a8db-be77-4c5e-a4dd-82b254adbb78@gmail.com>
 <242188d1-2232-4e37-8ad7-f2cdebacddd9@redhat.com>
In-Reply-To: <242188d1-2232-4e37-8ad7-f2cdebacddd9@redhat.com>

--------------w01BAv4W9TeS1wRW73GqJbI0
Content-Type: multipart/mixed; boundary="------------WJkW7DqQ0Id5O0LEe1vv7Qqq"

--------------WJkW7DqQ0Id5O0LEe1vv7Qqq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-08 19:09, Danilo Krummrich wrote:
> On 11/8/23 06:46, Luben Tuikov wrote:
>> Hi,
>>
>> Could you please use my gmail address, the one one I'm responding from=
--I don't want
>> to miss any DRM scheduler patches. BTW, the luben.tuikov@amd.com email=
 should bounce
>> as undeliverable.
>>
>> On 2023-11-07 21:26, Danilo Krummrich wrote:
>>> Commit 56e449603f0a ("drm/sched: Convert the GPU scheduler to variabl=
e
>>> number of run-queues") introduces drm_err() in drm_sched_job_init(), =
in
>>> order to indicate that the given entity has no runq, however at this
>>> time job->sched is not yet set, likely to be NULL initialized, and he=
nce
>>> shouldn't be used.
>>>
>>> Replace the corresponding drm_err() call with pr_err() to avoid a
>>> potential page fault.
>>>
>>> While at it, extend the documentation of drm_sched_job_init() to
>>> indicate that job->sched is not a valid pointer until
>>> drm_sched_job_arm() has been called.
>>>
>>> Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to variabl=
e number of run-queues")
>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
>>> index 27843e37d9b7..dd28389f0ddd 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -680,6 +680,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>>    * This function returns -ENOENT in this case (which probably shoul=
d be -EIO as
>>>    * a more meanigful return value).
>>>    *
>>> + * Note that job->sched is not a valid pointer until drm_sched_job_a=
rm() has
>>> + * been called.
>>> + *
>>
>> Good catch!
>>
>> Did you actually get this to page-fault and have a kernel log?
>=20
> No, I just found it because I was about to make the same mistake.
>=20
>>
>> I'm asking because we see it correctly set in this kernel log coming f=
rom AMD,
>=20
> I think that's because amdgpu just sets job->sched to *some* scheduler =
instance after
> job allocation [1].
>=20
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/=
amdgpu/amdgpu_job.c#L108
>=20
>>
>> [   11.886024] amdgpu 0000:0a:00.0: [drm] *ERROR* drm_sched_job_init: =
entity has no rq!
>>
>> in this email,
>> https://lore.kernel.org/r/CADnq5_PS64jYS_Y3kGW27m-kuWP+FQFiaVcOaZiB=3D=
JLSgPnXBQ@mail.gmail.com
>>
>>>    * Returns 0 for success, negative error code otherwise.
>>>    */
>>>   int drm_sched_job_init(struct drm_sched_job *job,
>>> @@ -691,7 +694,7 @@ int drm_sched_job_init(struct drm_sched_job *job,=

>>>   		 * or worse--a blank screen--leave a trail in the
>>>   		 * logs, so this can be debugged easier.
>>>   		 */
>>> -		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
>>> +		pr_err("%s: entity has no rq!\n", __func__);
>>
>> Is it feasible to do something like the following?
>>
>> 		dev_err(job->sched ? job->sched->dev : NULL, "%s: entity has no rq!\=
n", __func__);
>=20
> I don't think that's a good idea. Although I'd assume that every driver=
 zero-initializes its job
> structures, I can't see a rule enforcing that. Hence, job->sched can be=
 a random value until
> drm_sched_job_arm() is called.

Okay. However, when using pr_err() we're losing "[drm] *ERROR* " prefix a=
nd we scan for that
in the logs to quickly find the cause of the error.

Perhaps we can define pr_fmt() and also include "*ERROR*" so that we can =
get the desired result
as the attached patch shows?
--=20
Regards,
Luben

--------------WJkW7DqQ0Id5O0LEe1vv7Qqq
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-sched-fix-potential-page-fault-in-drm_sched_job_.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-sched-fix-potential-page-fault-in-drm_sched_job_.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAxZjNlZDk3OTQ3YTQwNmE1NTVhM2VmZWEwNWNhYjY3ZGE5NDE3MmU3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBEYW5pbG8gS3J1bW1yaWNoIDxkYWtyQHJlZGhhdC5j
b20+CkRhdGU6IFdlZCwgOCBOb3YgMjAyMyAwMzoyNjowNyArMDEwMApTdWJqZWN0OiBbUEFU
Q0hdIGRybS9zY2hlZDogZml4IHBvdGVudGlhbCBwYWdlIGZhdWx0IGluIGRybV9zY2hlZF9q
b2JfaW5pdCgpCgpDb21taXQgNTZlNDQ5NjAzZjBhICgiZHJtL3NjaGVkOiBDb252ZXJ0IHRo
ZSBHUFUgc2NoZWR1bGVyIHRvIHZhcmlhYmxlCm51bWJlciBvZiBydW4tcXVldWVzIikgaW50
cm9kdWNlcyBkcm1fZXJyKCkgaW4gZHJtX3NjaGVkX2pvYl9pbml0KCksIGluCm9yZGVyIHRv
IGluZGljYXRlIHRoYXQgdGhlIGdpdmVuIGVudGl0eSBoYXMgbm8gcnVucSwgaG93ZXZlciBh
dCB0aGlzCnRpbWUgam9iLT5zY2hlZCBpcyBub3QgeWV0IHNldCwgbGlrZWx5IHRvIGJlIE5V
TEwgaW5pdGlhbGl6ZWQsIGFuZCBoZW5jZQpzaG91bGRuJ3QgYmUgdXNlZC4KClJlcGxhY2Ug
dGhlIGNvcnJlc3BvbmRpbmcgZHJtX2VycigpIGNhbGwgd2l0aCBwcl9lcnIoKSB0byBhdm9p
ZCBhCnBvdGVudGlhbCBwYWdlIGZhdWx0LgoKV2hpbGUgYXQgaXQsIGV4dGVuZCB0aGUgZG9j
dW1lbnRhdGlvbiBvZiBkcm1fc2NoZWRfam9iX2luaXQoKSB0bwppbmRpY2F0ZSB0aGF0IGpv
Yi0+c2NoZWQgaXMgbm90IGEgdmFsaWQgcG9pbnRlciB1bnRpbApkcm1fc2NoZWRfam9iX2Fy
bSgpIGhhcyBiZWVuIGNhbGxlZC4KCnYyOiBBZGQgcHJfZm10IHRvIGRybV9wcmludGsuaC4g
QWRkICIqRVJST1IqIiB0byB0aGlzIHByX2VycigpIG1lc3NhZ2UuIChMdWJlbikKCkZpeGVz
OiA1NmU0NDk2MDNmMGEgKCJkcm0vc2NoZWQ6IENvbnZlcnQgdGhlIEdQVSBzY2hlZHVsZXIg
dG8gdmFyaWFibGUgbnVtYmVyIG9mIHJ1bi1xdWV1ZXMiKQpTaWduZWQtb2ZmLWJ5OiBEYW5p
bG8gS3J1bW1yaWNoIDxkYWtyQHJlZGhhdC5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDIzMTEwODAyMjcxNi4xNTI1MC0xLWRh
a3JAcmVkaGF0LmNvbQpTaWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx0dWlrb3Y4OUBn
bWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMg
fCA1ICsrKystCiBpbmNsdWRlL2RybS9kcm1fcHJpbnQuaCAgICAgICAgICAgICAgICB8IDkg
KysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21h
aW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCmluZGV4IGNk
MGRjM2Y4MWQwNWYwLi5iZDEzZDRjOGMzODVhOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9tYWluLmMKQEAgLTY4MCw2ICs2ODAsOSBAQCBFWFBPUlRfU1lNQk9MKGRy
bV9zY2hlZF9yZXN1Ym1pdF9qb2JzKTsKICAqIFRoaXMgZnVuY3Rpb24gcmV0dXJucyAtRU5P
RU5UIGluIHRoaXMgY2FzZSAod2hpY2ggcHJvYmFibHkgc2hvdWxkIGJlIC1FSU8gYXMKICAq
IGEgbW9yZSBtZWFuaWdmdWwgcmV0dXJuIHZhbHVlKS4KICAqCisgKiBOb3RlIHRoYXQgam9i
LT5zY2hlZCBpcyBub3QgYSB2YWxpZCBwb2ludGVyIHVudGlsIGRybV9zY2hlZF9qb2JfYXJt
KCkgaGFzCisgKiBiZWVuIGNhbGxlZC4KKyAqCiAgKiBSZXR1cm5zIDAgZm9yIHN1Y2Nlc3Ms
IG5lZ2F0aXZlIGVycm9yIGNvZGUgb3RoZXJ3aXNlLgogICovCiBpbnQgZHJtX3NjaGVkX2pv
Yl9pbml0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2IsCkBAIC02OTEsNyArNjk0LDcgQEAg
aW50IGRybV9zY2hlZF9qb2JfaW5pdChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iLAogCQkg
KiBvciB3b3JzZS0tYSBibGFuayBzY3JlZW4tLWxlYXZlIGEgdHJhaWwgaW4gdGhlCiAJCSAq
IGxvZ3MsIHNvIHRoaXMgY2FuIGJlIGRlYnVnZ2VkIGVhc2llci4KIAkJICovCi0JCWRybV9l
cnIoam9iLT5zY2hlZCwgIiVzOiBlbnRpdHkgaGFzIG5vIHJxIVxuIiwgX19mdW5jX18pOwor
CQlwcl9lcnIoIipFUlJPUiogJXM6IGVudGl0eSBoYXMgbm8gcnEhXG4iLCBfX2Z1bmNfXyk7
CiAJCXJldHVybiAtRU5PRU5UOwogCX0KIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X3ByaW50LmggYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAppbmRleCBhOTNhMzg3ZjhhMWEx
NS4uMDEzMmQ1NjNjOGNmYjkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5o
CisrKyBiL2luY2x1ZGUvZHJtL2RybV9wcmludC5oCkBAIC0yNiw2ICsyNiwxNSBAQAogI2lm
bmRlZiBEUk1fUFJJTlRfSF8KICNkZWZpbmUgRFJNX1BSSU5UX0hfCiAKKy8qIERlZmluZSB0
aGlzIGJlZm9yZSBpbmNsdWRpbmcgbGludXgvcHJpbnRrLmgsIHNvIHRoYXQgdGhlIGZvcm1h
dAorICogc3RyaW5nIGluIHByXyooKSBtYWNyb3MgaXMgY29ycmVjdGx5IHNldCBmb3IgRFJN
LiBJZiBhIGZpbGUgd2FudHMKKyAqIHRvIGRlZmluZSB0aGlzIHRvIHNvbWV0aGluZyBlbHNl
LCBpdCBzaG91bGQgZG8gc28gYmVmb3JlIGluY2x1ZGluZworICogdGhpcyBoZWFkZXIgZmls
ZS4KKyAqLworI2lmbmRlZiBwcl9mbXQKKyNkZWZpbmUgcHJfZm10KGZtdCkgIltkcm1dICIg
Zm10CisjZW5kaWYKKwogI2luY2x1ZGUgPGxpbnV4L2NvbXBpbGVyLmg+CiAjaW5jbHVkZSA8
bGludXgvcHJpbnRrLmg+CiAjaW5jbHVkZSA8bGludXgvc2VxX2ZpbGUuaD4KCmJhc2UtY29t
bWl0OiA4ZDg4ZTRjZGNlNGY1YzU2ZGU1NTE3NGE0ZDMyZWE5YzA2ZjdmYTY2Ci0tIAoyLjQy
LjEKCg==
--------------WJkW7DqQ0Id5O0LEe1vv7Qqq
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------WJkW7DqQ0Id5O0LEe1vv7Qqq--

--------------w01BAv4W9TeS1wRW73GqJbI0--

--------------pBjJ593y9L801m200aPLQuPY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZUxe0wUDAAAAAAAKCRBMFUeUMaM0r8f3
AQC5kte02GIsHRetcv5Ev0OvNQg8iQ8rATS4jH1pJZNdbwD9EYkGeQILUOm3R63fkp1bZjoihriL
jYRivFay8vHuQgE=
=SaAW
-----END PGP SIGNATURE-----

--------------pBjJ593y9L801m200aPLQuPY--

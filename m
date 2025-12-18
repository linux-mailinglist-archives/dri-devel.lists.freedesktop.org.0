Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6549CCD0DC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 18:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F8310E953;
	Thu, 18 Dec 2025 17:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EA4KnGiI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A82210E953
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 17:58:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5E0C7C1A5B5;
 Thu, 18 Dec 2025 17:58:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E0C6260715;
 Thu, 18 Dec 2025 17:58:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 68475102F0B52; Thu, 18 Dec 2025 18:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766080728; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1hbIBKdKugDdLcbog5liFmHbSOywKZqx97/+7LDteFk=;
 b=EA4KnGiIFVJ3wBud8Tlp2OgOcJYTJNDhttg20Pw9KXyAX3lX7Ah99/2EV25OYeD2e+LXTb
 ik4TchexSQvDWlthbt02ml4txsUTdGKBNuNjzAj1vrxwHYKPEg79ED/2TuYnngACBiV4Rd
 UtFGDTMbhMAaWmEExAeT0vzTkc2ECwX5huJL9bfIFHOszb3XQLTIMyaZ6mAUHjUtqdg3qa
 Dt3vzOlPqGKVBrTUHmnsqdzeuy40mMDA/fCRNCRMoO7L/7ofbkTBNjPFLSOBe9laP/KxRE
 kw6prxIe6Bi5nsq1XH7HKmeH987L5cj1dieio63CRnkB6NkiuLSR/BpESWzQOQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:58:45 +0100
Message-Id: <DF1JD8XIPQ89.2GGSIHVBHB2ZP@bootlin.com>
Subject: Re: [PATCH RESEND v2 06/32] drm/vkms: Introduce configfs for plane
 name
Cc: "Haneen Mohammed" <hamohammed.sa@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Melissa Wen" <melissa.srw@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>,
 <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-6-a49a2d4cba26@bootlin.com>
 <aRXpeE2fCRj4uyBY@fedora>
 <f2ee5ce4-418a-4170-9b0f-26bac570e72e@bootlin.com>
In-Reply-To: <f2ee5ce4-418a-4170-9b0f-26bac570e72e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

On Mon Nov 17, 2025 at 10:56 AM CET, Louis Chauvet wrote:
>
>
> On 11/13/25 14:21, Jos=C3=A9 Exp=C3=B3sito wrote:
>> On Wed, Oct 29, 2025 at 03:36:43PM +0100, Louis Chauvet wrote:
>>> Planes can have name, create a plane attribute to configure it. Current=
ly
>>> plane name is mainly used in logs.
>>>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> ---
>>>   Documentation/gpu/vkms.rst           |  3 ++-
>>>   drivers/gpu/drm/vkms/vkms_configfs.c | 32 +++++++++++++++++++++++++++=
+++++
>>>   2 files changed, 34 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
>>> index 3574e01b928d..1fe6e420c963 100644
>>> --- a/Documentation/gpu/vkms.rst
>>> +++ b/Documentation/gpu/vkms.rst
>>> @@ -87,10 +87,11 @@ Start by creating one or more planes::
>>>
>>>     sudo mkdir /config/vkms/my-vkms/planes/plane0
>>>
>>> -Planes have 1 configurable attribute:
>>> +Planes have 2 configurable attributes:
>>>
>>>   - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as th=
ose
>>>     exposed by the "type" property of a plane)
>>> +- name: Name of the plane
>>
>> I'd like to mention again my comment on limiting the name to a set of
>> well-known characters [1].
>>
>> The reason is that, in libinput, we had a format string vulnerability
>> due to the kernel exposing devices with names containing strings like
>> "%s" in the name (CVE-2022-1215):
>> https://gitlab.freedesktop.org/libinput/libinput/-/issues/752
>>
>> In my opinion, we should avoid surprising user-space too much and allow
>> only a set of "safe" characters.
>>
>> Maybe I'm too cautious, as this is valid code, but I'd like to bring up
>> the discussion again to see if someone else agrees or disagrees.
>>
>> [1] https://lore.kernel.org/all/aPtgCUX5kixTh2ua@fedora/
>
> Sorry, I completely forgot to send my mail drafts for your comments...
> It was mainly "Will do for v2" except here:
>
>
> For me this should not be a kernel concern, when the userspace read a
> file/folder name, it can be anything, so the userspace should do the
> proper sanitization.
>
> For libinput it was "easy" to exploit because unauthenticated users can
> create any device name, but for VKMS, you must already be a
> "privilegied" user (can write to configfs). I don't see the added value
> for a kernel-side limitation, it will be more code for almost no
> security improvement.
>
> If you really think this is important, do you know if the kernel have a
> helper to do this kind of checks? I did not found anything in strings.h
> and I don't want to implement it in VKMS.

I tend to agree with Jos=C3=A9 here, being strict on accepted input is good=
.

I guess you can stick to [A-Za-z0-9_-], then if there is a good reason to
relax the constraint it can be done later.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

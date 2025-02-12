Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB68A331AD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 22:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCAD10E99B;
	Wed, 12 Feb 2025 21:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19B010E28B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 20:00:57 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-5fcae429587so50241eaf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 12:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739390457; x=1739995257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ty55KN5TBvbN+OmRm4Xf1XcryTkekgKbpKoNCFiEowc=;
 b=BkjNcsXHTqW4mg9BFJrqXqYWS5V3UH85NNFRwhBb4wNsJqt+3l8BUEPsz4gJdtJ/uF
 GkhHmz7Ck0sK+r1ESs1d6R3cwGKCavrCJC4SuWZ9z58mliw61/cCOtFMMEryAT0oNak4
 qx9284HiNwdk6U3fO5UpiV+KZ8i5vrSw6bl/IRsIamTN4MSSRZ5HXjQuI/Wyhjv5wztF
 jutndXfFauCcRGNTcd6+xBlhuPBLdiFrs7AdfSIpoGtyl8bYa+JUeu6pWpw2N4kEgZue
 rsSmqWoqTY/FHN1sTsC66BmM44iLrD2V8z/cNiZxQk5MxChdc6pf9SuYcoMxY87/S0s2
 EZGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxp8vxB9duVkt2SjRQjHxwbJgmEMG+PPxOcCI3R7CUqVIxYwPo1OoJ1Bg/EWm5UauqrLGTxdiKSOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi5MH8+8N1Xa69WFdn9cFHSvfeqL2+gYmNXVuOyurtCU85xV6F
 IvVQ8i2ocv7XFs7Zi5RqRbnpSaJUivY0KsM3z9YNRRqpedI2Pg/X
X-Gm-Gg: ASbGncukK4dv3biKyYLG/oNslRzZg3MsXmAhatnUl1gEXmafTh0JK2m+Qcxn902+zgD
 Ejunlb6ivXDvkS81cVusS7xxcFzUQXZDZ+nf1hWYvfVhditxt+ViHKKM+U1FZ0TkrZnAnZQ5mT9
 IftWOsv8YAhHTZDfm1+oB8zY45tTssc4XVXfZo+arRwwQheEkb0+Uie3Ld2EG9uGh26SB8d/cN3
 nrnHiRWESTeQ9S6PNlb8aMucbF98Bm+ODsp7oVlx+tKMiTy9GhXDKxZmF2HuPhFujG4OnlFXeOf
 Q90rQ2wppwn2TyKx
X-Google-Smtp-Source: AGHT+IGwBXZTwtaL7NNRt+QXA+SEREgwN9UnIGCuP6Ps5/KzjD/6y7JCL5eimEfX4dk7oukXCa/CZQ==
X-Received: by 2002:a05:6870:ed94:b0:29e:43ce:a172 with SMTP id
 586e51a60fabf-2b8f8e10fa5mr328542fac.28.1739390456760; 
 Wed, 12 Feb 2025 12:00:56 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-726afa4d12bsm4848401a34.59.2025.02.12.12.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 12:00:56 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Edwards <uejji@uejji.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Handheld gaming PC panel orientation quirks
Date: Wed, 12 Feb 2025 19:59:31 +0000
Message-ID: <20250212195934.91669-2-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e64c6778-9698-4970-a3c3-af3aabc232be@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Feb 2025 21:38:44 +0000
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

Hello, Thomas and Hans.

On Wed, Feb 12, 2025 at 5:14 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 12-Feb-25 12:11 PM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 12.02.25 um 11:51 schrieb Hans de Goede:
>>> Hi Thomas,
>>>
>>> On 11-Feb-25 2:55 PM, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 24.01.25 um 21:46 schrieb John Edwards:
>>>>> Hello.
>>>>>
>>>>> I am submitting a small number of patches to add panel rotation quirks for
>>>>> a few handheld gaming PCs.  These patches were created by the SteamFork
>>>>> team and are in daily use by us and/or members of our community.
>>>>>
>>>>> The following devices are covered by these patches:
>>>>> 1: AYANEO 2S
>>>>> 2: AYANEO Flip DS, AYANEO Flip KB
>>>>> 3: AYANEO Slide, Antec Core HS
>>>>> 4: GPD Win 2 (with correct DMI strings)
>>>>> 5: OneXPlayer Mini (Intel)
>>>>>
>>>>> Thank you for your consideration and for taking the time to review these
>>>>> patches.
>>>> Did you ever receive any response to this series? If not, then
>>>>
>>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> I had the following remark for 3 new entries added in patches 2/5 + 3/5:
>>>
>>> "Since this '}' is closing the .matches initializer it should be indented 2 tabs"
>>>
>>> With that fixed, you can add my:
>>>
>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> to the entire series.
>>>
>>>> for the series. Let me know if you need assistance for getting the patch files merged.
>>> Normally I pickup/merge these panel orientation quirks, but I've been swamped
>>> which is why these have just been sitting on the list.
>>>
>>> Thomas, I would appreciate it if you can merge the set into drm-misc-fixes, with
>>> the 3 minor indentation issues fixed.
>>
>> Sure, no problem. I'll wait for John to provide an update. Otherwise, I'll fix it myself while merging the series.
>
> Great thank you.
>
> Note in the review comments I said that we could likely fixup the indentation
> issues while merging. If you prefer a new version from John that is fine too,
> but we need to make clear to John what we want :)

Thank you both for your comments and feedback.  I am more than happy to
provide a v3 with the noted changes if requested.

We have no other planned changes for this patch series, so if you wish to
implement the changes while merging that is also acceptable to us.

Thank you both again.

John Edwards



>>>>> v2:
>>>>> - Minor rewording of commit messages
>>>>> - Include Tested-by tag for Paco Avelar in AYANEO Flip DS/KB patch
>>>>> - Add OneXPlayer Mini (Intel) patch
>>>>>
>>>>> v1:
>>>>> https://lore.kernel.org/dri-devel/20250116155049.39647-2-uejji@uejji.net/
>>>>>
>>>>> Andrew Wyatt (5):
>>>>>     drm: panel-orientation-quirks: Add support for AYANEO 2S
>>>>>     drm: panel-orientation-quirks: Add quirks for AYA NEO Flip DS and KB
>>>>>     drm: panel-orientation-quirks: Add quirk for AYA NEO Slide
>>>>>     drm: panel-orientation-quirks: Add new quirk for GPD Win 2
>>>>>     drm: panel-orientation-quirks: Add quirk for OneXPlayer Mini (Intel)
>>>>>
>>>>>    .../gpu/drm/drm_panel_orientation_quirks.c    | 40 ++++++++++++++++++-
>>>>>    1 file changed, 38 insertions(+), 2 deletions(-)
>>>>>
>>
>

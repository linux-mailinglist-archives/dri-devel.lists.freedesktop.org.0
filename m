Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B9BA35155
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 23:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0237F10E0C9;
	Thu, 13 Feb 2025 22:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B85210E0C9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 22:34:02 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3f3d1280f3dso465331b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739486041; x=1740090841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=81wnSjILo7L8IbxC+2Cd+JkEGip+G0Mn0ycfSPNnmds=;
 b=uXcVDsVt1DAM7KfVVhf04PmuMXwfowxFtiJCrwl8Hi6GOzi1MTrX5Q8bVcZSIQBC+n
 gzMC9fiOJvr8W0Ef7KCDOFWaAlybjKyICgQKk/S356Ty3z4kfEREtFsJAvZ66WbyYxD6
 qP3G+oM+wN/XZRW8kRVxYRYsNEDc0GI4j5C+WYjWTCRIRiZJN7utomQl7jzQ3Ocjpro2
 lBmjCkCfkT6fqhKFs7JnUjzM1dnwxUPXWoeCVp1SFeXttBjM7Zx+9s2iDBHvPjycef/i
 /jnTCOQAmyeX1/8E0pGSiwIkGjOz8sTmcju5FPEX7cSpT9W0J3eSxbVPmwRuwUsIp0i2
 GQqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa1NIDgM4a3O8u1BDWqCulHqOXs41TTjc1PAtBpLSLGNwtYrI+uHQ0zK5E4aYjjmqr1u8NgHXsdj0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybpethhsUJQHhwP1PcHFpAlctw6dyrzESqefdwSUEjtaUvLlHQ
 RAD3lhjsvSFmXq6ybXymtMkRccfBwJ0se6Zz7eXdz2NeOSqZmnv7
X-Gm-Gg: ASbGncugYZ4+mTo4emhyBTOZJvMGz8sfywxpCpzpruY+qPIODMKPdeMwcbIUc24qhuQ
 HuhWzZzfdxthYk0MDrWYIZlGUkMQipx1uHCGnf2d75WeH/FJ9PZJ9+b0maVy4AaIsDVxNBCUpKA
 +EFXWwpMDsSxZbtQH/2xOLn974WHQu3ZVCrij/vNt//EitvyZ+0XmyD+FX5JDNXyl0FPk5D3dME
 AeySPMBJzoAFqBAJWL6fIa38bZje1nxcDIwMOQb4xAZwBl1yCQ4skxzet6aiY+ttmG8knMwP8Me
 mRQT25stLKqyFpjo
X-Google-Smtp-Source: AGHT+IGwDm5Bd8dSS+OXg1gRfQp7hnq3TpySqSmK3pld9i6zPTZM6FNAnjW9E0HYWYUW0jK44W0EIA==
X-Received: by 2002:a05:6808:1308:b0:3f3:beb3:dd98 with SMTP id
 5614622812f47-3f3d8dcbf60mr3345552b6e.14.1739486041598; 
 Thu, 13 Feb 2025 14:34:01 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f3da92bb08sm930297b6e.2.2025.02.13.14.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 14:34:00 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Handheld gaming PC panel orientation quirks
Date: Thu, 13 Feb 2025 22:33:44 +0000
Message-ID: <20250213223348.93593-1-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f67a3650-9b7c-49e0-b5df-5694a5d06a66@suse.de>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hello, Thomas.

On Thu, Feb 13, 2025 at 1:35 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
>Am 12.02.25 um 20:59 schrieb John Edwards:
>> Hello, Thomas and Hans.
>>
>> On Wed, Feb 12, 2025 at 5:14 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>> Hi,
>>>
>>> On 12-Feb-25 12:11 PM, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 12.02.25 um 11:51 schrieb Hans de Goede:
>>>>> Hi Thomas,
>>>>>
>>>>> On 11-Feb-25 2:55 PM, Thomas Zimmermann wrote:
>>>>>> Hi
>>>>>>
>>>>>> Am 24.01.25 um 21:46 schrieb John Edwards:
>>>>>>> Hello.
>>>>>>>
>>>>>>> I am submitting a small number of patches to add panel rotation quirks for
>>>>>>> a few handheld gaming PCs.  These patches were created by the SteamFork
>>>>>>> team and are in daily use by us and/or members of our community.
>>>>>>>
>>>>>>> The following devices are covered by these patches:
>>>>>>> 1: AYANEO 2S
>>>>>>> 2: AYANEO Flip DS, AYANEO Flip KB
>>>>>>> 3: AYANEO Slide, Antec Core HS
>>>>>>> 4: GPD Win 2 (with correct DMI strings)
>>>>>>> 5: OneXPlayer Mini (Intel)
>>>>>>>
>>>>>>> Thank you for your consideration and for taking the time to review these
>>>>>>> patches.
>>>>>> Did you ever receive any response to this series? If not, then
>>>>>>
>>>>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> I had the following remark for 3 new entries added in patches 2/5 + 3/5:
>>>>>
>>>>> "Since this '}' is closing the .matches initializer it should be indented 2 tabs"
>>>>>
>>>>> With that fixed, you can add my:
>>>>>
>>>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>>>>
>>>>> to the entire series.
>>>>>
>>>>>> for the series. Let me know if you need assistance for getting the patch files merged.
>>>>> Normally I pickup/merge these panel orientation quirks, but I've been swamped
>>>>> which is why these have just been sitting on the list.
>>>>>
>>>>> Thomas, I would appreciate it if you can merge the set into drm-misc-fixes, with
>>>>> the 3 minor indentation issues fixed.
>>>> Sure, no problem. I'll wait for John to provide an update. Otherwise, I'll fix it myself while merging the series.
>>> Great thank you.
>>>
>>> Note in the review comments I said that we could likely fixup the indentation
>>> issues while merging. If you prefer a new version from John that is fine too,
>>> but we need to make clear to John what we want :)
>> Thank you both for your comments and feedback.  I am more than happy to
>> provide a v3 with the noted changes if requested.
>>
>> We have no other planned changes for this patch series, so if you wish to
>> implement the changes while merging that is also acceptable to us.
>
> Please send an update.

I have just submitted v3 with the requested changes.

Thank you.

John Edwards


>>>>>>> v2:
>>>>>>> - Minor rewording of commit messages
>>>>>>> - Include Tested-by tag for Paco Avelar in AYANEO Flip DS/KB patch
>>>>>>> - Add OneXPlayer Mini (Intel) patch
>>>>>>>
>>>>>>> v1:
>>>>>>> https://lore.kernel.org/dri-devel/20250116155049.39647-2-uejji@uejji.net/
>>>>>>>
>>>>>>> Andrew Wyatt (5):
>>>>>>>      drm: panel-orientation-quirks: Add support for AYANEO 2S
>>>>>>>      drm: panel-orientation-quirks: Add quirks for AYA NEO Flip DS and KB
>>>>>>>      drm: panel-orientation-quirks: Add quirk for AYA NEO Slide
>>>>>>>      drm: panel-orientation-quirks: Add new quirk for GPD Win 2
>>>>>>>      drm: panel-orientation-quirks: Add quirk for OneXPlayer Mini (Intel)
>>>>>>>
>>>>>>>     .../gpu/drm/drm_panel_orientation_quirks.c    | 40 ++++++++++++++++++-
>>>>>>>     1 file changed, 38 insertions(+), 2 deletions(-)
>>>>>>>

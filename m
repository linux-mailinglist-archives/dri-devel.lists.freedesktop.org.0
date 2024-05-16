Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1526B8C791F
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 17:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860CD10E13F;
	Thu, 16 May 2024 15:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LetnUTAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446FA10E13F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715872613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iOgbS6qeObzrg8GE2s02mcHzXvs1fEJ62WhOsFVoik=;
 b=LetnUTApS9rOMinRA9PPN1FMqHsQVFOK3UQV1W/gtEN1pacN5tMikYZGHdbDvkpCOTCvm/
 z5WcrdBvVNiUaf1wKWNWw4mg/Uf8qzlmCLr9lHb6NCUgdUFYdvpqX+jj0JGDm2Dul4sAbs
 wKOeBW/oYzi9OQAp9BmAyy4+7D5+laQ=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-5M9Hc6OxNu6MshPodLp9bQ-1; Thu, 16 May 2024 11:16:51 -0400
X-MC-Unique: 5M9Hc6OxNu6MshPodLp9bQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-522362e8317so6224704e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 08:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715872610; x=1716477410;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4iOgbS6qeObzrg8GE2s02mcHzXvs1fEJ62WhOsFVoik=;
 b=B3fgPPQywsb5KykHMUmsdeLB+MVvrIUNWPKHnvnPpcjZ3z2PJSWaDFwgCgV6DWP47u
 q6SD2tP+xslE+OCPonMGqNrdFjGVjxznxZHrAD7utzjETUNg2U26p9JIa6y13O/sPha+
 q8OxSQ9QJiZHi64F9c6PCGd8nEsEogPtWtVzlec+tyu5JIoo1z3QJZGkXr0pVsqpOUdo
 /r+e4h1bfQ0xavQ0Io82KGrIZJGtdWiZl5jAsXQbqn1q+sXdLx9ptEE+P99jdOtEfL0L
 X+kVmyAdQKLIecDpB/RadAFPivuzJetXc1j7CSjuVQpGLyCURzlw6L80bHlwpCLQBMJ+
 +ytg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgRYK2VhqOxsuwvca/Tkek2dH+eZ2PBXaWR+ueaD0H3+nfaPZZAbZmEj7BFegMzFhqYj+w7Na53tDV5PFclE+zOiDxlKAZ7vw9R4Zy/07F
X-Gm-Message-State: AOJu0YxCPnOpIaDAHvc6bFoOPdK1gdUxLPwyYpsLYWo1qkDOmqDX8tsI
 gjwH+QHZk30EHsMeT3jcsQNLYVOxM2px3awoG5UfPJuJn7i8hY4VJYod9ShkHOcDEM7ZPspf0Vq
 K3bUg97qSuvs88aLN5uO64GOBoYRlSug4zIjh2dx8KCZYJ0ZfwMK6vTjx19vj7Zbytw==
X-Received: by 2002:a05:6512:444:b0:51f:3e0c:ace3 with SMTP id
 2adb3069b0e04-5220fd7c6bdmr16656977e87.16.1715872610036; 
 Thu, 16 May 2024 08:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn+FVB1tK34ViV8+agUiDomeCaRnMnSEIgSm4pt/ya2IBcjeS4X3/vaKP4GVA4MVD2ub1n+A==
X-Received: by 2002:a05:6512:444:b0:51f:3e0c:ace3 with SMTP id
 2adb3069b0e04-5220fd7c6bdmr16656944e87.16.1715872609565; 
 Thu, 16 May 2024 08:16:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a60eabd3csm596814866b.108.2024.05.16.08.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 08:16:49 -0700 (PDT)
Message-ID: <b9a5068c-8760-4f92-8a1b-bd276532109d@redhat.com>
Date: Thu, 16 May 2024 17:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ACPI: video: Fix name collision with architecture's
 video.o
To: Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: lenb@kernel.org, arnd@arndb.de, chaitanya.kumar.borah@intel.com,
 suresh.kumar.kurmi@intel.com, jani.saarinen@intel.com,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240516124317.710-1-tzimmermann@suse.de>
 <CAJZ5v0gw620SLfxM66FfVeWMTN=dSZZtpH-=mFT_0HsumT3SsA@mail.gmail.com>
 <1850b44d-e468-44db-82b7-f57e77fe49ba@redhat.com>
 <82731e7d-e34f-46c4-8f54-c5d7d3d60b5a@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <82731e7d-e34f-46c4-8f54-c5d7d3d60b5a@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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

Hi,

On 5/16/24 5:11 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 16.05.24 um 17:03 schrieb Hans de Goede:
>> Hi,
>>
>> On 5/16/24 3:04 PM, Rafael J. Wysocki wrote:
>>> CC Hans who has been doing the majority of the ACPI video work.
>>>
>>> On Thu, May 16, 2024 at 2:43 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>> Commit 2fd001cd3600 ("arch: Rename fbdev header and source files")
>>>> renames the video source files under arch/ such that they does not
>>>> refer to fbdev any longer. The new files named video.o conflict with
>>>> ACPI's video.ko module.
>>> And surely nobody knew or was unable to check upfront that there was a
>>> video.ko already in the kernel.
>> Sorry, but nack for this change. I very deliberately kept the module-name
>> as video when renaming the actual .c file from video.c to acpi_video.c
>> because many people pass drivers/video/acpi_video.c module arguments
>> on the kernel commandline using video.param=val .
>>
>> Try e.g. doing a duckduckgo search for 1 off:
>>
>> "video.only_lcd"
>> "video.allow_duplicates"
>> "video.brightness_switch_enabled"
> 
> Ok, that makes sense. I'll rename the other files.

Great, thank you.

Regards,

Hans



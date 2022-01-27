Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3FF49DFAF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 11:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D1410E60E;
	Thu, 27 Jan 2022 10:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F5710E6FD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 10:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643280417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BvyN8Tqs1ZiebaPCuEHERBQi90N1F99BnzB1Q++zaso=;
 b=TcjZCQ5GsHlzPtwTHBRNWCmI097NsFWNFIAJarLy4cBlVivMNNxKIZuWMaYBobySuqPYnC
 u0bY7rU5HSIrD4V/WNP54o/WKajA8CAR10wUVh8PxwFzmx6ZwwuwFXSaoIB17BGsoeMD4Y
 pQwWoimFudv8wt6Fhs5XO9MaaaRkds8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-X0Wf-Ll8Nh6kTZg02icIuQ-1; Thu, 27 Jan 2022 05:46:47 -0500
X-MC-Unique: X0Wf-Ll8Nh6kTZg02icIuQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l16-20020a1c7910000000b0034e4206ecb7so1300398wme.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 02:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BvyN8Tqs1ZiebaPCuEHERBQi90N1F99BnzB1Q++zaso=;
 b=YoQLpvZWXaQjGEAfsmP/ds+MwMvKYbBA99nbURexNaLRuiO4WgXCbQ/QJqoiKr2T3g
 62UeyRF4cnFk8z/Ntx0a6TNcNlcJ9NV+i1DjBCHKcMcfjZlVHS2aaP8ku278aNZSQRS+
 hG+4+nMEWdbqcXEECDmNqXnkJJfJj8P8WAdIpEWBQSw18lmu2Lxhpt82baNZXn1UhJAZ
 jdI+4u9JnjoBoitvT1yKo0WEnqijwQlwXJFRSaMqexdgUN9pvSPV7+NvTZEJh1PMslGy
 wQiXP3ZkEDkSHbxEipTvo28VBNoheQ/cTanw1YrC9tBlPZ69shGJ4Bm0JXNTXqNiktv3
 NpUw==
X-Gm-Message-State: AOAM530IMGiLFkSDa42lUUG+16HRjQkJTXJ3XV1oxTQj+000oZ61NEGt
 TcwsctppIH3A+58Gx+8eHQkxDnytlCNEsivjlxlprDEzuAXpnaZLvXs3ouuhNLoY7LvtpD8t7pr
 LfaDonz/z9ZoGep3qABAX0dVYCqeJ
X-Received: by 2002:adf:f006:: with SMTP id j6mr2487871wro.444.1643280406020; 
 Thu, 27 Jan 2022 02:46:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxb4ZuK8sGDz/teSbQCYNZjD8WwVwAno0rW/jGdduGtJM0UzScVWzrLTybOMUPWFpN71MYwvA==
X-Received: by 2002:adf:f006:: with SMTP id j6mr2487858wro.444.1643280405691; 
 Thu, 27 Jan 2022 02:46:45 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id j19sm6433308wmq.17.2022.01.27.02.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 02:46:45 -0800 (PST)
Message-ID: <d03e4a81-de8b-ca4e-f2c4-51faeb3786fd@redhat.com>
Date: Thu, 27 Jan 2022 11:46:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/doc: Add section in the introduction page about
 learning material
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20220127082058.434421-1-javierm@redhat.com>
 <20220127110528.20604049@eldfell>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220127110528.20604049@eldfell>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Pekka,

Thanks a lot for your feedback.

On 1/27/22 10:05, Pekka Paalanen wrote:
> On Thu, 27 Jan 2022 09:20:58 +0100
> Javier Martinez Canillas <javierm@redhat.com> wrote:
> 
>> The Linux DRM subsystem supports complex graphics devices and it could be
>> quite overwhelming for newcomers to learn about the subsystem's internals.
>>
>> There are lots of useful talks, slides and articles available that can be
>> used to get familiar with the needed concepts and ease the learning curve.
>>
>> Add a section to the intro that contains these DRM introductory materials.
>>
>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>>  Documentation/gpu/introduction.rst | 36 ++++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
>> index 25a56e9c0cfd..35986784f916 100644
>> --- a/Documentation/gpu/introduction.rst
>> +++ b/Documentation/gpu/introduction.rst
>> @@ -112,3 +112,39 @@ Please conduct yourself in a respectful and civilised manner when
>>  interacting with community members on mailing lists, IRC, or bug
>>  trackers. The community represents the project as a whole, and abusive
>>  or bullying behaviour is not tolerated by the project.
>> +
>> +Learning material
>> +=================
>> +
>> +Since the Linux DRM layer supports complex graphics devices, it can be quite
>> +overwhelming for newcomers to get familiar with all the needed concepts and
>> +learn the subsystem's internals.
> 
> Hi,
> 
> this seems to say that DRM is going to be complicated no matter what
> hardware one wants to drive, but is that true?
> 
> Is there no way to say that if your display hardware is simple (no
> GPU), then the driver can be simple to write too?
>

I do wonder how much one could abstract of the uAPI when writing a simpler driver.

In other words, writing the driver should be simple but I believe that grasping
all the needed details about DRM may not be.
 
>> +
>> +To shallow the learning curve, this section contains a list of presentations
>> +and documents that can be used to learn about DRM/KMS and graphics in general.
>> +
>> +The list is sorted in reverse chronological order, to keep the most up-to-date
>> +material at the top. But all of them contain useful information, and it can be
>> +valuable to go through older material to understand the rationale and context
>> +in which the recent changes to the DRM subsystem were made.
>> +
>> +Talks
>> +-----
>> +
>> +* `An Overview of the Linux and Userspace Graphics Stack <https://www.youtube.com/watch?v=wjAJmqwg47k>`_ - Paul Kocialkowski (2020)
>> +* `Getting pixels on screen on Linux: introduction to Kernel Mode Setting <https://www.youtube.com/watch?v=haes4_Xnc5Q>`_ - Simon Ser (2020)
>> +* `An introduction to the Linux DRM subsystem <https://www.youtube.com/watch?v=LbDOCJcDRoo>`_ - Maxime Ripard (2017)
>> +* `Embrace the Atomic (Display) Age <https://www.youtube.com/watch?v=LjiB_JeDn2M>`_ - Daniel Vetter (2016)
>> +* `Anatomy of an Atomic KMS Driver <https://www.youtube.com/watch?v=lihqR9sENpc>`_ - Laurent Pinchart (2015)
>> +* `Atomic Modesetting for Drivers <https://www.youtube.com/watch?v=kl9suFgbTc8>`_ - Daniel Vetter (2015)
>> +* `Anatomy of an Embedded KMS Driver <https://www.youtube.com/watch?v=Ja8fM7rTae4>`_ - Laurent Pinchart (2013
>> +
>> +Slides and articles
>> +-------------------
>> +
>> +* `Understanding the Linux Graphics Stack <https://bootlin.com/doc/training/graphics/graphics-slides.pdf>`_ - Bootlin (2022)
>> +* `DRM KMS overview <https://wiki.st.com/stm32mpu/wiki/DRM_KMS_overview>`_ - STMicroelectronics (2021)
>> +* `Linux graphic stack <https://studiopixl.com/2017-05-13/linux-graphic-stack-an-overview>`_ - Nathan Gauër (2017)
>> +* `The DRM/KMS subsystem from a newbie’s point of view <https://bootlin.com/pub/conferences/2014/elce/brezillon-drm-kms/brezillon-drm-kms.pdf>`_ - Boris Brezillon (2014)
>> +* `A brief introduction to the Linux graphics stack <https://blogs.igalia.com/itoral/2014/07/29/a-brief-introduction-to-the-linux-graphics-stack/>`_ - Iago Toral (2014)
>> +* `The Linux Graphics Stack <https://blog.mecheye.net/2012/06/the-linux-graphics-stack/>`_ - Jasper St. Pierre (2012)
> 
> That's an impressive list of links!
> 
> However, given the discussions that prompted this doc, I think the gist
> is missing. The reader is just flooded with stuff to read and learn
> which can be discouraging.
> 
> Your audience are developers who know nothing about DRM. They may have
> been writing fb drivers instead. The display hardware they want to
> drive has no GPU. Where should they get started? Which presentations to
> read/watch first? Which driver to look at for a simple example?
> 
> Maybe add one more section targeting that specific audience?
>

Yes, I did not ignore your suggestions made over IRC but it's just that I
didn't know to write such section. Maybe we can land this section and then
as a follow-up think how a "Getting started" one should look like ?

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat


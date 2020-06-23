Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6509B204FF9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 13:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADE16E2F3;
	Tue, 23 Jun 2020 11:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB376E99F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 11:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592910268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qo4waWNCBKfuxO5ueecCEQULCB0OfN1xEh5niFHEcdI=;
 b=ZIB3mcPbygIhMVthrdTfk0huRNxICqWBxERmdSab3vmTn2GEpyHzupK6/lavfMrfQGQ5rm
 EJFzGUh8oz/T1grf+jlq8MNJYKTySNSHVjha9ejvjFKugdWbrHiQBew9AtLvm5o0fGHn75
 I3M/EeQ0d9jbceZuN5wp+k304eOI9+Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-5tsReWPgN9Sk_sZZxcgd-w-1; Tue, 23 Jun 2020 07:04:26 -0400
X-MC-Unique: 5tsReWPgN9Sk_sZZxcgd-w-1
Received: by mail-ed1-f69.google.com with SMTP id da18so4658984edb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 04:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qo4waWNCBKfuxO5ueecCEQULCB0OfN1xEh5niFHEcdI=;
 b=HoW+QyToFHVZy+6+ibUcuvjnJ6k28jWgB6d02A0OZ7jL1DopvNU3zmSjO5UZ/6QhXh
 rYGBKzhpO+2GSmG8LRQTePfNHWhX1BRXKWqNzBcAy+Suwrnb1g800pSsJolphmnxOyPV
 j9DaTWrmQ8tDkylcbbN2bMLxN3btOy6aV+BJ22sL9rtZ2feQUmm2m5EymlKwqaehhlff
 1vUa3h6bmApH+mwVuXd7dkyyumfp2QAQ7lUogJBE0MhzTu6ntrFtR0vN+tEB0Djrkxav
 A6Yz95LrbQvDaXFxqWVjk6I2C8ZXiURMkJ9o/x8HOi5f8blCzI0viFDR2JYg72sLAjqM
 5C8A==
X-Gm-Message-State: AOAM532f9WuBj6M574HyGG6JGhFmsYWURg6BmjyLqx/ETJnF1C/mkCvj
 quR2SEPWKG0Iq/9SYk4P2NAtWcEZ2csHIjyhQoclwN2y4vw0apNRBhAoGyl1uCLdr8DOd51tSN/
 2bw1UXTxREqViRlOOf5FrcOimbkgL
X-Received: by 2002:aa7:dc57:: with SMTP id g23mr20441483edu.352.1592910264682; 
 Tue, 23 Jun 2020 04:04:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4LDDIal6a/EMFdaAZTfIqDNP4eSuKS1NJ0Z8SLqXW77fIV/WjVJeCXIjWWnsiSr31SkBP/w==
X-Received: by 2002:aa7:dc57:: with SMTP id g23mr20441465edu.352.1592910264457; 
 Tue, 23 Jun 2020 04:04:24 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id d11sm13993183edy.79.2020.06.23.04.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2020 04:04:23 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm: panel-orientation-quirks: Add quirk for Asus
 T101HA panel
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200531093025.28050-1-hdegoede@redhat.com>
 <CACvgo51DbOo+PWoon5vxy5mCv-62h-=imgv20NnMpkB9C=R5-Q@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8ca28991-3a8c-9050-ac15-99cea2736e43@redhat.com>
Date: Tue, 23 Jun 2020 13:04:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CACvgo51DbOo+PWoon5vxy5mCv-62h-=imgv20NnMpkB9C=R5-Q@mail.gmail.com>
Content-Language: en-US
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/31/20 7:25 PM, Emil Velikov wrote:
> On Sun, 31 May 2020 at 10:30, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Like the Asus T100HA the Asus T101HA also uses a panel which has been
>> mounted 90 degrees rotated, add a quirk for this.
>>
> Reading the commit message, made me wonder: If it's similar why it
> doesn't use the same quirk?
> Something like the following helps:
> 
> ... 90 degrees rotated, albeit in the opposite direction. Add a quirk for this.
> 
> With that the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Thank you, I've ammended the commit msg with your suggestion
and pushed the 2 patches to drm-misc-fixes.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

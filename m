Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9E1653AF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 01:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765C86E89C;
	Thu, 20 Feb 2020 00:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5FF6E89C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 00:38:25 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id t23so1621994lfk.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 16:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1+oalVdTQ5h+wpOurKnC5i8qIurByKiw9VvJLBQTyA8=;
 b=KY9Q6oJE3q0BEaP0mGZIht+1oFfM0YZHNapcPCKzW7KTSX4fVqpNPlYxw66kZCu20O
 BcVB1zRUTYiUNFlQ6x0Qpqy9Eh1+9B8wn6F93IyvPjiXpWA+8auRsHDfuJcygbA9NV5m
 LH4JKsK4Sjmsv5i4/e3IB8vd65oNufZlEtRrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1+oalVdTQ5h+wpOurKnC5i8qIurByKiw9VvJLBQTyA8=;
 b=FayUrdOTNfnI+R7xP8+UrP2ZtKyAAmwsLjQg3ohR+udc/7q6/+UFgwk5KSiEWJT8+q
 0tuF8CLBjiDW3lW9FFzBQKbkr81xf24j5QrhGNaDKjnu8YvZh14hyYYkp18c4IU/rc/3
 WfXbq4pahFgRu/b1b+1ZoOglgrBm6svVL50hFMaCyu3ShqGTSNmTWZG8k6a/slRbX3JA
 5jesOp5mDajZJyE2xUjpqWXe7i2smiJJP60ghxSTNihhQ1tpPbW29lPvvVlAynimZU7a
 0/mgwsNc8rYxQtMrTwMRHpTCuwciaCW6ULDmscvrJ+VYIfA8rc8OZNluRFHVjf6K41v3
 84lA==
X-Gm-Message-State: APjAAAXrwbbw87wY8sRkX4rWt7PakIEFcXnk/jBvZOhDVQcXTpA9NAUm
 VgP4wD0S82OBWdf2DeSosNwYVBZQvHg=
X-Google-Smtp-Source: APXvYqx7vCQ5PS1OS11Ngx6nfE+plUbjxkqE3zY/jk3t9fVjaMJ3mraPl0z8TKIleuFJPlhFzWKy0Q==
X-Received: by 2002:a19:9155:: with SMTP id y21mr666011lfj.28.1582159103770;
 Wed, 19 Feb 2020 16:38:23 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id r10sm744751ljk.9.2020.02.19.16.38.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 16:38:23 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id t23so1621948lfk.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 16:38:23 -0800 (PST)
X-Received: by 2002:a19:550d:: with SMTP id n13mr15168823lfe.48.1582159102666; 
 Wed, 19 Feb 2020 16:38:22 -0800 (PST)
MIME-Version: 1.0
References: <20200219204002.220744-1-jbates@chromium.org>
 <CALTgcPkPmg12rE286fUxyZQO2s5qJuud=BD-4GnrtY8sVB6OSA@mail.gmail.com>
In-Reply-To: <CALTgcPkPmg12rE286fUxyZQO2s5qJuud=BD-4GnrtY8sVB6OSA@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 19 Feb 2020 16:38:11 -0800
X-Gmail-Original-Message-ID: <CAAfnVBn5HuH8+wrMW-pnErm_4cXHhksh-sM3ias=7i7hQFwX_g@mail.gmail.com>
Message-ID: <CAAfnVBn5HuH8+wrMW-pnErm_4cXHhksh-sM3ias=7i7hQFwX_g@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix virtio-gpu resource id creation race
To: John Bates <jbates@google.com>
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
Cc: John Bates <jbates@chromium.org>, David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 4:20 PM John Bates <jbates@google.com> wrote:
>
>
>
> On Wed, Feb 19, 2020 at 12:40 PM John Bates <jbates@chromium.org> wrote:
>>
>> The previous code was not thread safe and caused
>> undefined behavior from spurious duplicate resource IDs.
>> In this patch, an atomic_t is used instead. We no longer
>> see any duplicate IDs in tests with this change.
>>
>> Signed-off-by: John Bates <jbates@chromium.org>
>> ---
>>
>>  drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
>> index 017a9e0fc3bb..b11c1fce1770 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
>> @@ -42,8 +42,8 @@ static int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
>>                  * "f91a9dd35715 Fix unlinking resources from hash
>>                  * table." (Feb 2019) fixes the bug.
>>                  */
>> -               static int handle;
>> -               handle++;
>> +               static atomic_t seqno;

nit: ATOMIC_INIT(0)?

>> +               int handle = atomic_inc_return(&seqno);
>>                 *resid = handle + 1;
>>         } else {
>>                 int handle = ida_alloc(&vgdev->resource_ida, GFP_KERNEL);
>> --
>> 2.25.0.265.gbab2e86ba0-goog
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

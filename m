Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC45358CF6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 20:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C5B6E329;
	Thu,  8 Apr 2021 18:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931D86E329
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 18:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617907908;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BD/3IJ//4IbIiQsBvvArASrfK6cu+iAAJOBJpUvbC/A=;
 b=R7a14GsrBsQTM+sgbeAJANa2bkWIfOqWbCoe1QuYyoBzpaEvejjdO8eov9cUR3GN6mt9j7
 KRi/yihheQ69zOgQFSOzjPDznrkCg2sZiVRGLA4SHJyBygXzhlewe1VIQ4W6RU4aRr6MhK
 v1iAz26cohLmDlHO6k6j/bmNJ94SmlQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-PL6MvKeoNfi3AZ_-zZoSAw-1; Thu, 08 Apr 2021 14:51:44 -0400
X-MC-Unique: PL6MvKeoNfi3AZ_-zZoSAw-1
Received: by mail-qk1-f198.google.com with SMTP id c7so1881675qka.6
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 11:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=BD/3IJ//4IbIiQsBvvArASrfK6cu+iAAJOBJpUvbC/A=;
 b=tPPs/l+7lvEGL8REYjWn8ccHwMDRl15omCEf6UAH3q0tnJ81BJW7RW0fAMTVFkJrSY
 XeBbwgwdPms5fC/t0YFJGNgt4y/f8o1bDqXuBVLMQPCallQc53znAx9nkIZdbKcZ9G3A
 5LnvQh+qiVlnpX3pEf2JB1F8eh3siwouqWDDOA4UX79eOzPSKHjbaqR97KfAp7RldxgT
 46B6Map/J7msjHc0xNokpBOwfYBR26TkqY0XNYvNEMFmb5E6uZioLcW0P7jKMTQeQ/LM
 lfOLGlV13jtkQccm7IShaDz0fZoKGD1CnHuQhVqnaWKuA+xDsWRoD0tdURGIPNewxkqq
 +cow==
X-Gm-Message-State: AOAM532IPJR5MqXJ3FkkuZqzMVd/0e9PW0+47iEqb5Zz9iOrOxIkt5tm
 EbpvFk0l28F4QItBb68mW0w4bSSPefkgJVbM81FEV/BQ7weD3/cLTvdHJlqa5mcGQ+m/K4uBvU2
 B3XTwrqfl3zpB0K6rh5STuOdXwKk8
X-Received: by 2002:a05:6214:204:: with SMTP id
 i4mr10502062qvt.47.1617907904507; 
 Thu, 08 Apr 2021 11:51:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrMnVVlxnhuJ6a9rN/xNvll03hc+4P139kmw6bFat7NGytQIf28KfBPqtGSmUXky694Mxo+A==
X-Received: by 2002:a05:6214:204:: with SMTP id
 i4mr10502051qvt.47.1617907904388; 
 Thu, 08 Apr 2021 11:51:44 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id y9sm235018qtf.58.2021.04.08.11.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 11:51:43 -0700 (PDT)
Message-ID: <893131fcec2cd4d85d840439ddc2f2899f412f1c.camel@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v2 00/20] drm: Use new DRM printk funcs
 (like drm_dbg_*()) in DP helpers
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 08 Apr 2021 14:51:43 -0400
In-Reply-To: <87zgy9hvvv.fsf@intel.com>
References: <20210326203807.105754-1-lyude@redhat.com>
 <87blaym8by.fsf@intel.com> <YG7fz5UmK/SaoY/U@phenom.ffwll.local>
 <87zgy9hvvv.fsf@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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
Reply-To: lyude@redhat.com
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

JFYI too - there was a legitimate looking CI failure on intel with this series,
so don't be surprised if I have to respin a patch or two (I should be able to
get it asap as I finally just cleared most of the stuff on my plate off for a
while)

On Thu, 2021-04-08 at 14:13 +0300, Jani Nikula wrote:
> On Thu, 08 Apr 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> > I think Dave caught up on pulls to drm-next, so after a backmerge of that
> > to drm-misc-next I think should be all fine to apply directly, no need for
> > topic branch.
> 
> Yup. We've done the backmerges to drm-intel-next and drm-intel-gt-next,
> and are all in sync, it's only the drm-next -> drm-misc-next backmerge
> that's still needed.
> 
> BR,
> Jani.
> 

-- 
Sincerely,
   Lyude Paul (she/her)
   Software Engineer at Red Hat
   
Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A7628D461
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 21:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516336E931;
	Tue, 13 Oct 2020 19:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582686E931
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 19:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602617075;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mROpDD81dZMvuz/AL/wFzK+yDGJlDRaA6Hxnsxnh1II=;
 b=GLhSLShVaHewQn5zo8iGlESqqFQrY37TwWNqHQOw4jMijGjPEve9+shBkDXEAR2etXlddu
 XspZKWUVgfXz2FfSTiosDxrSHbYaznXqRjLbfxTa6NJLUxy4ieU0/rWQ9BJio1xirBa/Ru
 dP+iED8+QTDmbEmZwyVVWeQjmIdoYZE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-fJmgsTLCPtuzkxLxZ5SEtQ-1; Tue, 13 Oct 2020 15:24:31 -0400
X-MC-Unique: fJmgsTLCPtuzkxLxZ5SEtQ-1
Received: by mail-il1-f200.google.com with SMTP id y62so642413ilk.20
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 12:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=mROpDD81dZMvuz/AL/wFzK+yDGJlDRaA6Hxnsxnh1II=;
 b=W1OT+UhTsrbbb0lCrFyMDXMtHjvLcRqFApH2MtzI6upC831y2pgo2tScRY3qPwcDox
 YW+fd8fefDaqYEk04nD4o/WqhZXRXsVjrX+FYcx/ee7cIhVNetRgF9k9Gi0BsPoiR+t2
 41E1Wt0Z4sPwGwbvlqo4l7Xv/aTQvuQMMqHEjBK9UPNC3gTC9HEq2mAsvDRgcGiw8qqY
 9NcRDcQzY/oUtyJEKuWfosgqXgXyQDcoHezPeGIFB+C7tDk1bP4nye6MTpJQUhRwywPS
 coAxzluIatQUXolA6BnD0Xg1UYmymL+dDVO8eueDPvZyGnF/XS/tBGo+WEy2SDgGc1Bb
 Dg7A==
X-Gm-Message-State: AOAM532ug0zJruouSkUtlJYmbV9XhHL1m/vGDQSZB4g2lm8VExLm6k45
 qK+ilIEl/6ulFYx3QSKJ4T5qpezFRYAgG5idIkIgfmeUz42wWbFIrSOUFXlY02nIiEWnzIAdHml
 rVojHcAMCKSF2VuD6TA2vuqtUOISm
X-Received: by 2002:a5d:9693:: with SMTP id m19mr278064ion.161.1602617070906; 
 Tue, 13 Oct 2020 12:24:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxexpvv1trKHY3fOYkDVpjsNWt+h1IcDl+tBkAzFj7h6q2G5dun5m8lXLcBt9JKl3VfJCYqTA==
X-Received: by 2002:a5d:9693:: with SMTP id m19mr278043ion.161.1602617070662; 
 Tue, 13 Oct 2020 12:24:30 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id h14sm651139ilc.38.2020.10.13.12.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 12:24:30 -0700 (PDT)
Message-ID: <195e21dc50fbcccf4f7a17d089d5dbdc6603d645.camel@redhat.com>
Subject: Re: [PATCH v2 12/24] drm/dp: fix a kernel-doc issue at drm_edid.c
From: Lyude Paul <lyude@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Date: Tue, 13 Oct 2020 15:24:28 -0400
In-Reply-To: <96d648f86024535e5f7d5b0caf8ebf93c7f8eaab.1602590106.git.mchehab+huawei@kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
 <96d648f86024535e5f7d5b0caf8ebf93c7f8eaab.1602590106.git.mchehab+huawei@kernel.org>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks for the fixes! I will go ahead and push 11 and 12 to drm-misc-next.

On Tue, 2020-10-13 at 14:14 +0200, Mauro Carvalho Chehab wrote:
> The name of the argument is different, causing those warnings:
> 
> 	./drivers/gpu/drm/drm_edid.c:3754: warning: Function parameter or member
> 'video_code' not described in 'drm_display_mode_from_cea_vic'
> 	./drivers/gpu/drm/drm_edid.c:3754: warning: Excess function parameter
> 'vic' description in 'drm_display_mode_from_cea_vic'
> 
> Fixes: 7af655bce275 ("drm/dp: Add drm_dp_downstream_mode()")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/gpu/drm/drm_edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index a82f37d44258..631125b46e04 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3741,7 +3741,7 @@ drm_add_cmdb_modes(struct drm_connector *connector, u8
> svd)
>  /**
>   * drm_display_mode_from_cea_vic() - return a mode for CEA VIC
>   * @dev: DRM device
> - * @vic: CEA VIC of the mode
> + * @video_code: CEA VIC of the mode
>   *
>   * Creates a new mode matching the specified CEA VIC.
>   *
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

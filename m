Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DE85460B8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002C712B1BF;
	Fri, 10 Jun 2022 09:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F38912B0C6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:01:57 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a15so27091808wrh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 02:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OWUZX694TmNTpG5ba6bgV3yAPhwUaooklYi+mp+/t9w=;
 b=UzdEIq90q4cE41xe4f74tDIV/gwBTmp/ckWmhcfymYY9q5GGAO5niqwU5r40htyQ1M
 b7cgvpLDuo6UGPG70AGt2pleNQUd8L05gGc8ToOSU9I6V+A+gJZp+r3fOnrTNmukJkCK
 ZfRATfqFpGYW/DFueOcSAKsme3jHEKDqF/TOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OWUZX694TmNTpG5ba6bgV3yAPhwUaooklYi+mp+/t9w=;
 b=ONAb1MiidfUYngBiNvEJxopm7wBGx1yBmPJN74aViLO3jEpPNT2/nNEJW178nBSeAL
 05XAts+FJmDditxn0Uqc4JhTghz9AHYjpXAHGl5zG5gnc5qdqUiIagjPjx8HsT8ovbfg
 JUQu9NoVslA9Yjofi3mi16M4W+icuAUaGZRYmn+Gw3b4lQP1fTxejRY2axwvlHkQ1FiD
 vGeoUZ7l7YKU2zqim+WmHMq3/KTk66NVj4DEyiA9rPtpK7SLNRchAjDl1BctzzGL7Q/p
 YS9cefhEMyLv+a8vmCiZY//qjDJmUoFjIKUh3YNL5k9ERY7eHjVnKVCVXXocmkL9zn8v
 yG7A==
X-Gm-Message-State: AOAM530Kt5UgUsbpMl5TzITocbUDmY3+ZopfNlaJ/fUq1WOOrgsrJWDY
 YYpxhgEROaofFyAhZGPPOfn5jQ==
X-Google-Smtp-Source: ABdhPJxD9S8TOCVHIy0ygEh8OiImO7g+LpD3Zzah7uKe9lnO/yrcc0Aw51iMWx6wbZEJBoKYVkE4gw==
X-Received: by 2002:adf:ed49:0:b0:210:2b98:a539 with SMTP id
 u9-20020adfed49000000b002102b98a539mr41985167wro.118.1654851715669; 
 Fri, 10 Jun 2022 02:01:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a5d4704000000b0020c5253d907sm26138082wrq.83.2022.06.10.02.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 02:01:55 -0700 (PDT)
Date: Fri, 10 Jun 2022 11:01:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <YqMIgBYdRxbSR3FE@phenom.ffwll.local>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <20220607110707.02eccda5@eldfell>
 <197201d5da2c504502b8c2225d6766338b18d732.camel@vmware.com>
 <20220608105338.22592a09@eldfell>
 <0485fdf9844f8c89cd5670096b78f8090378b2a1.camel@vmware.com>
 <4CJ-x-v-p82cgfBong1zaXjiyI_CnIyh2mOHdGEDi8dpNgr-M4cagtnxFnFCipfM9OjcoM9ZtWtaHKglAzjDzP8169AKwGqGMVT042UhHXk=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4CJ-x-v-p82cgfBong1zaXjiyI_CnIyh2mOHdGEDi8dpNgr-M4cagtnxFnFCipfM9OjcoM9ZtWtaHKglAzjDzP8169AKwGqGMVT042UhHXk=@emersion.fr>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Martin Krastev <krastevm@vmware.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 10, 2022 at 08:54:03AM +0000, Simon Ser wrote:
> I agree with what others have replied, just adding a few more details.
> 
> On Thursday, June 9th, 2022 at 21:39, Zack Rusin <zackr@vmware.com> wrote:
> 
> > virtualized drivers send drm_kms_helper_hotplug_event which sends a HOTPLUG=1
> > event with a changed preferred width/height
> 
> (Note: and the "hotplug_mode_update" property is set to 1.)
> 
> > suggested_x and suggested_y properties
> 
> These come with their own set of issues. They are poorly defined, but it seems
> like they describe a position in physical pixel coordinates. Compositors don't
> use physical pixel coordinates to organize their outputs, instead they use
> logical coordinates. For instance, a HiDPI 4k screen with a scale of 2 will
> take up 1920x1080 logical pixels. There is no way to convert physical pixel
> coordinates to logical pixel coordinates in the general case, because there's
> no "global scale factor". So suggested_x/y are incompatible with the way
> compositors work.

I dropped a request for a proper doc section that explains all the
virtualized kms driver stuff. I think we should also put in a
"limitations" part there and just spec that any kind of scaling is a no-go
on these (and that drivers better validate this is the case).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

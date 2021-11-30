Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ABE462E94
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 09:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22BA6E7E6;
	Tue, 30 Nov 2021 08:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624B46E7E6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 08:32:03 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id x15so83280317edv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 00:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Yq8SK8cDEV4nnYASvzD6sCtGVXGFpUtS7oBb3SdYtac=;
 b=j2M1i0hTcO6H8yEpd/kIkOFTbUwIQU1ACNjx70YGFlRQkcq5U1umVFEKGyHNEsihNU
 OOruamasQ+nIQ+1M/WYqJF3Qseuee12fIDXJt1cBnX4znm/3U7PzRJBBdp3P9w/ieC5K
 9928SbhqpykqLfrdBJ7u9HNt1+DsZQfMaQVnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yq8SK8cDEV4nnYASvzD6sCtGVXGFpUtS7oBb3SdYtac=;
 b=qt/QazEL6hlyl5ChHvgbiDZwUm3+graOHalQsUuGboG8iVgSM1klaXdWlKS+pvnQmt
 f7BFymjZ5FQAQs/HryLvQT+NCcIvlKt7WvmsrwEvnAylkYzxTmuQtNATOAzTlSwkSyl1
 Bp6iM+TUwWYadkzKlhT5UyfG2Kytt+ulbgI3WDjoc2/pXS1b/xkFu//g/1O4y7RtD8ha
 VIaJcgyUYygUMu5euQmOm0IALCze5bZbx0g/wkAF0qaAuOgyKWeg6sYAPNNASp0gjbCw
 esCh+nNjslN3zI4EqHLxycqJIXjh2jg/9crxP+qMWgcM1HYwNryH8GR7DG1N7++iWZIh
 LBWw==
X-Gm-Message-State: AOAM530cs+FEksxAsXGHBOxF/0Ija0guR0PmbZaIleUkZD+Wi8Z4YMy0
 7T6qfmOIKCl+axMM/aWIGqX04w==
X-Google-Smtp-Source: ABdhPJxVCm72O+kYgdDZ+1LPdhOKLEmUiG4LqbFXbAZxUH6BGS/AB60ZW23YEXlZ6iPmBw9ayPe9fg==
X-Received: by 2002:a17:906:2844:: with SMTP id
 s4mr65336017ejc.66.1638261122028; 
 Tue, 30 Nov 2021 00:32:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id hc10sm8627393ejc.99.2021.11.30.00.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 00:32:01 -0800 (PST)
Date: Tue, 30 Nov 2021 09:31:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/2] virtgpu dummy events
Message-ID: <YaXhf5SwuFsugdRK@phenom.ffwll.local>
References: <20211122232210.602-1-gurchetansingh@google.com>
 <YaCJy9uoZJ0J3eNN@phenom.ffwll.local>
 <20211129110910.mwniqvsllzalza6j@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129110910.mwniqvsllzalza6j@sirius.home.kraxel.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 29, 2021 at 12:09:10PM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > On the series:
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > I'm assuming someone from Google can push this to drm-misc-fixes for you?
> 
> Thanks, pushed.

Thanks a lot to everyone for handling this so quickly, very much
appreciated.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

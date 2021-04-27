Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F20D436C167
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428DD6E1D5;
	Tue, 27 Apr 2021 09:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACB26E1D5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:00:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so6414650wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 02:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YnyQgClMJa8zUpRY1j1Z9j+k6TvN0F/fGISFfHntLGM=;
 b=HK7EdI37rpcrtw9My/d8q8NicKubGGSBsxDavFQnnBRdTnRI4SANXAptZYGGNLXhqB
 NNMEauJRYuUJx1YRTRDO7O3VZ+Td+ekQs8gcK8meWHGC/hCOvfVlaZ11pESlCxg/qgz6
 grF/O8ypQe3xY7ku+KlsGemXJndDeQmS/NkeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YnyQgClMJa8zUpRY1j1Z9j+k6TvN0F/fGISFfHntLGM=;
 b=mbFauxi414zhHYP7RhsQ5uv5Jvm3cvG3C3Wq8uDB/Al/K01+yfVNRvtrRNTUBq9LZG
 zHqsEnJr4rr5+71koq80LcfNKSTyU6CS1sORwnxfNhGtFejZQbgZ0GWyiHS3UcEobYRT
 S+wNYvSMWWBti250lP9nu872Qvly5W4b73sJbQApiydUGNeRfQe6y5+qwh5Y98eUzi2L
 4TMi5lierFQ3m3F04M5CMrhN/ngOrI0TVuIEo9TnRnQw33gFsLokLqaTHTe1nBdx0Bnc
 G8M4qDshkcGRj9uXa+zyF/NToof3m8Kw2+uBg+J2H3rKiYDv4fdFoFCID2lOL8oWGsMD
 xl4A==
X-Gm-Message-State: AOAM530EIRvLKhcbDTxGNFU1k5OUea21Efu15OTtopXwYnxuHRZBkr1y
 I9TTV4IQ2Kv0+sExS1iAFl9AKEn5M4xIyw==
X-Google-Smtp-Source: ABdhPJwOZ7mks+KYajoXklPn8nHgjJJSpFK5fAwmx3CCrlt3RNyeCyQebdwqXs+z814w4R6G9bVkdQ==
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr24197677wmq.34.1619514027320; 
 Tue, 27 Apr 2021 02:00:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t206sm20090432wmb.11.2021.04.27.02.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:00:26 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:00:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v2 1/1] drm/doc: document drm_mode_get_plane
Message-ID: <YIfSqPq6J4sI6PyI@phenom.ffwll.local>
References: <20210422181004.34247-1-leandro.ribeiro@collabora.com>
 <20210422181004.34247-2-leandro.ribeiro@collabora.com>
 <20210423141126.308d4145@eldfell>
 <3c3a5d35-10bf-4b32-1970-aed4bc1d6488@collabora.com>
 <20210426103656.0a212089@eldfell>
 <UucmifK8H9QRiWjD9XezmvdKmY-gXYG2c5LcJlAtmZDvpmvX3dqiNqzng6EPm6Kj_1_1nKi4S2vzFPTpKYoou_ARj-27xlxSoeMtrcpxLUk=@emersion.fr>
 <550b87d0-d180-32cb-349e-1ff000c0530f@collabora.com>
 <20210427104024.4e8aa086@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210427104024.4e8aa086@eldfell>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 27, 2021 at 10:40:24AM +0300, Pekka Paalanen wrote:
> On Mon, 26 Apr 2021 14:30:53 -0300
> Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:
> 
> > On 4/26/21 7:58 AM, Simon Ser wrote:
> > > On Monday, April 26th, 2021 at 9:36 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >   
> > >>>> This should probably explain what the bits in the mask correspond to.
> > >>>> As in, which CRTC does bit 0 refer to, and so on.  
> > >>>
> > >>> What about:
> > >>>
> > >>> "possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's are
> > >>> created and they receive an index, which corresponds to their position
> > >>> in the bitmask. CRTC with index 0 will be in bit 0, and so on."  
> > >>
> > >> This would still need to explain where can I find this index.  
> > >   
> > 
> > What do you mean?
> > 
> > > This closed merge request had some docs about possible CRTCs:
> > > 
> > > https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/102
> > >   
> > I'm afraid I don't know exactly what you expect to be documented here
> > that is still missing. Could you please elaborate?
> > 
> > Thanks a lot!
> 
> The documentation you add is talking about "CRTC index". What defines a
> CRTC object's index? How do I determine what index a CRTC object has?
> 
> The answer is, AFAIK, that the index is never stored explicitly
> anywhere. You have to get the DRM resources structure, which has an
> array for CRTC IDs. The index is the index to that array, IIRC. So if
> one does not already know this, it is going to be really hard to figure
> out what the "index" is. It might even be confused with the object ID,
> which it is not but the ID might by complete accident be less than 32
> so it would look ok at first glance.
> 
> If the index is already explained somewhere else, a reference to that
> documentation would be enough.

I think if we do this we should have a DOC: section in the drm_mode.h uapi
header which explains how the index is computed, and then we reference
that everywhere. Because otherwise there's going to be a _lot_ of
duplication of this all over. Kernel-internally we solve this by just
referencing drm_foo_index() family of functions, but for the uapi there's
really nothing, so needs text.

-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

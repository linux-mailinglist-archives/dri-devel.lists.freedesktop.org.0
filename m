Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43053A89B27
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BAB10E70A;
	Tue, 15 Apr 2025 10:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="kJ5OmgFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA95F10E72C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 10:53:36 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7c592764e24so497537885a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 03:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1744714416; x=1745319216;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kZf1ZEYX5fxpBbDQPKXX9zzx3tbglVu+Q3fypBy+V+8=;
 b=kJ5OmgFfRnv0pLT2z0vVPINtkMi+QmK2fswQLd/qC99kwNAl1QFUN1jG0hfNaLphgJ
 Tkse/0zRZn00ZCpjHJ4c/eTf9Y+HfSrWik+3Vm4m29PPGiDaaON4XnHWnxL+BX9L7I2m
 TN0O/XonVWEDpMqmT5a5c4w6Ahg8LtamUin1AvAUWJA/P2rpFy5AswKGQ0sUMjK8/ybt
 n5B+FvO6W4QVbKnRdnROHZchSnSnC0tpJvB3eEVvVlCotrWDukhBU2PsVc9h/0IQUikV
 gDoM974jYKUjdfzRyktwhIt1PpM7x54aDi7y+MUpcZ5KTKiF+uHujVbEYu/vZ/xwqceD
 hJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744714416; x=1745319216;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kZf1ZEYX5fxpBbDQPKXX9zzx3tbglVu+Q3fypBy+V+8=;
 b=WRGEauaj+SuLxrGYOqHowL8hAoIG5AHRn1LI6Lf3kp4MgRVZY/+nihSVOLJSrx6KeS
 8r7ES3CPNz277AX1zvEUUc6dEXBaDNJ2xb/gLmc1NG8SmvmdTeJsaF2upsTBkfOFubYg
 ykwTmo7Q07Brb4IX7iSLy/kItl0muFRD1xBYqS2aI5lnRO0iOIKUcOVAf2YW/qHUt5Y0
 iM/+i1CtMvMQd4FMGvSatsRmcIeGpivGMPqQLnmJVDV2Pf61y3cIQoZnchM87mGpb1Sm
 NCjeTxoQBNOyPkEQ+X61d9KPNfgmAeo3AoraPCn0YFwLajholameVJW03JyRGTqNcVdo
 njaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsWPt7ER1L7XjtZUamgoW7qKyw2uZ0JFpqJRZ54y5TAtaiZAaA3Mtb1IiBhdfTOvugJEQHm5ipbDs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGp/qltYGixO7sLvT1HCOCRDruobyyNmESlpM8lBvKWk5BL/yt
 NNjmwD0UK20Jk+kC1K1P0u3VTCjuOYJnnOimnaS6foW7kRMp1La43wm4v5oXFBF6LaMrsuWca1N
 loGEzYM1Yr2ePzuygOBZCkvXaHCeQIELOOjuOHw==
X-Gm-Gg: ASbGncuLG74swwQ1if1tu42qy6ryic4OLouwfF7xOmzE0o+LIGM08yJPZ4V4pAKydyy
 yAciSUOvj2zRcF27Vl23ipx6Y+vSZc8yfk47VAoVZsdSSl5l1dY+nrns0d/Tjjj6ya4d5CF7nHp
 NK81wMN4W5OoPSxZJfCiY=
X-Google-Smtp-Source: AGHT+IGNrT9fUDqJ/9DuuJ2/HUSXoa5nodR0ekZpYETxpsIYH3/ZSUn/GijzRIn7b9vK5nnHDs5jd9c2PP6HClsjBzc=
X-Received: by 2002:a05:620a:44ca:b0:7c3:ca29:c87e with SMTP id
 af79cd13be357-7c81e00a390mr444244185a.21.1744714415911; Tue, 15 Apr 2025
 03:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250116162528.2235991-1-contact@emersion.fr>
 <20250117131543.38f0f60d@eldfell>
 <wKekuqyfg94IU93Ol9YIZU1bw1eBz0wva56a6US3DBfn5vBBUmvNMRWOIPUD4HL16evFO-j561hsuczkwZuU0nbHdYjOAtGvAufvoqkj1Lc=@emersion.fr>
In-Reply-To: <wKekuqyfg94IU93Ol9YIZU1bw1eBz0wva56a6US3DBfn5vBBUmvNMRWOIPUD4HL16evFO-j561hsuczkwZuU0nbHdYjOAtGvAufvoqkj1Lc=@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 15 Apr 2025 11:53:23 +0100
X-Gm-Features: ATxdqUG22r4ZcbObR9mKZUIe0bDEjShdYMBeI6E0FtN3v0_HsxnKQQK54tzEaEs
Message-ID: <CAPj87rOh0ByYnFZFGg3V0MSvyoOyHigaxv_uKg3KB5XSrUnNKA@mail.gmail.com>
Subject: Re: [PATCH] drm: document DRM_MODE_PAGE_FLIP_EVENT interactions with
 atomic
To: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 David Turner <david.turner@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 14 Apr 2025 at 09:24, Simon Ser <contact@emersion.fr> wrote:
> On Friday, January 17th, 2025 at 12:15, Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:
> > Wasn't this also conditional on the DRM_CAP_CRTC_IN_VBLANK_EVENT or did
> > userspace really need to count the events even without it?
>
> DRM_CAP_CRTC_IN_VBLANK_EVENT is unconditionally set to 1. It doesn't seem
> like there is any interaction between these two. So yeah, I suppose
> user-space needs to count if they are on kernel < v4.12.
>
> > Nevertheless, should there be a "see also DRM_CAP_CRTC_IN_VBLANK_EVENT"?
>
> This sounds a bit out-of-place to me TBH. It's orthogonal to event delivery
> and it's linked from struct drm_event_vblank already.

Right. One completion event will be delivered per CRTC in any case.
It's just that *cough* someone forgot to include the CRTC ID in the
event in the version of atomic support that first landed, so you get n
events which each refer to _a_ CRTC, but userspace has no idea which.

I don't think we need to refer too much to the caps. Realistically, I
suspect everyone who ever tried to use a kernel which didn't have the
CRTC ID in the completion event with atomic userspace is in this
thread, apart from Maarten.

Cheers,
Daniel

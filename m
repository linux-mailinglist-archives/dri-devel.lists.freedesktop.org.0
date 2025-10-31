Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC11EC267F4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD4B10E308;
	Fri, 31 Oct 2025 17:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="coD6Fici";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDDD10E06D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:57:41 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b6d83bf1077so524356766b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761933460; x=1762538260; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0hkxia2CA9CPAPfjt95DlH0WVP9rnYiBKDpQymGAYoo=;
 b=coD6Ficimu0qAvocCTcsSEFVT+O6MGeBtxf34AsM1XaiY7ZYYM4VLr4E3vzVcXWtfj
 A7w4gCrQ28i41DWUrV5JU8ozzFZrMMdzNrGTubfMpS3H27c9lUF0n9dqZngwWlan1DGH
 yxzrfXUSOOWMplwsI+N59I68Cu7jWQa6LwK2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761933460; x=1762538260;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0hkxia2CA9CPAPfjt95DlH0WVP9rnYiBKDpQymGAYoo=;
 b=p6AfkNSDpcjFri8pDoSQ73KlKVveDWRdy7w9IIp70nMEeW+dMqjso5P+0SqMy+9jZp
 6JyqM3xpzNUuEZ2WrP34AsgjNe7M+vzV5ypuivjtamoHY8XtIuk+BENIVWcWbSZvISgq
 iboktpq1xSp1hRdWKzMcI87zVy4nmWj6QzulratEECFzLuPc/DBtifk0v0ypASFZPb0H
 gWYD+QtfBT4K20k2+Z5fKmRjeL8quEH3577eem/Xxl5vUdwJ2K+ev+XjpUmaNpa3wJuk
 noSnZp1lJdTjmI1jEHtlyAHOfis1nkkHfM+HqSY7JeXtMlNLOFVPlhwrQdrCh7KSJHaD
 7RRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZWhHpoYkHE/l8o9WvKcHhrARQlwi5A2R4XzfbKta7sL1nh2Gh3keDJozMH7LS7JkEhrixZn6wpn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwekPWAMUuO4BedxRWwqFwHfuTSSuIjjoJRBFbq3DNaZGAaVuDd
 nkjP343TzJmygkeAzUMEihn9gM/9af3HxIT/IZF97qO/Wn5wSB7hpxtQEFtIqHbsDH0=
X-Gm-Gg: ASbGncsKzcvqUZyXyti7pT61Qxgx61CjDZYziY5DMT9FmAC0Dvk6OdHr914zOn9hTVA
 wdUN4rkW+Ym2cLzMEM/5+eYhyHXjw3QVBUMKEXHJ3NUTJ6qmrhDkAPebcxbFgllG/q7b3NhG/nU
 612P5mC7G55jio1ir4OTXjf3eBujU6PhPrDZK6DHj+PNrpai/pXPIe5R+SA3Wem1blCmcuhWlxx
 C/4ljPoiAUZiX4FAJBWgpuepQT29srWDIKa4gkygHXtWJvKO9M6B7Xzz1ZVIjxfcSCbcSttbKIm
 IDId1ejSbiJlGDHKr5EkB9KTSlyNAATH0k9c3+wdMfE0sXDwLeruaTdu9YRVsL5mdu9+o701fV5
 p/B6YIqGauWuvim7R7zezadmt4egE47sGM32PA+kAyw9riwHozWDle3Ug245QUuBAg5VE9zQ2+Z
 /1V0E9Enb8DlJIu/j+farTFw==
X-Google-Smtp-Source: AGHT+IGb0/G0Y2oVuvPkmvMM5pxw9KWvBDLMoZZ9CrExvWFw6UO+bVtLDy2A3aoJLRHnGzKQeW9qLw==
X-Received: by 2002:a17:906:1795:b0:b70:8afd:7c39 with SMTP id
 a640c23a62f3a-b708afd8112mr49773766b.57.1761933459716; 
 Fri, 31 Oct 2025 10:57:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b70779e8f91sm234574266b.33.2025.10.31.10.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 10:57:39 -0700 (PDT)
Date: Fri, 31 Oct 2025 18:57:37 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Johan Hovold <johan@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [GIT PULL] mediatek drm fixes - 20251028
Message-ID: <aQT4kcDnfhK-nTwU@phenom.ffwll.local>
References: <20251028151548.3944-1-chunkuang.hu@kernel.org>
 <aQR2KOvMxghFgQXl@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQR2KOvMxghFgQXl@hovoldconsulting.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Fri, Oct 31, 2025 at 09:41:12AM +0100, Johan Hovold wrote:
> On Tue, Oct 28, 2025 at 03:15:48PM +0000, Chun-Kuang Hu wrote:
> 
> > ----------------------------------------------------------------
> > Mediatek DRM Fixes - 20251028
> > 
> > 1. Fix device use-after-free on unbind
> > 
> > ----------------------------------------------------------------
> > Johan Hovold (1):
> >       drm/mediatek: Fix device use-after-free on unbind
> 
> Note that this fixes a regression in 6.17-rc4 which have since been
> reported to cause boot failures. The offending commit has also been
> backported to the stable trees so it would be good to get this one into
> 6.18-rc4.

Pulled into drm-fixes, so should make it.

Cheers, Sima
-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch

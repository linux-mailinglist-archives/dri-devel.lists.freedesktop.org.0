Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BA539062C
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 18:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CA589A1F;
	Tue, 25 May 2021 16:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304C289A1F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 16:05:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m18so3133889wrv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=f7DBrUo3wL4Qpwwbs5pU+Y2UR7h2QKSlSLVfoQUFNMI=;
 b=B3DENF8eoHhecWAFNQVLS2JEamnemU33gyvaAri/jUlxzebGZ65BPV0vBbEDgtL0i2
 ktvkA4hfm35xWOsU0Qpu7M/Khpm+8vhn3XskgiCo4rDbB3tRmN4WHjCEACwUXqYx4FeY
 Jtta5hNrcC+yqioS0IajWgJ26ctB5Cv70tzOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=f7DBrUo3wL4Qpwwbs5pU+Y2UR7h2QKSlSLVfoQUFNMI=;
 b=jRCzQrVqsSWqgWvunITPellMc0Ksn4AegPJ6VC+K70dd3lyRFE3F9jwPKRmBwtOTBl
 lDYj33R0rkACC61QoIcCV2kNzEaAa76AfYfY+4Q2b+EyIiL5VvJiVJJBVPprhA3nXnNu
 ET1PeAV/L2X0lmcbuNaACM+o4EuabAMGjTqFFwEm4s+lowK+RQYvC+qiZqd5sibP7UVF
 naYZY8tuxuwJg6/5UZinyZAA1Qyb+oOnq1MzsD0vOChV9mxNiloUr0Q1TTjRWVDG7Wlo
 MuIXt1/gu/Ijpfcvim5gDDzSiuB+QwVGKtzd7p2hfFJ5Pgh6M7/ilWlZNPLMr0I2HoF3
 D8rQ==
X-Gm-Message-State: AOAM530/iXEAvmalt9OgmPRQ/g9wEJ8j+vmo0HGoZivTEpEpTruNWDTq
 lHmb36Lt5QMSjZxk62EhyUw7sA==
X-Google-Smtp-Source: ABdhPJzmCQM+KdUAXONpPffkFRK0K5WklaT15aqWUiMtaXWooOfXUGpF52ocgwjNDKESzlRppx+OrQ==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr28170569wru.90.1621958753771; 
 Tue, 25 May 2021 09:05:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h15sm11169638wmq.1.2021.05.25.09.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 09:05:52 -0700 (PDT)
Date: Tue, 25 May 2021 18:05:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb
 is the default
Message-ID: <YK0gXjANguasJLu5@phenom.ffwll.local>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
 <0b2b3fd7-7740-4c4e-78a5-142a6e9892ea@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b2b3fd7-7740-4c4e-78a5-142a6e9892ea@tronnes.org>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Lechner <david@lechnology.com>, Emma Anholt <emma@anholt.net>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Jeffery <andrew@aj.id.au>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 04:09:13PM +0200, Noralf Trønnes wrote:
> 
> 
> Den 21.05.2021 11.09, skrev Daniel Vetter:
> > Goes through all the drivers and deletes the default hook since it's
> > the default now.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Acked-by: Noralf Trønnes <noralf@tronnes.org>

Can you perhaps also look at the prep patch right before this one?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

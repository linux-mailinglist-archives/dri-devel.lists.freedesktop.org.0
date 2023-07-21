Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E376075D756
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 00:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC3F10E036;
	Fri, 21 Jul 2023 22:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC50610E709;
 Fri, 21 Jul 2023 22:19:34 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6bb0cadd3ccso1325692a34.3; 
 Fri, 21 Jul 2023 15:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689977974; x=1690582774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=LsrbrVHFxjwjByjc6/UZrNrL/NPET1Wevp1mB/G/Lmc=;
 b=D6dXczY+0qF8EjPi28ps6MVuYsmGnnl07dBtmDJMYl7vBhxNbiI46WCsnYerS3mdC1
 KJe0HOBXRp4SjPvPuqJThZbDALy0UO3m+BCzAkLWsKYZok+M09tI1Ijg6hiHp0FjDR2g
 Wfe3Md02hxCbKwHsJLZNfRvIrRMW2zZr9NZneiEEC96Gb7gHmArpMdUNDYUP+EfOvpHM
 b7FbtaG8csDOKZ4KQlozssqHNZVcuBMG/+KXvbQME5X35/ARjyJ22OOe/U9bFIwvi1GD
 ttfxFjpx6YWTM60Q/ICBRYeD67D4yI0TYfK7ByJPBQzZ/NAyniSv3hzNsiZk7+SnT9z2
 wiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689977974; x=1690582774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LsrbrVHFxjwjByjc6/UZrNrL/NPET1Wevp1mB/G/Lmc=;
 b=lfBHSQHzlPy7UrbVOUOPF2ChnYQKEDpKnEmiRIr07Ml0KlSTievSyxVpMlBXQ3QRFc
 KJloYGxzKAuriY0DfG0v2qPfD8s9qqG8ofzs6niJ95FIxpkZ8FlaZ1HBdwQ/pR+76ZjC
 BQzGXkgOuTI5XdCKf6SYqVtdqmP9qcVg06XCSlhdZ+S/fIOvTYbLJVWgLJSOBKZ2VEU5
 1POecpRtsigekQ/7boRoqc78lgs+th1k+jaVeUh5vJMLbZ40NJQ5Lqx2VqSB4FJn5Mlm
 Z+sU/rs+W0ZvC6UvBWmEwxyNCs/vSvTJNP9AYj9FYnA9RDwZJfc4zfKw6J/PkAFIIZSI
 Shdg==
X-Gm-Message-State: ABy/qLYxRDz4IDjDzPmfkGxvPLODIqtw2V0bBIPg09Epyi2ISglgPWlB
 3Ax7k6gldDtC3NiIVyGaLw4=
X-Google-Smtp-Source: APBJJlH2AWrT2kqCjorNC+sDLF7zmPAxqztrnNl7fRba70OrDYiKI8GCFkEYX+RQpDKzKy/qNRlpbA==
X-Received: by 2002:a05:6358:949a:b0:135:73b0:cc6c with SMTP id
 i26-20020a056358949a00b0013573b0cc6cmr1255798rwb.28.1689977973850; 
 Fri, 21 Jul 2023 15:19:33 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:fbd8])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a633717000000b0056368adf5e2sm3582208pga.87.2023.07.21.15.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 15:19:33 -0700 (PDT)
Date: Fri, 21 Jul 2023 12:19:32 -1000
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 15/17] cgroup/drm: Expose GPU utilisation
Message-ID: <ZLsEdJeEAPYWFunT@slm.duckdns.org>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
 <20230712114605.519432-16-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712114605.519432-16-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 12:46:03PM +0100, Tvrtko Ursulin wrote:
> +  drm.active_us
> +	GPU time used by the group recursively including all child groups.

Maybe instead add drm.stat and have "usage_usec" inside? That'd be more
consistent with cpu side.

Thanks.

-- 
tejun

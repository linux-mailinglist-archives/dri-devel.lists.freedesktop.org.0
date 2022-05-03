Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2319E5187ED
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 17:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9B910EDD6;
	Tue,  3 May 2022 15:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8744C10EDD6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 15:08:10 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id u3so23809323wrg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 08:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OFDYOtaeBYWdI/VdYgSv21m5XBBjgU/ODz2WZHmBn3Q=;
 b=rdgAjTZZv0osk3KN17MTgP8AOAysBlgpCZDF3vxnj60caIqipLMdWPG6Y+EUu8UT7p
 YfeNzY7O1pP5C74jOvd0ymCy9taQMRY2L7BqrpsobdUfw7PAnFk4i9Y0emx0zwZv+m1A
 q0f8L2mLH3KtwNcGetRyIGeV8K0s2+QSRv7UxUi41bYnhm4newTxvpRrslfuHGjTRtw8
 VT+sim2z9cNHEuPFsZ90qpnUShHWLSCCDw/CFjrgb6XtLYQgqHp+pPQMSbAlEwjl+yl4
 qzJxuigxBbsH5rng4QLmVTezchvbCBJvVn62A8CA+PxqmUTTMEF3IfOkLqYR3h1Ud6Xn
 KP9w==
X-Gm-Message-State: AOAM531CvdhAcK78CSpOLVFDSjOAU39rkKKleIFEnNnEBQTSfpuivkox
 fNkEYa3CjB7I1b6gTLQb150=
X-Google-Smtp-Source: ABdhPJxUHgC+z861mLwWBsRMd0+WqwbQOXHy1VunvJ23KhKxVuDMs2AqWeh+/Td2z8ZSYIVytBegWQ==
X-Received: by 2002:a05:6000:1acd:b0:20c:726a:3840 with SMTP id
 i13-20020a0560001acd00b0020c726a3840mr3707076wry.507.1651590489041; 
 Tue, 03 May 2022 08:08:09 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 g17-20020adfbc91000000b0020c5253d8f3sm11729850wrh.63.2022.05.03.08.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 08:08:08 -0700 (PDT)
Date: Tue, 3 May 2022 15:08:06 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Subject: Re: [PATCH v4] drm/hyperv: Add error message for fb size greater
 than allocated
Message-ID: <20220503150806.neeemkwlexmyqsnd@liuwe-devbox-debian-v2>
References: <1649737739-10113-1-git-send-email-ssengar@linux.microsoft.com>
 <BYAPR21MB127064CAEA28FBBFB34672C3BFED9@BYAPR21MB1270.namprd21.prod.outlook.com>
 <20220503145016.GA25079@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503145016.GA25079@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 Wei Liu <wei.liu@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 03, 2022 at 07:50:16AM -0700, Saurabh Singh Sengar wrote:
> On Tue, Apr 12, 2022 at 05:06:07AM +0000, Dexuan Cui wrote:
> > > From: Saurabh Sengar <ssengar@linux.microsoft.com>
> > > Sent: Monday, April 11, 2022 9:29 PM
> > >  ...
> > > Add error message when the size of requested framebuffer is more than
> > > the allocated size by vmbus mmio region for framebuffer
> > 
> > The line lacks a period, but I guess the maintainer may help fix it for you :-)
> >  
> > > Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> > 
> > Reviewed-by: Dexuan Cui <decui@microsoft.com>
> 
> Can this be queued for next ? please let me know in case any clarification required.

Applied to hyperv-next. Thanks.

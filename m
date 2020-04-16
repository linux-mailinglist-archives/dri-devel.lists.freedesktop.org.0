Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B85B61AB915
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95686EAFF;
	Thu, 16 Apr 2020 06:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427396E216
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 01:45:10 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id 19so3499545ioz.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 18:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i6cDJ9/jxc7iWgnjOZRxOI5nNKzNheaz7rQ3Dx98dlo=;
 b=BIA7OQsRl1ROJNQ1YvmltTTLBm+XKtsyULQj/bnfCx+MwjCnhqs4UgXDyIpe18RtN0
 xJbDEY8he8SaslRGlOVBNZrRQXwJqnHEQmp7z0bG1mwwFPreLEOzxmdH8ykozZ7G2VTp
 nBuHp+txb8V/7fq9OEWipEVRiBC/F8YuBVYKozGdfNremYW3lOM4QyVKK3ij9CgQPHAF
 UrKu9iLqgmtLrANGhRVdIq3HERcBDQBMHurShfxmKZAnFo24BpcvwjZct8CBP6x1Q+uB
 ydsxDCtFcHXzlMAGT6uflDBOzDhnx72fkyMAGhT8mEk4FSonrZQVSScEIs41w4S93NPW
 o1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i6cDJ9/jxc7iWgnjOZRxOI5nNKzNheaz7rQ3Dx98dlo=;
 b=LIlkgO2aznAnR2PcZE+BS71cOGnSJkbnuFXiHqi3p8fs3MMMdWPMaPVU8EyUakMsB0
 y/PejUaIz48k9brcedAjHxqDznWdgpYWCncDc+r7tyIKeREt9Q4qeqOOCNPKftYlSN0o
 mcazTAOoaveBrcQAObimGyZh03tnaEc+d1HRvjDPE7pWHL/lImPqridorIiGEq/4pdh0
 iSkj2b4JPkHav46d0wce2czCGUvRQ5LR2k9HOllSplb+VX4GWHVhiHvPX8x6ghoF12ew
 iPwGoAvNzg4f4wU5pxb0vAeb0Z6ljvt5I/Zi71eeFESFVRGsZJ9T44gSngpaBm6dD4qf
 TvFQ==
X-Gm-Message-State: AGi0PuaKqqkAaEvUOzZt3N4lD2x1H6rM7YQX+enRidwHnWnXigSQoqlx
 QWVwac7fRK9CR2OkCehTtlrZ90pIKTc6+sHaR/IZcA==
X-Google-Smtp-Source: APiQypIZ8aw2BkFEI+uktQ5J/eBDiyByluk9OxNU0vFx2+RT36b49rAsrvrBVCo21epUnhqnV05MZQGuAUKXZsuq2MM=
X-Received: by 2002:a02:5249:: with SMTP id d70mr29141487jab.121.1587001510217; 
 Wed, 15 Apr 2020 18:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200409195200.5483-1-mail@aurabindo.in>
 <87o8rumiqu.fsf@intel.com>
In-Reply-To: <87o8rumiqu.fsf@intel.com>
From: Aurabindo Pillai <mail@aurabindo.in>
Date: Wed, 15 Apr 2020 21:44:58 -0400
Message-ID: <CAMu4TMtb9f_zusEkUkDWzJMJ-uu8yciUUWxGybv2f4a+ER7B+Q@mail.gmail.com>
Subject: Re: [PATCH] drm: dpcd: Print more useful information during error
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When DPCD access errors occur, knowing the register and request
associated with the error helps debugging, so print the
details in the debug message.

Signed-off-by: Aurabindo Pillai <mail@aurabindo.in>
---
 drivers/gpu/drm/drm_dp_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index c6fbe6e6b..8aafc01f5 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -257,7 +257,9 @@ static int drm_dp_dpcd_access(struct drm_dp_aux
*aux, u8 request,
                        err = ret;
        }

-       DRM_DEBUG_KMS("Too many retries, giving up. First error: %d\n", err);
+       DRM_DEBUG_KMS("dpcd: Too many retries, giving up. First error: %d,"
+                     " address: 0x%x, request: 0x%x, size:%zu\n",
+                     err, msg.address, msg.request, msg.size);
        ret = err;

 unlock:
--
2.26.0

On Tue, Apr 14, 2020 at 7:04 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Thu, 09 Apr 2020, Aurabindo Pillai <mail@aurabindo.in> wrote:
> > When DPCD access errors occur, knowing the register and request
> > associated with the error helps debugging, so print the
> > details in the debug message.
> >
> > Signed-off-by: Aurabindo Pillai <mail@aurabindo.in>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> > index a5364b519..545606aac 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -257,7 +257,9 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
> >                       err = ret;
> >       }
> >
> > -     DRM_DEBUG_KMS("Too many retries, giving up. First error: %d\n", err);
> > +     DRM_DEBUG_KMS("dpcd: Too many retries, giving up. First error: %d\t"
> > +                   "address: %x\trequest: %x\t size:%zu\n",
> > +                   err, msg.address, msg.request, msg.size);
>
> Nitpicks, please don't add tabs, maybe use commas instead, and please
> add 0x in front of hex.
>
> BR,
> Jani.
>
>
> >       ret = err;
> >
> >  unlock:
>
> --
> Jani Nikula, Intel Open Source Graphics Center



-- 

Thanks and Regards,

Aurabindo J Pillai
https://aurabindo.in
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

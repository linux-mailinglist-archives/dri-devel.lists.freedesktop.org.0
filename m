Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F172A79F2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 10:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFD66E1F2;
	Thu,  5 Nov 2020 09:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2246E1F2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 09:00:23 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y16so761167ljk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 01:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9vz0UWJFyDJOsEpzJG8oNBkFI7Psw6oG9i83IwxWSJU=;
 b=mV7+YUMSt25ubU0IDYEk1ne5er9mwF+04nZgXzl5o483sHpICMh/1owr0Pqj7wJc++
 ynMGqsWmHb6DU02ARYIjEQu62vHm6qamscogkYt0NZV8J7aJN/d4RjXPMWCmPNY2Cki0
 mZlTEtLs5lH6ol1wlVRg50QqkLsxTouQl9zzdTVTxMxC/lF66jG8KtASVHG3SIcgqBq2
 bh15g21QU6pV7K5MftL4DMJsT5YiyS3BkGcn5EhoUa+ZZdN0sWdKAZCkl2X9pxY4Gptk
 Wso6c6prYoVsFgV+YTyu5BXJhREpKA5xvYHeThXmH9tXpr5LPda98HRfoDBU137qioD+
 751A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9vz0UWJFyDJOsEpzJG8oNBkFI7Psw6oG9i83IwxWSJU=;
 b=nMpR9py6Uok3fr6ET4eekFC/C4LGIeTGBADtbKse5ClvVuJhDaHwhovgNhjNksgsVw
 LoMQyRQEYuMwKDTmBOIoLW7dK4oG34qcPK6oECS1Dum7wMh1q3fMyz4hT2V961iO0GP5
 YzBImqyb7h7NZMv+QE8h/ujzM1yw0ejN+eXkWrfwkTKjfuYUv2/boVnMWENEQsIOPk3B
 Rlr7Ad8e2obd3UKKcLS0GBSIpP2BsYjChZznGsvUJ10nJcZyC7Qe/t02Uj4FA0ygNCr+
 OpXFwUnLRhTbxcCoYnY2W07Ax7vi/gPq/MAYXmohrjmstX0RS/YApXZhMeN0mARLpSli
 ZRCQ==
X-Gm-Message-State: AOAM5339vD36w5IwNMVFz4rV4k5DR9Ea1hCrJsRkREEnx/4umWrg6rJh
 07OO1QzEndpKk70MD/DItiY=
X-Google-Smtp-Source: ABdhPJyzPCJ7yH1yCHg/j0/iceUt89HPMGKUtdudfLXXl2H1Q46IQ956OyrVRZnrA2TRj0VVc5ezWA==
X-Received: by 2002:a2e:88cb:: with SMTP id a11mr555915ljk.304.1604566822155; 
 Thu, 05 Nov 2020 01:00:22 -0800 (PST)
Received: from gmail.com (h-98-128-166-43.NA.cust.bahnhof.se. [98.128.166.43])
 by smtp.gmail.com with ESMTPSA id
 u7sm114215lfk.135.2020.11.05.01.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 01:00:21 -0800 (PST)
Date: Thu, 5 Nov 2020 10:00:19 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v2] drm: document that blobs are ref'counted
Message-ID: <20201105090019.GB82557@gmail.com>
References: <wgav99DTGfubfVPiurrydQEiyufYpxlJQZ0wJMWYBQ@cp7-web-042.plabs.ch>
 <20201105105653.07e806c5@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105105653.07e806c5@eldfell>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 10:56:53AM +0200, Pekka Paalanen wrote:
> On Wed, 04 Nov 2020 17:01:40 +0000
> Simon Ser <contact@emersion.fr> wrote:
> =

> > User-space doesn't need to keep track of blobs that might be in use by
> > the kernel. User-space can just destroy blobs as soon as they don't need
> > them anymore.
> > =

> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> > Reviewed-by: Jonas =C5dahl <jadahl@gmail.com>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  include/uapi/drm/drm_mode.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > =

> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index 863eda048265..5ad10ab2a577 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -924,6 +924,12 @@ struct drm_mode_create_blob {
> >   * struct drm_mode_destroy_blob - Destroy user blob
> >   * @blob_id: blob_id to destroy
> >   * Destroy a user-created blob property.
> > + *
> > + * User-space can release blobs as soon as they do not need to refer t=
o them by
> > + * their blob object ID.  For instance, if you are using a MODE_ID blo=
b in an
> > + * atomic commit and you will not make another commit re-using the sam=
e ID, you
> > + * can destroy the blob as soon as the commit has been issued, without=
 waiting
> > + * for it to complete.
> >   */
> >  struct drm_mode_destroy_blob {
> >  	__u32 blob_id;
> =

> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

This version is as clear to me as the previous one so both are

Reviewed-by: Jonas =C5dahl <jadahl@gmail.com>


Jonas

> =

> =

> Thanks,
> pq


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

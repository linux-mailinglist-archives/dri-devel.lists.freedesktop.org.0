Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D271A00A6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 00:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945DD89D79;
	Mon,  6 Apr 2020 22:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6658389D79
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 22:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586211108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2Ct5V3S1c+UJwUTQhQD51UKnmSY4RKZxhEZvTjd+3g=;
 b=EJkSmRhmL5JmRoJom2bl5XIKhIO8JKPCC1vD+uhVt4RRbuvmIfhGwfqJVRY25QzgyVWgwz
 kaSJReq0168fCihhN79g1ryi1tZGKWuGUKf1v8Icg4MCWDmISlPqWZbKZJEEBxS/eSqJm4
 jt0YyQXfZbGdzSN678YSABBafpJZqVc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-6VDGkVB0MPa8FoUgAS_dfQ-1; Mon, 06 Apr 2020 18:11:46 -0400
X-MC-Unique: 6VDGkVB0MPa8FoUgAS_dfQ-1
Received: by mail-qk1-f200.google.com with SMTP id c1so1270232qkg.21
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 15:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=v2Ct5V3S1c+UJwUTQhQD51UKnmSY4RKZxhEZvTjd+3g=;
 b=lVxQsfHHirIRqLWvaVZ+3/qx4DZrdwUWLgOYJ6D2TstZWWYdnhnkzq+Le0dgVOeIUt
 KnF95r5XkKX29RBOwQOVOBOmiX5NJ+He4wMJ8jjrmVBKD0kvCGrEVd6i1i6e/ucjoxM/
 qrJzZTovhBJh0vXFQwPuVW/KqG7iQJksrc2kVjN6V8rwcP6yKCMyFjm0Nkm+FnKUCIMm
 WT+NIsfMc3lG9WcNgMzUHf42BcrKpprl4dtceExJUBdu62DowbMyLr4VybrRhJ9bsh3c
 nybtX84gde05Z21JOReBLx0aI8htgt19p8xZK+mHFXKJoaCMkOWbcmZIFD0e3FFz0Koe
 TDXw==
X-Gm-Message-State: AGi0PuZr8SOnYO6G0XUYJ7pqY/DfZQux+kqb6D6ZW6Bypn4elQIOWda4
 CNSt1E70dhWQ1r2cv3lyB8fmVm9BzLvITAVRr6eA4+czuO9ElHoObu7gQ0GbTHcDsp7NjWlysxO
 7YVSSgXv6OJFnlHJMq8rhmpayH5mY
X-Received: by 2002:ad4:4862:: with SMTP id u2mr2024804qvy.67.1586211106317;
 Mon, 06 Apr 2020 15:11:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypLTNRaNp7gCT0J9NM4r/XGioMC4sIDsu3UdzD5Ww7wPzKSkKyTKco6lQte0PWEVnkxoeZOI5A==
X-Received: by 2002:ad4:4862:: with SMTP id u2mr2024783qvy.67.1586211106090;
 Mon, 06 Apr 2020 15:11:46 -0700 (PDT)
Received: from Ruby.lyude.net (static-173-76-190-23.bstnma.ftas.verizon.net.
 [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id m5sm14413184qtk.85.2020.04.06.15.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 15:11:45 -0700 (PDT)
Message-ID: <bb25bdd85b0dba09292923e448447dec15994768.camel@redhat.com>
Subject: Re: [PATCH 2/4] drm/dp_mst: Reformat drm_dp_check_act_status() a bit
From: Lyude Paul <lyude@redhat.com>
To: Sean Paul <sean@poorly.run>
Date: Mon, 06 Apr 2020 18:11:44 -0400
In-Reply-To: <CAMavQKL6G9QsUE7ZzGXNpjjEVdZGQZkbN3oke-M=Lz=pHOn70A@mail.gmail.com>
References: <20200403200757.886443-1-lyude@redhat.com>
 <20200403200757.886443-3-lyude@redhat.com>
 <CAMavQKL6G9QsUE7ZzGXNpjjEVdZGQZkbN3oke-M=Lz=pHOn70A@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Todd Previte <tprevite@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-04-06 at 15:23 -0400, Sean Paul wrote:
> On Fri, Apr 3, 2020 at 4:08 PM Lyude Paul <lyude@redhat.com> wrote:
> > Just add a bit more line wrapping, get rid of some extraneous
> > whitespace, remove an unneeded goto label, and move around some variable
> > declarations. No functional changes here.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > [this isn't a fix, but it's needed for the fix that comes after this]
> > Fixes: ad7f8a1f9ced ("drm/helper: add Displayport multi-stream helper
> > (v0.6)")
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: <stable@vger.kernel.org> # v3.17+
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 22 ++++++++++------------
> >  1 file changed, 10 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 2b9ce965f044..7aaf184a2e5f 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -4473,33 +4473,31 @@ static int drm_dp_dpcd_write_payload(struct
> > drm_dp_mst_topology_mgr *mgr,
> >   */
> >  int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
> >  {
> > +       int count = 0, ret;
> >         u8 status;
> > -       int ret;
> > -       int count = 0;
> > 
> >         do {
> > -               ret = drm_dp_dpcd_readb(mgr->aux,
> > DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
> > -
> > +               ret = drm_dp_dpcd_readb(mgr->aux,
> > +                                       DP_PAYLOAD_TABLE_UPDATE_STATUS,
> > +                                       &status);
> >                 if (ret < 0) {
> > -                       DRM_DEBUG_KMS("failed to read payload table status
> > %d\n", ret);
> > -                       goto fail;
> > +                       DRM_DEBUG_KMS("failed to read payload table status
> > %d\n",
> > +                                     ret);
> > +                       return ret;
> >                 }
> > 
> >                 if (status & DP_PAYLOAD_ACT_HANDLED)
> >                         break;
> >                 count++;
> >                 udelay(100);
> > -
> >         } while (count < 30);
> > 
> >         if (!(status & DP_PAYLOAD_ACT_HANDLED)) {
> > -               DRM_DEBUG_KMS("failed to get ACT bit %d after %d
> > retries\n", status, count);
> > -               ret = -EINVAL;
> > -               goto fail;
> > +               DRM_DEBUG_KMS("failed to get ACT bit %d after %d
> > retries\n",
> 
> Should we print status in base16 here?

jfyi - I realized we don't actually need to do this, because we do this in the
next patch whoops. Just figured I'd point that out

> 
> Otherwise:
> 
> Reviewed-by: Sean Paul <sean@poorly.run>
> 
> > +                             status, count);
> > +               return -EINVAL;
> >         }
> >         return 0;
> > -fail:
> > -       return ret;
> >  }
> >  EXPORT_SYMBOL(drm_dp_check_act_status);
> > 
> > --
> > 2.25.1
> > 
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

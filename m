Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03FF19FE11
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 21:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FAA6E0E0;
	Mon,  6 Apr 2020 19:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E4C6E0E0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586201259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QwF4wq4AYvXRbfz5PvV0g0CmU7fPPunQdEwXYUcKME4=;
 b=eXqsdPOu14ejX5ex4yucDsjeDu/peMQ9IvSCMuZJwisP2McNrkXTr+VgWN5nmwBMdNuRWe
 4LYSanGeP2mlu2I09vH/ECfQmI0rgg+r5Roxpbu5OvT8woCf2hcyBHa5kOhY4m3VSreqiw
 W6Jx9iLrB8fw6JTmWLq8izrDM8dDwoM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-PQyQ4H1cNJiU6azk3w8cxA-1; Mon, 06 Apr 2020 15:27:38 -0400
X-MC-Unique: PQyQ4H1cNJiU6azk3w8cxA-1
Received: by mail-qk1-f200.google.com with SMTP id w21so855943qkj.18
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 12:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=QwF4wq4AYvXRbfz5PvV0g0CmU7fPPunQdEwXYUcKME4=;
 b=eesssmd16zuAI3/nR4WcspW4g89zlGCQMcMMs4GTo4KMJvfmmwEWpJ/XGb09drY0tJ
 TJ2trWblawYEugDsYKiaW40WDmOMWDM6XX7cgs6VV41zKaB8nDk/ngj1P855rPQtUI5M
 R6D8YFcxlK2sdTsD/4HW7uL5Q+kquhd/DE6bKyUtwTUptQO1rKsPINx17Vxk1sYIfkHS
 M/va9feWdCZCfKSjYQCmQ4Ozl7zItn18kouLSGAYl+yqWjCoCWjJiUV8Z/ylyf1KpAy/
 oEh5QVODZXbD4+hyPKGVg8Q0cO4lMuABgG/yPrbeilESw6cF4fTEXptfEnyMSFuxeKYE
 ajzA==
X-Gm-Message-State: AGi0PuYugQoqhTQPt9GvttbhesoaA21IBM37ry2t/u+10CTxLUGJgEVg
 7eMNsv9vrKSJRrXN0MrCmgK/tt+H/wc4axArxnPVfG/Wf+1xX6t1xbIAFCJTJA6aU4qFUAcfqD2
 OBd4aDbjcteInvwv7splmhJUpjFRz
X-Received: by 2002:ac8:10f:: with SMTP id e15mr1115209qtg.355.1586201257854; 
 Mon, 06 Apr 2020 12:27:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypIcSVxln0+TxAGiz9pu5WgjVaSm1wM1cLgviUCkvqSS8unS4LyeOc9Fq545caCsXLfk1u4yAQ==
X-Received: by 2002:ac8:10f:: with SMTP id e15mr1115187qtg.355.1586201257610; 
 Mon, 06 Apr 2020 12:27:37 -0700 (PDT)
Received: from Ruby.lyude.net (static-173-76-190-23.bstnma.ftas.verizon.net.
 [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id g2sm2896284qtj.96.2020.04.06.12.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 12:27:36 -0700 (PDT)
Message-ID: <e6802716d4ddb18a43cedd2c8af4c96726f62719.camel@redhat.com>
Subject: Re: [PATCH 2/4] drm/dp_mst: Reformat drm_dp_check_act_status() a bit
From: Lyude Paul <lyude@redhat.com>
To: Sean Paul <sean@poorly.run>
Date: Mon, 06 Apr 2020 15:27:35 -0400
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
> 
> Otherwise:
> 
> Reviewed-by: Sean Paul <sean@poorly.run>

Good point - I'll make sure to fix that before I push the series
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

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC19273C92
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766046E82A;
	Tue, 22 Sep 2020 07:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369F989D7F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 06:39:54 +0000 (UTC)
Received: from mail-oo1-f70.google.com ([209.85.161.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <koba.ko@canonical.com>) id 1kKbxw-0003B6-5Y
 for dri-devel@lists.freedesktop.org; Tue, 22 Sep 2020 06:39:52 +0000
Received: by mail-oo1-f70.google.com with SMTP id r3so8143961ooq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 23:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IpZ9NNf3JzpitwTHfm+igFTBUGXT+UKNE1QHrd1BCyY=;
 b=mEtkMGJFUoPq0pm5ttgchLQQMsdjq34Dx23xK9IyOY/icIzIU5gJy/IUeYTcLescUY
 Q3lyqnVg9gwyhZXvg1Q3GDesCFaTNQP/5A/ZvpLRn5QDbe/UlkCQE+ISXZerp1lrPz4+
 h4AO9hmEeb0+2J67172EGdYE+4M1b7xFsez0Re5rSIbmiQi4VniLBQ94FUok4hiYTDH/
 PTaLY0BTUFjqipT08wcypsjnG7YmFBkz+v0ckVvWZoRXvev3ka3rkGKscdoMel0J2NJl
 LbWhLXbClDXN6CmjkSY1b0shbpe61xziBYRvWH1ApoUCbW+gnKBN2pbOomgsU2sHgfdd
 0bfQ==
X-Gm-Message-State: AOAM530Y1pko88ix345CyQ2eaf5cW1eiX4HvbrTZR6KGukO2YVdqrIFh
 B8o8nh722DAql5Fcu0tAmaw5pX1e00MrOutCDUkDExaDhCbPHYrPhuKn1/qG3PchfRbBr7AEIMH
 2nG619upqOXBURY1eZGpd8/Pd7av1EHuSFgoiUPGF4EfFrZ50fuLoMVslgeeUgg==
X-Received: by 2002:aca:4fce:: with SMTP id d197mr1862541oib.17.1600756791152; 
 Mon, 21 Sep 2020 23:39:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdbipZHJRZBHWlDsRwdIKYYUDV0qa8clnrwwEhL0wykwua1ij4eJ8ISgRtInsHSQiNgMspyGx+Ij/djkdNQ0o=
X-Received: by 2002:aca:4fce:: with SMTP id d197mr1862529oib.17.1600756790905; 
 Mon, 21 Sep 2020 23:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200911034431.29059-1-koba.ko@canonical.com>
 <5f99b65c8a092df343c68249f2bce62e4cd0abff.camel@redhat.com>
In-Reply-To: <5f99b65c8a092df343c68249f2bce62e4cd0abff.camel@redhat.com>
From: Koba Ko <koba.ko@canonical.com>
Date: Tue, 22 Sep 2020 14:39:40 +0800
Message-ID: <CAJB-X+VQH9yAhqkWJzAgiQzKtDStB3of2nCnQC02f079nMzcdA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dp_mst: Retrieve extended DPCD caps for topology
 manager
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:35 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Anthony Wong <anthony.wong@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 2:11 AM Lyude Paul <lyude@redhat.com> wrote:
>
> Hi, sorry I lost track of this until just now. Comments down below:
Sorry, the wrong base. I will modify it based on v2 and will send  v4.
>
> On Fri, 2020-09-11 at 11:44 +0800, Koba Ko wrote:
> > As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
> > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1, read the DP_DP13_DPCD_REV to
> > get the faster capability.
> > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0, read DP_DPCD_REV.
> >
> > Signed-off-by: Koba Ko <koba.ko@canonical.com>
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > ---
> > Changelog:
> > 1. Adjust the commit message.
> > 2. use drm_dbg_kms instead and print the return code.
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 14 +++-----------
> >  1 file changed, 3 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 7753c718ddf9..63f8809b9aa4 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -3671,8 +3671,6 @@ EXPORT_SYMBOL(drm_dp_read_mst_cap);
> >  int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr,
> > bool mst_state)
> >  {
> >       int ret = 0;
> > -     u8 dpcd_ext = 0;
> > -     unsigned int dpcd_offset = 0;
> >       struct drm_dp_mst_branch *mstb = NULL;
> >
> >       mutex_lock(&mgr->payload_lock);
> > @@ -3686,17 +3684,11 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> > drm_dp_mst_topology_mgr *mgr, bool ms
> >               struct drm_dp_payload reset_pay;
> >
> >               WARN_ON(mgr->mst_primary);
> > -             drm_dp_dpcd_read(mgr->aux,
> > -                              DP_TRAINING_AUX_RD_INTERVAL,
> > -                              &dpcd_ext, sizeof(dpcd_ext));
> > -
> > -             dpcd_offset =
> > -                     ((dpcd_ext & DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT)
> > ?  DP_DP13_DPCD_REV : DP_DPCD_REV);
>
>
> Uh, are you sure you formatted this patch correctly? None of these hunks are present upstream, this looks like it's a diff for the previous version of this patch that you sent out
> >
> >               /* get dpcd info */
> > -             ret = drm_dp_dpcd_read(mgr->aux, dpcd_offset, mgr->dpcd,
> > DP_RECEIVER_CAP_SIZE);
> > -             if (ret != DP_RECEIVER_CAP_SIZE) {
> > -                     DRM_DEBUG_KMS("failed to read DPCD\n");
> > +             ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
> > +             if (ret < 0) {
> > +                     drm_dbg_kms(mgr->dev, "failed to read DPCD, ret %d\n",
> > ret);
> >                       goto out_unlock;
> >               }
> >
> --
> Cheers,
>         Lyude Paul (she/her)
>         Software Engineer at Red Hat
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

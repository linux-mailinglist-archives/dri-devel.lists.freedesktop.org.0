Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D07276A91
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 09:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2814B899B3;
	Thu, 24 Sep 2020 07:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2526E923
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:18:03 +0000 (UTC)
Received: from mail-oi1-f199.google.com ([209.85.167.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <koba.ko@canonical.com>) id 1kL6Ww-0002VE-5M
 for dri-devel@lists.freedesktop.org; Wed, 23 Sep 2020 15:18:02 +0000
Received: by mail-oi1-f199.google.com with SMTP id d195so68268oig.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CHaSrO5fQTimRocsgf3/v1jCEFDsTCC2yOCCYjGBuy4=;
 b=KBa+r5R4EdxqNznQrGf+vNcClucsrVE9kM22Q3bh6f3YEEKegRNyDidRXFMKCjMb2G
 cltFR5ArsXFW4dyp5wJsddT6MeCus6772dSxPWbKeVS0YrUvblgTsV++RFPiANW2eUrD
 VIPJXNR75O+NL75GTSjdKUzeV7wFuNic4H9FaJRD51hHO6aPBEeQ3egUY8ZRpvrdU+A2
 dUU6KcZaPdu17XSXfQeISC6lujhu46CCxWPJsUUEunvv5Yh8o+HSmwbtaTQZ1Yg0E1u+
 brureSzgk7KWLCXgHiTMVszWYSNhUVoPn8xTQLJUXTTUVKPulUoeXKH2kQjoRGb376Ih
 yS2Q==
X-Gm-Message-State: AOAM530WoK81DJEnFeCpE3NkaROrO+Lmf9fMRZtGfokZ3XQZqDGqjrRb
 en7rEn0/u9m0eZAQS0t3YZ/OUBMK1jyLvq9aBCxkh/rRjpq7zBmsy4OhQtjYHMEwgBaWMXEXBLX
 5HYsbX+jsreMc677osncBnE6G6oRcWX1fdOfVOWmQXeBUoJIO2rlfSltBIj74XQ==
X-Received: by 2002:a4a:ad05:: with SMTP id r5mr167070oon.37.1600874281111;
 Wed, 23 Sep 2020 08:18:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxao2YxvBJXNL7N/K97K/iVn8OA04OFGTQdOYGl4VCYHeR2Od6148Y9T72WmSeKn1hpXdD+R406ak8NTUYonbk=
X-Received: by 2002:a4a:ad05:: with SMTP id r5mr167052oon.37.1600874280852;
 Wed, 23 Sep 2020 08:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200922065313.4794-1-koba.ko@canonical.com>
 <7231e2199a19aa6c8ecbecf5e80725e2a1aded73.camel@redhat.com>
 <CAJB-X+U0M1YXUyAX2nDxddwwxnPygfkk47PFrFnvERh4fUBxiw@mail.gmail.com>
 <9a4f2216cb621f349aa393de5d64763e4a23bc2b.camel@redhat.com>
In-Reply-To: <9a4f2216cb621f349aa393de5d64763e4a23bc2b.camel@redhat.com>
From: Koba Ko <koba.ko@canonical.com>
Date: Wed, 23 Sep 2020 23:17:49 +0800
Message-ID: <CAJB-X+W-s8zY9Z6AQbcFFLScyX90J=-xAzC9vDXSPP=Xj90azA@mail.gmail.com>
Subject: Re: [PATCH V4] drm/dp_mst: Retrieve extended DPCD caps for topology
 manager
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Approved-At: Thu, 24 Sep 2020 07:19:09 +0000
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
Content-Type: multipart/mixed; boundary="===============1761051591=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1761051591==
Content-Type: multipart/alternative; boundary="000000000000d7360205affc967c"

--000000000000d7360205affc967c
Content-Type: text/plain; charset="UTF-8"

Thanks a lot.

On Wed, Sep 23, 2020, 10:18 PM Lyude Paul <lyude@redhat.com> wrote:

> On Wed, 2020-09-23 at 10:16 +0800, Koba Ko wrote:
> > Thanks for the review.
> > Sorry for that I thought the review tag should be appended by myself.
> > One thing to confirm with you, will you or I push this patch to drm-misc-
> > next ?
>
> I already pushed it with the change, so everything is all set
>
> > Thanks a lot.
> >
> > On Wed, Sep 23, 2020 at 2:01 AM Lyude Paul <lyude@redhat.com> wrote:
> > > One last change I realized we should do is print the name of the AUX
> > > adapter
> > > in question. I don't mind just adding that myself before I push it
> though
> > > so
> > > you don't need to send a respin.
> > >
> > > Going to go push this to drm-misc-next, thanks!
> > >
> > > On Tue, 2020-09-22 at 14:53 +0800, Koba Ko wrote:
> > > > As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
> > > > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1,read the
> DP_DP13_DPCD_REV
> > > > to
> > > > get the faster capability.
> > > > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0,read DP_DPCD_REV.
> > > >
> > > > Signed-off-by: Koba Ko <koba.ko@canonical.com>
> > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_dp_mst_topology.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > index e87542533640..63f8809b9aa4 100644
> > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > @@ -3686,9 +3686,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> > > > drm_dp_mst_topology_mgr *mgr, bool ms
> > > >               WARN_ON(mgr->mst_primary);
> > > >
> > > >               /* get dpcd info */
> > > > -             ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV,
> mgr->dpcd,
> > > > DP_RECEIVER_CAP_SIZE);
> > > > -             if (ret != DP_RECEIVER_CAP_SIZE) {
> > > > -                     DRM_DEBUG_KMS("failed to read DPCD\n");
> > > > +             ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
> > > > +             if (ret < 0) {
> > > > +                     drm_dbg_kms(mgr->dev, "failed to read DPCD, ret
> > > > %d\n",
> > > > ret);
> > > >                       goto out_unlock;
> > > >               }
> > > >
> > > --
> > > Cheers,
> > >         Lyude Paul (she/her)
> > >         Software Engineer at Red Hat
> > >
> --
> Cheers,
>         Lyude Paul (she/her)
>         Software Engineer at Red Hat
>
>

--000000000000d7360205affc967c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks a lot.</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, Sep 23, 2020, 10:18 PM Lyude Paul &l=
t;<a href=3D"mailto:lyude@redhat.com">lyude@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On Wed, 2020-09-23 at 10:16 +0800, Koba =
Ko wrote:<br>
&gt; Thanks for the review.<br>
&gt; Sorry for that I thought the review tag should be appended by myself.<=
br>
&gt; One thing to confirm with you, will you or I push this patch to drm-mi=
sc-<br>
&gt; next ?<br>
<br>
I already pushed it with the change, so everything is all set<br>
<br>
&gt; Thanks a lot.<br>
&gt; <br>
&gt; On Wed, Sep 23, 2020 at 2:01 AM Lyude Paul &lt;<a href=3D"mailto:lyude=
@redhat.com" target=3D"_blank" rel=3D"noreferrer">lyude@redhat.com</a>&gt; =
wrote:<br>
&gt; &gt; One last change I realized we should do is print the name of the =
AUX<br>
&gt; &gt; adapter<br>
&gt; &gt; in question. I don&#39;t mind just adding that myself before I pu=
sh it though<br>
&gt; &gt; so<br>
&gt; &gt; you don&#39;t need to send a respin.<br>
&gt; &gt; <br>
&gt; &gt; Going to go push this to drm-misc-next, thanks!<br>
&gt; &gt; <br>
&gt; &gt; On Tue, 2020-09-22 at 14:53 +0800, Koba Ko wrote:<br>
&gt; &gt; &gt; As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PR=
ESENT.<br>
&gt; &gt; &gt; If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1,read the DP_D=
P13_DPCD_REV<br>
&gt; &gt; &gt; to<br>
&gt; &gt; &gt; get the faster capability.<br>
&gt; &gt; &gt; If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0,read DP_DPCD_=
REV.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Koba Ko &lt;<a href=3D"mailto:koba.ko@canonic=
al.com" target=3D"_blank" rel=3D"noreferrer">koba.ko@canonical.com</a>&gt;<=
br>
&gt; &gt; &gt; Reviewed-by: Lyude Paul &lt;<a href=3D"mailto:lyude@redhat.c=
om" target=3D"_blank" rel=3D"noreferrer">lyude@redhat.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/drm_dp_mst_topology.c | 6 +++---<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c<br>
&gt; &gt; &gt; b/drivers/gpu/drm/drm_dp_mst_topology.c<br>
&gt; &gt; &gt; index e87542533640..63f8809b9aa4 100644<br>
&gt; &gt; &gt; --- a/drivers/gpu/drm/drm_dp_mst_topology.c<br>
&gt; &gt; &gt; +++ b/drivers/gpu/drm/drm_dp_mst_topology.c<br>
&gt; &gt; &gt; @@ -3686,9 +3686,9 @@ int drm_dp_mst_topology_mgr_set_mst(st=
ruct<br>
&gt; &gt; &gt; drm_dp_mst_topology_mgr *mgr, bool ms<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_O=
N(mgr-&gt;mst_primary);<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* get=
 dpcd info */<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm=
_dp_dpcd_read(mgr-&gt;aux, DP_DPCD_REV, mgr-&gt;dpcd,<br>
&gt; &gt; &gt; DP_RECEIVER_CAP_SIZE);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=
=3D DP_RECEIVER_CAP_SIZE) {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0DRM_DEBUG_KMS(&quot;failed to read DPCD\n&quot;);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm=
_dp_read_dpcd_caps(mgr-&gt;aux, mgr-&gt;dpcd);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt=
; 0) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0drm_dbg_kms(mgr-&gt;dev, &quot;failed to read DPCD, ret<br=
>
&gt; &gt; &gt; %d\n&quot;,<br>
&gt; &gt; &gt; ret);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0goto out_unlock;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; <br>
&gt; &gt; --<br>
&gt; &gt; Cheers,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Lyude Paul (she/her)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Software Engineer at Red Hat<br>
&gt; &gt; <br>
-- <br>
Cheers,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Lyude Paul (she/her)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Software Engineer at Red Hat<br>
<br>
</blockquote></div>

--000000000000d7360205affc967c--

--===============1761051591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1761051591==--

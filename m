Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BD6352BE8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 18:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400B76E0EA;
	Fri,  2 Apr 2021 16:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9746E0EA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 16:07:55 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b14so8176598lfv.8
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4zHT2x3ySMXw8+V+pjhI625JZPnnGg5/07tX6+N7Amc=;
 b=ZHiUz+w8y5WfF+YotVYBobSveqPRSKeKQ+k9ZdDYv3lBDfawcCa1eqGSt8jINfzuiq
 nT/E/JUKqxXoXGuHdGhVeOPBIvqz1SN4eWEcTtqt/NoVm0tACYP4bhBJ8JA+U9yIefsW
 I1zOqslfbRafDCMwS67Q6YoCd3QkLcnh7IYv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4zHT2x3ySMXw8+V+pjhI625JZPnnGg5/07tX6+N7Amc=;
 b=ha5IFJws1sBg54JoJ0/OzsNPrbLrSEQnAcdBAlX4MzQg1P4AFLFkx7DgVI/Oy5AlPf
 QOzNIsjW77QWz4YBo3rBuMbvfFoh2IATvWwAxO3xKcu+MvcsvWWIk2FojIi/IADBajMq
 /ukTxoAO6im0UYHatIJjQ8j3CLozHJn6dpNQBJlTokZwLVNgu13SQFCe/brtivyk6BGZ
 PHZB7ShvE7RQlhfj3MlNkIN5qxRoFfsQ9kj5YR5HfAb82VU0pz5XzTcoNeKyI9OBsaV3
 ldOxVZmHCGyWuJ2lbmS91nV6wqsxDJxTIpmEtdc2DyY9g1Ze0sy9YFbJ2d/m3hlEGsZY
 v+6g==
X-Gm-Message-State: AOAM530cLnFRAiqQ0h/g3wqMxlZUtxQdJI9N2nLN4111XojFx1WHi5na
 wAxrSStuyMJYJl2npqMqtxTlWZca+QQtwg==
X-Google-Smtp-Source: ABdhPJymVBrGfPtZAoyN+OCgf+9aAml/DubERUFwqK8iW6EPuzsJC8BFVPZXs9nbira0t6pMY1a+2Q==
X-Received: by 2002:a05:6512:3a91:: with SMTP id
 q17mr8703156lfu.364.1617379673172; 
 Fri, 02 Apr 2021 09:07:53 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id q26sm896385lfm.53.2021.04.02.09.07.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 09:07:52 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id g8so8164203lfv.12
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 09:07:52 -0700 (PDT)
X-Received: by 2002:a19:488d:: with SMTP id v135mr9139718lfa.202.1617379672069; 
 Fri, 02 Apr 2021 09:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210331030439.1564032-1-vivek.kasireddy@intel.com>
 <20210331030439.1564032-2-vivek.kasireddy@intel.com>
 <20210331075958.ax4rqedbebnoad6x@sirius.home.kraxel.org>
 <BN7PR11MB2786BC5FE3B4F3D9D5E1AEA8897A9@BN7PR11MB2786.namprd11.prod.outlook.com>
In-Reply-To: <BN7PR11MB2786BC5FE3B4F3D9D5E1AEA8897A9@BN7PR11MB2786.namprd11.prod.outlook.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 2 Apr 2021 09:07:41 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=fUkiXNNZRXdDTBaXnsOC1kY3=4tuauZkurfXwvkRPEA@mail.gmail.com>
Message-ID: <CAAfnVB=fUkiXNNZRXdDTBaXnsOC1kY3=4tuauZkurfXwvkRPEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/virtio: Include modifier as part of
 set_scanout_blob
To: "Zhang, Tina" <tina.zhang@intel.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Content-Type: multipart/mixed; boundary="===============1732997702=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1732997702==
Content-Type: multipart/alternative; boundary="000000000000d26fbc05beff8c24"

--000000000000d26fbc05beff8c24
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 2, 2021 at 12:56 AM Zhang, Tina <tina.zhang@intel.com> wrote:

>
>
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Gerd
> > Hoffmann
> > Sent: Wednesday, March 31, 2021 4:00 PM
> > To: Kasireddy, Vivek <vivek.kasireddy@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; gurchetansingh@chromium.org
> > Subject: Re: [PATCH 2/2] drm/virtio: Include modifier as part of
> > set_scanout_blob
> >
> >   Hi,
> >
> > > -#define MAX_INLINE_CMD_SIZE   96
> > > +#define MAX_INLINE_CMD_SIZE   112
> >
> > Separate patch please.
> >
> > > --- a/include/uapi/linux/virtio_gpu.h
> > > +++ b/include/uapi/linux/virtio_gpu.h
> > > @@ -409,6 +409,7 @@ struct virtio_gpu_set_scanout_blob {
> > >     __le32 width;
> > >     __le32 height;
> > >     __le32 format;
> > > +   __le64 modifier;
> > >     __le32 padding;
> > >     __le32 strides[4];
> > >     __le32 offsets[4];
> >
> > Nope.  This breaks the virtio protocol.
> >
> > We'll need a virtio feature flag to negotiate modifier support between
> guest and
> > host.  When supported by both sides it can be used.  The new field
> should be
> > appended, not inserted in the middle.  Or we create a new
> > virtio_gpu_set_scanout_blob2 struct with new command for this.
> >
> > Also: I guess the device should provide a list of supported modifiers,
> maybe as
> > capset?
>
> Hi,
>
> I agree that we need a way to get the supported modifiers' info to guest
> user space mesa, specifically to the iris driver working in kmsro mode.
> So, from the guest mesa iris driver's point of view, the working flow may
> like this:
> 1) Get the modifier info from a display device through the kms_fd. In our
> case, the kms_fd comes from the virtio-gpu driver. So the info should come
> from virtio-gpu device.
> 2) When guest wants to allocate a scan-out buffer, the iris driver needs
> to check which format and modifier is suitable to be used.
> 3) Then, iris uses the kms_fd to allocate the scan-out buffer with the
> desired format.
>      Maybe this time we'd better consider using VIRTGPU_RESOURCE_CREATE to
> allocate buffer instead of using DRM_IOCTL_MODE_CREATE_DUMB. It seems
> VIRTGPU_RESUORECE_CREATE can give more fb info.
>

Thank you Tina and Vivek for looking into this!  Added some commentary on
your Mesa side MR.


>
> BR,
> Tina
>
> >
> > Note: I think it is already possible to create resources with modifiers
> when using
> > virgl commands for that.  Allowing modifiers with virgl=off too makes
> sense
> > given your use case, but we should not use diverging approaches for
> virgl=on vs.
> > virgl=off.  Specifically I'm not sure virtio_gpu_set_scanout_blob is the
> right place,
> > I think with virgl=on the modifier is linked to the resource not the
> scanout ...
> >
> > Cc'ing Gurchetan Singh for comments.
> >
> > take care,
> >   Gerd
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--000000000000d26fbc05beff8c24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 2, 2021 at 12:56 AM Zhang=
, Tina &lt;<a href=3D"mailto:tina.zhang@intel.com">tina.zhang@intel.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: dri-devel &lt;<a href=3D"mailto:dri-devel-bounces@lists.freedesk=
top.org" target=3D"_blank">dri-devel-bounces@lists.freedesktop.org</a>&gt; =
On Behalf Of Gerd<br>
&gt; Hoffmann<br>
&gt; Sent: Wednesday, March 31, 2021 4:00 PM<br>
&gt; To: Kasireddy, Vivek &lt;<a href=3D"mailto:vivek.kasireddy@intel.com" =
target=3D"_blank">vivek.kasireddy@intel.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blan=
k">dri-devel@lists.freedesktop.org</a>; <a href=3D"mailto:gurchetansingh@ch=
romium.org" target=3D"_blank">gurchetansingh@chromium.org</a><br>
&gt; Subject: Re: [PATCH 2/2] drm/virtio: Include modifier as part of<br>
&gt; set_scanout_blob<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt; &gt; -#define MAX_INLINE_CMD_SIZE=C2=A0 =C2=A096<br>
&gt; &gt; +#define MAX_INLINE_CMD_SIZE=C2=A0 =C2=A0112<br>
&gt; <br>
&gt; Separate patch please.<br>
&gt; <br>
&gt; &gt; --- a/include/uapi/linux/virtio_gpu.h<br>
&gt; &gt; +++ b/include/uapi/linux/virtio_gpu.h<br>
&gt; &gt; @@ -409,6 +409,7 @@ struct virtio_gpu_set_scanout_blob {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0__le32 width;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0__le32 height;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0__le32 format;<br>
&gt; &gt; +=C2=A0 =C2=A0__le64 modifier;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0__le32 padding;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0__le32 strides[4];<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0__le32 offsets[4];<br>
&gt; <br>
&gt; Nope.=C2=A0 This breaks the virtio protocol.<br>
&gt; <br>
&gt; We&#39;ll need a virtio feature flag to negotiate modifier support bet=
ween guest and<br>
&gt; host.=C2=A0 When supported by both sides it can be used.=C2=A0 The new=
 field should be<br>
&gt; appended, not inserted in the middle.=C2=A0 Or we create a new<br>
&gt; virtio_gpu_set_scanout_blob2 struct with new command for this.<br>
&gt; <br>
&gt; Also: I guess the device should provide a list of supported modifiers,=
 maybe as<br>
&gt; capset?<br>
<br>
Hi,<br>
<br>
I agree that we need a way to get the supported modifiers&#39; info to gues=
t user space mesa, specifically to the iris driver working in kmsro mode.<b=
r>
So, from the guest mesa iris driver&#39;s point of view, the working flow m=
ay like this:<br>
1) Get the modifier info from a display device through the kms_fd. In our c=
ase, the kms_fd comes from the virtio-gpu driver. So the info should come f=
rom virtio-gpu device.<br>
2) When guest wants to allocate a scan-out buffer, the iris driver needs to=
 check which format and modifier is suitable to be used.<br>
3) Then, iris uses the kms_fd to allocate the scan-out buffer with the desi=
red format.<br>
=C2=A0 =C2=A0 =C2=A0Maybe this time we&#39;d better consider using VIRTGPU_=
RESOURCE_CREATE to allocate buffer instead of using DRM_IOCTL_MODE_CREATE_D=
UMB. It seems VIRTGPU_RESUORECE_CREATE can give more fb info.<br></blockquo=
te><div><br></div><div>Thank you Tina and Vivek for looking into this!=C2=
=A0 Added some commentary on your Mesa side MR.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
BR,<br>
Tina<br>
<br>
&gt; <br>
&gt; Note: I think it is already possible to create resources with modifier=
s when using<br>
&gt; virgl commands for that.=C2=A0 Allowing modifiers with virgl=3Doff too=
 makes sense<br>
&gt; given your use case, but we should not use diverging approaches for vi=
rgl=3Don vs.<br>
&gt; virgl=3Doff.=C2=A0 Specifically I&#39;m not sure virtio_gpu_set_scanou=
t_blob is the right place,<br>
&gt; I think with virgl=3Don the modifier is linked to the resource not the=
 scanout ...<br>
&gt; <br>
&gt; Cc&#39;ing Gurchetan Singh for comments.<br>
&gt; <br>
&gt; take care,<br>
&gt;=C2=A0 =C2=A0Gerd<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
</blockquote></div></div>

--000000000000d26fbc05beff8c24--

--===============1732997702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1732997702==--

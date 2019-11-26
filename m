Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EE310AB76
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683C26E26C;
	Wed, 27 Nov 2019 08:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E186E098
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 12:08:13 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id 14so16347006oir.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 04:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4sMr3YJTQMNinyaxxtexwSt24LcO+/PUPsup0sd69nw=;
 b=II/3b2S6jgEk7t22atm05JxMKKtCeimkbGwwdebcnVWmHnnExN9mu7mgGShpdNA181
 /5HmfZizlWdDDtPBshVRWL6HLLLyMONVMzczt+Xet2bF0v7v3zzPuEsc7cG0+oXQXJwN
 TgNE99CcRAphnG+oXzfiODiIXdrOHxdlISJU1LNN6S8V7aOIZo2LKKNvRC9qQEpdm5mV
 JWtlbK920fyZC/sDJe5+cC8HfRV6UwlGmscGsNlPqNYHVacp5JheFc8kHI6RwQ55V2Oo
 OujL8gy5DEFrp1hdBYWN2nrXh84jtzvWLlipNnSrCZN6aUiB5/UDXb12esphRirT8L1t
 RnFA==
X-Gm-Message-State: APjAAAXtdweWDim6/xpuTYWQC9ZESUBaq+B/EzpCfNYGBSqQFVnEonqF
 +sPdnwfWrQi3fsUKXOogKvGmB298J2xXSR0R5J59UQ==
X-Google-Smtp-Source: APXvYqya2sWCQakri1xssLvXi3gOpYxhLbOLWzYEj2Wlm+zVmu6kYDVfZpEVf+ycHo7mZGSm2vRJJAesNBQvFmuylzY=
X-Received: by 2002:aca:3802:: with SMTP id f2mr3122877oia.93.1574770092146;
 Tue, 26 Nov 2019 04:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-5-jasowang@redhat.com>
 <20191118134056.GJ3873@mellanox.com>
 <20191118152642-mutt-send-email-mst@kernel.org>
 <20191118202843.GN3873@mellanox.com>
 <a09f528f-cfca-69cf-4728-91ff33c5caa7@redhat.com>
 <20191119123803.GA26739@mellanox.com>
 <d38abc98-b828-64cd-50cd-cb0d239e1696@redhat.com>
 <20191119141429.GF26739@mellanox.com>
 <3c3f8e30-bb75-3304-46b0-10a066ce1f42@redhat.com>
In-Reply-To: <3c3f8e30-bb75-3304-46b0-10a066ce1f42@redhat.com>
From: Rob Miller <rob.miller@broadcom.com>
Date: Tue, 26 Nov 2019 07:07:45 -0500
Message-ID: <CAJPjb1LMZVSB-dEvSS0kj2ymaGv+bYUV37RsbnwS_H3-qDcUUA@mail.gmail.com>
Subject: Re: [PATCH V13 4/6] mdev: introduce mediated virtio bus
To: Jason Wang <jasowang@redhat.com>
X-Mailman-Approved-At: Wed, 27 Nov 2019 08:09:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=4sMr3YJTQMNinyaxxtexwSt24LcO+/PUPsup0sd69nw=;
 b=DlD8kGb7W7T8+kgfzx6wZEH/tdS7okKbn4qboE2mJ58VqkRFzFycLjiSbABhzw6cul
 mOqBSslaJYy2rTuF8C2GTu3w2Oe2hWtULqsnEPOGr4SeX2Nz6kweVhzECdjsJDqkUgKe
 yVtaMobaouAkKKKRIwUve1Aj6ZFmI8i5mxNmA=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 Jason Gunthorpe <jgg@mellanox.com>,
 "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 Parav Pandit <parav@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "aadam@redhat.com" <aadam@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: multipart/mixed; boundary="===============1895139897=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1895139897==
Content-Type: multipart/alternative; boundary="000000000000f24cf705983ebb72"

--000000000000f24cf705983ebb72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 9:16 PM Jason Wang <jasowang@redhat.com> wrote:

>
> On 2019/11/19 =E4=B8=8B=E5=8D=8810:14, Jason Gunthorpe wrote:
> > On Tue, Nov 19, 2019 at 10:02:08PM +0800, Jason Wang wrote:
> >> On 2019/11/19 =E4=B8=8B=E5=8D=888:38, Jason Gunthorpe wrote:
> >>> On Tue, Nov 19, 2019 at 10:41:31AM +0800, Jason Wang wrote:
> >>>> On 2019/11/19 =E4=B8=8A=E5=8D=884:28, Jason Gunthorpe wrote:
> >>>>> On Mon, Nov 18, 2019 at 03:27:13PM -0500, Michael S. Tsirkin wrote:
> >>>>>> On Mon, Nov 18, 2019 at 01:41:00PM +0000, Jason Gunthorpe wrote:
> >>>>>>> On Mon, Nov 18, 2019 at 06:59:21PM +0800, Jason Wang wrote:
> >>>>>>>> +struct bus_type mdev_virtio_bus_type;
> >>>>>>>> +
> >>>>>>>> +struct mdev_virtio_device {
> >>>>>>>> +      struct mdev_device mdev;
> >>>>>>>> +      const struct mdev_virtio_ops *ops;
> >>>>>>>> +      u16 class_id;
> >>>>>>>> +};
> >>>>>>> This seems to share nothing with mdev (ie mdev-vfio), why is it o=
n
> the
> >>>>>>> same bus?
> >>>>>> I must be missing something - which bus do they share?
> >>>>> mdev_bus_type ?
> >>>>>
> >>>>> Jason
> >>>> Note: virtio has its own bus: mdev_virtio_bus_type. So they are not
> the same
> >>>> bus.
> >>> That is even worse, why involve struct mdev_device at all then?
> >>>
> >>> Jason
> >>
> >> I don't quite get the question here.
> > In the driver model the bus_type and foo_device are closely
> > linked.
>
>
> I don't get the definition of "closely linked" here. Do you think the
> bus and device implement virtual bus series are closely linked? If yes,
> how did they achieve that?
>
>
> >   Creating 'mdev_device' instances and overriding the bus_type
> > is a very abusive thing to do.
>
RJM>] abusive is a subjective term. Looking at the whole context of the
vDPA framework, I still believe that extending the mdev API is preferable.
Without the framework, every vendor would have to "mediate" their own
devices, which would force us to effectively "duplicate" the mdev core code
and implement our own functionality on top. The core idea of VIRTIO is to
have a common interface and having a framework that also supports a lot of
commonality is fantastic, since we (hw vendors) too, really want to get out
of the business of crafting/verify/maintaining device drivers for every
version of Linux/Windows/... Heck, i',m hoping that a generic sample vDPA
parent driver (ie: sort of like Intel's IFCVF driver but even more so)
would be good enough for our product such that we (Brcm) don't have to
supply any driver.

>
>
> Ok, mdev_device (without this series) had:
>
> struct mdev_device {
>      struct device dev;
>      struct mdev_parent *parent;
>      guid_t uuid;
>      void *driver_data;
>      struct list_head next;
>      struct kobject *type_kobj;
>      struct device *iommu_device;
>      bool active;
> };
>
> So it's nothing bus or VFIO specific. And what virtual bus had is:
>
> struct virtbus_device {
>      const char            *name;
>      int                id;
>      const struct virtbus_dev_id    *dev_id;
>      struct device            dev;
>          void                *data;
> };
>
> Are there any fundamental issues that you think mdev_device is abused? I
> won't expect the answers are generic objects like kobj, iommu device
> pointer etc.
>
>
> >
> >> My understanding for mdev is that it was a mediator between the driver
> and
> >> physical device when it's hard to let them talk directly due to the
> >> complexity of refactoring and maintenance.
> > Really, mdev is to support vfio with a backend other than PCI, nothing
> > more.
>
>
> That partially explain why it was called mdev. So for virito, we want
> standard virtio driver to talk with a backend other than virtio.
>
> For the issue of PCI, actually the API is generic enough to support
> device other than PCI, e.g AP bus.
>
>
> >
> > Abusing it for other things is not appropriate. ie creating an
> > instance and not filling in most of the vfio focused ops is an abusive
> > thing to do.
>
>
> Well, it's only half of the mdev_parent_ops in mdev_parent, various
> methods could be done do be more generic to avoid duplication of codes. N=
o?
>
>
> >
> >> hardware that can offload virtio datapath but not control path. We wan=
t
> to
> >> present a unified interface (standard virtio) instead of a vendor
> specific
> >> interface, so a mediator level in the middle is a must. For virtio
> driver,
> >> mediator present a full virtio compatible device. For hardware, mediat=
or
> >> will mediate the difference between the behavior defined by virtio spe=
c
> and
> >> real hardware.
> > If you need to bind to the VFIO driver then mdev is the right thing to
> > use, otherwise it is not.
> >
> > It certainly should not be used to bind to random kernel drivers. This
> > problem is what this virtual bus idea Intel is working on might solve.
>
>
> What do you mean by random here? With this series, we have dedicated bus
> and dedicated driver with matching method to make sure the binding is
> correct.
>
RJM>] I think it's pretty clear that it's not random. The class id takes
care of the match and allows flexibility to choose vhost-mdev vs
vitrio-mdev, depending if the deployment is bare-metal vs virtualized.

>
>
> >
> > It seems the only thing people care about with mdev is the GUID
> > lifecycle stuff, but at the same time folks like Parav are saying they
> > don't want to use that lifecycle stuff and prefer devlink
> > instead.
>
>
> I'm sure you will need to handle other issues besides GUID which had
> been settled by mdev e.g IOMMU and types when starting to write a real
> hardware driver.
>
>
> >
> > Most likely, at least for virtio-net, everyone else will be able to
> > use devlink as well, making it much less clear if that GUID lifecycle
> > stuff is a good idea or not.
>
>
> This assumption is wrong, we hard already had at least two concrete
> examples of vDPA device that doesn't use devlink:
>
> - Intel IFC where virtio is done at VF level
> - Ali Cloud ECS instance where virtio is done at PF level
>
> Again, the device slicing is only part of our goal. The major goal is to
> have a mediator level that can take over the virtio control path between
> a standard virtio driver and a hardware who datapath is virtio
> compatible but not control path.
>
> Thanks
>
>
> >
> > Jason
>
>

--000000000000f24cf705983ebb72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 19, 2019 at 9:16 PM Jason=
 Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">jasowang=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
On 2019/11/19 =E4=B8=8B=E5=8D=8810:14, Jason Gunthorpe wrote:<br>
&gt; On Tue, Nov 19, 2019 at 10:02:08PM +0800, Jason Wang wrote:<br>
&gt;&gt; On 2019/11/19 =E4=B8=8B=E5=8D=888:38, Jason Gunthorpe wrote:<br>
&gt;&gt;&gt; On Tue, Nov 19, 2019 at 10:41:31AM +0800, Jason Wang wrote:<br=
>
&gt;&gt;&gt;&gt; On 2019/11/19 =E4=B8=8A=E5=8D=884:28, Jason Gunthorpe wrot=
e:<br>
&gt;&gt;&gt;&gt;&gt; On Mon, Nov 18, 2019 at 03:27:13PM -0500, Michael S. T=
sirkin wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Mon, Nov 18, 2019 at 01:41:00PM +0000, Jason Gu=
nthorpe wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mon, Nov 18, 2019 at 06:59:21PM +0800, Jaso=
n Wang wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +struct bus_type mdev_virtio_bus_type;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +struct mdev_virtio_device {<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 struct mdev_device m=
dev;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 const struct mdev_vi=
rtio_ops *ops;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 u16 class_id;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +};<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; This seems to share nothing with mdev (ie mdev=
-vfio), why is it on the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; same bus?<br>
&gt;&gt;&gt;&gt;&gt;&gt; I must be missing something - which bus do they sh=
are?<br>
&gt;&gt;&gt;&gt;&gt; mdev_bus_type ?<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Jason<br>
&gt;&gt;&gt;&gt; Note: virtio has its own bus: mdev_virtio_bus_type. So the=
y are not the same<br>
&gt;&gt;&gt;&gt; bus.<br>
&gt;&gt;&gt; That is even worse, why involve struct mdev_device at all then=
?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Jason<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t quite get the question here.<br>
&gt; In the driver model the bus_type and foo_device are closely<br>
&gt; linked.<br>
<br>
<br>
I don&#39;t get the definition of &quot;closely linked&quot; here. Do you t=
hink the <br>
bus and device implement virtual bus series are closely linked? If yes, <br=
>
how did they achieve that?<br>
<br>
<br>
&gt;=C2=A0 =C2=A0Creating &#39;mdev_device&#39; instances and overriding th=
e bus_type<br>
&gt; is a very abusive thing to do.<br></blockquote><div>RJM&gt;] abusive i=
s a subjective term. Looking at the whole context of the vDPA framework, I =
still believe that extending the mdev API is preferable. Without the framew=
ork, every vendor would have to &quot;mediate&quot; their own devices, whic=
h would force us to effectively &quot;duplicate&quot; the mdev core code an=
d implement our own functionality on top. The core idea of VIRTIO is to hav=
e a common interface and having a framework that also supports a lot of com=
monality is fantastic, since we (hw vendors) too, really want to get out of=
 the business of crafting/verify/maintaining device drivers for every versi=
on of Linux/Windows/... Heck, i&#39;,m hoping that a generic sample vDPA pa=
rent driver (ie: sort of like Intel&#39;s IFCVF driver but even more so) wo=
uld be good enough for our product such that we (Brcm) don&#39;t have to su=
pply any driver.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Ok, mdev_device (without this series) had:<br>
<br>
struct mdev_device {<br>
=C2=A0=C2=A0=C2=A0=C2=A0 struct device dev;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 struct mdev_parent *parent;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 guid_t uuid;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 void *driver_data;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head next;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 struct kobject *type_kobj;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 struct device *iommu_device;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 bool active;<br>
};<br>
<br>
So it&#39;s nothing bus or VFIO specific. And what virtual bus had is:<br>
<br>
struct virtbus_device {<br>
=C2=A0=C2=A0=C2=A0=C2=A0 const char=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 *name;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 int=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0 id;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 const struct virtbus_dev_id=C2=A0=C2=A0=C2=A0 *dev=
_id;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 struct device=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 dev;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 *data;<br>
};<br>
<br>
Are there any fundamental issues that you think mdev_device is abused? I <b=
r>
won&#39;t expect the answers are generic objects like kobj, iommu device <b=
r>
pointer etc.<br>
<br>
<br>
&gt;<br>
&gt;&gt; My understanding for mdev is that it was a mediator between the dr=
iver and<br>
&gt;&gt; physical device when it&#39;s hard to let them talk directly due t=
o the<br>
&gt;&gt; complexity of refactoring and maintenance.<br>
&gt; Really, mdev is to support vfio with a backend other than PCI, nothing=
<br>
&gt; more.<br>
<br>
<br>
That partially explain why it was called mdev. So for virito, we want <br>
standard virtio driver to talk with a backend other than virtio.<br>
<br>
For the issue of PCI, actually the API is generic enough to support <br>
device other than PCI, e.g AP bus.<br>
<br>
<br>
&gt;<br>
&gt; Abusing it for other things is not appropriate. ie creating an<br>
&gt; instance and not filling in most of the vfio focused ops is an abusive=
<br>
&gt; thing to do.<br>
<br>
<br>
Well, it&#39;s only half of the mdev_parent_ops in mdev_parent, various <br=
>
methods could be done do be more generic to avoid duplication of codes. No?=
<br>
<br>
<br>
&gt;<br>
&gt;&gt; hardware that can offload virtio datapath but not control path. We=
 want to<br>
&gt;&gt; present a unified interface (standard virtio) instead of a vendor =
specific<br>
&gt;&gt; interface, so a mediator level in the middle is a must. For virtio=
 driver,<br>
&gt;&gt; mediator present a full virtio compatible device. For hardware, me=
diator<br>
&gt;&gt; will mediate the difference between the behavior defined by virtio=
 spec and<br>
&gt;&gt; real hardware.<br>
&gt; If you need to bind to the VFIO driver then mdev is the right thing to=
<br>
&gt; use, otherwise it is not.<br>
&gt;<br>
&gt; It certainly should not be used to bind to random kernel drivers. This=
<br>
&gt; problem is what this virtual bus idea Intel is working on might solve.=
<br>
<br>
<br>
What do you mean by random here? With this series, we have dedicated bus <b=
r>
and dedicated driver with matching method to make sure the binding is <br>
correct.<br></blockquote><div>RJM&gt;] I think it&#39;s pretty clear that i=
t&#39;s not random. The class id takes care of the match and allows flexibi=
lity to choose=C2=A0vhost-mdev vs vitrio-mdev, depending if the deployment =
is bare-metal vs virtualized.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
<br>
&gt;<br>
&gt; It seems the only thing people care about with mdev is the GUID<br>
&gt; lifecycle stuff, but at the same time folks like Parav are saying they=
<br>
&gt; don&#39;t want to use that lifecycle stuff and prefer devlink<br>
&gt; instead.<br>
<br>
<br>
I&#39;m sure you will need to handle other issues besides GUID which had <b=
r>
been settled by mdev e.g IOMMU and types when starting to write a real <br>
hardware driver.<br>
<br>
<br>
&gt;<br>
&gt; Most likely, at least for virtio-net, everyone else will be able to<br=
>
&gt; use devlink as well, making it much less clear if that GUID lifecycle<=
br>
&gt; stuff is a good idea or not.<br>
<br>
<br>
This assumption is wrong, we hard already had at least two concrete <br>
examples of vDPA device that doesn&#39;t use devlink:<br>
<br>
- Intel IFC where virtio is done at VF level<br>
- Ali Cloud ECS instance where virtio is done at PF level<br>
<br>
Again, the device slicing is only part of our goal. The major goal is to <b=
r>
have a mediator level that can take over the virtio control path between <b=
r>
a standard virtio driver and a hardware who datapath is virtio <br>
compatible but not control path.<br>
<br>
Thanks<br>
<br>
<br>
&gt;<br>
&gt; Jason<br>
<br>
</blockquote></div></div>

--000000000000f24cf705983ebb72--

--===============1895139897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1895139897==--

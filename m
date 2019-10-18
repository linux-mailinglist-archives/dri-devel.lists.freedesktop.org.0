Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECE4DC0C2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 11:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D54E6EB07;
	Fri, 18 Oct 2019 09:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8876EB05;
 Fri, 18 Oct 2019 09:21:43 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w6so4164624lfl.2;
 Fri, 18 Oct 2019 02:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=aMi6iIKI/Dq5LhNafxb5hvAvopwP53lOf5007z5FwGQ=;
 b=MRZ8XjxbEjwUm8PyBxkvViP1KboL9PlNmU9A1b3zykWgfNg1oPww9BknrEXeiSNob7
 xBX2tMfORfYfkVFsVCZjQUSlxT19mys7PjxH7bTdw9Ht+J2fsVa0nI5mIK39t491IKjV
 UfoQ5Nrmq/VyZv2NHA5EC3pMZ6TS1PlUBcRDz04O4+7RE9hCg63Gq1k3mM+1Fq3HNY/h
 W3kzdhCuCCIZEayKcCh4EuMWt2HT2oord8M+xri0GMWRIjWzYd+An5DbA1NubRj1d30H
 r0RMZKYd7hYHug+z3VLcWGMMUt9Q1A/gJdp6kd7HIwbpgQ8NKZfkD2aLS9kbLM97Hmd8
 iBlA==
X-Gm-Message-State: APjAAAW3dfULQ25GGzxhaRd0nobHu7dr1thBGZt7r0WXe6G7d6f0rTzU
 AD9jq5AaSApNB8Q94IO4O5w=
X-Google-Smtp-Source: APXvYqxCyARUo+rMRU+MxdlY/LL1Yci/5s+yf6oGU3MQUcoDguz8QUwl5t9hFINHgUjzXDsakvJ8vw==
X-Received: by 2002:a19:9144:: with SMTP id y4mr272135lfj.168.1571390501648;
 Fri, 18 Oct 2019 02:21:41 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b141sm2331410lfg.67.2019.10.18.02.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 02:21:40 -0700 (PDT)
Date: Fri, 18 Oct 2019 12:21:30 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Drew DeVault <sir@cmpwn.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v7] unstable/drm-lease: DRM lease protocol support
Message-ID: <20191018122130.0f880724@eldfell.localdomain>
In-Reply-To: <20191017174527.181547-1-sir@cmpwn.com>
References: <20191017174527.181547-1-sir@cmpwn.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=aMi6iIKI/Dq5LhNafxb5hvAvopwP53lOf5007z5FwGQ=;
 b=U9y0vvs1kS5lmhmotJV+zUL7fv4hC7QO8zeYcOHrFLAj3swgBnzNnbzlon86H6ldQU
 tBK4tU1k1yRjEfmHQmmPbEqwscLoo5iAzGe/2WOw9UUGBJYZ262kwY/QhPa0CG29XZ2A
 BkJ3NZ4uvOUSqyGuB6JUA8W0ip2sEvb7R9BYqcjUlYYV3t7vB3l6t0LriMwaZoVq2OS3
 pSlzRr+I7MLLdJttea8/+lgqooRULmQxN616cHOonNJjVNcCJSSoHbA+unfUQIT0kaGM
 35+5mLg938XMij7KmDBGhjz65MEN0TJIK/qQbfdhsTPpxTgmfIDJ/1Y8/CYCZtY6YzNA
 vrWA==
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
Cc: Marius Vlad <marius.vlad@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1881157573=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1881157573==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BJihJQ73RdkQyfz_wrbAj_W"; protocol="application/pgp-signature"

--Sig_/BJihJQ73RdkQyfz_wrbAj_W
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Oct 2019 13:45:27 -0400
Drew DeVault <sir@cmpwn.com> wrote:

> From: Marius Vlad <marius.vlad@collabora.com>
>=20
> DRM leasing is a feature which allows the DRM master to "lease" a subset
> of its DRM resources to another DRM master via drmModeCreateLease, which
> returns a file descriptor for the new DRM master. We use this protocol
> to negotiate the terms of the lease and transfer this file descriptor to
> clients.
>=20
> In less DRM-specific terms: this protocol allows Wayland compositors to
> give over their GPU resources (like displays) to a Wayland client to
> exclusively control.
>=20
> The primary use-case for this is Virtual Reality headsets, which via the
> non-desktop DRM property are generally not used as desktop displays by
> Wayland compositors, and for latency reasons (among others) are most
> useful to games et al if they have direct control over the DRM resources
> associated with it. Basically, these are peripherals which are of no use
> to the compositor and may be of use to a client, but since they are tied
> up in DRM we need to use DRM leasing to get them into client's hands.
>=20
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Drew DeVault <sir@cmpwn.com>
> ---
> v7's main change is that, upon binding to the drm_lease_manager, the
> server now sends along a non-master DRM fd for the client to use to
> enumerate resources. For this reason, the EDID event has been removed
> from the connector interface, under the assumption that clients who want
> to examine the EDID will line the connnector ID up with the appropriate
> resources from DRM.

Hi Drew,

thanks for this, I really hope it works out since the protocol is so
neat and tidy now.

One thing I did not know the last time was that apparently
systemd-logind may not like to give out non-master DRM fds. That might
need fixing in logind implementations. I hope someone would step up to
look into that.

I'm CC'ing dri-devel and Daniel Vetter to get some kernel side review
for the non-master DRM fd idea:

This protocol aims to deliver a harmless "read-only" DRM device file
description to a client, so that the client can enumerate all DRM
resources, fetch EDID and other properties to be able to decide which
connector it would want to lease. The client should not be able to
change any KMS state through this fd, and it should not be able to e.g.
spy on display contents. The assumption is that a non-master DRM fd
from a fresh open() would be fine for this, but is it?

If it is not, could we make one that is? Simply giving out an fd for
the client to inspect with standard DRM ioctls is just so convenient.


**

I wouldn't mind if the below links were part of the proper commit
message.

> Updated patches are available for:
>=20
> wlroots:  https://github.com/swaywm/wlroots/pull/1730
> sway:     https://github.com/swaywm/sway/pull/4289
> kmscube:  https://git.sr.ht/~sircmpwn/kmscube
> Xwayland: https://gitlab.freedesktop.org/xorg/xserver/merge_requests/248
>=20
> Additionally, the Vulkan extension has been polished up:
>=20
> https://github.com/KhronosGroup/Vulkan-Docs/pull/1001
>=20
> A new implementation for Mesa's Vulkan WSI implementation will be
> available soon, as well as an implementation of the Wayland extension
> for Monado.
>=20
>  Makefile.am                                  |   1 +
>  unstable/drm-lease/README                    |   5 +
>  unstable/drm-lease/drm-lease-unstable-v1.xml | 246 +++++++++++++++++++
>  3 files changed, 252 insertions(+)
>  create mode 100644 unstable/drm-lease/README
>  create mode 100644 unstable/drm-lease/drm-lease-unstable-v1.xml
>=20
> diff --git a/Makefile.am b/Makefile.am
> index 345ae6a..d9fff89 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -4,6 +4,7 @@ unstable_protocols =3D								\
>  	unstable/pointer-gestures/pointer-gestures-unstable-v1.xml		\
>  	unstable/fullscreen-shell/fullscreen-shell-unstable-v1.xml		\
>  	unstable/linux-dmabuf/linux-dmabuf-unstable-v1.xml			\
> +	unstable/drm-lease/drm-lease-unstable-v1.xml				\
>  	unstable/text-input/text-input-unstable-v1.xml				\
>  	unstable/text-input/text-input-unstable-v3.xml				\
>  	unstable/input-method/input-method-unstable-v1.xml			\
> diff --git a/unstable/drm-lease/README b/unstable/drm-lease/README
> new file mode 100644
> index 0000000..16f8551
> --- /dev/null
> +++ b/unstable/drm-lease/README
> @@ -0,0 +1,5 @@
> +Linux DRM lease
> +
> +Maintainers:
> +Drew DeVault <sir@cmpwn.com>
> +Marius Vlad <marius-cristian.vlad@nxp.com>

Marius' email address probably needs refreshing?


> diff --git a/unstable/drm-lease/drm-lease-unstable-v1.xml b/unstable/drm-=
lease/drm-lease-unstable-v1.xml
> new file mode 100644
> index 0000000..5fbc0e3
> --- /dev/null
> +++ b/unstable/drm-lease/drm-lease-unstable-v1.xml
> @@ -0,0 +1,246 @@
> +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +<protocol name=3D"drm_lease_unstable_v1">
> +  <copyright>
> +    Copyright =C2=A9 2018 NXP
> +    Copyright =C2=A9 2019 Status Research &amp; Development GmbH.
> +
> +    Permission is hereby granted, free of charge, to any person obtainin=
g a
> +    copy of this software and associated documentation files (the "Softw=
are"),
> +    to deal in the Software without restriction, including without limit=
ation
> +    the rights to use, copy, modify, merge, publish, distribute, sublice=
nse,
> +    and/or sell copies of the Software, and to permit persons to whom the
> +    Software is furnished to do so, subject to the following conditions:
> +
> +    The above copyright notice and this permission notice (including the=
 next
> +    paragraph) shall be included in all copies or substantial portions o=
f the
> +    Software.
> +
> +    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
> +    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
> +    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT S=
HALL
> +    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER
> +    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
> +    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> +    DEALINGS IN THE SOFTWARE.
> +  </copyright>
> +
> +  <interface name=3D"zwp_drm_lease_manager_v1" version=3D"1">
> +    <description summary=3D"lease manager">
> +      This protocol is used by Wayland compositors which act as Direct
> +      Renderering Manager (DRM) masters to lease DRM resources to Wayland
> +      clients. Once leased, the compositor will not use the leased resou=
rces
> +      until the lease is revoked or the client closes the file descripto=
r. The
> +      compositor will advertise one zwp_drm_lease_manager_v1 for each DR=
M node
> +      which has resources available for leasing.

Ok, that takes care of the multi-card case. It also nicely identifies
which device a connector is from.

> +
> +      The lease manager is used to advertise connectors which are availa=
ble for
> +      leasing, and by the client to negotiate a lease request.
> +
> +      Warning! The protocol described in this file is experimental and
> +      backward incompatible changes may be made. Backward compatible cha=
nges
> +      may be added together with the corresponding interface version bum=
p.
> +      Backward incompatible changes are done by bumping the version numb=
er in
> +      the protocol and interface names and resetting the interface versi=
on.
> +      Once the protocol is to be declared stable, the 'z' prefix and the
> +      version number in the protocol and interface names are removed and=
 the
> +      interface version number is reset.
> +    </description>
> +
> +    <enum name=3D"error">
> +      <entry name=3D"stopped_manager" value=3D"0"
> +        summary=3D"request sent to a manager which has been stopped"/>
> +    </enum>
> +
> +    <request name=3D"create_lease_request">
> +      <description summary=3D"create a lease request object">
> +        Creates a lease request object.
> +
> +        See the documentation for zwp_drm_lease_request_v1 for details.
> +      </description>
> +      <arg name=3D"id" type=3D"new_id" interface=3D"zwp_drm_lease_reques=
t_v1" />
> +    </request>
> +
> +    <request name=3D"stop">
> +      <description summary=3D"stop sending events">
> +        Indicates the client no longer wishes to receive connector event=
s. The
> +        compositor may still send connector events until it sends the fi=
nish
> +        event, however.
> +
> +        The client must not send any requests after this one.
> +      </description>
> +    </request>
> +
> +    <event name=3D"drm_fd">
> +      <description summary=3D"open a non-master fd for this DRM node">
> +        The compositor will send this event when the zwp_drm_lease_manag=
er_v1
> +        global is bound. The included fd is a non-master DRM file descri=
ptor
> +        opened for this device. The purpose of this event is to give the=
 client
> +        the ability to query DRM and discover information which may help=
 them
> +        pick the appropriate DRM device or select the appropriate connec=
tors
> +        therein.
> +      </description>
> +      <arg name=3D"fd" type=3D"fd" summary=3D"DRM file descriptor" />
> +    </event>
> +
> +    <event name=3D"connector">
> +      <description summary=3D"advertise connectors available for leases">
> +        The compositor may choose to advertise 0 or more connectors whic=
h may be
> +        leased to clients, and will use this event to do so. This object=
 may be
> +        passed into a lease request to lease that connector. See
> +        zwp_drm_lease_request_v1.add_connector for details.
> +
> +        When this global is bound, the compositor will send all connecto=
rs
> +        available for lease, but may send additional connectors at any t=
ime.
> +      </description>
> +      <arg name=3D"id" type=3D"new_id" interface=3D"zwp_drm_lease_connec=
tor_v1" />
> +    </event>
> +
> +    <event name=3D"finished">
> +      <description summary=3D"the compositor has finished using the mana=
ger">
> +        This event indicates that the compositor is done sending connect=
or
> +        events. The compositor will destroy this object immediately after
> +        sending this event, and it will become invalid. The client should
> +        release any resources associated with this manager after receivi=
ng this
> +        event.
> +      </description>
> +    </event>
> +  </interface>
> +
> +  <interface name=3D"zwp_drm_lease_connector_v1" version=3D"1">
> +    <description summary=3D"a leasable DRM connector">
> +      Represents a DRM connector which is available for lease. These obj=
ects are
> +      created via zwp_drm_lease_manager_v1.connector, and should be pass=
ed into
> +      lease requests via zwp_drm_lease_request_v1.add_connector.
> +    </description>
> +
> +    <event name=3D"name">
> +      <description summary=3D"name">
> +        The compositor sends this event once the connector is created to
> +        indicate the name of this connector. This will not change for the
> +        duration of the Wayland session, but is not guaranteed to be con=
sistent
> +        between sessions.
> +
> +        If the compositor also supports zxdg_output_manager_v1 and this
> +        connector corresponds to a zxdg_output_v1, this name will match =
the
> +        name of this zxdg_output_v1 object.
> +      </description>
> +      <arg name=3D"name" type=3D"string" summary=3D"connector name" />
> +    </event>
> +
> +    <event name=3D"description">
> +      <description summary=3D"description">
> +        The compositor sends this event once the connector is created to=
 provide
> +        a human-readable description for this connector, which may be pr=
esented
> +        to the user.
> +      </description>
> +      <arg name=3D"description" type=3D"string" summary=3D"connector des=
cription" />
> +    </event>
> +
> +    <event name=3D"connector_id">
> +      <description summary=3D"connector_id">
> +        The compositor will send this event to indicate the DRM ID which
> +        represents the underlying connector which is being offered. Note=
 that
> +        the final lease may include additional object IDs, such as CRTCs=
 and
> +        planes.
> +      </description>
> +      <arg name=3D"connector_id" type=3D"int" summary=3D"DRM Connector I=
D" />
> +    </event>
> +
> +    <event name=3D"withdrawn">
> +      <description summary=3D"lease offer withdrawn">
> +        Sent to indicate that the compositor will no longer honor reques=
ts for
> +        DRM leases which include this connector. The client may still is=
sue a
> +        lease request including this connector, but the compositor will =
send
> +        zwp_drm_lease_v1.finished without issuing a lease fd.
> +      </description>
> +    </event>
> +
> +    <request name=3D"destroy" type=3D"destructor">
> +      <description summary=3D"destroy connector">
> +        The client may send this request to indicate that it will not is=
sue a
> +        lease request for this connector. Clients are encouraged to send=
 this
> +        after receiving the "withdrawn" request so that the server can r=
elease
> +        the resources associated with this connector offer.
> +      </description>
> +    </request>
> +  </interface>
> +
> +  <interface name=3D"zwp_drm_lease_request_v1" version=3D"1">
> +    <description summary=3D"DRM lease request">
> +      A client that wishes to lease DRM resources will attach the list of
> +      connectors advertised with zwp_drm_lease_manager_v1.connector that=
 they
> +      wish to lease, then use zwp_drm_lease_request_v1.submit to submit =
the
> +      request.
> +    </description>
> +
> +    <enum name=3D"error">
> +      <entry name=3D"submitted_lease" value=3D"0"
> +        summary=3D"attempted to reuse a submitted lease"/>
> +    </enum>
> +
> +    <request name=3D"destroy" type=3D"destructor">
> +      <description summary=3D"destroys the lease request object">
> +        Indicates that the client will no longer use this lease request.
> +      </description>
> +    </request>
> +
> +    <request name=3D"request_connector">
> +       <description summary=3D"request a connector for this lease">
> +         Indicates that the client would like to lease the given connect=
or.
> +         This is only used as a suggestion, the compositor may choose to
> +         include any resources in the lease it issues, or change the set=
 of
> +         leased resources at any time.
> +       </description>
> +       <arg name=3D"connector" type=3D"object"
> +         interface=3D"zwp_drm_lease_connector_v1" />

Don't we need a protocol error defined for the case, where the client
uses a zwp_drm_lease_connector_v1 from a different global? That is,
attempting to lease a connector from the wrong device.

If that was an error, then it would make sure that one cannot lease a
mix across multiple devices in one go. I don't think leasing a mix
across multiple devices could work, given only one DRM lease fd should
be delivered.

> +    </request>
> +
> +    <request name=3D"submit">
> +       <description summary=3D"submit the lease request">
> +         Submits the lease request and creates a new zwp_drm_lease_v1 ob=
ject.
> +         After calling submit, issuing any other request than destroy is=
 a
> +         protocol error.
> +       </description>
> +       <arg name=3D"id" type=3D"new_id" interface=3D"zwp_drm_lease_v1" />
> +    </request>
> +  </interface>
> +
> +  <interface name=3D"zwp_drm_lease_v1" version=3D"1">
> +    <description summary=3D"a DRM lease">
> +      A DRM lease object is used to transfer the DRM file descriptor to =
the
> +      client and manage the lifetime of the lease.
> +    </description>
> +
> +    <event name=3D"lease_fd">
> +      <description summary=3D"shares the DRM file descriptor">
> +        This event returns a file descriptor suitable for use with DRM-r=
elated
> +        ioctls. The client should use drmModeGetLease to enumerate the D=
RM
> +        objects which have been leased to them. If the compositor cannot=
 or

Isn't the wording about drmModeGetLease() wrong here? The client can
only see the leased resources through that fd, no matter what it does,
right?

> +        will not grant a lease for the requested connectors, it will not=
 send
> +        this event, instead sending the finished event immediately.
> +
> +        It is a protocol error for the compositor to send this event mor=
e than
> +        once for a given lease.
> +      </description>
> +      <arg name=3D"leased_fd" type=3D"fd" summary=3D"leased DRM file des=
criptor" />
> +    </event>
> +
> +    <event name=3D"finished">
> +      <description summary=3D"sent when the lease has been revoked">
> +        When the compositor revokes the lease, it will issue this event =
to
> +        notify clients of the change. If the client requires a new lease=
, they
> +        should destroy this object and submit a new lease request. The
> +        compositor will send no further events for this object after sen=
ding
> +        the finish event.
> +      </description>
> +    </event>
> +
> +    <request name=3D"destroy" type=3D"destructor">
> +      <description summary=3D"destroys the lease object">
> +        The client should send this to indicate that it no longer wishes=
 to use
> +        this lease. The compositor should use drmModeRevokeLease on the
> +        appropriate file descriptor, if necessary, then release this obj=
ect.
> +      </description>
> +    </request>
> +  </interface>
> +</protocol>

This seems to be in a very good shape now.


Thanks,
pq

--Sig_/BJihJQ73RdkQyfz_wrbAj_W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2phBoACgkQI1/ltBGq
qqeWBhAAsGFxCy22w3/hSf+9s9TaGTHfMi/fKr4HrN2h1PnaAH1jTAfkO/HeRgSS
3EcfggInXKKh5v21jnG+0cNLPJhbBFdbfSvU6VrmplYM0t8LJz5/3MxRrk+8uHdh
bsFRU9p2kfa35GxSDGhJgjYVYjVZuoe+TLeMKSX9B9QOqk+OX5KDWNLvwtL29Zns
Ah9qUgV/HRwYEwmVgid/UHQ582M/z7k1WKhe0FcB/QwvPTOBFr+xXyRf+HRMPuyS
N38kmFj46l5rwXByZ12AXL1spaX2Shp6iuaxk/TjbXOjx9yFHOXVLgc9YorgR7Yk
Ym4RfMqNkPJ1Jm3MC+DSdxY1VUR7jZqDQq8vB8nTDO9gAxYctUnV5HfCzFoaOf3M
x4A4rbUF7HXISuE1QhgV5VjzWU2eCgH97sr3uOfcKYbetGMoI91jkGjMHEa+iFfB
QFAEtF/SKg3DAUTgAb1fw+ahRM366PYxSo8Ywq29352cmnyRf+e/Jogd9ywVKZiZ
28a8THm+LxZOXeMJCQmPPZAdU7jR5cfWmcgSYBbr8k7pZ0mHRb6wTSlVrqa4qjVN
XMDxSsKTIvvLzcLieVu7/k8iLymHkdww3Yc0h6AbBxrxdRp+nvzT+WR2dp2NWrkt
Zr/v7eigP2mrDvkVBos8zXFzA11EeqOUMV04Ua/YPiFYCZ6V/T8=
=Dney
-----END PGP SIGNATURE-----

--Sig_/BJihJQ73RdkQyfz_wrbAj_W--

--===============1881157573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1881157573==--

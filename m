Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCD1390440
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 16:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40D56E2E3;
	Tue, 25 May 2021 14:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB346E122;
 Tue, 25 May 2021 14:45:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621953952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=v2yNqAnqlLGqrvEfsznqJ1nq7AC+dTqzF6iW7O+Lies=;
 b=GRScZykdnHd7JOBifcHR84PWFhS8GAzg5wQAzqJWeitB1GpUYPr2LK5rmMPAfbLu0Bb7oV
 PnXxSda9PdnogOrnPe7EzKz8bs3IGrf73WNu1KPXQAGHY7wxGm73CCWZHoZ9vN23RinC72
 61L28jR3+9cXZolW8IsMpIelwaM834s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621953952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=v2yNqAnqlLGqrvEfsznqJ1nq7AC+dTqzF6iW7O+Lies=;
 b=JXqVnHgMvl5JMji8SURC8x8uuVKZvHDPT6whtXYcfbRGmUj+7NeJ+Ww4lfJixSVrJEUNDW
 Ff77fPERbI2j7MBA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70C09AB71;
 Tue, 25 May 2021 14:45:52 +0000 (UTC)
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: drm-misc-next
Message-ID: <2a2ac7cf-45cb-d6f0-54ea-6a29e453c270@suse.de>
Date: Tue, 25 May 2021 16:45:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mg5FJ2hmcObFSs8suUrbx4tWQ9cyI2C18"
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
Cc: "sean@poorly.run" <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mg5FJ2hmcObFSs8suUrbx4tWQ9cyI2C18
Content-Type: multipart/mixed; boundary="lJESz5kpbyMAXdyGqeV9Xcp8Wy7qX7M7k";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "DRM maintainer tools announcements, discussion, and development"
 <dim-tools@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "sean@poorly.run" <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Message-ID: <2a2ac7cf-45cb-d6f0-54ea-6a29e453c270@suse.de>
Subject: drm-misc-next

--lJESz5kpbyMAXdyGqeV9Xcp8Wy7qX7M7k
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Dave and Daniel,

here's this week's PR for drm-misc-next. Besides the usual round of=20
fixes, amdgpu now supports hot unplug and GEM CMA supports cached page=20
mappings.

No standard email this week, sorry. Dim pushed the tag into the repo,=20
but then failed to create the rsp email from it.

Please merge from

git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-05-25

since

   30039405ac25 ("MAINTAINERS: repair reference in DRM DRIVER FOR SIMPLE =

FRAMEBUFFERS")

up to

   4a791cb6d34f ("drm/ingenic: Add option to alloc cached GEM buffers")


Best regards
Thomas

drm-misc-next-2021-05-25:
drm-misc-next for v5.14:



UAPI Changes:



  * DRM_IOCTL_IRQ_BUSID is now marked as legacy; returns -EINVAL if

    legacy drivers are disabled



Cross-subsystem Changes:



  * PCI: Add support for dev_groups



  * vgaarb: Use ACPI HID to find integrated GPU



Core Changes:



  * Log errors in drm_gem_fb_init_with_funcs()



  * Cleanups



  * gem-cma: Add support for non-coherent (i.e., cached) page mappings



  * legacy: Drop some unnecessary includes and code; Add missing unlocks

    and frees in drm_legacy_addbufs_pci()



  * sched: Make timeout timer rearm conditional; Fix data corruptions and=


    hangs



  * ttm: Remap all page faults to per-process dummy page (for device=20
removal);

    Documentation



Driver Changes:



  * drm/amdgpu: A long list of patches that enable device hot-unplug



  * drm/bridge: Lt66121: Fix error code and leak in probe; Anx7625: Use

    runtime PM and add synchronous suspend/resume hooks; Ti-sn65dsi86: Fi=
x

    a returned value's type; Anx7688: Add driver plus DT bindings;



  * drm/ingenic: Fix pixcloc for 24-bit serial panels; Use non-coherent B=
O

    mappings with explict synchronization if possible



  * drm/panel: Simple-panel: Add missing pm_runtime_dont_use_autosuspend(=
)



  * drm/tve200: Convert DT bindings to YAML



  * drm/vc4: Support BCM2711 VEC plus DT bindings; Pipeline setup fixes; =

HDMI

    fixes



  * drm/virtio: Fix NULL pointer in probe; Fix double-free in probe; Free=


    virtqueues in probe



--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lJESz5kpbyMAXdyGqeV9Xcp8Wy7qX7M7k--

--mg5FJ2hmcObFSs8suUrbx4tWQ9cyI2C18
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCtDZ8FAwAAAAAACgkQlh/E3EQov+D1
KA//eEtytEBe9EHYj8j4oBelfFwmikm8ou0+RzIYsbgRf3dC/RA4V7+8osnYJnpK2npkFHgPVwKN
GaVwpLaXlzwgiuhPCC+4yMUfKbkyT15pkQU8e9TnSrw1mibJtL9AmrbZe4PVlbbNHiyerdbdELTj
G1NQICZIzbB3WAZeFFOi7EfuGzIUGZM3AmzBysA1luQ+O4C8d/CBlVx4R/Ia19BMjIt02Fe9hvpn
/DSnvqizF0WZtW9VKyVy1C7jGQVbZLIsq+ja17pJAMpdkuVDa4YTdf+EkAtEovMNxnS76FJZL4DA
oM3CtGcfVsLO7ngXVOTaUs8ez5MMofUqtu5h/iT9DXt5GovTN1E0StSwRkNeee/YvBjkcqekCQi6
knaYff7b7t6b5PbWKjM7jG0H4oB5d+NW9I+jJotsyIoiDOEMef8ftiU6YrlqEOfYVcGRrmBpoyza
kPMUUwzLNidgOutcpPtPrgwFzbWZ2/jPxX8mdXvVm1JoP5J6SubkH4nQLQgoOxMf628Sd0Fxr6hn
tGBK9ajQQIpIL45g3IPv+1+wfN3m8r5EKD2lP8tG6jWgVT+uuVFbR5dklm9g5chFj7UQfaT4HNPO
TB99zNeL8RKyBfVmoBRPhSoYfKmKMU1/Qnd7KlLj/zjHSd2mfqr69NNzTSxsllfZREjCvcSMvbg3
/zY=
=8Cnl
-----END PGP SIGNATURE-----

--mg5FJ2hmcObFSs8suUrbx4tWQ9cyI2C18--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9A054D2D6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 22:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39968112FD9;
	Wed, 15 Jun 2022 20:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAC9112FF6;
 Wed, 15 Jun 2022 20:45:27 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 n24-20020a4ae758000000b0041b82638b42so2557565oov.9; 
 Wed, 15 Jun 2022 13:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xcXXEo50ke0CjTDo+NaIuCmfleDINQjvp5Fm6iMmoNs=;
 b=oT02vXcWCCiAHE7yqPQmEo2y9Mcf4PTNfbKqTRW7sJRaVbmS9jNOmSErG+5tY599Bd
 LgoVKu2wArDUWwWnADocI7TR5tZj8ytKk9MgwY9KyOZNC+IBDT+2jiy6z/VgUUUkN4hu
 z0Se03YNpoSOSVF5gsdfM3fa44LBOWvwaDLsDJS7N0VFp4u+pag1w+uIaOWq6Xb+CwYR
 jO36U4uaq9M279k7JqeIn92u5pSBmYfkGRFiDp9UoCL+IZP/Q4rScvZUXKLty2ciczxU
 MUhEerA4+9yafkhy0UcVRyaKacxuHA1rSZUUUaiKYzbD4dCgm0OonB8eGxfzN+RbAz+L
 5PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xcXXEo50ke0CjTDo+NaIuCmfleDINQjvp5Fm6iMmoNs=;
 b=3JuAsVdYO0DkMeCeLAumWJ8nmhrYn+goNUjPRBaem9BUO8wbzjBWBxeGNHGe+lpPkx
 BJbEOTTlu9Sy8jv6vya00hZFilSAaomlTp0/o22uofbWXlrVLbsqgRVHETpMfEIh5pj4
 MfD5ypvhyeI7VLAI1z8QiFq1MZCKLNpTjat46s8KGucTcsY56PQrPLwsOvrBAa76KfWR
 iDWjbWMFfTp4/8UN5Y6hUYTbMT5NZX+N+AuFPc/3vjMkC21hzjYITgarm7YqnvzeOmzy
 MRPNJdOVERXSQvOqwgmG7mpwJm33C3ytp9rohy+gT2J+046HayyZtndabbyzFIpenfk2
 LgaA==
X-Gm-Message-State: AJIora/uuuNRQgBDMJThon5K1p0U7KTx9fTA3ZQ0bdF3RvfoP7Ujn76W
 Dp3NR9u/5qlehvaqBxXvDaw0C75QkaLyih2CGUQ=
X-Google-Smtp-Source: AGRyM1vEqfTFGnhrliHzSYUkFFbVEaP5yl8JeNL/BM8B1dFcs+WmEJs0Y+3mnX/2mo+VxVsW1+gUrewNQbQalUF45Jg=
X-Received: by 2002:a4a:458e:0:b0:41c:1d71:8ef with SMTP id
 y136-20020a4a458e000000b0041c1d7108efmr705527ooa.23.1655325927149; Wed, 15
 Jun 2022 13:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220615160116.528c324b@canb.auug.org.au>
 <d1a48a84-6d07-e8f7-5fd8-d24a7a1cf187@infradead.org>
 <CADnq5_N6gfaPfZJAX4+poWFFruxNdFKZqzXZXosj1A55e-O1mA@mail.gmail.com>
 <YqpACmvbwiEcUfta@dev-arch.thelio-3990X>
In-Reply-To: <YqpACmvbwiEcUfta@dev-arch.thelio-3990X>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 Jun 2022 16:45:16 -0400
Message-ID: <CADnq5_OnrxUiM+aTWRLjixp=vY6adV3w4p2cfTkdS32uq_UsiQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Jun 15
 (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c)
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: multipart/mixed; boundary="000000000000e04f2805e1829933"
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Randy Dunlap <rdunlap@infradead.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000e04f2805e1829933
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2022 at 4:24 PM Nathan Chancellor <nathan@kernel.org> wrote=
:
>
> On Wed, Jun 15, 2022 at 03:28:52PM -0400, Alex Deucher wrote:
> > On Wed, Jun 15, 2022 at 3:01 PM Randy Dunlap <rdunlap@infradead.org> wr=
ote:
> > >
> > >
> > >
> > > On 6/14/22 23:01, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > Changes since 20220614:
> > > >
> > >
> > > on i386:
> > > # CONFIG_DEBUG_FS is not set
> > >
> > >
> > > ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In fu=
nction =E2=80=98amdgpu_dm_crtc_late_register=E2=80=99:
> > > ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6599:2=
: error: implicit declaration of function =E2=80=98crtc_debugfs_init=E2=80=
=99; did you mean =E2=80=98amdgpu_debugfs_init=E2=80=99? [-Werror=3Dimplici=
t-function-declaration]
> > >   crtc_debugfs_init(crtc);
> > >   ^~~~~~~~~~~~~~~~~
> > >   amdgpu_debugfs_init
> > >
> > >
> > > Full randconfig file is attached.
> >
> > I tried building with your config and I can't repro this.  As Harry
> > noted, that function and the whole secure display feature depend on
> > debugfs.  It should never be built without CONFIG_DEBUG_FS.  See
> > drivers/gpu/drm/amd/display/Kconfig:
> >
> > > config DRM_AMD_SECURE_DISPLAY
> > >         bool "Enable secure display support"
> > >         default n
> > >         depends on DEBUG_FS
> > >         depends on DRM_AMD_DC_DCN
> > >         help
> > >             Choose this option if you want to
> > >             support secure display
> > >
> > >             This option enables the calculation
> > >             of crc of specific region via debugfs.
> > >             Cooperate with specific DMCU FW.
> >
> > amdgpu_dm_crtc_late_register is guarded by
> > CONIG_DRM_AMD_SECURE_DISPLAY.  It's not clear to me how we could hit
> > this.
>
> I think the problem is that you are not looking at the right tree.
>
> The kernel test robot reported [1] [2] this error is caused by commit
> 4cd79f614b50 ("drm/amd/display: Move connector debugfs to drm"), which
> is in the drm-misc tree on the drm-misc-next branch. That change removes
> the #ifdef around amdgpu_dm_crtc_late_register(), meaning that
> crtc_debugfs_init() can be called without CONFIG_DRM_AMD_SECURE_DISPLAY
> and CONFIG_DEBUG_FS.
>
>   $ git show -s --format=3D'%h ("%s")'
>   abf0ba5a34ea ("drm/bridge: it6505: Add missing CRYPTO_HASH dependency")
>
>   $ make -skj"$(nproc)" ARCH=3Dx86_64 mrproper defconfig
>
>   $ scripts/config -d BLK_DEV_IO_TRACE -d DEBUG_FS -e DRM_AMDGPU
>
>   $ make -skj"$(nproc)" ARCH=3Dx86_64 olddefconfig drivers/gpu/drm/amd/am=
dgpu/../display/amdgpu_dm/amdgpu_dm.o
>   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In functio=
n =E2=80=98amdgpu_dm_crtc_late_register=E2=80=99:
>   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6622:9: err=
or: implicit declaration of function =E2=80=98crtc_debugfs_init=E2=80=99; d=
id you mean =E2=80=98amdgpu_debugfs_init=E2=80=99? [-Werror=3Dimplicit-func=
tion-declaration]
>    6622 |         crtc_debugfs_init(crtc);
>         |         ^~~~~~~~~~~~~~~~~
>         |         amdgpu_debugfs_init
>   cc1: all warnings being treated as errors
>
> Contrast that with the current top of your tree:
>
>   $ git show -s --format=3D'%h ("%s")'
>   c435f61d0eb3 ("drm/amd/display: Drop unnecessary guard from DC resource=
")
>
>   $ make -skj"$(nproc)" ARCH=3Dx86_64 mrproper defconfig
>
>   $ scripts/config -d BLK_DEV_IO_TRACE -d DEBUG_FS -e DRM_AMDGPU
>
>   $ make -skj"$(nproc)" ARCH=3Dx86_64 olddefconfig drivers/gpu/drm/amd/am=
dgpu/../display/amdgpu_dm/amdgpu_dm.o
>
>   $ echo $?
>   0
>
> Randy's patch [3] seems like it should resolve the issue just fine but
> it needs to be applied to drm-misc-next, not the amdgpu tree.

Thanks for tracking this down.  I think something like the attached
patch is cleaner since the whole thing is only valid for debugfs.

Alex


>
> [1]: https://lore.kernel.org/202205241843.8EWKesIA-lkp@intel.com/
> [2]: https://lore.kernel.org/202205240207.KmDLuSrC-lkp@intel.com/
> [3]: https://lore.kernel.org/20220614155726.26211-1-rdunlap@infradead.org=
/
>
> Cheers,
> Nathan

--000000000000e04f2805e1829933
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-display-fix-build-when-CONFIG_DEBUG_FS-is.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-display-fix-build-when-CONFIG_DEBUG_FS-is.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l4g29tzt0>
X-Attachment-Id: f_l4g29tzt0

RnJvbSBiMGJjYWNkODYzNDQ5OThlMGNhNzU3Zjg5YzZjNGNkM2I2Mjk4OTk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFdlZCwgMTUgSnVuIDIwMjIgMTY6NDA6MzkgLTA0MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1L2Rpc3BsYXk6IGZpeCBidWlsZCB3aGVuIENPTkZJR19ERUJVR19GUyBpcyBu
b3Qgc2V0CgphbWRncHVfZG1fY3J0Y19sYXRlX3JlZ2lzdGVyIGlzIG9ubHkgdXNlZCB3aGVuIENP
TkZJR19ERUJVR19GUwpzbyBtYWtlIGl0IGRlcGVuZGVudCBvbiB0aGF0LgoKRml4ZXM6IDRjZDc5
ZjYxNGI1MCAoImRybS9hbWQvZGlzcGxheTogTW92ZSBjb25uZWN0b3IgZGVidWdmcyB0byBkcm0i
KQpSZXBvcnRlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+ClJlcG9y
dGVkLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNCArKysrCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggYzkwMDRmN2U3MDBkLi4zM2NkN2Ez
ZDRlY2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYwpAQCAtNjU5NCwxMiArNjU5NCwxNCBAQCBkbV9jcnRjX2R1cGxpY2F0ZV9zdGF0
ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJcmV0dXJuICZzdGF0ZS0+YmFzZTsKIH0KIAorI2lm
ZGVmIENPTkZJR19ERUJVR19GUwogc3RhdGljIGludCBhbWRncHVfZG1fY3J0Y19sYXRlX3JlZ2lz
dGVyKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIHsKIAljcnRjX2RlYnVnZnNfaW5pdChjcnRjKTsK
IAogCXJldHVybiAwOwogfQorI2VuZGlmCiAKIHN0YXRpYyBpbmxpbmUgaW50IGRtX3NldF92dXBk
YXRlX2lycShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGJvb2wgZW5hYmxlKQogewpAQCAtNjY5Myw3
ICs2Njk1LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19mdW5jcyBhbWRncHVfZG1f
Y3J0Y19mdW5jcyA9IHsKIAkuZW5hYmxlX3ZibGFuayA9IGRtX2VuYWJsZV92YmxhbmssCiAJLmRp
c2FibGVfdmJsYW5rID0gZG1fZGlzYWJsZV92YmxhbmssCiAJLmdldF92YmxhbmtfdGltZXN0YW1w
ID0gZHJtX2NydGNfdmJsYW5rX2hlbHBlcl9nZXRfdmJsYW5rX3RpbWVzdGFtcCwKKyNpZiBkZWZp
bmVkKENPTkZJR19ERUJVR19GUykKIAkubGF0ZV9yZWdpc3RlciA9IGFtZGdwdV9kbV9jcnRjX2xh
dGVfcmVnaXN0ZXIsCisjZW5kaWYKIH07CiAKIHN0YXRpYyBlbnVtIGRybV9jb25uZWN0b3Jfc3Rh
dHVzCi0tIAoyLjM1LjMKCg==
--000000000000e04f2805e1829933--

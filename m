Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F123554D25E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 22:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD2410E770;
	Wed, 15 Jun 2022 20:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9177F10E6A2;
 Wed, 15 Jun 2022 20:13:40 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id l81so16877049oif.9;
 Wed, 15 Jun 2022 13:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uxPZFTdIhpij7oVBbW1ZEllzyYT+SkfY+TvDUl6wCB8=;
 b=N9LfEeWSzKKgAoAemGKrsZ8J8bPjIWvFNY/O5H3wlMXrl1dGp2XnyPobhPn4w665zj
 09bYyg5l8BjwPptVTOLw/R2lfeCe+SAqlc75zhdENzpDxUQzzMbqXVcracTaAqwE0RWt
 aXP1OT/1heYgYO4eSYNSXa14s7b65XUyEctNzf4WVUmel6woeMzAXfJwDyQrqOwQTris
 YaxB37okEGc1XOhz5rSdkzQoeQUQqd8f1EU1YhEMGpqXUNzXIjs82ICAPnrE1g49acEG
 lLxcNWNaxtWJhnbIu4U0kMZVwE91jDjt8MuqSXWihAL0YBRrdhpPsdGqpme4ZIjhZeVh
 5PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxPZFTdIhpij7oVBbW1ZEllzyYT+SkfY+TvDUl6wCB8=;
 b=uT/3cuvXfawFeSLgHo52MzVJ3ZXSAZ1sHT9lEDlSiIbtAS52Ve2Nqsio4JI75rwtO7
 MpBg5yu3oUdVJdlFArcobvH4EEEdgaRMoK+QHtxBE7f0mlRtsF4WJ0ztZePlmTrqSRvc
 nTbcPDRVMCNGXnX2ptLLCcVUTyX40OuHuPlfExe/fucJniswY3+KNVA8lhmyUwIEM46N
 TrcSwDZb1F6OPhzc06bUl4uUMjIjcUYblDSFXNmCd2yZBXcVPDv4DwNpZxIIQs6PC9N4
 qEmHQhI1C7hkdSgxaZ/ZVzw7Xh0dkc0yaUSLM0Gl289/ApUU2b88IsArFgraAmGUyVpc
 cGQw==
X-Gm-Message-State: AJIora/kObXmgDCHQ3e/ke84yghNlZMDJZJw6IF4YImXd6hyTXuyl2sW
 lVbbqOKK1VhA7BDDrF3n81K3zMA6dYANdKlk2Dg=
X-Google-Smtp-Source: AGRyM1t26BkEmjzZPz/t/y/zBluh0mTeIrONU9pLZIV7rmJ+Rplv0Xy9wJgFEVHQ9UoF4/SVUZsYBt3IHGWYqkGmx8k=
X-Received: by 2002:a05:6808:23c6:b0:331:3ab2:6fb9 with SMTP id
 bq6-20020a05680823c600b003313ab26fb9mr693454oib.200.1655324019928; Wed, 15
 Jun 2022 13:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220615160116.528c324b@canb.auug.org.au>
 <d1a48a84-6d07-e8f7-5fd8-d24a7a1cf187@infradead.org>
 <CADnq5_N6gfaPfZJAX4+poWFFruxNdFKZqzXZXosj1A55e-O1mA@mail.gmail.com>
 <fb53cab1-f693-5309-e06a-0fe0fc932c2c@infradead.org>
In-Reply-To: <fb53cab1-f693-5309-e06a-0fe0fc932c2c@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 Jun 2022 16:13:28 -0400
Message-ID: <CADnq5_Nz9cw3L6_Ab=7WQZ4_y8OTSiwZmoQup+9OjaaZPCqUqQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Jun 15
 (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c)
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: multipart/mixed; boundary="00000000000032528605e18228d8"
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000032528605e18228d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2022 at 3:44 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 6/15/22 12:28, Alex Deucher wrote:
> > On Wed, Jun 15, 2022 at 3:01 PM Randy Dunlap <rdunlap@infradead.org> wr=
ote:
> >>
> >>
> >>
> >> On 6/14/22 23:01, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20220614:
> >>>
> >>
> >> on i386:
> >> # CONFIG_DEBUG_FS is not set
> >>
> >>
> >> ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In fun=
ction =E2=80=98amdgpu_dm_crtc_late_register=E2=80=99:
> >> ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6599:2:=
 error: implicit declaration of function =E2=80=98crtc_debugfs_init=E2=80=
=99; did you mean =E2=80=98amdgpu_debugfs_init=E2=80=99? [-Werror=3Dimplici=
t-function-declaration]
> >>   crtc_debugfs_init(crtc);
> >>   ^~~~~~~~~~~~~~~~~
> >>   amdgpu_debugfs_init
> >>
> >>
> >> Full randconfig file is attached.
> >
> > I tried building with your config and I can't repro this.  As Harry
> > noted, that function and the whole secure display feature depend on
> > debugfs.  It should never be built without CONFIG_DEBUG_FS.  See
> > drivers/gpu/drm/amd/display/Kconfig:
>
> Did you try building with today's linux-next tree?
> (whatever is in it)
>
> I have seen this build error multiple times so it shouldn't
> be so difficult to repro it.
>
>
> >> config DRM_AMD_SECURE_DISPLAY
> >>         bool "Enable secure display support"
> >>         default n
> >>         depends on DEBUG_FS
> >>         depends on DRM_AMD_DC_DCN
> >>         help
> >>             Choose this option if you want to
> >>             support secure display
> >>
> >>             This option enables the calculation
> >>             of crc of specific region via debugfs.
> >>             Cooperate with specific DMCU FW.
> >
> > amdgpu_dm_crtc_late_register is guarded by
> > CONIG_DRM_AMD_SECURE_DISPLAY.  It's not clear to me how we could hit
> > this.

I was able to repro it.  In linux-next the
CONFIG_DRM_AMD_SECURE_DISPLAY ifdefs in
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c seem to be missing.
I guess they were lost when the amdgpu branch was merged into
linux-next.  The attached patch restores the
CONFIG_DRM_AMD_SECURE_DISPLAY protections.

Thanks,

Alex

>
>
> --
> ~Randy

--00000000000032528605e18228d8
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-fix-merge-of-amdgpu-next-branch.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-fix-merge-of-amdgpu-next-branch.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l4g1669d0>
X-Attachment-Id: f_l4g1669d0

RnJvbSBmNjdhYjBiYThkYTg3M2EyMzhkY2QzMzZhY2Y5MmMwMWU0YWZmMDMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFdlZCwgMTUgSnVuIDIwMjIgMTY6MTI6MDAgLTA0MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1OiBmaXggbWVyZ2Ugb2YgYW1kZ3B1IC1uZXh0IGJyYW5jaAoKQWRkIENPTkZJ
R19EUk1fQU1EX1NFQ1VSRV9ESVNQTEFZIHByb3RlY3Rpb25zIHRoYXQgd2VyZQphY2NpZGVudGx5
IGRyb3BwZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4
IGM5MDA0ZjdlNzAwZC4uYzAzODZmMjM3ZmRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTY1OTQsMTIgKzY1OTQsMTQgQEAg
ZG1fY3J0Y19kdXBsaWNhdGVfc3RhdGUoc3RydWN0IGRybV9jcnRjICpjcnRjKQogCXJldHVybiAm
c3RhdGUtPmJhc2U7CiB9CiAKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9TRUNVUkVfRElTUExBWQog
c3RhdGljIGludCBhbWRncHVfZG1fY3J0Y19sYXRlX3JlZ2lzdGVyKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YykKIHsKIAljcnRjX2RlYnVnZnNfaW5pdChjcnRjKTsKIAogCXJldHVybiAwOwogfQorI2Vu
ZGlmCiAKIHN0YXRpYyBpbmxpbmUgaW50IGRtX3NldF92dXBkYXRlX2lycShzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMsIGJvb2wgZW5hYmxlKQogewpAQCAtNjY5Myw3ICs2Njk1LDkgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fY3J0Y19mdW5jcyBhbWRncHVfZG1fY3J0Y19mdW5jcyA9IHsKIAkuZW5h
YmxlX3ZibGFuayA9IGRtX2VuYWJsZV92YmxhbmssCiAJLmRpc2FibGVfdmJsYW5rID0gZG1fZGlz
YWJsZV92YmxhbmssCiAJLmdldF92YmxhbmtfdGltZXN0YW1wID0gZHJtX2NydGNfdmJsYW5rX2hl
bHBlcl9nZXRfdmJsYW5rX3RpbWVzdGFtcCwKKyNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX1NF
Q1VSRV9ESVNQTEFZKQogCS5sYXRlX3JlZ2lzdGVyID0gYW1kZ3B1X2RtX2NydGNfbGF0ZV9yZWdp
c3RlciwKKyNlbmRpZgogfTsKIAogc3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMKLS0g
CjIuMzUuMwoK
--00000000000032528605e18228d8--

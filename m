Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415417FE156
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 21:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343E710E374;
	Wed, 29 Nov 2023 20:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A2410E374;
 Wed, 29 Nov 2023 20:49:30 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1f060e059a3so77011fac.1; 
 Wed, 29 Nov 2023 12:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701290969; x=1701895769; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uCwSK8iy7hq3osg12qE4HhNLJBHsTSSsnJBjaB7nWDA=;
 b=LDWDwDbFp8DlGMhLRoxL+aHaHuNnc8/mexq7aBs7hdfcrvoNJTP8JcJUXrJti1i7u+
 jU4zeElYtedidAPol0fURvkd6dOXMOG/8noXksZw0n7je1u2riKgxG0smx7A9oajEcoh
 kfUZ6dKYyYhDLaqwAjdRaWCNDbNV4eZhxigAlJf5CxzIau97e9evEtwxiouB8aVtspdQ
 5B5OwkxH8Lv9wZxgizTX2ehFV9CK38J/P5U0GtU+kbK3/IxNlkQE2tvNHeGt7bTshF3T
 98n8DiQbNHGcdoPAQGCbOF0flWoUp9rM+u/srNg4d+Ua7RYxL8zqVDaouGlX5Vjr4vZ6
 vX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701290969; x=1701895769;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uCwSK8iy7hq3osg12qE4HhNLJBHsTSSsnJBjaB7nWDA=;
 b=LqS0m5IVAGKiV+fDTaTQUcjIo5ms5arg2KE7oQ01tkvrYXDbvcDe66qO5GKyqmGBhl
 mR/jZryrcSWB6KB3YcmSTrbiXFyfWMOtT/MLAHvriCwopVwEOJ8FLg5kzcuHG7/c0sCS
 XpZA/GEoRpq67sTbnBdCvCRD1UTblcIgzddIDyyxAY03fC9XjPvQFOLElLNgvKPn5ZB7
 NT57qfCXuAGpaQD9z+Gyw/lIHVL+VdAL5ZyjXtC3Kub55ZCyvETuBjvB2rbgJhi0AoEh
 xDSpnHK6pQLTxgw0PjinI17OUeqMGIdpw0A2PyWNDw9aUWDkvRHCYaBQnTHPpoSCopLj
 ih0w==
X-Gm-Message-State: AOJu0Yyt5+7oW//8A4um1jREv6iKIrYXrRM0+HwDDXWTyHwCRbLvERE8
 ZNjN/0L83wGVhKVwVzKEwFfPVodhvZUkY6B9aFo=
X-Google-Smtp-Source: AGHT+IHyw8cAX9UfK9a8fY501yC2wNYtr22mgVoI8sSdazvxSzWX4/ffV64sBqiXIbZ1QzuNOcv1vH6FSPHW3piU2iY=
X-Received: by 2002:a05:6870:2328:b0:1f9:faa4:8bd6 with SMTP id
 w40-20020a056870232800b001f9faa48bd6mr21314446oao.17.1701290969390; Wed, 29
 Nov 2023 12:49:29 -0800 (PST)
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87jzq2ixtm.fsf@vps.thesusis.net>
 <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
 <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com>
 <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
 <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
 <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
 <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
 <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
In-Reply-To: <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Nov 2023 15:49:17 -0500
Message-ID: <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Luben Tuikov <ltuikov89@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000e4307b060b50ab61"
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Phillip Susi <phill@thesusis.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000e4307b060b50ab61
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 3:10=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> Actually I think I see the problem.  I'll try and send out a patch
> later today to test.

Does the attached patch fix it?

Alex

>
> Alex
>
> On Wed, Nov 29, 2023 at 1:52=E2=80=AFPM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
> >
> > On Wed, Nov 29, 2023 at 11:41=E2=80=AFAM Luben Tuikov <ltuikov89@gmail.=
com> wrote:
> > >
> > > On 2023-11-29 10:22, Alex Deucher wrote:
> > > > On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher@g=
mail.com> wrote:
> > > >>
> > > >> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@g=
mail.com> wrote:
> > > >>>
> > > >>> On 2023-11-28 17:13, Alex Deucher wrote:
> > > >>>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thes=
usis.net> wrote:
> > > >>>>>
> > > >>>>> Alex Deucher <alexdeucher@gmail.com> writes:
> > > >>>>>
> > > >>>>>>> In that case those are the already known problems with the sc=
heduler
> > > >>>>>>> changes, aren't they?
> > > >>>>>>
> > > >>>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Mayb=
e I'm
> > > >>>>>> misunderstanding what the original report was actually testing=
.  If it
> > > >>>>>> was 6.7, then try reverting:
> > > >>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
> > > >>>>>> b70438004a14f4d0f9890b3297cd66248728546c
> > > >>>>>
> > > >>>>> At some point it was suggested that I file a gitlab issue, but =
I took
> > > >>>>> this to mean it was already known and being worked on.  -rc3 ca=
me out
> > > >>>>> today and still has the problem.  Is there a known issue I coul=
d track?
> > > >>>>>
> > > >>>>
> > > >>>> At this point, unless there are any objections, I think we shoul=
d just
> > > >>>> revert the two patches
> > > >>> Uhm, no.
> > > >>>
> > > >>> Why "the two" patches?
> > > >>>
> > > >>> This email, part of this thread,
> > > >>>
> > > >>> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
> > > >>>
> > > >>> clearly states that reverting *only* this commit,
> > > >>> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable n=
umber of run-queues
> > > >>> *does not* mitigate the failed suspend. (Furthermore, this commit=
 doesn't really change
> > > >>> anything operational, other than using an allocated array, instea=
d of a static one, in DRM,
> > > >>> while the 2nd patch is solely contained within the amdgpu driver =
code.)
> > > >>>
> > > >>> Leaving us with only this change,
> > > >>> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> > > >>> to be at fault, as the kernel log attached in the linked email ab=
ove shows.
> > > >>>
> > > >>> The conclusion is that only b70438004a14f4 needs reverting.
> > > >>
> > > >> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14=
f4,
> > > >> 56e449603f0ac5 breaks amdgpu.
> > > >
> > > > We can try and re-enable it in the next kernel.  I'm just not sure
> > > > we'll be able to fix this in time for 6.7 with the holidays and all
> > > > and I don't want to cause a lot of scheduler churn at the end of th=
e
> > > > 6.7 cycle if we hold off and try and fix it.  Reverting seems like =
the
> > > > best short term solution.
> > >
> > > A lot of subsequent code has come in since commit 56e449603f0ac5, as =
it opened
> > > the opportunity for a 1-to-1 relationship between an entity and a sch=
eduler.
> > > (Should've always been the case, from the outset. Not sure why it was=
 coded as
> > > a fixed-size array.)
> > >
> > > Given that commit 56e449603f0ac5 has nothing to do with amdgpu, and t=
he problem
> > > is wholly contained in amdgpu, and no other driver has this problem, =
there is
> > > no reason to have to "churn", i.e. go back and forth in DRM, only to =
cover up
> > > an init bug in amdgpu. See the response I just sent in @this thread:
> > > https://lore.kernel.org/r/05007cb0-871e-4dc7-af58-1351f4ba43e2@gmail.=
com
> > >
> > > And it's not like this issue is unknown. I first posted about it on 2=
023-10-16.
> > >
> > > Ideally, amdgpu would just fix their init code.
> >
> > You can't make changes to core code that break other drivers.
> > Arguably 56e449603f0ac5 should not have gone in in the first place if
> > it broke amdgpu.  b70438004a14f4 was the code to fix amdgpu's init
> > code, but as a side effect it seems to have broken suspend for some
> > users.
> >
> > Alex

--000000000000e4307b060b50ab61
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-fix-buffer-funcs-setting-order-on-suspend.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-fix-buffer-funcs-setting-order-on-suspend.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lpk8pifj0>
X-Attachment-Id: f_lpk8pifj0

RnJvbSA5NmU3NWI1MjE4ZjdhMTI0ZWFmYTUzODUzNjgxZWVmOGZlNTY3YWI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFdlZCwgMjkgTm92IDIwMjMgMTU6NDQ6MjUgLTA1MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1OiBmaXggYnVmZmVyIGZ1bmNzIHNldHRpbmcgb3JkZXIgb24gc3VzcGVuZAoK
V2UgbmVlZCB0byBtYWtlIGRpc2FibGUgdGhpcyBhZnRlciB0aGUgbGFzdCBldmljdGlvbgpjYWxs
LCBidXQgYmVmb3JlIHdlIGRpc2FibGUgdGhlIFNETUEgSVAuCgpGaXhlczogYjcwNDM4MDA0YTE0
ICgiZHJtL2FtZGdwdTogbW92ZSBidWZmZXIgZnVuY3Mgc2V0dGluZyB1cCBhIGxldmVsIikKTGlu
azogaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvYW1kLWdmeC8yMDIzLU5v
dmVtYmVyLzEwMTE5Ny5odG1sClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KQ2M6IFBoaWxsaXAgU3VzaSA8cGhpbGxAdGhlc3VzaXMubmV0PgpD
YzogTHViZW4gVHVpa292IDxsdHVpa292ODlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMKaW5kZXggYjVlZGY0MGI1ZDAzLi43ODU1M2UwMjdkYjQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTQ1MzEsOCArNDUz
MSw2IEBAIGludCBhbWRncHVfZGV2aWNlX3N1c3BlbmQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
Ym9vbCBmYmNvbikKIAogCWFtZGdwdV9yYXNfc3VzcGVuZChhZGV2KTsKIAotCWFtZGdwdV90dG1f
c2V0X2J1ZmZlcl9mdW5jc19zdGF0dXMoYWRldiwgZmFsc2UpOwotCiAJYW1kZ3B1X2RldmljZV9p
cF9zdXNwZW5kX3BoYXNlMShhZGV2KTsKIAogCWlmICghYWRldi0+aW5fczBpeCkKQEAgLTQ1NDIs
NiArNDU0MCw4IEBAIGludCBhbWRncHVfZGV2aWNlX3N1c3BlbmQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgYm9vbCBmYmNvbikKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAKKwlhbWRncHVfdHRtX3Nl
dF9idWZmZXJfZnVuY3Nfc3RhdHVzKGFkZXYsIGZhbHNlKTsKKwogCWFtZGdwdV9mZW5jZV9kcml2
ZXJfaHdfZmluaShhZGV2KTsKIAogCWFtZGdwdV9kZXZpY2VfaXBfc3VzcGVuZF9waGFzZTIoYWRl
dik7Ci0tIAoyLjQyLjAKCg==
--000000000000e4307b060b50ab61--

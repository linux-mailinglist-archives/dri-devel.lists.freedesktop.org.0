Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99866A205AB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 09:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBAA10E0FA;
	Tue, 28 Jan 2025 08:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hZ/0G/Ie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A22510E363
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 19:05:58 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2ef6c56032eso6412217a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 11:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738004757; x=1738609557; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FgpSNPeAjFZp+XVJ99wWjxWH+/lWeKYYdQIoeMWl0ls=;
 b=hZ/0G/IemmS/8HqMZyeoO3GDowjr104eXDwexBx+VGF8w0r/ifB8MyXkC5uOD99wC9
 a5LZSiIuuxTZkzZd6FoGucKx+mrt4BLxaRKQknFraDAQFbJ+/1vwJ9tmwTAldpfQsZWH
 fjoMpeY4EIHzKMzQZD2tZHKfqJinEylrAfr/E91K6g7hVNexW1wOpNAmtor/la1L0xCs
 zg1/dshUwGd8svfAnUBir7UAVfzxjHYy+fvCtsq/fcqHzkQ4DMkTrU0la0owr1QrDdHA
 sKO/b05YU41kLQop+6XYKQkJcMyCllwAw3nhHjwuwjX6h8ixvSPtGyEqTMzUrQeb4V5z
 e/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738004757; x=1738609557;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FgpSNPeAjFZp+XVJ99wWjxWH+/lWeKYYdQIoeMWl0ls=;
 b=bH86X5It+U6pbZWwU4z3tlRxLOAb+2FRYCWMCAyWc2VJssMfyUnJ3inbu/f7M4T35x
 7I/cNjgLU4oWmHqG9zeCN8aBzJSW095SH/F/63tppF2mfwMedp8ujDdEqFd/bkwTR8TE
 q7DtHMbyVvw4m6eWQb+jmkEDz9qZgJNALVd8TiiFIZ9gUHTHvKgKuVeAK/9FVoizbJA6
 ZA9ABF+QsD7gXRkAFIoBgvtL+tM12koJBqpdtH0P9f8N4hLR8VWQTo9p1CVQCIG4gN74
 T7SfTsIpC3ZuMS8s1stQEiuDhCQ3bvmcgWVQGT1s1k66vILse98fuBueY9XOBxzeRbAI
 nZuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmVhT/tk6E/h7ixB1GlJkLfPgOrCe1x37k2DW72k8GhWqlYA0K0WUXoAQIUIo6WKKKLFJr7j7nx8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIWYT0/5tFVtrA577PMjDcH2loPrNT2dZ56GYpq1XZ74v8ULJM
 ao37EZVIAkPCs4EHM0HZYtUOc52jeEAMDFSQtWG1Leh2e7XZ7wh2
X-Gm-Gg: ASbGnct5BKrP7OoONEik3NyyfJ73mp55+aDbJzIhMEhKBgYMSe1g5gYwU/dAj2SRh1n
 TJK0nbV7dtI8SEHDmy5fNCvmSCGsBBcC7eFxuXRqWFHek9qSrxylU/ZLF/Of3olJZTzwyTwEccG
 FFTe3vaR6Qd0BnYZ+kM8AW0hwesyPiGmw/5rQ1HSKsy5Yql/4oPbxjxz91RK5R3aXoMq7UA5OoY
 8+aW63WK7DawccZGuKLaM6Zz6S1/WenkS4A7zmx2zQ1n5Ao4VEPvJvKm58tTAM2TOKgD2aCy1vY
 lPD1diu+s2QJxJuRZZ9p1n51L3n1oAt7cFEBH32pZvyjGcY94L0=
X-Google-Smtp-Source: AGHT+IGV7gPf93QQO1WJVtV/nW0FDXYUQssyR5CStDGifbGwwzQP3dnpV8mOxs8Y4y2sm2ikFERqIA==
X-Received: by 2002:a17:90a:d648:b0:2ee:3cc1:793a with SMTP id
 98e67ed59e1d1-2f782d8c178mr8304612a91.29.1738004757474; 
 Mon, 27 Jan 2025 11:05:57 -0800 (PST)
Received: from ?IPv6:2804:1b3:a801:16c4:2e00:3d86:8f34:c7fb?
 ([2804:1b3:a801:16c4:2e00:3d86:8f34:c7fb])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffaf8f03sm7546423a91.39.2025.01.27.11.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 11:05:57 -0800 (PST)
Message-ID: <a6816a68e5e9aeb1d330b68f6a73decd2233c164.camel@gmail.com>
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Vignesh Raman <vignesh.raman@collabora.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Cc: kernelci@lists.linux.dev, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, 	mripard@kernel.org,
 linux-kernel@vger.kernel.org, 	dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, 	gustavo.padovan@collabora.com,
 pawiecz@collabora.com, spbnick@gmail.com, 	tales.aparecida@gmail.com,
 workflows@vger.kernel.org, skhan@linuxfoundation.org, 
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
 kernel@collabora.com, torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, 	daniels@collabora.com,
 helen.koike@collabora.com, shreeya.patel@collabora.com, 
 denys.f@collabora.com, nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, 	hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, 	Tim.Bird@sony.com, broonie@kernel.org,
 groeck@google.com, rdunlap@infradead.org, 	geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi, 	jarkko@kernel.org
Date: Mon, 27 Jan 2025 16:05:47 -0300
In-Reply-To: <6ebd1551-017f-4b31-b235-829b2735d78f@collabora.com>
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
 <20250124081250.GA24731@pendragon.ideasonboard.com>
 <6ebd1551-017f-4b31-b235-829b2735d78f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 Jan 2025 08:09:25 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2025-01-27 at 13:02 +0530, Vignesh Raman wrote:
> Hi Leo,
>=20
> On 24/01/25 13:42, Laurent Pinchart wrote:
> > On Fri, Jan 24, 2025 at 02:11:26AM -0300, Leonardo Br=C3=A1s wrote:
> > > On Thu, 2025-01-23 at 19:23 +0530, Vignesh Raman wrote:
> > > > This patch series introduces "kci-gitlab," a GitLab CI pipeline
> > > > specifically designed for kernel testing. It provides kernel
> > > > developers with an integrated, efficient, and flexible testing
> > > > framework using GitLab's CI/CD capabilities. This patch includes
> > > > a .gitlab-ci file in the tools/ci/gitlab-ci/ folder, along with
> > > > additional YAML and script files, to define a basic test pipeline
> > > > triggered by code pushes to a GitLab-CI instance.
> > > > The initial version implements:
> > > >     =20
> > > > - Static checks: Includes checkpatch and smatch for code validation=
.
> > > > - Build tests: Covers various architectures and configurations.
> > > > - Boot tests: Utilizes virtme for basic boot testing.
> > > >=20
> > > > Additionally, it introduces a flexible "scenarios" mechanism to
> > > > support subsystem-specific extensions.
> > > >=20
> > > > This series also introduces a drm scenario that adds a job to run I=
GT
> > > > tests for vkms. This scenario includes helper scripts to build deqp=
-runner
> > > > and IGT, leveraging approaches from the drm-ci/mesa-ci project.
> > > >=20
> > > > We are working towards creating a generic, upstream GitLab-CI pipel=
ine
> > > > (kci-gitlab) that will replace DRM-CI [1]. The proposed GitLab-CI p=
ipeline
> > > > is designed with a distributed infrastructure model, making it poss=
ible
> > > > to run on any gitLab instance. We plan to leverage KernelCI [2] as =
the
> > > > backend, utilizing its hardware, rootfs, test plans, and KCIDB [3]
> > > > integration.
> > > >=20
> > > > For an example of a fully executed pipeline with drm scenario set,
> > > > including documentation generation,
> > > > see: https://gitlab.freedesktop.org/vigneshraman/kernel/-/pipelines=
/1350262
> > > >=20
> > > > Please refer to the documentation included in the patch, or check t=
he
> > > > rendered version, here:
> > > > https://vigneshraman.pages.freedesktop.org/-/kernel/-/jobs/69787927=
/artifacts/artifacts/Documentation-output/ci/gitlab-ci/gitlab-ci.html
> > > >=20
> > > > Differences from v1 to v2:
> > > > - moved to tools/ci as suggested by Linus on the previous version
> > > > - add arm64 containers for native compilation
> > > > - added boot tests using virtme: this is the base structure for boo=
t tests,
> > > >    next steps would be adding other tests such as kselftests/kunit =
tests
> > > > - added DRM scenario testing on vkms: this should replace current v=
kms test
> > > >    in drm-ci. This work shows how a test scenario can be used by di=
fferent
> > > >    subsystems to add their tests.
> > > > - update documentation
> > > >=20
> > > > For more details on the motivation behind this work, please refer t=
o the
> > > > cover letter of v1: https://patchwork.kernel.org/project/linux-ksel=
ftest/cover/20240228225527.1052240-1-helen.koike@collabora.com/
> > > >=20
> > > > [1] https://www.collabora.com/news-and-blog/blog/2024/02/08/drm-ci-=
a-gitlab-ci-pipeline-for-linux-kernel-testing/
> > > > [2] https://kernelci.org/
> > > > [3] https://docs.kernelci.org/kcidb/
> > > >=20
> > > > Helen Koike (3):
> > > >    kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
> > > >    kci-gitlab: Add documentation
> > > >    kci-gitlab: docs: Add images
> > > >=20
> > > > Vignesh Raman (2):
> > > >    MAINTAINERS: Add an entry for ci automated testing
> > > >    kci-gitlab: Add drm scenario
> > >=20
> > > Hi Vignesh Raman,
> > > I am very happy to see this project going forward :)
> > >=20
> > > It's been a few years since I first thought on finding a good way of =
helping
> > > kernel developers testing their patches, while making use of the free=
 runner
> > > minutes Gitlab offers. It can greatly simplify the testing for people=
 who are
> > > new to kernel development, or students trying to understand it better=
.
> > >=20
> > > And this patchset allows that to happen :)
>=20
> Thanks for testing the patch and providing feedback.

:)

>=20
> > >=20
> > > Actually, I spoke to Helen last year, and to enable it to run on the =
free
> > > Gitlab-CI runners, there is a small extra patch which is needed:
> > >=20
> > > https://lore.kernel.org/all/20240327013055.139494-2-leobras@redhat.co=
m/
>=20
> Thanks for the patch.

Thank you for most of the work, it sure will be useful :)

>=20
> We can keep the variable name as KCI_CI_TAGS (like other variables) and=
=20
> add it in variables with default empty string.

Just tested, if it's an empty string, it will just be ignored, as it won't =
match
anything (that is not an empty string)

>=20
> >=20
> > Gitlab as an open-source software project (the community edition) is on=
e
> > thing, but can we please avoid advertising specific proprietary service=
s
> > in the kernel documentation ?
>=20
> Agree. We could remove the lines which mentions gitlab.com SaaS in
> commit message and documentation.

Done :)
Added a generic reason for needing better instance

>=20
> >=20
> > > Could you please apply it on top of your tree?
> > > Some stuff changed places, but I can send a v2 with that fix if you w=
ant.
>=20
> I will test your patch and we can add this for v3.

Thanks!
That's the v2 with the required changes:

https://lore.kernel.org/all/20250127185849.34131-1-leobras@redhat.com/T/#u

Please let me know if any further change is needed.

Thanks!
Leo

>=20
> Regards,
> Vignesh
>=20
> > >=20
> > >=20
> > > While I have yet to review this v2 patchset, I applied it on my repo =
for
> > > testing,=C2=A0and cherry-picked the patch on above link, triggering a=
 Pipeline:
> > >=20
> > > https://gitlab.com/linux-kernel/linux/-/pipelines/1638955600
> > >=20
> > > It seems to be working fine, please check it, as you may be more used=
 to the
> > > results.
> > >=20
> > > Thanks!
> > > Leo
> >=20


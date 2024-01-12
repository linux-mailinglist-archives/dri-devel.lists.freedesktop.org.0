Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C4382C325
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 16:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040DF10E0DA;
	Fri, 12 Jan 2024 15:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F9C10E0DA;
 Fri, 12 Jan 2024 15:57:50 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-558ac3407eeso2034170a12.0; 
 Fri, 12 Jan 2024 07:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705075069; x=1705679869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i3LR7JHWsG5WnJs6U2d88UYiHWMdGc0ZzpsAbd+9k2w=;
 b=cgFEmLo6et+JFQek6xqFjHgDuZwkuY3MRPePnLSdzk+8ICPWcvCIn5OigsncuyaBE1
 v5aIPcWyWwjsiaTgMfyzWew521SCNok0+Kn9e+1VlKU22luwZF5b8FcWHuSnV1SHKG+p
 Vlc9hdPTnQB7Zvpzf69n4qoRlDh9LVfbUL1CYd/gEvv0NvNiLehIL2ygSudcTcMp9deQ
 dPzfM4C1nZ0z9Og2FDZDjq8gX+qtF6sU1nN7pqsmU0aYd28/dxxuS/11mEbyaQ7pnuo9
 +Y8iGlm6vfuM0RvKJI+Uq/sP3H9SJvU5xWkDeLUrzbWlVRLK/kmtkuCOZMVEYbc8llhw
 GZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705075069; x=1705679869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i3LR7JHWsG5WnJs6U2d88UYiHWMdGc0ZzpsAbd+9k2w=;
 b=R63zWWUXG1EPdsOkTrpu5N6EqrjZZLRVcrHBrDPOCfM/aHm4NFPV61q1u3fu8PHPCf
 JVkaLSM8I0tXsCjKGTNkMibrISxsWG78TbBMh+7nkyCuU2nPJntX5uWdW4ebIiI0J/sq
 DKt8FoJLkfrcqP7NF4eX40TPrc82p2OcExPt9dnB7DSHgTSCW7NPpmKZYaaZkq5wepmY
 4O2peoIpaNw3mHmf2mvtxWwzUOhfXLkgJs4IecwQKj+gwBbA6HKQ2+UjHt/MKv98bh96
 ZIVx/F7RD7J7N77wrX7j1mx2JFTAzAtlf4pJkFNXiuwPElm2rTbVI4oTnTD4J2jYo9mO
 DHhA==
X-Gm-Message-State: AOJu0YwjCYjvp9Ese/Ny6THcVvB3tZm1t46qa40HWFUrTmcrNCFDsEdQ
 poIsgqyIfFRm1lbZiJ3iDyZsr9Na/YHADCihE/E=
X-Google-Smtp-Source: AGHT+IFmoeegZBMTNiFZZdCfLc9xHzLnK5XjPQ27p3qgMhoQ0YPlLF9quVd/qIxt91xPL0cwv3QoAAEuGj2nXPJ7Hy8=
X-Received: by 2002:aa7:c549:0:b0:558:83e5:9937 with SMTP id
 s9-20020aa7c549000000b0055883e59937mr734942edr.8.1705075068823; Fri, 12 Jan
 2024 07:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20240108195016.156583-1-robdclark@gmail.com>
 <27e64458-7cb1-99a4-f67e-60d911f28f44@collabora.com>
In-Reply-To: <27e64458-7cb1-99a4-f67e-60d911f28f44@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 12 Jan 2024 07:57:36 -0800
Message-ID: <CAF6AEGvBFdXe9rHjbwWv9eLUMv2YEP7cfMoXcWgZ30Wn4LzOjw@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Add msm tests
To: Vignesh Raman <vignesh.raman@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Helen Koike <helen.koike@collabora.com>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 3:42=E2=80=AFAM Vignesh Raman
<vignesh.raman@collabora.com> wrote:
>
> Hi Rob,
>
>
> On 09/01/24 01:20, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The msm tests should skip on non-msm hw, so I think it should be safe t=
o
> > enable everywhere.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/ci/testlist.txt | 49 ++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 49 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/ci/testlist.txt b/drivers/gpu/drm/ci/testl=
ist.txt
> > index f82cd90372f4..eaeb751bb0ad 100644
> > --- a/drivers/gpu/drm/ci/testlist.txt
> > +++ b/drivers/gpu/drm/ci/testlist.txt
> > @@ -2910,3 +2910,52 @@ kms_writeback@writeback-invalid-parameters
> >   kms_writeback@writeback-fb-id
> >   kms_writeback@writeback-check-output
> >   prime_mmap_kms@buffer-sharing
> > +msm_shrink@copy-gpu-sanitycheck-8
> > +msm_shrink@copy-gpu-sanitycheck-32
> > +msm_shrink@copy-gpu-8
> > +msm_shrink@copy-gpu-32
> > +msm_shrink@copy-gpu-madvise-8
> > +msm_shrink@copy-gpu-madvise-32
> > +msm_shrink@copy-gpu-oom-8
> > +msm_shrink@copy-gpu-oom-32
> > +msm_shrink@copy-mmap-sanitycheck-8
> > +msm_shrink@copy-mmap-sanitycheck-32
> > +msm_shrink@copy-mmap-8
> > +msm_shrink@copy-mmap-32
> > +msm_shrink@copy-mmap-madvise-8
> > +msm_shrink@copy-mmap-madvise-32
> > +msm_shrink@copy-mmap-oom-8
> > +msm_shrink@copy-mmap-oom-32
> > +msm_shrink@copy-mmap-dmabuf-sanitycheck-8
> > +msm_shrink@copy-mmap-dmabuf-sanitycheck-32
> > +msm_shrink@copy-mmap-dmabuf-8
> > +msm_shrink@copy-mmap-dmabuf-32
> > +msm_shrink@copy-mmap-dmabuf-madvise-8
> > +msm_shrink@copy-mmap-dmabuf-madvise-32
> > +msm_shrink@copy-mmap-dmabuf-oom-8
> > +msm_shrink@copy-mmap-dmabuf-oom-32
> > +msm_mapping@ring
> > +msm_mapping@sqefw
> > +msm_mapping@shadow
> > +msm_submitoverhead@submitbench-10-bos
> > +msm_submitoverhead@submitbench-10-bos-no-implicit-sync
> > +msm_submitoverhead@submitbench-100-bos
> > +msm_submitoverhead@submitbench-100-bos-no-implicit-sync
> > +msm_submitoverhead@submitbench-250-bos
> > +msm_submitoverhead@submitbench-250-bos-no-implicit-sync
> > +msm_submitoverhead@submitbench-500-bos
> > +msm_submitoverhead@submitbench-500-bos-no-implicit-sync
> > +msm_submitoverhead@submitbench-1000-bos
> > +msm_submitoverhead@submitbench-1000-bos-no-implicit-sync
> > +msm_recovery@hangcheck
> > +msm_recovery@gpu-fault
> > +msm_recovery@gpu-fault-parallel
> > +msm_recovery@iova-fault
> > +msm_submit@empty-submit
> > +msm_submit@invalid-queue-submit
> > +msm_submit@invalid-flags-submit
> > +msm_submit@invalid-in-fence-submit
> > +msm_submit@invalid-duplicate-bo-submit
> > +msm_submit@invalid-cmd-idx-submit
> > +msm_submit@invalid-cmd-type-submit
> > +msm_submit@valid-submit
>
> I tested this patch with latest drm-misc/drm-misc-next and there was
> some failures seen for the newly added msm tests. I have updated the
> xfails with below commit,
>
> https://gitlab.freedesktop.org/vigneshraman/linux/-/commit/d012893597a661=
d6ebbb755bf2607dfb055524a1
>
> I will notify the maintainers about the flaky tests, update the url in
> the flakes.txt, and submit a separate patch for this change.

Thanks, it looks like you also have a relatively recent igt (there
were some msm_submit fails until I fixed the test)..

BR,
-R

> Regards,
> Vignesh

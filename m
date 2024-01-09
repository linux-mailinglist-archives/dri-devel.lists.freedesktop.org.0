Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DBF827CC3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 03:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBBD10E34B;
	Tue,  9 Jan 2024 02:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACF310E34B;
 Tue,  9 Jan 2024 02:13:15 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-55770379ed4so2307867a12.3; 
 Mon, 08 Jan 2024 18:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704766394; x=1705371194; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GanZIXSi0lvbqxqGS2oZbCZuJ/1CzDIHjm38iw98S94=;
 b=NKiM+OkrBnsLjFedsP3ygQlcVQOcH0PLgWVdfJTwLnK1uzckM4WAUDDCrKJD37U/MU
 5Ll9r6r35JG0uXZ/TmeQtpBMhuCwKzyRYVqLRWdSi6mFrzYwyinRB/m+fkOzJz7MPdX9
 cr4ddIBmlFhvj/vPLnqojZBUzafFf1rKa7TbnQr+Dm7vley9NKfbyr/1hrIAfR6MtslW
 EA4KwwoQKB9jnCtXpMpduwwG2Min8DMuiA0/CGBOjpP3T6c74VnqiSI/dUx8wUTzVLWc
 PCONbt1BwANDbH3h8Z3FsRrogaQxcI/m3aZMD86onqWvrodprAb7Z/s1YrkEAa0mgIIr
 B4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704766394; x=1705371194;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GanZIXSi0lvbqxqGS2oZbCZuJ/1CzDIHjm38iw98S94=;
 b=rUXM4Xa+SfhhRmze74Btsbv/quHwJxoWQo3rd069wDYrdEIOTLu/z1guoBzke7T4QC
 5/6kNAYNZwRNLEFrK6qaZGtVrQAqZkvMF6mmzaAY1Y+Wefl0yib5hyy2U01NJSeLRWTV
 prQW4sFBuozvyeQaUQ7Frd9ODYr+iTWyqd35HDJWbgXg/jcAgf99Fz6INsBj2PVCIpVG
 SI3A3B6uxhdLfG7PivUc7x21s6O+2qBx3nl6/qx8H/hgCdCa5Cet23w2pwDWJYYpOnZa
 cLshJ7kQ7T0Nfahi0Waj+npGE0El+B4dgmPKl5L5DlfJirg28OYGCkEqqWz6eepxk+bn
 uVOg==
X-Gm-Message-State: AOJu0YwBdmQ51n6w47MJ2PcJwpp/jqUhru4ghDyoDetyMLtuFs/6kYGR
 hVUukMvLRQqDvSvONZZhMHWsY9sH0Xt5tSPYtPI=
X-Google-Smtp-Source: AGHT+IHbPrN1RypImXOGgmrR3yfC9TeGq1oGmnJ6HbhZRd3v/jJrYwKGt00TwH3VeZzUkZlvncohucMcaq2bQKMhXzM=
X-Received: by 2002:a50:9993:0:b0:556:e686:ba4 with SMTP id
 m19-20020a509993000000b00556e6860ba4mr2112395edb.84.1704766393585; Mon, 08
 Jan 2024 18:13:13 -0800 (PST)
MIME-Version: 1.0
References: <20240108195016.156583-1-robdclark@gmail.com>
 <454873e5-1b5a-28d3-ffed-c1e502898d17@quicinc.com>
In-Reply-To: <454873e5-1b5a-28d3-ffed-c1e502898d17@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 8 Jan 2024 18:13:01 -0800
Message-ID: <CAF6AEGuVk=a-SwHyVwqOew-+WAdH1Gt011H50kvkSBe1j5ri_A@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Add msm tests
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Helen Koike <helen.koike@collabora.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 8, 2024 at 2:58=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicinc=
.com> wrote:
>
>
>
> On 1/8/2024 11:50 AM, Rob Clark wrote:
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
>
> I do see that all these tests use igt_msm_dev_open() to make sure it
> opens only the MSM card.
>
> But if igt_msm_dev_open() fails, I dont see a igt_require() on some of
> the tests to skip them. So how will it safely skip on non-msm HW?
>
> Unless i am missing something here ....

hmm, at the time I added the initial msm tests, and
igt_msm_dev_open(), I verified that they skipped on intel.. but since
then I'd switched from intel to sc8280xp device for primary dev
device, so I'd need to re-test to remember how it works.  If these
aren't skipping on !msm, it is a bug

BR,
-R

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

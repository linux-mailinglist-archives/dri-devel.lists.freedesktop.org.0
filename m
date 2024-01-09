Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C40828908
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 16:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A587810E427;
	Tue,  9 Jan 2024 15:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AD510E2F4;
 Tue,  9 Jan 2024 15:31:19 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5542a7f1f3cso3503804a12.2; 
 Tue, 09 Jan 2024 07:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704814278; x=1705419078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PxBXHYFAM9hT0OPdpUiDaQH1QeZpaAp07NJ8WhXUbqI=;
 b=cCcPl9+5wFDGmdfNmo+DBw/P35ePchJqLH6EZ1kyM80SG65uPOjnUimUgluTQCQbRn
 bx3BEIXgSFkbuQVz+OA0eOlknYVaygKXi9V36jtch3Q0lSzgWNTizIVx81dYolACjO+0
 KSwpJxYBcLSKdOhBqhhWtkZOrfcJMYOo0AVQfWXOXN9pjPCOkGZgzwe42A1/TxQQzWj2
 1r02lJY5DOmxHnsMEvqR6YbfqgbGNn119ImY1IAJZ7J1i5dv7GrZeQuBuuX13LipWYtV
 P8WIBPvCjd05xEBhAQIVCJaI0xn2slVgWZz8VHoGpklo5YKi29sHV/9D0PfFoagxrf0M
 JWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704814278; x=1705419078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PxBXHYFAM9hT0OPdpUiDaQH1QeZpaAp07NJ8WhXUbqI=;
 b=SM2xDjQ9bJ1gh8SmH9YU8LOZSoC/srP9qxw3lo1Tp1Vgw2MkOd8hI4m5tU2MdjVQqN
 mOGzdWyXcsmUaBjytgNPczsyyODTPI2q37rwrdO+rnz2PRoEDAKbtOhqd3Dx0y1ME5al
 MD3blqgQOEn10+PaZ8CxNsQg4JKH/q7CExs84iUDpVVcUDwJGgd55Pp8QyIQoe0ifs2U
 AY6JSx6AzUOkZD3ONyIZR+O53fKlE4yO9foTNn21rJGQ4sUcPzgqLjtXxMAhIvwOIz1i
 G/PIt4EmV/7oNs4zeXvgwNiwpYw7/dm/oq15aqilOBBgC4cpwz1aA4HIzOIm6MlbWkR/
 /JnA==
X-Gm-Message-State: AOJu0Yx6zOQDcemNEIl5wK95E1tTkNXlyj5DHObrlelSyn1k10ApV754
 JUOMvs00MsppYHU56Wisl+wWoYpPcDfV0c+8BLQ=
X-Google-Smtp-Source: AGHT+IGZyO4AEfnMfLYPKR2LNX1qm2urfpVyDpvn02M9tLIi+tBjOPpZ/2hQu1bO1hbBogEOEOu71wclHwHHjR9FC0U=
X-Received: by 2002:a50:934a:0:b0:557:375e:6dfa with SMTP id
 n10-20020a50934a000000b00557375e6dfamr3382250eda.13.1704814278180; Tue, 09
 Jan 2024 07:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20240108195016.156583-1-robdclark@gmail.com>
 <454873e5-1b5a-28d3-ffed-c1e502898d17@quicinc.com>
 <CAF6AEGuVk=a-SwHyVwqOew-+WAdH1Gt011H50kvkSBe1j5ri_A@mail.gmail.com>
In-Reply-To: <CAF6AEGuVk=a-SwHyVwqOew-+WAdH1Gt011H50kvkSBe1j5ri_A@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 9 Jan 2024 07:31:06 -0800
Message-ID: <CAF6AEGs7NxB2ox+JMW0tP_XOkFie=f=w1sWSQjTUM8AZQ0V3TQ@mail.gmail.com>
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

On Mon, Jan 8, 2024 at 6:13=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> On Mon, Jan 8, 2024 at 2:58=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quici=
nc.com> wrote:
> >
> >
> >
> > On 1/8/2024 11:50 AM, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The msm tests should skip on non-msm hw, so I think it should be safe=
 to
> > > enable everywhere.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >   drivers/gpu/drm/ci/testlist.txt | 49 ++++++++++++++++++++++++++++++=
+++
> > >   1 file changed, 49 insertions(+)
> > >
> >
> > I do see that all these tests use igt_msm_dev_open() to make sure it
> > opens only the MSM card.
> >
> > But if igt_msm_dev_open() fails, I dont see a igt_require() on some of
> > the tests to skip them. So how will it safely skip on non-msm HW?
> >
> > Unless i am missing something here ....
>
> hmm, at the time I added the initial msm tests, and
> igt_msm_dev_open(), I verified that they skipped on intel.. but since
> then I'd switched from intel to sc8280xp device for primary dev
> device, so I'd need to re-test to remember how it works.  If these
> aren't skipping on !msm, it is a bug

I double checked, these tests skip in drm_open_driver() with "No known
gpu found for chipset flags 0x64 (msm)", so no problem to run them on
all CI runners.

BR,
-R


> BR,
> -R
>
> > > diff --git a/drivers/gpu/drm/ci/testlist.txt b/drivers/gpu/drm/ci/tes=
tlist.txt
> > > index f82cd90372f4..eaeb751bb0ad 100644
> > > --- a/drivers/gpu/drm/ci/testlist.txt
> > > +++ b/drivers/gpu/drm/ci/testlist.txt
> > > @@ -2910,3 +2910,52 @@ kms_writeback@writeback-invalid-parameters
> > >   kms_writeback@writeback-fb-id
> > >   kms_writeback@writeback-check-output
> > >   prime_mmap_kms@buffer-sharing
> > > +msm_shrink@copy-gpu-sanitycheck-8
> > > +msm_shrink@copy-gpu-sanitycheck-32
> > > +msm_shrink@copy-gpu-8
> > > +msm_shrink@copy-gpu-32
> > > +msm_shrink@copy-gpu-madvise-8
> > > +msm_shrink@copy-gpu-madvise-32
> > > +msm_shrink@copy-gpu-oom-8
> > > +msm_shrink@copy-gpu-oom-32
> > > +msm_shrink@copy-mmap-sanitycheck-8
> > > +msm_shrink@copy-mmap-sanitycheck-32
> > > +msm_shrink@copy-mmap-8
> > > +msm_shrink@copy-mmap-32
> > > +msm_shrink@copy-mmap-madvise-8
> > > +msm_shrink@copy-mmap-madvise-32
> > > +msm_shrink@copy-mmap-oom-8
> > > +msm_shrink@copy-mmap-oom-32
> > > +msm_shrink@copy-mmap-dmabuf-sanitycheck-8
> > > +msm_shrink@copy-mmap-dmabuf-sanitycheck-32
> > > +msm_shrink@copy-mmap-dmabuf-8
> > > +msm_shrink@copy-mmap-dmabuf-32
> > > +msm_shrink@copy-mmap-dmabuf-madvise-8
> > > +msm_shrink@copy-mmap-dmabuf-madvise-32
> > > +msm_shrink@copy-mmap-dmabuf-oom-8
> > > +msm_shrink@copy-mmap-dmabuf-oom-32
> > > +msm_mapping@ring
> > > +msm_mapping@sqefw
> > > +msm_mapping@shadow
> > > +msm_submitoverhead@submitbench-10-bos
> > > +msm_submitoverhead@submitbench-10-bos-no-implicit-sync
> > > +msm_submitoverhead@submitbench-100-bos
> > > +msm_submitoverhead@submitbench-100-bos-no-implicit-sync
> > > +msm_submitoverhead@submitbench-250-bos
> > > +msm_submitoverhead@submitbench-250-bos-no-implicit-sync
> > > +msm_submitoverhead@submitbench-500-bos
> > > +msm_submitoverhead@submitbench-500-bos-no-implicit-sync
> > > +msm_submitoverhead@submitbench-1000-bos
> > > +msm_submitoverhead@submitbench-1000-bos-no-implicit-sync
> > > +msm_recovery@hangcheck
> > > +msm_recovery@gpu-fault
> > > +msm_recovery@gpu-fault-parallel
> > > +msm_recovery@iova-fault
> > > +msm_submit@empty-submit
> > > +msm_submit@invalid-queue-submit
> > > +msm_submit@invalid-flags-submit
> > > +msm_submit@invalid-in-fence-submit
> > > +msm_submit@invalid-duplicate-bo-submit
> > > +msm_submit@invalid-cmd-idx-submit
> > > +msm_submit@invalid-cmd-type-submit
> > > +msm_submit@valid-submit

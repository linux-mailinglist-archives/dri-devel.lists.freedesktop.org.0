Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B860AB7858
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 23:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A27E10E747;
	Wed, 14 May 2025 21:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="c/ma/It9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BE910E747
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 21:59:35 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43d5f10e1aaso22285e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 14:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747259973; x=1747864773;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RlmeeTfLkq8aEMSuw0FxNnLKvZlTgNOBO6GA5zAYi+M=;
 b=c/ma/It9Iaopf9bQmCFw8DzAyRmhyQnXcU4f2VYfaiuYALoSXDE9ivGVm7QgDd8Kvs
 72gnU0KHiIabV3KnCOangAUv2Hh0XYyzJsRawmAPRv1uyxaC3XMbyOBq1KPapr/EHFwD
 DGfy9qOAhab/jf8U32HlPev4kauuKkvI2fhANoNYMHdzU05gkw5uNQe2V3ycd0CX0sc3
 g0rECvAYVEzxfh1o+LjAAixfTzcBDUtbJXXdlo5vN1Y4vxLGH+uhtlEomPzwBQWUQnqP
 QmpLSV7jw5b2O6z6s0Dou2HM8qVH+yFc+kzrZEfNcc2dhive9FztHWIjfW2p2FrGRPuJ
 5XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747259973; x=1747864773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RlmeeTfLkq8aEMSuw0FxNnLKvZlTgNOBO6GA5zAYi+M=;
 b=Xesrr95FEInyvZ0QBIdLk3te2rMo7NsYRMa0RYZe3dY4q+8ygYbOQIUUBkbajXfNdV
 kgQ1l2Y9/aysSBpCPAzp+u8u6TWVpRXPK7ZA1K7Rw1zOwxc9xMftvUcvoO/l7yZ6A7Dh
 YTlZvrRCdiJ9F9obVZinu8vUMDT5qrmdrVOZS7kzCPDQen/qYFkodIjUbtnipSk++o30
 j6i9ch2kekT72+Pwmxb6rhrOUjITiEdIA3xjhXQIynYDt2oAJrE8yEfEDIEOGqXuTEKr
 bTCdL3yRdweBjKeHWc6dViv0o4pJOixmiZ7Uqvz1jyI1ucBjy5UPLeTm1S4mmveENlQA
 J3AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMk/5iK6CU6CkdEDTQyRZcB7twXRhPLm0vs2Tawf0C+mqY50bqwCY0o9NigBOCk53B2c+j3G5Zc0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/trYmpyFyf/h+CHhtnjIg/449Q6O/Cp4PY+Dk4ZCi3V5U3sdD
 G/y+t7XUcBm+XL3P3gdQIvJPAlrN52SMU6tL66WKnIeC87cZEEYgVWB8hfPnqB18MsP1HW4Gnvw
 vU5PDA3RjX1MzhYajK8MHH2eeDFIumqqRyuukSAUw
X-Gm-Gg: ASbGncte0+h0KbTq3VZ+MpsKQrXFqht1X2tjYF2MuHGwhWZLnx/w7XEG/ZMqpmAACT4
 MTbhS5wsgVB+gb9NfauHWcgR9Bz7EKoo9MDMeHnVabPZCp/C7H23ZbtxNgDrqDLXoGqPEjY0XNB
 Km42BdP5vhWsSvo/SJ3fCj/MXdHF8Zqki8Qe+RuDfqb6Of9x1Q2aD6ReFp2p30ey0=
X-Google-Smtp-Source: AGHT+IGZFtWR6kaa3m5TftPx8Xk4j/uPH4VRUM2tBcUfEbplvxpzfZrRREM/wd4w9XuTIGx4myNdq/Z7Y6ry3xbYHkg=
X-Received: by 2002:a05:600c:4f43:b0:439:8d84:32ff with SMTP id
 5b1f17b1804b1-442f94eb5a7mr91875e9.3.1747259973405; Wed, 14 May 2025 14:59:33
 -0700 (PDT)
MIME-Version: 1.0
References: <20250513163601.812317-1-tjmercier@google.com>
 <20250513163601.812317-6-tjmercier@google.com>
 <CAPhsuW50mA3hhirHBiZ2miBeC0uAN=KxyYKBJ_hHgmFx-cvaNw@mail.gmail.com>
In-Reply-To: <CAPhsuW50mA3hhirHBiZ2miBeC0uAN=KxyYKBJ_hHgmFx-cvaNw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 14 May 2025 14:59:21 -0700
X-Gm-Features: AX0GCFuiegK4tHyclG5bzgCNPpj8LN37JRrILy438Zw7YZxZPwu1YJY1Fclo4i0
Message-ID: <CABdmKX1nxw6=JVfT8wEgsJB692LbaYWrpL-CN=KPQi7K_cKPSA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 5/5] selftests/bpf: Add test for open coded
 dmabuf_iter
To: Song Liu <song@kernel.org>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, alexei.starovoitov@gmail.com, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 14, 2025 at 2:00=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Tue, May 13, 2025 at 9:36=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > Use the same test buffers as the traditional iterator and a new BPF map
> > to verify the test buffers can be found with the open coded dmabuf
> > iterator.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Acked-by: Song Liu <song@kernel.org>
> > ---
> >  .../testing/selftests/bpf/bpf_experimental.h  |  5 +++
> >  .../selftests/bpf/prog_tests/dmabuf_iter.c    | 41 +++++++++++++++++++
> >  .../testing/selftests/bpf/progs/dmabuf_iter.c | 38 +++++++++++++++++
> >  3 files changed, 84 insertions(+)
> >
> > diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/tes=
ting/selftests/bpf/bpf_experimental.h
> > index 6535c8ae3c46..5e512a1d09d1 100644
> > --- a/tools/testing/selftests/bpf/bpf_experimental.h
> > +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> > @@ -591,4 +591,9 @@ extern int bpf_iter_kmem_cache_new(struct bpf_iter_=
kmem_cache *it) __weak __ksym
> >  extern struct kmem_cache *bpf_iter_kmem_cache_next(struct bpf_iter_kme=
m_cache *it) __weak __ksym;
> >  extern void bpf_iter_kmem_cache_destroy(struct bpf_iter_kmem_cache *it=
) __weak __ksym;
> >
> > +struct bpf_iter_dmabuf;
> > +extern int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it) __weak __ks=
ym;
> > +extern struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it=
) __weak __ksym;
> > +extern void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it) __weak=
 __ksym;
> > +
> >  #endif
> > diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/too=
ls/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > index dc740bd0e2bd..6c2b0c3dbcd8 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > @@ -219,14 +219,52 @@ static void subtest_dmabuf_iter_check_default_ite=
r(struct dmabuf_iter *skel)
> >         close(iter_fd);
> >  }
> >
> > +static void subtest_dmabuf_iter_check_open_coded(struct dmabuf_iter *s=
kel, int map_fd)
> > +{
> > +       LIBBPF_OPTS(bpf_test_run_opts, topts);
> > +       char key[DMA_BUF_NAME_LEN];
> > +       int err, fd;
> > +       bool found;
> > +
> > +       /* No need to attach it, just run it directly */
> > +       fd =3D bpf_program__fd(skel->progs.iter_dmabuf_for_each);
> > +
> > +       err =3D bpf_prog_test_run_opts(fd, &topts);
> > +       if (!ASSERT_OK(err, "test_run_opts err"))
> > +               return;
> > +       if (!ASSERT_OK(topts.retval, "test_run_opts retval"))
> > +               return;
> > +
> > +       if (!ASSERT_OK(bpf_map_get_next_key(map_fd, NULL, key), "get ne=
xt key"))
> > +               return;
> > +
> > +       do {
> > +               ASSERT_OK(bpf_map_lookup_elem(map_fd, key, &found), "lo=
okup");
> > +               ASSERT_TRUE(found, "found test buffer");
>
> This check failed once in the CI, on s390:
>
> Error: #89/3 dmabuf_iter/open_coded
> 9309 subtest_dmabuf_iter_check_open_coded:PASS:test_run_opts err 0 nsec
> 9310 subtest_dmabuf_iter_check_open_coded:PASS:test_run_opts retval 0 nse=
c
> 9311 subtest_dmabuf_iter_check_open_coded:PASS:get next key 0 nsec
> 9312 subtest_dmabuf_iter_check_open_coded:PASS:lookup 0 nsec
> 9313 subtest_dmabuf_iter_check_open_coded:FAIL:found test buffer
> unexpected found test buffer: got FALSE
>
> But it passed in the rerun. It is probably a bit flakey. Maybe we need so=
me
> barrier somewhere.
>
> Here is the failure:
>
> https://github.com/kernel-patches/bpf/actions/runs/15002058808/job/422348=
64754
>
> To see the log, you need to log in GitHub.
>
> Thanks,
> Song

Thanks, yeah I have been trying to run this locally today but still
working on setting up an environment for it. Daniel Xu thoughtfully
suggested I use a github PR to trigger CI, but I tried that last week
without success: https://github.com/kernel-patches/bpf/pull/8910

I'm not sure if this is the cause (doesn't show up on the runs that
pass) but I have no idea why that would be intermittently failing:
libbpf: Error in bpf_create_map_xattr(testbuf_hash): -EINVAL. Retrying
without BTF.





> > +       } while (bpf_map_get_next_key(map_fd, key, key));
> > +}
>
> [...]

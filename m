Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4044E34FC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 00:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79A510E4D5;
	Mon, 21 Mar 2022 23:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E96F10E4D5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 23:54:39 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id bg10so32971954ejb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 16:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qiaO27WzdyEkhPCgtVcKJYNpZr9WKp2+zwnsf/1VvSc=;
 b=Ri8yuR7/Vfc3fPL9gQLx7nlC2w5WarFCPritcrnsHpSsxuLwI5G3Voo8JeXcgyszLb
 +2uoYc1aMEeZckMfuvJ2tS1RQ4sV4x2bEw3/t6bZI8mymUrBIyCvE8fdVOZNpVekttmd
 gL3/aF9rUmS8p0UDTQfskhyx+I2egHowIc+sQ/N03tFWDWkkas9yz9J6z6/pRbfJotOJ
 Hya7yMo0Sw59opqFkSYTZhc7F9NiPgJ8uwx1p8C0nJ00wLf8jKvLHqjCFphRAZgfpYi+
 VVSQCs5iHmIrTMa+g/VlfDJHcUV27McnejGmfZoaaKiH2IvdAJP5kg+Lda21FYCK3UME
 MrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qiaO27WzdyEkhPCgtVcKJYNpZr9WKp2+zwnsf/1VvSc=;
 b=fRtkJzZF64YWKwb1mOIkMlkGZG2h//TXeRC75BnM43HGyj/fQsAv+2zd2Z+S7e5TnX
 brdfE3MabZdNJvOQzD5N3ZWFL9uIX5bAD+AR8TQQCXZ3VBZV1vFrUx9Ka0GyxShQZuEx
 SiKGxk1druU3RpAQU5FAbRnYMyo9i2V80SOTfahR6X2/QZ2Llbj2d3bXuBgeGLDILW25
 vZ3KbD5eS+tuQ5ak7Pwv61+HmQcdWi8zNfn0iWKqgz4YgHAV5AHNuMTK4YAAZz8CYnn/
 hAxudugmKkuqtBbaDC7adITi1EFh1poYpVdpYeZmK1Y7l+NyLmlLTuRO7CTyRfwzAUY9
 EYjg==
X-Gm-Message-State: AOAM530MYGVj0ZFO6JTk93fjp09kwnMqCnCvbrBs+RW8yFuCSc85y/fL
 7xr2isOEq19c6AEoS4wIUf03SqbWOzwckOIVaIWXqA==
X-Google-Smtp-Source: ABdhPJwljarBa64DW7LUA/1wDxvFxLHgPtNYizJ4BJSCb3j/73bGTaegZtVwv4hXKy5Ey64Opp4zZ4UPfFj0Fl96E/A=
X-Received: by 2002:a17:907:3eaa:b0:6df:b058:96a with SMTP id
 hs42-20020a1709073eaa00b006dfb058096amr18101556ejc.368.1647906877844; Mon, 21
 Mar 2022 16:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220309165222.2843651-1-tjmercier@google.com>
 <20220309165222.2843651-6-tjmercier@google.com>
 <20220321174530.GB9640@blackbody.suse.cz>
In-Reply-To: <20220321174530.GB9640@blackbody.suse.cz>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 21 Mar 2022 16:54:26 -0700
Message-ID: <CABdmKX3+mTjxWzgrv44SKWT7mdGnQKMrv6c26d=iWdNPG7f1VQ@mail.gmail.com>
Subject: Re: [RFC v3 5/8] dmabuf: Add gpu cgroup charge transfer function
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kenny.Ho@amd.com, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Laura Abbott <labbott@redhat.com>,
 linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, linaro-mm-sig@lists.linaro.org,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 10:45 AM Michal Koutn=C3=BD <mkoutny@suse.com> wrot=
e:
>
> Hello.
>
> On Wed, Mar 09, 2022 at 04:52:15PM +0000, "T.J. Mercier" <tjmercier@googl=
e.com> wrote:
> > +int dma_buf_charge_transfer(struct dma_buf *dmabuf, struct gpucg *gpuc=
g)
> > +{
> > +#ifdef CONFIG_CGROUP_GPU
> > +     struct gpucg *current_gpucg;
> > +     int ret =3D 0;
> > +
> > +     /*
> > +      * Verify that the cgroup of the process requesting the transfer =
is the
> > +      * same as the one the buffer is currently charged to.
> > +      */
> > +     current_gpucg =3D gpucg_get(current);
> > +     mutex_lock(&dmabuf->lock);
> > +     if (current_gpucg !=3D dmabuf->gpucg) {
> > +             ret =3D -EPERM;
> > +             goto err;
> > +     }
>
> Add a shortcut for gpucg =3D=3D current_gpucg?

Good idea, thank you!

>
> > +
> > +     ret =3D gpucg_try_charge(gpucg, dmabuf->gpucg_dev, dmabuf->size);
> > +     if (ret)
> > +             goto err;
> > +
> > +     dmabuf->gpucg =3D gpucg;
> > +
> > +     /* uncharge the buffer from the cgroup it's currently charged to.=
 */
> > +     gpucg_uncharge(current_gpucg, dmabuf->gpucg_dev, dmabuf->size);
>
> I think gpucg_* API would need to cater for such transfers too since
> possibly transitional breach of a limit during the transfer may
> unnecessarily fail the operation.

Since the charge is duplicated in two cgroups for a short period
before it is uncharged from the source cgroup I guess the situation
you're thinking about is a global (or common ancestor) limit? I can
see how that would be a problem for transfers done this way and an
alternative would be to swap the order of the charge operations: first
uncharge, then try_charge. To be certain the uncharge is reversible if
the try_charge fails, I think I'd need either a mutex used at all
gpucg_*charge call sites or access to the gpucg_mutex, which implies
adding transfer support to gpu.c as part of the gpucg_* API itself and
calling it here. Am I following correctly here?

This series doesn't actually add limit support just accounting, but
I'd like to get it right here.

>
> My 0.02=E2=82=AC,
> Michal

Thanks!

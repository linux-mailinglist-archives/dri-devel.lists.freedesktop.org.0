Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C011950AB78
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 00:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642A210E278;
	Thu, 21 Apr 2022 22:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A139310E278
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 22:25:41 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id e30so4748713eda.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 15:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=flU6CYbGj5HHjHL/rSfoESS0j19ra3SqkJwdnrfGTCE=;
 b=mhiuMoEGCpN3Zgcfbu33ndnnHh5jgqOCiSxHecLhuWCXZWzmGwn3io2Yb0J9sVXrRu
 dVuKXpiZLkRNq27Wi97ysToJPLJVCkO2UJj8e9pi1U9+geswfxbQk0PInen+gN1nC/q3
 EQH+J+W2EB/3oJQcLHvhzMasWXWbYKCN+xFkYzvLtnIDfwvghacyiAv73I5tHw5J4Xyl
 kOW8QFEmHY7Y4t2gLJj+WtM3k8FiNHmvtFww+x6GTaRfj9df1KxCR5rFPJeAEUPRYRWa
 +jbksUqiyU0D5YlCrSSFOKo0uGF9q5mGT13/q67LBrF3I7WvpFCT+oN/ugxSWLTg5R1w
 OJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=flU6CYbGj5HHjHL/rSfoESS0j19ra3SqkJwdnrfGTCE=;
 b=7uAjfpddLwbB2fVxEpQgr/6DglbuFt7WeFkKvieV4em+YVQMdGX9rGzUqMpUTfCuwV
 IXPNwq+edvX/ivjkZUgfECtmYpOVmUQK3CCKvfmm1kd3yWUU9vILWacoOYcyjI/q4NZi
 8xNj0L8QCTD6jYwOkjamAHYrluf1HxxIKcSTC7C//KNV1XN4CYx8SUbV6zyiXum9nXjs
 ybUod/kdSrn8B7l1o5f7U2OTTshFr+kjiqkfB5I+izNN0fPAlmXZoimPKdPBz0eKmPNu
 tZaums8Dts9UfPdrgx/FaR8Ac7ynCmnNwExvYT8YiSCh4oHPHgO1T5koY8acXwm887co
 vMFA==
X-Gm-Message-State: AOAM533zk3TKZyAjCsyBU5zKA9/AMlopmIELQejV0dVzab8SPdamqF+C
 VMn3j2C4G47NhDBDik/sRs9t+ibN6HQsHy9t+ZBDbw==
X-Google-Smtp-Source: ABdhPJwFjKL7IPakp+6xAgghiOAlOuHjAgg1o426hhEXf8oiL7SRnTS4Ua2knhN3kp/AQcYwc0V9Gv/jkgiNr64uQxU=
X-Received: by 2002:a05:6402:4488:b0:425:9335:bbcb with SMTP id
 er8-20020a056402448800b004259335bbcbmr1799092edb.197.1650579939899; Thu, 21
 Apr 2022 15:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220420235228.2767816-1-tjmercier@google.com>
 <20220420235228.2767816-2-tjmercier@google.com>
 <YmG/4Q0Cz0yUMbu+@slm.duckdns.org>
In-Reply-To: <YmG/4Q0Cz0yUMbu+@slm.duckdns.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 21 Apr 2022 15:25:28 -0700
Message-ID: <CABdmKX2+72bh2tsdg5iFDTQnFyER1Vs9aX0p3TE7RaM4D5_uCA@mail.gmail.com>
Subject: Re: [RFC v5 1/6] gpu: rfc: Proposal for a GPU cgroup controller
To: Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel-team@android.com, Todd Kjos <tkjos@android.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Kenny.Ho@amd.com, Shuah Khan <skhan@linuxfoundation.org>,
 Carlos Llamas <cmllamas@google.com>, linux-doc@vger.kernel.org,
 John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Kalesh Singh <kaleshsingh@google.com>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 1:34 PM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Wed, Apr 20, 2022 at 11:52:19PM +0000, T.J. Mercier wrote:
> > From: Hridya Valsaraju <hridya@google.com>
> >
> > This patch adds a proposal for a new GPU cgroup controller for
> > accounting/limiting GPU and GPU-related memory allocations.
> > The proposed controller is based on the DRM cgroup controller[1] and
> > follows the design of the RDMA cgroup controller.
> >
> > The new cgroup controller would:
> > * Allow setting per-device limits on the total size of buffers
> >   allocated by device within a cgroup.
> > * Expose a per-device/allocator breakdown of the buffers charged to a
> >   cgroup.
> >
> > The prototype in the following patches is only for memory accounting
> > using the GPU cgroup controller and does not implement limit setting.
> >
> > [1]: https://lore.kernel.org/amd-gfx/20210126214626.16260-1-brian.welty@intel.com/
> >
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> Looks straight-forward enough from cgroup side. Are gpu folks generally
> happy? David, Daniel, Kenny, what are your thoughts?
>
> >  Documentation/gpu/rfc/gpu-cgroup.rst | 190 +++++++++++++++++++++++++++
>
> Can you fold the important part into cgroup-v2.rst and maybe make the rest
> code comments if necessary?
>
Sure thing, thanks.

> Thanks.
>
> --
> tejun

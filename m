Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551BF4E433E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 16:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBC110E02B;
	Tue, 22 Mar 2022 15:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF07D10E02B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 15:42:08 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id h1so22142321edj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 08:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nlDmFglz7whj/r0GBRKFJ24ATNTxPzzUgtpMW7485f4=;
 b=CND1Tv8y6h1wN3nXUQIKzu8LJkbk/862t1GsMuYd+VkdxovrTkb3al98dhDbupbe12
 QXuRoX6v14abx56NU7QF+9NGYzOFXPjIFilEb5iGh5vpslTno0fzKgvJfg5koKbmHz5d
 vYj7LoRwC6XkP+3DLboyZVHpk8OUGbhumdqo9fqMS2jco8PbB4d+WrP5GBaK+jgACVjc
 H3mKuCT2WW6HfHHoK5gzbP10+klCOPRsnAr11BVA7ZEnncpigY41CsoHDPS8S3Dlr0Ns
 iZHZ/WcuewTT+kVQ6KA2kKz4zO/JxPoHq3uYjMYs2gCqp960E+gWubc8R1ajqLYXIZYY
 OQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nlDmFglz7whj/r0GBRKFJ24ATNTxPzzUgtpMW7485f4=;
 b=yNY0DegojfN2yA9qZFEKSC4o2BcBH40eeXDsInp/dgIySUTVc6KMcyrnlD06rmU2MZ
 6FN++m+yYlrkmqewaSZpbqURWvYN0Jj9NJPAB4l0arA3nCQIMWFywlsWNIL0whVXLwTY
 WjSVGVOB3x+pKKYNw3uJxzi/yWWNdvgnVK9PXhstHskmAijFYGGyZHd970OR+JtoJx4z
 3jAtNj0/8SUZ1mWDT3hCaQSCbZRYbV8iN2uz1pqoBB2lr5wvDilxBFlamhoDBqV7OAUB
 r3jVr8RmyUCfUn9HLP4gh7Ss1Bun5zBzDe7kpJW/LQS9KmAlEscn28rnbYulmjJXpVno
 vDjA==
X-Gm-Message-State: AOAM5305b0ZaW0kOAeLcjYfXeTKE/Prvovd9iY/14mgfBbK0eATuan9d
 gO6jntmZTz5HxMQ/efGrL8mtXfe8qJFvLt/RxjdFtw==
X-Google-Smtp-Source: ABdhPJyfaNCeAne2eFe8CfwRN/f/oVNmY2Y/pOhZZsuRaOYGVMOQUibxtTc32t6sxxUnC/B69PTQ0uqLWnTvQDvhzLc=
X-Received: by 2002:a05:6402:1e96:b0:418:ff57:ada2 with SMTP id
 f22-20020a0564021e9600b00418ff57ada2mr27039663edf.197.1647963727136; Tue, 22
 Mar 2022 08:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220309165222.2843651-1-tjmercier@google.com>
 <20220309165222.2843651-2-tjmercier@google.com>
 <20220321173726.GA9640@blackbody.suse.cz>
In-Reply-To: <20220321173726.GA9640@blackbody.suse.cz>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 22 Mar 2022 08:41:55 -0700
Message-ID: <CABdmKX10jqubJr49JENaHpFnqHV88+Fb7iNZNH4T1Cy7n9y=ag@mail.gmail.com>
Subject: Re: [RFC v3 1/8] gpu: rfc: Proposal for a GPU cgroup controller
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

On Mon, Mar 21, 2022 at 10:37 AM Michal Koutn=C3=BD <mkoutny@suse.com> wrot=
e:
>
> Hello.
>
> On Wed, Mar 09, 2022 at 04:52:11PM +0000, "T.J. Mercier" <tjmercier@googl=
e.com> wrote:
> > +The new cgroup controller would:
> > +
> > +* Allow setting per-cgroup limits on the total size of buffers charged=
 to it.
>
> What is the meaning of the total? (I only have very na=C3=AFve
> understanding of the device buffers.)

So "total" is used twice here in two different contexts.
The first one is the global "GPU" cgroup context. As in any buffer
that any exporter claims is a GPU buffer, regardless of where/how it
is allocated. So this refers to the sum of all gpu buffers of any
type/source. An exporter contributes to this total by registering a
corresponding gpucg_device and making charges against that device when
it exports.
The second one is in a per device context. This allows us to make a
distinction between different types of GPU memory based on who
exported the buffer. A single process can make use of several
different types of dma buffers (for example cached and uncached
versions of the same type of memory), and it would be useful to have
different limits for each. These are distinguished by the device name
string chosen when the gpucg_device is first registered.

>
> Is it like a) there's global pool of memory that is partitioned among
> individual devices or b) each device has its own specific type of memory
> and adding across two devices is adding apples and oranges or c) there
> can be various devices both of a) and b) type?

So I guess the most correct answer to this question is c.


>
> (Apologies not replying to previous versions and possibly missing
> anything.)
>
> Thanks,
> Michal
>

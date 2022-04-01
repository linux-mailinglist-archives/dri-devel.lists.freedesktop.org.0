Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 624B24EFA0A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 20:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5984A10E03A;
	Fri,  1 Apr 2022 18:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5C410E2ED
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:41:50 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id o10so7674299ejd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 11:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DLtOWenxXCw5vQfabcGIJp+Je2gVQjc6VzKW0XdhyiQ=;
 b=h+rLLWbMQ/iHnS5/pj19fhLvsaEM9Wtdy1qxj2U1tvLPMxqJCjQosFe2F24w4FuEik
 zSrjnDN8RVUqsGTehE0RLFU9iAnAgsZLy6+HaVFpgiQgyaH0bi2nNoUnW/PN++7erDWp
 RX2laVeByhssITiwvlf5JqxR9o7iIybqO73rq6iDBg0II0FI27oeey/L41eoch8FqdX9
 HSLjysJJ9QsP1Keic9p/q3hcmxjndegS2Td9/sQ/qsgWCFS7CVf9el3ursRzkfzAihRs
 Haf70E3SoFpNKPytMrE2H1AsOY13tYTorkjDKu54Gzzinf56UPzglOwHHVZBMjHJCiR4
 t3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DLtOWenxXCw5vQfabcGIJp+Je2gVQjc6VzKW0XdhyiQ=;
 b=B2Dl9X8wpiCaAgSGv3wbEMT6L+6b8ZqClMsdAplEqAY1vHGv/zwqOxWsB3ttuv8N6A
 7HVorlDqweThDpEqSMbJGhwMDmlPgkpkuqLuhLgMtXQw1Lz4WJPE40qqeaUMK1nSN1Ek
 g4fmO/noWvWfLOEFmDbmM4wAvQLbpYykiFqZmmmLy7N1tpAexR8yB5eS3Sau5+eo/xka
 T6Zq/He5xTMU7UCjTLGUr8KCDiE578ACvZp7cMJ7TACUEV9gKHzysneLxcGmNJjiu3cp
 TmJixmoqgp/LJn2VL9IWp5QYHjWBfSN+ITJruFRzB8/SH9tYKbD142vHS5SMBCAFTWK8
 yq6g==
X-Gm-Message-State: AOAM530Giwm6dM5ZDHuP+WA5DKphVjAwQiiHAlF+fkyrWEgR+QnYsUue
 Q4++rK5lWCjCRJgmuR2TS1YWRNFRPPckqo/1nrc7RA==
X-Google-Smtp-Source: ABdhPJwrYPj1kC3SIVIUHr/U2Akla60gayN+BoFrbJkPw1P4im/SamWlkUSDfJabqc8psCgCaTuKJc519X3Csg6+YUY=
X-Received: by 2002:a17:907:3eaa:b0:6df:b058:96a with SMTP id
 hs42-20020a1709073eaa00b006dfb058096amr1028056ejc.368.1648838508127; Fri, 01
 Apr 2022 11:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-6-tjmercier@google.com>
 <20220329152142.GA15794@blackbody.suse.cz>
In-Reply-To: <20220329152142.GA15794@blackbody.suse.cz>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 1 Apr 2022 11:41:36 -0700
Message-ID: <CABdmKX2874NdYCBzpKLnqWhZQDkC2wKz4ZL_aFNqrec6iAutpQ@mail.gmail.com>
Subject: Re: [RFC v4 5/8] dmabuf: Add gpu cgroup charge transfer function
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
 Todd Kjos <tkjos@android.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linaro-mm-sig@lists.linaro.org, Tejun Heo <tj@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 8:21 AM Michal Koutn=C3=BD <mkoutny@suse.com> wrote=
:
>
> Hi.
>
> On Mon, Mar 28, 2022 at 03:59:44AM +0000, "T.J. Mercier" <tjmercier@googl=
e.com> wrote:
> > From: Hridya Valsaraju <hridya@google.com>
> >
> > The dma_buf_charge_transfer function provides a way for processes to
>
> (s/dma_bug_charge_transfer/dma_bug_transfer_charge/)
>
Doh! Thanks.

> > transfer charge of a buffer to a different process. This is essential
> > for the cases where a central allocator process does allocations for
> > various subsystems, hands over the fd to the client who requested the
> > memory and drops all references to the allocated memory.
>
> I understood from [1] some buffers are backed by regular RAM. How are
> these charges going to be transferred (if so)?
>
This link doesn't work for me, but I think you're referring to the
discussion about your "RAM_backed_buffers" comment from March 23rd. I
wanted to do a simple test to confirm my own understanding here, but
that got delayed due to some problems on my end. Anyway the test I did
goes like this: enable memcg and gpu cgoups tracking and run a process
that allocates 100MiB of dmabufs. Observe memcg and gpu accounting
values before and after the allocation.

Before
# cat memory.current gpu.memory.current
14909440
system 0

<Test program does the allocation of 100MiB of dmabufs>

After
# cat memory.current gpu.memory.current
48025600
system 104857600

So the memcg value increases by about 30 MiB while the gpu values
increases by 100 MiB. This is with kmem enabled, and the /proc/maps
file for this process indicates that the majority of that 30 MiB is
kernel memory. I think this result shows that neither the kernel nor
process memory overlap with the gpu cgroup tracking of these
allocations. So despite the fact that these buffers are in main
memory, they are allocated in a way that does not result in memcg
attribution. (It looks to me like __GFP_ACCOUNT is not set for these.)

>
> Thanks,
> Michal
>
> [1]
> https://lore.kernel.org/r/CABdmKX2NSAKMC6rReMYfo2SSVNxEXcS466hk3qF6YFt-j-=
+_NQ@mail.gmail.com

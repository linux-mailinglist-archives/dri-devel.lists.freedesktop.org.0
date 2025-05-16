Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D480CABA309
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 20:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFE910EB6F;
	Fri, 16 May 2025 18:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Jq3cRpKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F37610EB6F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 18:37:38 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-443d4bff5dfso975e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 11:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747420657; x=1748025457;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Ry0OoNS1HfAuyBqppCjMr/xQteIVXdqvCv1soIeng0=;
 b=Jq3cRpKq/NT8t+E2H3SOTvcZ0dCSDKqN2ZiiveqMwmu20z4+SECNJdzLuY00UmqBAM
 mImv8QpYT5abIZtW5EDgPhyYKxI8XIXkWu+A5lHX7n+HG9tj0adsKb5XxS+tZOEaR4c6
 cultan3RwWvYh2NF3As0X84X3JnyoO81ZQyMQtptuIByXpagv30LvpHbsTecctYq6Zxw
 77ncKABxQqfpmSbaMgqjHJBPdWnFZ2CEVBs6UyQui/KSoZAlpXoGZ+1+EHMB1F4MSTZx
 ZsYPAuW4zOcTJKgZByewwqwJ9Z2b1w2v2nXXO+JQNN9jYy4Gzsbc7mUn0SZKj3j9+6TI
 MPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747420657; x=1748025457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Ry0OoNS1HfAuyBqppCjMr/xQteIVXdqvCv1soIeng0=;
 b=OrsUKYzOG3AJqubSyRY/egLwPi8+GMTPFKjtZDTwMwVBvTBiDd2JXcjumFdqKJGVYO
 n0jnnTHqtdDKGHRf24IUPaF40H7gMRp1LMINN1WcqU+pUGaIoTTC6hQLw19kQ7Hbx+Pj
 5dqP1JitW2xQjMQuTQucH1OOsTAoy3ic9JoOkX23tFmAB84tllC8hFpzUpqZn9hI14oE
 gc4SqudM5NDhYFNoXSk/MgxLf9fK9L/NIXRXAk2WGWlFcNxnKAIUdik/25u8sm/qI6VT
 NtOX4ybDDHJBYOWB42faWImdcOpORsvo1eLrGC7QopZWLGNdBMStQfEc0xzwN6fayZtx
 QJng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvxRNcV7lcxwYQN4Lk41zNDVcB7tkWLwGSQlJriPaD1lZ1O8fhVYvs5GGxdt1GAegTrZGO45yjOfA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSaZVmgc5XgvhVGD6oeBRiDYmrhAIwZHDPR+k0mPR1if3UG8ry
 oXsNImlZnpOuMIrkaKpyMpNr5E3Yk6dMpJChTvjAYjmS/2jvyfL3+ilxwT8qWRM/0ZxgFWDADL4
 sJ5Fl6riSW6Yrbl7+TU2md0SF2wdbp5468o3p6Pys
X-Gm-Gg: ASbGncu+0SMIwsipxmmr0zy6/johICE77uuiyGCMlSRIZUYt2/pq7ojIeGZwNfBcn7g
 fiRsBYQ73HsIzCmRMg0i5h5ga0slSwJHpTpnI2NtDMniZ9xuzixlJhfzjIgZIJCVFB9aK0IuWeX
 eBrppXpo848w/vaCtopoMuYnXUepzZLRU=
X-Google-Smtp-Source: AGHT+IFlJwYSklgxEvZl8Ke3yMdeH7Aynfa6I4TzkjA+ku62ilt/KyiolYrem1WwEweVEMjnl2UEtaZa6LgR8VQKh+4=
X-Received: by 2002:a05:600c:2e49:b0:439:961d:fc7d with SMTP id
 5b1f17b1804b1-443ae3dbdfdmr86285e9.6.1747420656773; Fri, 16 May 2025 11:37:36
 -0700 (PDT)
MIME-Version: 1.0
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
 <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com>
 <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
 <a3f57102bc6e4588bc7659485feadbc1@honor.com>
 <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
In-Reply-To: <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 16 May 2025 11:37:24 -0700
X-Gm-Features: AX0GCFtOts9XRJe0V3KGcBdQUf6jVo13nhHDmbXLMWQDLR6a1LqvOs4ZgU-TPRo
Message-ID: <CABdmKX30c_5N34FYMre6Qx5LLLWicsi_XdUdu0QtsOmQ=RcYxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: wangtao <tao.wangtao@honor.com>, 
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>, 
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "jstultz@google.com" <jstultz@google.com>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "wangbintian(BintianWang)" <bintian.wang@honor.com>,
 yipengxiang <yipengxiang@honor.com>, 
 liulu 00013167 <liulu.liu@honor.com>, hanfeng 00012985 <feng.han@honor.com>
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

On Fri, May 16, 2025 at 1:36=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/16/25 09:40, wangtao wrote:
> >
> >
> >> -----Original Message-----
> >> From: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Sent: Thursday, May 15, 2025 10:26 PM
> >> To: wangtao <tao.wangtao@honor.com>; sumit.semwal@linaro.org;
> >> benjamin.gaignard@collabora.com; Brian.Starkey@arm.com;
> >> jstultz@google.com; tjmercier@google.com
> >> Cc: linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org; lina=
ro-
> >> mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org;
> >> wangbintian(BintianWang) <bintian.wang@honor.com>; yipengxiang
> >> <yipengxiang@honor.com>; liulu 00013167 <liulu.liu@honor.com>; hanfeng
> >> 00012985 <feng.han@honor.com>
> >> Subject: Re: [PATCH 2/2] dmabuf/heaps: implement
> >> DMA_BUF_IOCTL_RW_FILE for system_heap
> >>
> >> On 5/15/25 16:03, wangtao wrote:
> >>> [wangtao] My Test Configuration (CPU 1GHz, 5-test average):
> >>> Allocation: 32x32MB buffer creation
> >>> - dmabuf 53ms vs. udmabuf 694ms (10X slower)
> >>> - Note: shmem shows excessive allocation time
> >>
> >> Yeah, that is something already noted by others as well. But that is
> >> orthogonal.
> >>
> >>>
> >>> Read 1024MB File:
> >>> - dmabuf direct 326ms vs. udmabuf direct 461ms (40% slower)
> >>> - Note: pin_user_pages_fast consumes majority CPU cycles
> >>>
> >>> Key function call timing: See details below.
> >>
> >> Those aren't valid, you are comparing different functionalities here.
> >>
> >> Please try using udmabuf with sendfile() as confirmed to be working by=
 T.J.
> > [wangtao] Using buffer IO with dmabuf file read/write requires one memo=
ry copy.
> > Direct IO removes this copy to enable zero-copy. The sendfile system ca=
ll
> > reduces memory copies from two (read/write) to one. However, with udmab=
uf,
> > sendfile still keeps at least one copy, failing zero-copy.
>
>
> Then please work on fixing this.
>
> Regards,
> Christian.
>
>
> >
> > If udmabuf sendfile uses buffer IO (file page cache), read latency matc=
hes
> > dmabuf buffer read, but allocation time is much longer.
> > With Direct IO, the default 16-page pipe size makes it slower than buff=
er IO.
> >
> > Test data shows:
> > udmabuf direct read is much faster than udmabuf sendfile.
> > dmabuf direct read outperforms udmabuf direct read by a large margin.
> >
> > Issue: After udmabuf is mapped via map_dma_buf, apps using memfd or
> > udmabuf for Direct IO might cause errors, but there are no safeguards t=
o
> > prevent this.
> >
> > Allocate 32x32MB buffer and read 1024 MB file Test:
> > Metric                 | alloc (ms) | read (ms) | total (ms)
> > -----------------------|------------|-----------|-----------
> > udmabuf buffer read    | 539        | 2017      | 2555
> > udmabuf direct read    | 522        | 658       | 1179

I can't reproduce the part where udmabuf direct reads are faster than
buffered reads. That's the opposite of what I'd expect. Something
seems wrong with those buffered reads.

> > udmabuf buffer sendfile| 505        | 1040      | 1546
> > udmabuf direct sendfile| 510        | 2269      | 2780

I can reproduce the 3.5x slower udambuf direct sendfile compared to
udmabuf direct read. It's a pretty disappointing result, so it seems
like something could be improved there.

1G from ext4 on 6.12.17 | read/sendfile (ms)
------------------------|-------------------
udmabuf buffer read     | 351
udmabuf direct read     | 540
udmabuf buffer sendfile | 255
udmabuf direct sendfile | 1990


> > dmabuf buffer read     | 51         | 1068      | 1118
> > dmabuf direct read     | 52         | 297       | 349
> >
> > udmabuf sendfile test steps:
> > 1. Open data file(1024MB), get back_fd
> > 2. Create memfd(32MB) # Loop steps 2-6
> > 3. Allocate udmabuf with memfd
> > 4. Call sendfile(memfd, back_fd)
> > 5. Close memfd after sendfile
> > 6. Close udmabuf
> > 7. Close back_fd
> >
> >>
> >> Regards,
> >> Christian.
> >
>

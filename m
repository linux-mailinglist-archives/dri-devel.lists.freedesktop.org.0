Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E0550FBA7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 13:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A71F10EAD8;
	Tue, 26 Apr 2022 11:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 759 seconds by postgrey-1.36 at gabe;
 Tue, 26 Apr 2022 11:03:49 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81D510E818
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 11:03:49 +0000 (UTC)
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N5W0q-1nxz9d40L4-0170IP for <dri-devel@lists.freedesktop.org>; Tue, 26
 Apr 2022 12:51:07 +0200
Received: by mail-wr1-f42.google.com with SMTP id d5so9671501wrb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 03:51:07 -0700 (PDT)
X-Gm-Message-State: AOAM530Gyk3HNlUesUEx+a1TsP6qsx24NzSWoS4CfTk9IHHC9b2MPiiP
 FicUtAiwcln9E5PvJCU5KDq7hrO2v+3h2YpCl6g=
X-Google-Smtp-Source: ABdhPJwv3pFB8WncbOOxlmqz6E+LrLV4NkQu/Q5kzsoMl03tzrGAbxuUPuNyuSoi1V3F1hRSCNe/pbMUxDHw00bd99I=
X-Received: by 2002:a5d:64a3:0:b0:20a:7931:5b84 with SMTP id
 m3-20020a5d64a3000000b0020a79315b84mr18372018wrp.407.1650970267164; Tue, 26
 Apr 2022 03:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <20220426060808.78225-5-cai.huoqing@linux.dev>
 <618a4f53-0998-1e6b-e32b-8bf2d3057cec@amd.com>
In-Reply-To: <618a4f53-0998-1e6b-e32b-8bf2d3057cec@amd.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 26 Apr 2022 12:50:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2w1t7Sk897u0ndD66Lwp5a4DuOqqQLN4yHSg=JmrpOHQ@mail.gmail.com>
Message-ID: <CAK8P3a2w1t7Sk897u0ndD66Lwp5a4DuOqqQLN4yHSg=JmrpOHQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v2 4/4] drm/nvdla/uapi: Add UAPI of
 NVDLA driver
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ewtDOTkFREGy3Sl3gtvHlzEn6Mp8IGT7/2580Q6DPiPvH2PRJ19
 9ZHFWRUzZ1fOJscM9gwVxYYCLrqDtAj+7nfYeC2eRqwpum+kyASW73j9BJir9QZsLXWKYhJ
 7gLi+fSCkwYTf/ddXMKsXJ5VaRHS/BUBa7BWNmQrRGjq/tAoOGo2MDCs2o3ZqFziSS8hPWa
 wNBRT7h3N75rhQFIKVMuA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T3YZI96juQ8=:6KC1rqARb7gcHFnQ4S0s5b
 Qrg5D9SnpHBfXAHPqWNOm5S7DHm73masV0LW9khEx8BV/IH/TkHQkH8tsz5+tIHq5uFhyNXob
 IvqHBLDV7UBrgs6A42G0bShHXiTyUMnLxlpH9broqwCrKLmDACUg5FIA50wvaqu7F3dILyG/9
 8VYvXfwl6JiLUMgsS9vXBCqrNHvxq3DEZsWI6HnC2/v8anzEPqpcokS3CIn++wPlSgi1MMHJF
 OaApGw0TVQKhrqkC0fvvRxqD/EnuHbOiGd+sRmnBzd5xXV5HQvpuPeLzIzEnY6nof6qPgwvGg
 Xz7Ecn+RE1SccvoLGOqelbdjwwXvuy15XXSkikUsCLybwDhRaiXTXx8C409cFTBwBhAvHDoOe
 Rj74K8AgXdzvC3KYmG3xeLVoywk0PNLXg8pZTQ6fISYhIGCRbWc7N03tYc0aENTT7zRmR+eOf
 hSQqsySyLD1qja8KIwDmEGh4Av389+ILBS/6qQWQe35MRoE3b0G6KwmDv2KyeJFxhcIukEhoP
 XAqg8jqbsUekfVCU9M5GJ15v7KMj75JAIoBPSQuBH4eICfGgQiKgCKMK7SV+LrYPncd2QmHlV
 BiPm87N5Gtzhwa7W8vNz8u1fCMxlrpQ9b2UQSe3KWhYPs1QozRIuO9EmIOXIEH8OvEhRwHEjb
 Y3AIBAkpCMYgp1+/3F7Mu06un37iEQ+xcV0JeVA/4FTBR70C9H5w2M+EIgurxjwsJQ+7/+Kpj
 If/e4oRjCfapsBrGXcoZxASwtkIAP3MD6Mbin2vh1/1DSaCsVcwaCxZLNsKnfc9tWZTD5cpbG
 0TKbQmIBXv6e9GmLCStHO89S587J7Of58Yi6A+1umzb7yj0HtY=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linaro-mm-sig@lists.linaro.org, Cai Huoqing <cai.huoqing@linux.dev>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 8:31 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 26.04.22 um 08:08 schrieb Cai Huoqing:
> > The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> > which is integrated into NVIDIA Jetson AGX Xavier,
> > so add UAPI of this driver.
> >
> > Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>

I saw the reply but no the original mail, so I'll comment here.

> > +
> > +#if !defined(__KERNEL__)
> > +#define __user
> > +#endif

This is done in the 'make headers_install' step, no need to define it
separately.

> > +#define NVDLA_NO_TIMEOUT    (0xffffffff)
> > +     __u32 timeout;
>
> What format does that timeout value have?
>
> In general it is best practice to have absolute 64bit nanosecond
> timeouts (to be used with ktime inside the kernel) so that restarting
> interrupted IOCTLs works smooth.

When using absolute values, one also needs to decide whether this should be
realtime, monotonic or boottime and document the decision.


> > + * struct nvdla_submit_args structure for task submit
> > + *
> > + * @tasks            pointer to array of struct nvdla_ioctl_submit_tas=
k
> > + * @num_tasks                number of entries in tasks
> > + * @flags            flags for task submit, no flags defined yet
> > + * @version          version of task structure
> > + *
> > + */
> > +struct nvdla_submit_args {
> > +     __u64 tasks;
> > +     __u16 num_tasks;
> > +#define NVDLA_MAX_TASKS_PER_SUBMIT   24
> > +#define NVDLA_SUBMIT_FLAGS_ATOMIC    (1 << 0)
>
> Well that "no flags defined yet" from the comment above is probably
> outdated :)

> > +     __u16 flags;
> > +     __u32 version;
> > +};

Versioned interfaces are usually a bad idea. If you introduce an ioctl comm=
and,
it should generally keep working. If you ever need to change the interface,=
 just
use a new command number for the new version.

> > +/**
> > + * struct nvdla_gem_create_args for allocating DMA buffer through GEM
> > + *
> > + * @handle           handle updated by kernel after allocation
> > + * @flags            implementation specific flags
> > + * @size             size of buffer to allocate
> > + */
> > +struct nvdla_gem_create_args {
> > +     __u32 handle;
> > +     __u32 flags;
> > +     __u64 size;
> > +};
> > +
> > +/**
> > + * struct nvdla_gem_map_offset_args for mapping DMA buffer
> > + *
> > + * @handle           handle of the buffer
> > + * @reserved         reserved for padding
> > + * @offset           offset updated by kernel after mapping
> > + */
> > +struct nvdla_gem_map_offset_args {
> > +     __u32 handle;
> > +     __u32 reserved;
> > +     __u64 offset;
> > +};
> > +
> > +#define DRM_NVDLA_SUBMIT             0x00
> > +#define DRM_NVDLA_GEM_CREATE 0x01
> > +#define DRM_NVDLA_GEM_MMAP           0x02

Is this an actual mmap() call, or something that needs to be done before th=
e
mmap()? Is the 'handle' a file descriptor or some internal number?

      Arnd

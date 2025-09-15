Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AF3B57E5B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0535710E4C8;
	Mon, 15 Sep 2025 14:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PJgoLG9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1165210E4C8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:05:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE782419E4;
 Mon, 15 Sep 2025 14:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8C5C4CEF1;
 Mon, 15 Sep 2025 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757945134;
 bh=GGWTXMnsvErJb2h3pKbkZRJqvllX1YeT8+dWpSMY+/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PJgoLG9YCmgt/nfsqCliDQBcjNMtYABcybsaMDTjh1bl0ymbH+apjITS/WVMSd6H2
 FCgmQMGvGYGol8RvvSRn1LlT9ZY25PrmEzQP2JGgm01OAGhRp0si+U79SmkWDvGjqe
 rlSHNu9d5JHHeV4bpGBBzPcVP4r9OUQQ6JJk9LQZUxQQ6nuVA9Ty3Fq3j4rbPPvOD0
 AhjaEG2rrSs5t/GbahnkGV5qFCyER11d2F9HXc/ZICObO5842j0Osm7GpRL+otdRvP
 csfLk4s5J75pR85kMulqQ+uYAMDoPoHO1g0ojJ6fEOcs08cO6M2eUfp9FH9uNpQkvs
 j+IfO+Wrica8w==
Date: Mon, 15 Sep 2025 09:05:31 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
 Sumit Garg <sumit.garg@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuldeep Singh <quic_kuldsing@quicinc.com>, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v12 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Message-ID: <mir6lhkj456ra3i6w7def4rrtzw663f66l66cz4s3gxxvueeqk@ils2hjklbp4y>
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
 <CAHUa44Fow6BhkdTki=rt2psOC=dq99cRgwXsVagmQU7fttXyCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44Fow6BhkdTki=rt2psOC=dq99cRgwXsVagmQU7fttXyCw@mail.gmail.com>
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

On Fri, Sep 12, 2025 at 10:21:55AM +0200, Jens Wiklander wrote:
> Hi,
> 
> On Fri, Sep 12, 2025 at 6:07 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >
> > This patch series introduces a Trusted Execution Environment (TEE)
> > driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> > and services to run securely. It uses an object-based interface, where
> > each service is an object with sets of operations. Clients can invoke
> > these operations on objects, which can generate results, including other
> > objects. For example, an object can load a TA and return another object
> > that represents the loaded TA, allowing access to its services.
> >
> [snip]
> 
> I'm OK with the TEE patches, Sumit and I have reviewed them.
> 

Happy to hear that.

> There were some minor conflicts with other patches I have in the pipe
> for this merge window, so this patchset is on top of what I have to
> avoid merge conflicts.
> 
> However, the firmware patches are for code maintained by Björn.
> Björn, how would you like to do this? Can I take them via my tree, or
> what do you suggest?
> 

Please pull:

https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-2-17f07a942b8d@oss.qualcomm.com

Regards,
Bjorn

> It's urgent to get this patchset into linux-next if it's to make it
> for the coming merge window. Ideally, I'd like to send my pull request
> to arm-soc during this week.
> 
> Cheers,
> Jens
> 
> >
> > ---
> > Amirreza Zarrabi (11):
> >       firmware: qcom: tzmem: export shm_bridge create/delete
> >       firmware: qcom: scm: add support for object invocation
> >       tee: allow a driver to allocate a tee_device without a pool
> >       tee: add close_context to TEE driver operation
> >       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
> >       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
> >       tee: increase TEE_MAX_ARG_SIZE to 4096
> >       tee: add Qualcomm TEE driver
> >       tee: qcom: add primordial object
> >       tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
> >       Documentation: tee: Add Qualcomm TEE driver
> >
> >  Documentation/tee/index.rst              |   1 +
> >  Documentation/tee/qtee.rst               |  96 ++++
> >  MAINTAINERS                              |   7 +
> >  drivers/firmware/qcom/qcom_scm.c         | 119 ++++
> >  drivers/firmware/qcom/qcom_scm.h         |   7 +
> >  drivers/firmware/qcom/qcom_tzmem.c       |  63 ++-
> >  drivers/tee/Kconfig                      |   1 +
> >  drivers/tee/Makefile                     |   1 +
> >  drivers/tee/qcomtee/Kconfig              |  12 +
> >  drivers/tee/qcomtee/Makefile             |   9 +
> >  drivers/tee/qcomtee/async.c              | 182 ++++++
> >  drivers/tee/qcomtee/call.c               | 820 +++++++++++++++++++++++++++
> >  drivers/tee/qcomtee/core.c               | 915 +++++++++++++++++++++++++++++++
> >  drivers/tee/qcomtee/mem_obj.c            | 169 ++++++
> >  drivers/tee/qcomtee/primordial_obj.c     | 113 ++++
> >  drivers/tee/qcomtee/qcomtee.h            | 185 +++++++
> >  drivers/tee/qcomtee/qcomtee_msg.h        | 304 ++++++++++
> >  drivers/tee/qcomtee/qcomtee_object.h     | 316 +++++++++++
> >  drivers/tee/qcomtee/shm.c                | 150 +++++
> >  drivers/tee/qcomtee/user_obj.c           | 692 +++++++++++++++++++++++
> >  drivers/tee/tee_core.c                   | 127 ++++-
> >  drivers/tee/tee_private.h                |   6 -
> >  include/linux/firmware/qcom/qcom_scm.h   |   6 +
> >  include/linux/firmware/qcom/qcom_tzmem.h |  15 +
> >  include/linux/tee_core.h                 |  54 +-
> >  include/linux/tee_drv.h                  |  12 +
> >  include/uapi/linux/tee.h                 |  56 +-
> >  27 files changed, 4410 insertions(+), 28 deletions(-)
> > ---
> > base-commit: 8b8aefa5a5c7d4a65883e5653cf12f94c0b68dbf
> > change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
> >
> > Best regards,
> > --
> > Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >

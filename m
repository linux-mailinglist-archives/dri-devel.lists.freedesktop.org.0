Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6CEB4A27B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 08:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D5D10E62D;
	Tue,  9 Sep 2025 06:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X4pYO2h7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0858D10E62D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 06:41:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 19952601A6;
 Tue,  9 Sep 2025 06:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6ECC4CEF4;
 Tue,  9 Sep 2025 06:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757400095;
 bh=PUJF7OqUw+L6xZT6DVeW5n5B5oZ+SC/DPgAHqo4GG2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X4pYO2h7uPOpyJZ+6IyVpxH4zCxgmlh6OXiqOVYPppHz9JpC8vzRYHebdOOlw7HCS
 hed3yBhz/pthG6YA3Dbsxdvb2tt1Ocr/DAZf52Uqn6TwCbjTTUCOfFV/aYlirIxsQq
 OgxIs05HphnTIE9GIYpuAwaPt0nAeL6O6OksE2l5iRBMrJCqsQkeOv+wCVedvfKRTf
 VZJV2wKCX6gmNpNO4Ya/j4gaF3zxZ3LHRcnenzJXtH9UFlE7Lo9r48ozuBCkauSEdc
 3aM/lysoTrEmIVTC6Pd4hYd72n2uQNTu+tTMcbFNo3apOB/msBPU6ubxfJ6PT4Plr0
 EEZsFBfBDv7VA==
Date: Tue, 9 Sep 2025 12:11:13 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Message-ID: <aL_MCagNVIDXW0wp@sumit-X1>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <aL-uOEByKImuvIYF@sumit-X1>
 <CAHUa44FQVQ1AE3nSjCjcB07XGowYPN6srwG2dknT76qqdtEV+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44FQVQ1AE3nSjCjcB07XGowYPN6srwG2dknT76qqdtEV+g@mail.gmail.com>
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

On Tue, Sep 09, 2025 at 08:16:48AM +0200, Jens Wiklander wrote:
> On Tue, Sep 9, 2025 at 6:34 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Tue, Aug 12, 2025 at 05:35:29PM -0700, Amirreza Zarrabi wrote:
> > > This patch series introduces a Trusted Execution Environment (TEE)
> > > driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> > > and services to run securely. It uses an object-based interface, where
> > > each service is an object with sets of operations. Clients can invoke
> > > these operations on objects, which can generate results, including other
> > > objects. For example, an object can load a TA and return another object
> > > that represents the loaded TA, allowing access to its services.
> > >
> > > Kernel and userspace services are also available to QTEE through a
> > > similar approach. QTEE makes callback requests that are converted into
> > > object invocations. These objects can represent services within the
> > > kernel or userspace process.
> > >
> > > Note: This patch series focuses on QTEE objects and userspace services.
> > >
> > > Linux already provides a TEE subsystem, which is described in [1]. The
> > > tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
> > > can be used by userspace to talk to a TEE backend driver. We extend the
> > > Linux TEE subsystem to understand object parameters and an ioctl call so
> > > client can invoke objects in QTEE:
> > >
> > >   - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
> > >   - TEE_IOC_OBJECT_INVOKE
> > >
> > > The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
> > > used for invoking services in the userspace process by QTEE.
> > >
> > > The TEE backend driver uses the QTEE Transport Message to communicate
> > > with QTEE. Interactions through the object INVOKE interface are
> > > translated into QTEE messages. Likewise, object invocations from QTEE
> > > for userspace objects are converted into SEND/RECV ioctl calls to
> > > supplicants.
> > >
> > > The details of QTEE Transport Message to communicate with QTEE is
> > > available in [PATCH 12/12] Documentation: tee: Add Qualcomm TEE driver.
> > >
> > > You can run basic tests with following steps:
> > > git clone https://github.com/quic/quic-teec.git
> > > cd quic-teec
> > > mkdir build
> > > cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON
> > >
> > > https://github.com/quic/quic-teec/blob/main/README.md lists dependencies
> > > needed to build the above.
> > >
> > > More comprehensive tests are availabe at
> > > https://github.com/qualcomm/minkipc.
> > >
> > > root@qcom-armv8a:~# qtee_supplicant &
> > > root@qcom-armv8a:~# qtee_supplicant: process entry PPID = 378
> > > Total listener services to start = 4
> > > Opening CRequestTABuffer_open
> > > Path /data/
> > > register_service ::Opening CRegisterTABufCBO_UID
> > > Calling TAbufCBO Register
> > > QTEE_SUPPLICANT RUNNING
> > >
> > > root@qcom-armv8a:~# smcinvoke_client -c /data 1
> > > Run callback obj test...
> > > Load /data/tzecotestapp.mbn, size 52192, buf 0x1e44ba0.
> > > System Time: 2024-02-27 17:26:31
> > > PASSED - Callback tests with Buffer inputs.
> > > PASSED - Callback tests with Remote and Callback object inputs.
> > > PASSED - Callback tests with Memory Object inputs.
> > > TEST PASSED!
> > > root@qcom-armv8a:~#
> > > root@qcom-armv8a:~# smcinvoke_client -m /data 1
> > > Run memory obj test...
> > > Load /data/tzecotestapp.mbn, size 52192, buf 0x26cafba0.
> > > System Time: 2024-02-27 17:26:39
> > > PASSED - Single Memory Object access Test.
> > > PASSED - Two Memory Object access Test.
> > > TEST PASSED!
> > >
> > > This series has been tested for QTEE object invocations, including
> > > loading a TA, requesting services from the TA, memory sharing, and
> > > handling callback requests to a supplicant.
> > >
> > > Tested platforms: sm8650-mtp, sm8550-qrd, sm8650-qrd, sm8650-hdk
> > >
> > > [1] https://www.kernel.org/doc/Documentation/tee.txt
> > >
> > > Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> > >
> >
> > At this point, I think this series is ready to be applied to linux-next.
> 
> There are still some warnings in "[PATCH v9 06/11] firmware: qcom:
> scm: add support for object invocation"

Agree, following should be a trivial fix but I wanted to make sure that
we don't miss v6.18 merge window.

However, while trying to apply on you next branch [1]. I see some conflicts
arising due to the protected DMAbuf series being already applied.

Amir,

Can you rebase this series on top of Jens next [1] branch? Also, apply
the following diff to fix the bot warning.

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9753496aace0..bda0076cfbdf 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2204,7 +2204,7 @@ static void qcom_scm_qtee_init(struct qcom_scm *scm)
        qtee_dev = platform_device_register_data(scm->dev, "qcomtee",
                                                 PLATFORM_DEVID_NONE, NULL, 0);
        if (IS_ERR(qtee_dev)) {
-               dev_err(scm->dev, "qcomtee: register failed: %d\n",
+               dev_err(scm->dev, "qcomtee: register failed: %ld\n",
                        PTR_ERR(qtee_dev));
                return;
        }

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git/log/?h=next 

-Sumit

> 
> /Jens
> 
> >
> > > Changes in v7:
> > > - Updated copyrights.
> > > - Updated Acked-by: tags.
> > > - Fixed kernel bot errors.
> > > - Link to v6:
> > >   https://lore.kernel.org/r/20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com
> > >
> > > Changes in v6:
> > > - Relocate QTEE version into the driver's main service structure.
> > > - Simplfies qcomtee_objref_to_arg() and qcomtee_objref_from_arg().
> > > - Enhanced the return logic of qcomtee_object_do_invoke_internal().
> > > - Improve comments and remove redundant checks.
> > > - Improve helpers in qcomtee_msh.h to use GENMASK() and FIELD_GET().
> > > - updated Tested-by:, Acked-by:, and Reviewed-by: tags
> > > - Link to v5:
> > >   https://lore.kernel.org/r/20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com
> > >
> > > Changes in v5:
> > > - Remove references to kernel services and public APIs.
> > > - Support auto detection for failing devices (e.g., RB1, RB4).
> > > - Add helpers for obtaining client environment and service objects.
> > > - Query the QTEE version and print it.
> > > - Move remaining static variables, including the object table, to struct
> > >   qcomtee.
> > > - Update TEE_MAX_ARG_SIZE to 4096.
> > > - Add a dependancy to QCOM_TZMEM_MODE_SHMBRIDGE in Kconfig
> > > - Reorganize code by removing release.c and qcom_scm.c.
> > > - Add more error messages and improve comments.
> > > - updated Tested-by:, Acked-by:, and Reviewed-by: tags
> > > - Link to v4: https://lore.kernel.org/r/20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com
> > >
> > > Changes in v4:
> > > - Move teedev_ctx_get/put and tee_device_get/put to tee_core.h.
> > > - Rename object to id in struct tee_ioctl_object_invoke_arg.
> > > - Replace spinlock with mutex for qtee_objects_idr.
> > > - Move qcomtee_object_get to qcomtee_user/memobj_param_to_object.
> > > - More code cleanup following the comments.
> > > - Cleanup documentations.
> > > - Update MAINTAINERS file.
> > > - Link to v3: https://lore.kernel.org/r/20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com
> > >
> > > Changes in v3:
> > > - Export shm_bridge create/delete APIs.
> > > - Enable support for QTEE memory objects.
> > > - Update the memory management code to use the TEE subsystem for all
> > >   allocations using the pool.
> > > - Move all driver states into the driver's main service struct.
> > > - Add more documentations.
> > > - Link to v2: https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com
> > >
> > > Changes in v2:
> > > - Clean up commit messages and comments.
> > > - Use better names such as ubuf instead of membuf or QCOMTEE prefix
> > >   instead of QCOM_TEE, or names that are more consistent with other
> > >   TEE-backend drivers such as qcomtee_context_data instead of
> > >   qcom_tee_context.
> > > - Drop the DTS patch and instantiate the device from the scm driver.
> > > - Use a single structure for all driver's internal states.
> > > - Drop srcu primitives and use the existing mutex for synchronization
> > >   between the supplicant and QTEE.
> > > - Directly use tee_context to track the lifetime of qcomtee_context_data.
> > > - Add close_context() to be called when the user closes the tee_context.
> > > - Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com
> > >
> > > Changes in v1:
> > > - It is a complete rewrite to utilize the TEE subsystem.
> > > - Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com
> > >
> > > ---
> > > Amirreza Zarrabi (11):
> > >       tee: allow a driver to allocate a tee_device without a pool
> > >       tee: add close_context to TEE driver operation
> > >       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
> > >       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
> > >       tee: increase TEE_MAX_ARG_SIZE to 4096
> >
> > >       firmware: qcom: scm: add support for object invocation
> > >       firmware: qcom: tzmem: export shm_bridge create/delete
> >
> > Bjorn/Konrad,
> >
> > Since majority of this series belong to TEE subsystem, are you folks
> > fine to ack these patches for Jens to pick them up for next?
> >
> > -Sumit
> >
> > >       tee: add Qualcomm TEE driver
> > >       qcomtee: add primordial object
> > >       qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
> > >       Documentation: tee: Add Qualcomm TEE driver
> >
> >
> >
> > >
> > >  Documentation/tee/index.rst              |   1 +
> > >  Documentation/tee/qtee.rst               |  96 ++++
> > >  MAINTAINERS                              |   7 +
> > >  drivers/firmware/qcom/qcom_scm.c         | 128 +++++
> > >  drivers/firmware/qcom/qcom_scm.h         |   7 +
> > >  drivers/firmware/qcom/qcom_tzmem.c       |  63 ++-
> > >  drivers/tee/Kconfig                      |   1 +
> > >  drivers/tee/Makefile                     |   1 +
> > >  drivers/tee/qcomtee/Kconfig              |  11 +
> > >  drivers/tee/qcomtee/Makefile             |   9 +
> > >  drivers/tee/qcomtee/async.c              | 183 ++++++
> > >  drivers/tee/qcomtee/call.c               | 820 +++++++++++++++++++++++++++
> > >  drivers/tee/qcomtee/core.c               | 920 +++++++++++++++++++++++++++++++
> > >  drivers/tee/qcomtee/mem_obj.c            | 169 ++++++
> > >  drivers/tee/qcomtee/primordial_obj.c     | 116 ++++
> > >  drivers/tee/qcomtee/qcomtee.h            | 185 +++++++
> > >  drivers/tee/qcomtee/qcomtee_msg.h        | 300 ++++++++++
> > >  drivers/tee/qcomtee/qcomtee_object.h     | 316 +++++++++++
> > >  drivers/tee/qcomtee/shm.c                | 150 +++++
> > >  drivers/tee/qcomtee/user_obj.c           | 692 +++++++++++++++++++++++
> > >  drivers/tee/tee_core.c                   | 127 ++++-
> > >  drivers/tee/tee_private.h                |   6 -
> > >  include/linux/firmware/qcom/qcom_scm.h   |   6 +
> > >  include/linux/firmware/qcom/qcom_tzmem.h |  15 +
> > >  include/linux/tee_core.h                 |  54 +-
> > >  include/linux/tee_drv.h                  |  12 +
> > >  include/uapi/linux/tee.h                 |  56 +-
> > >  27 files changed, 4423 insertions(+), 28 deletions(-)
> > > ---
> > > base-commit: 2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
> > > change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
> > >
> > > Best regards,
> > > --
> > > Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> > >
> > >
> 

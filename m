Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D854B50098
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A641810E762;
	Tue,  9 Sep 2025 15:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ioE++mz5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F1010E762
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 15:03:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CA9A44318;
 Tue,  9 Sep 2025 15:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73E4C4CEFA;
 Tue,  9 Sep 2025 15:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757430214;
 bh=7TvrYBicwc1qY4ysRF7W20klhiPgGx5P3bsI+4oFUmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ioE++mz5L8p0NLmlPKMWtvlL96Wdvy1ac0IQDFGRKJz3AsoUYmYma3ssXNZvFKb3u
 VPT+5H6aHvXtLDhuOxMluIXw0CTXtgqPnbMDJfbNJgHuq1dDOiNaCwfRCB8BcczzdN
 2KnQFMoPSkUeCTRC+pbgVJSYDSqPOMq8pRJ7esSBt75/HMtToc67kUoB9mje0Ghmy9
 u1N6zc9dDA3nTDLTjWN0utAM5dgCuvnreOzoy530L+nTrkNcf3IpNgi6qzjo7XvNRj
 GSEzesiKzDafKk/e+9c1cS4mDQyf77eouRngsFm/TUS4Igkyk+9T/QGz8XYRVFVBz1
 gWmD2yiZCJG0A==
Date: Tue, 9 Sep 2025 10:03:31 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
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
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuldeep Singh <quic_kuldsing@quicinc.com>
Subject: Re: [PATCH v9 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Message-ID: <rvz274v27t54iktoa6uds5hyrs5ujkmahdl4o635gkah7cw277@jf4fjp5wb7ci>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
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

On Mon, Sep 01, 2025 at 09:55:47PM -0700, Amirreza Zarrabi wrote:
> This patch series introduces a Trusted Execution Environment (TEE)
> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> and services to run securely. It uses an object-based interface, where
> each service is an object with sets of operations. Clients can invoke
> these operations on objects, which can generate results, including other
> objects. For example, an object can load a TA and return another object
> that represents the loaded TA, allowing access to its services.
> 
> Kernel and userspace services are also available to QTEE through a
> similar approach. QTEE makes callback requests that are converted into
> object invocations. These objects can represent services within the
> kernel or userspace process.
> 
> Note: This patch series focuses on QTEE objects and userspace services.
> 
> Linux already provides a TEE subsystem, which is described in [1]. The
> tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
> can be used by userspace to talk to a TEE backend driver. We extend the
> Linux TEE subsystem to understand object parameters and an ioctl call so
> client can invoke objects in QTEE:
> 
>   - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
>   - TEE_IOC_OBJECT_INVOKE
> 
> The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
> used for invoking services in the userspace process by QTEE.
> 
> The TEE backend driver uses the QTEE Transport Message to communicate
> with QTEE. Interactions through the object INVOKE interface are
> translated into QTEE messages. Likewise, object invocations from QTEE
> for userspace objects are converted into SEND/RECV ioctl calls to
> supplicants.
> 
> The details of QTEE Transport Message to communicate with QTEE is
> available in [PATCH 12/12] Documentation: tee: Add Qualcomm TEE driver.
> 
> You can run basic tests with following steps:
> git clone https://github.com/quic/quic-teec.git
> cd quic-teec
> mkdir build
> cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON
> 
> https://github.com/quic/quic-teec/blob/main/README.md lists dependencies
> needed to build the above.
> 
> More comprehensive tests are availabe at
> https://github.com/qualcomm/minkipc.
> 
> root@qcom-armv8a:~# qtee_supplicant &
> root@qcom-armv8a:~# qtee_supplicant: process entry PPID = 378
> Total listener services to start = 4
> Opening CRequestTABuffer_open
> Path /data/
> register_service ::Opening CRegisterTABufCBO_UID
> Calling TAbufCBO Register
> QTEE_SUPPLICANT RUNNING
>  
> root@qcom-armv8a:~# smcinvoke_client -c /data 1
> Run callback obj test...
> Load /data/tzecotestapp.mbn, size 52192, buf 0x1e44ba0.
> System Time: 2024-02-27 17:26:31
> PASSED - Callback tests with Buffer inputs.
> PASSED - Callback tests with Remote and Callback object inputs.
> PASSED - Callback tests with Memory Object inputs.
> TEST PASSED!
> root@qcom-armv8a:~#
> root@qcom-armv8a:~# smcinvoke_client -m /data 1
> Run memory obj test...
> Load /data/tzecotestapp.mbn, size 52192, buf 0x26cafba0.
> System Time: 2024-02-27 17:26:39
> PASSED - Single Memory Object access Test.
> PASSED - Two Memory Object access Test.
> TEST PASSED!
> 
> This series has been tested for QTEE object invocations, including
> loading a TA, requesting services from the TA, memory sharing, and
> handling callback requests to a supplicant.
> 
> Tested platforms: sm8650-mtp, sm8550-qrd, sm8650-qrd, sm8650-hdk
> 
> [1] https://www.kernel.org/doc/Documentation/tee.txt
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> Changes in v9:
> - Remove unnecessary logging in qcom_scm_probe().
> - Replace the platform_device_alloc()/add() sequence with
>   platform_device_register_data().
> - Fixed sparse warning.
> - Fixed documentation typo.
> - Link to v8:
>   https://lore.kernel.org/r/20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com
> 
> Changes in v8:
> - Check if arguments to qcom_scm_qtee_invoke_smc() and
>   qcom_scm_qtee_callback_response() are NULL.
> - Add CPU_BIG_ENDIAN as a dependency to Kconfig.
> - Fixed kernel bot errors.
> - Link to v7:
>   https://lore.kernel.org/r/20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com
> 
> Changes in v7:
> - Updated copyrights.
> - Updated Acked-by: tags.
> - Fixed kernel bot errors.
> - Link to v6:
>   https://lore.kernel.org/r/20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com
> 
> Changes in v6:
> - Relocate QTEE version into the driver's main service structure.
> - Simplfies qcomtee_objref_to_arg() and qcomtee_objref_from_arg().
> - Enhanced the return logic of qcomtee_object_do_invoke_internal().
> - Improve comments and remove redundant checks.
> - Improve helpers in qcomtee_msh.h to use GENMASK() and FIELD_GET().
> - updated Tested-by:, Acked-by:, and Reviewed-by: tags
> - Link to v5:
>   https://lore.kernel.org/r/20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com
> 
> Changes in v5:
> - Remove references to kernel services and public APIs.
> - Support auto detection for failing devices (e.g., RB1, RB4).
> - Add helpers for obtaining client environment and service objects.
> - Query the QTEE version and print it.
> - Move remaining static variables, including the object table, to struct
>   qcomtee.
> - Update TEE_MAX_ARG_SIZE to 4096.
> - Add a dependancy to QCOM_TZMEM_MODE_SHMBRIDGE in Kconfig
> - Reorganize code by removing release.c and qcom_scm.c.
> - Add more error messages and improve comments.
> - updated Tested-by:, Acked-by:, and Reviewed-by: tags
> - Link to v4: https://lore.kernel.org/r/20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com
> 
> Changes in v4:
> - Move teedev_ctx_get/put and tee_device_get/put to tee_core.h.
> - Rename object to id in struct tee_ioctl_object_invoke_arg.
> - Replace spinlock with mutex for qtee_objects_idr.
> - Move qcomtee_object_get to qcomtee_user/memobj_param_to_object.
> - More code cleanup following the comments.
> - Cleanup documentations.
> - Update MAINTAINERS file.
> - Link to v3: https://lore.kernel.org/r/20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com
> 
> Changes in v3:
> - Export shm_bridge create/delete APIs.
> - Enable support for QTEE memory objects.
> - Update the memory management code to use the TEE subsystem for all
>   allocations using the pool.
> - Move all driver states into the driver's main service struct.
> - Add more documentations.
> - Link to v2: https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com
> 
> Changes in v2:
> - Clean up commit messages and comments.
> - Use better names such as ubuf instead of membuf or QCOMTEE prefix
>   instead of QCOM_TEE, or names that are more consistent with other
>   TEE-backend drivers such as qcomtee_context_data instead of
>   qcom_tee_context.
> - Drop the DTS patch and instantiate the device from the scm driver.
> - Use a single structure for all driver's internal states.
> - Drop srcu primitives and use the existing mutex for synchronization
>   between the supplicant and QTEE.
> - Directly use tee_context to track the lifetime of qcomtee_context_data.
> - Add close_context() to be called when the user closes the tee_context.
> - Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com
> 
> Changes in v1:
> - It is a complete rewrite to utilize the TEE subsystem.
> - Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com
> 
> ---
> Amirreza Zarrabi (11):
>       tee: allow a driver to allocate a tee_device without a pool
>       tee: add close_context to TEE driver operation
>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>       tee: increase TEE_MAX_ARG_SIZE to 4096
>       firmware: qcom: scm: add support for object invocation
>       firmware: qcom: tzmem: export shm_bridge create/delete

These two patches are for code maintained by me, the rest by Jens. So we
will have to dance to get this merged.

Is there are reason why these two are in the middle of the series? Do
they need to come after the first 5 but before the next 3?

Regards,
Bjorn

>       tee: add Qualcomm TEE driver
>       tee: qcom: add primordial object
>       tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
>       Documentation: tee: Add Qualcomm TEE driver
> 
>  Documentation/tee/index.rst              |   1 +
>  Documentation/tee/qtee.rst               |  96 ++++
>  MAINTAINERS                              |   7 +
>  drivers/firmware/qcom/qcom_scm.c         | 124 +++++
>  drivers/firmware/qcom/qcom_scm.h         |   7 +
>  drivers/firmware/qcom/qcom_tzmem.c       |  63 ++-
>  drivers/tee/Kconfig                      |   1 +
>  drivers/tee/Makefile                     |   1 +
>  drivers/tee/qcomtee/Kconfig              |  12 +
>  drivers/tee/qcomtee/Makefile             |   9 +
>  drivers/tee/qcomtee/async.c              | 182 ++++++
>  drivers/tee/qcomtee/call.c               | 820 +++++++++++++++++++++++++++
>  drivers/tee/qcomtee/core.c               | 915 +++++++++++++++++++++++++++++++
>  drivers/tee/qcomtee/mem_obj.c            | 169 ++++++
>  drivers/tee/qcomtee/primordial_obj.c     | 113 ++++
>  drivers/tee/qcomtee/qcomtee.h            | 185 +++++++
>  drivers/tee/qcomtee/qcomtee_msg.h        | 304 ++++++++++
>  drivers/tee/qcomtee/qcomtee_object.h     | 316 +++++++++++
>  drivers/tee/qcomtee/shm.c                | 150 +++++
>  drivers/tee/qcomtee/user_obj.c           | 692 +++++++++++++++++++++++
>  drivers/tee/tee_core.c                   | 127 ++++-
>  drivers/tee/tee_private.h                |   6 -
>  include/linux/firmware/qcom/qcom_scm.h   |   6 +
>  include/linux/firmware/qcom/qcom_tzmem.h |  15 +
>  include/linux/tee_core.h                 |  54 +-
>  include/linux/tee_drv.h                  |  12 +
>  include/uapi/linux/tee.h                 |  56 +-
>  27 files changed, 4415 insertions(+), 28 deletions(-)
> ---
> base-commit: 33bcf93b9a6b028758105680f8b538a31bc563cf
> change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
> 
> Best regards,
> -- 
> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 

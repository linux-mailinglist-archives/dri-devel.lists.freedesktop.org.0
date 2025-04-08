Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7746FA808A3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB24510E21B;
	Tue,  8 Apr 2025 12:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wzt4R5SO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA44D10E21B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 12:47:28 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-2b2b6019a74so2775595fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 05:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744116448; x=1744721248; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9zsV4NSDGfF9NfL6GoAOSh4jtNrxcTH/u03HhqixjCw=;
 b=wzt4R5SOzTVlWEHUe/uSa26vb+8sZCjAixZmbQXr3Iw17PzX5BsnI0AUyNVSS+XlfF
 AceBO78TUBDLE4It4VH/ExprprYOXlv40HdBc9hJPOBIhqOduBtIMYywVsreu81z5bZY
 Th+MbRN0YD6DClGdkRwX/2BoZ2ozpkeaS5GT3MZAxDSfGYtHrw/jgmNWZDWjJcSXcNok
 xcJl8kCJcJzEnYlyS1FdNI6Wh4VfA3qf+E80jrRsdCFSek06qCb85JemTSjrm7PGTR5k
 PliWeueHVhZo931/4wNnxf57pFit/6ts7pp2aFrnx/esAfM7ReTJfKO6jgE+J3sIa1Vg
 vTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744116448; x=1744721248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zsV4NSDGfF9NfL6GoAOSh4jtNrxcTH/u03HhqixjCw=;
 b=HG3Pi7ha/4K1XeHNi00FZ5yc/in5J6SknyCOHAWr9+mzHXWcK3RZiBbgojXvBkjmdZ
 fGUdTnIsqfaH/I/dnEQSD95ksJBqJlGxjNbnNkQ2EUDTB/hHi78AnMqnyaV2lrpk2tOv
 gb3StEj7RmnEAbid9NBAp/HrPUu5BtkGAyyv1tlu80UJsSDqsIBNDzXrG2UJQgjUM4RZ
 WChUEn3t6+lyaRLjdESTlILUQqir6xW+c5ErlmmYvn8U1CQiD08PAOvAa6kc/KIXNllP
 CdWGaiSfB087m/mWPSEIAkZcVDB9nTFjXcXV2yu3aIKcFIgTu6rE1stf9izgRbA+uStX
 X47A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/8IrbmYVMg5OGruxq5JfQ7+02gWWjaxF9ho3QGgEywNWFx+7Tui0GevTAECzWgrIwTZD5UbFmZSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1wiTeohk2XUhDnC1FJCrXxrE0Iv0FaA0nRrlqw6eBVBzTeTU8
 ng2G/d1/5FlWwrMK3Nt6oLcCODnYDS5X4WnnVcF8BuPkBU6gXFxlMUub/yCJU7DY3VkHs1oMfWH
 mBF6k+U+mnpL3u16b5GfRvd8f2VZlNOciQifNVw==
X-Gm-Gg: ASbGncu6vogLPFzFv3cLdP5oojDhKcb7WKFtxPSll/ti391KHrBTWXP8N6/J9vDcmhe
 F1MQ+q7WaHxDO6A0m9ZBm/I3xvvlENz5AYl24brSK8onH/WVYUCZbBwkqO7cnWaQGZ0ycApaLG1
 SWea9eUcDIP9TIeL4jDQQhe6uwOw0=
X-Google-Smtp-Source: AGHT+IGQ+InJjr9vRlHtScfgzWytv6bSiWjP8GM25jgquZnarl2NxfPknn1e644RQLcdKqN4hSXokRVTWoPVKAUVMRI=
X-Received: by 2002:a05:6871:4d16:b0:2cf:bc73:7bbb with SMTP id
 586e51a60fabf-2cfbc744d28mr4481022fac.25.1744116446842; Tue, 08 Apr 2025
 05:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-8-7f457073282d@oss.qualcomm.com>
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-8-7f457073282d@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 8 Apr 2025 14:47:13 +0200
X-Gm-Features: ATxdqUHDeeKFT73TZQO09gxbe_rq4eS8MqGhAN0iJw2OER71cI-c_tIbaFpvxtU
Message-ID: <CAHUa44E7OT-v0Ui_fjWPSN+HL8dm1BLkF3K_GYe3Wp6zpFpN0Q@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] tee: add Qualcomm TEE driver
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org
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

Hi Amirreza,

On Fri, Mar 28, 2025 at 3:48=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Introduce qcomtee_object, which represents an object in both QTEE and
> the kernel. QTEE clients can invoke an instance of qcomtee_object to
> access QTEE services. If this invocation produces a new object in QTEE,
> an instance of qcomtee_object will be returned.
>
> Similarly, QTEE can request services from the kernel by issuing a callbac=
k
> request, which invokes an instance of qcomtee_object in the kernel.
> Any subsystem that exposes a service to QTEE should allocate and initiali=
ze
> an instance of qcomtee_object with a dispatcher callback that is called
> when the object is invoked.
>
> Implement initial support for exporting qcomtee_object to userspace
> and QTEE, enabling the invocation of objects hosted in QTEE and userspace
> through the TEE subsystem.
>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/Kconfig                    |   1 +
>  drivers/tee/Makefile                   |   1 +
>  drivers/tee/qcomtee/Kconfig            |  10 +
>  drivers/tee/qcomtee/Makefile           |   9 +
>  drivers/tee/qcomtee/async.c            | 160 +++++++
>  drivers/tee/qcomtee/call.c             | 753 +++++++++++++++++++++++++++=
++++
>  drivers/tee/qcomtee/core.c             | 801 +++++++++++++++++++++++++++=
++++++
>  drivers/tee/qcomtee/qcom_scm.c         |  38 ++
>  drivers/tee/qcomtee/qcomtee_msg.h      | 239 ++++++++++
>  drivers/tee/qcomtee/qcomtee_private.h  | 222 +++++++++
>  drivers/tee/qcomtee/release.c          |  48 ++
>  drivers/tee/qcomtee/shm.c              | 149 ++++++
>  drivers/tee/qcomtee/user_obj.c         | 710 +++++++++++++++++++++++++++=
++
>  include/linux/firmware/qcom/qcom_tee.h | 302 +++++++++++++
>  include/uapi/linux/tee.h               |   1 +
>  15 files changed, 3444 insertions(+)
>
> diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
> index 61b507c18780..3a995d7f0d74 100644
> --- a/drivers/tee/Kconfig
> +++ b/drivers/tee/Kconfig
> @@ -16,5 +16,6 @@ if TEE
>  source "drivers/tee/optee/Kconfig"
>  source "drivers/tee/amdtee/Kconfig"
>  source "drivers/tee/tstee/Kconfig"
> +source "drivers/tee/qcomtee/Kconfig"
>
>  endif
> diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
> index 5488cba30bd2..74e987f8f7ea 100644
> --- a/drivers/tee/Makefile
> +++ b/drivers/tee/Makefile
> @@ -6,3 +6,4 @@ tee-objs +=3D tee_shm_pool.o
>  obj-$(CONFIG_OPTEE) +=3D optee/
>  obj-$(CONFIG_AMDTEE) +=3D amdtee/
>  obj-$(CONFIG_ARM_TSTEE) +=3D tstee/
> +obj-$(CONFIG_QCOMTEE) +=3D qcomtee/
> diff --git a/drivers/tee/qcomtee/Kconfig b/drivers/tee/qcomtee/Kconfig
> new file mode 100644
> index 000000000000..d180a6d07d33
> --- /dev/null
> +++ b/drivers/tee/qcomtee/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Qualcomm Trusted Execution Environment Configuration
> +config QCOMTEE
> +       tristate "Qualcomm TEE Support"
> +       select QCOM_SCM
> +       help
> +         This option enables the Qualcomm Trusted Execution Environment =
(QTEE)
> +         driver. It provides an API to access services offered by QTEE a=
nd any
> +         loaded Trusted Applications (TAs), as well as exporting kernel
> +         services to QTEE.
> diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
> new file mode 100644
> index 000000000000..1b14b943e5f5
> --- /dev/null
> +++ b/drivers/tee/qcomtee/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_QCOMTEE) +=3D qcomtee.o
> +qcomtee-objs +=3D async.o
> +qcomtee-objs +=3D call.o
> +qcomtee-objs +=3D core.o
> +qcomtee-objs +=3D qcom_scm.o
> +qcomtee-objs +=3D release.o
> +qcomtee-objs +=3D shm.o
> +qcomtee-objs +=3D user_obj.o
> diff --git a/drivers/tee/qcomtee/async.c b/drivers/tee/qcomtee/async.c
> new file mode 100644
> index 000000000000..4c880c3441a2
> --- /dev/null
> +++ b/drivers/tee/qcomtee/async.c
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#include "qcomtee_private.h"
> +#include "qcomtee_msg.h"
> +
> +#define QCOMTEE_ASYNC_VERSION_1_0 0x00010000U /* Maj: 0x0001, Min: 0x000=
0. */
> +#define QCOMTEE_ASYNC_VERSION_1_1 0x00010001U /* Maj: 0x0001, Min: 0x000=
1. */
> +#define QCOMTEE_ASYNC_VERSION_1_2 0x00010002U /* Maj: 0x0001, Min: 0x000=
2. */
> +#define QCOMTEE_ASYNC_VERSION QCOMTEE_ASYNC_VERSION_1_2 /* Current Versi=
on. */
> +
> +#define QCOMTEE_ASYNC_VERSION_MAJOR(n) upper_16_bits(n)
> +#define QCOMTEE_ASYNC_VERSION_MINOR(n) lower_16_bits(n)
> +
> +/**
> + * struct qcomtee_async_msg_hdr - Asynchronous message header format.
> + * @version: current async protocol version of the remote endpoint.
> + * @op: async operation.
> + *
> + * @version specifies the endpoint's (QTEE or driver) supported async pr=
otocol.
> + * For example, if QTEE sets @version to %QCOMTEE_ASYNC_VERSION_1_1, QTE=
E
> + * handles operations supported in %QCOMTEE_ASYNC_VERSION_1_1 or
> + * %QCOMTEE_ASYNC_VERSION_1_0. @op determines the message format.
> + */
> +struct qcomtee_async_msg_hdr {
> +       u32 version;
> +       u32 op;
> +};
> +
> +/* Size of an empty async message. */
> +#define QCOMTEE_ASYNC_MSG_ZERO sizeof(struct qcomtee_async_msg_hdr)
> +
> +/**
> + * struct qcomtee_async_release_msg - Release asynchronous message.
> + * @hdr: message header as &struct qcomtee_async_msg_hdr.
> + * @counts: number of objects in @object_ids.
> + * @object_ids: array of object IDs that should be released.
> + *
> + * Available in Maj =3D 0x0001, Min >=3D 0x0000.
> + */
> +struct qcomtee_async_release_msg {
> +       struct qcomtee_async_msg_hdr hdr;
> +       u32 counts;
> +       u32 object_ids[] __counted_by(counts);
> +};
> +
> +/**
> + * qcomtee_get_async_buffer() - Get the start of the asynchronous messag=
e.
> + * @oic: context used for the current invocation.
> + * @async_buffer: return buffer to extract from or fill in async message=
s.
> + *
> + * If @oic is used for direct object invocation, the whole outbound buff=
er
> + * is available for the async message. If @oic is used for a callback re=
quest,
> + * the tail of the outbound buffer (after the callback request message) =
is
> + * available for the async message.
> + *
> + * The start of the async buffer is aligned, see qcomtee_msg_offset_alig=
n().
> + */
> +static void qcomtee_get_async_buffer(struct qcomtee_object_invoke_ctx *o=
ic,
> +                                    struct qcomtee_buffer *async_buffer)
> +{
> +       struct qcomtee_msg_callback *msg;
> +       unsigned int offset;
> +       int i;
> +
> +       if (!(oic->flags & QCOMTEE_OIC_FLAG_BUSY)) {
> +               /* The outbound buffer is empty. Using the whole buffer. =
*/
> +               offset =3D 0;
> +       } else {
> +               msg =3D (struct qcomtee_msg_callback *)oic->out_msg.addr;
> +
> +               /* Start offset in a message for buffer arguments. */
> +               offset =3D qcomtee_msg_buffer_args(struct qcomtee_msg_cal=
lback,
> +                                                qcomtee_msg_args(msg));
> +
> +               /* Add size of IB arguments. */
> +               qcomtee_msg_for_each_input_buffer(i, msg)
> +                       offset +=3D qcomtee_msg_offset_align(msg->args[i]=
.b.size);
> +
> +               /* Add size of OB arguments. */
> +               qcomtee_msg_for_each_output_buffer(i, msg)
> +                       offset +=3D qcomtee_msg_offset_align(msg->args[i]=
.b.size);
> +       }
> +
> +       async_buffer->addr =3D oic->out_msg.addr + offset;
> +       async_buffer->size =3D oic->out_msg.size - offset;
> +}
> +
> +/**
> + * async_release() - Process QTEE async release requests.
> + * @oic: context used for the current invocation.
> + * @msg: async message for object release.
> + * @size: size of the async buffer available.
> + *
> + * Return: Size of the outbound buffer used when processing @msg.
> + */
> +static size_t async_release(struct qcomtee_object_invoke_ctx *oic,
> +                           struct qcomtee_async_msg_hdr *async_msg,
> +                           size_t size)
> +{
> +       struct qcomtee_async_release_msg *msg;
> +       struct qcomtee_object *object;
> +       int i;
> +
> +       msg =3D (struct qcomtee_async_release_msg *)async_msg;
> +
> +       for (i =3D 0; i < msg->counts; i++) {
> +               object =3D qcomtee_idx_erase(msg->object_ids[i]);
> +               qcomtee_object_put(object);
> +       }
> +
> +       return struct_size(msg, object_ids, msg->counts);
> +}
> +
> +/**
> + * qcomtee_fetch_async_reqs() - Fetch and process asynchronous messages.
> + * @oic: context used for the current invocation.
> + *
> + * Calls handlers to process the requested operations in the async messa=
ge.
> + * Currently, only supports async release requests.
> + */
> +void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic)
> +{
> +       struct qcomtee_async_msg_hdr *async_msg;
> +       struct qcomtee_buffer async_buffer;
> +       size_t consumed, used =3D 0;
> +
> +       qcomtee_get_async_buffer(oic, &async_buffer);
> +
> +       while (async_buffer.size - used > QCOMTEE_ASYNC_MSG_ZERO) {
> +               async_msg =3D (struct qcomtee_async_msg_hdr *)(async_buff=
er.addr +
> +                                                            used);
> +
> +               if (QCOMTEE_ASYNC_VERSION_MAJOR(async_msg->version) !=3D
> +                   QCOMTEE_ASYNC_VERSION_MAJOR(QCOMTEE_ASYNC_VERSION))
> +                       goto out;
> +
> +               switch (async_msg->op) {
> +               case QCOMTEE_MSG_OBJECT_OP_RELEASE:
> +                       consumed =3D async_release(oic, async_msg,
> +                                                async_buffer.size - used=
);
> +                       break;
> +               default:
> +                       goto out;
> +               }
> +
> +               /* Supported operation but unable to parse the message. *=
/
> +               if (!consumed)
> +                       goto out;
> +
> +               /* Next async message. */
> +               used +=3D qcomtee_msg_offset_align(consumed);
> +       }
> +
> +out:
> +       /* Reset the async buffer so async requests do not loop to QTEE. =
*/
> +       memzero_explicit(async_buffer.addr, async_buffer.size);
> +}
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> new file mode 100644
> index 000000000000..f7f5c2c0bebb
> --- /dev/null
> +++ b/drivers/tee/qcomtee/call.c
> @@ -0,0 +1,753 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/slab.h>
> +#include <linux/tee.h>
> +#include <linux/platform_device.h>
> +
> +#include "qcomtee_private.h"
> +
> +static int find_qtee_object(struct qcomtee_object **object, unsigned lon=
g id,
> +                           struct qcomtee_context_data *ctxdata)
> +{
> +       int err =3D 0;
> +
> +       guard(rcu)();

Does the qcomtee_object_get() call need to be RCU protected?

> +       /* Object release is RCU protected. */
> +       *object =3D idr_find(&ctxdata->qtee_objects_idr, id);
> +       if (!qcomtee_object_get(*object))
> +               err =3D -EINVAL;
> +
> +       return err;
> +}
> +
> +static void del_qtee_object(unsigned long id,
> +                           struct qcomtee_context_data *ctxdata)
> +{
> +       struct qcomtee_object *object;
> +
> +       scoped_guard(spinlock, &ctxdata->qtee_lock)
> +               object =3D idr_remove(&ctxdata->qtee_objects_idr, id);
> +
> +       qcomtee_object_put(object);
> +}
> +
> +/**
> + * qcomtee_context_add_qtee_object() - Add a QTEE object to the context.
> + * @param: TEE parameter representing @object.
> + * @object: QTEE object.
> + * @ctx: context to add the object.
> + *
> + * It assumes @object is %QCOMTEE_OBJECT_TYPE_TEE and the caller has alr=
eady
> + * issued qcomtee_object_get() for @object.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_context_add_qtee_object(struct tee_param *param,
> +                                   struct qcomtee_object *object,
> +                                   struct tee_context *ctx)
> +{
> +       int ret;
> +       struct qcomtee_context_data *ctxdata =3D ctx->data;
> +
> +       guard(spinlock)(&ctxdata->qtee_lock);
> +       ret =3D idr_alloc(&ctxdata->qtee_objects_idr, object, 0, 0, GFP_K=
ERNEL);
> +       if (ret < 0)
> +               return ret;
> +

Is the spinlock needed when updating param below?

> +       param->u.objref.id =3D ret;
> +       /* QTEE Object: QCOMTEE_OBJREF_FLAG_TEE set. */
> +       param->u.objref.flags =3D QCOMTEE_OBJREF_FLAG_TEE;
> +
> +       return 0;
> +}
> +
> +/* Retrieve the QTEE object added with qcomtee_context_add_qtee_object()=
. */
> +int qcomtee_context_find_qtee_object(struct qcomtee_object **object,
> +                                    struct tee_param *param,
> +                                    struct tee_context *ctx)
> +{
> +       struct qcomtee_context_data *ctxdata =3D ctx->data;
> +
> +       /* 'qtee_objects_idr' stores QTEE objects only. */
> +       if (!(param->u.objref.flags & QCOMTEE_OBJREF_FLAG_TEE))
> +               return -EINVAL;
> +
> +       return find_qtee_object(object, param->u.objref.id, ctxdata);
> +}
> +
> +/**
> + * qcomtee_context_del_qtee_object() - Delete a QTEE object from the con=
text.
> + * @param: TEE parameter representing @object.
> + * @ctx: context for deleting the object.
> + *
> + * The @param has been initialized by qcomtee_context_add_qtee_object().
> + */
> +void qcomtee_context_del_qtee_object(struct tee_param *param,
> +                                    struct tee_context *ctx)
> +{
> +       struct qcomtee_context_data *ctxdata =3D ctx->data;
> +
> +       /* 'qtee_objects_idr' stores QTEE objects only. */
> +       if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_TEE)
> +               del_qtee_object(param->u.objref.id, ctxdata);
> +}
> +
> +/**
> + * qcomtee_objref_to_arg() - Convert OBJREF parameter to QTEE argument.
> + * @arg: QTEE argument.
> + * @param: TEE parameter.
> + * @ctx: context in which the conversion should happen.
> + *
> + * It assumes @param is an OBJREF.
> + * It does not set @arg.type; the caller should initialize it to a corre=
ct
> + * &enum qcomtee_arg_type value. It gets the object's refcount in @arg;
> + * the caller should manage to put it afterward.
> + *
> + * For objects that are not in QTEE (i.e. !(param->u.objref.flags &
> + * QCOMTEE_OBJREF_FLAG_TEE)), it also calls qcomtee_object_get() to keep=
 a
> + * temporary copy for the driver as the release of them are asynchronous=
 and
> + * may go away even before returning from the invocation.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_objref_to_arg(struct qcomtee_arg *arg, struct tee_param *par=
am,
> +                         struct tee_context *ctx)
> +{
> +       struct qcomtee_object *object;
> +       int err;
> +
> +       /* param is a NULL object: */
> +       if (param->u.objref.id =3D=3D TEE_OBJREF_NULL) {
> +               arg->o =3D NULL_QCOMTEE_OBJECT;
> +
> +               return 0;
> +       }
> +
> +       /* param is a callback object: */
> +       if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_USER) {
> +               err =3D qcomtee_user_param_to_object(&object, param, ctx)=
;

How about a qcomtee_get_object_from_user_param() that already has
increased the refcount? That should balance better with
qcomtee_context_find_qtee_object().

> +               if (!err)
> +                       qcomtee_object_get(object);
> +       /* param is a QTEE object: */
> +       } else if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_TEE) {
> +               err =3D qcomtee_context_find_qtee_object(&object, param, =
ctx);
> +       } else {
> +               err =3D -EINVAL;
> +       }
> +
> +       arg->o =3D err ? NULL_QCOMTEE_OBJECT : object;

I prefer an if statement here instead of the ternary operator

> +
> +       return err;
> +}
> +
> +/**
> + * qcomtee_objref_from_arg() - Convert QTEE argument to OBJREF param.
> + * @param: TEE parameter.
> + * @arg: QTEE argument.
> + * @ctx: context in which the conversion should happen.
> + *
> + * It assumes @arg is of %QCOMTEE_ARG_TYPE_IO or %QCOMTEE_ARG_TYPE_OO.
> + * It does not set @param.attr; the caller should initialize it to a
> + * correct type.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg =
*arg,
> +                           struct tee_context *ctx)
> +{
> +       struct qcomtee_object *object;
> +       int err;
> +
> +       /* param should be of OBJREF. */
> +       if (param->attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT &&
> +           param->attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT &&
> +           param->attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT)
> +               return -EINVAL;
> +
> +       object =3D arg->o;
> +
> +       switch (typeof_qcomtee_object(object)) {
> +       case QCOMTEE_OBJECT_TYPE_NULL:
> +               param->u.objref.id =3D TEE_OBJREF_NULL;
> +               err =3D 0;
> +
> +               break;
> +       case QCOMTEE_OBJECT_TYPE_CB:
> +               if (is_qcomtee_user_object(object))
> +                       err =3D qcomtee_user_param_from_object(param, obj=
ect,
> +                                                            ctx);
> +               else
> +                       err =3D -EINVAL;
> +
> +               break;
> +       case QCOMTEE_OBJECT_TYPE_TEE:
> +               err =3D qcomtee_context_add_qtee_object(param, object, ct=
x);
> +
> +               break;
> +       case QCOMTEE_OBJECT_TYPE_ROOT:
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return err;
> +}
> +
> +/**
> + * qcomtee_params_to_args() - Convert TEE parameters to QTEE arguments.
> + * @u: QTEE arguments.
> + * @params: TEE parameters.
> + * @num_params: number of elements in the parameter array.
> + * @ctx: context in which the conversion should happen.
> + *
> + * It assumes @u has at least @num_params + 1 entries and has been initi=
alized
> + * with %QCOMTEE_ARG_TYPE_INV as &struct qcomtee_arg.type.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +static int qcomtee_params_to_args(struct qcomtee_arg *u,
> +                                 struct tee_param *params, int num_param=
s,
> +                                 struct tee_context *ctx)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < num_params; i++) {
> +               switch (params[i].attr) {
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +                       u[i].flags =3D QCOMTEE_ARG_FLAGS_UADDR;
> +                       u[i].b.uaddr =3D params[i].u.ubuf.uaddr;
> +                       u[i].b.size =3D params[i].u.ubuf.size;
> +
> +                       if (params[i].attr =3D=3D
> +                           TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT)
> +                               u[i].type =3D QCOMTEE_ARG_TYPE_IB;
> +                       else /* TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT */
> +                               u[i].type =3D QCOMTEE_ARG_TYPE_OB;
> +
> +                       break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
> +                       u[i].type =3D QCOMTEE_ARG_TYPE_IO;
> +                       if (qcomtee_objref_to_arg(&u[i], &params[i], ctx)=
)
> +                               goto out_failed;
> +
> +                       break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
> +                       u[i].type =3D QCOMTEE_ARG_TYPE_OO;
> +                       u[i].o =3D NULL_QCOMTEE_OBJECT;
> +                       break;
> +               default:
> +                       goto out_failed;
> +               }
> +       }
> +
> +       return 0;
> +
> +out_failed:
> +       /* Undo qcomtee_objref_to_arg(). */
> +       for (i--; i >=3D 0; i--) {
> +               if (u[i].type !=3D QCOMTEE_ARG_TYPE_IO)
> +                       continue;
> +
> +               qcomtee_user_object_set_notify(u[i].o, false);
> +               if (typeof_qcomtee_object(u[i].o) =3D=3D QCOMTEE_OBJECT_T=
YPE_CB)
> +                       qcomtee_object_put(u[i].o);
> +
> +               qcomtee_object_put(u[i].o);
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +/**
> + * qcomtee_params_from_args() - Convert QTEE arguments to TEE parameters=
.
> + * @params: TEE parameters.
> + * @u: QTEE arguments.
> + * @num_params: number of elements in the parameter array.
> + * @ctx: context in which the conversion should happen.
> + *
> + * @u should have already been initialized by qcomtee_params_to_args().
> + * This also represents the end of a QTEE invocation that started with
> + * qcomtee_params_to_args() by releasing %QCOMTEE_ARG_TYPE_IO objects.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +static int qcomtee_params_from_args(struct tee_param *params,
> +                                   struct qcomtee_arg *u, int num_params=
,
> +                                   struct tee_context *ctx)
> +{
> +       int i, np;
> +
> +       qcomtee_arg_for_each(np, u) {
> +               if (u[np].type =3D=3D QCOMTEE_ARG_TYPE_OB) {

Can we use switch(u[np].type)?

> +                       /* TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT */
> +                       params[np].u.value.b =3D u[np].b.size;

Should this be params[np].u.ubuf.size?

> +
> +               } else if (u[np].type =3D=3D QCOMTEE_ARG_TYPE_IO) {
> +                       /* IEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT */
> +                       qcomtee_object_put(u[np].o);
> +
> +               } else if (u[np].type =3D=3D QCOMTEE_ARG_TYPE_OO) {
> +                       /* TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT */
> +                       if (qcomtee_objref_from_arg(&params[np], &u[np], =
ctx))
> +                               goto out_failed;
> +               }
> +       }
> +
> +       return 0;
> +
> +out_failed:
> +       /* Undo qcomtee_objref_from_arg(). */
> +       for (i =3D 0; i < np; i++) {
> +               if (params[i].attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJRE=
F_OUTPUT)
> +                       qcomtee_context_del_qtee_object(&params[i], ctx);
> +       }
> +
> +       /* Release any IO and OO objects not processed. */
> +       for (; u[i].type; i++) {
> +               if (u[i].type =3D=3D QCOMTEE_ARG_TYPE_OO ||
> +                   u[i].type =3D=3D QCOMTEE_ARG_TYPE_IO)
> +                       qcomtee_object_put(u[i].o);
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +/* TEE Device Ops. */
> +
> +static int qcomtee_params_check(struct tee_param *params, int num_params=
)
> +{
> +       int io =3D 0, oo =3D 0, ib =3D 0, ob =3D 0;
> +       int i;
> +
> +       /* QTEE accepts 64 arguments. */
> +       if (num_params > QCOMTEE_ARGS_MAX)
> +               return -EINVAL;
> +
> +       /* Supported parameter types. */
> +       for (i =3D 0; i < num_params; i++) {
> +               switch (params[i].attr) {
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> +                       ib++;
> +                       break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +                       ob++;
> +                       break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
> +                       io++;
> +                       break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
> +                       oo++;
> +                       break;
> +               default:
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       /*  QTEE accepts 16 arguments of each supported types. */
> +       if (io > QCOMTEE_ARGS_PER_TYPE || oo > QCOMTEE_ARGS_PER_TYPE ||
> +           ib > QCOMTEE_ARGS_PER_TYPE || ob > QCOMTEE_ARGS_PER_TYPE)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +/* Check if an operation on ROOT_QCOMTEE_OBJECT from userspace is permit=
ted. */
> +static int qcomtee_root_object_check(u32 op, struct tee_param *params,
> +                                    int num_params)
> +{
> +       /* Some privileged operations recognized by QTEE. */
> +       if (op =3D=3D QCOMTEE_ROOT_OP_NOTIFY_DOMAIN_CHANGE ||
> +           op =3D=3D QCOMTEE_ROOT_OP_ADCI_ACCEPT ||
> +           op =3D=3D QCOMTEE_ROOT_OP_ADCI_SHUTDOWN)
> +               return -EINVAL;
> +
> +       /*
> +        * QCOMTEE_ROOT_OP_REGISTER_WITH_CREDENTIALS is to register with =
QTEE
> +        * by passing a credential object as input OBJREF. TEE_OBJREF_NUL=
L as a
> +        * credential object represents a privileged client for QTEE and
> +        * is used by the kernel only.
> +        */
> +       if (op =3D=3D QCOMTEE_ROOT_OP_REGISTER_WITH_CREDENTIALS &&
> +           num_params =3D=3D 2) {
> +               if (params[0].attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJRE=
F_INPUT &&
> +                   params[1].attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJRE=
F_OUTPUT) {
> +                       if (params[0].u.objref.id =3D=3D TEE_OBJREF_NULL)
> +                               return -EINVAL;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * qcomtee_object_invoke() - Invoke a QTEE object.
> + * @ctx: TEE context.
> + * @arg: ioctl arguments.
> + * @params: parameters for the object.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +static int qcomtee_object_invoke(struct tee_context *ctx,
> +                                struct tee_ioctl_object_invoke_arg *arg,
> +                                struct tee_param *params)
> +{
> +       struct qcomtee_object_invoke_ctx *oic __free(kfree) =3D NULL;
> +       struct qcomtee_context_data *ctxdata =3D ctx->data;
> +       struct qcomtee_arg *u __free(kfree) =3D NULL;
> +       struct qcomtee_object *object;
> +       int i, ret, result;
> +
> +       if (qcomtee_params_check(params, arg->num_params))
> +               return -EINVAL;
> +
> +       /* First, handle reserved operations: */
> +       if (arg->op =3D=3D QCOMTEE_MSG_OBJECT_OP_RELEASE) {
> +               del_qtee_object(arg->object, ctxdata);
> +
> +               return 0;
> +       }
> +
> +       /* Otherwise, invoke a QTEE object: */
> +       oic =3D qcomtee_object_invoke_ctx_alloc(ctx);
> +       if (!oic)
> +               return -ENOMEM;
> +
> +       /* +1 for ending QCOMTEE_ARG_TYPE_INV. */
> +       u =3D kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
> +       if (!u)
> +               return -ENOMEM;
> +
> +       /* Get an object to invoke. */
> +       if (arg->object =3D=3D TEE_OBJREF_NULL) {
> +               /* Use ROOT if TEE_OBJREF_NULL is invoked. */
> +               if (qcomtee_root_object_check(arg->op, params, arg->num_p=
arams))
> +                       return -EINVAL;
> +
> +               object =3D ROOT_QCOMTEE_OBJECT;
> +       } else if (find_qtee_object(&object, arg->object, ctxdata)) {
> +               return -EINVAL;
> +       }
> +
> +       ret =3D qcomtee_params_to_args(u, params, arg->num_params, ctx);
> +       if (ret)
> +               goto out;
> +
> +       ret =3D qcomtee_object_do_invoke(oic, object, arg->op, u, &result=
);
> +       if (ret) {
> +               qcomtee_arg_for_each_input_object(i, u) {
> +                       qcomtee_user_object_set_notify(u[i].o, false);
> +                       qcomtee_object_put(u[i].o);
> +               }
> +
> +               goto out;
> +       }
> +
> +       if (!result) {
> +               /* Assume service is UNAVAIL if unable to process the res=
ult. */
> +               if (qcomtee_params_from_args(params, u, arg->num_params, =
ctx))
> +                       result =3D QCOMTEE_MSG_ERROR_UNAVAIL;
> +       } else {
> +               /*
> +                * qcomtee_params_to_args() gets a copy of IO for the dri=
ver to
> +                * make sure they do not get released while in the middle=
 of
> +                * invocation. On success (!result), qcomtee_params_from_=
args()
> +                * puts them.
> +                */
> +               qcomtee_arg_for_each_input_object(i, u)
> +                       qcomtee_object_put(u[i].o);
> +       }
> +
> +       arg->ret =3D result;
> +out:
> +       qcomtee_object_put(object);
> +
> +       return ret;
> +}
> +
> +/**
> + * qcomtee_supp_recv() - Wait for a request for the supplicant.
> + * @ctx: TEE context.
> + * @op: requested operation on the object.
> + * @num_params: number of elements in the parameter array.
> + * @params: parameters for @op.
> + *
> + * The first parameter is a meta %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT.
> + * On input, it provides a user buffer. This buffer is used for paramete=
rs of
> + * type %TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT in qcomtee_cb_params_from_=
args().
> + * On output, the object ID and request ID are stored in the meta parame=
ter.
> + *
> + * @num_params is updated to the number of parameters that actually exis=
t
> + * in @params on return.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +static int qcomtee_supp_recv(struct tee_context *ctx, u32 *op, u32 *num_=
params,
> +                            struct tee_param *params)
> +{
> +       struct qcomtee_user_object_request_data data;
> +       void __user *uaddr;
> +       size_t ubuf_size;
> +       int i, ret;
> +
> +       if (!*num_params)
> +               return -EINVAL;
> +
> +       /* We expect the first parameter to be an INOUT + meta parameter.=
 */
> +       if (params->attr !=3D
> +           (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT | TEE_IOCTL_PARAM_ATTR=
_META))

Why aren't you using TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_*?

> +               return -EINVAL;
> +
> +       /* Other parameters are none. */
> +       for (i =3D 1; i < *num_params; i++)
> +               if (params[i].attr)
> +                       return -EINVAL;
> +
> +       if (!IS_ALIGNED(params->u.value.a, 8))
> +               return -EINVAL;
> +
> +       /* User buffer and size from meta parameter. */
> +       uaddr =3D u64_to_user_ptr(params->u.value.a);
> +       ubuf_size =3D params->u.value.b;

Please use params->u.ubuf.uaddr and params->u.ubuf.size instead

> +       /* Process TEE parameters. +/-1 to ignore the meta parameter. */
> +       ret =3D qcomtee_user_object_select(ctx, params + 1, *num_params -=
 1,
> +                                        uaddr, ubuf_size, &data);
> +       if (ret)
> +               return ret;
> +
> +       params->u.value.a =3D data.object_id;
> +       params->u.value.b =3D data.id;

 params->u.objref.{id, flags}?
Should params->attr be updated with TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*?

> +       params->u.value.c =3D 0;
> +       *op =3D data.op;
> +       *num_params =3D data.np + 1;
> +
> +       return 0;
> +}
> +
> +/**
> + * qcomtee_supp_send() - Submit a response for a request.
> + * @ctx: TEE context.
> + * @errno: return value for the request.
> + * @num_params: number of elements in the parameter array.
> + * @params: returned parameters.
> + *
> + * The first parameter is a meta %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT=
.
> + * It specifies the request ID this response belongs to.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +static int qcomtee_supp_send(struct tee_context *ctx, u32 errno, u32 num=
_params,
> +                            struct tee_param *params)
> +{
> +       if (!num_params)
> +               return -EINVAL;
> +
> +       /* We expect the first parameter to be an OUTPUT + meta parameter=
. */
> +       if (params->attr !=3D (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT |
> +                            TEE_IOCTL_PARAM_ATTR_META))
> +               return -EINVAL;

Why is this used if it's to be ignored, making room for forward compatibili=
ty?

> +
> +       /* Process TEE parameters. +/-1 to ignore the meta parameter. */
> +       return qcomtee_user_object_submit(ctx, params + 1, num_params - 1=
,
> +                                         params->u.value.a, errno);
> +}
> +
> +static int qcomtee_open(struct tee_context *ctx)
> +{
> +       struct qcomtee_context_data *ctxdata __free(kfree) =3D NULL;
> +
> +       ctxdata =3D kzalloc(sizeof(*ctxdata), GFP_KERNEL);
> +       if (!ctxdata)
> +               return -ENOMEM;
> +
> +       /*
> +        * In the QTEE driver, the same context is used to refcount resou=
rces
> +        * shared by QTEE. For example, teedev_ctx_get() is called for an=
y
> +        * instance of callback objects (see qcomtee_user_param_to_object=
()).
> +        *
> +        * Maintain a copy of teedev for QTEE as it serves as a direct us=
er of
> +        * this context. The teedev will be released in the context's rel=
ease().
> +        *
> +        * tee_device_unregister() will remain blocked until all contexts
> +        * are released. This includes contexts owned by the user, which =
are
> +        * closed by teedev_close_context(), as well as those owned by QT=
EE
> +        * closed by tee_context_put() in object's release().
> +        */
> +       if (!tee_device_get(ctx->teedev))
> +               return -EINVAL;
> +
> +       idr_init(&ctxdata->qtee_objects_idr);
> +       spin_lock_init(&ctxdata->qtee_lock);
> +       idr_init(&ctxdata->reqs_idr);
> +       INIT_LIST_HEAD(&ctxdata->reqs_list);
> +       mutex_init(&ctxdata->reqs_lock);
> +       init_completion(&ctxdata->req_c);
> +
> +       ctx->data =3D no_free_ptr(ctxdata);
> +
> +       return 0;
> +}
> +
> +/* This is called when the user closes the device. */
> +static void qcomtee_close_context(struct tee_context *ctx)
> +{
> +       struct qcomtee_context_data *ctxdata =3D ctx->data;
> +       struct qcomtee_object *object;
> +       int id;
> +
> +       /* Process QUEUED or PROCESSING requests. */
> +       qcomtee_requests_destroy(ctxdata);
> +       /* Release QTEE objects. */
> +       idr_for_each_entry(&ctxdata->qtee_objects_idr, object, id)
> +               qcomtee_object_put(object);
> +}
> +
> +/* This is called when the final reference to the context goes away. */
> +static void qcomtee_release(struct tee_context *ctx)
> +{
> +       struct qcomtee_context_data *ctxdata =3D ctx->data;
> +
> +       idr_destroy(&ctxdata->qtee_objects_idr);
> +       idr_destroy(&ctxdata->reqs_idr);
> +       kfree(ctxdata);
> +
> +       /* There is nothing shared in this context with QTEE. */
> +       tee_device_put(ctx->teedev);
> +}
> +
> +static void qcomtee_get_version(struct tee_device *teedev,
> +                               struct tee_ioctl_version_data *vers)
> +{
> +       struct tee_ioctl_version_data v =3D {
> +               .impl_id =3D TEE_IMPL_ID_QTEE,
> +               .gen_caps =3D TEE_GEN_CAP_OBJREF,
> +       };
> +
> +       *vers =3D v;
> +}
> +
> +static const struct tee_driver_ops qcomtee_ops =3D {
> +       .get_version =3D qcomtee_get_version,
> +       .open =3D qcomtee_open,
> +       .close_context =3D qcomtee_close_context,
> +       .release =3D qcomtee_release,
> +       .object_invoke_func =3D qcomtee_object_invoke,
> +       .supp_recv =3D qcomtee_supp_recv,
> +       .supp_send =3D qcomtee_supp_send,
> +};
> +
> +static const struct tee_desc qcomtee_desc =3D {
> +       .name =3D "qcomtee",
> +       .ops =3D &qcomtee_ops,
> +       .owner =3D THIS_MODULE,
> +};
> +
> +static int qcomtee_probe(struct platform_device *pdev)
> +{
> +       struct workqueue_struct *async_wq;
> +       struct tee_device *teedev;
> +       struct tee_shm_pool *pool;
> +       struct tee_context *ctx;
> +       struct qcomtee *qcomtee;
> +       int err;
> +
> +       qcomtee =3D kzalloc(sizeof(*qcomtee), GFP_KERNEL);
> +       if (!qcomtee)
> +               return -ENOMEM;
> +
> +       pool =3D qcomtee_shm_pool_alloc();
> +       if (IS_ERR(pool)) {
> +               err =3D PTR_ERR(pool);
> +
> +               goto err_free_qcomtee;
> +       }
> +
> +       teedev =3D tee_device_alloc(&qcomtee_desc, NULL, pool, qcomtee);
> +       if (IS_ERR(teedev)) {
> +               err =3D PTR_ERR(teedev);
> +
> +               goto err_pool_destroy;
> +       }
> +
> +       qcomtee->teedev =3D teedev;
> +       qcomtee->pool =3D pool;
> +       err =3D tee_device_register(qcomtee->teedev);
> +       if (err)
> +               goto err_unreg_teedev;
> +
> +       platform_set_drvdata(pdev, qcomtee);
> +       /* Start async wq. */
> +       async_wq =3D alloc_ordered_workqueue("qcomtee_wq", 0);
> +       if (!async_wq)
> +               goto err_unreg_teedev;
> +
> +       qcomtee->wq =3D async_wq;
> +       /* Driver context used for async operations of teedev. */
> +       ctx =3D teedev_open(qcomtee->teedev);
> +       if (IS_ERR(ctx)) {
> +               err =3D PTR_ERR(ctx);
> +
> +               goto err_dest_wq;
> +       }
> +
> +       qcomtee->ctx =3D ctx;
> +
> +       return 0;
> +
> +err_dest_wq:
> +       destroy_workqueue(qcomtee->wq);
> +err_unreg_teedev:
> +       tee_device_unregister(qcomtee->teedev);
> +err_pool_destroy:
> +       tee_shm_pool_free(pool);
> +err_free_qcomtee:
> +       kfree(qcomtee);
> +
> +       return err;
> +}
> +
> +/**
> + * qcomtee_remove() - Device Removal Routine.
> + * @pdev: platform device information struct.
> + *
> + * It is called by the platform subsystem to alert the driver that it sh=
ould
> + * release the device.
> + *
> + * QTEE does not provide an API to inform it about a callback object goi=
ng away.
> + * However, when releasing QTEE objects, any callback object sent to QTE=
E
> + * previously would be released by QTEE as part of the object release.
> + */
> +static void qcomtee_remove(struct platform_device *pdev)
> +{
> +       struct qcomtee *qcomtee =3D platform_get_drvdata(pdev);
> +
> +       teedev_close_context(qcomtee->ctx);
> +       /* Wait for RELEASE operations to be processed for QTEE objects. =
*/
> +       tee_device_unregister(qcomtee->teedev);
> +       destroy_workqueue(qcomtee->wq);
> +       tee_shm_pool_free(qcomtee->pool);
> +       kfree(qcomtee);
> +}
> +
> +static const struct platform_device_id qcomtee_ids[] =3D { { "qcomtee", =
0 }, {} };
> +MODULE_DEVICE_TABLE(platform, qcomtee_ids);
> +
> +static struct platform_driver qcomtee_platform_driver =3D {
> +       .probe =3D qcomtee_probe,
> +       .remove =3D qcomtee_remove,
> +       .driver =3D {
> +               .name =3D "qcomtee",
> +       },
> +       .id_table =3D qcomtee_ids,
> +};
> +
> +module_platform_driver(qcomtee_platform_driver);
> +
> +MODULE_AUTHOR("Qualcomm");
> +MODULE_DESCRIPTION("QTEE driver");
> +MODULE_VERSION("1.0");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> new file mode 100644
> index 000000000000..162e32db656a
> --- /dev/null
> +++ b/drivers/tee/qcomtee/core.c
> @@ -0,0 +1,801 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/xarray.h>
> +
> +#include "qcomtee_msg.h"
> +#include "qcomtee_private.h"
> +
> +/* This is the QTEE root object. */
> +struct qcomtee_object qcomtee_object_root =3D {
> +       .name =3D "root",
> +       .object_type =3D QCOMTEE_OBJECT_TYPE_ROOT,
> +       .info.qtee_id =3D QCOMTEE_MSG_OBJECT_ROOT,
> +};
> +EXPORT_SYMBOL_GPL(qcomtee_object_root);
> +
> +/* Next argument of type @type after index @i. */
> +int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
> +                         enum qcomtee_arg_type type)
> +{
> +       while (u[i].type !=3D QCOMTEE_ARG_TYPE_INV && u[i].type !=3D type=
)
> +               i++;
> +       return i;
> +}
> +
> +/*
> + * QTEE expects IDs with the QCOMTEE_MSG_OBJECT_NS_BIT set for objects
> + * of the QCOMTEE_OBJECT_TYPE_CB type.
> + */
> +#define QCOMTEE_OBJECT_ID_START (QCOMTEE_MSG_OBJECT_NS_BIT + 1)
> +#define QCOMTEE_OBJECT_ID_END (UINT_MAX)

Should this be U32_MAX considering that QCOMTEE_MSG_OBJECT_NS_BIT is
defined as BIT(31)?

> +
> +#define QCOMTEE_OBJECT_SET(p, type, ...) \
> +       __QCOMTEE_OBJECT_SET(p, type, ##__VA_ARGS__, 0UL)
> +#define __QCOMTEE_OBJECT_SET(p, type, optr, ...)           \
> +       do {                                               \
> +               (p)->object_type =3D (type);                 \
> +               (p)->info.qtee_id =3D (unsigned long)(optr); \
> +       } while (0)
> +
> +static struct qcomtee_object *
> +qcomtee_qtee_object_alloc(struct qcomtee_object_invoke_ctx *oic,
> +                         unsigned int object_id)
> +{
> +       struct qcomtee *qcomtee =3D tee_get_drvdata(oic->ctx->teedev);
> +       struct qcomtee_object *object __free(kfree);
> +
> +       object =3D kzalloc(sizeof(*object), GFP_KERNEL);
> +       if (!object)
> +               return NULL_QCOMTEE_OBJECT;
> +
> +       /* If failed, "no-name". */
> +       object->name =3D kasprintf(GFP_KERNEL, "qcomtee-%u", object_id);

Where does it become "no-name" if object->name is NULL? Is it worth it
with a special case for the unlikely condition that kasprintf() fails
while no other memory allocations fail?

> +       QCOMTEE_OBJECT_SET(object, QCOMTEE_OBJECT_TYPE_TEE, object_id);
> +       kref_init(&object->refcount);
> +       /* A QTEE object requires a context for async operations. */
> +       object->info.qcomtee_async_ctx =3D qcomtee->ctx;
> +       teedev_ctx_get(object->info.qcomtee_async_ctx);
> +
> +       return no_free_ptr(object);
> +}
> +
> +void qcomtee_qtee_object_free(struct qcomtee_object *object)
> +{
> +       /* See qcomtee_qtee_object_alloc(). */
> +       teedev_ctx_put(object->info.qcomtee_async_ctx);
> +
> +       kfree(object->name);
> +       kfree(object);
> +}
> +
> +static void qcomtee_object_release(struct kref *refcount)
> +{
> +       struct qcomtee_object *object;
> +       const char *name;
> +
> +       object =3D container_of(refcount, struct qcomtee_object, refcount=
);
> +
> +       synchronize_rcu();

Please add a comment in the code explaining why this is needed.

> +
> +       switch (typeof_qcomtee_object(object)) {
> +       case QCOMTEE_OBJECT_TYPE_TEE:
> +               qcomtee_release_tee_object(object);
> +
> +               break;
> +       case QCOMTEE_OBJECT_TYPE_CB:
> +               name =3D object->name;
> +
> +               if (object->ops->release)
> +                       object->ops->release(object);
> +
> +               kfree_const(name);
> +
> +               break;
> +       case QCOMTEE_OBJECT_TYPE_ROOT:
> +       case QCOMTEE_OBJECT_TYPE_NULL:
> +       default:
> +               break;
> +       }
> +}
> +
> +/**
> + * qcomtee_object_get() - Increase the object's reference count.
> + * @object: object to increase the reference count.
> + */
> +int qcomtee_object_get(struct qcomtee_object *object)
> +{
> +       if (object !=3D NULL_QCOMTEE_OBJECT && object !=3D ROOT_QCOMTEE_O=
BJECT)
> +               return kref_get_unless_zero(&object->refcount);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(qcomtee_object_get);
> +
> +/**
> + * qcomtee_object_put() - Decrease the object's reference count.
> + * @object: object to decrease the reference count.
> + */
> +void qcomtee_object_put(struct qcomtee_object *object)
> +{
> +       if (object !=3D NULL_QCOMTEE_OBJECT && object !=3D ROOT_QCOMTEE_O=
BJECT)
> +               kref_put(&object->refcount, qcomtee_object_release);
> +}
> +EXPORT_SYMBOL_GPL(qcomtee_object_put);
> +
> +/*
> + * ''Local Object Table''.
> + * Objects from the kernel exported to QTEE are assigned an ID and store=
d
> + * in xa_qcom_local_objects (also known as the kernel object table).
> + * QTEE uses this ID to reference the objects using qcomtee_local_object=
_get().
> + */
> +static DEFINE_XARRAY_ALLOC(xa_qcom_local_objects);

Please move this to the top of this file where the other global
variables are kept. Do we have/need any checks to see the unrelated
processes doesn't use objects from each other because they manage to
guess an id?

> +
> +static int qcomtee_idx_alloc(u32 *idx, struct qcomtee_object *object)
> +{
> +       static u32 xa_last_id =3D QCOMTEE_OBJECT_ID_START;
> +
> +       /* Every ID allocated here has QCOMTEE_MSG_OBJECT_NS_BIT set. */
> +       return xa_alloc_cyclic(&xa_qcom_local_objects, idx, object,
> +                              XA_LIMIT(QCOMTEE_OBJECT_ID_START,
> +                                       QCOMTEE_OBJECT_ID_END),
> +                              &xa_last_id, GFP_KERNEL);
> +}
> +
> +struct qcomtee_object *qcomtee_idx_erase(u32 idx)
> +{
> +       if (idx < QCOMTEE_OBJECT_ID_START || idx > QCOMTEE_OBJECT_ID_END)
> +               return NULL_QCOMTEE_OBJECT;
> +
> +       return xa_erase(&xa_qcom_local_objects, idx);
> +}
> +
> +/**
> + * qcomtee_object_id_get() - Get an ID for an object to send to QTEE.
> + * @object: object to assign an ID.
> + * @object_id: object ID.
> + *
> + * This is called on the path to QTEE to construct the message; see
> + * qcomtee_prepare_msg() and qcomtee_update_msg().
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +static int qcomtee_object_id_get(struct qcomtee_object *object,
> +                                unsigned int *object_id)
> +{
> +       u32 idx;
> +
> +       switch (typeof_qcomtee_object(object)) {
> +       case QCOMTEE_OBJECT_TYPE_CB:
> +               if (qcomtee_idx_alloc(&idx, object) < 0)
> +                       return -ENOSPC;
> +
> +               *object_id =3D idx;
> +
> +               break;
> +       case QCOMTEE_OBJECT_TYPE_ROOT:
> +       case QCOMTEE_OBJECT_TYPE_TEE:
> +               *object_id =3D object->info.qtee_id;
> +
> +               break;
> +       case QCOMTEE_OBJECT_TYPE_NULL:
> +               *object_id =3D QCOMTEE_MSG_OBJECT_NULL;
> +
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +/* Release object ID assigned in qcomtee_object_id_get. */
> +static void qcomtee_object_id_put(unsigned int object_id)
> +{
> +       qcomtee_idx_erase(object_id);
> +}
> +
> +/**
> + * qcomtee_local_object_get() - Get the object referenced by the ID.
> + * @object_id: object ID.
> + *
> + * It is called on the path from QTEE.
> + * It is called on behalf of QTEE to obtain an instance of an object
> + * for a given ID. It increases the object's reference count on success.
> + *
> + * Return: On error, returns %NULL_QCOMTEE_OBJECT.
> + *         On success, returns the object.
> + */
> +static struct qcomtee_object *qcomtee_local_object_get(unsigned int obje=
ct_id)
> +{
> +       struct qcomtee_object *object;
> +
> +       /*
> +        * This is not protected by an RCU read lock because we are
> +        * confident that QTEE does not issue a RELEASE request and
> +        * qcomtee_local_object_get() concurrently.
> +        */

I think it would be better to not depend on that. An RCU read lock
must be very cheap compared to what we do in this context.

> +       object =3D xa_load(&xa_qcom_local_objects, object_id);
> +
> +       qcomtee_object_get(object);
> +
> +       return object;
> +}
> +
> +/**
> + * qcomtee_object_user_init() - Initialize an object for the user.
> + * @object: object to initialize.
> + * @ot: type of object as &enum qcomtee_object_type.
> + * @ops: instance of callbacks.
> + * @fmt: name assigned to the object.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_object_user_init(struct qcomtee_object *object,
> +                            enum qcomtee_object_type ot,
> +                            struct qcomtee_object_operations *ops,
> +                            const char *fmt, ...)
> +{
> +       va_list ap;
> +       int ret;
> +
> +       kref_init(&object->refcount);
> +       QCOMTEE_OBJECT_SET(object, QCOMTEE_OBJECT_TYPE_NULL);
> +
> +       va_start(ap, fmt);
> +       switch (ot) {
> +       case QCOMTEE_OBJECT_TYPE_NULL:
> +               ret =3D 0;
> +
> +               break;
> +       case QCOMTEE_OBJECT_TYPE_CB:
> +               object->ops =3D ops;
> +               if (!object->ops->dispatch)
> +                       return -EINVAL;
> +
> +               /* If failed, "no-name". */
> +               object->name =3D kvasprintf_const(GFP_KERNEL, fmt, ap);
> +               QCOMTEE_OBJECT_SET(object, QCOMTEE_OBJECT_TYPE_CB);
> +
> +               ret =3D 0;
> +               break;
> +       case QCOMTEE_OBJECT_TYPE_ROOT:
> +       case QCOMTEE_OBJECT_TYPE_TEE:
> +       default:
> +               ret =3D -EINVAL;
> +       }
> +       va_end(ap);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcomtee_object_user_init);
> +
> +/**
> + * qcomtee_object_type() - Returns the type of object represented by an =
ID.
> + * @object_id: object ID for the object.
> + *
> + * This is similar to typeof_qcomtee_object(), but instead of receiving =
an
> + * object as an argument, it receives an object ID. It is used internall=
y
> + * on the return path from QTEE.
> + *
> + * Return: Returns the type of object referenced by @object_id.
> + */
> +static enum qcomtee_object_type qcomtee_object_type(unsigned int object_=
id)
> +{
> +       if (object_id =3D=3D QCOMTEE_MSG_OBJECT_NULL)
> +               return QCOMTEE_OBJECT_TYPE_NULL;
> +
> +       if (object_id & QCOMTEE_MSG_OBJECT_NS_BIT)
> +               return QCOMTEE_OBJECT_TYPE_CB;
> +
> +       return QCOMTEE_OBJECT_TYPE_TEE;
> +}
> +
> +/**
> + * qcomtee_object_qtee_init() - Initialize an object for QTEE.
> + * @object: object returned.
> + * @object_id: object ID received from QTEE.
> + *
> + * Return: On failure, returns < 0 and sets @object to %NULL_QCOMTEE_OBJ=
ECT.
> + *         On success, returns 0
> + */
> +static int qcomtee_object_qtee_init(struct qcomtee_object_invoke_ctx *oi=
c,
> +                                   struct qcomtee_object **object,
> +                                   unsigned int object_id)
> +{
> +       int ret =3D 0;
> +
> +       switch (qcomtee_object_type(object_id)) {
> +       case QCOMTEE_OBJECT_TYPE_NULL:
> +               *object =3D NULL_QCOMTEE_OBJECT;
> +
> +               break;
> +       case QCOMTEE_OBJECT_TYPE_CB:
> +               *object =3D qcomtee_local_object_get(object_id);
> +               if (*object =3D=3D NULL_QCOMTEE_OBJECT)
> +                       ret =3D -EINVAL;
> +
> +               break;
> +
> +       default: /* QCOMTEE_OBJECT_TYPE_TEE */
> +               *object =3D qcomtee_qtee_object_alloc(oic, object_id);
> +               if (*object =3D=3D NULL_QCOMTEE_OBJECT)
> +                       ret =3D -ENOMEM;
> +
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +/*
> + * ''Marshaling API''
> + * qcomtee_prepare_msg  - Prepare the inbound buffer for sending to QTEE
> + * qcomtee_update_args  - Parse the QTEE response in the inbound buffer
> + * qcomtee_prepare_args - Parse the QTEE request from the outbound buffe=
r
> + * qcomtee_update_msg   - Update the outbound buffer with the response f=
or QTEE
> + */
> +
> +static int qcomtee_prepare_msg(struct qcomtee_object_invoke_ctx *oic,
> +                              struct qcomtee_object *object, u32 op,
> +                              struct qcomtee_arg *u)
> +{
> +       struct qcomtee_msg_object_invoke *msg;
> +       unsigned int object_id;
> +       int i, ib, ob, io, oo;
> +       size_t off;
> +
> +       /* Use the input message buffer in 'oic'. */
> +       msg =3D oic->in_msg.addr;
> +
> +       /* Start offset in a message for buffer arguments. */
> +       off =3D qcomtee_msg_buffer_args(struct qcomtee_msg_object_invoke,
> +                                     qcomtee_args_len(u));
> +
> +       /* Get the ID of the object being invoked. */
> +       if (qcomtee_object_id_get(object, &object_id))
> +               return -ENOSPC;
> +
> +       ib =3D 0;
> +       qcomtee_arg_for_each_input_buffer(i, u) {
> +               void *ptr;
> +
> +               /* Overflow already checked in qcomtee_msg_buffers_alloc(=
). */
> +               msg->args[ib].b.offset =3D off;
> +               msg->args[ib].b.size =3D u[i].b.size;
> +
> +               ptr =3D qcomtee_msg_offset_to_ptr(msg, off);
> +               /* Userspace client or kernel client!? */
> +               if (!(u[i].flags & QCOMTEE_ARG_FLAGS_UADDR))
> +                       memcpy(ptr, u[i].b.addr, u[i].b.size);
> +               else if (copy_from_user(ptr, u[i].b.uaddr, u[i].b.size))
> +                       return -EINVAL;
> +
> +               off +=3D qcomtee_msg_offset_align(u[i].b.size);
> +               ib++;
> +       }
> +
> +       ob =3D ib;
> +       qcomtee_arg_for_each_output_buffer(i, u) {
> +               /* Overflow already checked in qcomtee_msg_buffers_alloc(=
). */
> +               msg->args[ob].b.offset =3D off;
> +               msg->args[ob].b.size =3D u[i].b.size;
> +
> +               off +=3D qcomtee_msg_offset_align(u[i].b.size);
> +               ob++;
> +       }
> +
> +       io =3D ob;
> +       qcomtee_arg_for_each_input_object(i, u) {
> +               if (qcomtee_object_id_get(u[i].o, &msg->args[io].o)) {
> +                       /* Put whatever we got. */
> +                       qcomtee_object_id_put(object_id);
> +                       for (io--; io >=3D ob; io--)
> +                               qcomtee_object_id_put(msg->args[io].o);
> +
> +                       return -ENOSPC;
> +               }
> +
> +               io++;
> +       }
> +
> +       oo =3D io;
> +       qcomtee_arg_for_each_output_object(i, u)
> +               oo++;
> +
> +       /* Set object, operation, and argument counts. */
> +       qcomtee_msg_init(msg, object_id, op, ib, ob, io, oo);
> +
> +       return 0;
> +}
> +
> +/**
> + * qcomtee_update_args() - Parse the QTEE response in the inbound buffer=
.
> + * @u: array of arguments for the invocation.
> + * @oic: context to use for the invocation.
> + *
> + * @u must be the same as the one used in qcomtee_prepare_msg() when
> + * initializing the inbound buffer.
> + *
> + * On failure, it continues processing the QTEE message. The caller shou=
ld
> + * do the necessary cleanup, including calling qcomtee_object_put()
> + * on the output objects.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +static int qcomtee_update_args(struct qcomtee_arg *u,
> +                              struct qcomtee_object_invoke_ctx *oic)
> +{
> +       struct qcomtee_msg_object_invoke *msg;
> +       int i, ib, ob, io, oo;
> +       int ret =3D 0;
> +
> +       /* Use the input message buffer in 'oic'. */
> +       msg =3D oic->in_msg.addr;
> +
> +       ib =3D 0;
> +       qcomtee_arg_for_each_input_buffer(i, u)
> +               ib++;
> +
> +       ob =3D ib;
> +       qcomtee_arg_for_each_output_buffer(i, u) {
> +               void *ptr;
> +
> +               /* QTEE can override the size to a smaller value. */
> +               u[i].b.size =3D msg->args[ob].b.size;
> +
> +               ptr =3D qcomtee_msg_offset_to_ptr(msg, msg->args[ob].b.of=
fset);
> +               /* Userspace client or kernel client!? */
> +               if (!(u[i].flags & QCOMTEE_ARG_FLAGS_UADDR))
> +                       memcpy(u[i].b.addr, ptr, u[i].b.size);
> +               else if (copy_to_user(u[i].b.uaddr, ptr, u[i].b.size))
> +                       ret =3D -EINVAL;
> +
> +               ob++;
> +       }
> +
> +       io =3D ob;
> +       qcomtee_arg_for_each_input_object(i, u)
> +               io++;
> +
> +       oo =3D io;
> +       qcomtee_arg_for_each_output_object(i, u) {
> +               if (qcomtee_object_qtee_init(oic, &u[i].o, msg->args[oo].=
o))
> +                       ret =3D -EINVAL;
> +
> +               oo++;
> +       }
> +
> +       return ret;
> +}
> +
> +/**
> + * qcomtee_prepare_args() - Parse the QTEE request from the outbound buf=
fer.
> + * @oic: context to use for the invocation.
> + *
> + * It initializes &qcomtee_object_invoke_ctx->u based on the QTEE reques=
t in
> + * the outbound buffer. It sets %QCOMTEE_ARG_TYPE_INV at the end of the =
array.
> + *
> + * On failure, it continues processing the QTEE message. The caller shou=
ld
> + * do the necessary cleanup, including calling qcomtee_object_put()
> + * on the input objects.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +static int qcomtee_prepare_args(struct qcomtee_object_invoke_ctx *oic)
> +{
> +       struct qcomtee_msg_callback *msg;
> +       union qcomtee_msg_arg *arg;
> +       int i, ret =3D 0;
> +
> +       /* Use the output message buffer in 'oic'. */
> +       msg =3D oic->out_msg.addr;
> +
> +       qcomtee_msg_for_each_input_buffer(i, msg) {
> +               arg =3D &msg->args[i];
> +               oic->u[i].b.addr =3D
> +                       qcomtee_msg_offset_to_ptr(msg, arg->b.offset);
> +               oic->u[i].b.size =3D arg->b.size;
> +               oic->u[i].type =3D QCOMTEE_ARG_TYPE_IB;
> +       }
> +
> +       qcomtee_msg_for_each_output_buffer(i, msg) {
> +               arg =3D &msg->args[i];
> +               oic->u[i].b.addr =3D
> +                       qcomtee_msg_offset_to_ptr(msg, arg->b.offset);
> +               oic->u[i].b.size =3D arg->b.size;
> +               oic->u[i].type =3D QCOMTEE_ARG_TYPE_OB;
> +       }
> +
> +       qcomtee_msg_for_each_input_object(i, msg) {
> +               if (qcomtee_object_qtee_init(oic, &oic->u[i].o, msg->args=
[i].o))
> +                       ret =3D -EINVAL;
> +
> +               oic->u[i].type =3D QCOMTEE_ARG_TYPE_IO;
> +       }
> +
> +       qcomtee_msg_for_each_output_object(i, msg)
> +               oic->u[i].type =3D QCOMTEE_ARG_TYPE_OO;
> +
> +       /* End of Arguments. */
> +       oic->u[i].type =3D QCOMTEE_ARG_TYPE_INV;
> +
> +       return ret;
> +}
> +
> +static int qcomtee_update_msg(struct qcomtee_object_invoke_ctx *oic)
> +{
> +       struct qcomtee_msg_callback *msg;
> +       int i, ib, ob, io, oo;
> +
> +       /* Use the output message buffer in 'oic'. */
> +       msg =3D oic->out_msg.addr;
> +
> +       ib =3D 0;
> +       qcomtee_arg_for_each_input_buffer(i, oic->u)
> +               ib++;
> +
> +       ob =3D ib;
> +       qcomtee_arg_for_each_output_buffer(i, oic->u) {
> +               /* Only reduce size; never increase it. */
> +               if (msg->args[ob].b.size < oic->u[i].b.size)
> +                       return -EINVAL;
> +
> +               msg->args[ob].b.size =3D oic->u[i].b.size;
> +               ob++;
> +       }
> +
> +       io =3D ob;
> +       qcomtee_arg_for_each_input_object(i, oic->u)
> +               io++;
> +
> +       oo =3D io;
> +       qcomtee_arg_for_each_output_object(i, oic->u) {
> +               if (qcomtee_object_id_get(oic->u[i].o, &msg->args[oo].o))=
 {
> +                       /* Put whatever we got. */
> +                       for (oo--; oo >=3D io; oo--)
> +                               qcomtee_object_id_put(msg->args[oo].o);
> +
> +                       return -ENOSPC;
> +               }
> +
> +               oo++;
> +       }
> +
> +       return 0;
> +}
> +
> +/* Invoke a callback object. */
> +static void qcomtee_cb_object_invoke(struct qcomtee_object_invoke_ctx *o=
ic,
> +                                    struct qcomtee_msg_callback *msg)
> +{
> +       int i, errno;
> +       u32 op;
> +
> +       /* Get the object being invoked. */
> +       unsigned int object_id =3D msg->cxt;
> +       struct qcomtee_object *object;
> +
> +       /* QTEE cannot invoke a NULL object or objects it hosts. */
> +       if (qcomtee_object_type(object_id) =3D=3D QCOMTEE_OBJECT_TYPE_NUL=
L ||
> +           qcomtee_object_type(object_id) =3D=3D QCOMTEE_OBJECT_TYPE_TEE=
) {
> +               errno =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       object =3D qcomtee_local_object_get(object_id);
> +       if (object =3D=3D NULL_QCOMTEE_OBJECT) {
> +               errno =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       oic->object =3D object;
> +
> +       /* Filter bits used by transport. */
> +       op =3D msg->op & QCOMTEE_MSG_OBJECT_OP_MASK;
> +
> +       switch (op) {
> +       case QCOMTEE_MSG_OBJECT_OP_RELEASE:
> +               qcomtee_object_id_put(object_id);
> +               qcomtee_object_put(object);
> +               errno =3D 0;
> +
> +               break;
> +       case QCOMTEE_MSG_OBJECT_OP_RETAIN:
> +               qcomtee_object_get(object);
> +               errno =3D 0;
> +
> +               break;
> +       default:
> +               errno =3D qcomtee_prepare_args(oic);
> +               if (errno) {
> +                       /* Release any object that arrived as input. */
> +                       qcomtee_arg_for_each_input_buffer(i, oic->u)
> +                               qcomtee_object_put(oic->u[i].o);
> +
> +                       break;
> +               }
> +
> +               errno =3D object->ops->dispatch(oic, object, op, oic->u);
> +               if (!errno) {
> +                       /* On success, notify at the appropriate time. */
> +                       oic->flags |=3D QCOMTEE_OIC_FLAG_NOTIFY;
> +               }
> +       }
> +
> +out:
> +
> +       oic->errno =3D errno;
> +}
> +
> +/**
> + * qcomtee_qtee_objects_put() - Put the callback objects in the argument=
 array.
> + * @u: array of arguments.
> + *
> + * When qcomtee_object_do_invoke_internal() is successfully invoked,
> + * QTEE takes ownership of the callback objects. If the invocation fails=
,
> + * qcomtee_object_do_invoke_internal() calls qcomtee_qtee_objects_put()
> + * to mimic the release of callback objects by QTEE.
> + */
> +static void qcomtee_qtee_objects_put(struct qcomtee_arg *u)
> +{
> +       int i;
> +
> +       qcomtee_arg_for_each_input_object(i, u) {
> +               if (typeof_qcomtee_object(u[i].o) =3D=3D QCOMTEE_OBJECT_T=
YPE_CB)
> +                       qcomtee_object_put(u[i].o);
> +       }
> +}
> +
> +/**
> + * qcomtee_object_do_invoke_internal() - Submit an invocation for an obj=
ect.
> + * @oic: context to use for the current invocation.
> + * @object: object being invoked.
> + * @op: requested operation on the object.
> + * @u: array of arguments for the current invocation.
> + * @result: result returned from QTEE.
> + *
> + * The caller is responsible for keeping track of the refcount for each
> + * object, including @object. On return, the caller loses ownership of a=
ll
> + * input objects of type %QCOMTEE_OBJECT_TYPE_CB.
> + *
> + * Return: On success, returns 0. On error, returns -EAGAIN if invocatio=
n
> + * failed and the user may retry the invocation, -ENODEV on fatal failur=
e.
> + */
> +int qcomtee_object_do_invoke_internal(struct qcomtee_object_invoke_ctx *=
oic,
> +                                     struct qcomtee_object *object, u32 =
op,
> +                                     struct qcomtee_arg *u, int *result)
> +{
> +       struct qcomtee_msg_callback *cb_msg;
> +       struct qcomtee_object *qto;
> +       int i, ret, errno;
> +       u64 res_type;
> +
> +       /* Allocate inbound and outbound buffers. */
> +       if (qcomtee_msg_buffers_alloc(oic, u)) {
> +               qcomtee_qtee_objects_put(u);
> +
> +               return -EAGAIN;
> +       }
> +
> +       if (qcomtee_prepare_msg(oic, object, op, u)) {
> +               qcomtee_qtee_objects_put(u);
> +
> +               ret =3D -EAGAIN;
> +               goto out;
> +       }
> +
> +       /* Use input message buffer in 'oic'. */
> +       cb_msg =3D oic->out_msg.addr;
> +
> +       while (1) {
> +               if (oic->flags & QCOMTEE_OIC_FLAG_BUSY) {
> +                       errno =3D oic->errno;
> +                       if (!errno)
> +                               errno =3D qcomtee_update_msg(oic);
> +                       qcomtee_msg_set_result(cb_msg, errno);
> +               }
> +
> +               /* Invoke the remote object. */
> +               ret =3D qcomtee_object_invoke_ctx_invoke(oic, result, &re=
s_type);
> +
> +               if (oic->flags & QCOMTEE_OIC_FLAG_BUSY) {
> +                       qto =3D oic->object;
> +                       if (qto) {
> +                               if (oic->flags & QCOMTEE_OIC_FLAG_NOTIFY)=
 {
> +                                       /* Don't care about the exact err=
no. */
> +                                       if (qto->ops->notify)
> +                                               qto->ops->notify(oic, qto=
,
> +                                                                errno ||=
 ret);
> +                               }
> +
> +                               /* Get is in qcomtee_cb_object_invoke(). =
*/
> +                               qcomtee_object_put(qto);
> +                       }
> +
> +                       oic->object =3D NULL_QCOMTEE_OBJECT;
> +                       oic->flags &=3D ~(QCOMTEE_OIC_FLAG_BUSY |
> +                                       QCOMTEE_OIC_FLAG_NOTIFY);
> +               }
> +
> +               if (ret) {
> +                       if (!(oic->flags & QCOMTEE_OIC_FLAG_SHARED)) {
> +                               qcomtee_qtee_objects_put(u);
> +
> +                               ret =3D -EAGAIN;
> +                       } else {
> +                               /*
> +                                * On error, there is no clean way to exi=
t.
> +                                * For some reason, we cannot communicate=
 with
> +                                * QTEE, so we cannot notify QTEE about t=
he
> +                                * failure and do further cleanup.
> +                                */
> +                               ret =3D -ENODEV;
> +                       }
> +
> +                       goto out;
> +
> +               } else {
> +                       /*
> +                        * QTEE obtained ownership of QCOMTEE_OBJECT_TYPE=
_CB
> +                        * input objects in 'u'. On further failure, QTEE=
 is
> +                        * responsible for releasing them.
> +                        */
> +                       oic->flags |=3D QCOMTEE_OIC_FLAG_SHARED;
> +               }
> +
> +               /* Is it a callback request? */
> +               if (res_type !=3D QCOMTEE_RESULT_INBOUND_REQ_NEEDED) {
> +                       if (!*result) {
> +                               ret =3D qcomtee_update_args(u, oic);
> +                               if (ret) {
> +                                       /* Put output objects. Retry. */
> +                                       qcomtee_arg_for_each_output_objec=
t(i, u)
> +                                               qcomtee_object_put(u[i].o=
);
> +
> +                                       ret =3D -EAGAIN;
> +                               }
> +                       }
> +
> +                       break;
> +
> +               } else {
> +                       oic->flags |=3D QCOMTEE_OIC_FLAG_BUSY;
> +
> +                       qcomtee_fetch_async_reqs(oic);
> +                       qcomtee_cb_object_invoke(oic, cb_msg);
> +               }
> +       }
> +
> +       qcomtee_fetch_async_reqs(oic);
> +out:
> +       qcomtee_msg_buffers_free(oic);
> +
> +       return ret;
> +}
> +
> +int qcomtee_object_do_invoke(struct qcomtee_object_invoke_ctx *oic,
> +                            struct qcomtee_object *object, u32 op,
> +                            struct qcomtee_arg *u, int *result)
> +{
> +       /* User can not set bits used by transport. */
> +       if (op & ~QCOMTEE_MSG_OBJECT_OP_MASK)
> +               return -EINVAL;
> +
> +       /* User can only invoke QTEE hosted objects. */
> +       if (typeof_qcomtee_object(object) !=3D QCOMTEE_OBJECT_TYPE_TEE &&
> +           typeof_qcomtee_object(object) !=3D QCOMTEE_OBJECT_TYPE_ROOT)
> +               return -EINVAL;
> +
> +       /* User cannot directly issue these operations to QTEE. */
> +       if (op =3D=3D QCOMTEE_MSG_OBJECT_OP_RELEASE)
> +               return -EINVAL;
> +
> +       return qcomtee_object_do_invoke_internal(oic, object, op, u, resu=
lt);
> +}
> +EXPORT_SYMBOL_GPL(qcomtee_object_do_invoke);
> diff --git a/drivers/tee/qcomtee/qcom_scm.c b/drivers/tee/qcomtee/qcom_sc=
m.c
> new file mode 100644
> index 000000000000..38a3d080f86d
> --- /dev/null
> +++ b/drivers/tee/qcomtee/qcom_scm.c
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#include <linux/firmware/qcom/qcom_scm.h>
> +
> +#include "qcomtee_private.h"
> +
> +int qcomtee_object_invoke_ctx_invoke(struct qcomtee_object_invoke_ctx *o=
ic,
> +                                    int *result, u64 *res_type)
> +{
> +       phys_addr_t out_msg_paddr;
> +       phys_addr_t in_msg_paddr;
> +       int ret;
> +       u64 res;
> +
> +       tee_shm_get_pa(oic->out_shm, 0, &out_msg_paddr);
> +       tee_shm_get_pa(oic->in_shm, 0, &in_msg_paddr);
> +       if (!(oic->flags & QCOMTEE_OIC_FLAG_BUSY)) {
> +               /* Direct QTEE object invocation. */
> +               ret =3D qcom_scm_qtee_invoke_smc(in_msg_paddr, oic->in_ms=
g.size,
> +                                              out_msg_paddr, oic->out_ms=
g.size,
> +                                              &res, res_type);
> +       } else {
> +               /* Submit callback response. */
> +               ret =3D qcom_scm_qtee_callback_response(out_msg_paddr,
> +                                                     oic->out_msg.size,
> +                                                     &res, res_type);
> +       }
> +
> +       if (ret)
> +               pr_err("QTEE returned with %d.\n", ret);
> +       else
> +               *result =3D (int)res;
> +
> +       return ret;
> +}
> diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcom=
tee_msg.h
> new file mode 100644
> index 000000000000..33a6b426153c
> --- /dev/null
> +++ b/drivers/tee/qcomtee/qcomtee_msg.h
> @@ -0,0 +1,239 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#ifndef QCOMTEE_MSG_H
> +#define QCOMTEE_MSG_H
> +
> +#include <linux/firmware/qcom/qcom_tee.h>
> +
> +/**
> + * DOC: ''Qualcomm TEE'' (QTEE) Transport Message
> + *
> + * There are two buffers shared with QTEE: inbound and outbound buffers.
> + * The inbound buffer is used for direct object invocation, and the outb=
ound
> + * buffer is used to make a request from QTEE to the kernel; i.e., a cal=
lback
> + * request.
> + *
> + * The unused tail of the outbound buffer is also used for sending and
> + * receiving asynchronous messages. An asynchronous message is independe=
nt of
> + * the current object invocation (i.e., contents of the inbound buffer) =
or
> + * callback request (i.e., the head of the outbound buffer); see
> + * qcomtee_get_async_buffer(). It is used by endpoints (QTEE or kernel) =
as an
> + * optimization to reduce the number of context switches between the sec=
ure and
> + * non-secure worlds.
> + *
> + * For instance, QTEE never sends an explicit callback request to releas=
e an
> + * object in the kernel. Instead, it sends asynchronous release messages=
 in the
> + * outbound buffer when QTEE returns from the previous direct object inv=
ocation,
> + * or appends asynchronous release messages after the current callback r=
equest.
> + *
> + * QTEE supports two types of arguments in a message: buffer and object
> + * arguments. Depending on the direction of data flow, they could be inp=
ut
> + * buffer (IO) to QTEE, output buffer (OB) from QTEE, input object (IO) =
to QTEE,
> + * or output object (OO) from QTEE. Object arguments hold object IDs. Bu=
ffer
> + * arguments hold (offset, size) pairs into the inbound or outbound buff=
ers.
> + *
> + * QTEE holds an object table for objects it hosts and exposes to the ke=
rnel.
> + * An object ID is an index to the object table in QTEE.
> + *
> + * For the direct object invocation message format in the inbound buffer=
, see
> + * &struct qcomtee_msg_object_invoke. For the callback request message f=
ormat
> + * in the outbound buffer, see &struct qcomtee_msg_callback. For the mes=
sage
> + * format for asynchronous messages in the outbound buffer, see
> + * &struct qcomtee_async_msg_hdr.
> + */
> +
> +/**
> + * define QCOMTEE_MSG_OBJECT_NS_BIT - Non-secure bit
> + *
> + * Object ID is a globally unique 32-bit number. IDs referencing objects
> + * in the kernel should have %QCOMTEE_MSG_OBJECT_NS_BIT set.
> + */
> +#define QCOMTEE_MSG_OBJECT_NS_BIT BIT(31)
> +
> +/* Static object IDs recognized by QTEE. */
> +#define QCOMTEE_MSG_OBJECT_NULL (0U)
> +#define QCOMTEE_MSG_OBJECT_ROOT (1U)
> +
> +/* Definitions from QTEE as part of the transport protocol. */
> +
> +/* qcomtee_msg_arg is an argument as recognized by QTEE. */
> +union qcomtee_msg_arg {
> +       struct {
> +               u32 offset;
> +               u32 size;
> +       } b;
> +       u32 o;
> +};
> +
> +/* BI and BO payloads in QTEE messages should be at 64-bit boundaries. *=
/
> +#define qcomtee_msg_offset_align(o) ALIGN((o), sizeof(u64))
> +
> +/* Operations for objects are 32-bit. Transport uses the upper 16 bits. =
*/
> +#define QCOMTEE_MSG_OBJECT_OP_MASK GENMASK(15, 0)
> +
> +/* Reserved Operation IDs sent to QTEE: */
> +/* QCOMTEE_MSG_OBJECT_OP_RELEASE - Reduces the refcount and releases the=
 object.
> + * QCOMTEE_MSG_OBJECT_OP_RETAIN  - Increases the refcount.
> + *
> + * These operation IDs are valid for all objects.
> + */
> +
> +#define QCOMTEE_MSG_OBJECT_OP_RELEASE (QCOMTEE_MSG_OBJECT_OP_MASK - 0)
> +#define QCOMTEE_MSG_OBJECT_OP_RETAIN  (QCOMTEE_MSG_OBJECT_OP_MASK - 1)
> +
> +/* Subset of operations supported by QTEE root object. */
> +
> +#define QCOMTEE_ROOT_OP_REGISTER_WITH_CREDENTIALS 5
> +#define QCOMTEE_ROOT_OP_NOTIFY_DOMAIN_CHANGE 4
> +#define QCOMTEE_ROOT_OP_ADCI_ACCEPT 8
> +#define QCOMTEE_ROOT_OP_ADCI_SHUTDOWN 9
> +
> +/* Response types as returned from qcomtee_object_invoke_ctx_invoke(). *=
/
> +
> +/* The message contains a callback request. */
> +#define QCOMTEE_RESULT_INBOUND_REQ_NEEDED 3
> +
> +/**
> + * struct qcomtee_msg_object_invoke - Direct object invocation message.
> + * @ctx: object ID hosted in QTEE.
> + * @op: operation for the object.
> + * @counts: number of different types of arguments in @args.
> + * @args: array of arguments.
> + *
> + * @counts consists of 4 * 4-bit fields. Bits 0 - 3 represent the number=
 of
> + * input buffers, bits 4 - 7 represent the number of output buffers,
> + * bits 8 - 11 represent the number of input objects, and bits 12 - 15
> + * represent the number of output objects. The remaining bits should be =
zero.
> + *
> + * The maximum number of arguments of each type is defined by
> + * %QCOMTEE_ARGS_PER_TYPE.
> + */
> +struct qcomtee_msg_object_invoke {
> +       u32 cxt;
> +       u32 op;
> +       u32 counts;
> +       union qcomtee_msg_arg args[];
> +};
> +
> +/**
> + * struct qcomtee_msg_callback - Callback request message.
> + * @result: result of operation @op on the object referenced by @cxt.
> + * @cxt: object ID hosted in the kernel.
> + * @op: operation for the object.
> + * @counts: number of different types of arguments in @args.
> + * @args: array of arguments.
> + *
> + * For details of @counts, see &qcomtee_msg_object_invoke.counts.
> + */
> +struct qcomtee_msg_callback {
> +       u32 result;
> +       u32 cxt;
> +       u32 op;
> +       u32 counts;
> +       union qcomtee_msg_arg args[];
> +};
> +
> +/* Offset in the message for the beginning of the buffer argument's cont=
ents. */
> +#define qcomtee_msg_buffer_args(t, n) \
> +       qcomtee_msg_offset_align(struct_size_t(t, args, n))
> +/* Pointer to the beginning of a buffer argument's content at an offset.=
 */
> +#define qcomtee_msg_offset_to_ptr(m, off) ((void *)&((char *)(m))[(off)]=
)
> +
> +/* Some helpers to manage msg.counts. */
> +
> +#define QCOMTEE_MSG_NUM_IB(x) ((x) & 0xfU)
> +#define QCOMTEE_MSG_NUM_OB(x) (((x) >> 4) & 0xfU)
> +#define QCOMTEE_MSG_NUM_IO(x) (((x) >> 8) & 0xfU)
> +#define QCOMTEE_MSG_NUM_OO(x) (((x) >> 12) & 0xfU)
> +
> +#define QCOMTEE_MSG_IDX_IB(x) (0U)
> +#define QCOMTEE_MSG_IDX_OB(x) (QCOMTEE_MSG_IDX_IB(x) + QCOMTEE_MSG_NUM_I=
B(x))
> +#define QCOMTEE_MSG_IDX_IO(x) (QCOMTEE_MSG_IDX_OB(x) + QCOMTEE_MSG_NUM_O=
B(x))
> +#define QCOMTEE_MSG_IDX_OO(x) (QCOMTEE_MSG_IDX_IO(x) + QCOMTEE_MSG_NUM_I=
O(x))
> +
> +#define qcomtee_msg_for_each(i, c, type)    \
> +       for (i =3D QCOMTEE_MSG_IDX_##type(c); \
> +            i < (QCOMTEE_MSG_IDX_##type(c) + QCOMTEE_MSG_NUM_##type(c));=
 i++)
> +
> +#define qcomtee_msg_for_each_input_buffer(i, m) \
> +       qcomtee_msg_for_each(i, (m)->counts, IB)
> +#define qcomtee_msg_for_each_output_buffer(i, m) \
> +       qcomtee_msg_for_each(i, (m)->counts, OB)
> +#define qcomtee_msg_for_each_input_object(i, m) \
> +       qcomtee_msg_for_each(i, (m)->counts, IO)
> +#define qcomtee_msg_for_each_output_object(i, m) \
> +       qcomtee_msg_for_each(i, (m)->counts, OO)
> +
> +/* Sum of arguments in a message. */
> +#define qcomtee_msg_args(m) \
> +       (QCOMTEE_MSG_IDX_OO((m)->counts) + QCOMTEE_MSG_NUM_OO((m)->counts=
))
> +
> +static inline void qcomtee_msg_init(struct qcomtee_msg_object_invoke *ms=
g,
> +                                   u32 cxt, u32 op, int in_buffer,
> +                                   int out_buffer, int in_object,
> +                                   int out_object)
> +{
> +       msg->counts |=3D (in_buffer & 0xfU);
> +       msg->counts |=3D ((out_buffer - in_buffer) & 0xfU) << 4;
> +       msg->counts |=3D ((in_object - out_buffer) & 0xfU) << 8;
> +       msg->counts |=3D ((out_object - in_object) & 0xfU) << 12;
> +       msg->cxt =3D cxt;
> +       msg->op =3D op;
> +}
> +
> +/* Generic error codes. */
> +#define QCOMTEE_MSG_OK                 0    /* non-specific success code=
. */
> +#define QCOMTEE_MSG_ERROR              1    /* non-specific error. */
> +#define QCOMTEE_MSG_ERROR_INVALID      2    /* unsupported/unrecognized =
request. */
> +#define QCOMTEE_MSG_ERROR_SIZE_IN      3    /* supplied buffer/string to=
o large. */
> +#define QCOMTEE_MSG_ERROR_SIZE_OUT     4    /* supplied output buffer to=
o small. */
> +#define QCOMTEE_MSG_ERROR_USERBASE     10   /* start of user-defined err=
or range. */
> +
> +/* Transport layer error codes. */
> +#define QCOMTEE_MSG_ERROR_DEFUNCT      -90  /* object no longer exists. =
*/
> +#define QCOMTEE_MSG_ERROR_ABORT                -91  /* calling thread mu=
st exit. */
> +#define QCOMTEE_MSG_ERROR_BADOBJ       -92  /* invalid object context. *=
/
> +#define QCOMTEE_MSG_ERROR_NOSLOTS      -93  /* caller's object table ful=
l. */
> +#define QCOMTEE_MSG_ERROR_MAXARGS      -94  /* too many args. */
> +#define QCOMTEE_MSG_ERROR_MAXDATA      -95  /* buffers too large. */
> +#define QCOMTEE_MSG_ERROR_UNAVAIL      -96  /* the request could not be =
processed. */
> +#define QCOMTEE_MSG_ERROR_KMEM         -97  /* kernel out of memory. */
> +#define QCOMTEE_MSG_ERROR_REMOTE       -98  /* local method sent to remo=
te object. */
> +#define QCOMTEE_MSG_ERROR_BUSY         -99  /* Object is busy. */
> +#define QCOMTEE_MSG_ERROR_TIMEOUT      -103 /* Call Back Object invocati=
on timed out. */
> +
> +static inline void qcomtee_msg_set_result(struct qcomtee_msg_callback *c=
b_msg,
> +                                         int err)
> +{
> +       if (!err) {
> +               cb_msg->result =3D QCOMTEE_MSG_OK;
> +       } else if (err < 0) {
> +               /* If err < 0, then it is a transport error. */
> +               switch (err) {
> +               case -ENOMEM:
> +                       cb_msg->result =3D QCOMTEE_MSG_ERROR_KMEM;
> +                       break;
> +               case -ENODEV:
> +                       cb_msg->result =3D QCOMTEE_MSG_ERROR_DEFUNCT;
> +                       break;
> +               case -ENOSPC:
> +               case -EBUSY:
> +                       cb_msg->result =3D QCOMTEE_MSG_ERROR_BUSY;
> +                       break;
> +               case -EBADF:
> +               case -EINVAL:
> +                       cb_msg->result =3D QCOMTEE_MSG_ERROR_UNAVAIL;
> +                       break;
> +               default:
> +                       cb_msg->result =3D QCOMTEE_MSG_ERROR;
> +               }
> +       } else {
> +               /* If err > 0, then it is user defined error, pass it as =
is. */
> +               cb_msg->result =3D err;
> +       }
> +}
> +
> +#endif /* QCOMTEE_MSG_H */
> diff --git a/drivers/tee/qcomtee/qcomtee_private.h b/drivers/tee/qcomtee/=
qcomtee_private.h
> new file mode 100644
> index 000000000000..ab3acad40359
> --- /dev/null
> +++ b/drivers/tee/qcomtee/qcomtee_private.h
> @@ -0,0 +1,222 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#ifndef QCOMTEE_PRIVATE_H
> +#define QCOMTEE_PRIVATE_H
> +
> +#include <linux/firmware/qcom/qcom_tee.h>
> +#include <linux/kobject.h>
> +#include <linux/tee_core.h>
> +
> +#include "qcomtee_msg.h"
> +
> +/* Flags relating to object reference. */
> +#define QCOMTEE_OBJREF_FLAG_TEE BIT(0)
> +#define QCOMTEE_OBJREF_FLAG_USER BIT(1)
> +
> +/**
> + * struct qcomtee - Main service struct.
> + * @teedev: client device.
> + * @pool: shared memory pool.
> + * @ctx: driver private context.
> + * @wq: workqueue for QTEE async operations.
> + */
> +struct qcomtee {
> +       struct tee_device *teedev;
> +       struct tee_shm_pool *pool;
> +       struct tee_context *ctx;
> +       struct workqueue_struct *wq;
> +};
> +
> +struct qcomtee_object *qcomtee_idx_erase(u32 idx);
> +void qcomtee_qtee_object_free(struct qcomtee_object *object);
> +void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic);
> +void qcomtee_release_tee_object(struct qcomtee_object *object);
> +
> +struct tee_shm_pool *qcomtee_shm_pool_alloc(void);
> +void qcomtee_msg_buffers_free(struct qcomtee_object_invoke_ctx *oic);
> +int qcomtee_msg_buffers_alloc(struct qcomtee_object_invoke_ctx *oic,
> +                             struct qcomtee_arg *u);
> +
> +int qcomtee_object_invoke_ctx_invoke(struct qcomtee_object_invoke_ctx *o=
ic,
> +                                    int *result, u64 *res_type);
> +
> +/**
> + * qcomtee_object_do_invoke_internal() - Submit an invocation for an obj=
ect.
> + * @oic: context to use for the current invocation.
> + * @object: object being invoked.
> + * @op: requested operation on the object.
> + * @u: array of arguments for the current invocation.
> + * @result: result returned from QTEE.
> + *
> + * The caller is responsible for keeping track of the refcount for each
> + * object, including @object. On return, the caller loses ownership of a=
ll
> + * input objects of type %QCOMTEE_OBJECT_TYPE_CB.
> + *
> + * Return: On success, returns 0. On error, returns -EAGAIN if invocatio=
n
> + * failed and the user may retry the invocation, -ENODEV on fatal failur=
e.
> + */
> +int qcomtee_object_do_invoke_internal(struct qcomtee_object_invoke_ctx *=
oic,
> +                                     struct qcomtee_object *object, u32 =
op,
> +                                     struct qcomtee_arg *u, int *result)=
;
> +
> +/**
> + * struct qcomtee_context_data - Clients' or supplicants' context.
> + * @qtee_objects_idr: QTEE objects in this context.
> + * @qtee_lock: spinlock for @qtee_objects_idr.
> + * @reqs_idr: requests currently being processed in this context.
> + * @reqs_list: FIFO for requests.
> + * @reqs_lock: mutex for @reqs_idr, @reqs_list and request states.
> + * @req_c: completion used when the supplicant is waiting for requests.
> + * @released: state of this context.
> + */
> +struct qcomtee_context_data {
> +       struct idr qtee_objects_idr;
> +       /* Synchronize access to @qtee_objects_idr. */
> +       spinlock_t qtee_lock;
> +
> +       struct idr reqs_idr;
> +       struct list_head reqs_list;
> +       /* Synchronize access to @reqs_idr, @reqs_list and updating reque=
sts states. */
> +       struct mutex reqs_lock;
> +
> +       struct completion req_c;
> +
> +       int released;

Should this rather be a bool, or an enum depending on how many
different states it's supposed to have?

> +};
> +
> +/**
> + * qcomtee_context_add_qtee_object() - Add a QTEE object to the context.
> + * @param: TEE parameter representing @object.
> + * @object: QTEE object.
> + * @ctx: context to add the object.
> + *
> + * It assumes @object is %QCOMTEE_OBJECT_TYPE_TEE and the caller has alr=
eady
> + * issued qcomtee_object_get() for @object.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_context_add_qtee_object(struct tee_param *param,
> +                                   struct qcomtee_object *object,
> +                                   struct tee_context *ctx);
> +
> +/* Retrieve the QTEE object added with qcomtee_context_add_qtee_object()=
. */
> +int qcomtee_context_find_qtee_object(struct qcomtee_object **object,
> +                                    struct tee_param *param,
> +                                    struct tee_context *ctx);
> +
> +/**
> + * qcomtee_context_del_qtee_object() - Delete a QTEE object from the con=
text.
> + * @param: TEE parameter representing @object.
> + * @ctx: context for deleting the object.
> + *
> + * The @param has been initialized by qcomtee_context_add_qtee_object().
> + */
> +void qcomtee_context_del_qtee_object(struct tee_param *param,
> +                                    struct tee_context *ctx);
> +
> +/**
> + * qcomtee_objref_to_arg() - Convert OBJREF parameter to QTEE argument.
> + * @arg: QTEE argument.
> + * @param: TEE parameter.
> + * @ctx: context in which the conversion should happen.
> + *
> + * It assumes @param is an OBJREF.
> + * It does not set @arg.type; the caller should initialize it to a corre=
ct
> + * &enum qcomtee_arg_type value. It gets the object's refcount in @arg;
> + * the caller should manage to put it afterward.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_objref_to_arg(struct qcomtee_arg *arg, struct tee_param *par=
am,
> +                         struct tee_context *ctx);
> +
> +/**
> + * qcomtee_objref_from_arg() - Convert QTEE argument to OBJREF param.
> + * @param: TEE parameter.
> + * @arg: QTEE argument.
> + * @ctx: context in which the conversion should happen.
> + *
> + * It assumes @arg is of %QCOMTEE_ARG_TYPE_IO or %QCOMTEE_ARG_TYPE_OO.
> + * It does not set @param.attr; the caller should initialize it to a
> + * correct type.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg =
*arg,
> +                           struct tee_context *ctx);
> +
> +/* OBJECTS: */
> +
> +/* (1) User Object API. */
> +
> +/* Is it a user object? */
> +int is_qcomtee_user_object(struct qcomtee_object *object);
> +
> +/* Set the user object's 'notify on release' flag. */
> +void qcomtee_user_object_set_notify(struct qcomtee_object *object, bool =
notify);
> +
> +/* This is called when there are no more users for the ctxdata. */
> +void qcomtee_requests_destroy(struct qcomtee_context_data *ctxdata);
> +
> +/**
> + * qcomtee_user_param_to_object() - OBJREF parameter to &struct qcomtee_=
object.
> + * @object: object returned.
> + * @param: TEE parameter.
> + * @ctx: context in which the conversion should happen.
> + *
> + * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_USER flags.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_user_param_to_object(struct qcomtee_object **object,
> +                                struct tee_param *param,
> +                                struct tee_context *ctx);
> +
> +/* Reverse what qcomtee_user_param_to_object() does. */
> +int qcomtee_user_param_from_object(struct tee_param *param,
> +                                  struct qcomtee_object *object,
> +                                  struct tee_context *ctx);
> +
> +struct qcomtee_user_object_request_data {
> +       int id; /* ID assigned to the request. */
> +       u64 object_id; /* Object ID being invoked by QTEE. */
> +       u32 op; /* Requested operation on object. */
> +       int np; /* Number of parameters in the request.*/
> +};
> +
> +/**
> + * qcomtee_user_object_select() - Select a request for a user object.
> + * @ctx: context to look for a user object.
> + * @params: parameters for @op.
> + * @num_params: number of elements in the parameter array.
> + * @uaddr: user buffer for output UBUF parameters.
> + * @size: size of user buffer @uaddr.
> + * @data: information for the selected request.
> + *
> + * @params is filled along with @data for the selected request.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_user_object_select(struct tee_context *ctx,
> +                              struct tee_param *params, int num_params,
> +                              void __user *uaddr, size_t size,
> +                              struct qcomtee_user_object_request_data *d=
ata);
> +
> +/**
> + * qcomtee_user_object_submit() - Submit a response for a user object.
> + * @ctx: context to look for a user object.
> + * @params: returned parameters.
> + * @num_params: number of elements in the parameter array.
> + * @req_id: request ID for the response.
> + * @errno: result of user object invocation.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_user_object_submit(struct tee_context *ctx,
> +                              struct tee_param *params, int num_params,
> +                              int req_id, int errno);
> +
> +#endif /* QCOMTEE_PRIVATE_H */
> diff --git a/drivers/tee/qcomtee/release.c b/drivers/tee/qcomtee/release.=
c
> new file mode 100644
> index 000000000000..7d149ef3d26f
> --- /dev/null
> +++ b/drivers/tee/qcomtee/release.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#include "qcomtee_private.h"
> +
> +static void qcomtee_destroy_user_object(struct work_struct *work)
> +{
> +       struct qcomtee_object *object;
> +       struct qcomtee *qcomtee;
> +       int ret, result;
> +
> +       static struct qcomtee_object_invoke_ctx oic;
> +       /* RELEASE does not require any argument. */
> +       static struct qcomtee_arg args[] =3D { { .type =3D QCOMTEE_ARG_TY=
PE_INV } };
> +
> +       object =3D container_of(work, struct qcomtee_object, work);
> +       qcomtee =3D tee_get_drvdata(object->info.qcomtee_async_ctx->teede=
v);
> +       /* Get the TEE context used for asynchronous operations. */
> +       oic.ctx =3D object->info.qcomtee_async_ctx;
> +
> +       ret =3D qcomtee_object_do_invoke_internal(&oic, object,
> +                                               QCOMTEE_MSG_OBJECT_OP_REL=
EASE,
> +                                               args, &result);
> +
> +       /* Is it safe to retry the release? */
> +       if (ret =3D=3D -EAGAIN) {
> +               queue_work(qcomtee->wq, &object->work);
> +       } else {
> +               if (ret || result)
> +                       pr_err("%s: %s release failed, ret =3D %d (%x).\n=
",
> +                              __func__, qcomtee_object_name(object), ret=
,
> +                              result);
> +
> +               qcomtee_qtee_object_free(object);
> +       }
> +}
> +
> +/* qcomtee_release_tee_object puts object in release work queue. */
> +void qcomtee_release_tee_object(struct qcomtee_object *object)
> +{
> +       struct qcomtee *qcomtee =3D
> +               tee_get_drvdata(object->info.qcomtee_async_ctx->teedev);
> +
> +       INIT_WORK(&object->work, qcomtee_destroy_user_object);
> +       queue_work(qcomtee->wq, &object->work);
> +}
> diff --git a/drivers/tee/qcomtee/shm.c b/drivers/tee/qcomtee/shm.c
> new file mode 100644
> index 000000000000..998aabe96434
> --- /dev/null
> +++ b/drivers/tee/qcomtee/shm.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/firmware/qcom/qcom_tzmem.h>
> +#include <linux/mm.h>
> +
> +#include "qcomtee_msg.h"
> +#include "qcomtee_private.h"
> +
> +/**
> + * define MAX_OUTBOUND_BUFFER_SIZE - Maximum size of outbound buffers.
> + *
> + * The size of outbound buffer depends on QTEE callback requests.
> + * If an invocation requires any size larger than %MAX_OUTBOUND_BUFFER_S=
IZE,
> + * the user should probably use some other form of shared memory with QT=
EE.
> + */
> +#define MAX_OUTBOUND_BUFFER_SIZE SZ_4K
> +
> +/* Same as %MAX_OUTBOUND_BUFFER_SIZE but for inbound buffer. */
> +#define MAX_INBOUND_BUFFER_SIZE SZ_4M
> +
> +/**
> + * qcomtee_msg_buffers_alloc() - Allocate inbound and outbound buffers.
> + * @oic: context to use for the current invocation.
> + * @u: array of arguments for the current invocation.
> + *
> + * It calculates the size of inbound and outbound buffers based on the
> + * arguments in @u. It allocates the buffers from the teedev pool.
> + *
> + * Return: On success, returns 0. On error, returns < 0.
> + */
> +int qcomtee_msg_buffers_alloc(struct qcomtee_object_invoke_ctx *oic,
> +                             struct qcomtee_arg *u)
> +{
> +       struct tee_context *ctx =3D oic->ctx;
> +       struct tee_shm *shm;
> +       size_t size;
> +       int i;
> +
> +       /* Start offset in a message for buffer arguments. */
> +       size =3D qcomtee_msg_buffer_args(struct qcomtee_msg_object_invoke=
,
> +                                      qcomtee_args_len(u));
> +       if (size > MAX_INBOUND_BUFFER_SIZE)
> +               return -EINVAL;
> +
> +       /* Add size of IB arguments. */
> +       qcomtee_arg_for_each_input_buffer(i, u) {
> +               size =3D size_add(size, qcomtee_msg_offset_align(u[i].b.s=
ize));
> +               if (size > MAX_INBOUND_BUFFER_SIZE)
> +                       return -EINVAL;
> +       }
> +
> +       /* Add size of OB arguments. */
> +       qcomtee_arg_for_each_output_buffer(i, u) {
> +               size =3D size_add(size, qcomtee_msg_offset_align(u[i].b.s=
ize));
> +               if (size > MAX_INBOUND_BUFFER_SIZE)
> +                       return -EINVAL;
> +       }
> +
> +       shm =3D tee_shm_alloc_priv_buf(ctx, size);
> +       if (IS_ERR(shm))
> +               return PTR_ERR(shm);
> +
> +       /* Allocate inbound buffer. */
> +       oic->in_shm =3D shm;
> +       shm =3D tee_shm_alloc_priv_buf(ctx, MAX_OUTBOUND_BUFFER_SIZE);
> +       if (IS_ERR(shm)) {
> +               tee_shm_free(oic->in_shm);
> +
> +               return PTR_ERR(shm);
> +       }
> +       /* Allocate outbound buffer. */
> +       oic->out_shm =3D shm;
> +
> +       oic->in_msg.addr =3D tee_shm_get_va(oic->in_shm, 0);
> +       oic->in_msg.size =3D tee_shm_get_size(oic->in_shm);
> +       oic->out_msg.addr =3D tee_shm_get_va(oic->out_shm, 0);
> +       oic->out_msg.size =3D tee_shm_get_size(oic->out_shm);
> +       /* QTEE assume unused buffers are zeroed. */
> +       memzero_explicit(oic->in_msg.addr, oic->in_msg.size);
> +       memzero_explicit(oic->out_msg.addr, oic->out_msg.size);
> +
> +       return 0;
> +}
> +
> +void qcomtee_msg_buffers_free(struct qcomtee_object_invoke_ctx *oic)
> +{
> +       tee_shm_free(oic->in_shm);
> +       tee_shm_free(oic->out_shm);
> +}
> +
> +/* Dynamic shared memory pool based on tee_dyn_shm_alloc_helper(). */
> +
> +static int qcomtee_shm_register(struct tee_context *ctx, struct tee_shm =
*shm,
> +                               struct page **pages, size_t num_pages,
> +                               unsigned long start)
> +{
> +       return qcom_tzmem_shm_bridge_create(shm->paddr, shm->size,
> +                                           &shm->sec_world_id);
> +}
> +
> +static int qcomtee_shm_unregister(struct tee_context *ctx, struct tee_sh=
m *shm)
> +{
> +       qcom_tzmem_shm_bridge_delete(shm->sec_world_id);
> +
> +       return 0;
> +}
> +
> +static int pool_op_alloc(struct tee_shm_pool *pool, struct tee_shm *shm,
> +                        size_t size, size_t align)
> +{
> +       if (!(shm->flags & TEE_SHM_PRIV))
> +               return -ENOMEM;
> +
> +       return tee_dyn_shm_alloc_helper(shm, size, align, qcomtee_shm_reg=
ister);
> +}
> +
> +static void pool_op_free(struct tee_shm_pool *pool, struct tee_shm *shm)
> +{
> +       tee_dyn_shm_free_helper(shm, qcomtee_shm_unregister);
> +}
> +
> +static void pool_op_destroy_pool(struct tee_shm_pool *pool)
> +{
> +       kfree(pool);
> +}
> +
> +static const struct tee_shm_pool_ops pool_ops =3D {
> +       .alloc =3D pool_op_alloc,
> +       .free =3D pool_op_free,
> +       .destroy_pool =3D pool_op_destroy_pool,
> +};
> +
> +struct tee_shm_pool *qcomtee_shm_pool_alloc(void)
> +{
> +       struct tee_shm_pool *pool;
> +
> +       pool =3D kzalloc(sizeof(*pool), GFP_KERNEL);
> +       if (!pool)
> +               return ERR_PTR(-ENOMEM);
> +
> +       pool->ops =3D &pool_ops;
> +
> +       return pool;
> +}
> diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user_ob=
j.c
> new file mode 100644
> index 000000000000..95d22e720de7
> --- /dev/null
> +++ b/drivers/tee/qcomtee/user_obj.c
> @@ -0,0 +1,710 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/slab.h>
> +#include "qcomtee_private.h"
> +
> +/**
> + * DOC: User Objects aka Supplicants
> + *
> + * Any userspace process with access to the TEE device file can behave a=
s a
> + * supplicant by creating a user object. Any TEE parameter of type OBJRE=
F with
> + * %QCOMTEE_OBJREF_FLAG_USER flag set is considered a user object.
> + *
> + * A supplicant uses qcomtee_user_object_select() (i.e. TEE_IOC_SUPPL_RE=
CV) to
> + * receive a QTEE user object request and qcomtee_user_object_submit()
> + * (i.e. TEE_IOC_SUPPL_SEND) to submit a response. QTEE expects to recei=
ve the
> + * response, including OB and OO in a specific order in the message; par=
ameters
> + * submitted with qcomtee_user_object_submit() should maintain this orde=
r.
> + */
> +
> +/**
> + * struct qcomtee_user_object - User object.
> + * @object: &struct qcomtee_object representing this user object.
> + * @ctx: context for which the user object is defined.
> + * @object_id: object ID in @ctx.
> + * @nor: notify on release.
> + *
> + * Any object managed in userspace is represented by this struct.
> + * If @nor is set, a notification message is sent back to userspace
> + * upon release.
> + */
> +struct qcomtee_user_object {
> +       struct qcomtee_object object;
> +       struct tee_context *ctx;
> +       u64 object_id;
> +       bool nor;
> +};
> +
> +#define to_qcomtee_user_object(o) \
> +       container_of((o), struct qcomtee_user_object, object)
> +
> +static struct qcomtee_object_operations qcomtee_user_object_ops;
> +
> +/* Is it a user object? */
> +int is_qcomtee_user_object(struct qcomtee_object *object)
> +{
> +       return object !=3D NULL_QCOMTEE_OBJECT &&
> +              typeof_qcomtee_object(object) =3D=3D QCOMTEE_OBJECT_TYPE_C=
B &&
> +              object->ops =3D=3D &qcomtee_user_object_ops;
> +}
> +
> +/* Set the user object's 'notify on release' flag. */
> +void qcomtee_user_object_set_notify(struct qcomtee_object *object, bool =
notify)
> +{
> +       if (is_qcomtee_user_object(object))
> +               to_qcomtee_user_object(object)->nor =3D notify;
> +}
> +
> +/* Supplicant Requests: */
> +
> +/**
> + * enum qcomtee_req_state - Current state of request.
> + * @QCOMTEE_REQ_QUEUED: Request is waiting for supplicant.
> + * @QCOMTEE_REQ_PROCESSING: Request has been picked by the supplicant.
> + * @QCOMTEE_REQ_PROCESSED: Response has been submitted for the request.
> + */
> +enum qcomtee_req_state {
> +       QCOMTEE_REQ_QUEUED =3D 1,
> +       QCOMTEE_REQ_PROCESSING,
> +       QCOMTEE_REQ_PROCESSED,
> +};
> +
> +/* User requests sent to supplicants. */
> +struct qcomtee_ureq {
> +       enum qcomtee_req_state state;
> +
> +       /* User Request: */
> +       int req_id;
> +       u64 object_id;
> +       u32 op;
> +       struct qcomtee_arg *args;
> +       int errno;
> +
> +       struct list_head node;
> +       struct completion c; /* Completion for whoever wait. */
> +};
> +
> +/*
> + * Placeholder for a PROCESSING request in qcomtee_context.reqs_idr.
> + *
> + * If the thread that calls qcomtee_object_invoke() dies and the supplic=
ant
> + * is processing the request, we replace the entry in qcomtee_context.re=
qs_idr
> + * with empty_ureq. This ensures that (1) the req_id remains busy and is=
 not
> + * reused, and (2) the supplicant fails to submit the response and perfo=
rms
> + * the necessary rollback.
> + */
> +static struct qcomtee_ureq empty_ureq =3D { .state =3D QCOMTEE_REQ_PROCE=
SSING };
> +
> +/* Enqueue a user request for a context and assign a request ID. */
> +static int ureq_enqueue(struct qcomtee_context_data *ctxdata,
> +                       struct qcomtee_ureq *ureq)
> +{
> +       int ret;
> +
> +       guard(mutex)(&ctxdata->reqs_lock);
> +       /* Supplicant is dying. */
> +       if (ctxdata->released)
> +               return -ENODEV;
> +
> +       /* Allocate an ID and queue the request. */
> +       ret =3D idr_alloc(&ctxdata->reqs_idr, ureq, 0, 0, GFP_KERNEL);
> +       if (ret < 0)
> +               return ret;
> +
> +       ureq->req_id =3D ret;
> +       ureq->state =3D QCOMTEE_REQ_QUEUED;
> +       list_add_tail(&ureq->node, &ctxdata->reqs_list);
> +
> +       return 0;
> +}
> +
> +/**
> + * ureq_dequeue() - Dequeue a user request from a context.
> + * @ctxdata: context data for a context to dequeue the request.
> + * @req_id: ID of the request to be dequeued.
> + *
> + * It dequeues a user request and releases its request ID.
> + *
> + * Context: The caller should hold &qcomtee_context_data->reqs_lock.
> + * Return: Returns the user request associated with this ID; otherwise, =
NULL.
> + */
> +static struct qcomtee_ureq *ureq_dequeue(struct qcomtee_context_data *ct=
xdata,
> +                                        int req_id)
> +{
> +       struct qcomtee_ureq *ureq;
> +
> +       ureq =3D idr_remove(&ctxdata->reqs_idr, req_id);
> +       if (ureq =3D=3D &empty_ureq || !ureq)
> +               return NULL;
> +
> +       list_del(&ureq->node);
> +
> +       return ureq;
> +}
> +
> +/**
> + * ureq_replace() - Replace a user request.
> + * @ctxdata: context data for a context to replace the request.
> + * @ureq: request to be replaced.
> + * @ureq_new: request to replace it with.
> + *
> + * Context: The caller should hold &qcomtee_context_data->reqs_lock.
> + */
> +static void ureq_replace(struct qcomtee_context_data *ctxdata,
> +                        struct qcomtee_ureq *ureq,
> +                        struct qcomtee_ureq *ureq_new)
> +{
> +       idr_replace(&ctxdata->reqs_idr, ureq_new, ureq->req_id);
> +       /* ureq does not have a valid ID anymore; remove it from the queu=
e. */
> +       list_del(&ureq->node);
> +}
> +
> +/**
> + * ureq_select() - Select the next request in a context.
> + * @ctxdata: context data for a context to pop a request.
> + * @ubuf_size: size of the available buffer for UBUF parameters.
> + * @num_params: number of entries for the TEE parameter array.
> + *
> + * It checks if @num_params is large enough to fit the next request argu=
ments.
> + * It checks if @ubuf_size is large enough to fit IB buffer arguments.
> + *
> + * Context: The caller should hold &qcomtee_context_data->reqs_lock.
> + * Return: On success, returns a request;
> + *         on failure, returns NULL and ERR_PTR.
> + */
> +static struct qcomtee_ureq *ureq_select(struct qcomtee_context_data *ctx=
data,
> +                                       size_t ubuf_size, int num_params)
> +{
> +       struct qcomtee_ureq *req, *ureq =3D NULL;
> +       struct qcomtee_arg *u;
> +       int i;
> +
> +       /* Find the a queued request. */
> +       list_for_each_entry(req, &ctxdata->reqs_list, node) {
> +               if (req->state =3D=3D QCOMTEE_REQ_QUEUED) {
> +                       ureq =3D req;
> +                       break;
> +               }
> +       }
> +
> +       if (!ureq)
> +               return NULL;
> +
> +       u =3D ureq->args;
> +       /* (1) Is there enough TEE parameters? */
> +       if (num_params < qcomtee_args_len(u))
> +               return ERR_PTR(-EINVAL);
> +       /* (2) Is there enough space to pass input buffers? */
> +       qcomtee_arg_for_each_input_buffer(i, u) {
> +               ubuf_size =3D size_sub(ubuf_size, u[i].b.size);
> +               if (ubuf_size =3D=3D SIZE_MAX)
> +                       return ERR_PTR(-EINVAL);
> +
> +               ubuf_size =3D round_down(ubuf_size, 8);
> +       }
> +
> +       return ureq;
> +}
> +
> +/* This is called when there are no more users for the ctxdata. */
> +void qcomtee_requests_destroy(struct qcomtee_context_data *ctxdata)
> +{
> +       struct qcomtee_ureq *req, *ureq;
> +
> +       guard(mutex)(&ctxdata->reqs_lock);
> +       /* So ureq_enqueue() refuses new requests from QTEE. */
> +       ctxdata->released =3D 1;

Magic number?

> +
> +       list_for_each_entry_safe(ureq, req, &ctxdata->reqs_list, node) {
> +               ureq_dequeue(ctxdata, ureq->req_id);
> +
> +               /*
> +                * Terminate requests.
> +                * Depending on who enqueues the ureq, there may be someo=
ne
> +                * waiting for the response or not:
> +                */
> +               if (ureq->op !=3D QCOMTEE_MSG_OBJECT_OP_RELEASE) {
> +                       /* (1) enqueued by qcomtee_user_object_dispatch()=
. */
> +                       ureq->state =3D QCOMTEE_REQ_PROCESSED;
> +                       ureq->errno =3D -ENODEV;
> +
> +                       complete(&ureq->c);
> +               } else {
> +                       /* (2) enqueued by qcomtee_user_object_release().=
 */
> +                       kfree(ureq);
> +               }
> +       }
> +}
> +
> +/* User Object API. */
> +
> +/* User object dispatcher. */
> +static int qcomtee_user_object_dispatch(struct qcomtee_object_invoke_ctx=
 *oic,
> +                                       struct qcomtee_object *object, u3=
2 op,
> +                                       struct qcomtee_arg *args)
> +{
> +       struct qcomtee_user_object *uo =3D to_qcomtee_user_object(object)=
;
> +       struct qcomtee_context_data *ctxdata =3D uo->ctx->data;
> +       struct qcomtee_ureq *ureq __free(kfree) =3D NULL;
> +       int errno;
> +
> +       ureq =3D kzalloc(sizeof(*ureq), GFP_KERNEL);
> +       if (!ureq)
> +               return -ENOMEM;
> +
> +       init_completion(&ureq->c);
> +       ureq->object_id =3D uo->object_id;
> +       ureq->op =3D op;
> +       ureq->args =3D args;
> +
> +       /* Queue the request. */
> +       if (ureq_enqueue(ctxdata, ureq))
> +               return -ENODEV;
> +
> +       /* Wakeup supplicant to process it. */
> +       complete(&ctxdata->req_c);
> +
> +       /*
> +        * Wait for the supplicant to process the request.
> +        *
> +        * The supplicant is expected to process the request in a timely =
manner.
> +        * We wait as KILLABLE in case the supplicant and invoke thread a=
re
> +        * both running from the same user process; otherwise, the proces=
s
> +        * will be stuck on a fatal signal.
> +        */
> +       if (!wait_for_completion_state(&ureq->c,
> +                                      TASK_KILLABLE | TASK_FREEZABLE)) {
> +               errno =3D ureq->errno;
> +               /* On success, notify() frees the request. */
> +               if (!errno)
> +                       oic->data =3D no_free_ptr(ureq);
> +       } else {
> +               enum qcomtee_req_state prev_state;
> +
> +               errno =3D -ENODEV;
> +
> +               scoped_guard(mutex, &ctxdata->reqs_lock) {
> +                       prev_state =3D ureq->state;
> +
> +                       /* Replace with empty_ureq to keep req_id reserve=
d. */
> +                       if (prev_state =3D=3D QCOMTEE_REQ_PROCESSING)
> +                               ureq_replace(ctxdata, ureq, &empty_ureq);
> +
> +                       /* Remove as supplicant has never seen this reque=
st. */
> +                       else if (prev_state =3D=3D QCOMTEE_REQ_QUEUED)
> +                               ureq_dequeue(ctxdata, ureq->req_id);
> +               }
> +
> +               /* Supplicant did some work, we should not discard it. */
> +               if (prev_state =3D=3D QCOMTEE_REQ_PROCESSED) {
> +                       errno =3D ureq->errno;
> +                       /* On success, notify() frees the request. */
> +                       if (!errno)
> +                               oic->data =3D no_free_ptr(ureq);
> +               }
> +       }
> +
> +       return errno;
> +}
> +
> +/* This is called after submitting the dispatcher response. */
> +static void qcomtee_user_object_notify(struct qcomtee_object_invoke_ctx =
*oic,
> +                                      struct qcomtee_object *unused_obje=
ct,
> +                                      int err)
> +{
> +       struct qcomtee_ureq *ureq =3D oic->data;
> +       struct qcomtee_arg *u =3D ureq->args;
> +       int i;
> +
> +       qcomtee_arg_for_each_output_object(i, u) {
> +               /*
> +                * If err, there was a transport issue, and QTEE did not
> +                * receive the response for the dispatcher. Release the c=
allback
> +                * object created for QTEE, in addition to the copies of
> +                * objects kept for the drivers.
> +                */
> +               if (err &&
> +                   (typeof_qcomtee_object(u[i].o) =3D=3D QCOMTEE_OBJECT_=
TYPE_CB))
> +                       qcomtee_object_put(u[i].o);
> +               qcomtee_object_put(u[i].o);
> +       }
> +
> +       kfree(ureq);
> +}
> +
> +static void qcomtee_user_object_release(struct qcomtee_object *object)
> +{
> +       struct qcomtee_user_object *uo =3D to_qcomtee_user_object(object)=
;
> +       struct qcomtee_context_data *ctxdata =3D uo->ctx->data;
> +       struct qcomtee_ureq *ureq;
> +
> +       /* RELEASE does not require any argument. */
> +       static struct qcomtee_arg args[] =3D { { .type =3D QCOMTEE_ARG_TY=
PE_INV } };
> +
> +       if (!uo->nor)
> +               goto out_no_notify;
> +
> +       ureq =3D kzalloc(sizeof(*ureq), GFP_KERNEL);
> +       if (!ureq)
> +               goto out_no_notify;
> +
> +       /* QUEUE a release request: */
> +       ureq->object_id =3D uo->object_id;
> +       ureq->op =3D QCOMTEE_MSG_OBJECT_OP_RELEASE;
> +       ureq->args =3D args;
> +       if (ureq_enqueue(ctxdata, ureq)) {
> +               kfree(ureq);
> +               /* Ignore the notification if it cannot be queued. */
> +               goto out_no_notify;
> +       }
> +
> +       complete(&ctxdata->req_c);
> +
> +out_no_notify:
> +       teedev_ctx_put(uo->ctx);
> +       kfree(uo);
> +}
> +
> +static struct qcomtee_object_operations qcomtee_user_object_ops =3D {
> +       .release =3D qcomtee_user_object_release,
> +       .notify =3D qcomtee_user_object_notify,
> +       .dispatch =3D qcomtee_user_object_dispatch,
> +};
> +
> +/**
> + * qcomtee_user_param_to_object() - OBJREF parameter to &struct qcomtee_=
object.
> + * @object: object returned.
> + * @param: TEE parameter.
> + * @ctx: context in which the conversion should happen.
> + *
> + * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_USER flags.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_user_param_to_object(struct qcomtee_object **object,
> +                                struct tee_param *param,
> +                                struct tee_context *ctx)
> +{
> +       struct qcomtee_user_object *user_object __free(kfree) =3D NULL;
> +       int err;
> +
> +       user_object =3D kzalloc(sizeof(*user_object), GFP_KERNEL);
> +       if (!user_object)
> +               return -ENOMEM;
> +
> +       user_object->ctx =3D ctx;
> +       user_object->object_id =3D param->u.objref.id;
> +       /* By default, always notify userspace upon release. */
> +       user_object->nor =3D true;
> +       err =3D qcomtee_object_user_init(&user_object->object,
> +                                      QCOMTEE_OBJECT_TYPE_CB,
> +                                      &qcomtee_user_object_ops, "uo-%lu"=
,
> +                                      param->u.objref.id);
> +       if (err)
> +               return err;
> +
> +       teedev_ctx_get(ctx);
> +
> +       *object =3D &no_free_ptr(user_object)->object;
> +
> +       return 0;
> +}
> +
> +/* Reverse what qcomtee_user_param_to_object() does. */
> +int qcomtee_user_param_from_object(struct tee_param *param,
> +                                  struct qcomtee_object *object,
> +                                  struct tee_context *ctx)
> +{
> +       struct qcomtee_user_object *uo;
> +
> +       uo =3D to_qcomtee_user_object(object);
> +       /* Ensure the object is in the same context as the caller. */
> +       if (uo->ctx !=3D ctx)
> +               return -EINVAL;
> +
> +       param->u.objref.id =3D uo->object_id;
> +       param->u.objref.flags =3D QCOMTEE_OBJREF_FLAG_USER;
> +
> +       /* User objects are valid in userspace; do not keep a copy. */
> +       qcomtee_object_put(object);
> +
> +       return 0;
> +}
> +
> +/**
> + * qcomtee_cb_params_from_args() - Convert QTEE arguments to TEE paramet=
ers.
> + * @params: TEE parameters.
> + * @u: QTEE arguments.
> + * @num_params: number of elements in the parameter array.
> + * @ubuf_addr: user buffer for arguments of type %QCOMTEE_ARG_TYPE_IB.
> + * @ubuf_size: size of the user buffer.
> + * @ctx: context in which the conversion should happen.
> + *
> + * It expects @params to have enough entries for @u. Entries in @params =
are of
> + * %TEE_IOCTL_PARAM_ATTR_TYPE_NONE.
> + *
> + * Return: On success, returns the number of input parameters;
> + *         on failure, returns < 0.
> + */
> +static int qcomtee_cb_params_from_args(struct tee_param *params,
> +                                      struct qcomtee_arg *u, int num_par=
ams,
> +                                      void __user *ubuf_addr, size_t ubu=
f_size,
> +                                      struct tee_context *ctx)
> +{
> +       int i, np;
> +       void __user *uaddr;
> +
> +       qcomtee_arg_for_each(i, u) {
> +               switch (u[i].type) {
> +               case QCOMTEE_ARG_TYPE_IB:
> +                       params[i].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_UBUF=
_INPUT;
> +
> +                       /* Underflow already checked in ureq_select(). */
> +                       ubuf_size =3D round_down(ubuf_size - u[i].b.size,=
 8);
> +                       uaddr =3D (void *__user)(ubuf_addr + ubuf_size);
> +
> +                       params[i].u.ubuf.uaddr =3D uaddr;
> +                       params[i].u.ubuf.size =3D u[i].b.size;
> +                       if (copy_to_user(params[i].u.ubuf.uaddr, u[i].b.a=
ddr,
> +                                        u[i].b.size))
> +                               goto out_failed;
> +
> +                       break;
> +               case QCOMTEE_ARG_TYPE_OB:
> +                       params[i].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_UBUF=
_OUTPUT;
> +                       /* Let the user knows the maximum size we expect.=
 */
> +                       params[i].u.ubuf.size =3D u[i].b.size;
> +
> +                       break;
> +               case QCOMTEE_ARG_TYPE_IO:
> +                       params[i].attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJR=
EF_INPUT;
> +                       if (qcomtee_objref_from_arg(&params[i], &u[i], ct=
x))
> +                               goto out_failed;
> +
> +                       break;
> +               case QCOMTEE_ARG_TYPE_OO:
> +                       params[i].attr =3D
> +                               TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT;
> +
> +                       break;
> +               default: /* Never get here! */
> +                       goto out_failed;
> +               }
> +       }
> +
> +       return i;
> +
> +out_failed:
> +       /* Undo qcomtee_objref_from_arg(). */
> +       for (np =3D i; np >=3D 0; np--) {
> +               if (params[np].attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_OBJR=
EF_INPUT)
> +                       qcomtee_context_del_qtee_object(&params[np], ctx)=
;
> +       }
> +
> +       /* Release any IO objects not processed. */
> +       for (; u[i].type; i++) {
> +               if (u[i].type =3D=3D QCOMTEE_ARG_TYPE_IO)
> +                       qcomtee_object_put(u[i].o);
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +/**
> + * qcomtee_cb_params_to_args() - Convert TEE parameters to QTEE argument=
s.
> + * @u: QTEE arguments.
> + * @params: TEE parameters.
> + * @num_params: number of elements in the parameter array.
> + * @ctx: context in which the conversion should happen.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +static int qcomtee_cb_params_to_args(struct qcomtee_arg *u,
> +                                    struct tee_param *params, int num_pa=
rams,
> +                                    struct tee_context *ctx)
> +{
> +       int i;
> +
> +       qcomtee_arg_for_each(i, u) {
> +               switch (u[i].type) {
> +               case QCOMTEE_ARG_TYPE_IB:
> +                       if (params[i].attr !=3D
> +                           TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT)
> +                               goto out_failed;
> +
> +                       break;
> +               case QCOMTEE_ARG_TYPE_OB:
> +                       if (params[i].attr !=3D
> +                           TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT)
> +                               goto out_failed;
> +
> +                       /* Client can not send more data than requested. =
*/
> +                       if (params[i].u.ubuf.size > u[i].b.size)
> +                               goto out_failed;
> +
> +                       if (copy_from_user(u[i].b.addr, params[i].u.ubuf.=
uaddr,
> +                                          params[i].u.ubuf.size))
> +                               goto out_failed;
> +
> +                       u[i].b.size =3D params[i].u.ubuf.size;
> +
> +                       break;
> +               case QCOMTEE_ARG_TYPE_IO:
> +                       if (params[i].attr !=3D
> +                           TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT)
> +                               goto out_failed;
> +
> +                       break;
> +               case QCOMTEE_ARG_TYPE_OO:
> +                       if (params[i].attr !=3D
> +                           TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
> +                               goto out_failed;
> +
> +                       if (qcomtee_objref_to_arg(&u[i], &params[i], ctx)=
)
> +                               goto out_failed;
> +
> +                       break;
> +               default: /* Never get here! */
> +                       goto out_failed;
> +               }
> +       }
> +
> +       return 0;
> +
> +out_failed:
> +       /* Undo qcomtee_objref_to_arg(). */
> +       for (i--; i >=3D 0; i--) {
> +               if (u[i].type !=3D QCOMTEE_ARG_TYPE_OO)
> +                       continue;
> +
> +               qcomtee_user_object_set_notify(u[i].o, false);
> +               if (typeof_qcomtee_object(u[i].o) =3D=3D QCOMTEE_OBJECT_T=
YPE_CB)
> +                       qcomtee_object_put(u[i].o);
> +
> +               qcomtee_object_put(u[i].o);
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +/**
> + * qcomtee_user_object_select() - Select a request for a user object.
> + * @ctx: context to look for a user object.
> + * @params: parameters for @op.
> + * @num_params: number of elements in the parameter array.
> + * @uaddr: user buffer for output UBUF parameters.
> + * @size: size of user buffer @uaddr.
> + * @data: information for the selected request.
> + *
> + * @params is filled along with @data for the selected request.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_user_object_select(struct tee_context *ctx,
> +                              struct tee_param *params, int num_params,
> +                              void __user *uaddr, size_t size,
> +                              struct qcomtee_user_object_request_data *d=
ata)
> +{
> +       struct qcomtee_context_data *ctxdata =3D ctx->data;
> +       struct qcomtee_ureq *ureq;
> +       int ret;
> +
> +       while (1) {
> +               scoped_guard(mutex, &ctxdata->reqs_lock) {
> +                       ureq =3D ureq_select(ctxdata, size, num_params);
> +                       if (!ureq)
> +                               goto wait_for_request;
> +
> +                       if (IS_ERR(ureq))
> +                               return PTR_ERR(ureq);
> +
> +                       /* Processing the request 'QUEUED -> PROCESSING'.=
 */
> +                       ureq->state =3D QCOMTEE_REQ_PROCESSING;
> +
> +                       /* ''Prepare user request:'' */
> +                       data->id =3D ureq->req_id;
> +                       data->object_id =3D ureq->object_id;
> +                       data->op =3D ureq->op;
> +                       ret =3D qcomtee_cb_params_from_args(params, ureq-=
>args,
> +                                                         num_params, uad=
dr,
> +                                                         size, ctx);
> +                       if (ret >=3D 0)
> +                               goto done_request;
> +
> +                       /* Something is wrong with the request. */
> +
> +                       ureq_dequeue(ctxdata, data->id);
> +                       /* Send error to QTEE. */
> +                       ureq->state =3D QCOMTEE_REQ_PROCESSED;
> +                       ureq->errno =3D ret;
> +
> +                       complete(&ureq->c);
> +               }
> +
> +               continue;
> +wait_for_request:
> +               /* Wait for a new QUEUED request. */
> +               if (wait_for_completion_interruptible(&ctxdata->req_c))
> +                       return -ERESTARTSYS;
> +       }
> +
> +done_request:
> +       /* No one is waiting for the response. */
> +       if (data->op =3D=3D QCOMTEE_MSG_OBJECT_OP_RELEASE) {
> +               scoped_guard(mutex, &ctxdata->reqs_lock)
> +                       ureq_dequeue(ctxdata, data->id);
> +               kfree(ureq);
> +       }
> +
> +       data->np =3D ret;
> +
> +       return 0;
> +}
> +
> +/**
> + * qcomtee_user_object_submit() - Submit a response for a user object.
> + * @ctx: context to look for a user object.
> + * @params: returned parameters.
> + * @num_params: number of elements in the parameter array.
> + * @req_id: request ID for the response.
> + * @errno: result of user object invocation.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_user_object_submit(struct tee_context *ctx,
> +                              struct tee_param *params, int num_params,
> +                              int req_id, int errno)
> +{
> +       struct qcomtee_context_data *ctxdata =3D ctx->data;
> +       struct qcomtee_ureq *ureq;
> +
> +       guard(mutex)(&ctxdata->reqs_lock);
> +
> +       ureq =3D ureq_dequeue(ctxdata, req_id);
> +       if (!ureq)
> +               return -EINVAL;
> +
> +       ureq->state =3D QCOMTEE_REQ_PROCESSED;
> +
> +       if (!errno)
> +               ureq->errno =3D qcomtee_cb_params_to_args(ureq->args, par=
ams,
> +                                                       num_params, ctx);
> +       else
> +               ureq->errno =3D errno;
> +
> +       /* Return errno if qcomtee_cb_params_to_args() failed; otherwise =
0. */
> +       if (!errno && ureq->errno)
> +               errno =3D ureq->errno;
> +       else
> +               errno =3D 0;
> +
> +       /* Send result to QTEE. */
> +       complete(&ureq->c);
> +
> +       return errno;
> +}
> diff --git a/include/linux/firmware/qcom/qcom_tee.h b/include/linux/firmw=
are/qcom/qcom_tee.h
> new file mode 100644
> index 000000000000..1d9f9bc320fe
> --- /dev/null
> +++ b/include/linux/firmware/qcom/qcom_tee.h
> @@ -0,0 +1,302 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#ifndef __QCOM_TEE_H
> +#define __QCOM_TEE_H
> +
> +#include <linux/completion.h>
> +#include <linux/kref.h>
> +#include <linux/slab.h>
> +#include <linux/workqueue.h>
> +
> +struct qcomtee_object;
> +
> +/**
> + * DOC: Overview
> + *
> + * qcomtee_object provides object refcounting, ID allocation for objects=
 hosted
> + * in the kernel, and necessary message marshaling for Qualcomm TEE (QTE=
E).
> + *
> + * To invoke an object in QTEE, the user calls qcomtee_object_do_invoke(=
)
> + * while passing an instance of &struct qcomtee_object and the requested
> + * operation + arguments.
> + *
> + * After boot, QTEE provides a static object %ROOT_QCOMTEE_OBJECT (type =
of
> + * %QCOMTEE_OBJECT_TYPE_ROOT). The root object is invoked to pass the us=
er's
> + * credentials and obtain other instances of &struct qcomtee_object (typ=
e of
> + * %QCOMTEE_OBJECT_TYPE_TEE) that represent services and TAs in QTEE;
> + * see &enum qcomtee_object_type.
> + *
> + * The objects received from QTEE are refcounted. So the owner of these =
objects
> + * can issue qcomtee_object_get() to increase the refcount and pass obje=
cts
> + * to other clients, or issue qcomtee_object_put() to decrease the refco=
unt
> + * and release the resources in QTEE.
> + *
> + * The kernel can host services accessible to QTEE. A driver should embe=
d
> + * an instance of &struct qcomtee_object in the struct it wants to expor=
t to
> + * QTEE (this is called a callback object). It issues qcomtee_object_use=
r_init()
> + * to set the dispatch() operation for the callback object and set its t=
ype
> + * to %QCOMTEE_OBJECT_TYPE_CB.
> + *
> + * core.c holds an object table for callback objects. An object ID is as=
signed
> + * to each callback object, which is an index to the object table. QTEE =
uses
> + * these IDs to reference or invoke callback objects.
> + *
> + * If QTEE invokes a callback object in the kernel, the dispatch() opera=
tion is
> + * called in the context of the thread that originally called
> + * qcomtee_object_do_invoke().
> + */
> +
> +/**
> + * enum qcomtee_object_type - Object types.
> + * @QCOMTEE_OBJECT_TYPE_TEE: object hosted on QTEE.
> + * @QCOMTEE_OBJECT_TYPE_CB: object hosted on kernel.
> + * @QCOMTEE_OBJECT_TYPE_ROOT: 'primordial' object.
> + * @QCOMTEE_OBJECT_TYPE_NULL: NULL object.
> + *
> + * The primordial object is used for bootstrapping the IPC connection be=
tween
> + * the kernel and QTEE. It is invoked by the kernel when it wants to get=
 a
> + * 'client env'.
> + */
> +enum qcomtee_object_type {
> +       QCOMTEE_OBJECT_TYPE_TEE,
> +       QCOMTEE_OBJECT_TYPE_CB,
> +       QCOMTEE_OBJECT_TYPE_ROOT,
> +       QCOMTEE_OBJECT_TYPE_NULL,
> +};
> +
> +/**
> + * enum qcomtee_arg_type - Type of QTEE argument.
> + * @QCOMTEE_ARG_TYPE_INV: invalid type.
> + * @QCOMTEE_ARG_TYPE_OB: output buffer (OB).
> + * @QCOMTEE_ARG_TYPE_OO: output object (OO).
> + * @QCOMTEE_ARG_TYPE_IB: input buffer (IB).
> + * @QCOMTEE_ARG_TYPE_IO: input object (IO).
> + *
> + * Use the invalid type to specify the end of the argument array.
> + */
> +enum qcomtee_arg_type {
> +       QCOMTEE_ARG_TYPE_INV =3D 0,
> +       QCOMTEE_ARG_TYPE_OB,
> +       QCOMTEE_ARG_TYPE_OO,
> +       QCOMTEE_ARG_TYPE_IB,
> +       QCOMTEE_ARG_TYPE_IO,
> +       QCOMTEE_ARG_TYPE_NR,
> +};
> +
> +/**
> + * define QCOMTEE_ARGS_PER_TYPE - Maximum arguments of a specific type.
> + *
> + * The QTEE transport protocol limits the maximum number of arguments of
> + * a specific type (i.e., IB, OB, IO, and OO).
> + */
> +#define QCOMTEE_ARGS_PER_TYPE 16
> +
> +/* Maximum arguments that can fit in a QTEE message, ignoring the type. =
*/
> +#define QCOMTEE_ARGS_MAX (QCOMTEE_ARGS_PER_TYPE * (QCOMTEE_ARG_TYPE_NR -=
 1))
> +
> +struct qcomtee_buffer {
> +       union {
> +               void *addr;
> +               void __user *uaddr;
> +       };
> +       size_t size;
> +};
> +
> +/**
> + * struct qcomtee_arg - Argument for QTEE object invocation.
> + * @type: type of argument as &enum qcomtee_arg_type.
> + * @flags: extra flags.
> + * @b: address and size if the type of argument is a buffer.
> + * @o: object instance if the type of argument is an object.
> + *
> + * &qcomtee_arg.flags only accepts %QCOMTEE_ARG_FLAGS_UADDR for now, whi=
ch
> + * states that &qcomtee_arg.b contains a userspace address in uaddr.
> + */
> +struct qcomtee_arg {
> +       enum qcomtee_arg_type type;
> +/* 'b.uaddr' holds a __user address. */
> +#define QCOMTEE_ARG_FLAGS_UADDR BIT(0)
> +       unsigned int flags;
> +       union {
> +               struct qcomtee_buffer b;
> +               struct qcomtee_object *o;
> +       };
> +};
> +
> +static inline int qcomtee_args_len(struct qcomtee_arg *args)
> +{
> +       int i =3D 0;
> +
> +       while (args[i].type !=3D QCOMTEE_ARG_TYPE_INV)
> +               i++;
> +       return i;
> +}
> +
> +/* Context is busy (callback is in progress). */
> +#define QCOMTEE_OIC_FLAG_BUSY BIT(1)
> +/* Context needs to notify the current object. */
> +#define QCOMTEE_OIC_FLAG_NOTIFY BIT(2)
> +/* Context has shared state with QTEE. */
> +#define QCOMTEE_OIC_FLAG_SHARED BIT(3)
> +
> +struct qcomtee_object_invoke_ctx {
> +       /* TEE context for this invocation. */
> +       struct tee_context *ctx;
> +       unsigned long flags;
> +       int errno;
> +
> +       /* Current object invoked in this callback context. */
> +       struct qcomtee_object *object;
> +
> +       /* Dispatcher argument array (+1 for ending QCOMTEE_ARG_TYPE_INV)=
. */
> +       struct qcomtee_arg u[QCOMTEE_ARGS_MAX + 1];
> +
> +       /* Inbound and Outbound buffers shared with QTEE. */
> +       struct qcomtee_buffer in_msg; /* Inbound buffer.  */
> +       struct qcomtee_buffer out_msg; /* Outbound buffer. */
> +       struct tee_shm *in_shm; /* TEE shm allocated for inbound buffer. =
*/
> +       struct tee_shm *out_shm; /* TEE shm allocated for outbound buffer=
. */
> +
> +       /* Extra data attached to this context. */
> +       void *data;
> +};
> +
> +static inline struct qcomtee_object_invoke_ctx *
> +qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx)
> +{
> +       struct qcomtee_object_invoke_ctx *oic;
> +
> +       oic =3D kzalloc(sizeof(*oic), GFP_KERNEL);
> +       if (oic)
> +               oic->ctx =3D ctx;
> +       return oic;
> +}
> +
> +/**
> + * qcomtee_object_do_invoke() - Submit an invocation for an object.
> + * @oic: context to use for the current invocation.
> + * @object: object being invoked.
> + * @op: requested operation on the object.
> + * @u: array of arguments for the current invocation.
> + * @result: result returned from QTEE.
> + *
> + * The caller is responsible for keeping track of the refcount for each =
object,
> + * including @object. On return, the caller loses ownership of all input
> + * objects of type %QCOMTEE_OBJECT_TYPE_CB.
> + *
> + * @object can be of %QCOMTEE_OBJECT_TYPE_ROOT or %QCOMTEE_OBJECT_TYPE_T=
EE.
> + *
> + * Return: On success, returns 0. On error, returns -EAGAIN if invocatio=
n
> + * failed and the user may retry the invocation, -ENODEV on fatal failur=
e.
> + */
> +int qcomtee_object_do_invoke(struct qcomtee_object_invoke_ctx *oic,
> +                            struct qcomtee_object *object, u32 op,
> +                            struct qcomtee_arg *u, int *result);
> +
> +/**
> + * struct qcomtee_object_operations - Callback object operations.
> + * @release: release the object if QTEE is not using it.
> + * @dispatch: dispatch the operation requested by QTEE.
> + * @notify: report the status of any pending response submitted by @disp=
atch.
> + */
> +struct qcomtee_object_operations {
> +       void (*release)(struct qcomtee_object *object);
> +       int (*dispatch)(struct qcomtee_object_invoke_ctx *oic,
> +                       struct qcomtee_object *object, u32 op,
> +                       struct qcomtee_arg *args);
> +       void (*notify)(struct qcomtee_object_invoke_ctx *oic,
> +                      struct qcomtee_object *object, int err);
> +};
> +
> +/**
> + * struct qcomtee_object - QTEE or kernel object.
> + * @name: object name.
> + * @refcount: reference counter.
> + * @object_type: object type as &enum qcomtee_object_type.
> + * @info: extra information for the object.
> + * @ops: callback operations for objects of type %QCOMTEE_OBJECT_TYPE_CB=
.
> + * @work: work for async operations on the object.
> + *
> + * @work is used for releasing objects of %QCOMTEE_OBJECT_TYPE_TEE type.
> + */
> +struct qcomtee_object {
> +       const char *name;
> +       struct kref refcount;
> +
> +       enum qcomtee_object_type object_type;
> +       struct object_info {
> +               unsigned long qtee_id;
> +               /* TEE context for QTEE object async requests. */
> +               struct tee_context *qcomtee_async_ctx;
> +       } info;
> +
> +       struct qcomtee_object_operations *ops;
> +       struct work_struct work;
> +};
> +
> +/* Static instances of qcomtee_object objects. */
> +#define NULL_QCOMTEE_OBJECT ((struct qcomtee_object *)(0))
> +extern struct qcomtee_object qcomtee_object_root;
> +#define ROOT_QCOMTEE_OBJECT (&qcomtee_object_root)
> +
> +static inline enum qcomtee_object_type
> +typeof_qcomtee_object(struct qcomtee_object *object)
> +{
> +       if (object =3D=3D NULL_QCOMTEE_OBJECT)
> +               return QCOMTEE_OBJECT_TYPE_NULL;
> +       return object->object_type;
> +}
> +
> +static inline const char *qcomtee_object_name(struct qcomtee_object *obj=
ect)
> +{
> +       if (object =3D=3D NULL_QCOMTEE_OBJECT)
> +               return "null";
> +
> +       if (!object->name)
> +               return "no-name";
> +       return object->name;
> +}
> +
> +/**
> + * qcomtee_object_user_init() - Initialize an object for the user.
> + * @object: object to initialize.
> + * @ot: type of object as &enum qcomtee_object_type.
> + * @ops: instance of callbacks.
> + * @fmt: name assigned to the object.
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int qcomtee_object_user_init(struct qcomtee_object *object,
> +                            enum qcomtee_object_type ot,
> +                            struct qcomtee_object_operations *ops,
> +                            const char *fmt, ...);
> +
> +/* Object release is RCU protected. */
> +int qcomtee_object_get(struct qcomtee_object *object);
> +void qcomtee_object_put(struct qcomtee_object *object);
> +
> +#define qcomtee_arg_for_each(i, args) \
> +       for (i =3D 0; args[i].type !=3D QCOMTEE_ARG_TYPE_INV; i++)
> +
> +/* Next argument of type @type after index @i. */
> +int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
> +                         enum qcomtee_arg_type type);
> +
> +/* Iterate over argument of given type. */
> +#define qcomtee_arg_for_each_type(i, args, at)              \
> +       for (i =3D 0, i =3D qcomtee_next_arg_type(args, i, at); \

i =3D qcomtee_next_arg_type(args, 0, at)

> +            args[i].type !=3D QCOMTEE_ARG_TYPE_INV;          \
> +            i++, i =3D qcomtee_next_arg_type(args, i, at))

i =3D qcomtee_next_arg_type(args, i + 1, at)

Cheers,
Jens

> +
> +#define qcomtee_arg_for_each_input_buffer(i, args) \
> +       qcomtee_arg_for_each_type(i, args, QCOMTEE_ARG_TYPE_IB)
> +#define qcomtee_arg_for_each_output_buffer(i, args) \
> +       qcomtee_arg_for_each_type(i, args, QCOMTEE_ARG_TYPE_OB)
> +#define qcomtee_arg_for_each_input_object(i, args) \
> +       qcomtee_arg_for_each_type(i, args, QCOMTEE_ARG_TYPE_IO)
> +#define qcomtee_arg_for_each_output_object(i, args) \
> +       qcomtee_arg_for_each_type(i, args, QCOMTEE_ARG_TYPE_OO)
> +
> +#endif /* __QCOM_TEE_H */
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index 8642ce7e4772..0efb2835d6dc 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -59,6 +59,7 @@
>  #define TEE_IMPL_ID_OPTEE      1
>  #define TEE_IMPL_ID_AMDTEE     2
>  #define TEE_IMPL_ID_TSTEE      3
> +#define TEE_IMPL_ID_QTEE       4
>
>  /*
>   * OP-TEE specific capabilities
>
> --
> 2.34.1
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ACF6316AA
	for <lists+dri-devel@lfdr.de>; Sun, 20 Nov 2022 23:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AF410E134;
	Sun, 20 Nov 2022 22:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7B710E134
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Nov 2022 22:02:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AKM23Rx023096; Sun, 20 Nov 2022 22:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DXrA/35+jcAUQIlYbD6bPPdY+b1WpZGtH0u9Hc5FblQ=;
 b=cne+uCIO7K35FayxreKQoAZMhofUFpAtHopMZtI4onJoWZ97EYLsyUk1+GKoHvt+GfXK
 1EarUElJHZzPUca+m2vQRLCyOUVrtQ7MjLjEa2HzG/KNUBGhsUmy8HrdrihIsUOAnKqh
 Wd905my91dUIAMkqqVFnERrWDZ3KHQWcvLe5NwMsY/A4ISlhuR2tziMekB7jw/th8h9b
 cYs/+8r2ic5BoHgqJZJodoUlO2xqE1mlxtwSRqOkuIP/0gEqSyxcWkxCWSzxQWfMAH/I
 cREM/90jao7YZLVt7v6mB+NBaXOcE9zTKG1MHrATbeBjzRQbgEixaDKNIsgoHo0/GpaQ Jw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kxrtqat39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 22:02:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AKM21NG017097
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 22:02:01 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 20 Nov
 2022 14:02:00 -0800
Message-ID: <1e1cc8e3-8522-904f-6458-51dc8b212889@quicinc.com>
Date: Sun, 20 Nov 2022 15:01:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 4/4] doc: add documentation for accel subsystem
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20221119204435.97113-1-ogabbay@kernel.org>
 <20221119204435.97113-5-ogabbay@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20221119204435.97113-5-ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: EWsEd_HP81fZah-cEPql7iwJSxTOXPVF
X-Proofpoint-GUID: EWsEd_HP81fZah-cEPql7iwJSxTOXPVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-20_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211200186
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Jiho Chu <jiho.chu@samsung.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kevin Hilman <khilman@baylibre.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/19/2022 1:44 PM, Oded Gabbay wrote:
> Add an introduction section for the accel subsystem. Most of the
> relevant data is in the DRM documentation, so the introduction only
> presents the why of the new subsystem, how are the compute accelerators
> exposed to user-space and what changes need to be done in a standard
> DRM driver to register it to the new accel subsystem.
> 
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> ---
>   Documentation/accel/index.rst        |  17 +++++
>   Documentation/accel/introduction.rst | 109 +++++++++++++++++++++++++++
>   Documentation/subsystem-apis.rst     |   1 +
>   MAINTAINERS                          |   1 +
>   4 files changed, 128 insertions(+)
>   create mode 100644 Documentation/accel/index.rst
>   create mode 100644 Documentation/accel/introduction.rst
> 
> diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
> new file mode 100644
> index 000000000000..2b43c9a7f67b
> --- /dev/null
> +++ b/Documentation/accel/index.rst
> @@ -0,0 +1,17 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +====================
> +Compute Accelerators
> +====================
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   introduction
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`
> diff --git a/Documentation/accel/introduction.rst b/Documentation/accel/introduction.rst
> new file mode 100644
> index 000000000000..5a3963eae973
> --- /dev/null
> +++ b/Documentation/accel/introduction.rst
> @@ -0,0 +1,109 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +============
> +Introduction
> +============
> +
> +The Linux compute accelerators subsystem is designed to expose compute
> +accelerators in a common way to user-space and provide a common set of
> +functionality.
> +
> +These devices can be either stand-alone ASICs or IP blocks inside an SoC/GPU.
> +Although these devices are typically designed to accelerate Machine-Learning
> +and/or Deep-Learning computations, the accel layer is not limited to handling

You use "DL" later on as a short form for Deep-Learning.  It would be 
good to introduce that here.

> +these types of accelerators.
> +
> +typically, a compute accelerator will belong to one of the following

Typically

> +categories:
> +
> +- Edge AI - doing inference at an edge device. It can be an embedded ASIC/FPGA,
> +  or an IP inside a SoC (e.g. laptop web camera). These devices
> +  are typically configured using registers and can work with or without DMA.
> +
> +- Inference data-center - single/multi user devices in a large server. This
> +  type of device can be stand-alone or an IP inside a SoC or a GPU. It will
> +  have on-board DRAM (to hold the DL topology), DMA engines and
> +  command submission queues (either kernel or user-space queues).
> +  It might also have an MMU to manage multiple users and might also enable
> +  virtualization (SR-IOV) to support multiple VMs on the same device. In
> +  addition, these devices will usually have some tools, such as profiler and
> +  debugger.
> +
> +- Training data-center - Similar to Inference data-center cards, but typically
> +  have more computational power and memory b/w (e.g. HBM) and will likely have
> +  a method of scaling-up/out, i.e. connecting to other training cards inside
> +  the server or in other servers, respectively.
> +
> +All these devices typically have different runtime user-space software stacks,
> +that are tailored-made to their h/w. In addition, they will also probably
> +include a compiler to generate programs to their custom-made computational
> +engines. Typically, the common layer in user-space will be the DL frameworks,
> +such as PyTorch and TensorFlow.
> +
> +Sharing code with DRM
> +=====================
> +
> +Because this type of devices can be an IP inside GPUs or have similar
> +characteristics as those of GPUs, the accel subsystem will use the
> +DRM subsystem's code and functionality. i.e. the accel core code will
> +be part of the DRM subsystem and an accel device will be a new type of DRM
> +device.
> +
> +This will allow us to leverage the extensive DRM code-base and
> +collaborate with DRM developers that have experience with this type of
> +devices. In addition, new features that will be added for the accelerator
> +drivers can be of use to GPU drivers as well.
> +
> +Differentiation from GPUs
> +=========================
> +
> +Because we want to prevent the extensive user-space graphic software stack
> +from trying to use an accelerator as a GPU, the compute accelerators will be
> +differentiated from GPUs by using a new major number and new device char files.
> +
> +Furthermore, the drivers will be located in a separate place in the kernel
> +tree - drivers/accel/.
> +
> +The accelerator devices will be exposed to the user space with the dedicated
> +261 major number and will have the following convention:
> +
> +- device char files - /dev/accel/accel*
> +- sysfs             - /sys/class/accel/accel*/
> +- debugfs           - /sys/kernel/debug/accel/accel*/
> +
> +Getting Started
> +===============
> +
> +First, read the DRM documentation. Not only it will explain how to write a new

How about a link to the DRM documentation?

> +DRM driver but it will also contain all the information on how to contribute,
> +the Code Of Conduct and what is the coding style/documentation. All of that
> +is the same for the accel subsystem.
> +
> +Second, make sure the kernel is configured with CONFIG_DRM_ACCEL.
> +
> +To expose your device as an accelerator, two changes are needed to
> +be done in your driver (as opposed to a standard DRM driver):
> +
> +- Add the DRIVER_COMPUTE_ACCEL feature flag in your drm_driver's
> +  driver_features field. It is important to note that this driver feature is
> +  mutually exclusive with DRIVER_RENDER and DRIVER_MODESET. Devices that want

I don't remember seeing code that validates a driver with 
DRIVER_COMPUTE_ACCEL does not also have DRIVER_MODESET.  What am I missing?

> +  to expose both graphics and compute device char files should be handled by
> +  two drivers that are connected using the auxiliary bus framework.
> +
> +- Change the open callback in your driver fops structure to accel_open().
> +  Alternatively, your driver can use DEFINE_DRM_ACCEL_FOPS macro to easily
> +  set the correct function operations pointers structure.
> +
> +External References
> +===================
> +
> +email threads
> +-------------
> +
> +* `Initial discussion on the New subsystem for acceleration devices <https://lkml.org/lkml/2022/7/31/83>`_ - Oded Gabbay (2022)
> +* `patch-set to add the new subsystem <https://lkml.org/lkml/2022/10/22/544>`_ - Oded Gabbay (2022)
> +
> +Conference talks
> +----------------
> +
> +* `LPC 2022 Accelerators BOF outcomes summary <https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html>`_ - Dave Airlie (2022)
> diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
> index af65004a80aa..b51f38527e14 100644
> --- a/Documentation/subsystem-apis.rst
> +++ b/Documentation/subsystem-apis.rst
> @@ -43,6 +43,7 @@ needed).
>      input/index
>      hwmon/index
>      gpu/index
> +   accel/index
>      security/index
>      sound/index
>      crypto/index
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4d752aac3ec0..6ba7bb35208a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6837,6 +6837,7 @@ L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   C:	irc://irc.oftc.net/dri-devel
>   T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git
> +F:	Documentation/accel/
>   F:	drivers/accel/
>   
>   DRM DRIVERS FOR ALLWINNER A10


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFB47B0DA2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 22:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A9610E5AE;
	Wed, 27 Sep 2023 20:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C2610E5AE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 20:53:13 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38RKe0vx013924; Wed, 27 Sep 2023 20:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=W9/mQkB2ksnnKZJaSvxogZ0OVRweEAGQFLhc8KnEFWw=;
 b=RPtRx4ApOFlfWsSSSffmpKEjsceEoZ1akxVNpTRkpNN6p4bfl/eQl6j8oS23MXBwH5Rm
 BlEY14rOZ81Epoh38WApkCzxWwIjVz1mmrSSTW2B0Yy0M0UQP6OYA18beIy4LqaF6QAB
 YESX7ICWS7Biluw/LK/pdJRyD567JXbGgJu1FOZ8lpWrMPBxBAFLal2HGaYIHPV+gBOG
 qHIccFCzuxIygD1u6mJgg3Te7cwsxKOT1Ql+0MIslDTfVyjMkGorIZF5w3rHiQlOR2sS
 Fd73nIL7AsE8P/ur6OhfK3f6x/sGBkVIKgkqmPpXK13n63jPtII4EXFbxkzHN2YKP82U Dw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tcpkgru53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 20:52:58 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38RKqvND016548
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 20:52:57 GMT
Received: from [10.71.110.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 27 Sep
 2023 13:52:56 -0700
Message-ID: <dcdf1b97-d3fd-461b-9f8e-69560af42d61@quicinc.com>
Date: Wed, 27 Sep 2023 13:52:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/ci: add tests on vkms
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, <dri-devel@lists.freedesktop.org>
References: <20230922171237.550762-1-helen.koike@collabora.com>
 <20230922171237.550762-3-helen.koike@collabora.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230922171237.550762-3-helen.koike@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RVzS43M-1e3JjcH5--ouCfoRC4Qutsb4
X-Proofpoint-ORIG-GUID: RVzS43M-1e3JjcH5--ouCfoRC4Qutsb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_13,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270178
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
Cc: mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 michel.daenzer@mailbox.org, vignesh.raman@collabora.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, melissa.srw@gmail.com,
 mairacanal@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/22/2023 10:12 AM, Helen Koike wrote:
> Add job that runs igt on top of vkms.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> 
> ---
> 
> See pipeline: https://gitlab.freedesktop.org/helen.fornazier/linux/-/pipelines/990494
> 
> v2:
> - do not mv modules to /lib/modules in the job definition, leave it to
>    crosvm-runner.sh
> ---
>   MAINTAINERS                                   |  1 +
>   drivers/gpu/drm/ci/build.sh                   |  1 -
>   drivers/gpu/drm/ci/gitlab-ci.yml              |  1 +
>   drivers/gpu/drm/ci/igt_runner.sh              |  6 ++--
>   drivers/gpu/drm/ci/image-tags.yml             |  2 +-
>   drivers/gpu/drm/ci/test.yml                   | 23 ++++++++++++++-
>   drivers/gpu/drm/ci/x86_64.config              |  1 +
>   .../drm/ci/xfails/virtio_gpu-none-flakes.txt  |  0
>   drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 29 +++++++++++++++++++
>   drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 10 +++++++
>   10 files changed, 68 insertions(+), 6 deletions(-)
>   delete mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 740a2ce2689c..e47dbe31d221 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6813,6 +6813,7 @@ L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/gpu/vkms.rst
> +F:	drivers/gpu/drm/ci/xfails/vkms*
>   F:	drivers/gpu/drm/vkms/
>   
>   DRM DRIVER FOR VIRTUALBOX VIRTUAL GPU
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 7b014287a041..9e510e77098b 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -146,7 +146,6 @@ fi
>   
>   mkdir -p artifacts/install/lib
>   mv install/* artifacts/install/.
> -rm -rf artifacts/install/modules
>   ln -s common artifacts/install/ci-common
>   
>   for image in ${KERNEL_IMAGE_NAME}; do
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 522f83db1a07..c86ee5a51012 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -120,6 +120,7 @@ stages:
>     - rockchip
>     - virtio-gpu
>     - lint
> +  - software-driver
>   
>   # YAML anchors for rule conditions
>   # --------------------------------
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> index 2bb759165063..c7f83d1b72e9 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -21,9 +21,9 @@ cat /sys/kernel/debug/dri/*/state
>   set -e
>   
>   # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
> -if [ "$IGT_FORCE_DRIVER" = "amdgpu" ]; then
> -    mv /install/modules/lib/modules/* /lib/modules/.
> -    modprobe amdgpu
> +if [ "$IGT_FORCE_DRIVER" = "amdgpu" || "$IGT_FORCE_DRIVER" = "vkms" ]; then
> +    mv /install/modules/lib/modules/* /lib/modules/. || true
> +    modprobe --first-time "$IGT_FORCE_DRIVER"
>   fi
>   
>   if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt" ]; then
> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
> index f051b6c547c5..e05077ee29d2 100644
> --- a/drivers/gpu/drm/ci/image-tags.yml
> +++ b/drivers/gpu/drm/ci/image-tags.yml
> @@ -4,7 +4,7 @@ variables:
>      DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
>   
>      DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
> -   DEBIAN_BUILD_TAG: "${CONTAINER_TAG}"
> +   DEBIAN_BUILD_TAG: "2023-09-20-vkms-module-2"
>   
>      KERNEL_ROOTFS_TAG: "${CONTAINER_TAG}"
>   
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 6473cddaa7a9..69a5337fd989 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -332,4 +332,25 @@ virtio_gpu:none:
>       - igt:x86_64
>     rules:
>       # TODO: current issue: malloc(): corrupted top size. Fix and remove this rule.
> -    - when: never
> \ No newline at end of file
> +    - when: never
> +
> +vkms:none:
> +  stage: software-driver
> +  variables:
> +    DRIVER_NAME: vkms
> +    GPU_VERSION: none
> +  extends:
> +    - .test-gl
> +  tags:
> +    - kvm
> +  script:
> +    - ln -sf $CI_PROJECT_DIR/install /install
> +    - mv install/bzImage /lava-files/bzImage
> +    - mkdir -p /lib/modules
> +    - mkdir -p $CI_PROJECT_DIR/results
> +    - ln -sf $CI_PROJECT_DIR/results /results
> +    - ./install/crosvm-runner.sh ./install/igt_runner.sh
> +  needs:
> +    - debian/x86_64_test-gl
> +    - testing:x86_64
> +    - igt:x86_64
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
> index 1cbd49a5b23a..8eaba388b141 100644
> --- a/drivers/gpu/drm/ci/x86_64.config
> +++ b/drivers/gpu/drm/ci/x86_64.config
> @@ -24,6 +24,7 @@ CONFIG_DRM=y
>   CONFIG_DRM_PANEL_SIMPLE=y
>   CONFIG_PWM_CROS_EC=y
>   CONFIG_BACKLIGHT_PWM=y
> +CONFIG_DRM_VKMS=m
>   
>   # Strip out some stuff we don't need for graphics testing, to reduce
>   # the build.
> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
> deleted file mode 100644
> index e69de29bb2d1..000000000000
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
> new file mode 100644
> index 000000000000..a65196a19222
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
> @@ -0,0 +1,29 @@
> +kms_cursor_crc@cursor-rapid-movement-128x128,Fail
> +kms_cursor_crc@cursor-rapid-movement-128x42,Fail
> +kms_cursor_crc@cursor-rapid-movement-256x256,Fail
> +kms_cursor_crc@cursor-rapid-movement-256x85,Fail
> +kms_cursor_crc@cursor-rapid-movement-32x10,Fail
> +kms_cursor_crc@cursor-rapid-movement-32x32,Fail
> +kms_cursor_crc@cursor-rapid-movement-512x170,Fail
> +kms_cursor_crc@cursor-rapid-movement-512x512,Fail
> +kms_cursor_crc@cursor-rapid-movement-64x21,Fail
> +kms_cursor_crc@cursor-rapid-movement-64x64,Fail
> +kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
> +kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
> +kms_cursor_legacy@cursor-vs-flip-atomic,Fail
> +kms_cursor_legacy@cursor-vs-flip-legacy,Fail
> +kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> +kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> +kms_cursor_legacy@cursorA-vs-flipA-toggle,Fail
> +kms_cursor_legacy@flip-vs-cursor-atomic,Fail
> +kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
> +kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
> +kms_cursor_legacy@flip-vs-cursor-legacy,Fail
> +kms_flip@flip-vs-expired-vblank-interruptible,Fail
> +kms_flip@plain-flip-fb-recreate,Fail
> +kms_pipe_crc_basic@nonblocking-crc,Fail
> +kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
> +kms_pipe_crc_basic@suspend-read-crc,Fail
> +kms_plane@plane-panning-bottom-right-suspend,Fail
> +kms_universal_plane@universal-plane-pipe-A-sanity,Fail
> +kms_vblank@pipe-A-ts-continuation-dpms-suspend,Fail
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> new file mode 100644
> index 000000000000..07aa62cff108
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> @@ -0,0 +1,10 @@
> +# Hits:
> +# rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> +# rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1): P749/1:b..l
> +kms_prop_blob@invalid-get-prop
> +
> +# keeps printing vkms_vblank_simulate: vblank timer overrun and never ends
> +kms_invalid_mode@int-max-clock
> +
> +# Suspend seems to be broken
> +.*suspend.*
> \ No newline at end of file
> -- 
> 2.34.1
> 

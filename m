Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2ED7B0DA0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 22:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B4110E5AD;
	Wed, 27 Sep 2023 20:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBF010E5A5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 20:52:53 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38RKeKkD010773; Wed, 27 Sep 2023 20:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=b5LcypNykH88hu7uuVC2JrXF47pi48vCFkJwhZs4TLY=;
 b=M0XHCznZcz0TSv8ZzzsOAGfO6NxdQ7DR3RSPnURF7ucCvPWfhuroivXniOhyBPdGojcs
 Ehl4/0YCygxUPaMZFoVg5PIx3uBD0pNaMe1z5O9q2tICJJSAh7aHufLhYANFXRaSvCyk
 HcW9DpQHO5UxpaBmpcbp5oNQ+g0VRFo4karaH/olsLxaoz+RIIZ8eciRuiS2w14fZhVV
 dHwIyN2sDHt7wGwCCVkqcWczYu+E44VaAGRQovhl2CWzWA17Ey3jHeqIW+wDel0nq8SQ
 RtsK2CcKhXHSK1WEVhs6hY+N/7fSBlFV2fx4OWbK+fT5ImVr1Tn7ZUJMhWQojNr8D3tm aw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tc9b8ad3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 20:52:38 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38RKqcw0004151
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 20:52:38 GMT
Received: from [10.71.110.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 27 Sep
 2023 13:52:37 -0700
Message-ID: <48d44c53-77db-4278-96eb-c7bb3b030888@quicinc.com>
Date: Wed, 27 Sep 2023 13:52:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/ci: uprev mesa version - fix container build
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, <dri-devel@lists.freedesktop.org>
References: <20230922171237.550762-1-helen.koike@collabora.com>
 <20230922171237.550762-2-helen.koike@collabora.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230922171237.550762-2-helen.koike@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: AVknecJMdZbI7vDzc3p66fkQXWfg0foO
X-Proofpoint-ORIG-GUID: AVknecJMdZbI7vDzc3p66fkQXWfg0foO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_13,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> When building containers, some rust packages were installed without
> locking the dependencies version, which got updated and started giving
> errors like:
> 
> error: failed to compile `bindgen-cli v0.62.0`, intermediate artifacts can be found at `/tmp/cargo-installkNKRwf`
> Caused by:
>    package `rustix v0.38.13` cannot be built because it requires rustc 1.63 or newer, while the currently active rustc version is 1.60.0
> 
> A patch to Mesa was recently added fixing this error, so update it.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> 
> ---
> 
> v2:
> - point to upstream mesa/mesa (solved the TODO and removed RFC tag)
> ---
>   drivers/gpu/drm/ci/gitlab-ci.yml  | 15 ++++++++++++++-
>   drivers/gpu/drm/ci/lava-submit.sh |  2 +-
>   2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 2c4df53f5dfe..522f83db1a07 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -1,6 +1,6 @@
>   variables:
>     DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
> -  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 0dc961645c4f0241f8512cb0ec3ad59635842072
> +  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 1cdc4be14b66108ae0e8069686ac3efe52bef3cb
>   
>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>     TARGET_BRANCH: drm-next
> @@ -24,6 +24,8 @@ variables:
>     PIPELINE_ARTIFACTS_BASE: ${S3_HOST}/artifacts/${CI_PROJECT_PATH}/${CI_PIPELINE_ID}
>     # per-job artifact storage on MinIO
>     JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
> +  # default kernel for rootfs before injecting the current kernel tree
> +  KERNEL_IMAGE_BASE: https://${S3_HOST}/mesa-lava/gfx-ci/linux/v6.4.12-for-mesa-ci-f6b4ad45f48d
>   
>     LAVA_JOB_PRIORITY: 30
>   
> @@ -86,6 +88,17 @@ include:
>         - '/.gitlab-ci/container/gitlab-ci.yml'
>         - '/.gitlab-ci/test/gitlab-ci.yml'
>         - '/.gitlab-ci/lava/lava-gitlab-ci.yml'
> +      - '/src/microsoft/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/drivers/zink/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/drivers/crocus/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/drivers/softpipe/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/drivers/llvmpipe/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/drivers/virgl/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/drivers/nouveau/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/frontends/lavapipe/ci/gitlab-ci-inc.yml'
> +      - '/src/intel/ci/gitlab-ci-inc.yml'
> +      - '/src/freedreno/ci/gitlab-ci-inc.yml'
> +      - '/src/amd/ci/gitlab-ci-inc.yml'
>     - drivers/gpu/drm/ci/image-tags.yml
>     - drivers/gpu/drm/ci/container.yml
>     - drivers/gpu/drm/ci/static-checks.yml
> diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-submit.sh
> index 0c4456b21b0f..379f26ea87cc 100755
> --- a/drivers/gpu/drm/ci/lava-submit.sh
> +++ b/drivers/gpu/drm/ci/lava-submit.sh
> @@ -22,7 +22,7 @@ cp "$SCRIPTS_DIR"/setup-test-env.sh results/job-rootfs-overlay/
>   
>   # Prepare env vars for upload.
>   section_start variables "Variables passed through:"
> -KERNEL_IMAGE_BASE_URL="https://${BASE_SYSTEM_HOST_PATH}" \
> +KERNEL_IMAGE_BASE="https://${BASE_SYSTEM_HOST_PATH}" \
>   	artifacts/ci-common/generate-env.sh | tee results/job-rootfs-overlay/set-job-env-vars.sh
>   section_end variables
>   
> -- 
> 2.34.1
> 

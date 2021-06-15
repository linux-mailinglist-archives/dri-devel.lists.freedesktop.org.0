Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0943A738B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 04:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBDC6E1B7;
	Tue, 15 Jun 2021 02:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14E36E1B7;
 Tue, 15 Jun 2021 02:01:30 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G3s0r4QBGz6yrZ;
 Tue, 15 Jun 2021 09:58:20 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 10:01:23 +0800
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 10:01:22 +0800
Subject: Re: [PATCH -next] drm/nouveau:disp: Remove set but not used variable
 'ret'
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <lyude@redhat.com>, <airlied@redhat.com>, <jajones@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20210515090155.186083-1-libaokun1@huawei.com>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <caf4d2ad-f8ff-d014-360b-0945ee374304@huawei.com>
Date: Tue, 15 Jun 2021 10:01:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210515090155.186083-1-libaokun1@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
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
Cc: yuehaibing@huawei.com, weiyongjun1@huawei.com, yukuai3@huawei.com,
 yangjihong1@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ping

在 2021/5/15 17:01, Baokun Li 写道:
> From: "libaokun1@huawei.com" <libaokun1@huawei.com>
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_mstm_cleanup':
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1389:6: warning:
>   variable ‘ret’ set but not used [-Wunused-but-set-variable]
>
> drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_mstm_prepare':
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1413:6: warning:
>   variable ‘ret’ set but not used [-Wunused-but-set-variable]
>
> It never used since introduction.
>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
>   drivers/gpu/drm/nouveau/dispnv50/disp.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 1c9c0cdf85db..5ee3f1fc76d7 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1386,12 +1386,10 @@ nv50_mstm_cleanup(struct nv50_mstm *mstm)
>   {
>   	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
>   	struct drm_encoder *encoder;
> -	int ret;
>   
>   	NV_ATOMIC(drm, "%s: mstm cleanup\n", mstm->outp->base.base.name);
> -	ret = drm_dp_check_act_status(&mstm->mgr);
> -
> -	ret = drm_dp_update_payload_part2(&mstm->mgr);
> +	drm_dp_check_act_status(&mstm->mgr);
> +	drm_dp_update_payload_part2(&mstm->mgr);
>   
>   	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
>   		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
> @@ -1410,10 +1408,9 @@ nv50_mstm_prepare(struct nv50_mstm *mstm)
>   {
>   	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
>   	struct drm_encoder *encoder;
> -	int ret;
>   
>   	NV_ATOMIC(drm, "%s: mstm prepare\n", mstm->outp->base.base.name);
> -	ret = drm_dp_update_payload_part1(&mstm->mgr);
> +	drm_dp_update_payload_part1(&mstm->mgr);
>   
>   	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
>   		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {

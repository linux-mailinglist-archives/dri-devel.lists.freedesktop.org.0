Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ED56AFCD3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 03:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79ADE10E0B4;
	Wed,  8 Mar 2023 02:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 496 seconds by postgrey-1.36 at gabe;
 Wed, 08 Mar 2023 02:18:53 UTC
Received: from cstnet.cn (smtp80.cstnet.cn [159.226.251.80])
 by gabe.freedesktop.org (Postfix) with ESMTP id A7AC710E041;
 Wed,  8 Mar 2023 02:18:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.125])
 by APP-01 (Coremail) with SMTP id qwCowAAHDUmR7gdkilbQDA--.15016S2;
 Wed, 08 Mar 2023 10:10:25 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: johan+linaro@kernel.org
Subject: Re: [PATCH 01/10] Revert "drm/msm: Add missing check and destroy for
 alloc_ordered_workqueue"
Date: Wed,  8 Mar 2023 10:10:24 +0800
Message-Id: <20230308021024.13566-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHDUmR7gdkilbQDA--.15016S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw4rtFW5Cr1UKF4Uury5CFg_yoWDuFb_Wr
 yS93yUG3yDKFyDGw4Fqr1fWrnaka1SvFyxJrnxJrs3tryfArn5uw4DJr9a9r1xG340qFnI
 9F1UJF42vr1S9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUHWlkUUUUU=
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Mar 2023 18:07:13 +0800, Johan Hovold wrote:
> This reverts commit 643b7d0869cc7f1f7a5ac7ca6bd25d88f54e31d0.

The commit not only adds the allocation sanity check, but also adds the
destroy_workqueue to release the allocated priv->wq.
Therefore, revert the commit will cause memory leak.

> A recent patch that tried to fix up the msm_drm_init() paths with
> respect to the workqueue but only ended up making things worse:
> 
> First, the newly added calls to msm_drm_uninit() on early errors would
> trigger NULL-pointer dereferences, for example, as the kms pointer would
> not have been initialised. (Note that these paths were also modified by
> a second broken error handling patch which in effect cancelled out this
> part when merged.)

There is a check for the kms pointer to avoid NULL-pointer dereference in
the msm_drm_uninit().

> Second, the newly added allocation sanity check would still leak the
> previously allocated drm device.

The ddev is allocated by drm_dev_alloc which support automatic cleanup.

Thanks,
Jiang


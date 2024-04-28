Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519A48B4DF7
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 23:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFE6112A28;
	Sun, 28 Apr 2024 21:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 384 seconds by postgrey-1.36 at gabe;
 Sun, 28 Apr 2024 08:59:26 UTC
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0FF3D10FAB3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 08:59:25 +0000 (UTC)
Received: from [172.38.8.164] (unknown [219.141.235.82])
 by mail (Coremail) with SMTP id AQAAfwB3Kdo9Di5myTwYAA--.43549S3;
 Sun, 28 Apr 2024 16:52:14 +0800 (CST)
Message-ID: <caa6fb05-8080-444a-93c3-2d9283ccb74d@bosc.ac.cn>
Date: Sun, 28 Apr 2024 16:52:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/debugfs: Drop conditionals around of_node pointers
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240321222258.1440130-1-sui.jingfeng@linux.dev>
Content-Language: en-US, en-AU
From: Sui Jingfeng <suijingfeng@bosc.ac.cn>
Organization: bosc
In-Reply-To: <20240321222258.1440130-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwB3Kdo9Di5myTwYAA--.43549S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XrWkuryUurWDJw1xZw1UZFb_yoWkCFgEka
 s7urZruwnruryvvFW2ya13ZrZ0van8uF4xXwnag39xArn8Aw17X3s7urW5J3WrXF1UGFyD
 A34xZF1kAFn29jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbIxYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_JrC_JFWl1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
 c2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
 wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
 7IU5Kg4DUUUUU==
X-CM-SenderInfo: xvxlyxpqjiv03j6e02nfoduhdfq/
X-Mailman-Approved-At: Sun, 28 Apr 2024 21:44:47 +0000
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

ping

在 2024/3/22 06:22, Sui Jingfeng 写道:
> Having conditional around the of_node pointer of the drm_bridge structure
> turns out to make driver code use ugly #ifdef blocks. Drop the conditionals
> to simplify debugfs.
> 
> Fixes: d8dfccde2709 ("drm/bridge: Drop conditionals around of_node pointers")
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>   drivers/gpu/drm/drm_debugfs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 08fcefd804bc..28a471fe4bc8 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -597,10 +597,10 @@ static int bridges_show(struct seq_file *m, void *data)
>   		drm_printf(&p, "\ttype: [%d] %s\n",
>   			   bridge->type,
>   			   drm_get_connector_type_name(bridge->type));
> -#ifdef CONFIG_OF
> +
>   		if (bridge->of_node)
>   			drm_printf(&p, "\tOF: %pOFfc\n", bridge->of_node);
> -#endif
> +
>   		drm_printf(&p, "\tops: [0x%x]", bridge->ops);
>   		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
>   			drm_puts(&p, " detect");

-- 
Best regards
Sui Jingfeng


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF7D272B9B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 18:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA93F6E39C;
	Mon, 21 Sep 2020 16:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACC06E39C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:19:40 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z9so101122wmk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 09:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2Um6c81r/1MBT+fI9iGjg9/o4XDqZdY7rKMNqEREgyE=;
 b=ryoM2PMyrWMXEMclmgyN0lykLS3VG6GXyKh4BC5ZVuURKw5hMiI7c0HZAetAVJ9uHu
 WHPCmKob3GZAwHB0bI+A+2bGumaPKa/LcayBImqxBLqSTWGPWgRIMaJNnzvsltdIClFm
 RkamjI+3JgSIgX4e1nBRWo7MQ7hnY7fBVUTSj05a22ySRbVJdIZNenzaMknU984WS4Ff
 oJXiT3JErczZ+ll+Fj95go1Z4vbo6Ay394q5fOCK4bcUb0WH0Lj7f+j3SmVyZSGTA862
 vTxr3cmVPwuCj3G6rHPq98xrSw5GP3ZVb+Ds8kVgwUWtg000Tnlu5BKL9ISmU0qFih12
 YEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Um6c81r/1MBT+fI9iGjg9/o4XDqZdY7rKMNqEREgyE=;
 b=F2lg5cl+74VqmPvphVDoGDD9kH9OOjS6/DRSRcj75xNQhrIJP5jmreOY0RdUmoTJ1c
 HRvh3/QlJ2hEU3C3hQQAKa1T7yBXxJ3O2sDk8CHgWL4DKy1iNacpx3Asf2Mm61eHABse
 b6utpOKEpI57GTDJmdU0vy4vvjJsZYVQqmq+JATM3ZCXxKxPe2ZOXHDPrq1b8DVO5haA
 xQKDWbTbxTnDz1l0NrY0y6c8z2mZ0a8QSpGs04dUDy3chWM4E7xlul6z1F+b1tr8nV2w
 0m8Qs+9GINXXHTN2E7rpBnE9KzA3Lr0Il9UOirJdtvotduKV+2L6RedCg3IBlP38FNrM
 hPyA==
X-Gm-Message-State: AOAM533sCCBXnyRgZXWJdwl8dVlA2UxK0riRhr8Cylt7thZvS2eL8DAn
 9HKaFo3g/AnjG6fnpkN9CNY=
X-Google-Smtp-Source: ABdhPJxs7Ibc11EIGRwgCKphObeQv/hmih2hCL7dWsWP43DVc7B0GpSzQHeXgsihEEbfpQhdROSDTQ==
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr145783wms.77.1600705179633; 
 Mon, 21 Sep 2020 09:19:39 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id a83sm67121wmh.48.2020.09.21.09.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:19:39 -0700 (PDT)
Subject: Re: [PATCH v3 8/9] soc: mediatek: cmdq: add clear option in
 cmdq_pkt_wfe api
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-9-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <728ace99-e5e6-f8bf-1687-e9b51dfae8d7@gmail.com>
Date: Mon, 21 Sep 2020 18:19:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-9-git-send-email-dennis-yc.hsieh@mediatek.com>
Content-Language: en-US
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/07/2020 17:45, Dennis YC Hsieh wrote:
> Add clear parameter to let client decide if
> event should be clear to 0 after GCE receive it.
> 
> Change since v2:
> - Keep behavior in drm crtc driver and
>    separate bug fix code into another patch.

This, should go...

> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---

...here :)

I fixed to commit message and pushed the patch to v5.9-next/soc

Thanks!

>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |    2 +-
>   drivers/soc/mediatek/mtk-cmdq-helper.c   |    5 +++--
>   include/linux/mailbox/mtk-cmdq-mailbox.h |    3 +--
>   include/linux/soc/mediatek/mtk-cmdq.h    |    5 +++--
>   4 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index ec6c9ffbf35e..c84e7a14d4a8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -490,7 +490,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
>   		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
>   		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
>   		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> -		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
> +		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, true);
>   		mtk_crtc_ddp_config(crtc, cmdq_handle);
>   		cmdq_pkt_finalize(cmdq_handle);
>   		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index d55dc3296105..505651b0d715 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -316,15 +316,16 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
>   }
>   EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
>   
> -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
>   {
>   	struct cmdq_instruction inst = { {0} };
> +	u32 clear_option = clear ? CMDQ_WFE_UPDATE : 0;
>   
>   	if (event >= CMDQ_MAX_EVENT)
>   		return -EINVAL;
>   
>   	inst.op = CMDQ_CODE_WFE;
> -	inst.value = CMDQ_WFE_OPTION;
> +	inst.value = CMDQ_WFE_OPTION | clear_option;
>   	inst.event = event;
>   
>   	return cmdq_pkt_append_command(pkt, inst);
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index efbd8a9eb2d1..d5a983d65f05 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -28,8 +28,7 @@
>    * bit 16-27: update value
>    * bit 31: 1 - update, 0 - no update
>    */
> -#define CMDQ_WFE_OPTION			(CMDQ_WFE_UPDATE | CMDQ_WFE_WAIT | \
> -					CMDQ_WFE_WAIT_VALUE)
> +#define CMDQ_WFE_OPTION			(CMDQ_WFE_WAIT | CMDQ_WFE_WAIT_VALUE)
>   
>   /** cmdq event maximum */
>   #define CMDQ_MAX_EVENT			0x3ff
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 34354e952f60..960704d75994 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -182,11 +182,12 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
>   /**
>    * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
>    * @pkt:	the CMDQ packet
> - * @event:	the desired event type to "wait and CLEAR"
> + * @event:	the desired event type to wait
> + * @clear:	clear event or not after event arrive
>    *
>    * Return: 0 for success; else the error code is returned
>    */
> -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event);
> +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
>   
>   /**
>    * cmdq_pkt_clear_event() - append clear event command to the CMDQ packet
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

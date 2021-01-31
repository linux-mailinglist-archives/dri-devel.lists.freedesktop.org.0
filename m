Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D52309D07
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 15:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6152C6E0BC;
	Sun, 31 Jan 2021 14:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0856A6E0BC
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 14:41:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id m2so10465029wmm.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 06:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uB1B85GVXF4hm57kJsML6NgUscm6tKCDkB6BQ+xO/Pg=;
 b=Gqo20ysB9Zki3cvJZoSV5RBT1g253IMdRYeuPUNejxtSpCsPa3Qpke59jxVc/U55nF
 ZqWeHTMmxZC6qnPrw+f4G7JLo/x7GYsJNrk2MqZwr7+1fWBTMZ29lzvTx5CnDFq63Eyx
 X1RseJJkUsdU6SvpZ5Oe5p6uYNB5AMF9HybdWxf4UjM84HAOn23On3XtH0L66KRj2djV
 G0+f7ibydEm2OFXufKz7HE0DnqgssBckxhYmyonwauRE6ZeLuagnss1StvI1RlWCcXE0
 dMQUuuJw7T1CHKSQ12V9JHx4V4gh2SlUcwV9sLxuBLO6ugGTZgJS24vjGfIhprhSTAO/
 PWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uB1B85GVXF4hm57kJsML6NgUscm6tKCDkB6BQ+xO/Pg=;
 b=MB/43AeRGx4agk2UqV9iWfK4ylvy+LQv9nsnBVIvwob5d4UTiNLEEtXbwoYvU6FWfm
 UJIOkl59Q43TrubD9KFyyS8UTp0NB95glLUI3F0qTAz+Rw5cqrzyESJqB4EYsSyJGtgO
 YQY7u7WJALAL8UebHu+LafJZHlphJ+VE26g+VzyTxKG4btm6SuVnyg827hjyp2NBsSZx
 s/0DXBySsVNmYI92i2HydicW59H/TeyPGLlGQoJ9audBE5RmGFDZqPp38QZTadVMl9za
 RX19YvSP4M/+TlthCP2JUB53PAP12H0uFyas7nUZcezKd98gcPiS8oLOm73QCjZ7rCLP
 2Naw==
X-Gm-Message-State: AOAM530fkVI9H4cowvzEyWVsaus6ol6P39QRAYegtDPyve2An8qjCxNP
 DUDegU/V/6F/nljKNH1YZsiJSadNLRcd25Wt
X-Google-Smtp-Source: ABdhPJyYfZp1SsKgSvo0+XE6ZvuyYfrwa9+hf5ijoRltuEV4edorWnJtXeZSTmgporFpKAL9FrOCNQ==
X-Received: by 2002:a1c:5608:: with SMTP id k8mr11126765wmb.91.1612104075759; 
 Sun, 31 Jan 2021 06:41:15 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id 17sm17539884wmk.48.2021.01.31.06.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 06:41:15 -0800 (PST)
Subject: Re: [PATCH v2] soc: mediatek: cmdq: add address shift in jump
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
References: <1608712499-24956-1-git-send-email-yongqiang.niu@mediatek.com>
 <1608712499-24956-2-git-send-email-yongqiang.niu@mediatek.com>
 <1610070485.1574.10.camel@mhfsdcap03>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1fa82248-9a7d-2808-0ad2-4f1ed1347192@gmail.com>
Date: Sun, 31 Jan 2021 15:41:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610070485.1574.10.camel@mhfsdcap03>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 dennis-yc.hsieh@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 damon.chu@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/01/2021 02:48, Yongqiang Niu wrote:
> On Wed, 2020-12-23 at 16:34 +0800, Yongqiang Niu wrote:
>> Add address shift when compose jump instruction
>> to compatible with 35bit format.
>>
>> Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")
>>
>> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
>> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
>> ---
>>  drivers/mailbox/mtk-cmdq-mailbox.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
>> index 5665b6e..75378e3 100644
>> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
>> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
>> @@ -168,7 +168,8 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
>>  	dma_sync_single_for_cpu(dev, prev_task->pa_base,
>>  				prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
>>  	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
>> -		(u64)CMDQ_JUMP_BY_PA << 32 | task->pa_base;
>> +		(u64)CMDQ_JUMP_BY_PA << 32 |
>> +		(task->pa_base >> task->cmdq->shift_pa);
>>  	dma_sync_single_for_device(dev, prev_task->pa_base,
>>  				   prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
>>  
> 
> hi jassi
> 
> please confirm is there any question about this patch.
> if not, please apply this into next version, tks
> 

Please fix the subject line of your patch. It does not apply to
drivers/soc/mediatek and should be something like
mailbox: mediatek: cmdq: add address shift in jump

Thanks,
Matthias
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJxpGkP2nmm+YAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:16:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53E2197E23
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F92510E10F;
	Wed, 25 Feb 2026 13:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jwLlY0cb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D739410E10F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 13:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772025403;
 bh=k4j5Tev7iUH1peqZV6AeC8ai4b425sX1kPAuRJbg21w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jwLlY0cb8WeEQkIwA3O4/z+qEpZuuX1lrB1oIH7qZJOMsyEAQ3WRQT6OteRsHjYsu
 RApEJFvU+XeQkqrTFmqeQNFBEKKSzQA18Ydrzp1ceQ9D+Udf56viCHul61EYfNXXSe
 z3ApkyCtvHySmG50unPiIwc/pGoS9O6Bqe2hL+o9s9LqKwrIR250NFHlL4SeQ7hEg4
 9k89ybPfTaVH1C6Zj1YL9PkNJpfzyFg6LV0jH4C9WF0Bq2bTYCmGl8PNNCawlFTiXY
 TqbM67yxljMPAj+xGV7M6qurbMcYB9T7hpmaKFMUo33iQR0EX7BGEBUAqHGvlgn9on
 IFPUsO6TnUpFw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C5A417E04C4;
 Wed, 25 Feb 2026 14:16:43 +0100 (CET)
Message-ID: <c81b458a-76db-4977-941b-5c9ddca0231a@collabora.com>
Date: Wed, 25 Feb 2026 14:16:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "bisson.gary@gmail.com" <bisson.gary@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <80cecc13015aca7fe68dd40845e60af4bad42223.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <80cecc13015aca7fe68dd40845e60af4bad42223.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ck.hu@mediatek.com,m:p.zabel@pengutronix.de,m:chunkuang.hu@kernel.org,m:airlied@gmail.com,m:bisson.gary@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:bissongary@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,pengutronix.de,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email,mediatek.com:email]
X-Rspamd-Queue-Id: A53E2197E23
X-Rspamd-Action: no action

Il 25/02/26 07:20, CK Hu (胡俊光) ha scritto:
> On Tue, 2026-01-20 at 12:36 +0100, Gary Bisson wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Some bridges, such as the TI SN65DSI83, require the HS clock to be
>> running in order to lock its PLL during its own pre-enable function.
>>
>> Without this change, the bridge gives the following error:
>> sn65dsi83 14-002c: failed to lock PLL, ret=-110
>> sn65dsi83 14-002c: Unexpected link status 0x01
>> sn65dsi83 14-002c: reset the pipe
>>
>> Move the necessary functions from enable to pre-enable.
> 
> Looks good to me, but this change the flow for all SoC and panel,
> so I would wait for more SoC and more panel test.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

Tested on
  - MT6795 Sony Xperia M5 w/DSI panel (with local changes, as the panel is not
    upstream yet)
  - MT8395 Radxa NIO-12L w/ Radxa Display 8HD

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Nice patch, btw ;-)

Cheers,
Angelo

>>
>> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
>> ---
>> Tested on Tungsten510 module with sn65dsi83 + tm070jdhg30 panel.
>>
>> Left mtk_dsi_set_mode() as part of the enable function to mimic what is
>> done in the Samsung DSIM driver which is known to be working the TI
>> bridge.
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 35 +++++++++++++++++------------------
>>   1 file changed, 17 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index 0e2bcd5f67b7..b560245d1be9 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -672,6 +672,21 @@ static s32 mtk_dsi_switch_to_cmd_mode(struct mtk_dsi *dsi, u8 irq_flag, u32 t)
>>          }
>>   }
>>
>> +static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
>> +{
>> +       if (!dsi->lanes_ready) {
>> +               dsi->lanes_ready = true;
>> +               mtk_dsi_rxtx_control(dsi);
>> +               usleep_range(30, 100);
>> +               mtk_dsi_reset_dphy(dsi);
>> +               mtk_dsi_clk_ulp_mode_leave(dsi);
>> +               mtk_dsi_lane0_ulp_mode_leave(dsi);
>> +               mtk_dsi_clk_hs_mode(dsi, 0);
>> +               usleep_range(1000, 3000);
>> +               /* The reaction time after pulling up the mipi signal for dsi_rx */
>> +       }
>> +}
>> +
>>   static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>>   {
>>          struct device *dev = dsi->host.dev;
>> @@ -724,6 +739,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>>          mtk_dsi_set_vm_cmd(dsi);
>>          mtk_dsi_config_vdo_timing(dsi);
>>          mtk_dsi_set_interrupt_enable(dsi);
>> +       mtk_dsi_lane_ready(dsi);
>> +       mtk_dsi_clk_hs_mode(dsi, 1);
>>
>>          return 0;
>>   err_disable_engine_clk:
>> @@ -769,30 +786,12 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>>          dsi->lanes_ready = false;
>>   }
>>
>> -static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
>> -{
>> -       if (!dsi->lanes_ready) {
>> -               dsi->lanes_ready = true;
>> -               mtk_dsi_rxtx_control(dsi);
>> -               usleep_range(30, 100);
>> -               mtk_dsi_reset_dphy(dsi);
>> -               mtk_dsi_clk_ulp_mode_leave(dsi);
>> -               mtk_dsi_lane0_ulp_mode_leave(dsi);
>> -               mtk_dsi_clk_hs_mode(dsi, 0);
>> -               usleep_range(1000, 3000);
>> -               /* The reaction time after pulling up the mipi signal for dsi_rx */
>> -       }
>> -}
>> -
>>   static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
>>   {
>>          if (dsi->enabled)
>>                  return;
>>
>> -       mtk_dsi_lane_ready(dsi);
>>          mtk_dsi_set_mode(dsi);
>> -       mtk_dsi_clk_hs_mode(dsi, 1);
>> -
>>          mtk_dsi_start(dsi);
>>
>>          dsi->enabled = true;
>>
>> ---
>> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
>> change-id: 20260120-mtkdsi-29e4c84e7b38
>>
>> Best regards,
>> --
>> Gary Bisson <bisson.gary@gmail.com>
>>
>>
> 

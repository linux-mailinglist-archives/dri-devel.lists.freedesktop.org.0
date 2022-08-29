Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A355A4DDC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F05C10F2A1;
	Mon, 29 Aug 2022 13:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9C010F277
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:24:23 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oSekX-0008K7-Vt; Mon, 29 Aug 2022 15:24:22 +0200
Message-ID: <bce1a57cc9c70293819ced8a3eb11dbf215ed09d.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/etnaviv: add HWDB entry for GC7000 r6203
From: Lucas Stach <l.stach@pengutronix.de>
To: Stefan Eschenbacher <Stefan.Eschenbacher@gmx.de>, 
 dri-devel@lists.freedesktop.org
Date: Mon, 29 Aug 2022 15:24:21 +0200
In-Reply-To: <58921853-0744-4481-8A9B-68653B04A8BC@gmx.de>
References: <58921853-0744-4481-8A9B-68653B04A8BC@gmx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

please keep the CC list intact when replying. I've almost missed this.

Am Montag, dem 29.08.2022 um 13:41 +0200 schrieb Stefan Eschenbacher:
> 
> Product_id, customer_id and eco_id should not be zero. The different
> versions of model 0x7000, revision 0x6203 can differ in stream_count,
> minor_feature5 and minor_features7.
>  
>                 {
>                                .model = 0x7000,
>                                .revision = 0x6203,
>                                .product_id = 0x70003,
>                                .customer_id = 0x4,
>                                .eco_id = 0,
>                                .stream_count = 16,
>                                .register_max = 64,
>                                .thread_count = 512,
>                                .shader_core_count = 2,
>                                .vertex_cache_size = 16,
>                                .vertex_output_buffer_size = 1024,
>                                .pixel_pipes = 1,
>                                .instruction_count = 512,
>                                .num_constants = 320,
>                                .buffer_size = 0,
>                                .varyings_count = 16,
>                                .features = 0xe0287c8d,
>                                .minor_features0 = 0xc1799eff,
>                                .minor_features1 = 0xfefbfad9,
>                                .minor_features2 = 0xeb9d4fbf,
>                                .minor_features3 = 0xedfffced,
>                                .minor_features4 = 0xdb0dafc7,
>                                .minor_features5 = 0x3b5ac333,
>                                .minor_features6 = 0xfcce6000,
>                                .minor_features7 = 0xfffbfa6f,
>                                .minor_features8 = 0x00e10ef3,
>                                .minor_features9 = 0x00c8003c,
>                                .minor_features10 = 0x00004040,
>                                .minor_features11 = 0x00000024,
>                 },
>                 {
>                                .model = 0x7000,
>                                .revision = 0x6203,
>                                .product_id = 0x7000f,
>                                .customer_id = 0x60,
>                                .eco_id = 0,
>                                .stream_count = 8,
>                                .register_max = 64,
>                                .thread_count = 512,
>                                .shader_core_count = 2,
>                                .vertex_cache_size = 16,
>                                .vertex_output_buffer_size = 1024,
>                                .pixel_pipes = 1,
>                                .instruction_count = 512,
>                                .num_constants = 320,
>                                .buffer_size = 0,
>                                .varyings_count = 16,
>                                .features = 0xe0287c8d,
>                                 .minor_features0 = 0xc1799eff,
>                                .minor_features1 = 0xfefbfad9,
>                                .minor_features2 = 0xeb9d4fbf,
>                                .minor_features3 = 0xedfffced,
>                                .minor_features4 = 0xdb0dafc7,
>                                .minor_features5 = 0x7b5ac333,
>                                .minor_features6 = 0xfcce6000,
>                                .minor_features7 = 0x1bfbfa6f,
>                                .minor_features8 = 0x00e10ef0,
>                                .minor_features9 = 0x00c8003c,
>                                .minor_features10 = 0x00004040,
>                                .minor_features11 = 0x00000024,
>                 },
> 
> Take a look in the stm32 hwdb file.

While your comment is correct and we should do a more targeted
matching, could you please point me to the stm32 hwdb file you are
referring to?

Regards,
Lucas


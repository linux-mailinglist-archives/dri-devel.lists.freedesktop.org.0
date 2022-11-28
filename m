Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF0C63A8EC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 14:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CCD893AB;
	Mon, 28 Nov 2022 13:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8991F893AB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 13:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UTBhGAIOGHL/FQAX1UNjDjwPHnycgGrWDnWFlcgTTKg=; b=TlhK5G2FKV6YQODUyc/DpAc264
 amGehOnGaEkNMXtRVIIwDgd8GnveP1+OUxoB1yhB5HJpQ1WgkXx4Q71bTLqvMg6+HrZ+QSz4syxVC
 XkSzZItVnjPzGzMS/QRwfB/CjOZAhppEOMtbgoeRePY6swSNEdd2S/n7KvwWVjcTSjSVBiQMpxUPv
 kPn4j/DmY6TGTN0soMCaM/GM9IxOFHL+qXjdiXTRDcbGfzr+mtnvPivwAVFPV9IkECLRgTdLpFvBf
 ajkk1y1a0on44wqNBmz69s0xHSxXGKGFo6On2E57dNJyfz8XnRg7/LXGs8bQeJdM1ru0+J7CbtjA3
 t2QPnZOQ==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=53819)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ozdr3-0004Ja-7F; Mon, 28 Nov 2022 14:07:25 +0100
Message-ID: <ec75650a-1617-7eee-90c8-7ceb11a00638@tronnes.org>
Date: Mon, 28 Nov 2022 14:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 7/8] drm/mipi-dbi: Use shadow-plane mappings
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221121104532.8301-1-tzimmermann@suse.de>
 <20221121104532.8301-8-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221121104532.8301-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 21.11.2022 11.45, skrev Thomas Zimmermann:
> Use the buffer mappings provided by shadow-plane helpers. As the
> mappings are established while the commit can still fail, errors
> are now reported correctly to callers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

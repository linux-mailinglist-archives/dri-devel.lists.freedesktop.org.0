Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1934CA4EAFF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 19:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD33C10E67E;
	Tue,  4 Mar 2025 18:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eUtUsixN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D3510E67E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 18:16:59 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id E8DAC40D9772
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 21:16:57 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eUtUsixN
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gZb6ZYqzG2Rr
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:08:07 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 1F7D24273B; Tue,  4 Mar 2025 19:08:01 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b=eUtUsixN
X-Envelope-From: <linux-kernel+bounces-541345-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b=eUtUsixN
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id B4E5441C85
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:15:14 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
 by fgw1.itu.edu.tr (Postfix) with SMTP id 839DF3064C0B
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:15:14 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by am.mirrors.kernel.org (Postfix) with ESMTPS id 789F91893595
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D3F1F2BA9;
 Mon,  3 Mar 2025 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eUtUsixN"
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04E51DFD95
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=209.85.218.45
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740996896; cv=none;
 b=monXYdi2lIbT+et/Wso9iUT1frcEZL1K6aP7F9bOKuVf/mv5bsWpQvz2WL0ved8okHU4kyUyaOKdFkNgqe9uxC3GjFfzMEQBavTrrZv6dx/TpXp6GGmthpWBKm96tTV1NHl/ZBTF5IbC7Q18t6mpnsGrcHXdztE/s9OcCwifuTA=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740996896; c=relaxed/simple;
 bh=+nGCzjyR8rgspLDbLXmX9G17MFRKxZXjvbJk+rBSpA0=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To;
 b=WE3vrXGz7LyfkxpLBfRgOtLW1gToEgH1iWUfYgeHSsFoDOI60tPgmBr6NCXMdAWWmPYDuS73MoynnOIW3NziFxdrqUmIovxEFPqXGfcHWKLmd7dunAs2YjOC8/xxgYbUBn7n+Xu87AkEKecgX1saENq1UzOonxJJ3sZ5hLPDolY=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b=eUtUsixN; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-abf45d8db04so331524666b.1
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 02:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740996893; x=1741601693; darn=vger.kernel.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ilhtkExKi2tY4D8JNLGZRRECs+rUrn5LWH8Gtc8O4iU=;
 b=eUtUsixNjggmH22ZinByqDiVJL0VhQN71Os/HnbtTG/9Yf8mYSgYovs+L7tXhxDfVj
 NgWg9hQftwVBsM3+OKVwJ0LmjyGrmBgxbe8qTR17V3SNhBCic5C2S0EjnjAud9tBYjf4
 qVOnoevbDp5ij7pyDO+spcJV5hhf7axxuCoJqgxH5Cn38LN028t1ZJI6Ud+uMfRauvP9
 5/vfHZvHfOjZeI1LJQT+4oTPdm0Q+6W8cjFR8wcP/X2qUdwVLVlAxugfN+gMzwJYspWk
 k5RAuw1pN6d7UCVrbHVZCQ51BchQyEjdAQlnwHgoN8M7Ucy6YKDbZwBJToCc+0i6GBWS
 Niwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740996893; x=1741601693;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ilhtkExKi2tY4D8JNLGZRRECs+rUrn5LWH8Gtc8O4iU=;
 b=TqohfEYPzrHwF1vuWA+0XIzcfNkz52f04FEOcs4uf3eapTVlxSugkjdA+W6u2ezri/
 /rZXA9hZBHNK4ZclFzh+54eBLRqxKCvDyRWF9JQ1YpcgpXy5ucrVSws+4cc9jKeP9/Cw
 XXftJnmDO6ZquLiuM7eNI9ciQAfU08jMD8pKoULxdQD1Z0BSKgGxnZAjXqfovtkpnQ5Z
 U2fqlFetbqopw2gk3RlIIXuCVoK7PRUTa0lgqgLm5BI39IcecFsHgVxoMUx1W6kzjDCc
 faKMrlyGPsssN17zpa19f8y6KRPHM2gFg/krPa9s+Hp8dCBhx7PRRWYKW4v7ILOhEcXK
 BjPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKEl0KqtZtpi6xJoVxTj1Va8GbsvjUSNq5kg0nwAlCISAe3uDrIQUtGqOFUbY15KjkledcWhDxR/UIbPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtGWQhXo87KgHrXcwbphWVbc1j1UV+B/RBP0qcKJ8EVpHNo3Og
 Kre44g0uB2TOOIvZnZAMNwCRt8V08fD3Da9MsiNrHGOiHm7qoYphO2g+9XtD9Us=
X-Gm-Gg: ASbGnctRqCvCkAc4xE/bud7QaE8n9yCMBIk4FEJkr+O+0L/6UlKhffljX/CsOh+q1RC
 c1qK4+DF02rS7l9vy+DIdmPFbIRK6lyXly/d1XIGawrMqCdD/t6qXCcv+aGBzRpTsFRSIyiKnLr
 B5aR0XjMc7UejN5DvUP2ei83xifPMw1TQtu+G7x/y4X8ijo/HqoGWRGaM0tNgej6HZ1XWQKE/A0
 6pBvZvmnCvXdDmINL8SYO67su/BvmsxX4SrATuq+wk0xHZQyAG0VWY+L4wEltwki6s68KgulWwW
 VWITUsYarfeyghTZOcJQIk9i8XAAcyxPm08ijikmax5F1RbQJw==
X-Google-Smtp-Source: AGHT+IFW5wW8s+H3cYQVcYMHCSk5m4LiYMR29KDD3mNnUTMxiFYWqtZIptENOVNp/zPSrPbHfZFy4w==
X-Received: by 2002:a17:907:7207:b0:abf:769a:d3b7 with SMTP id
 a640c23a62f3a-abf769ad59cmr416122766b.57.1740996892823; 
 Mon, 03 Mar 2025 02:14:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac1e3ef2f9dsm40040166b.45.2025.03.03.02.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 02:14:52 -0800 (PST)
Date: Mon, 3 Mar 2025 13:14:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Antonino Daplas <adaplas@pol.net>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yihao Han <hanyihao@vivo.com>, cocci@inria.fr,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] video: au1100fb: Move a variable assignment
 behind a null pointer check in au1100fb_setmode()
Message-ID: <15b7c1ee-4541-4732-8189-79397ae45b68@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
 <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
 <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
 <eebf8c0c-7a6a-405f-aaab-2a8a8c2bd91f@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eebf8c0c-7a6a-405f-aaab-2a8a8c2bd91f@stanley.mountain>
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6gZb6ZYqzG2Rr
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741716908.47009@+NuHWekCE3cJL4KxGLSV7g
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

On Mon, Mar 03, 2025 at 01:08:29PM +0300, Dan Carpenter wrote:
> Real bugs where we dereference a pointer and then check for NULL don't
> last long in the kernel.  Most of the stuff Markus is sending is false
> positives like this.

Maybe I was too optimistic.  Here are the Smatch warnings from the
Friday's linux-next.

Common false positives are that the pointer can sometimes be NULL but
there are other ways to determine without checking explicitly.  For
example, maybe the caller passes a flag which means it's non-NULL.

regards,
dan carpenter

arch/arm64/kvm/../../../virt/kvm/kvm_main.c:1639 kvm_prepare_memory_region() warn: variable dereferenced before check 'new' (see line 1622)
arch/x86/kernel/fpu/xstate.c:1567 fpstate_realloc() warn: variable dereferenced before check 'curfps' (see line 1546)
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1639 kvm_prepare_memory_region() warn: variable dereferenced before check 'new' (see line 1622)
drivers/base/dd.c:696 really_probe() warn: variable dereferenced before check 'dev->bus' (see line 640)
drivers/base/dd.c:720 really_probe() warn: variable dereferenced before check 'dev->bus' (see line 640)
drivers/block/drbd/drbd_worker.c:588 make_resync_request() warn: variable dereferenced before check 'peer_device' (see line 587)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:12341 parse_edid_displayid_vrr() warn: variable dereferenced before check 'edid_ext' (see line 12337)
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr.c:775 rn_clk_mgr_construct() warn: variable dereferenced before check 'ctx->dc_bios->integrated_info' (see line 743)
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:734 vg_clk_mgr_construct() warn: variable dereferenced before check 'ctx->dc_bios->integrated_info' (see line 720)
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c:899 dcn314_clk_mgr_construct() warn: variable dereferenced before check 'ctx->dc_bios->integrated_info' (see line 838)
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c:715 dcn315_clk_mgr_construct() warn: variable dereferenced before check 'ctx->dc_bios->integrated_info' (see line 654)
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c:655 dcn316_clk_mgr_construct() warn: variable dereferenced before check 'ctx->dc_bios->integrated_info' (see line 634)
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c:789 dcn31_clk_mgr_construct() warn: variable dereferenced before check 'ctx->dc_bios->integrated_info' (see line 728)
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:1380 dcn35_clk_mgr_construct() warn: variable dereferenced before check 'ctx->dc_bios->integrated_info' (see line 1307)
drivers/gpu/drm/i915/gem/i915_gem_shmem.c:174 shmem_sg_alloc_table() warn: variable dereferenced before check 'sg' (see line 163)
drivers/gpu/drm/i915/gt/gen6_ppgtt.c:274 gen6_ppgtt_cleanup() warn: variable dereferenced before check 'ppgtt->base.pd' (see line 271)
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3649 rcu_virtual_context_destroy() warn: variable dereferenced before check 've->base.sched_engine' (see line 3623)
drivers/gpu/drm/nouveau/nouveau_dp.c:494 nouveau_dp_irq() warn: variable dereferenced before check 'outp' (see line 489)
drivers/hid/hid-debug.c:3727 hid_debug_events_read() warn: variable dereferenced before check 'list->hdev' (see line 3713)
drivers/net/ethernet/amd/pcnet32.c:1923 pcnet32_probe1() warn: variable dereferenced before check 'pdev' (see line 1843)
drivers/net/ethernet/apm/xgene/xgene_enet_main.c:267 xgene_enet_tx_completion() warn: variable dereferenced before check 'skb' (see line 243)
drivers/net/ethernet/natsemi/ns83820.c:884 rx_irq() warn: variable dereferenced before check 'skb' (see line 883)
drivers/net/ethernet/pensando/ionic/ionic_txrx.c:205 ionic_rx_build_skb() warn: variable dereferenced before check 'buf_info->page' (see line 188)
drivers/net/wireless/intel/iwlwifi/dvm/mac80211.c:1236 iwl_setup_interface() warn: variable dereferenced before check 'priv->lib->bt_params' (see line 1229)
drivers/net/wireless/intel/iwlwifi/dvm/main.c:1114 iwl_init_drv() warn: variable dereferenced before check 'priv->lib->bt_params' (see line 1109)
drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c:307 mt76_connac2_mac_tx_rate_val() warn: variable dereferenced before check 'conf' (see line 300)
drivers/net/wireless/mediatek/mt76/mt7925/mac.c:851 mt7925_tx_check_aggr() warn: variable dereferenced before check 'sta' (see line 847)
drivers/nvme/host/ioctl.c:173 nvme_map_user_request() warn: variable dereferenced before check 'bio' (see line 162)
drivers/platform/mellanox/mlxreg-lc.c:903 mlxreg_lc_probe() warn: variable dereferenced before check 'data->notifier' (see line 828)
drivers/scsi/aacraid/commsup.c:2344 aac_command_thread() warn: variable dereferenced before check 'dev->queues' (see line 2332)
drivers/scsi/aic7xxx/aic79xx_osm.c:1837 ahd_done() warn: variable dereferenced before check 'cmd' (see line 1793)
drivers/scsi/csiostor/csio_mb.c:932 csio_fcoe_vnp_alloc_init_mb() warn: variable dereferenced before check 'vnport_wwnn' (see line 929)
drivers/scsi/ips.c:2560 ips_next() warn: variable dereferenced before check 'scb->scsi_cmd' (see line 2554)
drivers/scsi/ips.c:2568 ips_next() warn: variable dereferenced before check 'scb->scsi_cmd' (see line 2554)
drivers/scsi/ips.c:2593 ips_next() warn: variable dereferenced before check 'scb->scsi_cmd' (see line 2554)
drivers/scsi/libsas/sas_scsi_host.c:119 sas_scsi_task_done() warn: variable dereferenced before check 'sc' (see line 110)
drivers/scsi/lpfc/lpfc_bsg.c:1332 lpfc_bsg_hba_get_event() warn: variable dereferenced before check 'evt_dat' (see line 1299)
drivers/slimbus/qcom-ngd-ctrl.c:884 qcom_slim_ngd_xfer_msg() warn: variable dereferenced before check 'txn->msg' (see line 808)
drivers/spi/spi-offload.c:186 spi_offload_trigger_get() warn: variable dereferenced before check 'trigger->ops' (see line 176)
drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c:58 ia_css_output_config() warn: variable dereferenced before check 'from->info' (see line 53)
drivers/usb/gadget/udc/tegra-xudc.c:2681 tegra_xudc_handle_transfer_completion() warn: variable dereferenced before check 'ep->desc' (see line 2679)
drivers/usb/musb/musb_core.c:964 musb_handle_intr_disconnect() warn: variable dereferenced before check 'musb->hcd' (see line 963)
fs/bcachefs/journal.c:1187 __bch2_set_nr_journal_buckets() warn: variable dereferenced before check 'c' (see line 1184)
fs/efs/inode.c:299 efs_map_block() warn: variable dereferenced before check 'bh' (see line 292)
fs/efs/inode.c:304 efs_map_block() warn: variable dereferenced before check 'bh' (see line 292)
fs/efs/inode.c:309 efs_map_block() warn: variable dereferenced before check 'bh' (see line 292)
fs/nfs/write.c:808 nfs_inode_remove_request() warn: variable dereferenced before check 'folio' (see line 805)
fs/ocfs2/dlm/dlmrecovery.c:1590 dlm_mig_lockres_worker() warn: variable dereferenced before check 'res' (see line 1563)
fs/ocfs2/move_extents.c:322 ocfs2_defrag_extent() warn: variable dereferenced before check 'context->data_ac' (see line 279)
fs/ocfs2/namei.c:1455 ocfs2_rename() warn: variable dereferenced before check 'newfe_bh' (see line 1452)
fs/ocfs2/namei.c:1637 ocfs2_rename() warn: variable dereferenced before check 'old_dir_bh' (see line 1618)
fs/smb/client/file.c:3085 cifs_oplock_break() warn: variable dereferenced before check 'inode' (see line 3056)
lib/reed_solomon/decode_rs.c:315 decode_rs16() warn: variable dereferenced before check 'par' (see line 81)
net/core/failover.c:85 failover_slave_register() warn: variable dereferenced before check 'fops' (see line 66)
net/mpls/mpls_iptunnel.c:156 mpls_xmit() warn: variable dereferenced before check 'out_dev' (see line 56)



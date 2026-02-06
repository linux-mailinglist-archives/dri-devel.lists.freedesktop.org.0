Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKELMu/uhWlvIQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:38:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64842FE443
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580D410E675;
	Fri,  6 Feb 2026 13:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sXVV1ncZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1A210E675
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:38:51 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so850985e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 05:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770385130; x=1770989930; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dGXuZ2bOJzj6fDAM/WtbEOtc9kf3G9+rpIVm4yXWvd4=;
 b=sXVV1ncZ6S1/JwvA9J4gSlzBcuqV0LaSyysETA5FwgRfDvq4Ufu6JZlAmVRIg3L7qb
 TPvqe8KLVkHCTmqJKatCYAQv089i+EPFmCfrIJFjm8mikNgDUfAHcnl2GetFcn47NVHQ
 opfydiW3f5qwMvJEW3Y1EC1FjY+26r1MoGcgeagpXpZJDV8U/iJtlL3JXX4VZFqetMSe
 NjzfaerVikNR4PlSCwIBsusDn/bvGCaOtnjDD5uK17dRkqfc8m5IIkYV3WCavAzMJUj+
 0DFH6cwB1yIoFnW1gQTLwhHKV7oEKIWBA9VKJUuRIpb6MlwQdJ9kFUYltSxJOmND19fW
 cntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770385130; x=1770989930;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dGXuZ2bOJzj6fDAM/WtbEOtc9kf3G9+rpIVm4yXWvd4=;
 b=EiG/5ymVsj80OAxpuxKCvyqJltvyzkRfbBgdyGxWK9x78cE4vweKTYsD0SSu4DDV9T
 aolMkJb/JST7ARN+GbrKx2gOEL9cvAAax1rAPI/LlpAq/vccJlc6agUOigGwDXZStmd8
 xXjhGWRgMiaRF7BUEdfv7ZcdUlH7Qu4uapbdYz35+lupDJ3ep3jkRYQvHZ9m4UqoM15m
 21RgDduu10hw7NV9rHQc2h/LC6dSzrloPMxjgNc7ZPLuCRAux3jJuzCKb36MckPGmJaQ
 rxgyEmtox4pSAmq9pZSIh7D5hP1G0WlyGc6TneP+/3lBYsOEz9xW7eAX6QpUbXJzKOZa
 uTSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe9uHXdBrSsuRmQf64TEGntCb2ub1CmKKJqF2p6YoL5KRScQwBEHPeYqUagTgmJf4eHreGsnRQpS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYWrfhpL1tHTfqpwuxcZbsiIdLaoBj4It6fxGw/2K0u5D0yuK5
 jgVSia8T0kVteKqwaOdbpPousAGxqnUFd2j2xhtc83EAACPNJlcD62TR4NVntlg04JU=
X-Gm-Gg: AZuq6aI7bkcngCg3cqL2cdlGQPgaTXaLO3pf259qxat5FSgiqaUFbTDQrnAU0R1Fm/g
 S7aQGTlE37h3xkhTxJJu38npZcXoi6kHhn17Tj6uBiDaosDX2958qdlOxc5sBMe3YScsh009C2+
 wigT9cpTqrlzUuGPgT5xmyz4iaSPqiT1hkkoXpfQhm4nYBET7y4G9xEuHwYu6TygtCpHg7o6ZrD
 LLqZ0dH2ORkBVUfGH0lybwxjnp07g7xgGnKPBcZ4jzAzAQM7tw5xhTOt8yXa8wDYwHDx5P4dEmq
 ud19KRbo24Pu3KnyxD60T1VbnX5RF6yEWb569ABG+IJaOLd4eyPPWFqa1dHPRdzhmZnI6KzWkKR
 sGfY2z1DGPqzafOajWHauqkUlB0hd4L1MqhtPEjQVR1L+hGS7pFbUpwgmBwPY88StBh61runL/l
 Bu69hccwF4BZoNyS/G
X-Received: by 2002:a05:600c:548e:b0:480:1e40:3d2 with SMTP id
 5b1f17b1804b1-48320983bf7mr29532005e9.29.1770385129893; 
 Fri, 06 Feb 2026 05:38:49 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4362972fb16sm6077760f8f.25.2026.02.06.05.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 05:38:49 -0800 (PST)
Date: Fri, 6 Feb 2026 16:38:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonathan Kim <jonathan.kim@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] drm/amdkfd: add debug set and clear address watch
 points operation
Message-ID: <aYXu5vG4UBu9Xyq2@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jonathan.kim@amd.com,m:amd-gfx@lists.freedesktop.org,m:SRINIVASAN.SHANMUGAM@amd.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,stanley.mountain:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 64842FE443
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Jonathan Kim,

Commit e0f85f4690d0 ("drm/amdkfd: add debug set and clear address
watch points operation") from May 6, 2022 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c:448 kfd_dbg_trap_clear_dev_address_watch()
	error: buffer overflow 'pdd->watch_points' 4 <= u32max user_rl='0-3,2147483648-u32max' uncapped

drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_debug.c
    433 int kfd_dbg_trap_clear_dev_address_watch(struct kfd_process_device *pdd,
    434                                         uint32_t watch_id)
    435 {
    436         int r;
    437 
    438         if (!kfd_dbg_owns_dev_watch_id(pdd, watch_id))

kfd_dbg_owns_dev_watch_id() doesn't check for negative values so
if watch_id is larger than INT_MAX it leads to a buffer overflow.
(Negative shifts are undefined).

    439                 return -EINVAL;
    440 
    441         if (!pdd->dev->kfd->shared_resources.enable_mes) {
    442                 r = debug_lock_and_unmap(pdd->dev->dqm);
    443                 if (r)
    444                         return r;
    445         }
    446 
    447         amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
--> 448         pdd->watch_points[watch_id] = pdd->dev->kfd2kgd->clear_address_watch(
    449                                                         pdd->dev->adev,
    450                                                         watch_id);
    451         amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
    452 
    453         if (!pdd->dev->kfd->shared_resources.enable_mes)
    454                 r = debug_map_and_unlock(pdd->dev->dqm);
    455         else
    456                 r = kfd_dbg_set_mes_debug_mode(pdd, true);
    457 
    458         kfd_dbg_clear_dev_watch_id(pdd, watch_id);
    459 
    460         return r;
    461 }

regards,
dan carpenter

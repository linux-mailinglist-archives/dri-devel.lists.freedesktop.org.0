Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F/yFlh0mWlrUAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 10:01:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26AD16C729
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 10:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67AD10E175;
	Sat, 21 Feb 2026 09:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="14AQw2D3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBE410E175
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 09:01:07 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4836b7fbf4fso30936025e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 01:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771664466; x=1772269266;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=CDxg5/Q1IAt1VWYUZzRTRQkuZmjdGOa1HbUsVbaTc1M=;
 b=14AQw2D3CVP/38xSyZfLEsIy/1pePindJOyVOMOwuLMef7NzKh2YP3SCheza+WST/I
 MoxgCXDWGZSt0K5mie1biMaI0mqUBPOqqPdnyjmhrDS2L7VvT6PGYx3LG0xt26ocLRUq
 7+TMlc5TWbdDTWWGQnm3Pq2EVKXsvmsSyWSnyvCMwPKPOkvnrOE8lPCmyjoB7MTsc5tQ
 QlWCckHVYgKkDgFUl6HpCooZ4ngFYBdwF/9GBptHNHNaueaK1M35sgjCVURzHa6gSNBJ
 resiKhm/PlanivHVm39OOPKKwS4mnJAP54vS951MkoegLeXzAyC6KMtq1bGCfq5SpWNj
 mNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771664466; x=1772269266;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CDxg5/Q1IAt1VWYUZzRTRQkuZmjdGOa1HbUsVbaTc1M=;
 b=VL20ozKxKTdkbWz4YAbQCuAN6VZFO1L55RVmbg8eU2jh6JZReiSGA9Or5CLYQc2GhZ
 IcKjy1I5lYJI3USUImoRjozmtnXZJU6QLCfnmDaA5pFU/uWVpVkP7raoeOZIAxhIWe2j
 Qu/mQhJmdQpUxjt7C1EfuynPLH0Sr4a1X5yOA6zGSKgm9H3kl5UuFtVTQcfT3DGGVuzk
 3ak9jDF+0u1vh9ndoGMORGrVYag81l0QtcAJ/N9AIjKdt1H1lNm4f5G813ctCufErQ4V
 aGOchmEwf+tkhfsm8c7UHAUwH49y7Cz9c0/qv8XlCGOKhCzX9dKXs8aEEbcX52GA1sqR
 JsHQ==
X-Gm-Message-State: AOJu0YxTC60GRR6inZCavIovCvEtMapxls4nhpJQgA6oRQ1JXAZDagn6
 tKCWYcTv70PL0cphBmPVkaxCxjK3DAUX7rNctCvv7JMkm00mba4rsSf5HDrmRIKwwyLFWmTHZw0
 ZmsOFRNd/8WOMPWccKg==
X-Received: from wmqt10.prod.google.com ([2002:a05:600c:198a:b0:47e:e27f:e298])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8206:b0:483:75f1:54f with SMTP id
 5b1f17b1804b1-483a95f8a84mr41710485e9.31.1771664466113; 
 Sat, 21 Feb 2026 01:01:06 -0800 (PST)
Date: Sat, 21 Feb 2026 09:01:05 +0000
In-Reply-To: <20260212013713.304343-3-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-3-deborah.brouwer@collabora.com>
Message-ID: <aZl0UXJ4agEpsRBj@google.com>
Subject: Re: [PATCH 02/12] drm/tyr: move clock cleanup into Clocks Drop impl
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
 beata.michalska@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D26AD16C729
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 05:37:03PM -0800, Deborah Brouwer wrote:
> Currently Tyr disables its clocks from TyrDrmDeviceData::drop(), which
> causes them to be shut down before any other fields in TyrDrmDeviceData
> are dropped. This prevents us from using the clocks when dropping the
> other fields in TyrDrmDeviceData.
> 
> In order to better control when the clocks are dropped, move this cleanup
> logic into a Drop implementation on the Clocks struct itself.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

I agree with Boris's point about pinning.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDE8HYmSrml0GQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:27:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051B523624F
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B9110E4B6;
	Mon,  9 Mar 2026 09:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jzeYWDh9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4AA10E4B6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 09:27:33 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b938cb02038so467881066b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1773048452; x=1773653252;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=GekrONwdW/E2ASq8vDcpU6JmstrAl1AYagM70tLaMWo=;
 b=jzeYWDh9dzwB7ABu/fkD3cuWvvpO00je7QE7yYfgjGdCrQbrwRNtS7b804VdnBRCVC
 YL/I21LrGiOZgZd+11z/Wsvn4dt6ciwJFpuvnPEsZAu8ptDUpZPdOBI36ajU8Od8EPMk
 XCtTE1fbpP/T9vEyD5kLx0LtMxINdDD+DX+pDr+VrViwVx4umXQRs4OsjUJqHoqei/b8
 OkL1ToiHsHxPAro7TXpTRbhuvT8/6Y4mnjDAMK2SGGqt1UN6J9cQD24BznGrzlFP8LFn
 Z47YlGSremjzIq88vp8AZjAPhz507nEf3DrDJrKh9OOtCy7k6m9o1KphsKGU8OMvyawD
 bQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773048452; x=1773653252;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GekrONwdW/E2ASq8vDcpU6JmstrAl1AYagM70tLaMWo=;
 b=Ejvnysipae6aWF4IQC58NNIvW5WLjfcxmFRBhIRNbN2D81e/d8P0AQkLppbd1iwf+p
 MW6QrWN/RpGHcQdyGq2ZC9GUSuwYQhatmVmt79AUyWgUcsz2r4XEwMKxkZvSItbe0CqM
 Wl+1Mj95zMlqKAPDonYeY+T+H3xMT+GxrfNb2xt+VHtDLs0QT2CzEsUK4ccQRbuERE/d
 4CRV8L0oMPLXcPp2M7eQ5P3vYOYf040jKvl1qs4dyWjfyGEoZ/d9Jb0t/faQ6viREs0e
 le/YTidRpENR1mzE6af9SRIal46rP1+mI7mcSqlX8xfrj5XqjlPeREPwb1bxuizEFZr3
 XAzw==
X-Gm-Message-State: AOJu0YyZJX406Ev29U+Vn9Pg+soIChucDDqlxQbnADYHlN8HNbcZd3ll
 HZvyC/KIUeKpKIrvIFMmsV8ghwK+4z90qCpR0tLF54n8+7wCVzsTK06FUIioAueQbkwWkUx0Ns5
 fc8MnAcwZNJo9sqPsxQ==
X-Received: from edvi5.prod.google.com ([2002:aa7:dd05:0:b0:661:5234:afa2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d23:b0:b96:dce1:2f52 with SMTP id
 a640c23a62f3a-b96dce1782fmr288787466b.19.1773048451887; 
 Mon, 09 Mar 2026 02:27:31 -0700 (PDT)
Date: Mon, 9 Mar 2026 09:27:30 +0000
In-Reply-To: <20260302202331.176140-1-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20260302202331.176140-1-deborah.brouwer@collabora.com>
Message-ID: <aa6Sgm-JIS2_pudv@google.com>
Subject: Re: [PATCH] drm/tyr: Use DRM device type alias across driver
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com
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
X-Rspamd-Queue-Id: 051B523624F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 12:23:31PM -0800, Deborah Brouwer wrote:
> Currently Tyr defines a convenience type alias for its DRM device type,
> `TyrDrmDevice` but it does not use the alias outside of `tyr/driver.rs`.
> 
> Replace `drm::Device<TyrDrmDriver>` with the alias `TyrDrmDevice` across
> the driver.
> 
> This change will ease future upstream Tyr development by reducing the
> diffs when multiple series are touching these files.
> 
> No functional changes are intended.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Merged into drm-rust-next. Thanks!

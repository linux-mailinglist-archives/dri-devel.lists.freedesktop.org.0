Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEfQCsy+pWknFgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:46:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0821DD27E
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A2410E562;
	Mon,  2 Mar 2026 16:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YSyysjbJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21F610E562
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 16:45:58 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4837b6f6b93so33817305e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 08:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772469957; x=1773074757;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=sOpHk1BL+uJZfW7J1uTT7wM4CHb4+mXkf8VEbmZQIDI=;
 b=YSyysjbJ5JoyvwLLwtugR/VKFygQmyGVYr42QfHzpXuwWZUWHQAdzBFztl6em25vCw
 M5E/nChFdJHqE4tjJaNhIavPBWVu5la250MoXayooJodBNscInPdNw7qcl/L5V2IXyIq
 Az0bUdJKjPecGer/+ZMCZ6G+WoaA7xdaSX8d0j4paIIkJ1dnqdjPBB4p/YOZeGf6AUVM
 5/FmimvBcfdZTvxTNfJFPwP0SNX6uR7g6UvoZImoWU93UmpSSEeLWrm8xnDgDTz7V0j+
 gCIdgRSxk4TznfrKjtcO6jK0zXy/UJKisGXwd7eXQIyqTXTWYaviowlF7I7qlxMwI9mm
 OUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772469957; x=1773074757;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sOpHk1BL+uJZfW7J1uTT7wM4CHb4+mXkf8VEbmZQIDI=;
 b=qhZbaP/xNKsLg9KFnTzpoVFm7f8YFqHbxgAWqtnQb9QcuWQaS41pcVCHjym2yjrR8r
 hVk0tKbGSxDWGm+2qins1KALuU8/Ruzw3jFvnjA2FAqZqLyDFjUHYF20zC+kBo69XI+U
 FQ7gHfX6/qqPgQYrPzTmwUObfGgneZ4qqG0cYs3DXMz017B+WIJ/mvREHQ8La+DS0oyS
 02vx93dY2Mdv0QQFseVGon9tem/9CvgxQeSEyWzxaRc4QefCB7chqwcf+U1BF/2ngLHG
 PzPTPtVwn9iYEQuCa2S0A9N2TRF3jYdc9mGwNxVKeJ2qeTk/3ZP+cl7hSl37Bf/7veyX
 9bfg==
X-Gm-Message-State: AOJu0YwJrhG4dUxzTc5Yg+aNlePNelrBPBy6di+iQV82YVFBORy8siJ0
 5kq7WK8f3AFG1IQELNtfc4jtSqnyQ4V6/rknxKLfasrfELhaNf0a4GXr9e3Kg2jTm3Tp1CwflWA
 1kIeJwnuujAWEu82VdA==
X-Received: from wmbg25.prod.google.com ([2002:a05:600c:a419:b0:483:6c98:3d2f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b0c:b0:480:4b5d:9ec with SMTP id
 5b1f17b1804b1-483c9bdd26dmr247647015e9.33.1772469957264; 
 Mon, 02 Mar 2026 08:45:57 -0800 (PST)
Date: Mon, 2 Mar 2026 16:45:56 +0000
In-Reply-To: <20260224002314.344675-1-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20260224002314.344675-1-deborah.brouwer@collabora.com>
Message-ID: <aaW-xIX_odWZEEDZ@google.com>
Subject: Re: [PATCH v3] drm/tyr: Clarify driver/device type names
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com, dakr@kernel.org
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
X-Rspamd-Queue-Id: 1E0821DD27E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 04:23:14PM -0800, Deborah Brouwer wrote:
> Currently the `TyrDriver` struct implements both `platform::Driver` and
> `drm::Driver`. For clarity, split up these two roles:
>  - Introduce `TyrPlatformDriverData` to implement `platform::Driver`, and
>  - Introduce `TyrDrmDriver` to implement `drm::Driver`.
> 
> Also rename other variables to reflect their roles in the DRM context:
> - Rename `TyrDevice` to `TyrDrmDevice`
> - Rename `TyrData` to `TyrDrmDeviceData`
> - Rename `File` to `TyrDrmFileData`
> - Rename `DrmFile` to `TyrDrmFile`
> 
> No functional changes are intended.
> 
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

I checked with Danilo who has no additional comments.

Applied to drm-rust-next. Thanks!

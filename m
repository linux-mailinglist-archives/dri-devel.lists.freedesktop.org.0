Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOzeHst0mWlrUAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 10:03:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DAD16C748
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 10:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4823C10E17C;
	Sat, 21 Feb 2026 09:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LJAcMjCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310A310E17C
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 09:03:04 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4837907ec88so36971025e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 01:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771664583; x=1772269383;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xqof4s0oT0bzk2vKcOSU+aeQbztw0Mc+PhxZBmWcX5o=;
 b=LJAcMjCnFZv4aGYRfILeQy6EvhXP6TxbaIBvODsqduAfqa2zdarEeBansNMRSAy3R/
 VkqxWR3cINhEdebYYCAnQh2iVEzrVkIffAy4npJKfXbgRzJ7JG6mNf0fdWc/vmPAP9ro
 iuxr2IwLS9AJe8eCSfrXwshDNlvLcS37FrdHRzbfiSGZXLB+UcZo0m+VS+1MIQv3cFYA
 n8W7lCtIZiAsi4tmfCg3++Wbk85DX7ZsDLoUGwGN39CsPWcTiWnfrs8Di+B2XWGIy97a
 iZyqDaeXMYDoKfOkqEgGkmqWng+yPJRi6L6hN4WVdUo+y/hHb4eM5LP+/eq4Zx3BrLkG
 sRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771664583; x=1772269383;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xqof4s0oT0bzk2vKcOSU+aeQbztw0Mc+PhxZBmWcX5o=;
 b=MVtunVQaZlodA532LmVNAC+JZcEQ5VeQyFdoFNv8aRNYWVYlwBp01gHLwvHP8lYHyp
 zJ6Um7eijPv3SrXwWOvM7erA91VdoiRuAPt+PBDDrZbykvPv+DD8NeCvk0Lss40wDFnv
 YDkecSxGkAT1DOh9dtmKuw/jtUky1FKtB4Nbs13RFju+2qP6uIblwdv6W1OPuWpBniuQ
 zmEVsndPTNgr5i8kH+CPgBZ9OsMEeUbAroLQqCAeQYOtWl3De15ChZnyj+kcRlf3lbcY
 LXLpAd2haGz9vFyBwb0GB/r4MqiMmhkRW6eeaWTUJTCTobW5JXVvUZ9yYXYnb6imY+O0
 KVVQ==
X-Gm-Message-State: AOJu0YzpAt/vGypCQTUx1ste10HYpvFaCoH2DNHy2m0TpHbe6nF8Ux5N
 ZrrxfBlbh4vAZ4QlHSHQYrJ1a48XFg7P1QcntiMBnuC8fZI/7hVsLeouUOzidWYEUiny9PKjqQw
 14pX3J/WpvrFMLcgLWQ==
X-Received: from wmbjp4.prod.google.com ([2002:a05:600c:5584:b0:483:27fd:cf47])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b17:b0:483:71f9:37ef with SMTP id
 5b1f17b1804b1-483a95b5405mr30650555e9.8.1771664582473; 
 Sat, 21 Feb 2026 01:03:02 -0800 (PST)
Date: Sat, 21 Feb 2026 09:03:01 +0000
In-Reply-To: <20260212013713.304343-5-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-5-deborah.brouwer@collabora.com>
Message-ID: <aZl0xaouJla98Py1@google.com>
Subject: Re: [PATCH 04/12] drm/tyr: set DMA mask using GPU physical address
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E4DAD16C748
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 05:37:05PM -0800, Deborah Brouwer wrote:
> From: Beata Michalska <beata.michalska@arm.com>
> 
> Configure the device DMA mask during probe using the GPU's physical
> address capability reported in GpuInfo. This ensures DMA allocations
> use an appropriate address mask.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +        // SAFETY: No concurrent DMA allocations or mappings can be made because
> +        // the device is still being probed and therefore isn't being used by
> +        // other threads of execution.
> +        unsafe {
> +            pdev.dma_set_mask_and_coherent(DmaMask::try_new(gpu_info.pa_bits())?)?;
> +        }

Nit: We usually move the semicolon outside of unsafe blocks:

unsafe { pdev.dma_set_mask_and_coherent(DmaMask::try_new(gpu_info.pa_bits())?)? };

Most of the time, this allows rustfmt to format the unsafe block on one
line like the above (but it depends on line length).


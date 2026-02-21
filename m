Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFiJF3x0mWlrUAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 10:01:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DED16C731
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 10:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6267E10E178;
	Sat, 21 Feb 2026 09:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jJlx55eW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F8910E178
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 09:01:44 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4839fc4cef6so20236575e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 01:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771664503; x=1772269303;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IGZPD/MlQJVHTuTaeS0bdoEBsN/xMVsxKrR9PZ+CwoA=;
 b=jJlx55eWw1JNkOEBNuvwJJoIyzDcEtW6rHKiyoSpCgU+0E7LjKie5Lq5uoash1X2LQ
 LSuV2X7lnNxtQAE7j5QAt7+QtXJQSS0Yst4gQxOZnU4+ZyYBhC7r9n33ClqVUEGTsB1N
 h7jPNsQKaVKlqam26aTGTTqWRyCYcFfnGfxeVjTn3IGNm4y2EdKG9zC3rqIta4uL2ofR
 HAUFehRLuA1gq0xal4lhmlB9eVUBo0FeYiJDHt8ve5Y1pWqT0a3UTvWKI2sDbVfg7CFk
 b0xDyGmPByPOZ6m2xdp/iscvETEBJZR+lUDyJHsu2r3amhTGvDCN9wqJnPrm/psIpw/N
 1hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771664503; x=1772269303;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IGZPD/MlQJVHTuTaeS0bdoEBsN/xMVsxKrR9PZ+CwoA=;
 b=tIvpG5zUzaHLpOLLCDyqz8AgoTKcFb+qreRAfkTMPV6O2xR2awcs0f9TeJ0pQ21dsN
 piEes7mmOwnVDjNm98+cSbTA3PcO4wCQr6RCrkc/CCaJ3wmAJjsQ6CmAR0/lNz1Yb82+
 DXktcbYNvW0wcBEYqJJ9XCg47o3E3T+UXvtHUwh4QcpwkeLQIg7BtoJoAF5yHrEtvWYY
 mJ0aok719AhTI6AzMcFXPBu4fMac+Z3F+1IadF2oYhnyipIEGlkOwgQ5ETyaSPmBcefz
 zudVvP5yvhg8mX+t/HZHXKn7xjcKvDC8r/ErIPkB0GUHgRYe64RniJiQZZ/XrAzkpLZ2
 23Rg==
X-Gm-Message-State: AOJu0YyXgV8KLSoptzWivFMIYphhm792okW62wCmbzbNe1QWNaz7/MpU
 JglWkTBFLHElGjysjTj77RaSZCxH7lTqO8EuXj3byPtOBJPZmJ1WGCCsO6l3TJgepRLcfT7ZeKW
 apnWbgJvvycPmeeP2Tw==
X-Received: from wmpz18.prod.google.com ([2002:a05:600c:a12:b0:483:6e1b:21ab])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1989:b0:479:1348:c63e with SMTP id
 5b1f17b1804b1-483a94c99admr45511845e9.9.1771664503041; 
 Sat, 21 Feb 2026 01:01:43 -0800 (PST)
Date: Sat, 21 Feb 2026 09:01:42 +0000
In-Reply-To: <20260212013713.304343-4-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-4-deborah.brouwer@collabora.com>
Message-ID: <aZl0dodnSXejovY5@google.com>
Subject: Re: [PATCH 03/12] drm/tyr: rename TyrObject to BoData
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 17DED16C731
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 05:37:04PM -0800, Deborah Brouwer wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Currently the GEM inner driver data object is called `TyrObject` which
> is a fairly generic name. To make the code easier to understand,
> rename `TyrObject` to `BoData` so that the name better reflects its
> role.
> 
> No functional change is intended.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

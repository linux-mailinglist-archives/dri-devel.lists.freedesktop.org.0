Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F93DA4588F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7D410E891;
	Wed, 26 Feb 2025 08:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 373 seconds by postgrey-1.36 at gabe;
 Wed, 26 Feb 2025 02:09:27 UTC
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0265910E1E5;
 Wed, 26 Feb 2025 02:09:27 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 360E8203BE;
 Wed, 26 Feb 2025 02:03:13 +0000 (UTC)
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.154])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id 9F020200C0;
 Wed, 26 Feb 2025 02:03:10 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id 9418F20317;
 Wed, 26 Feb 2025 02:03:06 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 by nf2.mymailcheap.com (Postfix) with ESMTPSA id A1AA74002D;
 Wed, 26 Feb 2025 02:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1740535384; bh=7ZTH7oq2IoiaqJT7Ob6dFeLdBZygCMDgXFWf8c//0eI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NOSD3O5rqygmeAV52Pgnu6LRV7B9Crhqlq6Ew0ZFI0CLtJiSW08xb6Es8CMUKuML0
 86XEA+du+VikmuZG3H4ObrxzAuBRIhRtye7x+/3ezEIQSdGHvPBQBRn9M5oXZqVq2m
 Soa9XdrcgtZm2RMBjT6+w99uQLNteAnZB6BORPFQ=
Received: from [198.18.0.1] (unknown [58.32.35.189])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 63A2E4151A;
 Wed, 26 Feb 2025 02:03:02 +0000 (UTC)
Message-ID: <26fc7fdb-fa43-451b-8ad9-29298e354dc5@aosc.io>
Date: Wed, 26 Feb 2025 10:02:58 +0800
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH 0/5] drm/xe: enable driver usage on non-4KiB kernels
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Mingcong Bai <jeffbai@aosc.io>
References: <20250226-xe-non-4k-fix-v1-0-e61660b93cc3@aosc.io>
Content-Language: en-US
From: Kexy Biscuit <kexybiscuit@aosc.io>
In-Reply-To: <20250226-xe-non-4k-fix-v1-0-e61660b93cc3@aosc.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A1AA74002D
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [-0.09 / 10.00]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_ONE(0.00)[1];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 URIBL_BLOCKED(0.00)[mail20.mymailcheap.com:helo,mail20.mymailcheap.com:rdns]; 
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action
X-Mailman-Approved-At: Wed, 26 Feb 2025 08:39:53 +0000
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

Superseded by 
https://lore.kernel.org/all/20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io/.

-- 
Best Regards,
Kexy Biscuit

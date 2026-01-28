Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKSpIioHemlE1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:55:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D53FA1A51
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604E510E2B2;
	Wed, 28 Jan 2026 12:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XTEgHLXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A23410E2B2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769604899;
 bh=cuw9kNGE9m4JDDerWO2dwAOCNF8vbiPqhzbNFs+GZXg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XTEgHLXpn5MFUgjBeyLRA9uh0Hs8mJ4h2BCQX7E3E76FopbiWuH9aU4YF/cQSzl3/
 drsU+JRtUTev5CH1LBVI56pJRk5mBlNi3lm+jZbd8ptvdqOMJjrLSy2HvyP9iAgOZD
 OAu+DxqulL5EQCrglGzFTpIvmPZWL8cleQ8xpMYxsDsgyHxp08gzI4wxzCbIft/DhN
 KF30wZiEFvE9yVGR8um+49rLW8eb9IaEXr6N4sGZbI3PfoFyYL9tJRH1H3vJ+Pw4ra
 5caKF3WTHHnVIVd7nMqnJizOfdkyNGu5eEWPjrQouXDNE6HT/w1+2npnWlr/JtnElH
 2Lba6hThaU+8Q==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 448E717E0E3F;
 Wed, 28 Jan 2026 13:54:59 +0100 (CET)
Message-ID: <fa0d29dc-126c-42fe-8020-3785557bdce2@collabora.com>
Date: Wed, 28 Jan 2026 14:54:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/bridge: dw-hdmi-qp: Provide HDMI Vendor Specific
 InfoFrame
To: Daniel Stone <daniel@fooishbar.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260125-dw-hdmi-qp-iframe-v1-0-e0f7649ecc4b@collabora.com>
 <20260125-dw-hdmi-qp-iframe-v1-1-e0f7649ecc4b@collabora.com>
 <CAPj87rMx9eG7TiXgYd0OU9pJ2ndxbHTpR3KRNTg8qxEE918UCg@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAPj87rMx9eG7TiXgYd0OU9pJ2ndxbHTpR3KRNTg8qxEE918UCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:daniel@fooishbar.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,collabora.com,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 0D53FA1A51
X-Rspamd-Action: no action

Hi Daniel,

On 1/28/26 2:11 PM, Daniel Stone wrote:
> Hi Cristian,
> 
> On Sun, 25 Jan 2026 at 00:23, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>> +       /* VSI packet body */
>> +       for (i = 0; i < len - 3; i += 4)
>> +               dw_hdmi_qp_write_pkt(hdmi, buffer + 3, i, min(len - i - 3, 4),
>> +                                    PKT_VSI_CONTENTS1 + i);
> 
> Given that this for loop occurs in all the users (other than when len
> < 4 where it's not required), why not move it into the
> dw_hdmi_qp_write_pkt() helper itself, such that the calls for each
> infoframe could be dw_hdmi_qp_write_pkt(hdmi, buffer + 3, len,
> PKT_VSI_CONTENTS1 /* base reg, incremented by helper */)?

Yeah, initially planned to keep the helper simple and allow more flexibility in
the callbacks.  Probably now it makes sense to also write the packet header via
the helper, not just the body, since this is also handled similarly in all
cases.

Thanks,
Cristian

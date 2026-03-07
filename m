Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDCZLJiGrWkC4AEAu9opvQ:T3
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC71230ADB
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE25010E437;
	Sun,  8 Mar 2026 14:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nf5iFZjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6771E10E34D
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 06:42:58 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-794719afcd4so93911337b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 22:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772865777; x=1773470577; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eKYDChRb6rbEh78AuDm4/w6blF1xZFWjywF+w20xLIQ=;
 b=Nf5iFZjS5fqgdPPZb1dpMapeG53S5v2Zzm+RZN22m9yGXa4SmeCaeVTLZCMl63o9GV
 Rl9u2ZmFhVg/obyNc21DEESHHmsIRwuCAyI2R5wipbnyf5jXAX6poIk9Zk17y4X9uPcw
 RTZfuA2skuyqPQ3rofLIbs+TvkUGMGoqnokEbLEwt4A08mG1gKC+KrfEsWfPYU6gaeOX
 7TQTYVZe0xwlPHbvQP2JH2OoxxDE2JrTfgd2Xg5ifivYp4Mi/mWdCH2yJ69sxRWvEO4y
 HwclOLHGVu9qtH0s7UBlCPmuHGKYB1+frVDhSGrR7hglkFEEpImzZB919l63cKTA29HC
 kNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772865777; x=1773470577;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eKYDChRb6rbEh78AuDm4/w6blF1xZFWjywF+w20xLIQ=;
 b=lfpWhmljc+WzWvl6gdgMtXEJrCDal4f1Ib920WL3dAWFi97eESMbyMpHxhFNjuSGxY
 VYK/GhghsEa3tVFwqAmKXaQyefux50oz4IZ7LzPUVYF/nRctPkEn9kwuz14J20d3pD6g
 NvfdCbdu1n9MBYGU27Ry33gRpD1orbT+fZU4sbz+wvmTtt9n7eku8T60L3QPoMOmAig/
 JHMEorgrwqXSFYI6w/hNEBidtDL35FuUlo91wCdY+fcPv5UOiBqpLgEbQEOQX/fAO2Gm
 Dc+BAx2agLvF5njvRrIBCCNEiRCZKlvErpscvOpNRhVFUOyJ//JYTrd/XuEzuCxLVy1I
 ZIzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXNnO6NS6IhHVFgDOdDZ0j6Qx5fEBuubpF7ifwoSRkRYmpxn+SvnMyf3wJvhYXCEOVy/ii3635l7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQE6Rwd4MvKaPd7gEoFxoK9NG706pC4tgWQxlA4pwffCsuKcBI
 O4ovl/2LOLrWKLnGZkjEtGdtgqkHJjoZLANuSI76gfYF03+rYsXupMrN
X-Gm-Gg: ATEYQzy+qVVnVoJej1wgSXNo0RCbXC8lF1fo33yWILYoiM+2R9Sj/zSf8oFdM+ulWcM
 7H8/iieIloygI3udh6eFx+Xvpvp0sxBEaasoWLnxldF1o14njdiyb3VW7Ncb91qZ/Tre3ztEDyV
 Z2WcawgRzd4TVuswSngRKYVe3SMljsX01OCLSA8YSlGM3NYCXj44VlVSxJljEz4YnZ9uylFF+Cs
 VrwuZACcsDBlhYJUQBaIFA6yZWg4LwVtnJQywmq/ZCa3AZ10Y/T6kzo0gj59JlVJID7OLyDOgUw
 QgtlE+kug+zjSzhnHHXBQs1GhnnsIN3ONAhqwicapwPwOtXjMV5Yyext08MG/cFTXrK35mIkE1X
 lZypc4FM1mwKpD/T857KQyXmUrO0NmhS3qQhpJehwZv8zmQgj5nobQqkfiRhycFDbfKreMA9AeS
 k8kqT3euO7rqHjDnl0LTmfAQJawj3vJe3wnyAeSiyZJMYgb9I9bM/hgZhAqMdUm+EXA6YgaSAGS
 iKmJY2y9OhnXb1d7sseKlKXJ+RS9Vg+J8Xf9gqTt/QARaGKqmiE4O5jqCv0WngIXls=
X-Received: by 2002:a05:690c:6b82:b0:798:764d:dfa5 with SMTP id
 00721157ae682-798dd6733d5mr43655997b3.3.1772865777298; 
 Fri, 06 Mar 2026 22:42:57 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:151a:1f16:9af7:946c])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-798dee69ed6sm17400517b3.38.2026.03.06.22.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 22:42:57 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Mar 2026 00:42:56 -0600
Message-Id: <DGWCGTZNG2VK.3DIFKJWW3SPUW@gmail.com>
Cc: "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Marek Vasut"
 <marek.vasut+renesas@mailbox.org>, "Joseph Guo" <qijian.guo@nxp.com>,
 "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] drm/bridge: waveshare-dsi: Fix signedness bug
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Marek Vasut" <marek.vasut@mailbox.org>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260307033245.71666-1-ethantidmore06@gmail.com>
 <fe3c0b16-1d29-4bca-bff3-15217f9b73f7@mailbox.org>
In-Reply-To: <fe3c0b16-1d29-4bca-bff3-15217f9b73f7@mailbox.org>
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: ABC71230ADB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[31];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:marek.vasut+renesas@mailbox.org,m:qijian.guo@nxp.com,m:lkp@intel.com,m:marek.vasut@mailbox.org,m:ethantidmore06@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[mailbox.org,gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,mailbox.org,nxp.com,intel.com];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Fri Mar 6, 2026 at 9:44 PM CST, Marek Vasut wrote:
> On 3/7/26 4:32 AM, Ethan Tidmore wrote:

> I already sent:
>
> [PATCH] drm/bridge: waveshare-dsi: Use temporary signed variable for DSI=
=20
> lanes validation

Sorry about that! I glanced at lore looking for the kernel test robot,
should have looked for patches already for this.

Thanks,

ET

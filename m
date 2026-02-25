Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMDpEvaMoGkNkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD471AD57B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97F710E9E8;
	Thu, 26 Feb 2026 18:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TeouH0wy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED2210E830
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 20:07:25 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-2bdc8bb60f5so20980eec.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772050045; cv=none;
 d=google.com; s=arc-20240605;
 b=MZkc6+VcODydFVWPekqVbGhNoBVBsMLFMt+Y8UpQOZzWvJLXmMdaSujQlZahB/uIYw
 6AU1golrDrDklSrQC+KCbZCFAcNHasRtxw1aSXT9LdI2P0A2GCu0qzE9B6n2DJhHVqkm
 RL3r6lTzblMeAT3adkco+/AT4GbUoHptDmZCZPjjMXFwk23tPtofwD4d32itZFAq8FxE
 0oKHeFhrYYhJQvuhOM/2baAOs4cGfsD0EnjZ9njID9rqlWSeEUgEvNfqYkVjST6Q90E5
 jJQ5pfh5X5Ne7HXCLiXaltsypD8kVb19T9RzMKlAQjvCZyAYUnRGW1FJmuCFIlKlQbAA
 vbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8b/vlFFpL7CJfKxCH6fo9uCkw3bN2kaYlhwt61QcN80=;
 fh=YMJDJuVXTH6J9Bi2g9ShpA4UkUXtod0AcCobDMFa34U=;
 b=WM7buw4cYkVAHrp3wVIQDAZk5jbdw+0xKk14Pzf/QMyhlU+hmbqv5xYzwil4ETLmJc
 J8KD+0nchBTjREa1xyYSjowI6IXAxK/GzjRQXWNigHsqBw6KA6CZNfunEiEhOcC6Ah7n
 gj0ws/gjphRfWryRRv1rsUwicg5aGH2SCdGv7ngC2IzeuToBicgl5VlTq7vrzt5WuiCU
 LuJA7/+TKDomOxLNAd3X33nODmoq3bYPk/5ETSIH5l+NpZJ8rz7Z6Q/dwmk/cBoSNZo8
 nwz4DTaAfyqndTMSufWVS+9o6rLAI0r3mYpoP35EzuZauUIwVaz+SkyT2qk4ajEdA/gt
 tJeA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772050045; x=1772654845; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8b/vlFFpL7CJfKxCH6fo9uCkw3bN2kaYlhwt61QcN80=;
 b=TeouH0wy8dWUVIg6ZzgdoXpRN+cDUHLndodimbhLt/h0Knn+C8oSO08Bz/Uz1VYRXq
 3Q4PVNaELP4uNGzuRV1S0tKeOTOz7WDVNyn+ZYQdbEuxeIK3tlqNlP9L4XLsu4D76GdS
 FdPKgWSTBlYHOKIEZd9smSKL3gTd2Fagl0V8klbAGsFPeTUaSHCqFCD/dgeVuFmf4j29
 lDPURTR5obOjWN2kJIC8X5mi6N7LXM/SpVG4o6MyAXs+Vu07LQky5K9AqBJuQlEz2zIE
 NJQgoJ1Pjc/lurtFRbDXZgs+e3smermcSlAFPsImeiRUh3ONWndK4Vhxiaq/bSNFxXj/
 2qNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772050045; x=1772654845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8b/vlFFpL7CJfKxCH6fo9uCkw3bN2kaYlhwt61QcN80=;
 b=XOfAvbttMIc9g5p8I2xwsYaHoLKaeY6UguHfZcDa6PfsTF/K+ZmqRSyF0GCcksA6NS
 mry7S/2zOsUEKeZcppxcyD5pPifBVAKTJOXEPjSaqJ4OjgC5BUfUrEGqeHRTalHLuem8
 si/i+rsh6NPGlOlS8C0hnCRRqXxamHkffKUg+qLx7HEFucC4ywPl1VZ3/53/CpSaEUA1
 0L+TdWiVbZpwL8VWNy6Ypee+9reJ9bdjSc+kj/fMmHhM1Xwq6abU1mcoRuvmG/RsKlR9
 EH368s1n6v0NZXBAz50mrYQ59IrZ6y2v3t1c8BLIqqRxI2HDz1CeRmJG5/ES0pVAUKsW
 ryBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg2imLYjLOcx85lO0iL8D2etPE7UHeOWBGuyAH6YOzqEN2HXCK0R6q08KnROOxunucgFiNlyZiI5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylmh5z7eXdQ72JgzqzA5nzRZPEmngL2tw7BOvf0ojiedNPx6XG
 AXUd3B+uZUnOZQH//XuK8GMRJJEeWzM1nVyTz0/Oe7riy46I8xa9LpPhJq4KJkYWpt4UfTzFhSl
 xoSWPZjnMahaL4hLK7kPwT5CoY0OJGCo=
X-Gm-Gg: ATEYQzxU26oTVCEGB7U/3CXO0Zhi1/ga9lHqmoj2d6dIzhO5URR/kjPUv8wJRVc60L1
 DaX6khiiRsidvEwm0IewkrmE8RKMlRaKRpsbtmTyx5bO6KYvX7W0YLOGU/jlqVoTTyj/kapcWnb
 O24AY4CveKVrSK4Q9kuv8k3pHymZGkZX1S9gGvfaflDSuNiH0KWDtbL7t8iwBiD/mudmdrWrm1E
 f60T4GPhH3g5w9z9CKe8G9eTrbXAc1rtRqSo6V66vCOWWixE6Nga8e2OVvSv8YKytH2q3jxDzNp
 5ag+5S0=
X-Received: by 2002:a05:7300:134a:b0:2a4:3593:466c with SMTP id
 5a478bee46e88-2bd7b9d9839mr7568138eec.8.1772050044982; Wed, 25 Feb 2026
 12:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
 <872fddf3-959a-4fd4-8f93-cafdf8414ef7@oss.qualcomm.com>
In-Reply-To: <872fddf3-959a-4fd4-8f93-cafdf8414ef7@oss.qualcomm.com>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 25 Feb 2026 22:07:13 +0200
X-Gm-Features: AaiRm50iTeIljUJY3zqhpqdL0DmyOHNEXBH71A5lwURdxPgX0-EwH6M5va7Oca4
Message-ID: <CAHuF_ZosFSDRk6Spsw1hnFea2+Zx=c0M0STvKTvhFC+85yV7Sg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add support for the Samsung S6E8FCO display panel
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 =?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: AAD471AD57B
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 at 13:50, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/23/26 9:26 PM, Yedaya Katsman wrote:
> > This adds a driver to support the Samsung S6E8FCO display panel found in Xiaomi
> > Mi A3 (xiaomi-laurel). The driver is generated using
> > linux-mdss-dsi-panel-driver-generator[0].
> >
> > The mdss reset dependency makes the screen work more reliably.
> >
> > [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> > Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> >
> > Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> > ---
> > Changes in v2:
> > - Changed commit title like Dmitry asked
>
> You got more comments for patch 3 from Dmitry
>
> https://lore.kernel.org/linux-arm-msm/dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme/
Thanks for pointing it out, I missed it. Responded to that

> Konrad

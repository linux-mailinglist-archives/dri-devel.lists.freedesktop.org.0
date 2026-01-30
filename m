Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GVqBbxhfGl0MAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 08:46:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D042B8059
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 08:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E2910E074;
	Fri, 30 Jan 2026 07:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RDDIqeI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CF210E074
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 07:45:58 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-352c414bbbeso1769597a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 23:45:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769759158; cv=none;
 d=google.com; s=arc-20240605;
 b=cYBgPAgOT+l71SSDKe8nHOV2NX1jNQjdD+3Gu4jUHSF9kW5+9V5aswXmh/sPzfUBLv
 cPjJFhsd5tyTv7bdw0fhKYsZO3GpSLUDbVN06GsZZYIPRfWPYMQ+f7JRDbdDH28ngUZl
 qvrZRAFQY4JBDVX2yv0xDje9EY00C2RvDg+X7Y4kjz7GqFCLganhUsRoHS2D/IXosD1C
 I5HU0rMpEg/fVwg83vQSJhYxXP8+DY50IfRBoI7m+H/uw5s0KdaXPf7pBUirbeSUth8z
 yMh8MHQ/37puCWsaM5/iQEyIVa3X6/5fxYjNL0WB9aWQ6nlGu742FyzFWf3KrKUSqLP9
 YAwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TAKPIgQHJLSAdcHdDw9QZcfJJfsr09DFKKKOpfOD4gw=;
 fh=OQJx43KzJFVjEUXGb1nf4R3K4zw+Ig54Mc825dJSPUs=;
 b=jeYnewWHBXfc2ihBI9i589qrpkJHngL+/cFVpf2pccvDH/5+qwbgZsyAQkIITYuXXb
 ORUrurbJYPlq2UKj2GjqmvI24vl0xdu+pSTooSvXIaRptDBGfqmFaWsvqrIB5yk5WwQc
 NRHcGS4PahOXjlhZHVaZeWueoHd7hZNS7yJqwTlfg7g5U2vM99BcGVCkq2mOvzfuu1sP
 UtOW85CCo945zX/XwtLvh9GyvROlRzwnRQSW+5tnb97b8K6mLZRj81ZCQe/6PGG4js2i
 9KaTjdjZyNlWgUAaEIOFv45cubwvCnTo2pv8x3AmrZ4rTGLPRed58HOFTZtQRUhdHxMN
 KI8Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769759158; x=1770363958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAKPIgQHJLSAdcHdDw9QZcfJJfsr09DFKKKOpfOD4gw=;
 b=RDDIqeI/i7o91LurG13hveNxJY4VbBgkvEaydPthBTLCng2TIj06pSUrHe6IpFbVI5
 NzsPmVYMzttZd4WSNj+utpBaI7H550WSqpRPR8paymAlZxnTO1Jm07oHPxzO2mo+S2Qt
 BKDor7hyJA1KqW4CRWtqkKPVtSI6fXUpJIZV6gloe2dDF/fgBLBBTatBG50PSg/NAbTp
 CWh/zm3magnCNhFRaMC+139tz7LSBIrnBrhJyqcXeASqSIV63NUEejBG8wF+hHlQ/dpk
 dluo3lICaOrGMQgFl4IaoG5QGT0LHR0DK47hV/ciGKuTM6OXLK/gtjjYLB9feLAw2KHA
 2ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769759158; x=1770363958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TAKPIgQHJLSAdcHdDw9QZcfJJfsr09DFKKKOpfOD4gw=;
 b=tn7PhevyVbuEp0uml1EBORS/0FS0ehcpysQitNPs7QRkrR+hAgXBkNGwoIYZBqd5uT
 vG66nQgNINViX3bXIUEJScV+64qddN3XHHZ62grTGlshvCgkzMm6fz1aqvAu7nex88Ag
 sIpoEWe79G5gKkiOE56SGxHPBFqhCrJVq7pHBJr6+3u0NIdY/Wzqdg+FqYo12SJZmFt3
 TSwcS53UE5aSShjoGz7KMfj5gRElBTmyZcwQoby4ZnvOG5ANGyT34SZJOYOCIq0UuScI
 LSsjNeOH6PDYsC41GkuoCh1WiSbrty8eC1GRQq6+4ELUQ7NDUwLQsZXH2pcHAETrT9wc
 ibFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjzIYG6NXC2KL5CLEE2BVqAvG90P2bQymosA+i/EdSXUnsHyJDMOqAvpYtkxiHSDNtiS5aNyIq/TY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC08HdW3AdC2F1WGBdPlo8YRWnUWYVW0r9wRO9Frj2cbtGmxdw
 VfEfydtWgtKzzZM9GQEx3XAvnVf4xiHJqof1Wz128AmQ76BoRKh920yYWOCIjdi+D/4f4Z94DEG
 0R8gYyaBg5cKBVkcfYBPez/Wx/ighZTU=
X-Gm-Gg: AZuq6aICkXJsjVNk1XOm1AeKCdnnKjL6W6PcYc4jPaYfL5/tzRBe9xIO/Yzp3W1Qo7P
 6fenAEjgJBddPRBUBXud0983A0vbRYvMtFzEV3OVrjuDHO6nr/GplDUa9mHF+d2O7FZ4DGZBbYS
 KUBz4a5MEhqv8y2ouvrzbjtT7oEvdYcgg/7BnnGYZCfdezTySqCEEilaEpYTZeb5JOB90nDWnuT
 jLN8wh2AFB22hBV4shF78ZYf97a51N8vc7/hB8yyzTRm8azfv0JQ2OBgT56GNkzRpOnLZc=
X-Received: by 2002:a17:90a:c888:b0:34c:718c:5448 with SMTP id
 98e67ed59e1d1-354299f4a62mr4806616a91.4.1769759158099; Thu, 29 Jan 2026
 23:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20260130055508.3462700-1-shengjiu.wang@nxp.com>
 <cec25a41-cc6a-4b03-833e-5c7da5727e85@nxp.com>
 <CAA+D8AMkipi_iX=vagZMHXTNtqUqyFeVkU1Vr_wb4R82F1OHDA@mail.gmail.com>
 <5c559d32-c75d-469e-8652-86122cf436df@nxp.com>
In-Reply-To: <5c559d32-c75d-469e-8652-86122cf436df@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 15:45:45 +0800
X-Gm-Features: AZwV_QhX1h_sXu2udLuSrjmEyu3PiDv_14Kt3Gf0zaIQ_xpv8bfSI3HflORbIrk
Message-ID: <CAA+D8AMoEaY0WzU82L_JnwhHMeA4THZe0bgBSgsyuvhjP9Z3AQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: imx: imx8mp-hdmi-pai: enable pm runtime
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:shengjiu.wang@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shengjiuwang@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiuwang@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7D042B8059
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 3:08=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
>
>
> On Fri, Jan 30, 2026 at 03:06:19PM +0800, Shengjiu Wang wrote:
> > On Fri, Jan 30, 2026 at 2:49=E2=80=AFPM Liu Ying <victor.liu@nxp.com> w=
rote:
> >>
> >> Hi Shengjiu,
> >>
> >> On Fri, Jan 30, 2026 at 01:55:08PM +0800, Shengjiu Wang wrote:
> >>> There is an audio channel shift issue with multi channel case, first =
run
> >>> the channel order is correct, but second run the channel order is shi=
fted.
>
> [...]
>
> >> Can the channel order shift issue be fully fixed instead of implementi=
ng
> >> a "recovery method"?  I presume that this patch implements a recovery
> >> mechanism.  If it can't, any chip ERRATA?
> >
> > Yes, it can be fully fixed by this patch. I will remove the "recovery" =
for
> > confusion.
>
> Then, you need to add a Fixes tag.

yes.

best regards
Shengjiu Wang

>
> --
> Regards,
> Liu Ying

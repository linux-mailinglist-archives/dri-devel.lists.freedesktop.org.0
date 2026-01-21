Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAXYEnzacGnnaQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:54:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01F557FF3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B50310E7F0;
	Wed, 21 Jan 2026 13:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="EU3Gd77m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE1E10E7EF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 13:53:59 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-89464760408so9927436d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 05:53:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769003638; cv=none;
 d=google.com; s=arc-20240605;
 b=DJr5aA3kGYDgQk2sR0DeHhicn1hFVexNgpODXBCWInntrJ94L9DCYHGpKDJQe3j2X+
 6G0GWuyW0BdQc2cdNFxf+2CsQYra0K3CB9u0hBHNgIlVbxYxd9PBBaQFdUsnKc2Sk4wr
 znafqrd+TVUeCWsk7JZai5VA4lnQGZS3mhnkmKZpfShKRBz01K/tPZmxyuT9hQFbRNiB
 C0dRA8NPp3fCCW7KsSPCv/+S9v70RE7zuj6ar4wCgI4tScQ2Imirl4BYooEbyoFWIVuY
 BXyvWVF0riKEFHc5wwXb3so01oU5cDoh3b/FskzAqWVLma4RgUjsog78I500FYl+2QPN
 R8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mzFjOBpiJBGJpq9W2U1Ixpmg9BraukGH16/LLRJVX8I=;
 fh=hf8qJAL7Rc+EEQxjpZ2+8Gq2i1XmFgQA+zgNvtqnatk=;
 b=S2z2LZPl1OCsiktKoWCIjEUbFb8wa34aOvpJocwv18QR4rcNNCco7mP2Lxo82a42Wz
 /aG/tXwEbGoztZo6VaTE2qOUVfGSlId0G1WaejkKV8/+Kb4UKxqLz4uycZkXgXh60+XX
 g9yp19Ylx76t38mFf5RxeBYRccc6GPqMTPke4OLxlReBGN6W+00jN17yHIxvNEMhUNVM
 knkGvwl1oKP2LnRsNa76Bv0zayEk5IWh1y1Nbd3IJoBsVeciX5cuX/tvPyl/ihc+RRDS
 CR5zYfquCXV3IM4qbykMbMYUUDBIYJ798C5J1zHCijv9i6Ib3XQkwkERmN1nbOvyzLtc
 KIBw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1769003638; x=1769608438;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mzFjOBpiJBGJpq9W2U1Ixpmg9BraukGH16/LLRJVX8I=;
 b=EU3Gd77mS6YFBDGGMtoY+oihLNoR0m6OlAoe0UAnxx98opmwZDYdE0C2lBCAm7oZvN
 gXZaK2fSJT+xlQ/a1xcj8gdI/ZJUEgD7GGA2iG7c/ai/9tLOR5juxjuDSGbJ+uJxh5Re
 wRjtCCqygK0KIFxvkrhHonFx7cT8lAf+6nOcqL76GiXtZH+9Tj3k2tV57aJnaLXG0l6K
 994ggSIK4CvZc9CC/RSkXX6MgmygUbdqh1TQvl0LOOnrcMd8oMWriLuiqqzV1txcWj7q
 d7CI+Lw3N80HYpfNRpZ1QxTNOPlW98Xmt0Ucn1wIeIKAswfL6Hzytl4znFdl8KxbJYic
 Pf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769003638; x=1769608438;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzFjOBpiJBGJpq9W2U1Ixpmg9BraukGH16/LLRJVX8I=;
 b=Gd0IRuhZfpAE5X0auQA7N8qmzfLYvYLIlb4RyAtB7x46L7NFWiGDhGhHEzqjK9Kae7
 e6GHptZIrUq9obdBubV4rcAkefJmVRUmKAK6sz+LiakoAiFdGCUL30GmamVqa72Ob7hB
 /O6FE1YdnQNWiiqRdmXc9CI8lfFza3ZdQcY+9irrf5HW+VHKnFL0FCTuhX8d75r9MOG/
 CfDiF4pn5jMmEx/H3Ky/lQCIdPW6M2GiO7vsn/6BRpSqizjceCpKMS3MZOZSYIMSWKUV
 PDlx7tRiEG+cXeyzla2Q57WPASaq+9NZvXU/msBD1dzLUeYDVJUGegsMg6PCGqbh2Bo+
 4jXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZvmwp15zKEWYnul+EsRxaOJvEAIXODXiMbNjQWToMEvYGyqd27O+zz8+yfVji7Qh/+Ox8hNxAd74=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzU0HiNdDvNBPyf9ipSlt+FHDzZWx6ThIM5QTOVFVEYcqsjERdR
 4bOC4asQQiwr6N7klwxQISYKwjluF+A9CnTue15KDGWUknn/niqciAfSoctCM/Qa3yFUKduv/Cy
 9PK4CtMTEBNjOziHRtK1yrqtNo+bo3ZyL2iUs1sDehQ==
X-Gm-Gg: AZuq6aKg/1y8MtzD9vJQSWvOcL/P0J4F/uI+MiSXZapTREOXANPFpNPYHzCauXrKUmi
 DFymtIxIV8gOHOjQfqQMynUZN4zg86uAwKg4aBOQ1HrfBTUxRgmpDeoulzXcIk+f8QO4EbDdiwx
 /fDvfngBj7JLKxSohoEXqa8QjLR81wHWkm0QlGSEePBFYHSh/kmOasJ1nu9joc/lVoTcmVt7HaA
 Xr/uSDBcBqUQzYfA32ipkyRmf6UdSLSZ6lJEeSHPEIEvbICvId3DuZ2V9TnWa0DFo0iB0o=
X-Received: by 2002:a05:6214:20c7:b0:88a:2d3d:7c30 with SMTP id
 6a1803df08f44-8946391a3b4mr81353256d6.55.1769003638378; Wed, 21 Jan 2026
 05:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
In-Reply-To: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 21 Jan 2026 13:53:46 +0000
X-Gm-Features: AZwV_QjWvOm4jhP_1MnP0BOpEkMXmJHcaqwrd7h9g8bJmPr6DwH6VeirzSgZgdA
Message-ID: <CAPj87rPFGLSO5cecUstZHEYdjjihK2Yx4d8PGCYirNixxKEt=g@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: ignore Gamma test failures on Qualcomm SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Federico Amedeo Izzo <federico@izzo.pro>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[fooishbar.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[fooishbar.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:helen.fornazier@gmail.com,m:vignesh.raman@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:federico@izzo.pro,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fooishbar.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,collabora.com,linux.intel.com,suse.de,ffwll.ch,izzo.pro,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,fooishbar.org:dkim,collabora.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: F01F557FF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026 at 08:41, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> It seems, on SC7180 color conversion results are not included into the
> CRC calculation (unlike SM8350). The fails for SC7180 already lists CTM
> tests. Add gamma-related tests too.

Ouch. Thanks for tracking this down!

Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

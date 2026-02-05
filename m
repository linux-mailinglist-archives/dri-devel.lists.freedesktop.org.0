Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB1EDkQohmmSKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A498610146B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984F910E87A;
	Fri,  6 Feb 2026 17:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B4C10E070
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 20:32:11 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-79518cc2bb4so11721837b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 12:32:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770323530; x=1770928330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Uw9NFSYymdF9cfh8JgFLbLxokKprMEjCgsdfjzfGOUA=;
 b=GlYR/Qppsz2KwzyFTV7/sepl+hkihsN+iOEvbsEQutMYJzbiVkZtRRxNighhKkCWgg
 eeQf58ARKc0D0uZoxYrDUecr1N31VQ7U6aVzy/pnpGlm2IPMcyRPlWXBhBySBgOG4l+W
 pG4UdDwHgvkCdT2RYxXRC2R4JFLY9F4ePDFwZuPH7myJOzbpri1xWAW/xezuIZrKIvTt
 DWiYxXhueR6hv1JpFc3th2poKiOCSPZHMUHvFgrAYaevnS37OPEcRDU4mmYHTkW1+Dou
 knmsuxThxfKf9Ctqmj2KJCq4CTCgv6lw5LIlL4Jm8pFgbTrvynm87DFOVJ13Muffaz9f
 8Xpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFpxFGbKqPjJh1zfRuvDrXL2k58BOp4UPgN2YKrB/+qbsMVl+i63WPNLS5j+WapyziTeKqGfLA7OU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyljoLWz7JZKf857L08HQFAHiGLthKQmPTDUtLscMXjitk7hfWS
 LPWxuGnOhD+k5OzSiTFUJA/FXHcdulWnF6SDlr9cE2HOkMC5Uby27rb4xZ+SRQ==
X-Gm-Gg: AZuq6aJLexC4ouuqtjBjrn3OfluGpcHVhtYNAOVHkVBj9c7rPHWhq88Y67GMlmJP3cJ
 9oPuIjYaXFEQfbMOGsleRvXqDKgz+28CY1hqdAMRYZombrG8Ovxs28t94JIXc9oPAwCa8lJv+xy
 1r2J2MBV+n32LeoFsXh61TCCM5Q1rwSkLCyM3YVRzQkxcE/tXixXUG9ciW/MiciO7GKI78BqsFd
 9w4XmHWB3aUhFuh7cGYBUMHu0C0Xi8J4L8OPyAPyOu9Z8xmqq3DW+v3V5ElFv2D5LB/KNhErePl
 iNXSg9+f+q5kFWCGTK6RKw/yIKpqyDK00d3JOrETt2vLrzEYMGARL3x8FyLqoLvhjc8d7MzM19b
 c38nqRnd92nJaHR+nzNm+J2affpE8iYxuVF3JEKWxOHxXzf60wxhlHUioJqdEgXItgHWZqDulGh
 5JZKHsSZ3eIlOKJzk0t3LcKxbL5YtNNpoFFgaRYcMpoQ==
X-Received: by 2002:a05:690c:399:b0:78f:c2f3:141 with SMTP id
 00721157ae682-7952ab20ff0mr4681027b3.35.1770323530404; 
 Thu, 05 Feb 2026 12:32:10 -0800 (PST)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com.
 [74.125.224.43]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7952a281c59sm4960587b3.49.2026.02.05.12.32.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 12:32:08 -0800 (PST)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-649b1ca87ddso1571754d50.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 12:32:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVt9lBKboNfed9d0pBjllwFMgxJUa6Kz5CGhyyltquzOHcXNYdgDnB76LuGyCBDye3nHwdzdWhy0cI=@lists.freedesktop.org
X-Received: by 2002:a05:690e:4259:b0:649:d5ca:7988 with SMTP id
 956f58d0204a3-649f1f53982mr512491d50.48.1770323527220; Thu, 05 Feb 2026
 12:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-1-ba51ce8d2bd2@thundersoft.com>
 <20260205-winged-alligator-of-sorcery-aada21@quoll>
In-Reply-To: <20260205-winged-alligator-of-sorcery-aada21@quoll>
From: Roger Shimizu <rosh@debian.org>
Date: Thu, 5 Feb 2026 12:31:56 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEkkK_qBCq__oSJb1D5J=gLyw-kVDx1OD4SMPry6z-F7nA@mail.gmail.com>
X-Gm-Features: AZwV_QiroKm7vTG3Gj0nXKqwrJ2f1hhd_XI_tJeNywGoynyWCjVs8fpCZhr8ft8
Message-ID: <CAEQ9gEkkK_qBCq__oSJb1D5J=gLyw-kVDx1OD4SMPry6z-F7nA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: lt9611: Support single Port
 B input
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 06 Feb 2026 17:43:15 +0000
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
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:hongyang.zhao@thundersoft.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jernejskrabec@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rosh@debian.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[thundersoft.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.889];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,mail.gmail.com:mid,thundersoft.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A498610146B
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 5:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Wed, Jan 28, 2026 at 07:15:45PM +0800, Hongyang Zhao wrote:
> > The LT9611 has two DSI input ports (Port A and Port B). Update the
> > binding to clearly document the port mapping and allow using Port B
> > alone when DSI is physically connected to Port B only.
> >
> > Changes:
> > - Clarify port@0 corresponds to DSI Port A input
> > - Clarify port@1 corresponds to DSI Port B input
> > - Change port requirement from mandatory port@0 to anyOf port@0/port@1,
> >   allowing either port to be used independently
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > Reviewed-by: Roger Shimizu <rosh@debian.org>
>
> Where did this review happen? V1 had this tag, but the patch was
> completely different, which means you were supposed to drop the tag.
> Please perform review in public.

FYI. v2 was updated per review feedback, which is public:
https://lore.kernel.org/all/7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro.org=
/

Maybe it's better to add this info to v2 cover letter / trailer for
easier reading.

-Roger

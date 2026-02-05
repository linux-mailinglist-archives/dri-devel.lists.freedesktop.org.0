Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO1DBjcohmmLKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6645E101417
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12C710E02D;
	Fri,  6 Feb 2026 17:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6660410E042
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 19:44:11 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-8c7199e7f79so169394585a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 11:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770320650; x=1770925450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NADkIUPSPYJ6eoj468PahRViRu/F/G/7pnep2BZi9j0=;
 b=qFRWOjOlLZrOjWebrzTP7O9oKIeQ3fg54WaXy2QNA5ahFYbpo4CAc8sjGkPrAqBFkQ
 raGKwJGfkcjJtwgJ6X9hd8CSc2UPhy7uF3qpESu9a+QBY9DTqwbbgIl3ag0J7BLwlJWB
 k0AxFhQoHVNkRPjRdLjBitv16JThDzLH5UJJvOjw+o5xCgkXlVTVlAkfHOqcJrfFR4rL
 vn8+cMhChPbntM7CqToEaUN1IIbaFQ7pTgb2WrYtrAchwkaDKsvmbvkj0RV6kSui4lx9
 WsCAqJUH8nCzgU+G+kq1haFHyrXW1pA26MySJ0Ope6wP/y9hlV5yh5U0HXTrW1OaY8mz
 p3KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqxVTOosqhxNRareKtACv96bP00gHl22c2CwWBQOxhzDhcw0HJfh5YR1ZYd2fOxtCbezrcsJwUfBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy80KQgytV53Txx2/04VlwdMwviTCR+hieo5krL3wEjArsKg42/
 Nioccl4bUIh9m4MztJAyFF6S6QjmV7hMfhkfW8M/hZKakNR1gZhAZAYCvv5KJouI
X-Gm-Gg: AZuq6aJXSdTKCajJj3CwzIeqLsOvk1v63O2vyUBCsTt7iN1cZ9Lq6lfYfrq/Reg3iYL
 231A0+95Vvv4gP3kaSG+lNCDh+g+ZN02uAbaYsW8xtnRNqrlZxpenI0PEedO8GYVxOtJ7z3btvN
 SAp4qWwZqvoprBLx2p0xGI1a3iHQq6TROBGqbAKG0pzT0tdem2Wq2cWkhMmv75zxfSlbuIhLli7
 cyPEjJvA8N9Ms/tnKv5WVHZCsPD1ZbELuidauDaN5SMyk79rfFh/EM45xqIHB1TiSQ8Z4s5Hmfy
 espSHETEELt0/QdZW1H/0l2wkoAd3wyyzqXw0sNwhfychhZ8FmiXY+eL+ArsBQk3yTLMMHAS3ad
 JFfQYTK2Mk2/KhDyfcoAl3OiT+qm1JCsWek7hnctaYDy2FeRW+eTzVTLY5bX7mGCSBVOxJd/L1O
 GAQyVriRSyKTH0S5ivoUZ7FzVXxX4jjo5hjTgPJGAuS8OWqiC2kg/axzv3
X-Received: by 2002:ac8:59d0:0:b0:4f4:e15e:528f with SMTP id
 d75a77b69052e-50639975eb8mr3283161cf.62.1770320650193; 
 Thu, 05 Feb 2026 11:44:10 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com.
 [209.85.222.170]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8953c03eadcsm2448666d6.35.2026.02.05.11.44.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 11:44:10 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-8c531473fdcso166546585a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 11:44:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCViKjot+sUy9xow5QI77pdlkmr2STOjxPTLZZGWHOeU5UckYGwDPEDNhtcfWKhF/Vpfs9B6ljHLW9c=@lists.freedesktop.org
X-Received: by 2002:a05:690e:24c2:b0:649:40ff:2933 with SMTP id
 956f58d0204a3-649f21b2ef0mr353888d50.97.1770320199620; Thu, 05 Feb 2026
 11:36:39 -0800 (PST)
MIME-Version: 1.0
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-3-ba51ce8d2bd2@thundersoft.com>
 <20260205-calm-aboriginal-mastiff-b07eb3@quoll>
In-Reply-To: <20260205-calm-aboriginal-mastiff-b07eb3@quoll>
From: Roger Shimizu <rosh@debian.org>
Date: Thu, 5 Feb 2026 11:36:28 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEm-A8mDS=6V3h=2gHOhtM39q+bR79sSFhDTvbEJbDJRWA@mail.gmail.com>
X-Gm-Features: AZwV_QjZObttSH7jw-q62i4ilWQ9P8pUKpyBFPt_sGdKcdebjL-CU0t2EfBq4Fc
Message-ID: <CAEQ9gEm-A8mDS=6V3h=2gHOhtM39q+bR79sSFhDTvbEJbDJRWA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI
 Port B
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
	NEURAL_HAM(-0.00)[-0.829];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,0.0.0.1:email]
X-Rspamd-Queue-Id: 6645E101417
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 5:09=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Wed, Jan 28, 2026 at 07:15:47PM +0800, Hongyang Zhao wrote:
> > The LT9611 HDMI bridge on RubikPi3 has DSI physically connected to
> > Port B. Update the devicetree to use port@1 which corresponds to
> > Port B input on the LT9611.
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > Reviewed-by: Roger Shimizu <rosh@debian.org>
>
> Where did this happen?
>
> https://lore.kernel.org/all/?q=3Df%3Arosh%40debian.org
>
> And again, v1 was completely different so how pre-v1-internal-review
> could be applied to this v2?
>
> Honestly, initial guidance is useful but continuous development behind
> the closed doors is not.

FYI. v2 was updated per review feedback, which is public:
https://lore.kernel.org/all/7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro.org=
/

-Roger

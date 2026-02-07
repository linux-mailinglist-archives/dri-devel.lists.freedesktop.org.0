Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AmnF6mAh2lQYwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78CE106D0E
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7335D10E2A5;
	Sat,  7 Feb 2026 18:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com
 [74.125.224.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F5D10E00A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 05:24:31 +0000 (UTC)
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-64ad8435f46so219593d50.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 21:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770441870; x=1771046670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=krDiaFFyS6239XZlJf6eTMcTjCZxo7YCdKbQY2cFgFs=;
 b=piFqk7rIUMnbQcEIVQD/AVMifX/+xMJNwK1EsCb7LBGK8B17dcX6PV2hS9OIK0IxAL
 2iGPmlOxELS7x7BRnMCbo799cS4gBielcRyYv4kkqHud98OSfTQG3LVw85R6PnQLd5xn
 MDi8RY30s9hEi2eTqy+ONIoi8gDK1NhmTB5IRgWPyhkx+GRiSO2TsQGfB0wIGTVFQ0U9
 L7whC+8DcbARVSMOZlCKoOMgl4WMEM1Dh9dTk5V6E2AZkZ1EM9G90h7Es5F7XdhqWvY7
 aTtU0LdXPhwBgg0gf9vCY2jC2qg7+6n2GeG1CgIzMglW5ihCJSbUfV+1govOucbUQMRF
 DlZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVls51eZQ+TmXTGAltj9Gc1kkd0Aj5iMMjEI89EIvLeDcbZTkgoriIo8JNnvCZwU/aqxt4H0wBz9Xc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZaj4i4TMnLNNnki9nvfWluS0Uavl9LGGbMDHkaVhlLSxh7yZT
 opbDGckb8dfezzeezByUVc7QZGgU3UTLHBYkNFjR4ASPdqCvewJwbmaZIaARzg==
X-Gm-Gg: AZuq6aKVETO40ywWokcMBdNJz16limDgHHAaVOgRQ93vSB5pRH++Hj4MIlJeJ3cq5up
 ZJ6HbKsgnoc+OYYjp/OF476YWecSz2+IUSYDwP2t/iILmy/nNX7jOr+refWoL/yOBHcM6/exA/G
 9myeMUnOPxUNOJ8Fd/cNFsASqpROk0Bnc6bGTQ8v5OyvywpADDV8JKHQptESRLc3ORLlBhYMSPM
 fW/Iq3FpKv6dpp3/8HFmUtSxXrpJtICade+XJ8gVki3B/Rc0kGoaa/BSL0y+dLk9DncyXZBVFGS
 m2Qs5C45THN0B8ylN5wSzZpIfJNIzrOSxgCOhrVfupVnIcOTTWiGc0inRELcFv0Ce0gBenTteg0
 Wb6gXee5V0OSRq9gaezjX/Ni1+SiTP+Q+Hke4BVFNqmsUQz/YBqpYQ63A7hPE/4re2WGyTYjJMr
 E8kg8gSdxF3mSb2Yl1c0lZT3CY2nprTih4KquqjNkV5A==
X-Received: by 2002:a05:690e:e8d:b0:64a:cd13:71be with SMTP id
 956f58d0204a3-64acd1373f8mr3597490d50.6.1770441870376; 
 Fri, 06 Feb 2026 21:24:30 -0800 (PST)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com.
 [74.125.224.49]) by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-649f24a0bf3sm4206437d50.11.2026.02.06.21.24.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 21:24:29 -0800 (PST)
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-64ad2a2851cso817104d50.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 21:24:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWj9O+BYmSaox7eJODRNpsNBGyF0SlVgjVVZl5brUYVqYcRn90/jRwfp1bwV5Rr4qnFiJLvITUEIOM=@lists.freedesktop.org
X-Received: by 2002:a05:690e:d8c:b0:64a:d9f2:ad6c with SMTP id
 956f58d0204a3-64ad9f2b2ffmr102741d50.35.1770441868920; Fri, 06 Feb 2026
 21:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-3-ba51ce8d2bd2@thundersoft.com>
 <20260205-calm-aboriginal-mastiff-b07eb3@quoll>
 <CAEQ9gEm-A8mDS=6V3h=2gHOhtM39q+bR79sSFhDTvbEJbDJRWA@mail.gmail.com>
 <7c6ebf5f-ed13-46f3-88c8-a33205388d74@kernel.org>
In-Reply-To: <7c6ebf5f-ed13-46f3-88c8-a33205388d74@kernel.org>
From: Roger Shimizu <rosh@debian.org>
Date: Fri, 6 Feb 2026 21:24:17 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEm=6kLFz5bdY9wtVd2ZLtmPape-GUrY_dJT8OYhzBB-nw@mail.gmail.com>
X-Gm-Features: AZwV_Qgf0EMQyeIKx49_m9UW5WfF6Aam9IpQCMPUe92xYzVqHTDk6dw3j6f9MCM
Message-ID: <CAEQ9gEm=6kLFz5bdY9wtVd2ZLtmPape-GUrY_dJT8OYhzBB-nw@mail.gmail.com>
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
X-Mailman-Approved-At: Sat, 07 Feb 2026 18:12:44 +0000
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
	NEURAL_HAM(-0.00)[-0.827];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thundersoft.com:email,0.0.0.1:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E78CE106D0E
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 11:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/02/2026 20:36, Roger Shimizu wrote:
> > On Thu, Feb 5, 2026 at 5:09=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Wed, Jan 28, 2026 at 07:15:47PM +0800, Hongyang Zhao wrote:
> >>> The LT9611 HDMI bridge on RubikPi3 has DSI physically connected to
> >>> Port B. Update the devicetree to use port@1 which corresponds to
> >>> Port B input on the LT9611.
> >>>
> >>> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> >>> Reviewed-by: Roger Shimizu <rosh@debian.org>
> >>
> >> Where did this happen?
> >>
> >> https://lore.kernel.org/all/?q=3Df%3Arosh%40debian.org
> >>
> >> And again, v1 was completely different so how pre-v1-internal-review
> >> could be applied to this v2?
> >>
> >> Honestly, initial guidance is useful but continuous development behind
> >> the closed doors is not.
> >
> > FYI. v2 was updated per review feedback, which is public:
> > https://lore.kernel.org/all/7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro=
.org/
>
> What? I asked about the tag. Do you understand how kernel review process
> works?

Yes, v2 was reviewed in private.
I'll inform Hongyang to remove the tag when he sends the next series.

-Roger

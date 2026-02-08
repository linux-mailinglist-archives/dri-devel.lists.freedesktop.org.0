Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMXxMJeEiWl8+QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:54:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2044E10C429
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE5B10E2A4;
	Mon,  9 Feb 2026 06:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACABC10E283
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 10:41:53 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-7cfdf7e7d19so1884853a34.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 02:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770547313; x=1771152113;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=haeg3n1GXO743Ijog6kKrEyqSkcsBt7foGPftVqFxYs=;
 b=iSVNRoppCXKsbf/EzQUErSwsyveAluZYjQtXQlCMMaH/quoX1HPD0OfT/UKyQlXE6H
 7INJw6PZPi48Y4k0gwkSg5wGaeovtM6UTcQrUA59i2cs1oDGuPiYmGW6HV7ABHZkd84h
 gCsiowHu6zvMnfEEeJevfCx5zqwEFN1vS5OeooeZp805BgaahzD9fDLEL+NoFG0NO0Q0
 STtWn20rYYp8OCmx0FsGLHspqktjSFSgLM0JHTmMZtihEZ4tuApy8kEYlXTXgdDea7ps
 DEVG/wxqmPYCYmocEJCejuIw4e7/fxzh1Ah17dSUcfYMJ7nl2LITeM78AtzN+sgg7mXx
 6SDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJu/5sed9qnUd3hnzGdmKSvxmYUhAhd1nSrWxqnumDPB7GcD+AvXHl2518/74LteKu1WuwzZhiMgA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD+VMpLZ5+TXL3ZlOT2dR2NPSaR08k7BwwtgopcCNOOin1rF2k
 aKW0JLmFiEWNhRSjaSZcODMql0bsevNiX3xc8+Bx0Qpabb/MCOS6eBrNYozCYg==
X-Gm-Gg: AZuq6aIswt3Omd2+gg40D9za1tQXTQuG2ARIF9Rgp5L6jjrnrLhq+2maROAJjebYHD1
 VHoa0HLd26KLx3owUJLK7uQjTDjcMieE62QEyI/XfreUIAdzgDTYN5dOr7E1PEEEw0HKXCq8l8f
 NGE4cD8OHVcqh5ZQJs56b/zg7bk3RH/UZTtmu7XUZewQI+gAPYGKA4y3lR0uhqPXLewgGZdspK6
 F6SRpKxOS22NmI24o2nhmilwMkrAnC8LFXwC3msNAceFNAzeFBPBgjUtzm/Z9pdGdOma9RIr65M
 PrUyM6XYtE124cMe3WXKDJ5tyz8CEcNILxDFWiDxyV4WiP/et9ybwWrEPCLb4jFfWGI2Lu3gIZN
 KvsG3Aa8nZW3PTBfnvD2m8ObEw07etHP0+/KOvxLVdRS93wOAKw31wo1aIXcOzQNrc/WnowTbp8
 nREJrN0o6X59Zr0pXetS+w8o5kpw51WF1HwtHAsd3n4zVqhUe5AcYw
X-Received: by 2002:a05:690c:9a0c:b0:796:2dfb:4ae1 with SMTP id
 00721157ae682-7962dfb581dmr39817047b3.32.1770540246501; 
 Sun, 08 Feb 2026 00:44:06 -0800 (PST)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com.
 [74.125.224.52]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-79634f7a1f1sm25509907b3.34.2026.02.08.00.44.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Feb 2026 00:44:04 -0800 (PST)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-64ae1729637so50550d50.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 00:44:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVkVQ4+j+ENBUxgaV9KmifMiuQnsLOeGD+6CmKQG+FM0ZKyNSC9fygihbaCdrRNryo2lR1BvVY8qXg=@lists.freedesktop.org
X-Received: by 2002:a05:690e:4192:b0:64a:d1bd:8c65 with SMTP id
 956f58d0204a3-64ad1bd9100mr3953663d50.95.1770540244041; Sun, 08 Feb 2026
 00:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
In-Reply-To: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
From: Roger Shimizu <rosh@debian.org>
Date: Sun, 8 Feb 2026 00:43:52 -0800
X-Gmail-Original-Message-ID: <CAEQ9gE=9xV7i3afybmWvE+W9aLgYWSo1X=gC4cWRMkTJYBLo3A@mail.gmail.com>
X-Gm-Features: AZwV_QhVsL319mpFfmBVf16B05oxLi4h6s2zjEvcVQi8QHoXqqVnbGWDOb-EoSo
Message-ID: <CAEQ9gE=9xV7i3afybmWvE+W9aLgYWSo1X=gC4cWRMkTJYBLo3A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add DSI Port B input support for LT9611 HDMI bridge
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Feb 2026 06:54:11 +0000
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:christopher.obbard@linaro.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	DMARC_NA(0.00)[debian.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rosh@debian.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.832];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2044E10C429
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 11:33=E2=80=AFPM Hongyang Zhao
<hongyang.zhao@thundersoft.com> wrote:
>
> The LT9611 HDMI bridge has two DSI input ports (Port A and Port B).
> The current driver only supports Port A or dual-port (A+B) mode, but
> some boards like RubikPi3 connect DSI to Port B only.
>
> This series adds support for using DSI Port B as the input source by
> utilizing the existing ports mechanism in devicetree:
>
> - port@0 corresponds to LT9611 DSI Port A input
> - port@1 corresponds to LT9611 DSI Port B input
>
> The driver detects which ports are populated and configures the hardware
> accordingly. When only port@1 is present, it configures port swap
> (register 0x8303 bit 6) and byte_clk source (register 0x8250 bit 3:2)
> for Port B operation.
>
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
> Changes in v3:
> - v2 incorporates significant changes based on Neil's review of v1,
>   so remove Roger=E2=80=99s Reviewed-by tag from the v2 commit message.
> - Link to v2: https://patch.msgid.link/20260128-rubikpi-next-20260116-v2-=
0-ba51ce8d2bd2@thundersoft.com
>
> Changes in v2:
> - Use ports mechanism instead of boolean property
> - port@0 corresponds to LT9611 Port A, port@1 to Port B
> - Driver detects which port is populated and configures accordingly
> - Link to v1: https://lore.kernel.org/r/20260127-rubikpi-next-20260116-v1=
-0-0286c75150c5@thundersoft.com
>
> ---
> Hongyang Zhao (3):
>       dt-bindings: display: lt9611: Support single Port B input
>       drm/bridge: lt9611: Add support for single Port B input
>       arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI Port B
>
>  .../bindings/display/bridge/lontium,lt9611.yaml    | 15 +++++--
>  .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  8 ++--
>  drivers/gpu/drm/bridge/lontium-lt9611.c            | 46 +++++++++++++++-=
------
>  3 files changed, 47 insertions(+), 22 deletions(-)
> ---
> base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
> change-id: 20260127-rubikpi-next-20260116-99c1dbea50e4

Reviewed-by: Roger Shimizu <rosh@debian.org>
Tested-by: Roger Shimizu <rosh@debian.org>

-Roger

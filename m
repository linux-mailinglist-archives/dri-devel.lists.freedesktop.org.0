Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K9VAmaNlGn6FQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 16:46:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F1814DACD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 16:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8736510E126;
	Tue, 17 Feb 2026 15:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K5y72xv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7214010E279
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 15:46:42 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-65a1eb5dcb7so360085a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771343201; x=1771948001; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/Nsb9d4cdh3TIN7gk7P/dLzs//wsu5O2NugIegk+Dvg=;
 b=K5y72xv+26eDHfbj2HJhTev3FYo5IdBZ984zmRA86bTPFytSxZce5g12u/2OyrYmr3
 G9QpGLUCfRnhrX+cPGvwkFi/gzukK1n6ZrxnT46vn601vDOLbd9zI9UKO5/5rPamoaoS
 0vKFN3U+15DOm/jtZPCfdHZVdGBTUrVpPeEoI0OGg/T8iSvHYuVK9jKTZRoUPWFz36+d
 6VvCereZtLmGt7dhTeFrdWw+l77MWVCcVOJ5SXvkQFbjqFCJR3jjlxN5M1ra+GyR4HJA
 mv4z1Qnh0LXTK40hquAMUKRAF+5gGhvWnXwiGinII44/ThIyVIHO3pYIROKDJhn9Sj7v
 DrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771343201; x=1771948001;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Nsb9d4cdh3TIN7gk7P/dLzs//wsu5O2NugIegk+Dvg=;
 b=EXpRT3doilkTsdbrM4+trNwl0ADflY2xK5+HoqS8ezlgJ5EU/PT8d81xa7q0kQ1Ty+
 qxCCsQoqzWv0qZ/XJqQn/E4A1GQmh6xZ0RzQEmR1XT0ZX8twDU90zcURww8ixN35sSDb
 RD2tMQcUBzeX8f699hcS+R2Os628a0X3v/caDNcx4aaXcY41DO5HwqHyJ1s2ypJkItzu
 5/Zw+I6ONQm4JNvXxMhn3kIhJREGU3smJfFL/o3Fk8OfBSMomvWhRa3gi9rAmJ46OReb
 XZ1/OJKUppjvMq7AWueOXdsTwj6cTFfuZFC5p3H0QjYWjoBCOr13+RfESjlQLzlnhJzB
 tlFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJqijrMBKRfTNEvG/sBFTbkW1C2c780HXFR9qugDt6IqxCh4QDWrcRsVJQQWHLD3NsQGog+VoTWm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP+YuPSfDVPsGZRDeIusqi7Pov2CzbatoI8U25NrA12jjuvi5V
 MNB6C5jhnofMAgSnIoSmH/Dfzme4/0TSny0p+P6qis5k3Xl1TqXjbjTTPN+HL/qQ
X-Gm-Gg: AZuq6aIh8Cvp0ztX442i6eA/ANfH92PTUPeGdGCcjYzbMrAcmzHqE0VHWGrbt2oPRC8
 J+5dwMkzK2//D5S2pA4fJ5sETshP/IAJup82XLXeiaYyeNSg1p6YJQBH61fzcEJp2MxIHGXKlQ9
 cPjp4PqergqWBTznPMNBhZTNo2gXXz1yjsyf14Pki/WQCfjlvhsHkweNWkwGp9M8q1ytnpG5Ci6
 XsdsPXQCT2B+9+/NLbOx1knA7xTd+9TNxI/e9J3+zJ9CSKeXEzdVypWW3Jg+8wx9KeDG4FLDql/
 dHDxqf/Inc9LAE/LmRfNr1b9TrUbMxZZKNHEWWjDI75sff4jompk8WYq7joFvhWaza6DOqJYmMb
 X3nTtuWt/4zgcVVYqG8obm+Jxo3YnJycNwb9zExWWgo7suZdhT9RoN1T4KWiursLna5xsIXAYQs
 TA8wgHzctaMR90i2U=
X-Received: by 2002:a05:600c:b93:b0:47a:94fc:d063 with SMTP id
 5b1f17b1804b1-48370e38ba0mr147624125e9.1.1771336712310; 
 Tue, 17 Feb 2026 05:58:32 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:ac3e:d4d0:5059:7047])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48378b5196esm129721775e9.8.2026.02.17.05.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 05:58:31 -0800 (PST)
Date: Tue, 17 Feb 2026 15:58:28 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
Message-ID: <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
References: <cover.1771258407.git.l.scorcia@gmail.com>
 <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chunfeng.yun@mediatek.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:jitao.shi@mediatek.com,m:fparent@baylibre.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[olteanv@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,pengutronix.de,gmail.com,ffwll.ch,linux.intel.com,suse.de,mediatek.com,linaro.org,collabora.com,baylibre.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 65F1814DACD
X-Rspamd-Action: no action

Hi Luca,

On Mon, Feb 16, 2026 at 04:22:14PM +0000, Luca Leonardo Scorcia wrote:
> Remove the dedicated "mediatek,mt8167-dsi" compatible from the device list and
> describe it as compatible with mt2701 instead. It is safe to do so because:
> 
> - Bootloader doesn't rely on this single compatible; and
> - There was never any upstreamed devicetree using this single compatible; and
> - The MT8167 DSI Controller is fully compatible with the one found in MT2701.
> 
> Fixes: 8867c4b39361 ("dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC")

Not sure which direction this patch will go in the next revision, but
(if this patch remains in this form, and intended as a bug fix) please
do not mix fixes for the current (and stable) kernel with new development
for the next kernel in the same series. They are supposed to be applied
to
https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=next
and
https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=fixes
respectively.

(also see Documentation/process/stable-kernel-rules.rst for what is
generally considered to be a bug fix. We don't use the word "fix" very
lightly, there needs to be a user-visible impact.)

To help the build test automation select the proper base branch, you can
use the "phy-next" or "phy-fixes" git subject prefixes when generating
your patches.

You can send fixes at any time, but please send new development for the
next kernel only when the merge window isn't open (unless it is marked
as RFC, then it can also be sent any time).

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMKnA5e5e2k0IAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 20:48:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A9B415E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 20:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5100310E1CB;
	Thu, 29 Jan 2026 19:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="eNlhLCxc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B5710E213
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 19:48:34 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-894723da7dfso18756786d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 11:48:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769716114; cv=none;
 d=google.com; s=arc-20240605;
 b=EN+4nIqVhBIx5eO9D6mrhfmCoeE/nNVWCqBdDnpFROg5A+gVOXT5tNXICYqgfsekwc
 QjbtlN9d5RQgXz8u7RdXjWJVrjeg3RQ27f2K6/lyH9d13CKmMQI7bdjuUfjkRoSVV+uN
 cMEE7gP9+EVk2KOz7n9UblM2k/7MDebopaHx9dLtmbPrXCi/hjRp2d0eBeGGxLSd3qqb
 lWELXtaxqMIVtZ4VIKsT3JgBJqwk2npo7WLCwu7GLisuW/TJO/KXWLTSALRYsIqgrf/i
 OE+vYk0LMm2QyBCFuN11rbCPGN0piwQIRP9FCa1bIqo07lVby8JOCAXQk3P0TkGSHi3F
 05pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jCTiIipBCtSXGzHyo7dsaeFVkTGnRc5PRkJmlEKnilw=;
 fh=/be22c3a3fm6b0b+0Gva82ed4CB2QZTJZyXgnoKUJDI=;
 b=ZYy/dAtpWIrk+rF06Q4PYHGCAp3mewCxpBoXoDvVN/Rkr/K3mCXspL2yxBml+jF64A
 kYo7OfC3I2CppN02xPTxD16B1EJpln6O8+196Ju0rCdHTRPilqTVlDME+opaORII++5z
 7UpU6MdfusXBb3ELYT9tncahA7UK/+MhMy6CE3IEYs2zU0wz57QTK1yY8v2HwNamvTOM
 pLP8VV6U4XcTczd+5Z1ZOPYp9zQIIhbmJ9blpJCan4YFc8Q1MgzUIifIDH3TpXa5UrG0
 Lv6HvT/rItnN0DfeHCU/CuG5pOfzWGuvvxX5yD9mtKOSu3Th05P+oWjZ9a1PYRpvnbGD
 2YnQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1769716114; x=1770320914;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jCTiIipBCtSXGzHyo7dsaeFVkTGnRc5PRkJmlEKnilw=;
 b=eNlhLCxcr30EvKwi0U3Uc6c4O+sldvpXPS7X8dZRJYmE7Z4f0FWChOeXe0hVeIxfAK
 HBdPvaxOosWvH6WYQBJYWNWD5tW4aNQcm3LGzVc5gydUbfSHrTMo1X4KEVvHIxoFNwFg
 jSGwDMuBGEV8xtMz15iTFE2LL1fI1YBp1qYo6b9kPlldrPqzqLmYuAwkOCLfY25K8Iu9
 Ptgl9SygmLCwVJgqqMiuYPDPkrKbFIVHHtPKQAgYS9zbZIP4tjir+deTPHa1/yUUx+5d
 cxifZixPT97aZPO7rHlZQyVB2ikK33ouVkskOLFR3voUEVpj2+fGWi0ZIiWhn6A17jbI
 /c8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769716114; x=1770320914;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCTiIipBCtSXGzHyo7dsaeFVkTGnRc5PRkJmlEKnilw=;
 b=GbgKlHXyMddW/X4AXRTVTO6eAx6SyApRNOS/ZYpNbVVtd5wRdzOEV+monD/ny8pKxT
 Q6y2fpd9A+mo2QAqakhmR+dfJo6ZiSPv0INR7+zNviy/6KF1SXQHAEyaihDa+e73UW22
 s47CUuwoRxas6sARcYykpCLWL7jl5aw/QkzCcW3viyU3ja/yBLil7T1i00m5ldD1sO4S
 KzlgQHYSx1qv61XpwX03VxCHX8ptPT7ljDrFi0vhYJ/umxqJUbsW3gTIY4JoecfZLSeO
 /gFrojNmkQVm1IWE0XNdjxHnZehWzssILNS+rVy9EXyni9AYE2K3IzatvneK/X9htSTd
 wAPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/NMAaP02z31LUkhmipWs76C4nIjgPNxOvHV1tKduSoDrz9BL7L+q2x9GsxpI0su/5ggbRyE1bWL4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLXPlLEhbxBMgmnONO6OtlycVPSbvVRQen15vyOEZ19wghC1kZ
 L3rag+DbFBOM/KceZJ4Ct9c2v/B9sNXdFy7qye11EBKmRJaZ1o9ubx9GQuGHPM4aYR0TiGCJxZe
 aPxXtj5JDHx+9pn7t+3OUivoadNgULDsGg1Its7BT9g==
X-Gm-Gg: AZuq6aK06gzlZ1hE+zwhIrXL9GIT+XvZXW/+EGM9zMLERj6p88bC22olfTCvSqkE1FS
 AfdD33znyJTfWliii5biEC6lTdBX+fhzZ0zxJE5JKsurX3oqn+tvi441lP2U2ekPxx8dwcAXC47
 CCKotHPT1/6X9+j1+jt7wHfUi14JGpN8Kwu6p/oPC8oTI8ZlVq5WF4KXak2iltmQIoveoNjvaFW
 8I+nIrwwG4ffH5R0/uNUJBWWVlLXzA0Rd9T0MGfZCxfb7gGkaa1h3czXdXXKoJ4nlxys9XWKuA1
 cCmDeA==
X-Received: by 2002:a05:6214:5286:b0:78d:be82:fffa with SMTP id
 6a1803df08f44-894ea036083mr8366586d6.33.1769716113799; Thu, 29 Jan 2026
 11:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20260129-dw-hdmi-qp-iframe-v2-0-0157ad05232c@collabora.com>
In-Reply-To: <20260129-dw-hdmi-qp-iframe-v2-0-0157ad05232c@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 29 Jan 2026 19:48:22 +0000
X-Gm-Features: AZwV_Qj94V5Hu3g2vxsxpVqBoJ8WOgqHl8tphwr-4jb_er0eGoDd858uNirbKKw
Message-ID: <CAPj87rNd8d2=001uE8nJW2ut7eLBtYpqCiVSRi_HkAEORG9jTw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Provide HDMI VSI & SPD InfoFrames to DW HDMI QP TX
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[fooishbar.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[fooishbar.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:cristian.ciocaltea@collabora.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[fooishbar.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,collabora.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 3B5A9B415E
X-Rspamd-Action: no action

Hi Cristian,

On Thu, 29 Jan 2026 at 12:13, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> This patch series provides the missing support for sending HDMI
> Vendor-Specific Infoframes and Source Product Description InfoFrames in
> dw-hdmi-qp library.
>
> Additionally, it improves the existing AVI, DRM and Audio infoframes
> handling by getting rid of some boilerplate and/or redundant code.

Thanks a lot! I like this version a lot more.

Series is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

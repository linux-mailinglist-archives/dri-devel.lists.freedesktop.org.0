Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFeIGy6vb2lBGgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:37:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3B47B6D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A002C10E131;
	Tue, 20 Jan 2026 13:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dlb4Kl2i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A96310E131
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 13:31:40 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so50849805e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 05:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768915899; x=1769520699; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WY2MepLOcFBoPotErcBQzrpiz1/ZQWoYp9n17tDmDMQ=;
 b=dlb4Kl2ihTnJrs62mUnq85g643BVzKgouxoWJtffx34YuP2DjmBawOA3zrJwIo1KFm
 78d7KlzUG8bPJEB9+aLki+Bf131OP5jIDKoz/LTLdiUUuH8ooY+RtCmkfJPN6OXLNJVz
 UjmpXCKa/Ie4Fj6zFLpVIbsCddwkyrQfv2QGWHLLrn8vu6Vo94Rd9CqcnBKH7SrQjVPl
 A32ShS8KZlzc3axbrMse+zf+aTk8c9qa3uu2Dqga6yrZ7+yhhFnl6iYEl/gLRq5cqLkY
 ycDqEop33Dtn3ML3VzwZef/YG9cZ2/GDLM/v4cKihiJtuRXwJ4CTXtMd+DoCCqRFsG4t
 ehcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768915899; x=1769520699;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WY2MepLOcFBoPotErcBQzrpiz1/ZQWoYp9n17tDmDMQ=;
 b=rz5vqptxYJtoZF+CsIPRx/5WEDM3wpXKB6v9hTsl+zxFvxILK4saNfRac2iak6UOOL
 KKoYRNbIUsop/w/DJZk9BN/WzR77iwpIG1YtthtkezNkOopeLbFJ8b5P5aU/W7Yu+/yp
 l8r2x1shLF5rO4CtCQ2LxZqugHcG0LSBxCPhoQJW/t/d4N9VmvThBK/c41BOah2oxm8Y
 z1nsBpSJAuPyzjrgWsnrHInuuaNJdS2kp/NMQ7ND7bLw8e1ZKL89j+dmRC38rRCYyi0v
 Plb0OUPzYiwi7kzhjS6y/iQ2jZFj36aUnB/PDP8UeqLLESWe5I3LYfswCRgx0FJt4diq
 Q2nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLzkP3CqLt5lEm1BlKvL9WJ9h6nhM5psUI+06umKdiZupGM4cpjPmj8CKr6GXlQA6B6J28J3xk66g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDRQtqPuR3cD/VJfFN+sDzBMfPh6CRLHg8V8TdRLBPu4agmKDP
 RQrkiIua2IF9WK7zRgv5GlgSjUrKcatjuTrzKIy6e4C6ih76Ki/w2Vd2
X-Gm-Gg: AY/fxX7rHcOcnVxTUF0EkYCioLJjnkRFI1/McFc3hqlrqb9QleeJ5Moa5wzn5MRysRb
 cdX5T5HXxSZFLa/dpFyDTlQsgH8YFGRCgdnc5olmEYZJl3A4Qkm6dYN0s8RKE+B20wYb95xfkTp
 9baR05kQTpiQY+rkDT6m+RZFlrdRqnHsi0uLkI1pGsMXSfJkB/jMeZw+0W+eEMHNOGsmzPylPsJ
 jAWZ7C+xDA1NpZcJCsT66/oXPaTFygf6twyOqLk6EoSl4TK8GMUoNlAt3zn4lqy4cQuI4aS5EUE
 CLBbccUdpz7mTOk424ruckVLFeoKdr1auWpqqkpVVXwzS/OuRD7dsDZcJdVE7wDryRhd/OXetl7
 +KJ8nAsWP3Pv1+uyy4Y6sJtXaZwzcnFFKs23rRc0sbkOcqAOeg+/aC/zDbA6O9kFQZraGtRVzGP
 UHRzGBOs+OuGe1fYYvgIkxdkpYgiZ8xYYcC7zoM7HBwrpVqAc/oVQvcSTjzQ6ZBBtHbDR/9AWZg
 wXf4G2eXU28OLg=
X-Received: by 2002:a05:600c:620e:b0:47d:73a4:45a7 with SMTP id
 5b1f17b1804b1-4803e7e7d75mr25412765e9.24.1768915898715; 
 Tue, 20 Jan 2026 05:31:38 -0800 (PST)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de.
 [91.98.36.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fdefed9sm109843355e9.3.2026.01.20.05.31.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Jan 2026 05:31:38 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] drm/bridge: dw-hdmi-qp: fix multi-channel audio output
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <13d33158-b814-4ac1-b8de-ec30ff16c783@collabora.com>
Date: Tue, 20 Jan 2026 17:31:22 +0400
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Douglas Anderson <dianders@chromium.org>,
 Andy Yan <andy.yan@rock-chips.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <021065E9-53DE-40DC-B6FB-CC0AE272FAAE@gmail.com>
References: <20251206072718.2039874-1-christianshewitt@gmail.com>
 <13d33158-b814-4ac1-b8de-ec30ff16c783@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:detlev.casanova@collabora.com,m:dianders@chromium.org,m:andy.yan@rock-chips.com,m:sugar.zhang@rock-chips.com,m:luca.ceresoli@bootlin.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:cristian.ciocaltea@collabora.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[christianshewitt@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[christianshewitt@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,collabora.com,chromium.org,rock-chips.com,bootlin.com,sntech.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,kwiboo.se:email]
X-Rspamd-Queue-Id: CCC3B47B6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> On 20 Jan 2026, at 4:52=E2=80=AFpm, Cristian Ciocaltea =
<cristian.ciocaltea@collabora.com> wrote:
>=20
> Hi Christian,
>=20
> On 12/6/25 9:27 AM, Christian Hewitt wrote:
>> From: Jonas Karlman <jonas@kwiboo.se>
>>=20
>> Channel Allocation (PB4) and Level Shift Information (PB5) are
>> configured with values from PB1 and PB2 due to the wrong offset
>> being used. This results in missing audio channels or incorrect
>> speaker placement when playing multi-channel audio.
>>=20
>> Use the correct offset to fix multi-channel audio output.
>>=20
>> Fixes: fd0141d1a8a2 ("drm/bridge: synopsys: Add audio support for =
dw-hdmi-qp")
>> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

>> ---
>> buffer is a pointer to u8 while data written to PKT_AUDI_CONTENTS
>> is u32, so buffer contains audio infoframe header (buffer[0:2]) +
>> checksum (buffer[3]) + payload byte 1-10 (buffer[4:13]), e.g.
>>=20
>> regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 1)
>> .. will write PB0-PB3 to AUDI_CONTENTS1
>>=20
>> regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[4], 1)
>> .. will write PB1-PB4 to AUDI_CONTENTS2, but should be PB4-PB7
>>=20
>> &buffer[4] will point to payload byte 4 not payload byte 1, due
>> to u8/u32 and not considering the size of header+checksum (3+1).
>> ---
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c =
b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
>> index f3a13da488e6..7b8a69383dc4 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
>> @@ -845,7 +845,7 @@ static int =
dw_hdmi_qp_config_audio_infoframe(struct dw_hdmi_qp *hdmi,
>>=20
>> regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS0, &header_bytes, 1);
>> regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 1);
>> - regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[4], 1);
>> + regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[7], 1);
>=20
> Since making use of regmap_bulk_write(), this could be further =
optimized as:
>=20
> -       regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], =
1);
> -       regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[4], =
1);
> +       regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], =
2);
>=20
> Regardless,
>=20
> Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>=20
> Please note you also need to provide your SoB, check "Sign your work =
..."
> section in [1].

Ahh, I was hoping to just forward Jonas=E2=80=99 patch. If it=E2=80=99s =
possible to
apply the SoB above when merging, please do. If not I can send a v2
series (someone let me know).

Christian

> Regards,
> Cristian
>=20
> [1] =
https://www.kernel.org/doc/Documentation/process/submitting-patches.rst



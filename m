Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHb9IYl0fGmAMwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8E1B8B76
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDB310E94B;
	Fri, 30 Jan 2026 09:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F4C10E8E9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 03:21:04 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-79427f739b0so17010057b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 19:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769743263; x=1770348063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jiV5Kncz1T/qBlMxS9W5DJcR/M2cylicRRM/RzT6Jq0=;
 b=urmEm0TPp2a341DvCM9FYBMtIhMDzcC6hwyBXVn6tYx5Vn3/N+XJkDFWduBbJhN+DY
 8I7eZVwwTUK/uyyvp5KNOeYoJUyRZ3hkwojsgyNlMoVC2nHB5XlN9/x9A+qK9mlZKYSZ
 ge6wtrVqLTS6Dwm55q2oYy1mYzfnWhsEuQ5jgV2W+vnrX8BfOYibBY59WGUtQcLftD3F
 BvQk6KK3H1tx3TD5VR+yV8GBXMd9REzIjNI1pjMFfmhHTOAOzzYZiademsUTwkiO8cuN
 vVZseZasXfqO4LKA+v7IBsEEgBmFz8NwfonnTkbiNcqL61jcaYGi6XznCIVT46qCJsTL
 JJcg==
X-Gm-Message-State: AOJu0YxaDGvlNp3sRhtHhW45oyAqCtCV9NsiVkJMM6Et58klzPtms8MM
 2/I7KkxnPAk93lCXlEcuLbUEEqrhv2NdV60k/D2Zp5qf1KFzqVUd2qw3me96Hw==
X-Gm-Gg: AZuq6aLA+8OKMRP0V5V/p3hgQCCm9p6hjlexLBxrBToB1mLMOpLflN59xtTwKr0sCue
 FMuYAEf5OBISKjg9YYbWFrKmM2p1eOMkNnBlnAqu4uTrMjez0uEPoIgykYjm90Ly35+sd+yVmKM
 H6WTGEL2YNFOeiCgbRmfeHTpBUflp/tyJOsZ7vPFt+EGNBHfbTHv4f1qmaDf9MN4KW9KIe951Uc
 dAalq4d932YhMiVBJttkRLmifdXx+5Cp+Edh8RB4sPDg07zB//RI0Rij0pd8Aq03yWnv0vSm6aA
 ehf3zAiZgKh3qjJpTbcBr3u7PBWomz5okfYy4mcKBM9wsKHVsJ4OmwuJrZOr5Ai4F1UYkPxhRoS
 qRiz6aUi7PkLfg66ihYiqb5uXqNBX6QY6U5ccj6LWZmPNMPN9mgP2ICOdy02Uo3RPugCS/xQFQy
 ItnMDa3MJBqbkWqTi7Oa+h87hdusy3BODSqIV0S0vRJg==
X-Received: by 2002:a05:690c:60c4:b0:78c:6854:2771 with SMTP id
 00721157ae682-7949df9b413mr18268597b3.36.1769743262915; 
 Thu, 29 Jan 2026 19:21:02 -0800 (PST)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com.
 [74.125.224.42]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-794828ca424sm31777167b3.42.2026.01.29.19.21.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 19:21:01 -0800 (PST)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-6495d592b58so1620693d50.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 19:21:00 -0800 (PST)
X-Received: by 2002:a05:690e:1306:b0:645:68cf:2bf4 with SMTP id
 956f58d0204a3-649a84b4a53mr1186121d50.77.1769743260103; Thu, 29 Jan 2026
 19:21:00 -0800 (PST)
MIME-Version: 1.0
References: <20260127-rubikpi-next-20260116-bugfix-v1-1-46e3396533ac@thundersoft.com>
In-Reply-To: <20260127-rubikpi-next-20260116-bugfix-v1-1-46e3396533ac@thundersoft.com>
From: Roger Shimizu <rosh@debian.org>
Date: Thu, 29 Jan 2026 19:20:48 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEm158YKRPa6V2rOnrgnRxkrXSrbb-WZh5rh7SDGVLM7xA@mail.gmail.com>
X-Gm-Features: AZwV_QjBX3OduJVjiDZ5rykYl9Th8jYYy3m9UC8aQ8njTEevSWaknXNmMFugk84
Message-ID: <CAEQ9gEm158YKRPa6V2rOnrgnRxkrXSrbb-WZh5rh7SDGVLM7xA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lt9611: Remove I2C address change in sleep
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 30 Jan 2026 09:06:10 +0000
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,thundersoft.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,thundersoft.com:email]
X-Rspamd-Queue-Id: 1D8E1B8B76
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 1:36=E2=80=AFPM Hongyang Zhao
<hongyang.zhao@thundersoft.com> wrote:
>
> The lt9611_sleep_setup() modifies the chip's I2C address via registers
> 0x8023/0x8024 and reconfigures GPIO0 via 0x8157/0x8149. Since there is
> no corresponding restore in the wake-up path, I2C communication fails
> after resume.
>
> Remove the I2C address and GPIO reconfiguration from sleep setup. The
> MIPI Rx power-down and TX PHY disable sequences are sufficient.
>
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
> The lt9611_sleep_setup() function modifies the chip's I2C address via
> registers 0x8023/0x8024 and reconfigures GPIO0. However, there is no
> corresponding restore in the wake-up path, which causes I2C communication
> to fail after resume.
>
> This patch removes the I2C address and GPIO reconfiguration from sleep
> setup. The MIPI Rx power-down and TX PHY disable sequences are sufficient
> for proper sleep operation.
>
> Tested on RubikPi3 (QCS6490) platform with the LT9611 HDMI bridge.
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/br=
idge/lontium-lt9611.c
> index a2d032ee4744..ae47efe9d77f 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -424,11 +424,6 @@ static void lt9611_enable_hpd_interrupts(struct lt96=
11 *lt9611)
>  static void lt9611_sleep_setup(struct lt9611 *lt9611)
>  {
>         const struct reg_sequence sleep_setup[] =3D {
> -               { 0x8024, 0x76 },
> -               { 0x8023, 0x01 },
> -               { 0x8157, 0x03 }, /* set addr pin as output */
> -               { 0x8149, 0x0b },
> -
>                 { 0x8102, 0x48 }, /* MIPI Rx power down */
>                 { 0x8123, 0x80 },
>                 { 0x8130, 0x00 },
>
> ---

Tested-by: Roger Shimizu <rosh@debian.org> # Rubik Pi 3 (QCOM QCS6490 platf=
orm)

Before this patch, HDMI output can be used just after booting / 1st pluggin=
g in.
HDMI gets lost after the disconnecting, and plugging in again.

-Roger

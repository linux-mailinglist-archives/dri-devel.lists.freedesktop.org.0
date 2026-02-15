Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lziFBQBHkmmcsgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 23:21:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5454413FE44
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 23:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E613B10E05B;
	Sun, 15 Feb 2026 22:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MuiMfJnt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AB110E05B
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 22:21:46 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7d4beaf25deso1895548a34.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 14:21:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771194105; cv=none;
 d=google.com; s=arc-20240605;
 b=PZEd1uGRxYZyit7Jyj2kje733G6DPMmk0rqUR3AbKEkf+842TnKZY8xmRr4FHogsrp
 gp/NzP6wwRsJo/OSEAiKf0b6y9Sa1P++jxMvYq8o4pBeCTBtuH5h0jFTVXbCP85mefby
 uO4mkTct7+NWSU8PbFdIgfF9arUPx9nUeWKvtiYkkTy/M8evHfLYTId200yvYb9KmB9z
 lle074JCgjEPWjXQU3YiXuS5mDM8KzVbs38X143aVQNqbbubYHqj26sVN4INbwnuLc/q
 3s1oFMUsZ2NJbZbJdmpvSTUlpQq3CsYim4CtKWeKRKpraJV8oiHQvdf/zOaMiZWQT+Xm
 qWuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JoXcfX7QZiwqawmcK7WDWbqjkD7o01Kl41BVrnneLZk=;
 fh=r5sB6UVIwU5HwLX2AAw0O+jiswwlF3fgFKXJKhjkn18=;
 b=kvgCM4hSSwiGxuHNWatvidoJHxE38gU1CeOobCarjiLUCvYfT7n631HyHIsXH0gi/M
 6ExUmiaFZeyYCfaUXxptsjsV4SmSWK87m2qurA40IBk8kNlX0iL9uaL3O0UdDbooFgyS
 m/Exye5hi0SxsdwfrV4iQ2Jzw1HnlFAg14qPAvUMfYiLTFvMJZx8TPzMLrI06Ola4w8N
 jOtDu8jO/G7Cv4V7KLJ0H7baY+dOxG0ojxKrd0riJbc9dGM7YPhwN6URZRdHqiHjW05O
 iPvgh0I7thilU7YKu3U1keBFgN+1Zw+P4932DuMTjbv6qF11mbNyUpip4in8qBBF1m5b
 FtjQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771194105; x=1771798905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JoXcfX7QZiwqawmcK7WDWbqjkD7o01Kl41BVrnneLZk=;
 b=MuiMfJntpByvRUipCoqXa7z6tF50l+oIJa8v/TVrVaMxL/m80/jv0LJi7ujCfYH1mb
 e/jZRG/vH8sFfwYZiv7fnrMr6mOOgs28bnLnvlKv2mwr+/sg3EcqG3shloVgQpj5maao
 Gv3j1ptiofa8dV6AsEqoEdCMpMKN9H/GqpFecr/efYVs8BBcZMLMa2ylcesazaO1ptaH
 6hncvcr7Gj3oyJV5e6op1JawCFcmYeaAqU6f6YQR8SZZvYKMaxHi4YEdncBBb1TTKkoM
 K7szizzDCL/mGPzsE6ZXwD2O0OYNfIBhBqSZDFUGdKqQ87awIznOLLVW64XGlgG1tXq1
 QwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771194105; x=1771798905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JoXcfX7QZiwqawmcK7WDWbqjkD7o01Kl41BVrnneLZk=;
 b=tb5HVUmLFwYQe4z5HyjfidoYNDCKrWpIa3kx1+nhSBV6LcIUuxBaKOd+gzeD/x4LuD
 rGK6E5CT3fvdFaDsZqnXhNToFze+8Nng0hyC+Q9DXXQxC1JR0KztZwCEKPqX3BHN/7Ua
 u2/m1Snvh5Wus4khCp7Ls17q/3diYQusyzfXHiRWsKSHm5QwbogYSkIThN37jjr9s/cd
 tibg2nxOr42U8sXTOTXFbMS9hrl81m7FcBK5zX+0ERcpnkXLEdo8XELnwnkVZ64B1GVq
 lRdnrp3kwbSu2ir8PP5VK9uZE8uWNJHnE5YrxGq6sWwdc8yZjzg74gmiH6yavvVFoeai
 /aMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4gJ1NGtC4nkE3yU4U+6QmtlDblgxBx2dfGZBnVgTF1KTb+jJe8Uu4Hyep/QM/aC1aZ2aAQM/qkSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBfik70uTs0LTHHJ6j/q6+7yCceg4M3bfc2HRbPdY6UQFrQiJP
 agNrnpLjK2eVINIY4rahmx5bjrKZCG9w3J8CwkGJj3sdElZd/ngx5+MeJl6a14sVtEsqHohwS04
 QIkbViAJ2MI2u60Q43S1JVvXRdy4k5IA=
X-Gm-Gg: AZuq6aJO7BZxh86BOtFcNsJc7m/Xb5k4e7mjQ161NKgqFkUxd3ZRVAt5WuojdTlagpI
 QkvRNcsiUDbg7NN8cze4GGL1ruvDB4SCGG/CgCwuXzSr1V2hmu0k+mIcSZycW49v4SJc3+Iot/a
 Y/tJegiTTn66UZpawgUJFEe0VSa9Ht0ndfwi6q8XGBftbod6rbGBK+UmrWYj1ZTZXU+uKB/jm+f
 QZjxjZmtcT/WalCReE7P9q6uEyBXMbZon0eH4HcGyrWj7Ysf/EkhTcCqn8ba9O4CIbJfjhHzB1t
 sDtqEo+o0PAyEjc1
X-Received: by 2002:a05:6820:3090:b0:676:ad01:3c2a with SMTP id
 006d021491bc7-678220d7fd0mr4298684eaf.21.1771194105145; Sun, 15 Feb 2026
 14:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20260215100302.136719-1-work@onurozkan.dev>
 <20260215100302.136719-2-work@onurozkan.dev>
In-Reply-To: <20260215100302.136719-2-work@onurozkan.dev>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 15 Feb 2026 16:21:34 -0600
X-Gm-Features: AaiRm50FAT8RVr0tUWCN3V2Yh-fEe1_rpCxpthfdlSnrl4R1jpbzNo5n6ndNC5o
Message-ID: <CAHCN7xJJgLxPSf0QJ9nvY4Z3BguDmYJtpeprT+obD5DgA8rOgQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:work@onurozkan.dev,m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aford173@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aford173@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5454413FE44
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 4:04=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> If sram-supply is missing, Panthor falls back to a
> dummy regulator with a warning. This implicit behavior
> hides missing DT wiring behind regulator core fallback.
>
> Make SRAM handling explicit: require sram-supply for all
> Panthor compatibles except mt8196-mali where GPU supplies
> are intentionally managed outside Panthor and DT does not
> model sram-supply for that compatible.
>
> This keeps DT power modeling explicit and avoids relying on
> dummy-regulator fallback.
>
> Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/=
panthor/panthor_devfreq.c
> index 2249b41ca4af..5f6075f18fe3 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -206,12 +206,17 @@ int panthor_devfreq_init(struct panthor_device *ptd=
ev)
>          * But without knowing if it's beneficial or not (in term of powe=
r
>          * consumption), or how much it slows down the suspend/resume ste=
ps,
>          * let's just keep regulators enabled for the device lifetime.
> +        *
> +        * Treat sram-supply as mandatory except for mt8196-mali. It mana=
ges
> +        * SRAM outside Panthor so this driver must not require direct co=
ntrol
> +        * over it.
>          */
> -       ret =3D devm_regulator_get_enable_optional(dev, "sram");
> -       if (ret && ret !=3D -ENODEV) {
> -               if (ret !=3D -EPROBE_DEFER)
> +       if (!of_device_is_compatible(dev->of_node, "mediatek,mt8196-mali"=
)) {

I wonder if a more generic device tree flag would be better here.
What happens if others do the same as Mediatek or Mediatek decides to
do this with more processors and this list grows?  It seems like a
panthor binding might be useful to prevent future bloat.  As of right
now, the 8196 isn't uptream,so it seems like adding this flag would be
harmless to everything else, and it woudl likely be required on mt8196


adam


> +               ret =3D devm_regulator_get_enable_optional(dev, "sram");
> +               if (ret) {
>                         DRM_DEV_ERROR(dev, "Couldn't retrieve/enable sram=
 supply\n");
> -               return ret;
> +                       return ret;
> +               }
>         }
>
>         opp =3D devfreq_recommended_opp(dev, &cur_freq, 0);
> --
> 2.51.2
>
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNj3Hfs5qWkd3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D27620D312
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4940810EB44;
	Thu,  5 Mar 2026 08:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cVm/ouCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5489610EA87
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 18:04:43 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-2bdfd129c52so4017945eec.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 10:04:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772647482; cv=none;
 d=google.com; s=arc-20240605;
 b=RAUGsQ8mtg2U07B3XX0GdDdH8S4iQjL8KCnqfmFrDRsBRRA1RxC5E2qelHMc7v3UoM
 lWqDb1+j9W8U4hzteNbsHewMWkWZi6waXz/0cvNYvcAKYCfwkAifoR2KcomIcNO18RbU
 rP5sdpRX9WtmhtIb5d1AerH33vdwUhx/4kFeH6hKj0eZQvvsajr7rrEV9lbp9PuPCDcu
 NSE0r5LbxKcM8VoxQWAH9NiKDXkRZSawOsFh07vAzM4FV00k8U9noslWQDskfFidmM7E
 3F/43qDt6p8Tz6VnnRwlEm27zw/HY+BZAQyXxiOxVAJMV7lco61J1z79omfdQYqrc84u
 J/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YUW1z33hdtfbSwh+C6wGyvDQ7mFLxb1NGbmJMsFO238=;
 fh=M2RcMYzsPsW3oLBoJTzNmUnbI7iT0klw+cF5Tdhr/AQ=;
 b=jRhVkVx7+eZwnt/CRCtCPvInM3zj6YfKTfxXG/UJL3+Md4HIP+HK93dpGGi57HMOjP
 dJMTm5+dDpce6CxQZc0Xntm4rsHlpm3h4pWVwuOrRXR7/OcxbhsJXgk4BOrTzguxp7XH
 A2Z6kFrKPQByFfEdQZz38k4zAqyPfpmWc/iqhVEkkpjnbZe0IQKJktFJbL3DDWWVwVBk
 RO07Zacg+TOoKNIQ4Z6G0LhJWr84Mab1+sCbo06TR/wok+jGxBeiCOVH5BMhxq4TU0cI
 snAwg+rhxdCtwXjSyGy32bBSbRInOXZzyKbpvM9jKCBPd/vQYGKyluswiZYEM95AJEPK
 vt2A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772647482; x=1773252282; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YUW1z33hdtfbSwh+C6wGyvDQ7mFLxb1NGbmJMsFO238=;
 b=cVm/ouCvybYvs4SmUTCcr3xyFi1gDZtUce3YBIpRN4Ksm/acwMzUQ0AbE/qp1V6gwG
 UZ7zy/x7tYGrVU4FGYlZwRGq4ZPo7Ejtl3r8P3/LI2HqgiauzcXqwRBTKRrUWtJ5wD3N
 2f6CDvLEZm4Do9jaS4EfA9oOJqVh+xi0g6bElvpKLa2sC3DomfOOM4ap8VjPjOrOAWvu
 J+zT8xG/ZC9qaZSshyUtkOKVJejgzqUfG7jKVQUoYwZzejwpiWtZeUrXFqO5TmT2SniJ
 WSAw7nbJNPjGrlxy9+YFP6tsDF0a1nfktQUo8mv/6N64+oX215Q1MraLMpKxCLyZVV1t
 COtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772647482; x=1773252282;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YUW1z33hdtfbSwh+C6wGyvDQ7mFLxb1NGbmJMsFO238=;
 b=VlqWw682m6JBKAHBdKGAQj6E8mZODhAJ9dURZKU3KAP27BffDRgAUVXCPTwqhg90UE
 TwLsbf0+JHc8g8wH1xM2WSgYrX2Dog82i60ElEMiOtvhsZKN6DK/HJsjL7oWFdyxVbdh
 ZDtnlqgMiUdB0MIUFtF6U1ASzwZSrhns9kuHsuAjZ05NvIRQMJVdnHOUzOK2m7aGDhLW
 a53f/D591IB9jTH2b6YLkqy3YuxtjSO01C700YSc08r/e1TXX8ldBeJkqjx3kCY4ZwfI
 elXr5XgAi5hHKlynB4wITxBU8GZAyBJWoT5JjiKtqqNbvlBwSgHNSsKFoxwoFlOTdX9q
 Ui6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7FWTS1nfFKHuR4d9xbTU3yYwQogGfLgMrDohuG/DSpPwsc//VSg4qSvQqMuZAC5eITDajOpO0SbM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK8ynWpJnq5mDkkb5m5oxGvz+5dRo1lSqM32YAXIHUxV2xcwYY
 8X3of0RW+kSeoCVZ+fmr4moghb+5yFB3oK5xfX6HCYyP1kjOyr7pVx2VCAMJUV798rmyyv7Uzxg
 kc6gVGw2ujZLCQ3npm2uI+voSPBGz1AQ=
X-Gm-Gg: ATEYQzyxw9bEg5REuS+pPxqe8HPGLZv5h0ipqgPbOvmczahYRi4CBCH8qLaoNDaVTUO
 zUUDhP26isELV5HRmPjnbBnoOzeBuvhNXTyEIxXiFKv01BSIOi90IEOfYLX7i3cgCl4hGZOMiu1
 9cKU9lbzXXTL0/h3nRwerQ0k4udPHjLOaI8e9UqHy2xM6/+1QUaNLJQ6wL/RtFGFDT0G6neeAIL
 fUOtezYUmVwxqUrGJNlqIfDTeMDYdbVvHfTJirjw/asBRXYUSCjajojEU50uXT7xKDDPsGeVG+R
 xaBgwfI=
X-Received: by 2002:a05:7300:570f:b0:2bd:c883:5f97 with SMTP id
 5a478bee46e88-2be30f941b0mr1107602eec.4.1772647482477; Wed, 04 Mar 2026
 10:04:42 -0800 (PST)
MIME-Version: 1.0
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-3-7756209477f9@gmail.com>
 <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
In-Reply-To: <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 4 Mar 2026 20:04:30 +0200
X-Gm-Features: AaiRm53L310AKJxACRT6XTM36Tn3jEqmfP1MmjLiZ-2-W9tuhbMJrDR64WApO84
Message-ID: <CAHuF_Zpa+cr6aq89kCon1dC3Q0PEV17VfyAbqF0Ojgmgn32yTQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable
 MDSS and add panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 =?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 05 Mar 2026 08:07:48 +0000
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
X-Rspamd-Queue-Id: 0D27620D312
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,0.0.0.0:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 04:46, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
<snip>
> > +
> > +&mdss_dsi0 {
> > +     vdda-supply = <&vreg_l18a>;
> > +
> > +     pinctrl-0 = <&mdss_default>;
> > +     pinctrl-1 = <&mdss_sleep>;
> > +     pinctrl-names = "default", "sleep";
> > +
> > +     status = "okay";
> > +
> > +     panel@0 {
> > +             compatible = "samsung,s6e8fco";
> > +             reg = <0>;
> > +
> > +             vddio-supply = <&vreg_l9a>;
> > +             ldo-supply = <&panel_ldo_supply>;
> > +             iovcc-supply = <&panel_iovcc_supply>;
> > +             reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
> > +
> > +             port {
> > +                     panel_in: endpoint {
> > +                             remote-endpoint = <&mdss_dsi0_out>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&mdss_dsi0_out {
> > +     data-lanes = <0 1 2 3>;
> > +     remote-endpoint = <&panel_in>;
> > +};
> > +
> > +
> > +&mdss_dsi0_phy {
> > +     status = "okay";
>
> Missing vdds-supply.
>
Can you expand on that? The `dsi-phy-14nm` schema doesn't have the
vdds-supply property. Do you think it needs it?
<snip>
> --
> With best wishes
> Dmitry

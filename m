Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJSdEsp6qWl77wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:44:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCC3211F37
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9D210E20E;
	Thu,  5 Mar 2026 12:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OtqYMvb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B641910E20E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:44:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 836AB40E58
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62260C2BCB3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772714694;
 bh=7/B3L3Xu38pLEI9aWzEuoVdxX7Qp2NIDeM+Gg1/xjBI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OtqYMvb5oPxe5sMzeuWM/p9QhfY79P8WSa8Oc0dmxSoFCqAxC+CeiyJ4NR/CKYXp5
 2pWsVJ/8dTjJPaOTsMOrLWg9QrWyIT17qWYKoWkp2uev1+hKn84FX5s0QnjAl8bNE/
 7JpPIBkXPhGvuxF9NkQde6xY7s3+z78cNibHOOJcW8DPll2R+OOPS/ZPgglANmm0bm
 z+fq9gwNqWVY2cpjU7AjP46t/Fi3qyyprLoCv6ETr3JC7/UsdbQoEj4fnlA7mjJ3u9
 kpBnTLkqR3bbedcx3T7TtOd2iumdT2sN3/QFxWt88OY6wGjq0mmb5qwwhn72EVc8bD
 zEhwMty5ybC+w==
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-649278a69c5so6885968d50.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 04:44:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUnGGjVW4sIUrkkbGgaWnJNq2IcdeO0K1nCd912ougUZ/PKnFQmw1HFPruslZgryZtaAdQ2gpBU2Fs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvfSnFajX6Ggk4IIj+1a/bu1I5EfWlLYt1jwxWmXFthuP3bjiJ
 jS2aTeu0NEgGHnlS4KtXaveGUnfcr2xwZMhPas4Lsx3QamSxIAbjRPg/r8ziVkWoyHA8d395+ME
 lcgiSrTeo/6BlYVzCsopyQRoxZowzGe4=
X-Received: by 2002:a05:690e:1a12:b0:649:5a6e:bc88 with SMTP id
 956f58d0204a3-64cf9bac208mr3552462d50.46.1772714693758; Thu, 05 Mar 2026
 04:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-19-vladimir.oltean@nxp.com>
 <CAD++jLnCtu20rXcg7sMVLBi24EohscJoz0kN46XJaKPJt00O2w@mail.gmail.com>
In-Reply-To: <CAD++jLnCtu20rXcg7sMVLBi24EohscJoz0kN46XJaKPJt00O2w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:44:42 +0100
X-Gmail-Original-Message-ID: <CAD++jL=m+cEcqy1i2H0tdeBa3Sy76myGAR9HdBqrT4u-x5v50A@mail.gmail.com>
X-Gm-Features: AaiRm53u9phsGhzUDeKiqEnTp_X3DfbqaQ7dJ0SVurbn78IH1263DExaHPtG4YM
Message-ID: <CAD++jL=m+cEcqy1i2H0tdeBa3Sy76myGAR9HdBqrT4u-x5v50A@mail.gmail.com>
Subject: Re: [PATCH phy-next 18/22] pinctrl: tegra-xusb: include PHY provider
 header
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
 netdev@vger.kernel.org, spacemit@lists.linux.dev, 
 UNGLinuxDriver@microchip.com, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
X-Rspamd-Queue-Id: CBCC3211F37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,gmail.com,nvidia.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.oltean@nxp.com,m:linux-phy@lists.infradead.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:freedreno@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-ide@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-usb@vger.kernel.org,m:netdev@vger.kernel.org,m:spacemit@lists.linux.dev,m:UNGLinuxDriver@microchip.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[linusw@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid,nxp.com:email]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 1:43=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
> On Wed, Mar 4, 2026 at 7:00=E2=80=AFPM Vladimir Oltean <vladimir.oltean@n=
xp.com> wrote:
>
> > The tegra-xusb pinctrl driver is also a PHY provider (calls
> > devm_phy_create() for PCIe and SATA). However, according to Vinod Koul,
> > having PHY provider drivers outside of drivers/phy/ is discouraged,
> > although it would be difficult for me to address a proper movement here=
.
> >
> > Include the private provider API header from drivers/phy/, but leave a
> > FIXME in place. It will have to be moved, eventually.
> >
> > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
>
> Fair enough, is this a regression so I should merge it for fixes
> or just a nonurgent fix that I can apply for next?

Sorry I realized it needs to go in with the series.
Reviewed-by: Linus Walleij <linusw@kernel.org>

You can take it from here.

Yours,
Linus Walleij

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLbJLOFCpWkg7AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 08:57:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207C31D437B
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 08:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5A710E44A;
	Mon,  2 Mar 2026 07:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ltY5lUjE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A9510E44C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 07:57:16 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-439b611274bso438456f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 23:57:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772438235; cv=none;
 d=google.com; s=arc-20240605;
 b=hCil2vOo2Yqc38ktmA0jCQFV9k3Yb3z5JcM2Pm95XRUX7alQ3387t913cmP6zfBdut
 SHww3HTcD3r4VfAo6mlGM/wQ3Hry3OWGzBXlCo1ouzjRCmuzVbmPejWy8FjJlpE0VLUG
 RSbTGm3aZWJDEARkmQsqkNsCt8jsVre2kJGxp4uEVTcozDREtseKFs/o7Yf/IAOUYMxD
 jSihy8oA3mMwllmu4WfUuQ72ATLtDcaFDYtfrU6Q1kQQjfFwPZsKtRHumPKTfu9sVam/
 gPcoYRmOzS0sFNR9ANrRf2Xlq7Nq67IybQSupaIX+86B1y5H1wxK4Fh7TGhX3WTz2Tj1
 D8zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=it6CBEYGUxeKU7qPZhmd/t1y3gj2Uad+roI49skbLD4=;
 fh=yU0WPAS4XI+F+gmdTFUI+zk3cqgWcranFmafFxMsQqQ=;
 b=doiNDzLVqVK8mUswClx+FRDnRoifJzmVcFouA/uoBLaj6ZKqQ34FwB1kwOnJNj33r7
 kbfmwQ1DkIou/gHm3eOFkJfx9bvvUgqjthUb9mR9pcIb99g/papcbo0XRPKvYzANddCp
 s5t0kYs7U/l0ga/llxynh/uN1o3LEI3stz8cHBrpYR+6gp6SrNpKANBe9jhqYFGqLBYo
 uuJ72vbhnO7rnGd3o4UcWW2sBrBhHRurNo8D/cF8rHt0o8UJRY8DyS2J3aj0Uwqyc/wh
 CAe4WQqCB/NPhOjlGXPUilL5ZTKRPJDI9upNaiROJsCNARHfsMDPqmKYAvxqJw9F3SHi
 qxew==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772438235; x=1773043035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=it6CBEYGUxeKU7qPZhmd/t1y3gj2Uad+roI49skbLD4=;
 b=ltY5lUjEWJ1FvZnqJz1O5Z17w1oPOVL9YZW2XZrCn8kLGHMt209oDNgJZVcS3Cxwnv
 doZ/A/cAtq08KPkdW6R0L5ht7bhIxGLhiprbjcYpDrWPdEvB6f5akRssuNsK/ka6igBN
 KKpvmqSbh7dRriEqcGOmru+eWL1eidxpZRSy+FtbsOQoTovhcJZlkA2H030EU/WgDC/J
 NuRLHPeGAvAcPttFL5XlS9XGlGQoClMJuGIZek/C5hqXSGZTPYNxqYpupHWBUO51QmTy
 dMcUttSszt3yF04RlZhTX8ZCKDteuMKPNtZ62HJeiDC6u7fXpj/iZmjYIIgG3/aNjoCx
 OxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772438235; x=1773043035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=it6CBEYGUxeKU7qPZhmd/t1y3gj2Uad+roI49skbLD4=;
 b=WlrE5mFwrykVKknywewxwaBk40Ba5Hzd95IzoPs5Sr0sJ/XJDxZ7tzaAMi77DPaQsK
 uZ82RRAIogIzcZ6QizZ0sBphdna8ZfsxAH+QtRHLxYVfUSJC9nAveB3/eElCHS0I8sP9
 0gpmhhOViLmYr6Pu/vadPDx5GGpdyZ4+eL0RKZIM0BUPGfMJ8rk8t2lW+ZpnlD5GNQZ0
 pqgZI0Fgv5qS6StjCxWZQaYVB+DPt+c1ZJDKeXdgCCMhgb+KXAeKn08Uk6SndLIBoRF+
 vcCsFBu4P0eE84eW9SKPKvSAs6tpGrR8LpxaRdtXjCDG3RRKY5xXe8OVJ5Psi9EhPNpM
 SRSQ==
X-Gm-Message-State: AOJu0YyhfRkma1/ishkWtYCJc7Mu1evqhCmK1ucN4f9fh96cnNLuSx8R
 hfFuRLyc5G0yCfGnod4wBPgDEDUSQ56HbvgF8apRuOJVe78BsCqF47TVAel4z6k/rYiiIIaZ7Dc
 blNSI6ONUNy1UuwV0pn4l+d2ejE5CqqY=
X-Gm-Gg: ATEYQzz4FXn2IKoXpRqUkCu0MQVH5zjcAGqoDo41bW4Y7smr7K5+UrdfWRY++lTFxBP
 cx3wNdSyOZ3gRabuxsuu9ecDVUtbsxKOEcjiLL89J9i2x+gkLFu8lIDIrIRqR7aOcrs/3j7MivH
 F/Gk/zG2Dff5qrNzSUfWBlzOAOE3wkXuKpWpTOChBn7ZX81ikhxcYEEBnTt/Iwr7ZoeiZ55ttgd
 cOc+6VESmSXJg9YTO2OeIpg+celxXCCN7mHRE4DP/ck9FEGzb0r5VvCketp0f+seOxIBSkjtYI5
 rw83uweH
X-Received: by 2002:a05:6000:290b:b0:439:8f32:8668 with SMTP id
 ffacd0b85a97d-4399de3a727mr20452034f8f.58.1772438234867; Sun, 01 Mar 2026
 23:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20260125131323.45108-1-clamor95@gmail.com>
In-Reply-To: <20260125131323.45108-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Mar 2026 09:57:03 +0200
X-Gm-Features: AaiRm52QXrS_uNzAE53fZY3HX0KwqHOMM5gpUzyqiFLf5Zuznuez0suGHr74yCs
Message-ID: <CAPVz0n0k2v_4pQ-hFhah8i_0Ne6GeggLcDk7=agVyg7Wvp=cBg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, Thierry Reding <treding@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:diogo.ivo@tecnico.ulisboa.pt,m:clamor95@gmail.com,m:treding@nvidia.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,tecnico.ulisboa.pt];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 207C31D437B
X-Rspamd-Action: no action

=D0=BD=D0=B4, 25 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 15:13 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
> logic and clocks. With a few minor tweaks, existing tegra DSI driver
> should work on Tegra20/Tegra30 devices just fine. Tested on
> Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).
>
> This patchset depends on Tegra20/Tegra30 CSI bringup since both share
> MIPI calibration logic. Ideally these patches should be picked after
> CSI bringup but they will not break anything even if picked before
> CSI patches.
>
> ---
> Changes in v2:
> - removed all MIPI calibration, it is handled within CSI bringup
> - added per-soc structures into of_match
> - added fix for hang caused by register access with uninited hw
>
> Changes in v3:
> - switched from version DSI to boolean flags
> - added comment regarding Tegra30 clock configuration
> - commits were picked:
>   "clk: tegra20: reparent dsi clock to pll_d_out0"
>   "ARM: tegra: adjust DSI nodes for Tegra20/Tegra30"
> - commit adapted to recent DSI changes:
>   "gpu/drm: tegra: dsi: move prepare function at the top of encoder
>     enable" > "gpu/drm: tegra: dsi: re-add clear enable register if
>     DSI was powered by bootloader"
> ---
>
> Svyatoslav Ryhel (2):
>   gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
>   gpu/drm: tegra: dsi: re-add clear enable register if DSI was powered
>     by bootloader
>
>  drivers/gpu/drm/tegra/drm.c |   2 +
>  drivers/gpu/drm/tegra/dsi.c | 116 ++++++++++++++++++++++++++----------
>  drivers/gpu/drm/tegra/dsi.h |  10 ++++
>  3 files changed, 97 insertions(+), 31 deletions(-)
>

Hello Thierry!

May these patches be picked if everyone is fine with them? If you like
I can amend and resend them with Mikko's suggestions applied.

Best regards,
Svyatoslav R.

> --
> 2.51.0
>

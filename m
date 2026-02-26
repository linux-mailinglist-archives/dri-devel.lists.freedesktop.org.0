Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANFQGi81oGkqgwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:57:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B991A56FC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F7A10E8E5;
	Thu, 26 Feb 2026 11:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kHVZ6FtY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1225A10E8E5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 11:57:30 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-5fe086fb0bcso149807137.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 03:57:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772107049; cv=none;
 d=google.com; s=arc-20240605;
 b=iBCT8AFHL/6KutQkUKEsQw8khbAzSU9/8MDtnKb2dLF2ztIAExDRpjjTotHnI83YNI
 JhHLu4ksAWS1Ob1n+8azMGcG3FHlV/0K46t0qCXgO+mqHPZR62L7l2Zor2kSc/47T4+e
 1nuiAEsUDt1Ko2vWlSiAH7bBP6M0XDt1amfTqpJ5ltL4sS/LYRTMGCqnAsPBln0dhLgF
 ZmKuThJB5XOa6ZjRXG1FvzMBImJuaLbiElIMQtBa8qnZ2GXUmEZKvXatYRZY+mR6Y+no
 MwME2NXzzreCURcpTFu50cFmcGonOrACkPwi2e5igqV3dVZQBWzfM0cRL2gnlpf3NG5p
 6QGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qNtK32BGt9MxWXtwDTu0yUUapwxqATE2188PlWft/QU=;
 fh=sUgEtNfQiMNV/M5jOjs5MnoX6UT2tjjXguE3ov3sSI4=;
 b=FFZZbADtc9iMiXGQz8iuVmyo3mLtDQRymf3/N4Rv+Dao4cx57dZY//AHPGwVGyWiwn
 2eI9HGBPAj0biOi5kImBB5riU4+jshDt40LdOB+IldG6C+JJKWwrvR8y/JGqCRimOKoz
 O7cuePvt6jCClxFnLN0V2Gv1JZn89WpUcuk8+nD5MLjOYKQKpHW9ab4ndwbXUJ3oSWpz
 k7QLIWExClX9M95vS0DZ4kPg92iTvMUgCaeQyjbHLKbvJENvSiO+OQZlvzIhUPS7wuFg
 CdpIm5kU1MhV713RF0X+ktuYl1J2ADlXT/nqPLj8td+Lcy3bIH0ehiTH0qbS8XVLxqfD
 ByEQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772107049; x=1772711849; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qNtK32BGt9MxWXtwDTu0yUUapwxqATE2188PlWft/QU=;
 b=kHVZ6FtYjrWgQGG8gThgqCXrB3WGPlMcf4Bo5AGP485gcMAdEHSQWec3kp9klRH9+G
 eYBZ0gr8Px8NiyXaUGvQk0k/4YfQAbPD8hQcBye9HYNdJ+1X6Afbqmmp8Ct8dwLw1CZ9
 RoAu8tfFrzvmOijuW9mMkrdzUYFv3h5R4EB95zZtHaLGtrfKe7C+Wwj8Zgy540ZOyJil
 MUoQReVQZj2ifEDHJKfhYP7n1JyrY9tGQ7UYwVBwZ3CzuCeXNY+MRD6mNpD4CxjX1iIG
 nR2C5IfhomBsA1OEbN1iIid96brmJNKw2xvQmjqnEgQlByf/wY11kNR02JMzLcD9i53I
 ysaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772107049; x=1772711849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qNtK32BGt9MxWXtwDTu0yUUapwxqATE2188PlWft/QU=;
 b=BEWTAkJz2ot85H6wnn0Ngiz8YytWeCu4bps7oXOKMhRktxTuOnhQaSPsludsL2iuAc
 3HsVPI13XfO2ogDluYJgNHIh043baA2cxrgGmuvvX46vkUG2ZR2sgYbnAo1XHKYXUSWe
 3wha5uFSind1eKbq1GCArUJ8Mju9niiHsoN7aJiJDuyx2KlYKDftOZBmUlwIEOmEuXPK
 pSP6k8+Mqm8I8mYxP8O9hN5udi18CnhGado9wrJlSQ2quGypz7rD7wP+J4JgZxIVTm54
 2uca5dvNRtchVxPZxbiSMcdGiGvsZq4NUvXBYttAo/BhgiDicYb3HfMib21BXiJotYRZ
 ZcsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQRs6tT/wbwVt5VuTbHSj3QLTnTyvluIq67nOtIyDmYI2qUoirOI6w7kqOT89suWx+pFk+DCsl+1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoKXKG8+E1l9q2UenNwz2fhxz96F6LrnTe7306aS8NRf1/3UBe
 oh5kUL9abCQuOWAodX3DEUf0lh2dGduiUUmKA2e+pq4iAxuB8Z2/zF1HzITCfqRu7e7UadaPcVJ
 krQ9mWSJklJyFA30ZpCseMeQ2joDNgFg=
X-Gm-Gg: ATEYQzwguw4yk65YyPmmTks5XFb3/m2vSWcvC7h6TPuG0X7rHDgLluh1Ui7qoS87gQe
 LlhTnV6tP7pc/S7u7SOdE/XB9ZaOLTGljyjIH+H8X6FmGaJX7REQMWJ6PJlYIit8xZgOq8587ru
 Y1n//oFrmXXMkT5rGEE3Xq7FSSU5s6vAiadtch2ckEWg5q98JccZWng4QSxzpJAZr6jgpgL0O6+
 +pDV3dgc4QaI6A749K5xZvgMMAv01sOpcK8hOWHeIc4FdGtwfX8dKEi7ohmwTp94t0Lrl9BqzVT
 MJfqvs8=
X-Received: by 2002:a05:6102:c8f:b0:5f5:3c38:c4bc with SMTP id
 ada2fe7eead31-5ff140aac98mr1601764137.23.1772107048800; Thu, 26 Feb 2026
 03:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-2-mitltlatltl@gmail.com>
 <20260225-analytic-economic-parrot-4c3a45@quoll>
 <5617b6ec-b1f7-4f3d-abda-d7142c323759@oss.qualcomm.com>
 <CAH2e8h7T3Qy1f=-34SK+q=n9TRYOtzyxY8R6yKZJZGr_f+UMZg@mail.gmail.com>
 <rwsaypiovv3xtw5pfxw5rksmqetv4mogu4yy7yrm7gfknezmuw@bh6v5q2zeuiy>
In-Reply-To: <rwsaypiovv3xtw5pfxw5rksmqetv4mogu4yy7yrm7gfknezmuw@bh6v5q2zeuiy>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Thu, 26 Feb 2026 19:57:12 +0800
X-Gm-Features: AaiRm50VYYJa11U6YREQitoe6H7Afdc4A9v2yu5-PwbhgzvuP2StWI1hICwfKV4
Message-ID: <CAH2e8h6HCBpMfuzE-e2sOvE0SF9w2bgci68mxENP9J7cExp1yA@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>, 
 White Lewis <liu224806@gmail.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: C5B991A56FC
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 6:56=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Feb 26, 2026 at 06:44:02PM +0800, Pengyu Luo wrote:
> > On Wed, Feb 25, 2026 at 7:02=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >
> > > On 2/25/26 11:24 AM, Krzysztof Kozlowski wrote:
> > > > On Wed, Feb 25, 2026 at 01:45:21PM +0800, Pengyu Luo wrote:
> > > >> Document DSI PHY on SC8280XP Platform.
> > > >>
> > > >> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > >> ---
> > > >>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | =
1 +
> > > >>  1 file changed, 1 insertion(+)
> > > >>
> > > >> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy=
-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > > >> index 9a9a6c4ab..9223af1f4 100644
> > > >> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.ya=
ml
> > > >> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.ya=
ml
> > > >> @@ -23,6 +23,7 @@ properties:
> > > >>                - qcom,sa8775p-dsi-phy-5nm
> > > >>                - qcom,sar2130p-dsi-phy-5nm
> > > >>                - qcom,sc7280-dsi-phy-7nm
> > > >> +              - qcom,sc8280xp-dsi-phy-5nm
> > > >
> > > > Your other commit claims it is compatible with sa8775p, just like s=
ome
> > > > other devices here.
> > >
> > > If that helps, they do have the same values for the REVISION_ID regis=
ters
> > >
> >
> > Thanks for confirming this,I will add this to the commit message and
> > fallback to sa8775 then.
> >
> > I am curious, do the PHY QUIRKs in dsi_phy_7nm.c reflect PHY revision?
>
> Yes
>
> > I notice
> >             REG_DSI_7nm_PHY_CMN_REVISION_ID0       QUIRK
> > SM8250:     0x00000014                               4.1
> > SM8650:     0x00000025                               5.2
> > SC8280XP:   0x00000024                               4.2
> > SM8750:     0x00000027                               7.0(*)
> >
> > (*) SM8750 is 7.2 in the downstream.
>
> Please change SM8750 to 7.2 (and SM8150 to 4.0 FWIW).
>

ACK.

It is exactly 4.0.
https://github.com/OnePlusOSS/android_kernel_oneplus_sm8150/blob/oneplus/SM=
8150_P_9.0/arch/arm64/boot/dts/qcom/sm8150-sde.dtsi#L518

Best wishes,
Pengyu

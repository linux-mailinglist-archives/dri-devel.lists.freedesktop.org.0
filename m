Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K9fHAckoGkDfwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 11:44:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E5B1A4766
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 11:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542FD10E8AB;
	Thu, 26 Feb 2026 10:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ujndc2zx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D56E10E8B1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 10:44:19 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-56a86f0a23bso645290e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 02:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772102658; cv=none;
 d=google.com; s=arc-20240605;
 b=dSxnlrvSIbzop3YaqKKDMWJz37k1spnXWKRNoNEpDLRdGjyR6FMpTXyMUEZxTf9h1y
 kbj+3VRPtMKVCooHOOnNAE3aRI8PaMHrDWcr9Z7qJrT/WSLYiS99LqHCAZM9VZfer0ax
 xOizLHBd8jpPHhUotPKa9/VWvClW8hbaxsLQt5etxOli4Kyxjb4bsN2k36ghevnqXlxD
 mpSnBwivspeF3UYEdYMZgW3PC6wpQx3Sd25JbZrdRbfFmuK7uiDZaxnsk37GPl6LPzVA
 ipDT3UKb/aBfYIM3JOw4XDgNYioDS+eaUoQhbTKfM1XG0WwVL1hyIUA9U1c2MM8f+ruO
 3aHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cD12pgEfdQ5/Nd9GA+nMEM8ckUbIwEu5Vfttv9M4WJg=;
 fh=Gt72N895RW9I6dzCTel/iyb49SoS0Cv4Iqn4g85wLYQ=;
 b=FAmQe5/idGR5U3i8hEKeXiFxiXd/dGK3snd43BQW01fUiDJNKUIdwiNgQuprDD9JTi
 dKScP+8uRtfNWtzot2M9P5LRDDoH3JFfx/xLM9VIwVR84tX937YJ1WTD1cng09C5Ct3G
 Haq7FI3SnTVDuPPXUHUYXGJKB523T9LlWoR+yJKHozSeHm/GPZ5EdgXbZSV3XEWlSiIB
 bzkoH4lzFYuxS2z4R4MjD7OKvsfnMJqgjAhVee9DiL3nyrqhq6AMT+aQMi7aicqHOz96
 pp5gEcjmpKLoVwk5fQUnOU2miT61KBkgUX0y3neoDrw9Hu8jxbUJZcGwkZrlEp0Q+9jo
 18aA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772102658; x=1772707458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cD12pgEfdQ5/Nd9GA+nMEM8ckUbIwEu5Vfttv9M4WJg=;
 b=Ujndc2zx3d5xiDGdxARdoCFLpsoYHMRFjQuue1n4+nD1EZMGKQ1xVHEpuYPc4DIKTZ
 Hfva1+w7jDpvdKXyOTYM91n1ce6Jk000W01RCeQoJV9/zbvjWJsTKftKDRBpkWbBjm2q
 X8lRbKo+Wm8LXJGzqn0N/bjgy+PnIr/AizgWzyP6fhRwsFqzh4Hei1sM/foBgZALlDln
 Pohr/ZrljBKisqWgsyPwSpiPpGPvho/r2EPWuMVeiny3wwLEnjL6BwiiD28dz7dzjw31
 DEIP1RQeERFNe7rLWtOamCJ2b3cKCngIlvgWQ4wXvpELWeQLfSbFevi8kWiHpE59G5E3
 GP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772102658; x=1772707458;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cD12pgEfdQ5/Nd9GA+nMEM8ckUbIwEu5Vfttv9M4WJg=;
 b=uhi8QAGOZgXeLOfmXLbtoPEIyvxOHnBfw3GxdCfZ9Ds0Y6FfQ8ETZaNRGum8blp6cI
 kNyUhSclcH5CNr73Uym8FAZVKrUL5hiIjVJx6N1w7xVJuW9h7GdZPFtyYmiTBw8FdkOA
 7JZVtoT6/cIlBEO6aaOMATXckgcLCXqPLaFwvP1dI7DJp917OpKwDzs+YSDJyqAe60el
 q2fmO1ZHxYkMorvSMyFnesngwBMvGhLTuZQDvbn1snek+sntdpfhCXtO1nfhnOuMOv55
 ddOaoa7Lz7Fjlp/UYwYgg/C6KmUSqqgXlDgFhYITaAZ605FZIRTmv4cuwXf3lr5IbmTi
 GWEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmpb0FHeCTOBQgynSh4lNiRzieOuewx7f08qdilgpmGZg+yRZsTzs3maR25yQumw4sdYQZWbpNezQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI3ukVNUpRfpBm40MRakcVXheNRzyTBK4bsmTujxzrC4YYqLOq
 7qUp/9y+HTBqzXbz2eRYTr4C1m/VZl6Lj6TfSr1UOKH0us1VlohOhJiq7xVtCc6IssLIWh9NF8f
 bMNgXVcr6O+LSETcoeRGjpaQNBzpnCKk=
X-Gm-Gg: ATEYQzw0l2KA47P5xdcndx70+KJhAOFTE3Db4I1qbKVF3iBce4d0qoYmo0Mg2+2FN2l
 Mvk9f/XO6ZQ8nfY32Yw8hQGyuGMSppP3J8/qtf1D0neeyYd9Xyzs34VFtrh3BAypo0Y+cEFKtT1
 QmoLoJwKzbwgQK2ijy/QqWolqtUU3N1RuVIsagxBQO++Htw9XX6bbimkokLkS7g707H9s4LjLhR
 qs0mjXsmUW8W+VKwpe+K4Fz41vjvTKBa56p50z5RM8K94P519hl3cxs+ZZEUF8h1pDhVS1WQ9y3
 HtvpEWc=
X-Received: by 2002:a05:6102:418d:b0:5f5:5c2e:59ba with SMTP id
 ada2fe7eead31-5ff140ed02cmr2205194137.33.1772102658094; Thu, 26 Feb 2026
 02:44:18 -0800 (PST)
MIME-Version: 1.0
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-2-mitltlatltl@gmail.com>
 <20260225-analytic-economic-parrot-4c3a45@quoll>
 <5617b6ec-b1f7-4f3d-abda-d7142c323759@oss.qualcomm.com>
In-Reply-To: <5617b6ec-b1f7-4f3d-abda-d7142c323759@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Thu, 26 Feb 2026 18:44:02 +0800
X-Gm-Features: AaiRm53sGdce1eJ6hV-SAxn-qLkKqnA_zFO2EDrbOzCBgEEtUkG39zInYjqgp78
Message-ID: <CAH2e8h7T3Qy1f=-34SK+q=n9TRYOtzyxY8R6yKZJZGr_f+UMZg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
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
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 23E5B1A4766
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 7:02=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/25/26 11:24 AM, Krzysztof Kozlowski wrote:
> > On Wed, Feb 25, 2026 at 01:45:21PM +0800, Pengyu Luo wrote:
> >> Document DSI PHY on SC8280XP Platform.
> >>
> >> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >> ---
> >>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm=
.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> >> index 9a9a6c4ab..9223af1f4 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> >> @@ -23,6 +23,7 @@ properties:
> >>                - qcom,sa8775p-dsi-phy-5nm
> >>                - qcom,sar2130p-dsi-phy-5nm
> >>                - qcom,sc7280-dsi-phy-7nm
> >> +              - qcom,sc8280xp-dsi-phy-5nm
> >
> > Your other commit claims it is compatible with sa8775p, just like some
> > other devices here.
>
> If that helps, they do have the same values for the REVISION_ID registers
>

Thanks for confirming this,I will add this to the commit message and
fallback to sa8775 then.

I am curious, do the PHY QUIRKs in dsi_phy_7nm.c reflect PHY revision?
I notice
            REG_DSI_7nm_PHY_CMN_REVISION_ID0       QUIRK
SM8250:     0x00000014                               4.1
SM8650:     0x00000025                               5.2
SC8280XP:   0x00000024                               4.2
SM8750:     0x00000027                               7.0(*)

(*) SM8750 is 7.2 in the downstream.

Best wishes,
Pengyu

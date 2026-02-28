Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJFuG1f0omlD8QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 14:57:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077781C3640
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 14:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266CC10E2AB;
	Sat, 28 Feb 2026 13:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d0g4URW9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6356C10E2AB
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 13:57:39 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-944168e8c5fso1725555241.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 05:57:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772287057; cv=none;
 d=google.com; s=arc-20240605;
 b=PMcvopStZO+gC7YMzZ6muR6by1Elj7As6+SA2ED2WZDF1a4FRiauCnlgbesbbkWjNP
 26xk6EhjVzwCHRhR87ndYeJL0iUiQLknHMOrDnwjn5tPWCTexdDsgMJ6jA4CJsZTUhAD
 9aLCyXJrvBkjiRpxdRcRtcCGSoVAluzgG4gt9sb61mgrx7mev3hYAjmCG23IkGsQRrKH
 C5ga5Cjn8Kx1xEsvaxu7d4li5SKo68Pu7RSX957LpfIbFI7cX2vRL995FN3q3Ms1s0sp
 jIkiW6BdoHcvtnTiywO50pQC3CKmwKX1KTGN2CiGFsj04mDm3Fnmd8CFdK8vjDw+yDT3
 /51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OHy+nPU0PfKOPSTzaYhzi7AqD2TPKVJAIyn6BXVRVv0=;
 fh=wYZNO+bK699mTzTeoTCWOt/VYi3V8xoIhyhxjypKSWk=;
 b=FLpJuNmvbY4x2t2ZnVNL010+AryO3zIskGRPOyx6aKuZgSLK/Mppnz5pCjRh4yOf7M
 DjHoLA7VBLMSMzrfwm/VTHTxxY0t65I47fWl995bl24lRfH/wIgkblEGsyzcCh5D+Ck7
 XAuJaPF8GYtBH3opQjRzGdcYKl3xpxkf7G3Xn1WZTA8kU56/LdIRIjLze5D8bsY78UYP
 5aNMco7n7U2+jH8wnh5ooaSFzv0x1o7NtDDr7dHstA86gkCMiv0zE6Xk1FK+OljIfXjt
 Sp2fOj1SSf2++mdt86J/R+a0OHZs9llt9pdFj5mt1J/YoUYQX5k76YxIdWK6lVFU8rHg
 NJCA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772287057; x=1772891857; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OHy+nPU0PfKOPSTzaYhzi7AqD2TPKVJAIyn6BXVRVv0=;
 b=d0g4URW965sFhpQHej9xfrslUIo4YOvBkSdopJJtoW7aXIWGLEeoz5JHDPYd/3k7Gf
 a8QxgBC9Llxyx21w84+S/lz1hgSGCG3DON0md2TayfybnKyrTJms3XZVsjygW91P0zrc
 ZbxiyoIaEWtUMW9wMkTFYleC/eGsiZ2a3JUDGSl56iURBliYqu+Nl2v8VKyTg14x0P/b
 R4i+kCvkPxxbxOocFT1vqLJ8aWAHiqDDsXe3J+1CUYMgGX3AgzVjUh3Ks3f/VNbB/Rkh
 RBEz94eAcXPySX/asPkkCXsIrJtRIEWbuLnpGv6bdVYP7+eyKKBdTWsQ+ZdYR+mUkHg9
 DKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772287057; x=1772891857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OHy+nPU0PfKOPSTzaYhzi7AqD2TPKVJAIyn6BXVRVv0=;
 b=htS8fMPiDsaJJs2EH3ZM5PXcN+bxqLi9BWpSYIa+Yfd79H5QWxdFP7iwIk5aGTfJML
 4YDqzSBiw+8CgK1DBb5khdoPH63Nlmj7DJndC9O++73oBiDfrtEae3nQN7jRnpeMMfTa
 5iHD4x4smd4BhpEWIKaD+4OIBl4w8+1KvEOYMXjM3w/S6MlXyOpwlMxbXHndZXZ09aRp
 GCtxJHuuN99VgfzXtqk9zHDGuyAqkPCO1Q2usN1l/t4baWVUbKdW3w/wip/0pQ+ntWRS
 Cyhnj+yTIKY4AGEHxPkaH5y6oeAGT3GYkBePDaXkvhdTCazkiNBOznB5rLtW/CcCwhHJ
 th/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1yXzQh2AWSAdDz3xnKuCKdvc19ep0IZhFBjPPPdPMpV9IRTCh92j8wCKXK3OS+lDXafbuigdYlKA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsaSNlxoC1F3zaTy/Wa7/iEhw7or9va7elYIUKnbJ0nf4enzYm
 vgR5tJv7+53uH3Bug+iVsn5izGEQ3xvup6ik1w+8h6pZ7Hw78ArSODQBX9LmDeN+Uxw9fMFY3XC
 curWKB7FNR51d6DfnTWYTROFUQBUH9WY=
X-Gm-Gg: ATEYQzyqOCZkkSJbN+TNZJLDWDa7qend/BcCqYATV0uwjAgKoYmYfqpgE9y3byb1sB8
 bCEBV3erm9ZJ8APrmqfjpvjpVjuAogoO/0c8QqJcIQwvYHC3HOh3W0E7aLCn206u3ei7il4HFhG
 JhSEX3Oz0lUT9wssWQqnOmbtOviWCsqDXy/mOm/dVR0HTX5t2jZcr9eBDK+wDv4bd9rD8N6AIfX
 hdIm+eliqdD9nXn7syN43Mw4lQGpMe6tjdbLF+WEpV0y0Eefyh7dFsTWO1eJgnc1ZHXA24N1Mch
 40E3jxUCEqTkrX0jxA==
X-Received: by 2002:a05:6102:41ab:b0:5f1:606f:2a14 with SMTP id
 ada2fe7eead31-5ff3248d7f9mr3793793137.23.1772287056552; Sat, 28 Feb 2026
 05:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20260228101907.18043-1-mitltlatltl@gmail.com>
 <20260228101907.18043-5-mitltlatltl@gmail.com>
 <hfohv2evihmqbaehmnjsj2cgmqbjytsa2j2z6l3cph2jlszv3t@d4c32rfdvt6d>
In-Reply-To: <hfohv2evihmqbaehmnjsj2cgmqbjytsa2j2z6l3cph2jlszv3t@d4c32rfdvt6d>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 28 Feb 2026 21:57:19 +0800
X-Gm-Features: AaiRm528taAECdfaNz7MHnvxwd2NLIV6e5nb43M70lsJMEjqfm41ug7OY7NJn1E
Message-ID: <CAH2e8h5J7FdP41JBgEC7aUPk4AGwNnZ83+dYV0=n=7+PNeMVng@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on
 SC8280XP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 077781C3640
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 9:32=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Feb 28, 2026 at 06:19:07PM +0800, Pengyu Luo wrote:
> > The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> > utilizing the same register layouts and clock structures.
> >
> > However, DSI won't work properly for now until we submit dispcc fixes.
> > And some DSC enabled panels require DPU timing calculation fixes too.
> > (hdisplay / width timing round errors cause the fifo error)
>
> - Please squash refgen patch into this one.

Ack

> - Please post at least the dispcc fixes.
>

Yes, it will come later with the panel driver. Lewis provided the
patch but it was generated by Claude AI. The patch itself is not
complicated, it only removes CLK_SET_RATE_PARENT from
byte_div_clk_src dividers. But I need to find some time to analyze the
dsi phy clock diagram and reword the commit log.

Best wishes,
Pengyu

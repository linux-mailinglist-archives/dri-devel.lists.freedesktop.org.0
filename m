Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMvQHpizqGlgwgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 23:35:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A95208AE7
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 23:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335E510EAC7;
	Wed,  4 Mar 2026 22:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JL3Kxza5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NF3ZWrzl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA07E10EAC7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 22:34:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624KLNX23616577
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 22:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Q3kw8hXwTJj79fdkUH7EbtWj
 4/71ysEafkLCAulJP2Q=; b=JL3Kxza55K+oBfCNM8bskFIQhJvjIyjUbx5xkMh2
 QTillC4TjKWfJT9vxqblICGSoWTT3JZ/payC0YmCClyGEnUIaPBlkFaxuvS7v54B
 9GkNjHrjMWBgOZkYlhxjJWcHL1HaVqq8todMuLgf1E5EaaA56WTb9JSKhtA/opO+
 X9ZVLPfWLFdi+45pyWe3oKxr/AZy41irSefAB6mbrlSYbrZOBPvVawe3RGEH4BOH
 XgFsdm4ITY0BFW09okvIPN0vcgIWMqm3LSbb8QrUxBUBYxFJErm7QY2x8Bt34s1+
 Lw3mCezjcIsoJSu6Rs+pfHQOrUEE291Eywav0+vbQIi4tQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptgacq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 22:34:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-354bc535546so5922007a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 14:34:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772663698; cv=none;
 d=google.com; s=arc-20240605;
 b=bB8QSY0DO3VmGcBYMDPd/tRZAUBOWVhJMFpLdA1gtYOTX4LmHal+lG+EgtCJLd2/DQ
 0Ey2ulJsUm3qmGDO0+LahVSK0DoaBhbvi37g71kCzrD12riADyGsw8Qd9Hx+tXlZXz2N
 pgkR7xLWrhql6YVjwRQ7Aopqr0onPM/xvTk50lCnObrGEppVk0d7HcueL8/zFFyfTi2C
 0nb6jt1CQgr7XqM5Ym6QZ2vvhQtBwACaTirwEoDf22S1zuMiv59WQuANt7x0vziDL2bg
 IDN7RKAeB2GJdsgV1Y1SvYKdJ5Ubs1uRba//e/RlBNyiJ/VudJ+X35QpKd4fyljIIbmT
 rxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Q3kw8hXwTJj79fdkUH7EbtWj4/71ysEafkLCAulJP2Q=;
 fh=oeE3NkuqOJ/L8pcOys2fKApHxCVfyt6D5kMG3ZKOpag=;
 b=AVcIjzxuak3MDL85q5t/RXoI5CPy1giw7OXo6eajzXL+YvZl3dquQCHMzwJCs8nDS/
 9Dl1Nrzh5ove2jp52SqiNH21I6m8aASdoumKgMg2PActSwJovXrrNAzamPj1MGWBn3cC
 WWmAAvC3Tm2ArfeG+vfEtwr2rNLjP6E30qalequ4KQQCdV3kVlMwKtjluaocnognH1iM
 gTVPPjZ0blUmh6Vz1++1fZ33j4TazdB830+u519+eITYeWvmNo8z5D1gxH7GQ7tLlumb
 2bMVAeqceirO+8B47xauKBYFRaXvhV3we3eRZ4q4124qEpx2iV4dVvGt0lZaXZPWXV3e
 6wSw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772663698; x=1773268498;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q3kw8hXwTJj79fdkUH7EbtWj4/71ysEafkLCAulJP2Q=;
 b=NF3ZWrzlR0/sw+NcqYfDnnC2yf74oW7yU+8YvPXYMjmLb9Ctva6g24dU1+uO9Z5nE3
 4p1dPDGJTlrc+FFY/7fmEl+XNQ2IcoTgmo9HL6SS0jvQQveVCeBo9kFper8M44cIBCCr
 rFcVjBaZMTFjCAbjvWF/h+CC9PUOSWK9yNGie64Q92/5Yeq8eYAeBYDdWpqKDD5eTxxc
 m3T7hnmGTGGUzPDxJMN/5DnE/pZBEEYHQE5XQtficePBfLIxFfZ45AdKNtyCA7NWhZSS
 aRuZ+kPre3+s7Bk9gizRGt7JpIIEX+6hScCqzb3tSaXMEaOaTOyQyf4wmjtGZZlMxbFu
 QcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772663698; x=1773268498;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3kw8hXwTJj79fdkUH7EbtWj4/71ysEafkLCAulJP2Q=;
 b=XKYbLCdf5vjssLxJ8YIWcQTW6BH4vO/R9o60mtJx0x/v1LYdd3tg1DMh419PC7XUzS
 JJrzBurgQhu2hZgmOr8nf4WLTQQDucHX0mROcza4KBrKW5rOEZGVZFo/GggQqG3dzxvF
 IrQVtHFoIqSdB/D8MsTEx1pZlDy45+iH3mMeswk1NDFAo+GGk3RHA+M0rgHssnNbtPcp
 ZzWzdWkS2VMDZUmeyseWe5urKKJybZD9LbBw2PsvRIplxdkjcWBPfar0TcdyZqUyRD8/
 kb7jKC1Dm/KFPPcY7407D11561kOa+HYL+KhFCBQbomFHNJd07qzlaqfaCCVCqcKXYiy
 ka0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYmQukv/JNuXORzgIGiCb5kT2XGVawLOSDqKOH8YWGLtA8Ej0rzfFgOqbqeBr9mtE5K4yx8cDBt9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUcKBeB8BdqGUhPmqiRoTv+F/8sDn2Ani3BAxvBPOPc32nji+K
 ODceV9ZeqB1BhG9Eu+Mi0wFgtepniMwU0gs9OP2mugAtN3e9AwpMRCYDKd2VUiTU0kZ4HCBStVB
 RMm7LgX9N4DeTia6WpBnazY1AXlEL3KB9yTd+HgpkM1GokWeD3BJVOYoi0I9X2Fc+TC9JLvIMHg
 KEUGNmeuU1hRNi0Dj6BYuNqNyvyvLYaVdsI+IvG47Qbd9U8A==
X-Gm-Gg: ATEYQzyWwyzZ5sNL+BamjLFh6hWTavOEWuWXP3o6u17fkgA+6sET3olvyqNVPfc6xbM
 tNo/7Asm0TL8irHxrn03gI1+LU9pM5vVXZNfak4aL2e7WIQ0GKrjMcpQUOCC48u0BeG5WZiHcBh
 YzjtKx5xmmsEriIxqpj8giTeIF3OZxPB7BsofuVohEspLmuRMceEarqB02ugAcblGr49TVhKq8v
 27I4K15hoeGcz6ebFjA
X-Received: by 2002:a17:90b:3d05:b0:359:8d0d:5905 with SMTP id
 98e67ed59e1d1-359a69bde00mr3337288a91.9.1772663698567; 
 Wed, 04 Mar 2026 14:34:58 -0800 (PST)
X-Received: by 2002:a17:90b:3d05:b0:359:8d0d:5905 with SMTP id
 98e67ed59e1d1-359a69bde00mr3337272a91.9.1772663698091; Wed, 04 Mar 2026
 14:34:58 -0800 (PST)
MIME-Version: 1.0
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-3-7756209477f9@gmail.com>
 <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
 <CAHuF_Zpa+cr6aq89kCon1dC3Q0PEV17VfyAbqF0Ojgmgn32yTQ@mail.gmail.com>
In-Reply-To: <CAHuF_Zpa+cr6aq89kCon1dC3Q0PEV17VfyAbqF0Ojgmgn32yTQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 00:34:47 +0200
X-Gm-Features: AaiRm536OywcYBuxo9AVuL0yS1b3mC74MFjTluSvJIMSZmnE4Apm4Yr4rK9zJ5s
Message-ID: <CAO9ioeWCLeF5rD8=WVbyKBD=azFZ5=Ee=BH9209Rw6kd5EOJug@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable
 MDSS and add panel
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE4NiBTYWx0ZWRfXys1sp1HOMiXs
 ctVCu6s6vUo4Rmky5aGTth4KCRHFmcR2EoP863kKyf0eUMMpvs1R1uUPbEykrtt/8AOWkPgE1VT
 xDmYkjM3+DSYjhleqeJ2OyXaf6Ka7NEEWnw8OytYpqn+bPsYp/vc8mCGGg4aCbA2/vmSoj16WEN
 2cXknOhTOP7PS58Nt9wNHDtQ8jdZLlq5rbWn9RZU64j/ghIPTalmsze2fKjQlblAtL7KIKsLJcs
 ApYMm/gR1AUmYHM+oC0S20eV6vZE49HKjaDt1/VgJKrh1t/WTS4DJJl5iP/2LWn97tEnn1iXUk+
 Kg/zk1od+EOt/HDL0Tf1Ny02wsw9Txi89qM1C7p7/a3kZi/lA9nMswZQT9hj+UhPBkc7KF3RgCn
 VIIi/oWcx9OGFAZZ/iBNdE7KBJ5yYKABu+wH4yTRbawy+VnPYk/mH1B0zAAJ+T+d7YdoIoraVg+
 jvGxj+AVxNd+PpYWOuw==
X-Proofpoint-ORIG-GUID: idX6-GIr7gwYR48wNTVH8L9cI_D9E5Hu
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a8b393 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=rmZjoFom7a3_dF09p14A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: idX6-GIr7gwYR48wNTVH8L9cI_D9E5Hu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_08,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040186
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
X-Rspamd-Queue-Id: D9A95208AE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:yedaya.ka@gmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:yedayaka@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 at 20:04, Yedaya Katsman <yedaya.ka@gmail.com> wrote:
>
> On Tue, 24 Feb 2026 at 04:46, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> <snip>
> > > +

> > > +&mdss_dsi0_phy {
> > > +     status = "okay";
> >
> > Missing vdds-supply.
> >
> Can you expand on that? The `dsi-phy-14nm` schema doesn't have the
> vdds-supply property. Do you think it needs it?

14nm PHYs have vcca-supply. Anyway, the PHY needs to be supplied by something.


-- 
With best wishes
Dmitry

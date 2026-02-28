Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDfiFlX6omkZ8gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:23:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BBB1C38D4
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB4510E2BC;
	Sat, 28 Feb 2026 14:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAFUMytl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilRDw2uY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7078C10E2BC
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:23:12 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61S906Cx1969985
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q20wbwBCJGPSMFGwy9v5J4U6DmpaME9iS3j8Ccw0t3I=; b=NAFUMytl84dm0cKY
 5u7ym9XgbfSg3TLkCNkKBS+/z2lzKhY/3+GwIMyVP7nTmMxQ93CYvbelIf9RMOLM
 o9kW8ILIDeJDvGkJxIu5Ehf/gp9E18KS+Av4wmNAOMaIj3Ea1gYmIlDpscxh1Gny
 ZUSUhkBhu2ARo1urq9rTO/BLT/eCQa56jJ9nzFXTF6RAnIEjWbrDicfNuuZJ6Jl8
 erzmTtM+geEsiUB5mSL09wsSpLkIV0GL8v73z+1ChO+kBGpaaRqGsvS3rCDR+LMU
 FUVYI1R0CT4VTb/CZA+c5uLoSDJ9krqyjkRurVT+/bUQSqsykCB5GBjqfe4Y+Eb3
 wMba5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd0y9a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:23:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb6291d95aso3374223785a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 06:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772288591; x=1772893391;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q20wbwBCJGPSMFGwy9v5J4U6DmpaME9iS3j8Ccw0t3I=;
 b=ilRDw2uYm9rnT5uFxUFiSrrBy5o1K8wk/hsR5OG3W2pWM9RRWbiPh8iUfunsQmGYtB
 KudVvCb+lOy2UK+9u+dY5YRMEABzhw++b5c0oX5/X7u89C0N4kd/zCANVoPEvB5aBtrS
 iklR6yCiPJz9W5jDFtXz4KSyZhVF8Bc2gape/FFX9xbQ4xvXN/E+1KssX9jYBYch7HD/
 ThCBZP46R4sua6a2DFWbq7zbSr956flmmO+zWO9fcHPOEKpX0hWyaO6QnNTgaI/6gJ9j
 cLo2h8bx45MQkq+tTbtAxaWR56AI3QpCObYZAvn1m11My5A6XzHZ/UeBScXcd21UChoy
 QG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772288591; x=1772893391;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q20wbwBCJGPSMFGwy9v5J4U6DmpaME9iS3j8Ccw0t3I=;
 b=h3APhxcgovSLBIDc3ccFj60JFeCg9Mxg0jfD+Qi9uHpIPxL+s+peUfuVWSH8k2r7Xv
 fMxsTbyBNIiPbmDzw4JAon1IQASuEQv3owEulnPxLimhyAB7urCeprLMhSWRQTuD+dGQ
 x4LIzoQ6iIv5z2uCva5ScTkDtqF6uwdIcw93xx08ywNu2YHJnQEMBUJCMSei/OPAtbAG
 eWWpMOaDSmUSfIVXWSIbMA/ExPSQ0YvhtWcysyUAs/FPh209eSx92P2Wcr9xlbm9WSYd
 MzQHfgyygiHQf+WAU0Wv+ny+1Cl+GmuYtdKUshAJTBZwrY07+szUZLL0Vi88483vlXw6
 X7Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7E9fpOQ3tPJ003x44oDmkJ7iAqa+3udJuRS2xVLAwj5iQspRf4gdACjDx/qE5ApQTyvQsXoZaWKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpjOQ6uYYa5670wHL6YEYWvvo0Xy0K3+GbRdgaNdn7eWQrXplJ
 AKQsrd8UYt0/qDDCL9tTcmdTLUhc193riB87yiSJfSRgLIh3o3XDxxSXnU8c39Q9NZoF2hl0Ym4
 DhTp3qbqb3nhGfY8AGb8INxjQgqEGAPU9mNdAM1fA/vIlLpnsdUJr1mJahmOuSZBYPz80HJA=
X-Gm-Gg: ATEYQzyT/661B+QQ3FjNTS1ncWrueQ+HTo0rSHmKgM4uAZQD/n+CcRYgI18YXhq+wCA
 JQXX9bkMJajvbST2I6FIdZjTFdkvZ6bPO3xcx2ZuK5Xh8eXC5bNnBwor8YQ0w2QlLAAtgfMvQn5
 dHBKGf/jmkhloDKhvOEY91xWUE8lg6uz3Fykyhg7YXkOgOuium5gqRVnJXSsEwKV2mClfsHOZaA
 sUyabghB+/S9qQT+JCzTf+Q4LsJFtTMGd9sj2XGZ5rUdCD2l10msaXKSgsgNPsmo6RqPlpheltj
 qV0Q7eqSt0oEVkjtpthoHujkWKqYdpUD+We7Zqfw5Iw98e9hkUVMVth2Ge0kuPPPhl5cmYKQ2ul
 KmetXxDusLLHuYlEV4W1AmcbDYW7W5DXluqy28MI1pcarXxiWw35LhQP84QmQcpLebBl5S87WiX
 mVoGUT9/dDPQUsrEzEGx2pxYcnobp8EyxJAt0=
X-Received: by 2002:a05:620a:7118:b0:8cb:4059:a90d with SMTP id
 af79cd13be357-8cbc8e50bf3mr818710685a.38.1772288590854; 
 Sat, 28 Feb 2026 06:23:10 -0800 (PST)
X-Received: by 2002:a05:620a:7118:b0:8cb:4059:a90d with SMTP id
 af79cd13be357-8cbc8e50bf3mr818708385a.38.1772288590441; 
 Sat, 28 Feb 2026 06:23:10 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bd238fsm564965e87.11.2026.02.28.06.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 06:23:09 -0800 (PST)
Date: Sat, 28 Feb 2026 16:23:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on
 SC8280XP
Message-ID: <sb54l554woevgaetb54zwyn6fdrz4bqi7vnsavdy4czqzbcwjn@qf5wckbfzt2z>
References: <20260228101907.18043-1-mitltlatltl@gmail.com>
 <20260228101907.18043-5-mitltlatltl@gmail.com>
 <hfohv2evihmqbaehmnjsj2cgmqbjytsa2j2z6l3cph2jlszv3t@d4c32rfdvt6d>
 <CAH2e8h5J7FdP41JBgEC7aUPk4AGwNnZ83+dYV0=n=7+PNeMVng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2e8h5J7FdP41JBgEC7aUPk4AGwNnZ83+dYV0=n=7+PNeMVng@mail.gmail.com>
X-Proofpoint-ORIG-GUID: KErDY86-rpUzk6_xsBdGPb1WD6Zn9Uku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEzMiBTYWx0ZWRfX+F/72724UPrt
 R+lqbsusf4Vz3uTALo6IJJgNj6q5WMQZpXfQXnsG3Iz2BItoGVhOuCJjc+ogfg9YUWKvSzy+wIV
 E90T3/kQTbK3dyQZZEAqvZUnVWzBrMHixq7SSeCSsUiL3L92RkpuMks/BYHfk4tcFe0ubn2vZLu
 G6a9N8fjCcHX+Qy2M5iu9VJY7dJp+PudcoGnSTZM1htHIyJLf6MjeT+4m5GkQaYNChZ81acwOpZ
 IqIAovfL2SkJ/7jIg+EhRUYoF9Z7NcfS4XEGHo8/EqWX3ff5rs5y9fQx4Cv4hrWXZwimb8zeFC9
 OMpEycpnC0u0Gg9DSytlfOu+n36K9YhqP3QsJF5uIFD0SZwMFVAm5UYm+0/ZwyPL5cVa3V7Eun5
 P0cic3GZIOxzNHH9HcCK9idkP2/LpmifzzKbLBsl83QQ130Ja/sPZ4SVpJZaEbLOOJLqleTJx2I
 /mWCho8H2wSwd12VpXw==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a2fa4f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=p5Qc6n0AjNsD3RYv9wgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: KErDY86-rpUzk6_xsBdGPb1WD6Zn9Uku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280132
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 02BBB1C38D4
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 09:57:19PM +0800, Pengyu Luo wrote:
> On Sat, Feb 28, 2026 at 9:32 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Feb 28, 2026 at 06:19:07PM +0800, Pengyu Luo wrote:
> > > The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> > > utilizing the same register layouts and clock structures.
> > >
> > > However, DSI won't work properly for now until we submit dispcc fixes.
> > > And some DSC enabled panels require DPU timing calculation fixes too.
> > > (hdisplay / width timing round errors cause the fifo error)
> >
> > - Please squash refgen patch into this one.
> 
> Ack
> 
> > - Please post at least the dispcc fixes.
> >
> 
> Yes, it will come later with the panel driver. Lewis provided the
> patch but it was generated by Claude AI. The patch itself is not
> complicated, it only removes CLK_SET_RATE_PARENT from
> byte_div_clk_src dividers. But I need to find some time to analyze the
> dsi phy clock diagram and reword the commit log.

Krzysztof wrote a perfect description in the commit  b8501febdc51 ("clk:
qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf
parent").

> 
> Best wishes,
> Pengyu

-- 
With best wishes
Dmitry

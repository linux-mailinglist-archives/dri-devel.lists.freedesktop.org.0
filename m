Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMqxAe0XoWk9qQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 05:05:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A913C1B2796
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 05:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E9B10E0EA;
	Fri, 27 Feb 2026 04:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCyPnSVn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEo7vJOE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59AA10E0EA
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 04:04:56 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61R2KKSo236992
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 04:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vF5ebjzI3ltfd+GlOyn/ovrS
 76xGTYky2kSG6LrMPmA=; b=aCyPnSVnbdhJDfviUFTEKxxxmu00GUB5itvkfR4+
 QRY9/lSKG9OeLJPde/Ljx9sbBDG38u5RZwvF4RWnGZdVTkiNR/5zSqs+WwPpp1Zm
 9U+MXbsJOm+enczWLMSdMtgYrTuerJkhfBdpaHC+zb8fLtmqQk6cKEv03r4vMntf
 wVRRgGjEEL6hYbfJs3U81wWsYQqewwZ6vLp5hDA2cqFm/LJ3eCvfpvmk1CXbwVTn
 mgEPSjAtWhmmPDYYKC79vDXik+ghFc4yUT09YVWcy5eemfK1McIsDYCBE0gd2AS4
 hMNFIUJdgRb3mOSxJnshiT45/qUYPGOkggCw+urcrn98Og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjx1xrxba-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 04:04:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c70fadd9a3so1440149085a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 20:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772165095; x=1772769895;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vF5ebjzI3ltfd+GlOyn/ovrS76xGTYky2kSG6LrMPmA=;
 b=CEo7vJOExDBojh/mz2h6hNMfGXcLAuH1ZGqeuzX2J092iDD4ZDnNQU6TyFfNWLN83Y
 TvxMj9nyD42VGzv/3WoYH6tHmuR7LM7vM/rsrwM4JGYCcfuwB2CmQkZWk+j/2VD8lguH
 XyrLvNEcDTUXtWuiF80EjtbehJGtuIttGiaYUJf9dceshomo6f3xEyWU0VuCEol2l6aD
 ZPUxTybc3HRAu7ZKoy3NsZnYNxRwvsax2twoDEomJo45HKLS+wXozqeTuXkWzLbPH2Lb
 LPsdO0JYKXdbykBO24cFkvdUlUQWZ/D6xy4x67rD043ioFA70CgAtCJuFmhVICjrvwof
 9FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772165095; x=1772769895;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vF5ebjzI3ltfd+GlOyn/ovrS76xGTYky2kSG6LrMPmA=;
 b=hAu+QY4sKEjJDlSuxIcodEx7WtynHS1SLOXHfboE59YkaV/TDzJvvBcl2osjjuZPO0
 vjlDqEofAV4vd+VE4G0PuJhF77lP3EkOXmbQRhQGdAdOKx8DsEbioE6QX3l07DN2zn8P
 aTJsh3GEKgqFMywfYAdobOS1UnKCQf8cwyjW6iFb56RK0anaQOlx80imgqzPDX4pXZWh
 gx+/aqvtDd1/zSKsYoel16ADW+trMGBqKsWdFFqRs0TYG7coT2flGEqx/xiIpnBhlL0X
 0gYTTP9oBf9iLNem9u+P7svZbRBf67wQ5EYkrYNjxMFqMnckRywXnt1PRZsnvetQgVo7
 8X3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1gwv77LNBiRe9VM+W9YieDhfraVuycOIYIOt3E7buPTRoqaY+oQdjLU8CkWqbW98UF4pi+fUZr34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8H2Vst9Bz/WRyAbMVo3SOMNtqYcM8ZCyfBc0obRYyoiRiy+Xo
 s3J+ECLlMNoXWrG/iSXemtCg8FA/xqI1/pNZ0ze53xLTAqTQVjVn2KL6eAxdJkhKQxLNZqovbdo
 3ijanYs1imqpOywBO8I2PmfeAyBe1v+UjE94g/dV7tt7s+ve9U66kAP+FKqKbZTzgCTHmFkA=
X-Gm-Gg: ATEYQzxlHmTPJ957/q2741Jfyx0aF7ZQUaFLygiL+gntC1eYA240DvS0OdQG2EnxZ0q
 7PT9bZqdogP5GuybE3TdywBy+oq8yP/mm//+CEg3cPCREOXj5/lmpVMW4CDqzAGfm5jPeYa53zM
 G9NPucH4ZKUQjOBL0FnhzM+qGjOTuJLw3nLkEXONGsAeA6jAYJ4k0H0LskeeABC7RSIN2az+5Ou
 Ccc4qOdL2Mkit2yD6LcRnfiLeEXW4L+eCJQV6kp6LDTK7Nk3RfOgL6LqW6yudl8URXh8TjgR87J
 iQMU7sp5o2H7NvoR9K3IiKX2UI5vMjG4eihEzZtD25Dx9lhy1Kq/Irm05VtXq5gvsYMFu9mHNwc
 abqkAgTnHV9VDfPAzbQXUzsrPkweemO+19tV7CfCkn79e7w47JLTcbjRwVQsEeJBEInMydFfwMa
 Z0AbO10qWdjYR3SXnlixns4c4HtcE/wequyuc=
X-Received: by 2002:a05:620a:3949:b0:8cb:2c2f:90e with SMTP id
 af79cd13be357-8cbc8e4fc12mr181458785a.39.1772165095143; 
 Thu, 26 Feb 2026 20:04:55 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8cb:2c2f:90e with SMTP id
 af79cd13be357-8cbc8e4fc12mr181455785a.39.1772165094646; 
 Thu, 26 Feb 2026 20:04:54 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2f626b3sm12487591fa.10.2026.02.26.20.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 20:04:53 -0800 (PST)
Date: Fri, 27 Feb 2026 06:04:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dsi/phy: fix hardware revision
Message-ID: <vtvn377utuwptjbfuqvjypxzltblh5c7dyocwjr7jqyemgzrwh@ei4cx6q6x57l>
References: <20260226122958.22555-1-mitltlatltl@gmail.com>
 <20260226122958.22555-2-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226122958.22555-2-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: TcEiOsv5I_dnzqOjxaGxiJexBRUBzMZN
X-Authority-Analysis: v=2.4 cv=Vtouwu2n c=1 sm=1 tr=0 ts=69a117e8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=IGH_EllJKgn0EH2UewEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyOCBTYWx0ZWRfX2Fhnbp0s2kyz
 YE6QnOA1dYUrXwbUWDFrnHEQyqYs/svf9B/Kfo0RgtV3bnrhXglPzh/rMRxqwwMlo6VNfuvFs+D
 8SRXvS4sBj1nl0QeeooakNY114IVrKufW9SScjG9SgSUobA1XTiwhftKns6ya0at97iz3kNfZuR
 BlrhfFHjAuG1bvgvEofcRd9fCV8ESB05AdXmSfePO77QSSak7KucRPbQHGw+OrqzbH/IsGlxIJo
 K7CXQ+dVoNF7DfzmJbxIFKTU/obKc0+zORxCeCqwE7TZSvhUJxssWXgHOGr7DRwcqB5pD6kld5n
 AkvO+W1pezXI4YtdHUFqzKRa+ajnuceHH3tQ2OWm5Oj9UR+r2RCve7sXxGbdH+O2tSfRMNHH/uA
 94llXeZ8OKjeJh+XDO8we8/YHIioirjPPHCFqV8zEmKxzSUIv/TubQVyqKsEg43J/bCWeMmAYg6
 xvUUKvgLoY9qOo9JdhA==
X-Proofpoint-GUID: TcEiOsv5I_dnzqOjxaGxiJexBRUBzMZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270028
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
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:broonie@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
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
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: A913C1B2796
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 08:29:57PM +0800, Pengyu Luo wrote:
> The hardware revision for TSMC 3nm-based Qualcomm SOCs should be 7.2,
> this can be confirmed from REG_DSI_7nm_PHY_CMN_REVISION_ID0, the value
> is 0x27, which means hardware revision is 7.2
> 
> No functional change.
> 
> Fixes: 1337d7ebfb6d ("drm/msm/dsi/phy: Add support for SM8750")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

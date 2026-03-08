Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD50Mt6QrWkQ4gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 16:08:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3709C230D5A
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 16:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9ED710E472;
	Sun,  8 Mar 2026 15:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmMiHMVb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COZ4qc9u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605B310E04C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 15:08:09 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6283NbdD223506
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Mar 2026 15:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Rvi08IAd9UMRUOwod1y7p+91
 CSiqtivUDxTDdSrOr7g=; b=GmMiHMVbeCQiWsPlbn6WHGb0GF8NtmZoWnoeWP9p
 L8pa7UmWQU6B4HTpfg2OrDHFH1fjEVG7/TZlf3n21XPkbk4LOWl/xWUXex6WlsA9
 3Ce9CpL/Avr+F+4F0mDy7VJbICyTexbr4FgCd/+f1fjTuPzFbYfjsMziVYhQ/PlU
 F3mV3StM7HhdnSQAzYGpUG7oiJgtKaGJlXvJAOkHCsr9X9s3n9+d8dAu77oSZuqd
 KYzhCitu+22V1AfCKPl/dF6UbifxbJ6BLk/eO5jf93KBqEMuKP5K1uL0n6Q8NgGv
 PUaBze0S7z1D0i0Bwo/0nUV/5nCVM+NGtcuY02dJTiNRWQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbbg2rwa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 15:08:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-899f757514bso476626266d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 08:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772982487; x=1773587287;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Rvi08IAd9UMRUOwod1y7p+91CSiqtivUDxTDdSrOr7g=;
 b=COZ4qc9u0izOb2QUpmYBBdd97r9/lnVX/Z3CbPOdIebLTPqijBm5tH6czqIm3ebXgF
 BFn90eVVypLXDjnUA7PZXuPGUOu6oh/yigjbMVY+aYwIBNWtYMz8uYrhmTEhRsp+Q7Uv
 6jX3/EX33HWiOI+GRaaFyLSvZKvyQ+pfekA6oSBu5QNtnDJ2DYhn0zkjlF3BPO6rn6MW
 BpXA2g0WMf/iP8UzH6UzFSpw292q1z7Fa3j49u1EGllqYZ0eeZraP9rKrQDxJkzu/6iB
 nzr0Qo9/w06u4W0unoj1lOzGMq3v7zpQO9fZISs8MAQ/E/isn+J1Z9q0gfxMViLw2/v8
 mawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772982487; x=1773587287;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rvi08IAd9UMRUOwod1y7p+91CSiqtivUDxTDdSrOr7g=;
 b=SuDRx5lQFR0/kGX9q4JEIJwc1n/QtTCPmuh/NM6Dw3dA31M+I4jX9oYClIIPF8IcYx
 ImBti6zitRIs9SjzEjIde/3gbXOHrlp8s8WG73JADQk6DgeAMqvwsT0hdcYMcMQ73k5z
 F8MmGVY9oTr22qyu0e9zsllMfs8FJGYk2nAxN9wINqVTVQosLbWSF/QAJ87kX5CpRWcO
 HdHOn3sW4TxCLY0m3HyIZXJE/ER9lih89IADzzrN6tFObce9jWkcJpqdvED6ZwLtMDw7
 9m8KTqD1Uf1hmOo68ayTNthxtQ/1QhtSdCf7VLbJfGYZ+q1cDPYpceHGaR6qeGaKJoeO
 gU8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd2mIlgzXSDZJZz3Tfkm92wMiFS7uM1NFWmAPtZVMFla9QsUsiUQFhN4ZvZoFhwMFILt5HMdnN4AQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF8Ph0I/iT45xaDU6EY9t/ssd3Pao0dS5+YdgMdgBvI++yeV6s
 EV/yAOhmjcjEwiiCoaDjylWOeSjjrovz5qK0VG4W4HXDvPlyLCQd+POwCYImBuoX69oHqizBAvF
 kAx9gn5/TzJX0OC31GGcbvHa+c+kxnnut7D+ZX18mSzm6BaZE5YGtPfELwrectMXBwj2US7Y=
X-Gm-Gg: ATEYQzzKVaWhGsv8wv3p04wsaf280CLTSczXKVeGF/q3pFdys/4e5l6UMPGa0xW/P+m
 sIE9BC9dNNCaJnsUwvpLz+uiVQmzmjHfEET82QBuNyyAG5a9z5ZCGC1YN74IFBbRU7LuV6bTvSL
 2ny0sChx4etRDDz1Y+V/XIEB/O/rNPLH5HEzKfk12WSJum/iIHEBEEArNzKcVSKEFDgS9fGW4Lh
 W6NkfaF6ConMEIhf6m/gAHkvGQ3WvQEqChMyFBI3RW5wcoQj4mU4clR4cbSs5BeoKhHT4zzBGpd
 idl4dUC6rsCHcwgH8R4irRmY0LU+7Ymw5HdtS/EyLYE1LwJzoXd7Vy6t98rMhOdfONKrvPgFCL4
 MsafFw5lMTGSAZjZiK4x+Em+X2adzqZETyJuNZ6w5K81rCDIbU0Xq85/CgT9kfj6DWhqyI4RDyO
 UoCEXfBJYQb3peYRuyDik0hy6YbMvPUCnbOfA=
X-Received: by 2002:a05:620a:564:b0:8cd:7f7d:b091 with SMTP id
 af79cd13be357-8cd7f7db19cmr295648985a.71.1772982487393; 
 Sun, 08 Mar 2026 08:08:07 -0700 (PDT)
X-Received: by 2002:a05:620a:564:b0:8cd:7f7d:b091 with SMTP id
 af79cd13be357-8cd7f7db19cmr295645485a.71.1772982486904; 
 Sun, 08 Mar 2026 08:08:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13d07e0cfsm1483302e87.43.2026.03.08.08.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 08:08:04 -0700 (PDT)
Date: Sun, 8 Mar 2026 17:08:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 WiFi/Bluetooth
Message-ID: <gn4qdul5tdm26zfgem3y7jswucvbk4jb35pabw3uf6zl735h4w@6dkrl4najlhd>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-4-aa2c330572c0@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-rimob-new-features-v1-4-aa2c330572c0@protonmail.com>
X-Proofpoint-GUID: Q8Ob1VZgSqxZKhn_M-xXCdlh8dcOMgYq
X-Proofpoint-ORIG-GUID: Q8Ob1VZgSqxZKhn_M-xXCdlh8dcOMgYq
X-Authority-Analysis: v=2.4 cv=SumdKfO0 c=1 sm=1 tr=0 ts=69ad90d8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=TiCh2U2r927ZuiwL-uAA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzOSBTYWx0ZWRfX1rXBJxRIF9PU
 vvHpqjeVBR7Z4ZFc+IsDvhuyVapNGA2RNf5luiUvD8e59yrGKpiA7wq2k6SsPmcIoWFDNMRKk08
 OD4ubNY3jB8qH4WQux/FmP5XWrMJz9an467wLkaDwcs2bJeJQH93dkYRYMLaFK0A/xIH61gKTRj
 I2XoxYBVtSMMSrofzI2DAuOOQBhawyL9q1zdNA9a2eSBTmQ+u7dBvVVCa3orSvNGHOTtOIyvaBS
 SCEjlVwu4f6XaWsmXIgS7P+wkjS0txlQpKffrUJPJondjboZZkM/lhsrfX1gB5IccyJdXMA9jpV
 YinqyAq1adOSwSrbfjchw1jAheGpiqMJqCllkNfDw5cGFv6LANH4IY/pANcq86dk+ly3p+aqeEt
 UwziEXCjICztUrNeTRjKCgY/kQMsREUBwIdSklkEitDWL1IugTKpw+UvwUEjI5rrvIulRS60SGT
 ZPolICkZsA4xYYvESog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080139
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
X-Rspamd-Queue-Id: 3709C230D5A
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
	FORGED_RECIPIENTS(0.00)[m:cristian_ci@protonmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 04:52:44PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Configure and enable the WCNSS which provides WiFi and Bluetooth on this
> device using the WCN3660B chip.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

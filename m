Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MPeKceJnGlWJQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:09:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E487417A619
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11A489167;
	Mon, 23 Feb 2026 17:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bghbiY7u";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z7cXrnLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B73F89830
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 17:09:21 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NGvR4u3478629
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 17:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=v4wJf3RfvYx/N6YOBwnzs0nO
 tYOlLmOqFKLIASO8YBs=; b=bghbiY7ue+A1njbaWrWACoe4QvDba1Ik19DEIiKM
 hnDcfP2Hvy1NzP0BgmD6Px+voM/fNRgWsGU9YDZG2S0LNO1An9ywI78EjFaW1Z/q
 pe6E0bCamsWXbzYOb4Yw8znPhMqHU37n1N4D1KJxS1zYa4Ymb1iPw0kRJ9xSl569
 xBmI0paS2tPNhGNiIRf+8D39CtkwDHiZQZwpj01qONyn9E8tNSXzEJnSe//vzonI
 5yixri3ie5gm8Ch+2bLYlZjl1O2ZkRav2Z6BK8CU+rdK2InhgwRhagiKBM/eX24j
 NskMfvMIFTiF6rUviwUmthtXvp8bLTjPlyjtpCfT+bQl3g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9r1wd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 17:09:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-35641c14663so4859048a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:09:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771866560; cv=none;
 d=google.com; s=arc-20240605;
 b=YZZGnDAA4B4pyZKKU6cVhZ4jceeUICEVFJj3S3ag3oH1mJ2wWn6gboi8Un3Rzb9T8y
 +BIjQlEUGg8kiyc5L/uTc1eRz0iNoAZHc1CtOuTweAXh1kiCZagH22bRI1ZLWnNTbQGb
 K6dKnvwquaDV+klncOokoaAm6mFfIHp2dbEFNUyaAGazuOlQkGg7uyM4cCrrkUKAw1Dp
 7fVZfHZGJN5vwXPjD3xioNUUpLK7eFLqbflISjm6srfazzz13S1O/Vv6mrbjqu5M4uFd
 dUmOxUWmL+T+MkVePMOs5bIHHBWlZir7oPdfEvwMxlmvEtIGuR/3TFwlMTuDG8YJzTGW
 XLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=v4wJf3RfvYx/N6YOBwnzs0nOtYOlLmOqFKLIASO8YBs=;
 fh=jB0SELz54JJ+KZQTDZOCKas+aNOnm3WkIqMg0U5oLak=;
 b=GFIIH+h/npSiZLA2gFzpPd93DJnTTiQoWGZkLV/WRTrR6NN9i0PYrqjuwvogc69PPk
 RxBfVN0WJYUZVTnGLyL4eTxHGrF+Aa3rvYgMS4W2KJ7Ei23UpG6KvuYpAoYuHoS+dqfG
 ftn9psCUncZG29ECwAGEG0E5Khw+ItKd1Y5+GCKhOj7evdi2qLy22DZRbBX2oyyzuvwC
 VqqWIhYsBC8QXzXx6MYWfsN4q1s/im2t8tl3y4XVlSM+QliZz+J/3G1WKNhge6Uqv93x
 apCAPIDUqVOIWQgCU9pNpXJf2xxLSL1BgokXOy3PrDZ7anorLs0UMaDydg1BPkTVr2lv
 Mnig==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771866560; x=1772471360;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v4wJf3RfvYx/N6YOBwnzs0nOtYOlLmOqFKLIASO8YBs=;
 b=Z7cXrnLZX6nNzBG3m+8pYtE1n/5f3BgsYiqusZXW816lbK2C8bxDisHYMb26QoaOE3
 iboem8WYtrBXmROfg2yH1K9UF6qTwL4egQB4TG0KbVDz9lpCfiNd9QD0jHOAqoQfQege
 h/vGwuWSHwI5RouIR57LHmhc92H5bkoD+r04V9wqRqZWNYuzRRH/Mvp02BfjvST0k8X+
 Ju0q31GBypWfC8tLx95IAtxmD7WEY/PZaPO7V68RongiUSqsT0zrpeMNP4saMmniSfe/
 S1ZwD2ITbcq2rzVXT+1CsXMQE8ovxkFRhxHQRiSygFl+t2PQIMoziR8OY4tsagOxNey8
 tXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866560; x=1772471360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v4wJf3RfvYx/N6YOBwnzs0nOtYOlLmOqFKLIASO8YBs=;
 b=YL244pL/EjveeCcHHn/8sh14yXPwJTn5sByYZ8PHWvDnSAxS1Clw7yUdHlzJtT0kUu
 W9QJmBHBSZREOJQVGyrCxAC7sOhFTLyDzeGMUDf9551dLVeV25d5jlDRB8fBzHIHzOa6
 IRnInRVmyo5lJ17FzKQvVJl2jXlrTtUYoiL+NAExzPhzoC8mB4L9kmZ8NlzHQgoewXOe
 nDcIPZM71LQMQp0kXUdwB7Q24PFpHwtTm3Q5ksHoMIoy8SZGzHS3MoITmHKnW8AHkuIw
 woKPoErpxd+dPzp/k6Pv3E1EGa5e7Dqm8nu4+xNxZWXjARgq3tDmwCA9HbxM7wXk42lx
 kPHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWABw3ulQcX1QwF4x61m9DrY+C1b1zW8DUZAOXb4dWPU/MVbM4EnVsCMUjOhmbltHrTGIyJQHRRtY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8++hDoHM/uMeuqBEBFbjkVjM+BoAseVz8zjxMmUpjTBq1/X7S
 ud0pWgDDTJown4T7Mkbg5jyu0/HUhvzQozxmPCzhtk/aFXEmu96wsFo9q1LllIJCQSxa2ESYZyS
 H/ufXW3n59SraPsV8CkgDhgJGgHxjUKeiHIMNaPIwNOH24MjTvLZbev4MUoHfBhQ+c5Hxej/TMJ
 PWSjdwiayiPGIo0XOH/ab5Siv4Uo2E/aatbMvUjr1I7e4+CQ==
X-Gm-Gg: ATEYQzwpmhcuZkQ0DX6uzy/xL0RrfxjEGTDfelJgeQRlo95Lsk8wA4VlACJ56DnYXPa
 wesfdu9QgyHfxYf27sdxA7RFA03llGqE3256L5Chds/2frFU7kPNvmxpy6JG3kA8NqOp2fKUczl
 KvfjD717v4WmVVpZUqq9oDFTH0l1nYr5ETbFNsu5I1oFhOe5d76g3n04GUOON4HsM3SNnmtincw
 xbPgNI=
X-Received: by 2002:a17:90b:4d90:b0:340:bde5:c9e3 with SMTP id
 98e67ed59e1d1-358ae8c2d4dmr8000831a91.23.1771866559437; 
 Mon, 23 Feb 2026 09:09:19 -0800 (PST)
X-Received: by 2002:a17:90b:4d90:b0:340:bde5:c9e3 with SMTP id
 98e67ed59e1d1-358ae8c2d4dmr8000792a91.23.1771866558625; Mon, 23 Feb 2026
 09:09:18 -0800 (PST)
MIME-Version: 1.0
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
 <20251125-pixel-3-v4-4-3b706f8dcc96@ixit.cz>
 <jqgwmjet2ncit5bqilvuqldxrtcapiozmpbk5klc5tybwbfezi@4muxgno7do45>
 <599b42cc-02de-4430-b09a-3316677ff541@ixit.cz>
In-Reply-To: <599b42cc-02de-4430-b09a-3316677ff541@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:09:07 +0200
X-Gm-Features: AaiRm50Sx2_n8DihOL9hklXJdrc8Du7OFuYU-F2KAYpfUdG7jvJfCQgmVGzeJ0M
Message-ID: <CAO9ioeVTyoG52=5TRFC3NJqKODXD5eGcpTax9SgCK3b-AznH1Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] drm/panel: sw43408: Add enable/disable and reset
 functions
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699c89c0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=im9cganMwkklmwY8314A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE0NyBTYWx0ZWRfXyZiOgq3GpeXb
 F4pVJel9piRrEHgMrIE9T3k7c3CrBWcX/3cBX58QPercUaHvps4KTDAG0qa5/cRFCm5eDdIFyNr
 JsRkKU48JtEvVv3IrTbyV9dr+eclPT65qkxNZcs6LKRIYqgsJBdojXsLgdRknFkYy2PVbg3flqV
 Av4ZeD6uApph9YkkOtok5vE2fiMhnzueAB/17geMkbEYSso+CGtlWvK1y+2r0LH+S1s0usNvjxP
 CF9taCJlNNocChKphBj1AjYDPUJT8Ejsm2XEw3bPa868MEzWLZAsdpZNd2qwUK7SCWjLQ1JMgT0
 Lc8uj12jzw+YVlBJI5clEe3yC5JJlIijN2KiBZ1QcUG9gmXfAesSaElHBgmr3Y7dzJV4Xu0Yw6m
 Vw4/Z6z/lhzMMMDB6fkDCsZ6fUXAYATvDwBW09YhDGUtI2flu7N1TPB8ZuafoVBmxz46h+QHZ3b
 O00oKH6sulm0STYlk7w==
X-Proofpoint-ORIG-GUID: W727SeMS6sDIFDhido6hK3DBf25fLIVm
X-Proofpoint-GUID: W727SeMS6sDIFDhido6hK3DBf25fLIVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230147
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
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:casey.connolly@linaro.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:marijn.suijten@somainline.org,m:lumag@kernel.org,m:vkoul@kernel.org,m:phodina@protonmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,somainline.org,protonmail.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ixit.cz:email,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: E487417A619
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 at 15:40, David Heidelberg <david@ixit.cz> wrote:
>
> On 06/12/2025 05:25, Dmitry Baryshkov wrote:
> > On Tue, Nov 25, 2025 at 09:29:39PM +0100, David Heidelberg via B4 Relay wrote:
> >> From: David Heidelberg <david@ixit.cz>
> >>
> >> Introduce enable(), disable() and reset() functions.
> >>
> >> The enable() and disable() callbacks keep the symmetry in the commands
> >> sent to the panel and also make a clearer distinction between panel
> >> initialization and configuration.
> >
> > This also makes those to to be executed after starting the DSI stream.
> > Is it fine?
> >
>
> Hello Dmitry,
>
> I was wondering how the exact workflow looks, does this snippet reflect
> real world?
>
> - The path ordering should be :
> - prepare()
> - (host/controller sets up link & starts sending video / enables bridge,
> etc.)
> - enable()
> - disable()
> - (host/controller stops video / disables bridge, etc.)
> - unprepare()
> -
> - So: prepare happens before the display pipeline is driving, and enable
> happens after the pipeline is ready and stable.
> I assume in case of poorly written host or bridge drive it may not work
> like this, but in general it should?
>
> If this workflow is correct, would it make sense I would incorporate the
> phases between into the prepare/unprepare kernel docs?

There is a very precise definition of the DSI host lifecycle. Please
take a look and notice that for DSI hosts there are two different
points:
- the DSI link is started in LP mode, letting the host send commands
to the DSI sink.
- the video / CMD stream is started

For multiple reasons those two stages are separate.

>
> Thanks
> David
>
> [...]



-- 
With best wishes
Dmitry

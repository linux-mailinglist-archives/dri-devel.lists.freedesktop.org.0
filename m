Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAR1OAvroWkdxQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:05:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789F81BC68B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3F810EBEB;
	Fri, 27 Feb 2026 19:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqgHQzA8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqqkEzs3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D94710E192
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 19:05:43 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0jKF1366528
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 19:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oCsQU3Xh83nXSd6ovs1+0g35
 v2T2gJEcTuexZjVheRU=; b=AqgHQzA8D0r5dngtWKHv2BigOgivVpo4TPwH+iuO
 0K4KYdigLF9PbiBDdn6q88YYbclR1jCfOSLCLy50W6zgRaPn+Y8gOTIUnwCANw+O
 R4hOca1cQs49Nkqy7kSJAn1wV0VUTX+DwnhObvjk3Tf+Hr4ebsYzW+oDXeUqC7X4
 uzRBPf8ZdewHPNqZzw0jZebnkoprJEchunrdZy74+jisjVVijKQZgkOq18gjj7/A
 E0VVJVepbJ3UK1rlqrr6amZc6IpARpV2YntpSsILUikpLFAdatQI3N64ImvGb45E
 v2EkM8uUGsSL/gWHV+VlCk8k8358Y+urehMjiJjZ+qL8kA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck9f01mt5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 19:05:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c70ef98116so2231793985a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 11:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772219141; x=1772823941;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oCsQU3Xh83nXSd6ovs1+0g35v2T2gJEcTuexZjVheRU=;
 b=JqqkEzs3bQM0a35Lpe7VnDxeV4Iw3NH5pdEcOSV7q/FrDnE410t6/C2uSfqdPzIjPy
 1JiOkNj5ySTtl88/v7hDtUNbbzM60G/6JwhMEf8Ko6kOW48lq/Ns9cKtgQ7u+o266y/l
 9nFJFQ22579s+sP1q5u+Mm2gqUqV1J1bO3xiDse9zub2ME0Nbt1ef3YKhh4MHgwvo9Je
 cvNUgOAcne3HI+x4heKVCw5lv+cv/JC2g4E8yQltyRVezQ8ZJwOzs2WOEgesQFgJjXAf
 84h/2KTnYyNbbxHNt1rSEYwCJnodoKEWoRglmXITQPK9Z2tSst8etUw0WVzIqoGiK7IR
 SklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772219141; x=1772823941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oCsQU3Xh83nXSd6ovs1+0g35v2T2gJEcTuexZjVheRU=;
 b=tXdQzvEVxLCzBZFTGKCezPmE83NDRvmwVAQCsvl6JAJ0ormbSO1d4lXH7b/VPs0AgB
 PmaDYO0vpelOUk4FtjxelOzFlvXMXo80VvOX7xKF73FkLqo/6Rt6le4STGbPAAMe4hBP
 hU/X3OH2yAcdKFnm7UcShzXhrJevjWB5ug0CGp/TbROjEpuVkglNxs27BgS4jvGswAKC
 wtY5nQZhUgXbn3Pb8XjGkLQGQJnr44nDUaqzwBy5zsXxTORWUDNKKrmEt62M9yEmyiUG
 KuRIJHrIBF/iVuEdMWTyGQV56AywU2KKoh/UuvCPTOoyu3nrYv16Ze7e4mh1iD9Pqhx9
 NfXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX1TQTq2bYu7jca8xhh7NG04a5r4GIcXQHd5WubONW4kYs3rQZo0TbIOaQkx4uy7FM6+jGf6erWLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxkur0MxTOEgrkqZ1mAeiJqm9Lf/f7lvAM7E31gdMURJfDgjscY
 6W0BxDpo7rZiYaXopkTwKBPeNrOF1NJk0TeJbhQd6QzT+kIljortReSR9yRG7gDiQ9hAZXTX6HD
 1Uq2vAx2eELJJlZqNriTnqdqdO4nAVJABJs5EiJlcxrkhZQYe5XPSndwA7Fh7TAwg3tk9gbo=
X-Gm-Gg: ATEYQzyZkJYflX3VW0d7Lum6fMrS78U7LnUjT4E8ASvfqV1qpUwtzLGbpo4j4GPsL3h
 imSoPnNBTBRq+LzULwuhM2i95KBTpfmN5idRm/kfB1nKY3wnsyFHXIuKYbyVeeTJVpjEPCT/8Gj
 rTXHqIJmLpnUomJ6JRhl0cJbov9WuwlJ4av+08UH33OB2WUHA2u5m7jt9yKtnxmu6HGIpUY467P
 OTTeKFolwAa2xixtvh7cRPPSa0r8wgLoZW3zHBV9q/3A7TmS+ylQoPvdKYrsdiUNwjYibSiU5ec
 LFACI+CaZP37p6AEApGP1b9T9tHyhp3J7Kw/guujKxqs8Nw4LhEPpQWoEES/NfshSpF+eO8PQfO
 xQdKycoHx7tLMfikT9MvIJ7kmUTWCXnE8B4RkO1J+E18ETmozbl2YfkoeDqdMspZGFFDyT2JCQ8
 MWFcqX5K22NpYX/C4X767LcwribiHrg43OlTo=
X-Received: by 2002:a05:620a:1aa2:b0:8c5:2ce6:db1 with SMTP id
 af79cd13be357-8cbc8d67d4dmr516318485a.3.1772219141368; 
 Fri, 27 Feb 2026 11:05:41 -0800 (PST)
X-Received: by 2002:a05:620a:1aa2:b0:8c5:2ce6:db1 with SMTP id
 af79cd13be357-8cbc8d67d4dmr516309885a.3.1772219140626; 
 Fri, 27 Feb 2026 11:05:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a109df85a2sm2017966e87.68.2026.02.27.11.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 11:05:38 -0800 (PST)
Date: Fri, 27 Feb 2026 21:05:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2OCBTYWx0ZWRfXzK4hiyCc4gn1
 s1lbCjB3d6qT6tpVVVLXBEWi/yhyAVuARF90UCBAwC6Z2JwApjvCEJtb0gX+XdKKyC+C+dzT8wc
 Ce9J+FkQ3dZaK9sxB0/qZ1ed2h8N+01V6gNInB51LjNBGJSLBGyYbQGJUscMpOpdq2KA35+/0kK
 P3kUdoqLESC+2So0WRe68EI54Q5ptpWjMN90nUOMv6xj0uktgMi43WF0oC9BZF9AJipCPGgPfLj
 2+FeS9DRbDTaD28Vqnvs2+pRmVxRji/boHpaXfjAXfwFQ9FdA7R72RVY2Ib7NkuWD2HckJvRw5M
 vgNm97ZWRg9q8EuXikHKSZaYoGN2dt++bhRmFGB7mM1tAQxV0Mf4nEbHd/9SijO+vis2/iSn63f
 f80oMyJNfaFL22VEcy1XIOmeLuK7anp6FFhhy0fQAPcDop3UiWIgR0RiWc7SAOhRezBhm5Jlav5
 Y4MUsDN4LNf8eLmUb+g==
X-Proofpoint-GUID: 47NcfHNe0XA89GeVzdF4-BhN0BUf1BQw
X-Authority-Analysis: v=2.4 cv=bIsb4f+Z c=1 sm=1 tr=0 ts=69a1eb06 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=V2B4IuEWP5mt_1dDe2sA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 47NcfHNe0XA89GeVzdF4-BhN0BUf1BQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270168
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:yuanjie.yang@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzysztof.kozlowski@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:yongxing.mou@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 789F81BC68B
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
> > On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
> >> On 1/12/26 9:25 AM, yuanjiey wrote:
> >>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
> >>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >>>>>
> >>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> >>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> >>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> [...]
> 
> > Please correct me if I'm wrong, if we drop dev_pm_opp_set() from
> > dpu_runtime_suspend, then we should be able to also skip setting OPP
> > corner in dpu_runtime_resume(), because the previously set corner should
> > be viable until drm/msm driver commits new state / new modes.
> 
> That matches my understanding.
> 
> > The only important issue is to set the corner before starting up the
> > DPU, where we already have code to set MDP_CLK to the max frequency.
> > 
> > Which means, we only need to drop the dev_pm_set_rate call from the
> > dpu_runtime_suspend().
> 
> I concur.
> 
> >> For MDSS, we're currently generally describing the MDSS_AHB clock, the
> >> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an OPP
> > 
> > No. As far as I remember, MDP_CLK is necessary to access MDSS registers
> > (see commit d2570ee67a47 ("drm/msm/mdss: generate MDSS data for MDP5
> > platforms")), I don't remember if accessing HW_REV without MDP_CLK
> > resulted in a zero reads or in a crash. At the same time it needs to be
> > enabled to any rate, which means that for most of the operations
> > msm_mdss.c can rely on DPU keeping the clock up and running.
> > 
> >> table.. The GCC clock is sourced from (and scaled by) the NoC, but the
> >> MDSS_AHB one seems to have 3 actually configurable performance points
> >> that neither we nor seemingly the downstream driver seem to really care
> >> about (i.e. both just treat it as on/off). If we need to scale it, we
> >> should add an OPP table, if we don't, we should at least add required-opps.
> > 
> > I think, dispcc already has a minimal vote on the MMCX, which fulfill
> > these needs.
> 
> I have slightly mixed feelings, but I suppose that as we accepted Commit
> e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the domain"),
> we can generally agree that it makes sense that calling genpd->on() actually
> turns on the power indeed
> 
> What I'm worried about is if the clock is pre-configured to run at a high
> frequency from the bootloader (prepare_enable only sets the EN bit in the RCG,
> and doesn't impact the state of M/N/D at a glance), we may get a brownout
> 
> This rings the "downstream really did it better with putting clock dvfs states
> into the clk driver" bell, but I suppose the way to fight this would be to
> simply set_rate(fmax) there too..
> 
> I attempted an experiment with pulling out the plug. MMCX enabled with the
> AHB clock off results in a read-as-zero. I tried really hard to disable the
> mdp clock, but it seems like the "shared_ops" reflect some sort of "you
> *really* can't just disable it" type behavior (verified with debugcc)

I think, in 8996 it was possible to disable it. Not sure about
8998/630/660.

> 
> 
> There's a possible race condition if we don't do it:
> 
> ------- bootloader --------
> configure display, mdp_clk=turbo
> ------- linux -------------
> load rpmhpd     |
> load venus      |
> set mmcx=lowsvs | mdp_clk is @ turbo
>                 | brownout
>                 | 
>                 | <mdss would only probe here>
> 
> *but* that should be made impossible because of .sync_state().

Yep, sync_state should prevent MMCX or CX from dropping under the boot
level.

> 
> This may impact hacky setups like simplefb, but as the name implies,
> that's hacky.
> 
> Relying on .sync_state() however will not cover the case if the mdss
> module is removed and re-inserted later, possibly with mmcx disabled
> entirely but the clock not parked at a sufficiently low rate.
> 
> 
> TLDR: reassess whether MDSS needs the MDP clock, if so, we should just
> plug the MDP opp table into it and set_rate(fmax) during mdss init

And what will drop it afterwards? MDSS will still vote on the MMCX / CX
level even though DPU will change the clock freq.

> 
> >> The MDP4/MDP5 drivers are probably wrong too in this regard, but many
> >> targets supported by these may not even have OPP tables and are generally
> >> not super high priority for spending time on.. that can, I'd kick down the
> >> road unless someone really wants to step up
> > 
> > I'd really not bother with those two drivers, unless we start seing
> > crashes. For MDP4 platforms we don't implement power domains at all, no
> > interconnects, etc., which means that the system will never go to a
> > lower power state.
> 
> Right. Might be that 2030-something arrives and armv7 is gone before someone
> randomly decides to work on that!
> 
> > MDP5 platforms mostly don't have OPP tables. (I'm not counting MSM8998 /
> > SDM630 / SDM660 here). MSM8917 / MSM8937 have only DSI tables, MSM8976
> > has both MDP and DSI tables (my favourite MSM8996 has none). Probably we
> > should start there by adding missing bits adding corresponding
> > dev_pm_set_rate() calls as required (as demostrated by the DPU driver).
> 
> A bit off-topic, but:
> 
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> 
> 96 is in DPU. any other candidates that should be moved over?

Let's go through them.

All SoC except those currently supported in DPU require SMP (shared
memory pool) support to be ported from the MDP5 driver.

Most of the remaining platforms (except MSM8994/92) also had HW cursor
implemented in a fancy way, in the LM rather than in a separate pipe.
I'd really like to postpone those, possibly first completing migration
of the other platforms and dropping support for them from MDP5.

1.0  - old MSM8974
       I'd rather not touch it, it had bugs and I don't have HW
1.1  - MSM8x26
       Probably Luca can better comment on it. Should be doable, but I
       don't see upstream devices using display on it.
1.2  - MSM8974
       I think it also had issues, no IOMMU support in upstream, etc.
1.3  - APQ8084
       Had hw issues, no testing base, no MDSS in upstream DT
1.6  - MSM8916 / MSM8939
       Can be done, low-hanging fruit for testing
1.7  - MSM8996
       Supported in DPU
1.8  - MSM8936
       No upsteram testing base
1.9  - MSM8994
       No upstream testing base, no MDSS in upstream DT, normal CURSOR planes
1.10 - MSM8992
       Even less testing base, no MDSS in upstream DT, normal CURSOR planes
1.11 - MSM8956 / 76
       No complete display configurations upstream
1.14 - MSM8937
       Supported in DPU
1.15 - MSM8917
       Supported in DPU
1.16 - MSM8953
       Supported in DPU
1.17 - QCS405
       Zero testing base, no MDSS in upstream DT

MSM8994/92 would have been an ideal testbeds for SMP testing, but...
they mostly don't exist (please correct me if I'm wrong). Which means
that the next viable targets are MSM8916, MSM8x26 and MSM8956/76. All of
them require SMP support and don't make sense without cursor handling.

> > A note to myself to also add OPP tables support to the HDMI driver.
> 
> Eliza!

MSM8996 / 98!

-- 
With best wishes
Dmitry

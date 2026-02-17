Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFpdAAD1lGlzJQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 00:08:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49CD151B4F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 00:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8043310E2B1;
	Tue, 17 Feb 2026 23:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HuknjF3p";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3WbPSch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE3910E2AF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 23:08:42 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HN87X04060756
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 23:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=LnanU8PAYceSWKBt+m+SEdZEojtqeWe2NeYl1HwNokU=; b=Hu
 knjF3p/1KoYNLudzRm1VJq6Qb98csFwOfWEvCSnXuCqjNufsBlkJm3+2mxD/v2ch
 whEkYmMPEwtsXK1jXmT8+4N2vN70jd8DPvPE1hzRvRfh+SofiMA8iSBWtmhZwEjc
 tOPtphayWdDEkKX124h4tlQqioSmbmEll1KepWceEek++K6vs5hSFfpktBRExeku
 dKfIfXITalCkoTj9ReZr/EwgxuqnVZhBo0d0081OQxuQqWWssrimNVD3PjkMFBuc
 th1xKaUR72JEtC/Vby1YGo1amsHnQ0vl1YaIHdnftPFoBTnasenfDnshzaugG6bZ
 RsNJde9ZmJqUxP5TQbJA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd1qx0022-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 23:08:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2ba9a744f7dso5737296eec.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 15:08:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771369721; cv=none;
 d=google.com; s=arc-20240605;
 b=dryMTF0bvEmkddJloGTgOLsnwu9SeVMzI6ezNCbPyugu9evKnKzRNCVtzz1rCBbe9X
 oNqQfbiuQG90GwLcHcjpv4iFw4zWa72NpRz+PU5FYtgamehJ14SbvMJ4Qv97bNGtsJdC
 ZI2eYtcE5ctax+rPJ2hoXUQQKSZ0n0QXGD9IpvC921BQwAEN3MHMzS7I7ZZh3fgePg/5
 4wHEzSi3aSu5Rig5HKrA9wo5xf0tRJwcpnrbaeDiy8iKs3Ikya6fbm7Bz8DVUpgct+nf
 cihcqi4qW1ldepPn7HbOreNYAHzseP8dZXwHOXc0hCZ0DqZkle/KIZ9/jO94RoSR9Tzi
 v0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=LnanU8PAYceSWKBt+m+SEdZEojtqeWe2NeYl1HwNokU=;
 fh=2tJ90gSlT6PMimlddCZQL1Cj/IQY+sDvItGdGGvn+4w=;
 b=i+NzhYGL54tnIVlb8tF8rIxHzsWOpnMEjJx6UByUd0LpM1lwXBg6kPnMp5DYaBxsdl
 Ao+SmqPCM8hH2Rv6mnW3fv9sO8TgaQYcxNj6UIb9w2EcqBQTX2aHwIs6mvgIRyBVXCPS
 smNHoNkzrHgCtHQDuyT4AYNQtwrh21j44w3kL3mYnotDy3RE2PiJ48JPcA/sP6Z2eTru
 gHB4fdGQpcfWjZa42TcBpvMJ9vg5GRCkAFIcsWsif+sPvCNxKDqwwo4FjeOnk1jDbL6T
 QpUGoIH/DEluNLNX6ClDI1M8FYWsGuNGGzTLPmFt0YbfySGqrYo9m9H1dPh8x8ZoYbQO
 tZOQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771369721; x=1771974521;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LnanU8PAYceSWKBt+m+SEdZEojtqeWe2NeYl1HwNokU=;
 b=I3WbPSchaWlcLQFvs6ewpV8EkMzNguc52Dov5fRe1qyR8mOE4rot/i9WkblCGBY7te
 ECnmupNxy595r1pU8EZ67sNXS0MdNwOUCFByNQgRhbpkIMNawKwEM5csdTTr/5/jRU5M
 jHOJ7KDhRua8DROw3bISCxySPidCi0NesYG6a+A2xOnRPm2QEPl+3TipEYvCPZ0of/Ws
 fdo9TzrRiS1MEY1cEg3JzLTUQ+0fqhJO/6C2mBZUjfF6rG+1ceRnjzzfJg4E/bESKOBt
 g2SJlnDUUd8o0V91H8V8AzhLZKQ5x0Z+9qel+YBy67wcQ+l1zcsicmKvYyUlyWmfuApY
 BYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771369721; x=1771974521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LnanU8PAYceSWKBt+m+SEdZEojtqeWe2NeYl1HwNokU=;
 b=UT4RnhZZwSIyRJktXRELl3jQ0zLqT7qRzPkFD0qkFGhtmgMjjIrJ7GKV+rXXN+Y/un
 arOqGvcQuV5etQgd8kIWstk5u2/aLbNKC4njHAkx4+D+acyZ4SIwXiXg6949ptEb378u
 uz3O72BrAF6Eu1J9cFTcBGIyCUA0kbxBilr0vbx2Ce6rG4Fs5cCV3EzD3T47UTrvLi6p
 jDmLyigjM2vjn6bswW8S+u3sEC3LWLlPXtA12EIYAlSs3Cr2Kv3puMQRil7GVORlNM1Y
 +axfXdkk592tePAz5BrX8CWc7oIr+681bm9KCIiItECwmO/rR4uP4KI0FpRzpSuOzFqv
 i5tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVihn3wCLdsLFOq24EiaStzwn8GxINR9YfzsYHiToctkMjnNIUJptzohD6WFMMurzAxP47oUV4k8g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKixVdDg36gBYmiOwub3m30MES2qfQsoGjSyFcjJSXCS0znPeK
 zOZ52aZTu6hIdwz/fZ3o9AR8nh0FmexTRIVtK8oe4KWT+sBImbjNwoaJO5hj2KU+TCeHCrMsxCv
 rct8NQOPVL876atgJwrqhYgpqk8bmtkwsH01hF/IfGMOvRKCAfkQxVB8bhW1/8fVpfSqrGGgMaU
 wsigZZszqZGlrdvLHBGL41nLkJIFw6Cj9AqcRBcUXfFGYrgQ==
X-Gm-Gg: AZuq6aLMSqDoGAwLJllgmPzcrZTKT2a34ghhZ7XPOglTyp/ieXxgRZzWE0uh+98TWAV
 2W8f+F5yjgr7n2n0y21F9q6IE9fMnUcHqDFsflalSK4+WEQNq6c9xnPFQX36XHZBs45lLD8ydzq
 GlXGtt8YRs3QaC9PpF997loVA0nKZxgR6tCLITnrz/vX0nj5xuE5/2VwsOGAiryp6Yi/+2tzAHO
 Ufq4vzKRWg9wRsHbOEXfGQoSPR9mNRC1rB6Sw==
X-Received: by 2002:a05:7301:1688:b0:2ba:7ed9:1565 with SMTP id
 5a478bee46e88-2baba125906mr6788241eec.36.1771369720919; 
 Tue, 17 Feb 2026 15:08:40 -0800 (PST)
X-Received: by 2002:a05:7301:1688:b0:2ba:7ed9:1565 with SMTP id
 5a478bee46e88-2baba125906mr6788224eec.36.1771369720229; Tue, 17 Feb 2026
 15:08:40 -0800 (PST)
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
 <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
 <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
 <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com>
 <iqg6jpq4i3olwugnlnsczisbrbysxzik6otby3pgkv5uqsez3f@diwpjgf26mk3>
 <203f6f63-e81d-4db5-8ede-ff6695a847ed@oss.qualcomm.com>
 <i74iyesupz2elaoefyn5s5r53op5aifftcmsgktk2pyghozvwx@usg4hp4wrtug>
In-Reply-To: <i74iyesupz2elaoefyn5s5r53op5aifftcmsgktk2pyghozvwx@usg4hp4wrtug>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 15:08:29 -0800
X-Gm-Features: AaiRm52D5WXYL-x3xfhCjoZjU7AnJhPRmHPHx2Ez5oMG6KajaDiqGRMsuv65CcU
Message-ID: <CACSVV01D6u1B2d6ipd7cuomOhE_iGDBF84V8=v7jcm_5hJ87eQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: FjNBm-hjKrIdG5L_yNOtlTi2F0xRKwx1
X-Authority-Analysis: v=2.4 cv=R7oO2NRX c=1 sm=1 tr=0 ts=6994f4fa cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=-dl7yEjYuLqhyd9yoY0A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE5MSBTYWx0ZWRfX9XXEs9myf1op
 UADfuPFBlgJr5C1uf7AZJYLFl9WbhYbVE37aNSR961S+Wu7EhixSGsn4rWLU5QMGab8jxd1bxCT
 io4o9Zj8Y/Io9/PGhQtzi0PVCuF4jB4zANPlHZTUEKchhQJry6St2EwO0v9WVhvwXpZQmrP6DuN
 uIOVfQEWswrEhn7rAxkz8CK1ZBB0J90TL6p+KBdcQr/MH3XAxWvI0GMnV9lW7NFsnVePocdvvGz
 5HSqNKryHnIUeMxj3DE/IC1JPHUGIwEJ3pLRMdyc8BFoJV4y4RdAvEBzh4rHYBQDIqnv2h/ZE5G
 06LIU6vfsw4wgBAPUo7/CcR9uQC4M4uxCqU3925Jp39GD4wnBkdnsstfBWhrMkIB8SZlriVWprd
 b9lebtoTWyuMkJqkuU16E14l0fl7rSL777mo95KVGQVdFjRJGwMpsimel4UcP3ubCGZ0Gb9UUXy
 Qh9HB2HNRM52gDgSB0A==
X-Proofpoint-ORIG-GUID: FjNBm-hjKrIdG5L_yNOtlTi2F0xRKwx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170191
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:freedreno@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: A49CD151B4F
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 2:53=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Feb 17, 2026 at 01:59:48PM +0100, Konrad Dybcio wrote:
> > On 1/13/26 5:29 PM, Dmitry Baryshkov wrote:
> > > On Tue, Jan 13, 2026 at 04:31:15PM +0100, Konrad Dybcio wrote:
> > >> On 1/10/26 11:45 AM, Dmitry Baryshkov wrote:
> > >>> On Fri, Jan 09, 2026 at 11:50:46AM -0600, Bjorn Andersson wrote:
> > >>>> On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
> > >>>>> On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> > >>>>>> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote=
:
> > >>>>>>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> > >>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >>>>>>>>
> > >>>>>>>> To make sure the correct settings for a given DRAM configurati=
on get
> > >>>>>>>> applied, attempt to retrieve that data from SMEM (which happen=
s to be
> > >>>>>>>> what the BSP kernel does, albeit with through convoluted means=
 of the
> > >>>>>>>> bootloader altering the DT with this data).
> > >>>>>>>>
> > >>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >>>>>>>>
> > >>>>>>>> ---
> > >>>>>>>> I'm not sure about this approach - perhaps a global variable s=
toring
> > >>>>>>>> the selected config, which would then be non-const would be be=
tter?
> > >>>>>>>
> > >>>>>>> I'd prefer if const data was const, split HBB to a separate API=
.
> > >>>>>>>
> > >>>>>>
> > >>>>>> I agree, but I'd prefer to avoid a separate API for it.
> > >>>>>>
> > >>>>>> Instead I'd like to either return the struct by value (after upd=
ating
> > >>>>>> the hbb), but we then loose the ability to return errors, or by =
changing
> > >>>>>> the signature to:
> > >>>>>>
> > >>>>>> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> > >>>>>>
> > >>>>>> This costs us an additional 16 bytes in each client (as the poin=
ter is
> > >>>>>> replaced with the data), but I think it's a cleaner API.
> > >>>>>
> > >>>>> What about:
> > >>>>>
> > >>>>> const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hb=
b)
> > >>>>>
> > >>>>> I really want to keep the data as const and, as important, use it=
 as a
> > >>>>> const pointer.
> > >>>>>
> > >>>>
> > >>>> I guess the question is what are you actually trying to achive; my=
 goal
> > >>>> was to keep the base data constant, but I'm guessing that you also=
 want
> > >>>> to retain the "const" classifier in the client's context struct (e=
.g.
> > >>>> the "mdss" member in struct dpu_kms)
> > >>>>
> > >>>> If we're returning the data by value, there's no way for you to ma=
rk
> > >>>> it as "const" in the calling code's context object (as by definiti=
on you
> > >>>> shouldn't be able to change the value after initializing the objec=
t).
> > >>>
> > >>> And I, of course, misssed one star:
> > >>>
> > >>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(u32 *hbb=
)
> > >>>
> > >>> This leaks the knowledge that HBB is slightly different kind of pro=
perty
> > >>> than the rest of UBWC data.
> > >>>
> > >>>>
> > >>>> You also can't return the data by value and then track it by refer=
ence -
> > >>>> as that value lives on the stack. This has the benefit of making t=
he
> > >>>> lifecycle of that object clear (it lives in each client) - but per=
haps
> > >>>> not a goal of ours...
> > >>>>
> > >>>> How come the ubwc config is const but the hbb isn't?
> > >>>>
> > >>>>
> > >>>> If we want both the per-target data to remain const and data in th=
e
> > >>>> client's context to be carrying the const qualifier, the one solut=
ion I
> > >>>> can see is:
> > >>>>
> > >>>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> > >>>> {
> > >>>>         const struct qcom_ubwc_cfg_data *data;
> > >>>>         static struct qcom_ubwc_cfg_data cfg;
> > >>>>         int hbb;
> > >>>>
> > >>>>         ...
> > >>>>
> > >>>>         data =3D of_machine_get_match_data(qcom_ubwc_configs);
> > >>>>         ...
> > >>>>
> > >>>>         hbb =3D qcom_smem_dram_get_hbb();
> > >>>>  ...
> > >>>>
> > >>>>         cfg =3D *data;
> > >>>>         cfg.highest_bank_bit =3D hbb;
> > >>>>
> > >>>>         return &cfg;
> > >>>> }
> > >>>>
> > >>>> But we'd need to deal with the race in cfg assignment...
> > >>>
> > >>> static struct qcom_ubwc_cfg_data *cfg;
> > >>> static DEFINE_MUTEX(cfg_mutex);
> > >>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> > >>> {
> > >>>         const struct qcom_ubwc_cfg_data *data;
> > >>>         int hbb;
> > >>>
> > >>>   guard(mutex)(&cfg_mutex);
> > >>>
> > >>>   if (cfg)
> > >>>           return cfg;
> > >>>
> > >>>         data =3D of_machine_get_match_data(qcom_ubwc_configs);
> > >>>   if (!data)
> > >>>           return ERR_PTR(-ENOMEM);
> > >>>
> > >>>         hbb =3D qcom_smem_dram_get_hbb();
> > >>>   if (hbb =3D -ENODATA)
> > >>>           hbb =3D 15; /* I think it was default */
> > >>>   else if (hbb < 0)
> > >>>           return ERR_PTR(hbb);
> > >>>
> > >>>         cfg =3D kmemdup(data, sizeof(*data), GFP_KERNEL);
> > >>>   if (!cfg)
> > >>>           return ERR_PTR(-ENOMEM);
> > >>>
> > >>>         cfg->highest_bank_bit =3D hbb;
> > >>>
> > >>>   return cfg;
> > >>> }
> > >>>
> > >>> This potentially leaks sizeof(*data) memory if the module gets remo=
ved.
> > >>> Granted that all users also use qcom_ubwc_config_get_data() symbol,=
 it
> > >>> should be safe to kfree(cfg) on module removal.
> > >>
> > >> I really don't understand why you'd want a separate API for hbb, if
> > >> hbb is already available from the larger struct *and* if a driver ne=
eds
> > >> to know about the value of hbb, it really needs to know about all th=
e
> > >> other values as well
> > >
> > > Please take another look, qcom_ubwc_config_get_data() is the only pub=
lic
> > > API, qcom_smem_dram_get_hbb() is an internal API.
> > >
> > > My goal is to keep having UBWC db which keeps const data and which wh=
ich
> > > also returns a const pointer.
> >
> > Right
> >
> > So if I understand correctly, this is almost exactly what I originally =
had
> > in mind in the under-"---" message (modulo having a static global ptr v=
s full
> > struct instance) but I failed to express that I wanted to keep returnin=
g a
> > const pointer to the consumers
> >
> > So in the end it's
> >
> > A) int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> >
> > vs
> >
> > B) const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> >
> > I think the latter is better since we won't have to store a separate co=
py
> > of the config in each consumer driver (which the SSOT rework was largel=
y
> > sparked by), essentially removing the ability for any of these drivers =
to
> > mess with the config internally and make it out-of-sync with others aga=
in
>
> You have my vote for the latter option.

same here, B pls

BR,
-R

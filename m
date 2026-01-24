Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPZlBDwYdGmQ2AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 01:54:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B257F7BD09
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 01:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC31110EC14;
	Sat, 24 Jan 2026 00:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0PDKtu6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTb7DZM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA9C10EC12
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 00:54:15 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60O0Jbto3051867
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 00:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=ypT2ScJN5jRu324D8R3Gm5Zq8pTI726Gt53mcp0XdfE=; b=i0
 PDKtu6xakoZ4UTDxvtVoxkX8S0nFL9D0WtLVBqCHHMZlY2BsHdrxNWhezHe5apiL
 5rc+1oH0EDiR/Sl5L9CEyUeOtOOmksLw49oL7y4yAMBxn1NjDKMZ+U8YtFTJ0qiy
 Df81JDhUJoiQokaHCkQDLOEJYhDVMNCvO7QeaTvqsPPn2EdplkFxcTHJ0tcGdT/+
 2js9L1OB++qs4LVg2g2VAlKZiUZZ7sCP/qfwELh4GNa+u9OnDIhGXwGQFr2UgK3G
 8iPlPmia2jum1uc1wtVGLuRhLi/QsRpceMuIU1m1XbyW8K6SHuYWBlG7fwsroV5w
 +EP2mjdVQ22uL6SG5mEw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvkeng211-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 00:54:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2b7155ca88cso2232321eec.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:54:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769216053; cv=none;
 d=google.com; s=arc-20240605;
 b=agxksapXqb+cALKilHDwcI/MBx5dLcwcRn8ofLdfhAQF4ziORicXz4h8CvfHM5gVBz
 dXaQYtFCrezcK7nCpQFXy+ZxzzUGlfkbea1FVLTu51PxbgjoI6G6UrDJ7L9fJKemC9FW
 zWwC4RdfrXQkH+SwZU0s4f2pDFYDmHT44lXW2g6k4Zm2YrYYQ8iVnktPDAkkZG3nsSkb
 XTZduabEpunudYB48oa8xspn6+2Bd/Cvsbydq8IdLKDfT5zC4sXUSU/AqGUb6oyJam0F
 o8KrnCVTOZrvDaiHEQcJf91psWnx7lMivjPVstG0vwZ57G3vdqn4F2a3O0n4lDkZJykH
 ae8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=ypT2ScJN5jRu324D8R3Gm5Zq8pTI726Gt53mcp0XdfE=;
 fh=dBiv42m0UYpBghZGsXZJZsgXvoWzgabvEIUGh3uuhUM=;
 b=XKNmR5OVBUvlUrb3ZMHZf9MgCVSqDqwkk3oc4BttqzqNzRMBqs7hHplP+tZe8RNL+A
 InbpyBB0QcuyK6t1dOGKjKQ52tzb5/RTXcwnLF5kV5xFSdiOXa1z7gfAoq8ODDhHGTi5
 VRdIAD8kpe39tF/j9fl+fW4bmJEBohZMLLmFp4aMBPjx8cD9VFHQvrUYgtsTOjXQzPob
 ObbmAkPMCtwjei7AVF4ZvDnJBT/8wV/IhoWazyxZMKdc8+vdRXm6Py189rZoW5qmeU7Z
 NBZ8mFS08cyU8gJ3R+LTjCKuIlKhdiqvIgccxHVcfSRaTXlJQXkRZ0SZKFdmyrOhjFAQ
 33/Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769216053; x=1769820853;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ypT2ScJN5jRu324D8R3Gm5Zq8pTI726Gt53mcp0XdfE=;
 b=BTb7DZM/Ol3FsVScI5uyvkQa23T7+8i64BtxWT7Rb45Sem0/ZYHiyLd5V/iqw2gTYt
 jI/CtjSyJGEwSoSoEBS7ralvT9fAx1GQFiacQc8if7g4I5LS8c7XBTI0JUW73nCtx4t5
 SIPvpg9VuAtkBSUl2F3jId6eopwTxFoXWMbg2vgLLE7Tqx9KGbKPQzbptXZG9GZqHcMF
 mUxH87Ly/vgtJ6H0V5cFBWF/ZQ5oxYNhgM5zpOyRheJJ+6dg1G5PCGgGVQc5byWXD1R/
 rfhPX9pfAHWwGj7niTRNQ2Vd35DGGUsMvEt3xxSOnZXxqFtbu4Z3aYlEvf7xLXpBoq6X
 qnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769216053; x=1769820853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ypT2ScJN5jRu324D8R3Gm5Zq8pTI726Gt53mcp0XdfE=;
 b=GGTcG0JrmwITPEZ/hO3KMLINk+NMq+8LzYkbGqCBbPkAriDK/k1dnudOfgLT8dhb1G
 CKA61Jq69rdPYC4owiXl2dJH624YuFiEiMEt2CfKUfSm0NvZ7EgIUpqk089ET25fCEql
 nNBVQRMPqDaZVZoFaatMilH4Ouo1L6az7me84uyojozfgylmSVMRD6s6ify9XGwcwU2/
 7+7PgugJrEM/tnUb9WrgvgSRg6iyNEklN2W7dI42Aymz1Zq1RRb+L5zKY7ZSJCsJweHI
 +2xvK3+4o9M8JxagnTdOQO0L9OxMpPE45anoWYxf/WSTUT+ri2iufVeEEZXReS+7/+fV
 holQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0T6l8Xpuab8k8UZGgXiiAHwW0S9LdmsE8usmJVVj3ZoDKZFfwDqX/umlbm/vu+zYck2GseSrU2gM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVpj6XI+VAGSYJIH7FeDSb4t+dGbPNxXuo4jSjA2g99N94jVz/
 PlbBOAFqLKon0Im6xqup7w2/56dmq3pRUOQQQVMkFkUU2ryXQqTeIs4dlGuGPn6bbOPEAryEJq8
 riFz+tXU3wqLBuw04P5RPgdJmcQ49ssNV8l8vGubw46STkBtbyHiH3o31CiW8ZE8Ehm+63N2q9q
 8CsozQfS3OKRFCM32AQpMHg1/PAhJew+GuYTBVTLx3is+OQA==
X-Gm-Gg: AZuq6aKQcqrhoXUTe12y5W+Qy8BV8uzIwIdoS+W1MJYmFUgHSMyDOVPCovjCJ2PdNrE
 FH+C/Q3LTuNH5hSyusGMPumhhxUCyevEgDcNDS8E2VYIXfVGml7Lkx2lZhWubOgjCCnlinF4o/p
 v3FwH7gAk3Ydq6m70hLRCIP3siSRU6hTk8kDsFqabypUhRC7pV6GogktJY0tNL3pVqIwFia5qXa
 ybinHhkk1yz06/8LctTQQ9zxQ==
X-Received: by 2002:a05:7022:660a:b0:11b:9386:a38c with SMTP id
 a92af1059eb24-1247dc1d3c2mr2254068c88.47.1769216053124; 
 Fri, 23 Jan 2026 16:54:13 -0800 (PST)
X-Received: by 2002:a05:7022:660a:b0:11b:9386:a38c with SMTP id
 a92af1059eb24-1247dc1d3c2mr2254058c88.47.1769216052652; Fri, 23 Jan 2026
 16:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20251221164552.19990-1-johan@kernel.org>
 <aWdaLF_A5fghNZhN@hovoldconsulting.com>
 <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
 <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
 <aXHwrnMS2aj_PYRj@hovoldconsulting.com>
 <CACSVV00vk95aYZPrVThoAnHzBUsCHXxnSoEHJNaoLdyJJBOZzw@mail.gmail.com>
 <gofqva7heojs5d7hi2naihqlpkfttjocdazdg4yjqrkeqew5tw@bp57c7rvycpa>
In-Reply-To: <gofqva7heojs5d7hi2naihqlpkfttjocdazdg4yjqrkeqew5tw@bp57c7rvycpa>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 16:53:59 -0800
X-Gm-Features: AZwV_QjZSDbfsgVXlqFUWImTwV-kCK27tq9V8fSTEX_IRAyz8vlv3X-k5-2yZDg
Message-ID: <CACSVV00_FbOuihnFYwda8xxEdtaBEDZ75dtSBPg9oOXTzzR6gg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Johan Hovold <johan@kernel.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=S+zUAYsP c=1 sm=1 tr=0 ts=69741836 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=51pYYRa9bS4eTvwAioYA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 88ReLPQLT7WTZkZHAup7oxBhfEhgNrOq
X-Proofpoint-ORIG-GUID: 88ReLPQLT7WTZkZHAup7oxBhfEhgNrOq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDAwNCBTYWx0ZWRfXyV4raLm08BV1
 uBDmUce1QRsxdB2oiDIYTTiSOa5ijL6V2/LkfNs0Gq64ZsaZoSVn7jVnZigrOLUUKHX9J/vC0y5
 1BvYacE6OuZs98Uhnc/5mtB1lBeIGt95dBjh8o+TuEjNvzpgLSkUqiic1Wc6GKGTmgHn4kxQYwj
 djicFo11n2NZXCg/ghgKL34FFc1Z0hluPU1ijT/y6zZ/T68AwpzpULoect69WDFFKAjH5Oh2v/g
 CgwGUL3Un+Qh5h52/ZpBZnp9Iixc5IDrqpD3PLMdCy4nwqIcTVfi2ZjB/Yv8LWz+oTiaDfQApA3
 FupeHJOZawPv61HXUjBuP2mZe/tTZGJ0vxbP5S4Z9UA0N9jyiK4TxkPYn06/OOtyAdik+hJluTX
 xkrhGBJNzeWt2lAUvw4yyR52O1+h/MYq/FJmukBiilHKDqYeuyDF7k2g+AUTCknHo2ZEQ5/E8J4
 Ii/nRccfTF4++3IFwbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240004
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:johan@kernel.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,poorly.run,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: B257F7BD09
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:01=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Jan 22, 2026 at 06:48:58AM -0800, Rob Clark wrote:
> > On Thu, Jan 22, 2026 at 1:41=E2=80=AFAM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > [ +CC: Dave and Simona ]
> > >
> > > On Wed, Jan 21, 2026 at 08:59:51AM -0800, Rob Clark wrote:
> > > > On Wed, Jan 21, 2026 at 7:17=E2=80=AFAM Johan Hovold <johan@kernel.=
org> wrote:
> > > > >
> > > > > On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> > > > > > On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > > > > > > The hw clock gating register sequence consists of register va=
lue pairs
> > > > > > > that are written to the GPU during initialisation.
> > > > > > >
> > > > > > > The a690 hwcg sequence has two GMU registers in it that used =
to amount
> > > > > > > to random writes in the GPU mapping, but since commit 188db3d=
7fe66
> > > > > > > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a =
fault as
> > > > > > > the updated offsets now lie outside the mapping. This in turn=
 breaks
> > > > > > > boot of machines like the Lenovo ThinkPad X13s.
> > > > > > >
> > > > > > > Note that the updates of these GMU registers is already taken=
 care of
> > > > > > > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CG=
C
> > > > > > > properties on a6xx too"), but for some reason these two entri=
es were
> > > > > > > left in the table.
> > > > > > >
> > > > > > > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support=
")
> > > > > > > Cc: stable@vger.kernel.org  # 6.5
> > > > > > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > > > > > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > > > > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > > > > ---
> > > > > >
> > > > > > This one does not seem to have been applied yet despite fixing =
a
> > > > > > critical regression in 6.19-rc1. I guess I could have highlight=
ed that
> > > > > > further by also including:
> > > > > >
> > > > > > Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets=
")
> > > > > >
> > > > > > I realise some delays are expected around Christmas, but can yo=
u please
> > > > > > try to get this fix to Linus now that everyone should be back a=
gain?
> > > > >
> > > > > I haven't received any reply so was going to send another reminde=
r, but
> > > > > I noticed now that this patch was merged to the msm-next branch l=
ast
> > > > > week.
> > > > >
> > > > > Since it fixes a regression in 6.19-rc1 it needs to go to Linus t=
his
> > > > > cycle and I would have assumed it should have be merged to msm-fi=
xes.
> > > > >
> > > > > (MSM) DRM works in mysterious ways, so can someone please confirm=
 that
> > > > > this regression fix is heading into mainline for 6.19-final?
> > > >
> > > > Sorry, mesa 26.0 branchpoint this week so I've not had much time fo=
r
> > > > kernel for last few weeks and didn't have time for a 2nd msm-fixes =
PR.
> > > > But with fixes/cc tags it should be picked into 6.19.y
> > >
> > > I'm afraid that's not good enough as this is a *regression* breaking =
the
> > > display completely on machines like the X13s.
> > >
> > > Regression fixes should go to mainline this cycle since we don't
> > > knowingly break users' setups (and force them to debug/bisect when th=
ey
> > > update to 6.19 while the fix has been available since before Christma=
s).
> > >
> > > Can't you just send a PR with this single fix? Otherwise, perhaps Dav=
e
> > > or Simona can pick up the fix directly?
> >
> > Maybe someone can cherry-pick to drm-misc-fixes?
>
> I know that there is some process for cherry-picking into
> drm-misc-fixes, but I think the end result was frowned upon. Neil?

I'll send a pull request with the cherry-pick

BR,
-R

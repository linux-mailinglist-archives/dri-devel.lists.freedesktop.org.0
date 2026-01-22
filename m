Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEFIKOw4cmmadwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:49:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FD1681F1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E0F10E9D2;
	Thu, 22 Jan 2026 14:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ut1IfzMd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TUo3wgDC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6DE10E9C9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 14:49:12 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60M7teCm2276572
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 14:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=4ByJBYSv8dzNIIUkvQF5Zr5fcQD23vQS1U1kIJNce+Y=; b=Ut
 1IfzMdvR8WqnLjFGEe91Ra1O6lHEaaAyFCgtuHq5UTCqcigk/TqXGdR47MZQt+Vc
 IhZl7T0Jgledm1PLOM4Nt0gw4NveJh5QCnuGd3IPv3x/EWBBN7NHXe2qy8XdyJOG
 1RLd9fjE5hOjGpfJif27MdaywDAZCXgYAT/KCH2kHWd4taEfCvNwZevtPHGWznHz
 LjPF6iiDGyQeb0ZEVyOvUpIxs34Mpge5JUS6x4TknR3Qs15k8pBAZgDIqYKxPvuE
 t4W/f14VmHYx5NR7+X3YPPdLoEJ03nCqfo7rviS1+jLLC9AqtBvUWenVhFOuTNjN
 22lgkZwgVIPKOoBXY0yg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fatp8f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 14:49:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1232dd9a256so1606858c88.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 06:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769093351; cv=none;
 d=google.com; s=arc-20240605;
 b=lOfmo5o+wTUZz0MmS+Q4AKm752ywEikOyBO47DSgaP6RIKWmwa+8am3AKXWWTnOBkT
 b4W+DP3SFgYwiwz5xPDSDhvrbEO1msgJEXxH9kBvwojj9OmBkkFXFVdoE11f1U6P1+hk
 r+wz9iytWTxTzY4hLrlGp587KvdOeHWWRXQ5M2vK2Culs4VhooSdpyhs3GFQhUxxRMIo
 E1+wc4GU5ZbZAqMkUMsz/TT4T0mTdcn0ZekSkjBVEI7/Z1DlMvZ7yv8TJgqbft//KSHO
 5Knc6WdlSflrykmIVyKI2PHVYPin/D0jzn7sAK0Ypg/ZMtQrnuEtZ6dX8o08UExxXu1z
 9R8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=4ByJBYSv8dzNIIUkvQF5Zr5fcQD23vQS1U1kIJNce+Y=;
 fh=5OLkSnU4HCT84nSqFdkZd9Ga5G3TZtmaJ/XKeBfM8Vk=;
 b=JF6cJ6sO7ROJlo9mJnruBU/BOKvu+1SgCMn2HjjPnaGlcJUel5yxr6Vx3+go9hLY1+
 Eqydt7RxS29JP/enY5jhYnsLqyBFXP2AQS5R8Bf1cOEyhpEUO8DKU2G71BqkNz1N3fSI
 YQwNWXj+UbobYA/qeTWNmtCb3faQCZway3dTT/FQvqD2yAqwGENQB5+xuGdu9TRkMJcG
 YqWQjQmFgfSBe4vTNlvtsZEtClcMkd2i4P4fO72QRdJBXdGLLBvhR44e6Pum3lqoQkiF
 iW/Jh4U2rq3Xwvvl6UKpF7ey2crB5PTQtjyVbPfSu8Q1I0WDBDXQrwHpSEVAIx5EAPfE
 sZjw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769093351; x=1769698151;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4ByJBYSv8dzNIIUkvQF5Zr5fcQD23vQS1U1kIJNce+Y=;
 b=TUo3wgDCK5k7xQYApGahkD4szjKeVvuQgMvy4iGGtaeeCuBpX+RZIro47F9/h0EZAs
 gxrmT/dfCdJe0CeWzr9LHwXOu5aFPmCS7uZ8oHjx32J3n6Rxh6FgA8Un6dI+omgOi5Hj
 I3tg62557SNXvweAvtAUshbRAs53GhCf3j6zdU2inv8HWcOeetF6kx6jzK8zs7Ivxe2R
 iWBthuareoVqYpdwghKXhkpwqhrsmPIabDYynbAotdLW6RcQY2mipyezO7d02GBzm0ja
 /p/t8/ax57X7fNHVd73T4fRCNQHMCH2MmsU6pHVgeYNfIRU1uPvcOFBbK94x69HJjZm+
 IAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769093351; x=1769698151;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ByJBYSv8dzNIIUkvQF5Zr5fcQD23vQS1U1kIJNce+Y=;
 b=E88gEymkjhyQICVYf4Jy+gx104jgfjQUh1r77ludom/WoFVWrve3bdPAjfjsswJxiP
 UgLwZOR/+8VKKQCUfK6HM2fo1jprISTCMivc/GRbIxkWMdo72J/bcEwXJRWjgnA6TG6w
 SJLvF+spUBhcdj3cCkmAypVTb4T5FLOsdZNnc9qnr7D4zL+G2KN4Iuw6CLwkYUvN8Drr
 MLxzCsDgqm4U2SVPjkLVcGFjeupXZgXxGDpIbavSSGWmDifYIWkfxp3f3/DakWUZ0CWM
 9CXCV1qhWODgll4Rnd34yyS+jhCD+yX3x7W2gVbvujMjyIqLS21dxrGGrdAPw/RVjGvI
 Bh7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7gzZpLLhOzogF3ROGYYrslM+Lz2Gw81AaaBGyKG4Dy5TimbDHJ2I0FxLu5FcYp94ZoskA/Mn9zNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9bcoqVdEsK4BQr012PYiUhEb5jq5dUGYZuDc2Xg1edBs/M379
 I+djIAKEWDIpMpO2dlucKDWsV55JGhGwmGiJXkCZalcUgC0VU9WHJ9v9B2G9yh4t7TO7oqW7SSW
 X40iQVgpoXhvIZZ7KonmaeiQ7X3xWWBw/Q3435AvX+UZzYl/uNx96lW0xfRQmKx84x5WNCIaJl6
 hbwOwlVEzVIC83fgmPysqb0xjSDUOTH2oNbYdlJg2oGhMX+yEqKHv0tA==
X-Gm-Gg: AZuq6aIV9Aw1rGx9WZJ3MFuhTYdof+3LbKsmn1OGZpppWPxOnjo1OVS2bG2aw8UhZZN
 14Jn6PtxKHmZjaZ2REOSizUnTrsAd0Aod8ywmv0gFvc9+dKjFL/8TmIlA9+flgNe0RD7BEbb2xP
 k9r3KA4pF6V247CPdKYP0aM/d1PECYnhmjt4FEQbG4DY0WRUKC5/1FWCQN+yPBa7tUuZoJsFMeU
 HHvGBe2jpSrNdKgHZ98qnftEw==
X-Received: by 2002:a05:7022:e1e:b0:121:d898:edae with SMTP id
 a92af1059eb24-12476b20423mr2297852c88.24.1769093350567; 
 Thu, 22 Jan 2026 06:49:10 -0800 (PST)
X-Received: by 2002:a05:7022:e1e:b0:121:d898:edae with SMTP id
 a92af1059eb24-12476b20423mr2297823c88.24.1769093350042; Thu, 22 Jan 2026
 06:49:10 -0800 (PST)
MIME-Version: 1.0
References: <20251221164552.19990-1-johan@kernel.org>
 <aWdaLF_A5fghNZhN@hovoldconsulting.com>
 <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
 <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
 <aXHwrnMS2aj_PYRj@hovoldconsulting.com>
In-Reply-To: <aXHwrnMS2aj_PYRj@hovoldconsulting.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 06:48:58 -0800
X-Gm-Features: AZwV_QjkYdq6c3XPgpYIaf_pN0lJpl-wNv-t9mB4a402BGd58WCopYg5GIRuDVY
Message-ID: <CACSVV00vk95aYZPrVThoAnHzBUsCHXxnSoEHJNaoLdyJJBOZzw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
To: Johan Hovold <johan@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=697238e7 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=V1jUQ0fd79-Hst1t40gA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExMiBTYWx0ZWRfX+jxAmcvG8YgP
 pX3QVIOHC8l4xNYvjNRV/+yYiUF3gsIeqo02I6LDsGhqBbYAixSK4+MtF44xFQZTeHYoM0A79eb
 yQ8VjcVi31xYFRWo6/Fu7CT1nCS5Ztf1pLLZJFSXUcQP07Dw97lS8vKRQnv9cJQy/aylA9xZfQ1
 tqcOSsvE02CwGR59AuOCSNtglZk9wEo89KdzO0fkBpWEo7KFfDThoo+uVdUARPfJiIqIQPYEgfC
 Y1kTijcdPnC7xYF4vjZg8Tv9Yg7m9lcWSRK0CSSybD/6VyPJbax0OiAfDNTFKKerz/Hr4rD1mde
 a/A59kYeCPAH2XiaHOGMzWKqyGUwtjQ0w5ik2EW0Le5trC3HBtbniDBFRr8+SokxDBXG/95f8eS
 1fm7/EU+F0a70losXKrQn1mhD8tDFqJBspqIhLCSPXHgzWr4V6hjbbDfl3enEvKt7zqfwLpTYZF
 NyT2UY2lPnGBSv+LpdA==
X-Proofpoint-ORIG-GUID: YtcBUM0fQNA3ecBQw7LrK1BoOtypis75
X-Proofpoint-GUID: YtcBUM0fQNA3ecBQw7LrK1BoOtypis75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220112
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: E8FD1681F1
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 1:41=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> [ +CC: Dave and Simona ]
>
> On Wed, Jan 21, 2026 at 08:59:51AM -0800, Rob Clark wrote:
> > On Wed, Jan 21, 2026 at 7:17=E2=80=AFAM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> > > > On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > > > > The hw clock gating register sequence consists of register value =
pairs
> > > > > that are written to the GPU during initialisation.
> > > > >
> > > > > The a690 hwcg sequence has two GMU registers in it that used to a=
mount
> > > > > to random writes in the GPU mapping, but since commit 188db3d7fe6=
6
> > > > > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a faul=
t as
> > > > > the updated offsets now lie outside the mapping. This in turn bre=
aks
> > > > > boot of machines like the Lenovo ThinkPad X13s.
> > > > >
> > > > > Note that the updates of these GMU registers is already taken car=
e of
> > > > > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> > > > > properties on a6xx too"), but for some reason these two entries w=
ere
> > > > > left in the table.
> > > > >
> > > > > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> > > > > Cc: stable@vger.kernel.org  # 6.5
> > > > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > > > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > > ---
> > > >
> > > > This one does not seem to have been applied yet despite fixing a
> > > > critical regression in 6.19-rc1. I guess I could have highlighted t=
hat
> > > > further by also including:
> > > >
> > > > Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets")
> > > >
> > > > I realise some delays are expected around Christmas, but can you pl=
ease
> > > > try to get this fix to Linus now that everyone should be back again=
?
> > >
> > > I haven't received any reply so was going to send another reminder, b=
ut
> > > I noticed now that this patch was merged to the msm-next branch last
> > > week.
> > >
> > > Since it fixes a regression in 6.19-rc1 it needs to go to Linus this
> > > cycle and I would have assumed it should have be merged to msm-fixes.
> > >
> > > (MSM) DRM works in mysterious ways, so can someone please confirm tha=
t
> > > this regression fix is heading into mainline for 6.19-final?
> >
> > Sorry, mesa 26.0 branchpoint this week so I've not had much time for
> > kernel for last few weeks and didn't have time for a 2nd msm-fixes PR.
> > But with fixes/cc tags it should be picked into 6.19.y
>
> I'm afraid that's not good enough as this is a *regression* breaking the
> display completely on machines like the X13s.
>
> Regression fixes should go to mainline this cycle since we don't
> knowingly break users' setups (and force them to debug/bisect when they
> update to 6.19 while the fix has been available since before Christmas).
>
> Can't you just send a PR with this single fix? Otherwise, perhaps Dave
> or Simona can pick up the fix directly?

Maybe someone can cherry-pick to drm-misc-fixes?

BR,
-R

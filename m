Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFv2CBLbe2noIwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 23:11:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB9AB5322
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 23:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD0110E8D1;
	Thu, 29 Jan 2026 22:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7YNnzb7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ez2BWmuA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3523B10E8D3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 22:11:25 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60TH3crX027607
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 22:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=c48bU2/UQ6SHwzlMM7sKOP+HHv2vwIN/zOT3Q7WnU+o=; b=O7
 YNnzb7Iw8mCyhHM5qVAJXeL+wczijyw9mixwaVP5AhZcm3dagoN/ayjVgpS+FvZx
 FBUEiekrLvdFSHoZQCJ8pooi1JBsXP3G+uKbe7gKLx/x/0bCll6Sh4RpJpaPSHKm
 EUsDuWgNUqPjUQ5XJvHmlmMwwuUgWiHOYx4TMe6MkNPBL4yJvIER9O0ipQY5Fp3T
 SX32d0h3qveq3ZEicyjBIBPWwYoOdrUp2dlsjbeod85msH76pXWZVr32lDUa4AYh
 1aVI+gclniXVXQ16ebQta1pzSrolE/fnWIdbfGzmT2kXvOrZNLulF1emI2cVX9HA
 3stMNu+tbDAUzSIuRSQA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bm58wh5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 22:11:24 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-45ca4a13da3so4191601b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 14:11:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769724684; cv=none;
 d=google.com; s=arc-20240605;
 b=e+D/5KIH/SQntkcu87p55zfXUC5lZlqFP7GVg0m4jom3QdPpLYO1+dNtuclX1aiBJY
 NFjMSk+hqsDPz4rgiZ9VLBSgQmUzYhUBkQlnQG/o4GMeGdSj1Vr0IbQT4Z3FjS0o2FTu
 S1lP1yMXDJFe0P9uMbFN8HvdZMjo+3LheXkXSXBD7nUU7bz6LVv5gsF3ulT07mQkj5yV
 o7PzHD+xBR5kKlErVD7KLVqG2TCvU07XhdxIT/7WvNbScxDXbaprQxC0M5upqvE70Z34
 m13hvNVWCtiAdJrO4oEsAejjz+n2N+xtpD+HbkqtmipjmKEVze5vBokWdVWPbL/nC6/H
 CjGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=c48bU2/UQ6SHwzlMM7sKOP+HHv2vwIN/zOT3Q7WnU+o=;
 fh=drOo4DEFOWHVPBf+NJlJUBmGe1YvTfqdVzAtEE5iexc=;
 b=f7xjaVPMxrdNTDXYEYJyFOu61lSAEcxQSjy78LpxYCRRe3A8PUAOQQRZqJm+8hyDo6
 5FJh+Os7n//ymG2F2cSgWl8z9v6E1EbaJ4oNTylqUJ7Y+bSMQ8eznztqo4oHfZvZOGuU
 0mwPCGUee6OOkLiwF4lghn9ucrGF+tpHrwyM4GHQugJcE++5oH7tOjnx8a0hsBr/3gb4
 d/8/OEGrOvmO6Nw2gIL5Ci8hPavTtlolac3rGKxE6HX4b4bYcEzGycomnOxGw088RoAF
 OMQ4SH2nwtsCEP/GbcmPkYK4hWS/wTiiXmmaTLfIheGICs2JFPsB8j97m4CgtoyU4E3k
 9eKQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769724684; x=1770329484;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=c48bU2/UQ6SHwzlMM7sKOP+HHv2vwIN/zOT3Q7WnU+o=;
 b=Ez2BWmuAeFv8sNqGI5Z7O7CHIXzPqPO2rcsqYwQhpRr1Oeshn3Y8tKftkdV1IuzhWn
 M5H+nlWiy5T6fzP3zN2TNUm8E1USmrTemNJ/SYpqZmh3thJMcq0bzM/UH2FXfJMg0yyy
 Db9mooCTjfeQGBa2xcKTmT+CW9efLFrkcBm/Y6FAwblo3alNeDgMFEOoXaCP0NuJUyHG
 xt9phfSk/9izSy79jDk5TwcCW/skqjOkdJYsxahQmxlsUq63ZaIR0NeVVQFUYwozO6MN
 lNC/8DSZ5oPGZUUlPZPotHqaz87zY6wWXTX3QaoLC0qo/qLqKSFK1AVI9DlmZqFYXtwZ
 JHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769724684; x=1770329484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c48bU2/UQ6SHwzlMM7sKOP+HHv2vwIN/zOT3Q7WnU+o=;
 b=KLfF1lGH0SzJ8A8dHO2E2dLf9RrHqN4AG/9Q1EOb9oQ61usBabr1YsBsiK3Ch5+sxW
 rGkmReTX8G5nDMkpmerrOCttFd+ObcexJ+fqxSKISImkSgXYOLhJf0EJp0m/VF6NmGsI
 j6bqy26TjIxaPR0bsO27oUPAFI7GBSI0/1EYyhHZiVwKr0KMYZlSBHLo54J/8hMAbDnT
 rVHkCtX70w7ldUTYrS0h1Cv7qISpnc4L9kOiixEw86Swoqpco6Cmfvg/Zt64Yi9G5AKW
 32wkiO1wiXsVeWpdZ/vPz53jaiKCF6uL5q/yQIv3Ozm/TzVD9sJV6sNk9AHqgqQgNPYf
 P5Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm2iFBkuSvgXaXIu7ZQTExO44RfJbw22KTIRO9IZg+xURC6QbPD48Vyr0qG375o5QaPWtouiQT2ME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIJzzJq664G9PDBnvX3lry6zoZJzkWJlQa4CM+61NHAaZcgKI4
 qEMpgBEcPpe5rCWmjjn6+c8mIdu2Qsj5ECVCC5oH8xuQ7AUvi/adCquAGs8/TzGSJMhHWmhUFmm
 cVSraOvxRTwSel+YvnsPViKwVrXqcKnNfrW8xyNnFVKDojGBcu48XR3bwx7nwbwh5hRtAn1oqb5
 YobqVRvJRGNPWQ49UemzQ1nF1HbZuLPMW5xX3YINQ5GpoMFw==
X-Gm-Gg: AZuq6aIbLqSH70OIjqq/MxMf1MupQd9fg6uIJjPmZTJNvVl5M0o78VLkyD4Mm9v6hEb
 uwilJ1pQevCJOZe++A6npuR94391bOuJ9rvYNsIZUz6XeX4OTOitMjbpVErKjarjhhRhGcg96c7
 De2lgX1LoGgZp1VBLlAqKFxajLcwGCjOqej2JK+otPMFFUXK262sFECFoMLBPOFTOYzQQqccgCf
 TXRedpYUVtsaAVusyjKZDMBCA==
X-Received: by 2002:a05:6808:4fd1:b0:45f:48a:ac1b with SMTP id
 5614622812f47-45f34bb27a1mr665734b6e.20.1769724683743; 
 Thu, 29 Jan 2026 14:11:23 -0800 (PST)
X-Received: by 2002:a05:6808:4fd1:b0:45f:48a:ac1b with SMTP id
 5614622812f47-45f34bb27a1mr665726b6e.20.1769724683294; Thu, 29 Jan 2026
 14:11:23 -0800 (PST)
MIME-Version: 1.0
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
 <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
 <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
In-Reply-To: <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 14:11:12 -0800
X-Gm-Features: AZwV_QgPcy7-OJRCAtUNZO1W2C-9P0rec9RL3k1GibIqwml-6lltb9plG3LOTx0
Message-ID: <CACSVV02ArZQYW0D66wCzcLoegAB+vUODDxfX4Vbt3xpBajRKYg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping userspace-allocated
 buffers
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: YDYmvXruOQkhqOd7IhJJUwpGXpQ3sF6r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDE2MiBTYWx0ZWRfX3NQEvg4Rtiw8
 6fSnR2I4tBv/idpmCPjWv1r5dYlOAQuu1PNuSXWYOXCyx6ll6QCFLsGqdsfKsRiQ6SnJBjk/05G
 Y8LD67ayW7KstAq/dRFk4Z5ToN8dB8Vk9IpmNsIh/+MaGnOYg9TkQyHWsbhLjSYVC6fUz8+KaDt
 IZG6sWAF5wgMBU6qL9WVmJm1Uqf8kd1SvYZQq52kgqxt5nKFd6GQ4ZgmfBBI6TYnkeCTpIdTYmC
 +RMZGRr9SOtQqrgBE2jsP+a14HLOK+SEzlgGH8tT6ji3tkWkBqn2AbTknOz4mbiFIBWbsi9HINO
 waCcD0At1eILAfGBlapKz9nOfRtdpaXpVrVR15ZNIlmgRcgR3rfKUlkD/DAK/yrTuj2DH+2Ps98
 9+AhjcAAjX+8D9MCdRbhE9+dTJMkpfUzlgBYX6TdD7yOC12r6praJzzUdeD0nwkc5mOpChgUnrL
 4mnfJxyn3vA5eIqbssQ==
X-Proofpoint-GUID: YDYmvXruOQkhqOd7IhJJUwpGXpQ3sF6r
X-Authority-Analysis: v=2.4 cv=bZNmkePB c=1 sm=1 tr=0 ts=697bdb0c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Luqqhlx33GSuvbvJmHQA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290162
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 7EB9AB5322
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 2:39=E2=80=AFAM Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 1/6/2026 8:21 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 30, 2025 at 04:32:25PM +0530, Ekansh Gupta wrote:
> >> Currently, FastRPC only supports mapping buffers allocated by the
> >> kernel. This limits flexibility for applications that allocate memory
> >> in userspace using rpcmem or DMABUF and need to share it with the DSP.
> > Hmm, for DMABUF we need _import_ support rather than support for mappin=
g
> > of userspace-allocated buffers.
> >
> >> Add support for mapping and unmapping userspace-allocated buffers to
> >> the DSP through SMMU. This includes handling map requests for rpcmem
> >> and DMABUF-backed memory and providing corresponding unmap
> >> functionality.
> > For me this definitely looks like a step back. For drm/accel we are
> > going to have GEM-managed buffers only. Why do we need to handle
> > userspace-allocated buffers here?
> That's correct, GEM-PRIME will handle it properly. Here, the reason to ad=
d this
> change is to enable routing of DSP logs to HLOS which is done by using a =
shared
> buffer between userspace process and DSP PD. The buffer can be allocated =
from
> both fastrpc driver's DMA-BUF or DMABUF heap(eg. system heap).
>
> So this shared buffer is getting mapped to both process's IOMMU device an=
d DSP PD
> with this change.

So, a mmap'd dma-buf is not necessarily pinned.  Or even backed with
pages.  So you wouldn't want to try to map a userspace vaddr from a
dma-buf to the device.

But looking at the patch, this looks more like mapping an imported
dmabuf?  Presumably going thru dma_buf_map_attachment() somewhere in
the existing fastrpc code?

BR,
-R

> >
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++----=
-
> >>  1 file changed, 86 insertions(+), 11 deletions(-)
> >>
> >> @@ -1989,25 +2020,69 @@ static int fastrpc_req_buf_alloc(struct fastrp=
c_user *fl,
> >>      return err;
> >>  }
> >>
> >> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *arg=
p)
> >> +static int fastrpc_req_map_create(struct fastrpc_user *fl,
> >> +                              struct fastrpc_req_mmap req,
> >> +                              char __user *argp)
> >>  {
> >> -    struct fastrpc_req_mmap req;
> >> +    struct fastrpc_map *map =3D NULL;
> >> +    struct device *dev =3D fl->sctx->dev;
> >> +    u64 raddr =3D 0;
> >>      int err;
> >>
> >> -    if (copy_from_user(&req, argp, sizeof(req)))
> >> -            return -EFAULT;
> >> +    err =3D fastrpc_map_create(fl, req.fd, req.size, 0, &map);
> >> +    if (err) {
> >> +            dev_err(dev, "failed to map buffer, fd =3D %d\n", req.fd)=
;
> >> +            return err;
> >> +    }
> >> +
> >> +    err =3D fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
> >> +                              req.vaddrin, &raddr);
> >> +    if (err)
> >> +            goto err_invoke;
> >>
> >> -    if (req.flags !=3D ADSP_MMAP_ADD_PAGES && req.flags !=3D ADSP_MMA=
P_REMOTE_HEAP_ADDR) {
> >> -            dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.f=
lags);
> >> +    /* update the buffer to be able to deallocate the memory on the D=
SP */
> >> +    map->raddr =3D (u64)raddr;
> > Which type are you converting? And why?
> I'll drop this.
> >
> >>
> >> -            return -EINVAL;
> >> +    /* let the client know the address to use */
> >> +    req.vaddrout =3D raddr;
> >> +    dev_dbg(dev, "mmap OK: raddr=3D%p [len=3D0x%08llx]\n",
> >> +            (void *)(unsigned long)map->raddr, map->size);
> >> +
> >> +    if (copy_to_user(argp, &req, sizeof(req))) {
> >> +            err =3D -EFAULT;
> >> +            goto err_copy;
> >>      }
> >>
> >> -    err =3D fastrpc_req_buf_alloc(fl, req, argp);
> >> +    return 0;
> >> +err_copy:
> >> +    fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
> >> +err_invoke:
> >> +    fastrpc_map_put(map);
> >>
> >>      return err;
> >>  }
> >>
> >> +static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *arg=
p)
> >> +{
> >> +    struct fastrpc_req_mmap req;
> >> +    int err;
> >> +
> >> +    if (copy_from_user(&req, argp, sizeof(req)))
> >> +            return -EFAULT;
> >> +
> >> +    if ((req.flags =3D=3D ADSP_MMAP_ADD_PAGES ||
> >> +         req.flags =3D=3D ADSP_MMAP_REMOTE_HEAP_ADDR)) {
> > Side note: why are these flags not defined in the uABI header?
> Ack. These should be part of uABI. I'll create a separate patch for this.
> >
> >> +            err =3D fastrpc_req_buf_alloc(fl, req, argp);
> >> +            if (err)
> >> +                    return err;
>

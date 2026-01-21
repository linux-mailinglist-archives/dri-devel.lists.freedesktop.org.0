Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCfUJmcKcWmPcQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 18:18:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9325A6BC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 18:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B3910E85D;
	Wed, 21 Jan 2026 17:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbjF8wXn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hy0l4FV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C411B10E85C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 17:18:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LDVLEW3867451
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 17:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=ga0yl/1fcXATuhcu9VBpyntoYVMognSZRqUpVhR6yXs=; b=Nb
 jF8wXn8ZSgygBsmTdbpBl40vKFHg8dkPGWRKzz6ucnKEoqGHP1UGG9C2dTdL9t0p
 mnmNhkKJTjYQz37b6VQiTjuvANKCXesbGsQ2x4h38XYd8ZHbcBNIcFMm5MpmaeX/
 y26490F+F+YMxAXpn0rLo3Z6HYpISsOiOjuNr1NUq8SZIPzrZaRSrLzDNsLEvK7X
 C9dkGRbzuXSygbTNOYMLC4Sj89Rn43lwFHPbf/Hh+ypZlGbUtCLGQ32FFpegZjZX
 JUPmK1KuNHt9plNndYvaFm3iQyyGTENEbZsnBBIV9HkyfVwJFL/YkO0QBEHyo9Qg
 TmFMF3zjs82TdliaiCgw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btyrpguxw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 17:18:28 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-12339e20a86so137899c88.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 09:18:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769015908; cv=none;
 d=google.com; s=arc-20240605;
 b=Tu3GpWNZrKuUb766V8MAGgEkpqlOt37/4vuQuD5i+5H8F6FyUSvisYeUvOyf+lxTLz
 toJaknKBYgTDv2MCtEQeZ3c5aABMk1yi3bZtBXHfAWbOHgZf+ZHgDAujbQU+aJyhVhJJ
 GzddU7r9vBcjYeTiUoirZMQQC39BvhIAv/VKlCcysPV/yXVunV9wwh7PDMIWirkzaMM3
 6ARsmZlrzeT6PjyMc5WHKTZEQitwZBejkvBSF3KAk6vunuNZiywsRebMi0+RQnsOJIYM
 aNc9ooB8hnc/3/ZN2pcIL5Th9SGz0ckyMGpW5RERZG96wUbCqMkoybRLFgIlSknNjaxP
 p+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=ga0yl/1fcXATuhcu9VBpyntoYVMognSZRqUpVhR6yXs=;
 fh=PEKZMSHvKcr0efJCZiZtoHQZxTp0F23qplqpzShCVZA=;
 b=FIiSb2KQhFZt+83eLICFMwTaLdmrhWJatceIk3vm/XdUyB5W7GYL1Fnz6C5CwXAJKP
 l76hXg1886eaOMqYs7hJ9OOl40Mj/kLHukosHbg8ZAHylAYpiX5Xq4tptkDDU6xgcErs
 ta7D0NZAJsIvf0WdfQoPNlR6mdlsP+gwFlqafyl0N8L4WhLwJhO+kOioKSpaGFlMp3Jn
 clpesIA5r2oPYSZ/rYn4/s8+kA+qC7REdWlwYj7ha/Jb+Pq8rah/GEv7NOFxIbZVgLRK
 1U8GrNN2kQVtdIMZscQAK+wlZClw45Ph9sQMVzL/vLlxN6wgkv2ZsSRQuy0QU7OwyXEF
 dK5Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769015908; x=1769620708;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ga0yl/1fcXATuhcu9VBpyntoYVMognSZRqUpVhR6yXs=;
 b=hy0l4FV0Ez0HxG9j+PFpAn/qiGORV2VmKJnCDRpd9Dp4nl2xcDUtWqwclWs4L6yiuc
 wpQiHclM4CUXe98gOf4bO8/9f0QHPmJzt2vG2QgemlbtLmYjI8hEEFbCxo4wlklw4IiV
 +AvEZFu3DrVGy6dRXTqwWqwCqRXX5cMdq3/d1WrRwQxe2FVm2SIOWZLveZQRGy99569b
 FCYMqRtu/mlD3+ZM6yQKjP2p8D1vc7xaN/7MKpLcdPHhW7MOphYXdXY89TTYL64GWQ7u
 FIsc2QiF7M3DjIHwRfJSSQH4s7xshYhey0bi0iEXip1+MAxUa9ZReBtxU9Xgng024mqu
 eWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769015908; x=1769620708;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ga0yl/1fcXATuhcu9VBpyntoYVMognSZRqUpVhR6yXs=;
 b=IZykhkzUr+RR7vqDwOU1hZ0q/KUecG89Su7EMmlOtpoY2UNAWilT8FqEB0YDs2L1eg
 5NpdboaUIHrPhTXowkRzQIMW88psrIHyMjqH0dj85R3nhQkTfq9ZTWLILyvVadg9xQ7m
 1pDangnZl/WxLBOxRaP2Gy+GNIKoaA1l6I5ZUTD6MM/wyaioBmgNoGpHH7u+CauL7Yts
 o2he7fq+WWqZ34VIxvT1YN90quZxCj4II4vVj+oFZPoYZO/PtEjRojn2mlVmjj7auLb+
 ZQChdRQ1f8nXqmMMglZoLvoUZnmcDOA9NFbsZdH7LUTSJT6Ayqton4/a0YRgdtWM6tTn
 2dHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqL2Vyoyc3qUikxY5t54oBwSGbm5TseFALnhi2LKe405v2tVdguQ8j0p9Xof6+4vFD/l3WPjlc9cQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw69t0ZErsYmpjBuFsJGENzJlZgrQkv1MUYJnJEXqQfUkYKtJ8
 /eGVANHkttvBPgMgZ8fpKTaz0MzRqJ2XV2kdAutuXpmt2rZIyLfvY4QH7z3t1vtJ/0VmTiEzaYW
 UHOshiDWWRxRftwerXVPhQc4RQHOmRSkFtWPXWpCVADrU6YJ3uDl2XEpgbwufxe2tGH9+l9XpJw
 xLWJNp6LzBAn6mT4MltYoI6YKzWIVFDsF8+8Tmnqcq28MLtA==
X-Gm-Gg: AZuq6aIKDR5vG9B0gf2WehimQmWcCEiBb4DEest0HaCc/FOkGM87Sp0QSA8TCh7sUmL
 b0ISBp2o6UvtejpdkEpjTbf79kxpaWiJppTBq50MhQHO+hJ5Ew6Aa7q4bto1Q1TUspqJ0XGMX/b
 cUzumgbUNHbt4ARmxa16WXP1V1L3IIUWEJ7nyeTrG/SuL3ExINADH0R4az600YvKy2wug8vlzva
 aHGQr97QieskYxlN3kz57bRpg==
X-Received: by 2002:a05:7022:6b92:b0:119:fb9c:4ebb with SMTP id
 a92af1059eb24-1246aab32f3mr3214516c88.30.1769015907039; 
 Wed, 21 Jan 2026 09:18:27 -0800 (PST)
X-Received: by 2002:a05:7022:6b92:b0:119:fb9c:4ebb with SMTP id
 a92af1059eb24-1246aab32f3mr3214481c88.30.1769015905900; Wed, 21 Jan 2026
 09:18:25 -0800 (PST)
MIME-Version: 1.0
References: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
In-Reply-To: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 09:18:14 -0800
X-Gm-Features: AZwV_QggMC0EGXfDHD9Ynlotejfb84ZLpeoJQeG0wdpRQPgq3KVidg_TyOdspLM
Message-ID: <CACSVV03QHtWNrmvySkf1GdkfJ-iC=zFWf4OYrK1E3oq2S9bzqg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: ignore Gamma test failures on Qualcomm SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Federico Amedeo Izzo <federico@izzo.pro>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: USGagiYmR71Reip62pFczoMwo1OtibSr
X-Proofpoint-GUID: USGagiYmR71Reip62pFczoMwo1OtibSr
X-Authority-Analysis: v=2.4 cv=KpdAGGWN c=1 sm=1 tr=0 ts=69710a64 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=oiMQHesyWy8z1qx9V5wA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE0NSBTYWx0ZWRfX08Y5WX6SWbGB
 stQHXK5Du/kRF2pwmZY/t8C2LZqO8k3BV7VmXxjnGuZPRiAYJNo1WNKt43tI1C/oUIRHMESDtnE
 MmbRnKnflTwkl+Efd2QOMzmIwH5dc3Qc+hNaxbmP/TSsWrjKeJqnLST7B88fdSa/qDssh32fy17
 f8QgFZI0TeJSgInOlSW5ZNhhaF+En28L04unperwAxoCbUm+KD7T6tJqwhKlFVWrTdlTx1xqPBA
 wJAYvvS9o4JVej/le+M8Ql5Fq3yIo3K94rexsYdKjX94nAu4lIyNO9o0/KfeytDn34yfwzubGwM
 g7e4V/j9O54JxGVOGoNaFUhDvroaI+bNXuXDMDLmk222sZyU3jfhDAJqGKkK539m2Ma7V3kSkhc
 3r9ivXwv+5j1jd536pED/eCZIAbLwcJUvTD7sD7+0kMNedZ+EJDQRdfDnbdAR4dh0c6hFlhsNAs
 nRFwFktwUkzhwJNFeqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210145
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:helen.fornazier@gmail.com,m:vignesh.raman@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:federico@izzo.pro,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,collabora.com,linux.intel.com,suse.de,ffwll.ch,izzo.pro,vger.kernel.org,lists.freedesktop.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 1D9325A6BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 12:41=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> It seems, on SC7180 color conversion results are not included into the
> CRC calculation (unlike SM8350). The fails for SC7180 already lists CTM
> tests. Add gamma-related tests too.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This is the fix for the IGT failures reported with [1] applied. See the
> pipeline at [2] and [3].
>
> [1] https://lore.kernel.org/all/20251019-dpu-add-dspp-gc-driver-v3-1-8404=
91934e56@izzo.pro/
> [2] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1587979
> [3] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1587942
> ---
>  drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt     | =
4 ++++
>  drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt | =
4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fail=
s.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> index e4a8f8352cd6..ae36a39619c6 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> @@ -6,12 +6,16 @@ kms_color@ctm-green-to-red,Fail
>  kms_color@ctm-negative,Fail
>  kms_color@ctm-red-to-blue,Fail
>  kms_color@ctm-signed,Fail
> +kms_color@gamma,Fail
> +kms_color@legacy-gamma,Fail
>  kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>  kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
>  kms_flip@flip-vs-modeset-vs-hang,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_lease@lease-uevent,Fail
>  kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> +kms_plane@pixel-format,Fail
> +kms_plane@pixel-format-source-clamping,Fail

It is nice to see a comment in xfails about the reason

And maybe this should be squashed into [1]?

BR,
-R

>  kms_plane_alpha_blend@alpha-7efc,Fail
>  kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-=
fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fai=
ls.txt
> index e4a8f8352cd6..ae36a39619c6 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.t=
xt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.t=
xt
> @@ -6,12 +6,16 @@ kms_color@ctm-green-to-red,Fail
>  kms_color@ctm-negative,Fail
>  kms_color@ctm-red-to-blue,Fail
>  kms_color@ctm-signed,Fail
> +kms_color@gamma,Fail
> +kms_color@legacy-gamma,Fail
>  kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>  kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
>  kms_flip@flip-vs-modeset-vs-hang,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_lease@lease-uevent,Fail
>  kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> +kms_plane@pixel-format,Fail
> +kms_plane@pixel-format-source-clamping,Fail
>  kms_plane_alpha_blend@alpha-7efc,Fail
>  kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>
> ---
> base-commit: f185076da44c774241a16a82a7773ece3c1c607b
> change-id: 20260121-dpu-sc7180-ignore-gamma-dcff660aed40
> prerequisite-change-id: 20251017-dpu-add-dspp-gc-driver-c5d1c08be770:v3
> prerequisite-patch-id: 7a52c31208202effb5cc4b7aaf6d6a75eb9a258d
>
> Best regards,
> --
> With best wishes
> Dmitry
>

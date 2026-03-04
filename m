Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLzZMIZIqGlOrwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:58:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7020C202132
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D00B10EA43;
	Wed,  4 Mar 2026 14:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WY/BEjO4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aroB4WqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A520C10EA35
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 14:58:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6249KfdL1455858
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 14:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=omBgwrHvKXE+P9pB2FhWZ96E1Q6381vjXW/UYlEF0Io=; b=WY
 /BEjO4LZdaAF9glir3xPU/z9xBx44gUq6lbFe9vjdv3np9WIRbLfPpFi00BplV15
 xeOgKyftxk90UPRM4pw/Ej+L1NM2JpEPw2hsSobLFCyrlffgdU4Q4Lcwah/GRsMZ
 RRI0VCbjkqx6EvkJaAFFS4hlX2jeUYq0CfNA6CZwW6kdB8c8rpqo9b+J2lum9r7E
 edS0gQdEso0kgGv72Emmzgv56atqOrpcbOoRevPOozVzcuffy5g0b/YtS7mbA+zQ
 XpYbo+C+XhcHLhd50zf64OW1t3hhxZrjeckLUkRnTVFKDeLNHtiTIkz0vGIbv8aY
 xux2mT/b8HAFjbR5u1ng==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj180y8h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 14:58:08 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-45f1665f706so65920032b6e.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 06:58:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772636288; cv=none;
 d=google.com; s=arc-20240605;
 b=lRwCdEZJpGQBw0RoPjSJIxepeNc7PasU2rZ8BT4LOtWDIIfOIKMXHwGsuJwmkYZSnD
 LZ5GuMNp90joAxT5qzdPH7KVjZkwhE4UTJf+nxKG7qzNkQnOwmDb1fvB9VHfIBT4ZW0W
 k9gKVO6LMOSvzCNuDfbdPQRKs/thtzKwMLzkIw0VWCQZfNaP0WfXGViKLngGB/okWTxS
 6cTLJ1wD4s0wI+lK78GWL8RWw1N68zUaVevtjDm8WXp6Ja3T6lVvlm/Zqb8hoWOhWZzS
 Nnjvm8T0FlbqCRihImp7cFn/k9tWt191aOuAvhWJHbZDJEt+oJAH71JVbJOMWuMRmMP+
 9lZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=omBgwrHvKXE+P9pB2FhWZ96E1Q6381vjXW/UYlEF0Io=;
 fh=06zn9wrIBxNuWuagi8TNgG+kooYV4Z+9QbN1z7SP6ik=;
 b=WGDcMP1lHK3ZTZgNcD64Aycr9VdlN3nunizyblnaBVMk5FWvDp87ai2A8CxW3l6T7o
 SfmfSVxeDWrsB/7MRQ25ILtL8BxoYfOADq+tpTRX2kq0/ZZiZzgK5zQARZjX1TRhV/8g
 aQs2TynNh02iNH/WLMfLExUstEiguAoCfJ5Qm4UVKV8SvvZV26zNuAf6pCP2EhtJJPk/
 GVrxw8TNqnD91giVgIxI6QdlbqBB+ProTPah4yd3Wd94bYouTEQXUa6aQYEFKL7+htIq
 yEz6wrvDHfRdz038bJ44ONbuQTuwQ+8A5UQfFZHXd1yfciBXEgDSPAOyRtBk+hw37AqM
 JSog==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772636288; x=1773241088;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=omBgwrHvKXE+P9pB2FhWZ96E1Q6381vjXW/UYlEF0Io=;
 b=aroB4WqFgE85Ws8mUOJfMmPrf8TFC6XymDVRXEKHDl1WCnppxaq+UeDHy/wf0KR2Vv
 aBpbTfX9qQmJPkXutdpidZlrksqWXQPc8UJI9CMhprke0gEb2KD6F68ogDT/aM8mtIO7
 nW6WJVcH8nDIDQEJYX+kAEjfPuAQ0/vgKSdJcAB/5kfzTejriY/pxS32vl25v0X+On75
 ZVwME++8E8b9D86NtXNekdzB3+PEZ6AqXh0yPWSVPkkj7r1kQcfgR225dbh+ryXy5CAq
 SwyfCk4r5bmfWsx3zTPLaH69pboCuC+iuKXJ3Lfo5wXuhshJnMZZ5A89DfDsq4B0wwT6
 Lrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772636288; x=1773241088;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=omBgwrHvKXE+P9pB2FhWZ96E1Q6381vjXW/UYlEF0Io=;
 b=pWjljS93bQLUBFYYQQGJqjeL03c0dTHJFuKy7sz7IG/k3nHpgzwTIJsvfUaFRu/DOw
 6ywEwIepohm8VCq6FDQd7fffonxj6XLoVyouShO8VNBpprbbemZfNaofbejUaNwlcYTG
 Kopu0E3ryb3h4L31C/JQ00zaebWPYdYhTP0rVa42l1NyrJSQZVEoH/rrtG6J8jGoS+/n
 SubSri4eK1cZe8PsQQcS5UWvan7+hBRD2iKs+cMkMtIZ2FCdHGe1DIijBM7xBrUg8etK
 QH6tBDOn2LRIoL0GHNRW15ve9v0bt4gY7q3+Mr9mS2RjHqBtUbks2hZQRivA3bpgZlJ7
 PDdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzBrsQ7G7/rLEityF2lQ07SZ8+g7VHMWzrn2m36GJRf70P9pu0cNXtk9bVwh9rcNVzDLn9PpfOm/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7rW1buMzK2ZWPwl6tJ61JQaIkAyng+0S/jplZQZpePAOI4SQF
 WzN7OplHHYyAFG7qKuAlbZBrrgtKv/KKCfFpyhy24hfH0Xa9UDt3+Opjkg3VRgpOajJJV9VaIbn
 84ccUZprQU9SYRtjGG3zQYP6D5AH0Rl2mVTGU8JEey/FhWmVtsB2445VUAkKeGMURsT8neiGlS3
 MDTlyAmFfMCKnNY8xqb+Cv6/Pml45D9MrizIeGvTtR2iLzYw==
X-Gm-Gg: ATEYQzz8649j04VqNd3jTqPxJdepX1DXELQutpMkvk0B9RG1k4q/zf59CJov+6qG81h
 yqlopaGNSlo7n9kFSeuSKezhNfW+W4sWTajUCFSank70quRrChvqwXbjLoej9+ZCmvIQe6mLCAg
 rzKTq3S7sQdFKbMppKwuvqjj0pwOBN6TEI7/u9rBWqtqR0iZLZwv2cSw+4ME10aYZJoAkvjv240
 Zm6w/mJZezGD8j6f/vInPy4UPXqbT4del0TOw==
X-Received: by 2002:a05:6808:1a15:b0:45e:dbc8:4ba6 with SMTP id
 5614622812f47-4651abf594dmr1137099b6e.28.1772636287793; 
 Wed, 04 Mar 2026 06:58:07 -0800 (PST)
X-Received: by 2002:a05:6808:1a15:b0:45e:dbc8:4ba6 with SMTP id
 5614622812f47-4651abf594dmr1137091b6e.28.1772636287437; Wed, 04 Mar 2026
 06:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
In-Reply-To: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 06:57:55 -0800
X-Gm-Features: AaiRm510BWQOzcaRQJu5XH1Rs4Emomfz4BHH1U5plIfKV_kPq-LoPPkImEc72bk
Message-ID: <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: gi1x4bZAk5t2aAz-i9VRBxelGg6g3BJ5
X-Proofpoint-ORIG-GUID: gi1x4bZAk5t2aAz-i9VRBxelGg6g3BJ5
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a84880 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=Ad23g6fO8UNhwhZctZsA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEyMCBTYWx0ZWRfX+Vsd3UNQAZFL
 hRzH5Bucexa3EonJmYm4te+O993tG1JMOplDSGKQzYrUEzATzAs7ErxnYDj/V0APu8qfANaW9NF
 Uh0RHCsziOrhmUJWAwUO+HfrR7MnPmwVQ3c1Zent9Ewh6KMHu5CgfbzHWiT3iNSxH07E5rMJzyz
 eMOMobpO2E7Sc3GzT/SlLFvoKlfFKHY+LVwsjV/NB9FZkJzdXaTfHMBH6T8vkdwwL0pvEpHsLP+
 XrIt6l5/9vJo055O6ff+fiXS2hE+Vp5Ag/OQP4bdft0zXz/VNgiYXid/vjN7SNAo0j/LtZj/l/p
 ffCYVAFUWPP2fClHh5BUlOMUN9N3hakEkhIgmjZZx9cqQOz+NzGrhcn6T4HK+EwTCVwFqRBd7cH
 oiXJn2lkRZ1+MZbUiO6t+Ry3De57+amSLKrV1ibk/nRO34t7GxlusmhSXJ+GUaxtMqQO6XxH7sM
 EMuwOQFBhnzDK6gwUKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040120
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
X-Rspamd-Queue-Id: 7020C202132
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 5:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from the
> KMS driver, imports them into the GPU driver (msm or kgsl) and then
> uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: Take
> the ioctls away from the KMS-only driver") dropped all IOCTLs from the
> MSM KMS devices, pointing out the need to use dumb buffers, however dumb
> buffers should not be used by the GPU for rendering. Restore GEM-related
> IOCTLs for the KMS devices.
>
> Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only dri=
ver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note, here I assume that dumb buffers generally should not be used for
> rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
> devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources.

That is problematic in kmsro.. (but also unsure to what degree kmsro
ever got used "in production".. the x86 drivers don't use it.  Android
and chromeos didn't use it.  Etc.)

BR,
-R

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index ed2a61c66ac9..f82c9a36a166 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -799,6 +799,14 @@ static const struct drm_ioctl_desc msm_ioctls[] =3D =
{
>         DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_R=
ENDER_ALLOW),
>  };
>
> +static const struct drm_ioctl_desc msm_kms_ioctls[] =3D {
> +       DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_R=
ENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_R=
ENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_R=
ENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_R=
ENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_R=
ENDER_ALLOW),
> +};
> +
>  static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file=
)
>  {
>         struct drm_device *dev =3D file->minor->dev;
> @@ -868,6 +876,8 @@ static const struct drm_driver msm_kms_driver =3D {
>  #endif
>         MSM_FBDEV_DRIVER_OPS,
>         .show_fdinfo        =3D msm_show_fdinfo,
> +       .ioctls             =3D msm_kms_ioctls,
> +       .num_ioctls         =3D ARRAY_SIZE(msm_kms_ioctls),
>         .fops               =3D &fops,
>         .name               =3D "msm-kms",
>         .desc               =3D "MSM Snapdragon DRM",
>
> ---
> base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
> change-id: 20260304-msm-restore-ioctls-2a1792311a09
>
> Best regards,
> --
> With best wishes
> Dmitry
>

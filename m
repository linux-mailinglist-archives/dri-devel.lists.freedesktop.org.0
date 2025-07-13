Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D558B03114
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 15:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C187010E0E9;
	Sun, 13 Jul 2025 13:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULnlX0DF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B73910E0E9
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 13:16:43 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DBpuwL011892
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 13:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=bTUx+VZ4YLVbV9D1AWkOK6pRuT0f7GMSlVwY3D452HQ=; b=UL
 nlX0DF5b+61nX7zTfN7F5d7ks+Plznjmaf/qz74NyHN2wQ5nyRAShZ9pAlPxsjQ6
 fbiHuCTENTFtvOZE05onoO1ePrwO7965IAKw6FFPIwlA337NwfZJG1/IFuX2w6t5
 +ONrzCTcK3rQ8S7jadlmYot6db5h3UpdXPjTYErRUF6Z+jHJY4DWhPhUupuXBl5X
 qBVCSewMyPU2IHCgM2ylBfK2XERhWJLGDEE7z9srf+gIubKagQ5bTMVUqMo9J8mB
 LoR95awqTj6LgyHJiZfujgYRoAXCihgStegcXdpO5u1CzCCWzj0ymJpw4PFXjpGg
 bCwZUeMxePFY3bHrQV/A==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut23p5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 13:16:42 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-40b99fd68feso2428225b6e.0
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 06:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752412602; x=1753017402;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bTUx+VZ4YLVbV9D1AWkOK6pRuT0f7GMSlVwY3D452HQ=;
 b=C8jzUDj8ZHQCcHVgkEl7MM3xSBS0vD5hv8x6aqzgfR4ZARe9gQs0JV/JSnxB2BV7TQ
 J17JsVcuzLAYBg09WYHn3w0DBLpmOuyTYsy2TsRn8apGmUeUkHtw7Y4t3mkEXpSSgv+F
 7i+OziC5RZZiCz9RMJZYejl1rahHokOyUhycFFlRyDc6DvrZDD28gqzAoZWb+wUF80h2
 OSCzjZXV/xBZY4yrngWRdTMUELU05HbroO1bf+jgvrmHmSmxTTcshGOhNKXKxMn9xU0I
 JWkLxZTng9n4nqtHS8I6ZqvqNN/ubWNcEeyxDPCQ+BlLFayEcCwaPaok+2b9M/SLruVI
 k6YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyWFnKCmAySi/M8/piefs+FDePC3H3cDJ8KRBNRKrK7UDh7J/7gKHF3EgvjjX756kMRw9mDzcqJs0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaYc2/ho/HdMWi73lSm74oGgF/x6ZShk1oMpjzNm/pxRBGmr6E
 nmwE2r/KE6CsS7yoS3Cg1zgXxDcwKVcWPbiv1U8c8XaiwZKdVGNIUXBXb/6wUtgDJ/bQT9JMdsB
 TAgzygY9Wnp7VTLJE4fEuBTYdKQg1fRPK51vGZRTUOcEHISiOn+vF7IuBJu4WdEKvojXSASYRPY
 VaSoOt9r2I6s+0kKAqm7qrE91ohwQ8q/ta78zEpZRnL6d79g==
X-Gm-Gg: ASbGncsLeRM8l5YQZV+Hw1fMVH6oXAk2J1WGd0spuUTmQB4oAksQWLMqFKJJsclhvSR
 nUbxGCP3oPbywDu/vxnHvwkoaNCQRnHp46BO08Sy9mOBbtrjg1r9uXHeuqMwdZBt3TJUCcCQqO+
 gZNRzCLr84e8pup0tfW3yUJaKVdr09RuXcEGQXgW2Zh5paJqzFky8T
X-Received: by 2002:a05:6808:23cd:b0:404:dbf3:5b0d with SMTP id
 5614622812f47-4151d5914e7mr6575400b6e.3.1752412601979; 
 Sun, 13 Jul 2025 06:16:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1VaQK9wqnz+FxTANYpJ62FB5qEMASGOmEnkAQmxm/t7Rjz3H1kfZoKlFbnHST+MqaPlzvrU9rnDXUzvdkudo=
X-Received: by 2002:a05:6808:23cd:b0:404:dbf3:5b0d with SMTP id
 5614622812f47-4151d5914e7mr6575381b6e.3.1752412601552; Sun, 13 Jul 2025
 06:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250711191014.12a64210@canb.auug.org.au>
 <e744987a-2fed-4780-a9c6-fd1175698da8@infradead.org>
In-Reply-To: <e744987a-2fed-4780-a9c6-fd1175698da8@infradead.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 06:16:30 -0700
X-Gm-Features: Ac12FXzFPCGagOTtBoMZgRaN1L0GwHmRIThJgFjwywyiNvm8JhFCpXjsqSe1SlY
Message-ID: <CACSVV011qEHt5Srx4QdP5=L9WqxTg9yjY63rTUGwbXawq899gQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 11 (drivers/gpu/drm/msm/msm_gem.c)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=6873b1ba cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=PbJyB38NimUM2AyV3J8A:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 1aPUlr2jU47WtjTuAhaZ8_X4pZGfLEk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEzMDA5MiBTYWx0ZWRfX7NCZRrBRr6gx
 dB1vDphz4sTy1Eeyuywmum8nx0imD8xhKrj7g03EekFXBOVjDHIeWD+625DnaiXc/HoSakqho+L
 rPAOeXuvxWU6zqI6icCatZpv8ZRpdrfIhtI9u8mWFYM2h8LR/KFtIOYF0WEOj4mC8rYkzBkauxY
 hmU4BclHfxIaaMpgarBbofOXxfksnlvoB/Kdh9ROI6vyiiJfZEg7JoFXShTC19UWglW9H4KcGfW
 cmITApQnP4s7rXgK3/8gRNYyvghi9rZzZV2yfGcIkSq6j1vCpBMy0aFCUq1SSPjN1rcac+u68J2
 en7JOs/B+7hsiwhYvD+U3ZWK+liSOLjSd8RLaO2VWWUfNsWZDtM6M7VHgzxurE=
X-Proofpoint-ORIG-GUID: 1aPUlr2jU47WtjTuAhaZ8_X4pZGfLEk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507130092
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

On Sat, Jul 12, 2025 at 11:49=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 7/11/25 2:10 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20250710:
>
> on i386, when:
>
> CONFIG_DRM_MSM=3Dy
> CONFIG_DRM_MSM_GPU_STATE=3Dy
> CONFIG_DRM_MSM_GPU_SUDO=3Dy
> # CONFIG_DRM_MSM_VALIDATE_XML is not set
> # CONFIG_DRM_MSM_MDP4 is not set
> # CONFIG_DRM_MSM_MDP5 is not set
> # CONFIG_DRM_MSM_DPU is not set
>
> so DRM_MSM_KMS is also not set:
>
> ../drivers/gpu/drm/msm/msm_gem.c: In function =E2=80=98msm_gem_vma_put=E2=
=80=99:
> ../drivers/gpu/drm/msm/msm_gem.c:106:54: error: invalid use of undefined =
type =E2=80=98struct msm_kms=E2=80=99
>   106 |         msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
>       |                                                      ^~
> ../drivers/gpu/drm/msm/msm_gem.c:107:39: error: invalid use of undefined =
type =E2=80=98struct msm_kms=E2=80=99
>   107 |         put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
>       |                                       ^~
> ../drivers/gpu/drm/msm/msm_gem.c: In function =E2=80=98is_kms_vm=E2=80=99=
:
> ../drivers/gpu/drm/msm/msm_gem.c:668:39: error: invalid use of undefined =
type =E2=80=98struct msm_kms=E2=80=99
>   668 |         return priv->kms && (priv->kms->vm =3D=3D vm);
>       |                                       ^~
>
> --
> ~Randy
>

fixed by https://lore.kernel.org/all/20250709140838.144599-1-robin.clark@os=
s.qualcomm.com/

BR,
-R

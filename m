Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D019AED60A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 09:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8475710E3AA;
	Mon, 30 Jun 2025 07:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3ke4a4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285E810E3AA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 07:46:54 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TNV3b3015956
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 07:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aV5arrU7+ZA+U/JE+Y5+I1him+/VX9ALPSKT3ozfsNM=; b=C3ke4a4vl201lBOK
 RrIUY9Ndk576Ip+RUkfLPiUZRibZ+dXQzad0DLVLmhYT8st4ksnmNjh2a0wqQuvc
 Iq/YLiQsvtAvkyXsJqP73TD3MoHMa3Fj2KjpIwgYnAxabVxIdGwsaQB7tlKVZnOD
 eZB5EzFAaht8+bl9r/uVJC/ZU5GmNMtIsT5CTOvWG8xWKNKCdz6t4xp7o+7XVPpQ
 Pppl1mLqdh7Jv1JerjnQTaDjFa8nvNJ/YJKbnsEHJJpfemKCc4LIBnnlxwPcODUr
 AMdVNTS7JG+rHbdS3Duu/7du94zp8bCdPoyXDlctEQCY0nUe2YmsQ0qLn619Loic
 ZNt2sQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k3ysx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 07:46:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4a461632999so82737911cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 00:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751269612; x=1751874412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aV5arrU7+ZA+U/JE+Y5+I1him+/VX9ALPSKT3ozfsNM=;
 b=hII2DIJ38LkqguswMJN73TJZbnciYNOra67lWeBqdzfH86x68DbrVnrueZpRfIeS4E
 iyS70MfT0Z1a1WyUrWmqB4WEpUB3WafNu/PB3AF/0/fEyKHrjwEfj6kOd5gXIGOSy74Q
 O8UVofPk1lQqC4ztdGxEbyp5T+oJFdAiLRANmaE1mH194RbE+koPtet59+BSXNPTzE6p
 aIBd/oN12KXQPy+CAgLJfiz3L2IeqctRfsM7vOaMIJShWeqGU1a2bSVS5WG1mGRZGRU/
 psrXZbok7QfSSVPLC1jC2XVFHPeDhwrUOoMCtpg05oypFqMByPLNsYdIJB6M1d1ISAk7
 UHlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzJ6udb4lRRKnh1fabe+AU3yr6NsnliChvY2FgEVabxGiaynscLKwzaQf14hM1Dp021qNPTEKKJ+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBIWHVUyt1JTjTQmKiGXxkW2QK0/z0WyW1ryTDkcP4ojpZyipo
 ZlgL9QZq53CfrLLwRflkU0eVR1bFkOSf1YvCUOixfgssB36b81YR7NgEycQG2HdBp+uRP/Cqt2n
 o9hdciM8Nh7pOUEUlXFI+8JIVL1yHTSKmZXwEqhXPIUF+htcPfLVvHSmB1wV/ZfeTu3+YXVakK3
 RMqv6vUJm73umr4bmJOQl1MCQemHPTXF0BDtptwcyE4zHt/w==
X-Gm-Gg: ASbGncvP654E0M+ClV0tqY1TUyE4cN910Gz6ntRfF71hkRZfgZ+Xt81NtwiN+DbZTtl
 AikoUg3+dAJDyEPfeIERyPnt3O9+lwzktRwHTdL0HDStZtUEXPbyGZCJmRIyp0u22gEIIO/3vTj
 nyw8/m
X-Received: by 2002:a05:622a:19a9:b0:4a7:1402:3b1 with SMTP id
 d75a77b69052e-4a7fc9d42e0mr208097701cf.11.1751269612160; 
 Mon, 30 Jun 2025 00:46:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOvh/sVxktuPWb06IhY+S4eQ2LmVWxABhCied3HVcjyhp4T4/fXXJl6/WNp99su8uwy9KlMy+OVyVMPANfnJg=
X-Received: by 2002:a05:622a:19a9:b0:4a7:1402:3b1 with SMTP id
 d75a77b69052e-4a7fc9d42e0mr208097461cf.11.1751269611774; Mon, 30 Jun 2025
 00:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250629023836.744441-1-loic.poulain@oss.qualcomm.com>
 <20250630-venomous-sheep-of-control-dece32@houat>
In-Reply-To: <20250630-venomous-sheep-of-control-dece32@houat>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 09:46:40 +0200
X-Gm-Features: Ac12FXx5QL13lTjzd0UGa9J3b8pNzZiFauUmDe_cO3me7OhYQM44e34xq6x6DOA
Message-ID: <CAFEp6-3UVNfHo3s1MOXw88bAMVh=3QzF7H2N2UoVXyV6R3BBpw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Fix invalid EDID size
To: Maxime Ripard <mripard@kernel.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org, lumag@kernel.org,
 Laurent.pinchart@ideasonboard.com, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=686240ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z-KoOJIlDxAInEDke3kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA2MyBTYWx0ZWRfX0BE5jzDBfnN+
 oaIPHwZZ71gDq1HqxsrV3aEk/ZhpgO9Pee1e17Bb1EnA1k0hKCMd++bwT65z03BC1MouUFvAXI1
 E/FA4GcX8cpXv/Nwg8mdd5RfCmP70QT1zQy1Omfl06Qikimdv4FQXEG6CHL6NiUXJV35v+QthrL
 WXgIGFtylWoyEi7SaL3TAd3kzlIpMKSdmRf4ayY8Wx/SpXMN60D04YjVZrTivvJwgZsEoKhzlt9
 bAXCg+1iOQPhxeXhlmKKEqq3+PePI7rI1cdDQniXfN9r/sFEAJ6iCugtY5/lM/Yfxb12A8B3OMu
 +7BfzZN/OXIk/MmYweAkThKhGQ7tCLaC1qDgypCExZAKAgyucgnpiPQXR8pygDlj7h0tsHa44AV
 V4/HuaeL3zLN1e6NWas6RoddaJd2WbcgrRNgDPs2ab19oK7JPW9j9Nm0Oe5QvEzcaHjTrYAw
X-Proofpoint-ORIG-GUID: Pg7FoBAkb2i0ljOjqydN6CPutInUaPxk
X-Proofpoint-GUID: Pg7FoBAkb2i0ljOjqydN6CPutInUaPxk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=809 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300063
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

Hi Maxime,

On Mon, Jun 30, 2025 at 9:07=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Sun, Jun 29, 2025 at 04:38:36AM +0200, Loic Poulain wrote:
> > DRM checks EDID block count against allocated size in drm_edid_valid
> > function. We have to allocate the right EDID size instead of the max
> > size to prevent the EDID to be reported as invalid.
> >
> > Fixes: 7c585f9a71aa ("drm/bridge: anx7625: use struct drm_edid more")
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/dr=
m/bridge/analogix/anx7625.c
> > index 8a9079c2ed5c..5a81d1bfc815 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1801,7 +1801,7 @@ static const struct drm_edid *anx7625_edid_read(s=
truct anx7625_data *ctx)
> >               return NULL;
> >       }
> >
> > -     ctx->cached_drm_edid =3D drm_edid_alloc(edid_buf, FOUR_BLOCK_SIZE=
);
> > +     ctx->cached_drm_edid =3D drm_edid_alloc(edid_buf, edid_num * ONE_=
BLOCK_SIZE);
> >       kfree(edid_buf);
>
> Do we need to cache the whole EDIDs? AFAIU, it's only ever used to get
> the manufacturer name, which fits into a u32 / 4 u8. We should probably
> just cache that.

While the cached EDID is indeed used internally to retrieve the
product ID, its content is also returned via the DRM read_edid
callback. This value is then used by the DRM core to enumerate
available display modes, and likely also when reading EDID from sysfs.

Regards,
Loic

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C2FBDF0D1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 16:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054C910E29E;
	Wed, 15 Oct 2025 14:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjRVU9yK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B6410E29E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 14:31:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FBV08n024770
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 14:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7C1kqUL2+pSHhXzgLUx/+UHRV9bHHrUHqpI6u3kSEJ0=; b=KjRVU9yK9J2g5XfN
 WYApyw9hUCwkyWoVPN8+r/Gg7hC4gSr2Aru5jR1TFD3Ex34N4kp9PdmptUQSytay
 1vuz2iDWXUEKRvEcT75gj2eJ3Din9JaeqMzEPQflAoreKHovs5aIgPbYi7uh/m8h
 V+FOJxAUKMfVpqYRCuEfDmk8JW6PPKrl3cOiou/a51j1Tg8HbwkOHY8zG07O5Kky
 qK5ODp9OIA1TIc4klrUCu4F/WyzxRvueBYpt6zgPK2N5TlZG95zObj/436166S8I
 YZSrOYnO5Ftd+vGLnp8vthQl7E7yhCzAuigycyyQOUYPdD0QhkQx9h4GswzSlUCD
 jbov3Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0vpn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 14:31:41 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-54a9f198468so3567745e0c.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538700; x=1761143500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7C1kqUL2+pSHhXzgLUx/+UHRV9bHHrUHqpI6u3kSEJ0=;
 b=OqnyA4oyt4wOH5rMBh67/lGubgA+P587TQb6N2CAtytyaQTJrqbYrjO6wIbDi2Oqqa
 vRdIg0zdGihA9v7uLzGwjoszCHzaU28Qr+6+bkn1kHI5q8dsU6Z6ySeVu7D3J8Gbv120
 1nbButCgq+IVQTFjpT3yB/HrSvDshDfkSS8d+cqRD530iGgo+/i6fxdQXFN4GdcQio9H
 P+RfrpQpI+5md3BSQXviNsc75RnKthb0mo9bULysm8WipCE/1NCpj3F9HX5ISo9otFYe
 m/rNAPZHXfwIjb4IKqHvcXub2AjE0Bmq36IqJArT4gIKThMNrj32c1+jMr3UTsw+M5cr
 AYuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY77rTvR2Ru9EoE3VsBRCqoNmySp7mpvDtDrYTlYzK8Imt9iRLSFGMyZjHWicB9S06hlMUqmbuGA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVIFRfSVuZPys9t3B3xFsaLmFDryJVy6SUqLWrsItAnTfpKxYL
 e3XzxtGbuxFUPE6KuqZwFW7C1D0xC2kq7yg8tpJnwTQwnrCC92urmMoiuP8mtJ3qmvd27aywg6c
 iakDimL2joqEGAldy6LxL52Hl+QrJVg6wdww8RlzoJFCM7Fhudt4AXbcjpqzqkT9krNe/9LITPM
 0Bem1i3IV1c6qnMoBJt3v/giF74uL5b5FZ6hsSF1zN/zR1TQ==
X-Gm-Gg: ASbGncszkqRqR8lrjuOGtv4Z90cn0KHckAMwrpyXT4SKmrykFAUEyJLbrSDcPwAQqAe
 lm5Hge2vKx1D44YL9vkd2DMues/CAUpUyx41wj0SoDKP7f/e5lRqeypdU90V3qEgvYxUaug/uNT
 wh9Inl0Sb/dvB4hsXraCVW2g==
X-Received: by 2002:a05:6122:3c46:b0:54a:1e96:e958 with SMTP id
 71dfb90a1353d-554b88e4b6emr8902481e0c.0.1760538700184; 
 Wed, 15 Oct 2025 07:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoCzMasGr9ydKzAL8etqZmuW94HxQ8w3vyPkrOTkAFlVbqRQfNuVAEq7kcm1c8bivioVTyL9H6cLg28nkgV54=
X-Received: by 2002:a05:6122:3c46:b0:54a:1e96:e958 with SMTP id
 71dfb90a1353d-554b88e4b6emr8902363e0c.0.1760538699592; Wed, 15 Oct 2025
 07:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251014170927.3908383-1-youssef.abdulrahman@oss.qualcomm.com>
 <830edf8e-8cbc-41ee-874d-5ecb6450e182@oss.qualcomm.com>
In-Reply-To: <830edf8e-8cbc-41ee-874d-5ecb6450e182@oss.qualcomm.com>
From: Youssef Abdulrahman <youssef.abdulrahman@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 15:31:28 +0100
X-Gm-Features: AS18NWDbmFbR4RZnRdVwXgxdX68v5vDxEZfeiuQ_jxKhyvKegSFVH4tvSCmYZZg
Message-ID: <CANyhwx1QScQkR=MFRdmV3Fd8R6QJjq+1=esB_NNSq47FuBWCcQ@mail.gmail.com>
Subject: Re: [PATCH v2] accel/qaic: Use check_add_overflow in sahara for 64b
 types
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com, ogabbay@kernel.org,
 lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX75HFr2TOFHmA
 yM5JZ195eB4j9AEogLunPwsmdyCWRInbenwHbltWOjn/Ffqy+CNRUhiW+lykzk34T+O9VddWm/1
 L40Cq026bkb/vJZCZCAscTAsDhGfNVR3rtkNVcAOVJg5shutjm8KCOHB9VcRGvFZsG7/quZzUoh
 J4g/1RoProN7cgjSoUBIOlu2eAi9WTq0gzKNH+FhoXT0iGmtl+7ShQxDzPG7MaAtxPm0jFz3uI9
 XaZQNPdVySfJersEEQ/yP1rVcYKxPDCUOaUimx0KPYDzEU5cuftScMi+SCb5W1DkG9A2JTvsBK3
 dAm8sOMF0JK+SWd2UD3KG15GkFV1I8SZT7RhoD9+g==
X-Proofpoint-GUID: Fx9lzg9wZAdh-FE67BS5i2bsxhheM3rq
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68efb04d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-g8CD2O9qlXXIwQv6SoA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: Fx9lzg9wZAdh-FE67BS5i2bsxhheM3rq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

Will send a V3 with only the explicit cast, and send a separate patch
for the min_t() change. Sorry for the inconvenience.

-Youssef

On Tue, Oct 14, 2025 at 7:31=E2=80=AFPM Jeff Hugo <jeff.hugo@oss.qualcomm.c=
om> wrote:
>
> On 10/14/2025 11:09 AM, Youssef Samir wrote:
> > From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> >
> > Use check_add_overflow instead of size_add in sahara when
> > 64b types are being added to ensure compatibility with 32b
> > systems. The size_add function parameters are of size_t, so
> > 64b data types may be truncated when cast to size_t on 32b
> > systems. When using check_add_overflow, no type casts are made,
> > making it a more portable option.
> >
> > Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> > Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>
> I think you are missing two reviewed-by tags from v1.
>
> > ---
> > Changes in V2:
> > - Use explicit casts with check_*_overflow() calls
> > - Replace min() with min_t()
> Fixing typecast warnings with explicit casts seems good, but min->min_t
> seems outside of scope. It doesn't match with the commit text, and I
> don't see a good way to include it without making this patch look like
> it should be split into two. Thus, lets do the typecast fixes for the
> min usage as a follow up.
>
> -Jeff
>

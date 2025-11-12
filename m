Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B016BC5296B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 15:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F83510E747;
	Wed, 12 Nov 2025 14:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZ0FyE35";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqI73YUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B964510E746
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 14:00:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AC9fStR721886
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 14:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=pFBpxvCThnvTjNirIlaCiwpE5flozd6oDfK2MM6c4Bc=; b=YZ
 0FyE35DJvhsctetv+GZA8d1/C4lvdQEfA3egCJ3nsIXAUrl3WEDcaAMK+tCUm4OA
 W1F+D/489qT7pQqR3I6pWkn4gh19aYk2pU+kxaxo6DbAnnCQHz3/CuqVZXCzVn+F
 a7zHSSYvd+gNv2I7a6UY6wG3QYrsMC4Noogdaa/yku6pFWVMVIYo3atzE9I3agug
 LcsMu2d/+E7xQ/etXeTThjfgRMtIFMoDmHSngwc/h4GlAv9txoZA+ywdtkMXPri5
 4AbQgCCfu4sZ1b34/Eu2pniR8jzlwIMuxn/Im0+QRsSfJZ9nrvlLEvIcsOE2t7CD
 1oKaWhHhbMdbZv/MSWrQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqu1rscp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 14:00:49 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-656cc4098f3so1231950eaf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 06:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762956048; x=1763560848;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pFBpxvCThnvTjNirIlaCiwpE5flozd6oDfK2MM6c4Bc=;
 b=jqI73YUPfmqsgWy1KwupAIG08BJytolGxMu9asObDerSQofjYsz4ciCLhapIPkoOg8
 D7HZuY+K4rpZ4OG9abbgIBVHmovyLL0nRWtqjAg2fx4rS34LLJCZm5Rp/HcEEkxlwPac
 prgfjVJpzV+83SRt5FRkTN9R98NruvUhu8j3JwUYx7tZSQ56IPkwzEJQPPEPsQJQtf9S
 fRn/+MHPwQOqBBTxCrmynuK+i/bUGa3DwK0K3GQcy+qgOo7XhQvt+WdPQ9YplRc9EXSZ
 5mlj2saV5snx/IUyjvka/OKfM6brd5JE2Xqm8163ylaJL/6H8vBAA3aw/lRxbRHj3SO8
 1FwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762956048; x=1763560848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pFBpxvCThnvTjNirIlaCiwpE5flozd6oDfK2MM6c4Bc=;
 b=T4SaCG5ZRCWsjslX3WeaaKuNGLhCeHnHqwaKHh/RDYpo7cc5H6blZ2/C3SlthZpOYF
 dOLIzP7J9SEJFan8FoEOA8I4v0xjoBZxfcMgoRNsJXSd2mYMjxyxEo4k4b1J3GRVorB2
 zd+lh7xEn//su464pzaYUrgiXKlEpjr7l3WaYGpK0urD+xcGhXkJD/TtH0KjKzVfQb5z
 ff5Sl0PD7rTlRXx9zVw0j//0OScAD4+ugY9zNkcIB9t52VsavTy0nmcMz0JANqyy/RkE
 ygtAF5z6OKVmwU+tA6yEdnLyqPvxhsjQb4I97qYrO164dgHoOSQ1ctyqo/vgT4Q0xRJZ
 h9Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7Z2y3qbnQbieum1jibCvtCoQZjO9C7j8CBBY4GGV+acmdZ4g4Cjce9aQDkVP7560jQmcgWvsQPUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBasnXwasUcaTayQV+miJAVYYKOBNzndft2/wmbnHlGY3rGqEn
 MsCgxJUJEC4FO6oKuIJz/tWuPYeLG1f9iFKp6wboFvqS1aMKUuSWROZeRWMARwTK20eWroWfbVf
 xj3mNKAb/hHQ4netlDuQzCjL6vA74Btmn/MhnX+FcsN8St4nr5wIMXPq+GGx9PF18xyHvGgpspv
 zwTbZBjnmdbew+yPFr197WRxO13N2MCkZf+r/zgR6x+Vvxzg==
X-Gm-Gg: ASbGncvO/+VAfc/mh7hZ9i5XgvwId2ps9JA20xaV0rb8YRd1IsxaSEw7GGOYYHeZnHi
 UeoL9RkxTy/tMbF5jM0oUxWKqhSjqdrLurt1NRAVxnLp6LIvEIf9MJ+Wn6wlbHCc7hZ4IuGTbc8
 MlWZY07Lt6TzlosDQRgjb526D9eyRAUJdVkwo8ZgACfa0wFADY2VEPvtJnAHfLP/FZa6w4nIJMj
 ddmSwMlAOgInBM=
X-Received: by 2002:a05:6808:1b12:b0:450:507:c77d with SMTP id
 5614622812f47-450744c0bd4mr1438122b6e.2.1762956048309; 
 Wed, 12 Nov 2025 06:00:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH96c1EnT3cd13kxATKATzWmWR3BVJ09jffO+pUV8+0w4fuulnyNcRl+pIMD8xQH7UGqOY2SEAhMOOnfhadkY=
X-Received: by 2002:a05:6808:1b12:b0:450:507:c77d with SMTP id
 5614622812f47-450744c0bd4mr1438095b6e.2.1762956047813; Wed, 12 Nov 2025
 06:00:47 -0800 (PST)
MIME-Version: 1.0
References: <20251020113708.7403-1-hehuiwen@kylinos.cn>
In-Reply-To: <20251020113708.7403-1-hehuiwen@kylinos.cn>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 06:00:37 -0800
X-Gm-Features: AWmQ_bmSomh-Lqktfo9-_yIT0yuHH5MOogLEutWFwCLiDDcs5TN9J_P3zC898No
Message-ID: <CACSVV02vOhbW9U-9ZAT3QAh8ZKqr1vyO0sQY7CDRAGrwM997NA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix NULL pointer dereference in
 crashstate_get_vm_logs()
To: Huiwen He <hehuiwen@kylinos.cn>
Cc: Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: cqs4kBz86d_ellvzxHVhdP-POY2WB6dT
X-Authority-Analysis: v=2.4 cv=Hpl72kTS c=1 sm=1 tr=0 ts=69149311 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=G_YO64yXUFrr-ST3v2gA:9
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: cqs4kBz86d_ellvzxHVhdP-POY2WB6dT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMyBTYWx0ZWRfXyP7sof00y4C7
 K5nrnLymFSPjLwUTE7gG1+U3Ui+gKG4l4eobJc51RleNWlU8pGSZb7pk8DE2yWaeLq8/lVfgXFY
 JwLFaS2aRKVxaUo2qU6BpDBgYMQ9dcJLM4Ff6pJhTxx06zMkuSoGeVts8R1rIpj9y1NebqryiPW
 DHsnPGRZCcfrfyA0AYCCSm+RMhq8jowEuyfpMN/WliZqekNzvEpvL+UEBo08hTeoaLUBpmdrQW+
 k2iKKVRamMHYUz8thbbgf8JBTswSLe5VoAA7vGxsN70Qabhppsk1dKagIeNi2TIfeyeS/xrML2D
 BLkN9CZR0qVL3tAFG3doq1/NL81umBSAubdDH/RfwN5WrzTDfoav70zatfIhBh9YN4jQEwBMGXT
 sShSJiIsb5s1o4oOg7pp1aa5fBsC3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120113
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

On Mon, Oct 20, 2025 at 4:37=E2=80=AFAM Huiwen He <hehuiwen@kylinos.cn> wro=
te:
>
> crashstate_get_vm_logs() did not check the result of kmalloc_array()
> before using state->vm_logs. In low memory situations, kmalloc_array()
> may fail and return NULL, leading to a kernel crash when the array
> is accessed in the subsequent loop.
>
> Fix this by checking the return value of kmalloc_array(). If allocation
> fails, set state->nr_vm_logs to 0, and exit the function safely.
>
> Fixes: 9edc52967cc7 ("drm/msm: Add VM logging for VM_BIND updates")
> Signed-off-by: Huiwen He <hehuiwen@kylinos.cn>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index 17759abc46d7..51df6ff945d2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -348,6 +348,12 @@ static void crashstate_get_vm_logs(struct msm_gpu_st=
ate *state, struct msm_gem_v
>
>         state->vm_logs =3D kmalloc_array(
>                 state->nr_vm_logs, sizeof(vm->log[0]), GFP_KERNEL);
> +       if (!state->vm_logs) {
> +               state->nr_vm_logs =3D 0;
> +               mutex_unlock(&vm->mmu_lock);
> +               return;

You could simplify this by just setting state->nr_vm_logs to zero and
dropping the other two lines

BR,
-R

> +       }
> +
>         for (int i =3D 0; i < state->nr_vm_logs; i++) {
>                 int idx =3D (i + first) & vm_log_mask;
>
> --
> 2.43.0
>

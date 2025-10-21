Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ABCBF7922
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 18:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D776310E61C;
	Tue, 21 Oct 2025 16:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HK+8mwlg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34EC10E61D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 16:03:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEVcg8029417
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 16:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qzg1b+V2MbCM40QMIXspKGkDVVwpiA7CintGa6Jk2gc=; b=HK+8mwlgoJU7oTEE
 IbusCqNPwFBls5YLROCvLNL42FPzsYKLQw9ABWRPEkXYs9E5cM6N6T5RqHrPAg8f
 QwDiBvOFF7UA1cpbvYoxlAwrQ0zydK+7I7bfP912BwIdWDwd2TQemy7datWQEqiS
 y6yaYzWGhUkkzB2m+jm2KI6siaQUOXWxwv2WTr3CTSaXoUBn6oJqNhzyYULS5e8/
 6pxeadxX1qagwJ7QR5ScIgplEpMLAWOKnrUvY/QUIhwUZW6HIMcOn/a3lco0Oub3
 kx/2RGyW8YKX+GMOS7Fuyo3TdeSe6qRCZgTM20vtpv8JFpS221v78X9ZSjgFcOpU
 hwckZA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wswnuqwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 16:03:48 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-54bbe14a05dso116635e0c.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761062627; x=1761667427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qzg1b+V2MbCM40QMIXspKGkDVVwpiA7CintGa6Jk2gc=;
 b=O6UbXlex8OPvCYkkgYKXOa1qXhwiMPGj3zu2LDa1yYMnJSj9VP7ClVa0uIimBeHOCv
 lrVTUB86Z42iyyEQ6Jnwm4nEva2MUkBx1ujHGnCDWvFbfENrxGLu9RLMR7uxo4zbDROW
 qwNlwHhhxPJE2Cy0zW/Uu30E/2myE6Z/FZMInAOhMUSwrXqdk+6o3YUFtQDTqVie7ZEp
 3D5UFE2sWVmNYCTN9t4iV99OuXtNoZVuMc3gtGkstgOA1ABgXOA8G/08m1byyIG82W2o
 iCp2SkuojZpCP2cvSMZcDniS3ljLe3DtHDXZo0oRGZfE9QSr8x/ODshrhPC7vX3CrQrM
 JKkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUIN3DTRqGJ3H5s8HByeNCxe5wLHS76vPcvBzK9jvHv/TIesL58JnMoTSyAkXkMyWIsCal4qlF0UM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5oCGL861ayBOTFbM5PfT1HgoECPJkO4eIxk+4waXADWpo+2eq
 9Io002uJBxayZL7M7XN9JowEE2Ihay7ncvn8MqQkD/u4ueIkdYxOK/x0wlJ2KjBPxnD72HGWaYz
 xnCZ5FlK1S35ZJag6L/Wpr16sT99RlxRK/HkJb6cb4mp1rjq0YikGk3ReKFc/90XCCiGv8EN6yi
 rQxOFSjKUWzVJDORWIEyDPeqUGcNhgsR7W+Uy98wiKkGl2gg==
X-Gm-Gg: ASbGncvR0qlfSw5od3DN6eW9gHYeler4QTRLK3vfiioMfDTaM7VZBnoBRuiyDQRK9wU
 xcb1WF0TSjmke7E3WhLrUvI25R2dNeim+GhqGc2R3xFz1RujCsWJWxM2DNOfrDrID2RlACcnbWO
 PrWrFf7cMBbLNYnPYERFckN7MJKXODvnCg1IwthDCURFpz07jtbqskAAlDKg==
X-Received: by 2002:a05:6122:2229:b0:541:80ff:31a5 with SMTP id
 71dfb90a1353d-556964b26f3mr71363e0c.3.1761062626637; 
 Tue, 21 Oct 2025 09:03:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWHrQqbthjaETH/h/MGGEHvgjs3M08A+BTYpH4dPC2xN8sR4xqX3wTWxEEqxRw9eFyTrg6I8gqf+Cg28YZvHU=
X-Received: by 2002:a05:6122:2229:b0:541:80ff:31a5 with SMTP id
 71dfb90a1353d-556964b26f3mr71318e0c.3.1761062626219; Tue, 21 Oct 2025
 09:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
 <a4367373-a0a4-4876-bec0-d8a560244c40@oss.qualcomm.com>
In-Reply-To: <a4367373-a0a4-4876-bec0-d8a560244c40@oss.qualcomm.com>
From: Youssef Abdulrahman <youssef.abdulrahman@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 17:03:34 +0100
X-Gm-Features: AS18NWCidWXI4-Ma4SweG5OGrwWycP4ccECZXEXtreUEwbNh0eAnQ8MazVgXAcw
Message-ID: <CANyhwx2VQocQyidmQ1zi76zLzM8qmC7KTSDEVqRCgp0m19JB=Q@mail.gmail.com>
Subject: Re: [PATCH] accel/qaic: Replace user defined overflow check
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com, ogabbay@kernel.org,
 lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 2_G3g7ahZKV0h728HhzZ5VsI6GXlP7vx
X-Authority-Analysis: v=2.4 cv=Maxhep/f c=1 sm=1 tr=0 ts=68f7aee4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=v055lZ0IC0VJRkRHfXUA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2_G3g7ahZKV0h728HhzZ5VsI6GXlP7vx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfXz6Tk/WgClF+e
 gNAFHhQnH+SI5/XPcOhp5fXmC+0DQuVyJtv87tOZrI0PHniS4sm49huX60il1uChriZRXtynZfY
 h61Un6zF8OcpJJRM/ldNGCcqPHHagoz+GC0nfucAUOafXL4Lszxhrrx2FZz8EXgQ6lOlfDUFlnU
 KpjV4VxxX62RdYG+/RuW3AmzVyHoikhk/e2tmZ/udK6HHpIqGRQp8uSV6sLdeuyrYNW4uzgj9ad
 egwqDAihwd9o89+QgC4WXzJCQbnSqRa04KpRYt83AYRGn+o1NODp9XwxKI2AUjSZYC1qzlLNwc5
 S1NzLrkWTTQi8YNejgY8Pne5SD5Jf65jZ1Tr7BBFzTo/BcRanjGoGNJd4IWfGb5csRhiimmD+D2
 qbv9RMSmHQUBnObzijKbLQcq2rklxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148
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

On Mon, Oct 20, 2025 at 4:05=E2=80=AFPM Jeff Hugo <jeff.hugo@oss.qualcomm.c=
om> wrote:
>
> On 10/15/2025 9:22 AM, Youssef Samir wrote:
> > From: Sourab Bera <quic_sourbera@quicinc.com>
> >
> > Replace the current logic to check overflow, with the kernel-provided
> > macro `check_mul_overflow` in the function __qaic_execute_bo_ioctl().
> >
> > Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
> > Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>
> Youssef,
>
> It looks like this conflicts with "accel/qaic: Replace kcalloc +
> copy_from_user with memdup_array_user".  It looks like we don't need to
> bring back the overflow check, which would make this change no longer
> needed.
>
> Can you have a look and see if you agree?
Hi Jeff,

I checked it out and you're right. It doesn't apply anymore.

-Youssef

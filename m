Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD487B43019
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 04:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC49D10E3E6;
	Thu,  4 Sep 2025 02:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4ZCeWXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7DB10E3E6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:57:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840Non8004993
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 02:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bzEaXoQF+ag+J0SJOs2QiLzRINVuYknBIfuTABhdTUs=; b=o4ZCeWXk7vL3saQo
 rCJrW2+Bd1AfaXntGnvhFqNZV8rNGURkPnyhZ5Afq/+qqbbo1ptziuuxo97Oxr0C
 MKu/WVF8gIdHdqhV6QM7P0fjoYluHGAEfgtV7WbzunVIoImS7eVhB1KuCs0m2R8T
 GbWmdbwbk3hMZjbxq/GcxGXKxr8sTJJE0MxeRYi+1/Dn0sbxu8aAnem7qjuLVbXv
 1I4gehKLWlhJ5AtF9agegWFmay9wknyF6IiqfqYXc1yVByzeKxVN5EQvLhspHc6v
 wAJoG32m5TENZ0O19bjTTVearrKvO0lEJtnGySLhaKRY8b/jl1PwvBWTRpx+bQnL
 5E2pJA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s605v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 02:57:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-329c76f70cbso480861a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 19:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756954630; x=1757559430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzEaXoQF+ag+J0SJOs2QiLzRINVuYknBIfuTABhdTUs=;
 b=ccxAwpKpI5wLwcp4dZpnld1WJ1SRnfUfSmYTLWM9XPVNm+9Aw16LaTMtjy8eUj6J0a
 qnHYqKD+eaKxXcm+g/fhVe3dcvUdQVLYtTHfrCSh/C4LVie12Lvl0gPe5fRpadhuOy/3
 LLFiGus81hhqT/W6FgyvnmR3rMBuP4bTZFCsudMNw7iAr00tfJ7J85/lM5rys6fB1N03
 Msx6KV5LhDUxjEUXzUqXvtndLcPtOEN3mdVAXn0TcxVtPvrTKWTpCc50SloXZLvTruQs
 hT8yWL+RYZAYe2RnKRkKP1WmUQeo8x2TRvKA78APx+RMWZVwDe2cHCvbB4ZroKb1lNyH
 WyYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5+TqJ00t9AjU4h32IE9jqM+iog5aaEykQzre6gXtVgCv49eIjTAh1CQSZAwH2ZyIZo2lG4436HVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwONBmpIzJ95d3h5RFmzxy72crUIYgGVFbIf/BV8y3RXIdSPlzP
 W7fW+595cH6Yh57qZOpOVOrmoHcEV9anY4ykfNFMZS040QmWUfmHfCsI2OwulzbE5x+zCPPoNWw
 ZV2cm59ge2BoDMubfY0DpPtKG+6qjHSOjrB8QOqB6bVfBkmZ7VRoH6kBca0w0QzArEdbI4SBStt
 nQzDI5jpgkT/4EKWKdKnm2gSSTXRupMpczObGfrZKirshvVA==
X-Gm-Gg: ASbGncuK6wgoGLWbZyzG/J6yG2ifMMF7Evq3hc8rJ0KxVcMrjxvu/jbjQN8xx8rodU+
 IiN1fliT57Gs49g/K6G3NkjFdjmKQ5/Dlhb7BwhRGQ7RN/Wl3TSY3keOjUWin4hxexSIW2yzxWs
 0sn7Q8Bp75kkvMjWZVLmAhUslrqDZYpzI10Wx2HYNNqPOVQ80m/jjH
X-Received: by 2002:a17:90b:518c:b0:329:e703:d00b with SMTP id
 98e67ed59e1d1-329e703d645mr10321010a91.19.1756954629727; 
 Wed, 03 Sep 2025 19:57:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOCPdzFNzraiWHbGuHEoBM1QvtTU0Nb0FFJzX0uW97BnqhL/gBuv33SiRgGl4vDEi8Sr3AnsPHLBpMRXmEtAg=
X-Received: by 2002:a17:90b:518c:b0:329:e703:d00b with SMTP id
 98e67ed59e1d1-329e703d645mr10320975a91.19.1756954629213; Wed, 03 Sep 2025
 19:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250903123825.1721443-1-syyang@lontium.com>
 <20250903123825.1721443-2-syyang@lontium.com>
 <lcyori44rm5p35wykk2rb54zbrrpft5c7uibi376jihemkb67w@px3nj72a5hx4>
 <CAFQXuNYKcGHyWLD5hjj24CrbaXzkaKsLU4R2vmhYaryQArA_yQ@mail.gmail.com>
In-Reply-To: <CAFQXuNYKcGHyWLD5hjj24CrbaXzkaKsLU4R2vmhYaryQArA_yQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 05:56:57 +0300
X-Gm-Features: Ac12FXwqpLK0wU-JoT7FAo_2ssmdmZOCvHkhkCqIZn8qnoojkUv60OwC5s_f_Yg
Message-ID: <CAO9ioeVUtmVjdxyykTXysQwdUx8iKLqrsU=yehR-pPtvk_QEFw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] This patch adds a new device tree binding
 documentation.
To: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXwcGcdBXK0pAq
 eN4oXNDG7GlgtKlvq5Wg06S5zyqMKChQQ25OcoD/qmNCgh1bIbsr6rSR3wTW4ghf7VYL6QWBIK6
 0rwwwCKieCRW75EQlOtfhBeoEJeiVnNpKC9JnDb525nLvEwvQjRriAbqX2LCpp/QhAKjhuxqplp
 znnGjd9YWm3v3VBFaQc/ZcR9Mew4CLDBWU2tAinYIJmqfr7Sb8kl8aVvxYaScKoL++Uqg2isgVP
 J/29hlHm0CiZ6MkoX1IEAB64Et6R1svRg7Kgqpctddjg9/NUC6APg7AujYo5TZb8ERZhm+JItVQ
 iGSoBOymvXavY3x/lwQiCPbMMia33VhCaOnXFg1HgoNr8IBW2/0yubxEq1jtX0qTC8R165XrS36
 CcJQ9ARr
X-Proofpoint-GUID: cFUR7Pr7eN7Iv9Z3flQkL9Wk6W28_coL
X-Proofpoint-ORIG-GUID: cFUR7Pr7eN7Iv9Z3flQkL9Wk6W28_coL
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b90006 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8
 a=yqK20mq1EwIQVBnv59QA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

On Thu, 4 Sept 2025 at 05:39, =E6=9D=A8=E5=AD=99=E8=BF=90 <yangsunyun1993@g=
mail.com> wrote:
>
> thanks Dmitry baryshkov:
>
> 1. Please fix your Git setup and use your full name in SoB tag and author=
 metadata.
>      ->  i will fix.
>
> 2. +maintainers:
>      +  - Rob Herring <robh@kernel.org>
>          Are you sure?
>
>      -> I'm not sure. I need to do some research.
>
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=
=B49=E6=9C=884=E6=97=A5=E5=91=A8=E5=9B=9B 10:22=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Wed, Sep 03, 2025 at 05:38:24AM -0700, syyang wrote:
>> > - New device tree binding documentation at
>> >   Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yam=
l
>> >
>> > Signed-off-by: syyang <syyang@lontium.com>

Please:
- Don't use HTML email
- Don't reply off-list
- Don't top-post

>>
>> Please fix your Git setup and use your full name in SoB tag and author
>> metadata.



--=20
With best wishes
Dmitry

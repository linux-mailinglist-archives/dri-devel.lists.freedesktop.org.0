Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FF0CA94D5
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 21:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9926A10EBB2;
	Fri,  5 Dec 2025 20:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMcAOc95";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fq3NGXhw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B9E10EBB2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 20:53:18 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5K26dd1644614
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Dec 2025 20:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UYQU81Y6HLQpXXtuKLRqLyYo
 i+qOhrx18gQgzC4wJlA=; b=LMcAOc95i68EA+FSz5Ad5U66KYVwHQfWGYRnQCR5
 AaDoPGBp97UdjnuT1evFcmQOxipcQ6UqUmJPHk0EpMK+ZslPLGfC6OD51Cxn2AnI
 lL1TOe+rACGupzr0WAb+8Ut5YtVd2uPnBff/slyeCXcV0Zk1OL1LhdordBYmZ4kv
 P0e4slboGpVpnDiBwEhPsVAycuAIaAmLlAhNt+WbJvsh0Fbj2lxdXqHogciLgKw5
 lEDVGxo9UBgC79Pw6SrtL3NewyD5dTIAJ9ObdEv6wfnJHshcg8momHoxkXKQdXYZ
 rj9lantuVa4RC3hsBZquyexr2geIxkLZAeLn2sAx1okTMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av62u03fb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 20:53:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b24383b680so807993585a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 12:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764967997; x=1765572797;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UYQU81Y6HLQpXXtuKLRqLyYoi+qOhrx18gQgzC4wJlA=;
 b=Fq3NGXhwLhy3iixXtR0XN/1XCc2KgODyi4bk0wLcsAFYAP8Go5bFQcxYuUHh9Gemta
 zQxcdwq66cM99wDO9r9z1litcNpNYqWlZSG2b0JZK9vjMeRSs9zoy/C+gn+7ppHfVPcG
 uscWnQTLzQ9Kx/8cTm+0fScBzy7NZ9PQi8bGZm8ibkV7z8wEc3kVU6Odp8dbxYHzkxig
 Tb2IohMGCrNcybv1ZpBD/aR8R17fC6EWJnEdPk4A9g9rnCQt3qUHFdnb6aaahYBjIo9D
 KyfEy6pjEQgeJgNNUSfAjKOZSsJz0VQSt1txLP4fSXv7YK0YDAVtKXgtjn9hy/lk96Ds
 47Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764967997; x=1765572797;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UYQU81Y6HLQpXXtuKLRqLyYoi+qOhrx18gQgzC4wJlA=;
 b=L3J7gCX3pF3U9K8UGzAe/OOLtDVaHNFxAf9wMespFOX9y8k+Ay2N5eZZhBHMGfaAo+
 ss4kmjL2CKffHRnuAZbJubvMd+G7tbfZGa5MaRDark3fB7Ar++zmeABIj9cmBJSoiB1L
 qbtY1I/sAxOpvj00braMTP2wErlnn3E1O8g3eDCNzYJ8goDs99TPQTLZIMHkJ5AU7AU/
 civcrCOYPeTormc1UqEFtZri5W+2efUwfLT6sZPDJ8/8KQC5y5H4YUZAyfpY6fyic8aZ
 AP/t9DAhMhkvM9MCb2kHbh+ufeS82n7CgCs6DvPadIRz8MTPErxyYGJ39PXIByghUOAe
 SBJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLTNaleTaMrucQP1fqDVM3X13dWTenb9uzviuhkSzydwf6A3ti4yu0K3iTTCiA2HbdIOyQF90++oA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6+FCjHByA3Kv0xjtuKDEq7OztaN8E9O3UvaojAp8o5BSPq2e0
 U2+Qsh/jPPBoyAPjQGQ+xAEcFYTEbRgsuVNsCDUO+5nQOpFi1/hQ30pXQl9gmryB+sAWswk9mbw
 W32zR5YfbJNao4f629wF30F5LSTsWydbeR4kLf3ZzhxDKlntE20jYtAvblKRSyCcwadfWlQQ=
X-Gm-Gg: ASbGncuxp2EgPaKCXkxk7Kc5qwFhICX/7grVcDmdpw1TECxNQ1Oscl9ILV1lMlizRv1
 sEBq26ah/t7IzSsgCXrFsRO+MXIYNSdxCyjAxFd03MsAGK4ajBx7hBdeveqoKCEisS7KzILtXEQ
 a01aRwVCSOJ3JSupEhSb3VR2p/hyDs+BAaOGg0RoP843votWijkKiljCqgPVm3FkBwxJozHbSq5
 5Dmn+iwgcUMQPxW7ebv/maO4b8CRJMHQa3qQfOK7XmScGmwycam2PZFi4hLBFldXRiSTzLpjz5i
 GC+sINOtzk3+/V1STR1FiWagIO5G9/hQZ3SUKQrHu4hoKJGkVwDjqGfvX+DhznLoGNsSr/nb6zb
 azB1Hl5rjJjl7KkAADUdwqpA04UHMM1CQ3r3qyuNlV1LdCyKj8B6wKa2sIiW/DvEKbu0q5UZRfR
 uSXKKXCqJl/VNNiisHI5uaHJU=
X-Received: by 2002:a05:620a:480c:b0:8b2:9765:3a69 with SMTP id
 af79cd13be357-8b6a2586080mr56196085a.68.1764967996448; 
 Fri, 05 Dec 2025 12:53:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe1aQZfNJvea5YgqM/l7S+IW0I6k1UQ3u3irgB+qt5cziGghA1+4KgLqtOSq6Ucuz6XlhljQ==
X-Received: by 2002:a05:620a:480c:b0:8b2:9765:3a69 with SMTP id
 af79cd13be357-8b6a2586080mr56192485a.68.1764967995983; 
 Fri, 05 Dec 2025 12:53:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7c1e2fasm1850723e87.60.2025.12.05.12.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 12:53:15 -0800 (PST)
Date: Fri, 5 Dec 2025 22:53:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
Message-ID: <iowdz6u6fw6cmgqkznxxmksz5tufkbgen2k2f2k6xi3fzwa5qx@73jldhd2yoab>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
 <20251204-qcs615-spin-2-v4-3-f5a00c5b663f@oss.qualcomm.com>
 <e8243a84-a7bd-4087-87d7-2795d6bc7595@kernel.org>
 <aaae2ab1-04ec-4d42-afe4-7a2ed00ce903@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaae2ab1-04ec-4d42-afe4-7a2ed00ce903@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lKFgDWYw4c73Q3qTxmAyKssKriyX0aJ-
X-Authority-Analysis: v=2.4 cv=VMPQXtPX c=1 sm=1 tr=0 ts=6933463d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6r3IkYRDlMlQpd4nI30A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1NiBTYWx0ZWRfX3p1ewQYALQfA
 iMEtKmBOSacDdPwuS+zduvq2aBO5WcYoQ8WzfQcT5oe2vkNtHohycCzuEVItV8DCJJZ/DAM8AXq
 ms8ALVy3Tpv94GWc0bLnxuOFcNfMmt8LWpyEnVfyd4vlgPRXpl9BnNOI+IKv4RwjVzEjf9HlUs4
 VapesqKMUTGakn/36r2/E4rMZDZ25BMfKUxK0xsI93juAPjmKGMJd0PNNvBe/7yIBnIlBNyT/7d
 fPe3ZlZh/a0+2/YCpZrgZC70YtzDJj+lTCYG1vnlnLiK0ZNOJ1LvCHpff2D3WeFMjMMFnnC7ECq
 UkhOEjOyNoVa5FbDop/GiUDuPTtK6baNkl/cLlQxGyQANcpiSXAbZWx5Ilvy1mm89Tq6HJr0JJF
 0eDXDylN0J1c5XhgfvzjvINSUqgDYA==
X-Proofpoint-GUID: lKFgDWYw4c73Q3qTxmAyKssKriyX0aJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050156
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

On Fri, Dec 05, 2025 at 07:28:52PM +0530, Akhil P Oommen wrote:
> On 12/4/2025 9:04 PM, Krzysztof Kozlowski wrote:
> > On 04/12/2025 14:21, Akhil P Oommen wrote:
> >>  
> >>    clocks:
> >> -    minItems: 2
> >> +    minItems: 1
> >>      maxItems: 7
> >>  
> >>    clock-names:
> >> -    minItems: 2
> >> +    minItems: 1
> >>      maxItems: 7
> >>  
> >>    reg:
> >> @@ -388,6 +388,32 @@ allOf:
> >>          - clocks
> >>          - clock-names
> >>  
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: qcom,adreno-612.0
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          items:
> >> +            - description: GPU Core clock
> >> +
> >> +        clock-names:
> >> +          items:
> >> +            - const: core
> >> +
> >> +        reg-names:
> >> +          minItems: 1
> >> +          items:
> >> +            - const: kgsl_3d0_reg_memory
> >> +            - const: cx_mem
> >> +            - const: cx_dbgc
> > 
> > The patch overall gets better, thanks, but I think I asked about this
> > already - why you don't have the list strict? I don't see reason for
> > making list flexible and I don't see the explanation in the commit msg.
> > Either this should be fixed-size (so minItems: 3 and same for reg:) or
> > you should document reasons WHY in the commit msg. Otherwise next time I
> > will ask the same. :(
> 
> TBH, I was just following the convention I saw for the other entries
> here. We can make it more strict. But I am curious, in which case are
> num reg ranges flexible usually?

This might be a historical leftover. Feel free to send a patch dropping
min/maxItems for existing devices, if they never were flexible.

> 
> Just to confirm, we should add this here for adreno-612.0:
> 
> reg:
>   minItems: 3
>   maxItems: 3
> 
> reg-names:
>   minItems: 3

I think you can skip minItems completely.

>   items:
>     - const: kgsl_3d0_reg_memory
>     - const: cx_mem
>     - const: cx_dbgc
> 
> -Akhil>
> > 
> > Best regards,
> > Krzysztof
> 

-- 
With best wishes
Dmitry

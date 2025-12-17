Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE3FCC5D25
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 03:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BC910EA10;
	Wed, 17 Dec 2025 02:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NyslCeIn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0YBhM2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E14E10EA10
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 02:49:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BGMR6lA1544524
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 02:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hSr0hfpjiunYgxMiBK9XcZqGRzRse0hnRDW3pHNLDAc=; b=NyslCeInX+Gjk0fM
 u6NoYEZ0FK8v8b8aKBhyYySZqKuOBwgZVv0Yba0c4lDb26EX7e08BhrXTiRPmC+S
 L+5WDCo+eaqR0vo4SP2ABO3z8tiv8Md4Xq/JVzitm3+N2msl9m4vQo7rd2aL/Buh
 gKY7aIU+/cKYS2xuim4nT8WoanoAYbXQSN7qHO1bNUbczIjMpNH8ZDh3KzaV2SPY
 qQ7tjmvIDgZaVDsnmjxWs0gsT9Q3niK4YSy56V7sDUFNWwvz/XkKKusYMI0T+Qac
 L3UmzdPrvE5DOl0btg9HVnxvtXD+KVgz3i2iX7QZD8V4yIP8IWpTaOfnLx7MyAdO
 R5HM8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b366qatq8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 02:49:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2e19c8558so1228127085a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 18:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765939797; x=1766544597;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hSr0hfpjiunYgxMiBK9XcZqGRzRse0hnRDW3pHNLDAc=;
 b=I0YBhM2Ca14T3HL6WQvlNW0gfUSycbsIM/TLkRqiqQK0Q5QG0IZs32vx4GEGn0ZcNb
 AaTakDZ1dFyG3qJqlzfy+0UzviCwnhF+ymfYvKQYyiRwrSC2yTGm/bRLiF5Kq27PZrrF
 N4yEu0+y2K0b8LTHKHpFm7r8xY57P808I9FyCkAIj1LDRYdfbj7NVixBcpaBp3tEsW4b
 FrqeIZIAWXqHBhS6xv8+QPLieYrSiYO8AqgXpUOC1cPPzJ1sr/MIEnx94Huz8CEdBDrR
 g8MRA9DrFb7ux1Edr3MkgSjo28jKDu7ZsSfezo0n9myzp0mStFVoet88QFweF/M/J/hC
 qxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765939797; x=1766544597;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hSr0hfpjiunYgxMiBK9XcZqGRzRse0hnRDW3pHNLDAc=;
 b=QnRW7JoiQopHAPxIujf68GKdEY03hScJa5OrUNI2kfwXrRowR771JmxjI8NAkW5n7U
 8PSZAsYCHjQQBU2O6pfI+Qk3ZXstOCopZbSA+bNuMh1J7TkJJIOjGJ1p8y2BeDoaSqp7
 Jk+uAXw7rabL4jnMBMrgqsg68Ly4xfYUEXIXklyJW1vT6wKxBDsNwwnERZBCFEwd+T5K
 aEFGg7FZm86TgvjItrdGquyFaKWipF1rFlXrOXQXLrxH85Dzevm38rAcT9mJajxy5hKd
 SUXuDD9sX4NN1H1hI42U+nEJa46qva3Y2vSz0JB9AX8uCx2xYHucNWIk3HcKWr4NbkVg
 /NSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQt1uKffWySqsgoarSNNAyEqVN/AN4/meZUtXkGrVQyTJjKXes7mq9KMZE2hTJEY5BA3ZZJ/jJVso=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwALdVlb4t3Fm45r1olVycIeQEMkbklczOUOa0auKIWA8Ep9Iu7
 LSDZHa/6ZVZIwwP4CMChgiS2FcrP7UKpy0/T1+Y3a/bcueftT04QMufTJgni6HRMPvEMdwspXeD
 LZcQI0D6TIDK0ZhK3V22jqd7TheH5IiSbVQz6E2UipEPIGiinh626CUGLp5nfM+yHMsyC1Z4=
X-Gm-Gg: AY/fxX6TdGXwP+nV3WIn9d5uGuXU2q6/qaJo53ttT+hnc6wzPHifnKHVZdlAr+Gy32C
 YLkMk1ob/LUdETyK13ho/vQlGA85SvOrq9g92K2RSTiOeEHUYW2+lSvP0ovsFDl+T+x8zSLaoXs
 eKJMcV1NpatZ/JGu2ZPWRDO7O6/Pe2qG3sLD+JiN4Fzyebp4xEqxn+e8zBhko9AHmfYFcZ1TlPJ
 LNRSJZpBYNpgi9ksqlBTvPJT3KmmocF3QMNDKn+RP6XUbGZpLEyh3Id4vMd/rxteB4eDgsGP0UE
 LVg9z8GeZT8IIqRHmorgOwvuPUJv+NVuyn4wEIde9jY6BNVu/jGgMFL/fnWxOznD+oAOfFFGa4i
 QWv2qHiqRTFdQswXn/YXoUx+Qx1cFTKazsffvZU9ci+bo0EQ7KLMg9zO1ozJQmllIhDLKFTo=
X-Received: by 2002:a05:620a:191b:b0:8b2:4383:b3d7 with SMTP id
 af79cd13be357-8bb3a39b8d8mr2263082385a.78.1765939796893; 
 Tue, 16 Dec 2025 18:49:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2V4Ak+bxZ+9N52X69IaSlBoRPk/4ZmPd66syl4awFyKNhqXPj5s78LJaDXi8BFnuENUUgfA==
X-Received: by 2002:a05:620a:191b:b0:8b2:4383:b3d7 with SMTP id
 af79cd13be357-8bb3a39b8d8mr2263079485a.78.1765939796376; 
 Tue, 16 Dec 2025 18:49:56 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8be30d8a158sm312944485a.21.2025.12.16.18.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 18:49:55 -0800 (PST)
Date: Wed, 17 Dec 2025 10:49:45 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: yongxing.mou@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 konrad.dybcio@oss.qualcomm.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 neil.armstrong@linaro.org, jesszhan0024@gmail.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, linux-arm-msm@vger.kernel.org,
 lumag@kernel.org, simona@ffwll.ch, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, abhinav.kumar@linux.dev, mripard@kernel.org
Subject: Re: [PATCH v3 04/11] dt-bindings: display/msm: qcom,kaanapali-mdss:
 Add Kaanapali
Message-ID: <aUIaSVObQJCJH9Rf@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-5-yuanjie.yang@oss.qualcomm.com>
 <176579137354.1486530.823295322686100207.robh@kernel.org>
 <aUEG3TL34CM2V5Z+@yuanjiey.ap.qualcomm.com>
 <CAL_JsqLR8e4FND5LfAVB+cJDMiFpgBTKZtpEDDQiuQfGJu2LKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLR8e4FND5LfAVB+cJDMiFpgBTKZtpEDDQiuQfGJu2LKg@mail.gmail.com>
X-Proofpoint-GUID: WyQgPj3S-GbDJbWyPn8ASd99y4ITLvMz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAyMSBTYWx0ZWRfX2eACIAf6d3DP
 ODlbQALsFv/ovOqqCDg1siIZ0krvcQBZiwBDfHp/SVNYSpvCDKw9HGMID4zRdTqIuydJQDXDdbY
 FaZe2Zn+fFIRibrpaSsuNzaZ+hbLSbR+hZ0w8o91pTSvYQNvlj2nvma94MHQMa/pjgpaEG7NQkv
 yqWRw3oX9iq2GBruOUSwwp6fy3rHruxvT6AcMuFu8BM/YxcusPSlQz63Mpz7M86JDB+L1N7S2ud
 eMqLvu1XDRgJv3WndRrHl5bvM9LgBa0YXOqadhD447/ci5mRftZbfwezdavq8AESwPXZenjMODm
 e/rFmlMAcq7PdbmMDEzWfcA26LaqheRDNryBkIRaD5XdF15halR9RddM2enCDFZ1rz09jym1ph3
 ymzsGJ5xr9zkkI4vOrT2jE7+Xer1Ww==
X-Authority-Analysis: v=2.4 cv=RKe+3oi+ c=1 sm=1 tr=0 ts=69421a55 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NpoKe9w8x2AnCwLKvqIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: WyQgPj3S-GbDJbWyPn8ASd99y4ITLvMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170021
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

On Tue, Dec 16, 2025 at 07:11:19PM -0600, Rob Herring wrote:
> On Tue, Dec 16, 2025 at 1:14 AM yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >
> > On Mon, Dec 15, 2025 at 03:36:13AM -0600, Rob Herring (Arm) wrote:
> > >
> > > On Mon, 15 Dec 2025 16:38:47 +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > >
> > > > Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> > > > Kaanapali has significant register changes, making it incompatible
> > > > with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> > > >
> > > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > ---
> > > >  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
> > > >  1 file changed, 297 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb: phy@9ac1000 (qcom,kaanapali-dsi-phy-3nm): reg: [[0, 162271232], [0, 460], [0, 162271744], [0, 128], [0, 162272512], [0, 1024]] is too long
> > >       from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
> > >
> > > doc reference errors (make refcheckdocs):
> > >
> > > See https://patchwork.kernel.org/project/devicetree/patch/20251215083854.577-5-yuanjie.yang@oss.qualcomm.com
> > >
> > > The base for the series is generally the latest rc1. A different dependency
> > > should be noted in *this* patch.
> > >
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > > date:
> > >
> > > pip3 install dtschema --upgrade
> >
> > pip3 install dtschema --upgrade
> >
> > After update package,
> > and use：  make dt_binding_check   I see the same issue.
> >
> > but use single check:
> > make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> > I don't see any error/warning.
> 
> Because DT_SCHEMA_FILES excludes display/msm/dsi-phy-7nm.yaml. Soon
> (in the next linux-next tree), you can do:
> 
> make display/msm/qcom,kaanapali-mdss.yaml
> 
> Which will test the example in the specified schema against all schemas.
> 
Thanks for your tips, will fix in next patch.

Thanks,
Yuanjie

> Rob

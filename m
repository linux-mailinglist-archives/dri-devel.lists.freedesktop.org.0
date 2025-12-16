Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA2DCC142C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 08:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9AE10E0DE;
	Tue, 16 Dec 2025 07:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ohs9IdXq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Do+NqdJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8077510E101
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:14:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BG6nMRq2810462
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Am0uuG/SMaWGn5BG7PqsVygZOCHB1Fc3JGgHjjK0254=; b=ohs9IdXqsQ7uFp7R
 5cgS6Qs3b2tYXCPCmtLqZ62d2MTEeeX/hjz0Af420poHabXs9qRnAcMJqHJzSpwm
 F7/B57jfmAevd6ChvNCjGMSbJwS7vse6eSO4q2PPuT/KWF+fQaIko6Fxau5rY3EW
 dz9tlnJm/eTzZMzQhjRJU2pG4x8z4N6akHPqJaaFDDy4gHH/j9d3xQArUTTq9EP9
 G+kBwZKhpMTIuegC+WN9Uv4OHgrcx4n/pWfMprzW2yZdkC+gHUSQVYNGNI/HpKsx
 myZsRD4bJ5uWbfOx+6QIihlDhmwgmwVevJNoprVG2NG5hiunxbX4VVwKMsK56yhh
 oW2KZw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b32gar332-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:14:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a344b86f7so63217226d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 23:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765869290; x=1766474090;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Am0uuG/SMaWGn5BG7PqsVygZOCHB1Fc3JGgHjjK0254=;
 b=Do+NqdJM9MdVFpaGK3u8vFNqYru4CgoDnp92/H0YU55O24OpieLz0JX5EtSDK1CUVG
 Kt+3R9wdAXwmYs/Hlj+I/H2bLDLdcBOytvM8Ch62bpzUrl7tdrIjrSkrbRH6/H2quoMQ
 8ZsUUlTXpXgn4jLNL83e2sAvbldOoXnJleWXsj9WYfOGLSQp6lJMFPD+daaRLBF3FC/M
 pBBbi2QdLa5IXq5hzk2PhODIBFRX4OTQZ+FuRVgQGLeLqF6j5phfnsNbJxi5rwP6OHoA
 DolqUAt8x7YbMeMbhEN0/UjTy0oDwWCX6rTk+IHrEnDrGm5ApQ1fVilw64nkLVuFIVdW
 P9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765869290; x=1766474090;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Am0uuG/SMaWGn5BG7PqsVygZOCHB1Fc3JGgHjjK0254=;
 b=sWJ3H6KMRcCQjAsLTb0GCqopQLjMzEEa+LPFz2YKG7hQdrWc9KZmVmSMgC2F8jElmM
 c+yqFCa++7h9LysRJiiiVGhe3sO0elxW3h3g9d61g4ZiPYoE09SpvI0FTVeMT++fZTEt
 VYtig0Nav7z53hNvb/hfQr39K+WQqwuBpS+D2+U28MGeh5hP2jQ54wnVsmY+jTOXiFVP
 jlUbtUnsOd3dtF3wM0N1ZgT92kvzIsBb6mQbTAi+muc1MEfrCIv87aiQDEh7PKwkPBlL
 QJgJLazX1g9aMH5TH+UMd9RkBQovunN/h0RtIpSxlqTEa8tHxfCBhvMppMOd4uXlyzyD
 QfQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVJpNOr2ZYpXkoH60ubCymjI1ykmjl0o+nxHhiQbIohCJZxfYzU2b4A5meKCJnQfu2WBWV//WLN04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxGK4JLWV0RQFBo+pgfeeWZNs/grIiv5bROrrUl3E1EmHS0thp
 EqjTrgSRvfic3Q3j8qN/bse21GNpGWtpqOLQjh2TX8TvyiTrz4FjnGj6iiKhk7AXHk19fYqwmPD
 +pwGXzBRBjPM4ZegRiwAXRJHrv4CnQcye8Z1Et5qpPhPSHpAyeXUw+1OCu/5LlGe3y+hL7uo=
X-Gm-Gg: AY/fxX5VYRERebEOaaGFx1DaAo8wteN/0TvJ7LDC83g2kmS8vj5P2S6X9jGfEqfOwEe
 k0hn2Zr2NCTNUne0ICUnCH+eArm2EWz1h1pUofE3HI2uASQUdMNIoMSEU1bKArRHVPxY2VVAdhZ
 uTYK3cBR/6zp9ZnMd5lE+EoFYC66W0FTOcloMIpaT+uQSejITsItilLj9Sb4jQpnGCuJjCSvDGE
 QZaXGIxGwqjz0306ZVYu7W7+fknHYolrQ/ABaljVR6mwV0A7nMTFHJAJPry4IiLs5SV/zvYP8Oj
 nD5mrCB50H5WRjTkgZO77F3r9gL/LfuSX3Cd6u96ng+iYxQ/m2B1NYuhDtZbQ5ST/uAgqyK8hsU
 u5lSKoYiWvMDh5qJrEqCp3QKBVKmuhApHHAY5Q2/mql++Pzxvcu5OvC013yj3nl6BC9ja6NA=
X-Received: by 2002:a05:6214:2e45:b0:882:7571:c012 with SMTP id
 6a1803df08f44-888801cba45mr175118106d6.55.1765869289741; 
 Mon, 15 Dec 2025 23:14:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2lJX1RHdL61KthpwkRgPaivxdvAcRF1rHNtkwmJXCWmk9l44q+8qM2lkJENhb3atu86mA7Q==
X-Received: by 2002:a05:6214:2e45:b0:882:7571:c012 with SMTP id
 6a1803df08f44-888801cba45mr175117936d6.55.1765869289243; 
 Mon, 15 Dec 2025 23:14:49 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-889a860ce52sm67808286d6.50.2025.12.15.23.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 23:14:48 -0800 (PST)
Date: Tue, 16 Dec 2025 15:14:37 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
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
Message-ID: <aUEG3TL34CM2V5Z+@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-5-yuanjie.yang@oss.qualcomm.com>
 <176579137354.1486530.823295322686100207.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176579137354.1486530.823295322686100207.robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=Vcb6/Vp9 c=1 sm=1 tr=0 ts=694106ea cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0awkmHLjsCMGZ7zvgVIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: jJKbhgTYVHGHHwnnTrpXt_YWnZAILoc_
X-Proofpoint-ORIG-GUID: jJKbhgTYVHGHHwnnTrpXt_YWnZAILoc_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1OCBTYWx0ZWRfX0rpkrRgGHJmk
 onU4nJfDhq1i/J3bGYY0pzRohlRHOGJ2su00cqKpPcHJHfmqv3Y8F/fGeT0GlxqoHILeiF30CMB
 SY5S6LQNUCXvweBXEpzHpYe9S3JaPNKC3lRDqaA6HJqLSwCWCk9MrpFY7gbmmfz9nIqUgmmgc0Y
 o1hrM5ygaCJbKW15jtIBcDnSK/NP5hE3l3i8Dj6VT4DzURXaUupZKFB0tympqD+vMA91XQzSuBJ
 1sWIKMs/LqTEFq+WykMzHVCxtd/AFtyTJqxFi8BpV5xagmoPL2OE7Jdn7E0Nhf+tjNzsbST4W3M
 xtF1vdfLrNSmqqVn6oeS9N5Ibq6wLpqHDuaKO5AD3pCOr9PKDJWTFj5DqYn9BuZc80I98wWTxix
 dvzxWryAsu5IHrmiST9DC/bUdH1jLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160058
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

On Mon, Dec 15, 2025 at 03:36:13AM -0600, Rob Herring (Arm) wrote:
> 
> On Mon, 15 Dec 2025 16:38:47 +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> > Kaanapali has significant register changes, making it incompatible
> > with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
> >  1 file changed, 297 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb: phy@9ac1000 (qcom,kaanapali-dsi-phy-3nm): reg: [[0, 162271232], [0, 460], [0, 162271744], [0, 128], [0, 162272512], [0, 1024]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20251215083854.577-5-yuanjie.yang@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade

pip3 install dtschema --upgrade

After update package, 
and use：  make dt_binding_check   I see the same issue.

but use single check:
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
I don't see any error/warning.

will fix it in next patch.

Thanks,
Yuanjie

> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

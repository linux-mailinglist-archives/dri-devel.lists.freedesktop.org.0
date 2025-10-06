Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30C7BBDD84
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 13:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B354910E430;
	Mon,  6 Oct 2025 11:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYySjokl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F046310E430
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 11:19:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960WCTV005144
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 11:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VdDqFKfxdRsbEFQxS413xAtJ
 qLi/JD9yGrBIZt2nS7s=; b=eYySjoklVWJC6duqx1BCPWech6zXZkJGteyG1R0R
 F1SyG0UaSPXs2G4MxtfhWuwQNlRhV8/L4jS6259QnvLqYwJ5RrbQVRE+1J2xs4l9
 fo2uIYEY7w4x5f1G6iw/Jsy1Nf82Dyc6fnNvBaRsMXGuF1fLDlOm9kwNmBTpDKnu
 +ddhfD4Ago+27S4gmjqrkqIzR5ONiaSkmRM8sNpUNw8dyF14Q+ddfa9/mkFsKJDd
 JtR71cUpaEnTqCwb6rLZ9MOPQybt6a6hcGkVCGxAFdQxukCJ18CTzpxbK48DDj9R
 Z50k+TLpBNxJBWSoe363k+fwNvcfWRsku0jTOgWDIOxNRQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn3wf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 11:19:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4db75c7fa8dso116776931cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 04:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759749568; x=1760354368;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VdDqFKfxdRsbEFQxS413xAtJqLi/JD9yGrBIZt2nS7s=;
 b=Fs5FA3fEJ/0yd/J2wtyqkE6mWYcXPlgEZ+NWPR7PjqCLvauBLpOX1Ot8HtHOr+UvG/
 rrBfK04glIhQqwj2xbETeAZEUNoJufyx5B3QbmAN6+9rNFsKGc8+E2SqJ/qPSWEXMAdR
 dB54lMBCJEZinymQsOyo1QfakLtWWs/jxmgLnmJ3/4CnR9lqodtjWao4XpsyU1jMC+Ja
 XB7jHuHjV3WomhsZ48qj+Hn637PB3UEtgtGK5qmb9zhSzvSRn2VPMktEuJf8Puh/lwId
 Gk/RPzwyh8IlRAU8wFBQ/M3HBGiY7DDPskESV5zI0qr5F5+anYw5oVZAvxbhjyZEvWZ5
 Qw7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCULBiHxmkgvQ/CiU7/fey30EJ6LKar5yY1KYfy8KDDCKMFcxCFqVKDcga6XEqbWzwHWr7pzRBHB3y0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR+ozd90LhTxFqAHX0L50pnAoU1kUuI2qjlNVDmFEyqfQjwhuw
 aXc+9sgXlBT+S+9ucTzBaYnkqPPTalK/gLxxrPXxfThj0SB3JNMYwxlG3hSVQQVrT6XcsJjBDPS
 IPzMvtmMdLEPYzEqt+6ZOpIsCoCqzYRdfFmq6QnfrsUr1E1CJNvxa7VtKSwchAJViw4/jApM=
X-Gm-Gg: ASbGncsY2SYxdwLYDTzqdbtYC/Mg0LtTHB6aN4XqAl/MxTKK3OdJMzh60y5Wxq54hUd
 90hxwSsfemtkjcgZn+ETtfcMlsmn2ZYaEoevaRWb6vPnEKYtpqzu2/1j4AdgnkGGPX9FEvkpPmc
 b1n7z2QLH4FWnvLZ9n3aE+dGXhnfMQQ7cuXsyGCWK+n0mP3rTe8gKFnFSvBpgOgZjhv0LfMnD63
 jLB0Fzl82PGUKmJ0Z2WnB+R66x/xmETz3a2iZ9FrL9j/0bDLvFhL9s3e0oIKwJc6Psswn0nNz64
 N05gUyyyyJ3LrVo1eaw62qo/s3hqZF9kSI6rQv0CGVl3WNhFhIponfWs7n1asZTj9jyXTimYUja
 iYbYdtkSTEAz6CnlBgRWpBMy+F3agEoH/DxRg7qFpLek4jMvujdttpxR2Gw==
X-Received: by 2002:a05:622a:4085:b0:4d9:3bc1:1404 with SMTP id
 d75a77b69052e-4e576a297damr192482841cf.2.1759749567392; 
 Mon, 06 Oct 2025 04:19:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6z3fr6lPNiM8lZwEQJjps6GoE5mipREKT0DxSIXFLLzmU3vusYTO80+hqG4PsU2cGm+LQqw==
X-Received: by 2002:a05:622a:4085:b0:4d9:3bc1:1404 with SMTP id
 d75a77b69052e-4e576a297damr192482121cf.2.1759749566744; 
 Mon, 06 Oct 2025 04:19:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0119ee99sm4958551e87.106.2025.10.06.04.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 04:19:25 -0700 (PDT)
Date: Mon, 6 Oct 2025 14:19:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cenk Uluisik <cenk.uluisik@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
 Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: rk3588-dw-hdmi-qp: Add
 tmds-enable-gpios property
Message-ID: <c5kwmvu3j72evbgdmjn6qn5nqx7ywbiwpzhnpeh6hjjhbz5vwo@jpe3onblwhmy>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
 <20251005235542.1017-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005235542.1017-2-laurent.pinchart@ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX5D9yEmnwOgW7
 y1tMV0Ass5VXsi7/YxY3gic232F1PnYjXfb/LjD04JXEAguMy9QWG4arioWREJ0ewBtXAa+qP1F
 +gAPBcZlpYFMkJYSGvijIr6x2vcW7JE3NbVgYmpSEYYRGNUQibbWr9mlTFOYALX72di4Cxm+Jr/
 eXHsZzIIukg5gzBgA9S2C4uJOPAHcC91FywdgEAl+BBTMMilNfOGjoA/WZArSZdbQS9wK23rAlM
 QDWDjGcDHG5CLRKDU28+Sc6JXAXRO+cAKWaDkd+eT+ndRkIVfUIJF33OZEsgUZWW4vFjqF9kU10
 nsWMtlk3uLz5ZpR86mQ4+Un1rbHhix5c86P6aP4RTrlibGGDy+E6btmK0XJaukeJJL91W4GguP/
 XGHfmYye7wOzalPH1gfJG66BBZRQ8Q==
X-Proofpoint-GUID: O_A_uiv3IUWWqzXoJg7y5rqv91rpybdf
X-Proofpoint-ORIG-GUID: O_A_uiv3IUWWqzXoJg7y5rqv91rpybdf
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e3a5c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=QX4gbG5DAAAA:8 a=P1BnusSwAAAA:8 a=V0X8aylG3EXbbglEqaoA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
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

On Mon, Oct 06, 2025 at 02:55:37AM +0300, Laurent Pinchart wrote:
> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> Add an optional property to RK3588 HDMI TX Controller binding describing
> a GPIO line to be asserted when operating in HDMI 1.4/2.0 TMDS mode and
> deasserted for HDMI 2.1 FRL.
> 
> This is used to control an external level shifter for HDMI data lines.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> index 96b4b088eebe..eec0d40c91ea 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> @@ -113,6 +113,13 @@ properties:
>      description:
>        Additional HDMI QP related data is accessed through VO GRF regs.
>  
> +  tmds-enable-gpios:
> +    description:
> +      Optional GPIO line to be asserted when operating in HDMI 1.4/2.0
> +      TMDS mode and deasserted for HDMI 2.1 FRL. It can be used to control
> +      an external level shifter for HDMI data lines.
> +    maxItems: 1

Just my 2c: since TMDS is assumed to be a default mode, shouldn't this
be a frl-enable-gpios instead?

> +
>  required:
>    - compatible
>    - reg

-- 
With best wishes
Dmitry

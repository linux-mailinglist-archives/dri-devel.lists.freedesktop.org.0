Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJZOJA/+l2lN/AIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 07:24:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2B6164F24
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 07:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B6810E1DB;
	Fri, 20 Feb 2026 06:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yzm9KJiW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYhJ8Cys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C1110E1DB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 06:24:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61K5SPGS3864200
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 06:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=I8V20AH9DivawdN2WvBcTWCf
 zrYOSe1nOSQ/HpoI7LA=; b=Yzm9KJiWcACzwaN9QsvBFZ0KsMe107c3NEUe9EKb
 W48Vg5hl8glRl1tSaHcSPeXceWS3lJSOZ5KIizX2KVqW4YfTshs5vwJyXNIZvhM2
 xaajYwtpAWscn2gntasa/wcKdJ2zeIAF2ZYs65WQto4nwgkZO9utr6wV8aqhTZM7
 vSp3YiBOJ6PXcRxZ2N+2T+2+DLttrLjaEtAPZsXcw3mBAKprUqbm15RcE18nsIoZ
 Uu9MtCjamQ1G7dnW3DY58G1rNYE/JFuATcbe3hrOtA4L98PHhilS3ZwcQ3C0ZnFL
 jgUBC3yFOXBaw1OggrsE0eOWXa1Opu/3WJAvMmyg2A8z0A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce2ghtv5t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 06:24:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ab03332dadso9244475ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 22:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771568649; x=1772173449;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I8V20AH9DivawdN2WvBcTWCfzrYOSe1nOSQ/HpoI7LA=;
 b=UYhJ8Cys7CSE7saQMIyImqK5pWp+bDro421WDITJ44STT+7zP5oMQ7fkIKiaczp/Uz
 S7BguNrgderGalUSbIgckWmrl9MUZRC6pN52SXW0+flQ/PHriTjH6dAkqXybDPXvbKAm
 fasGcJHyw448oHdJ9DZeIolCVhckweWffHbpX6FKD9d3VGbdZ9ZmzbQ/vW+Vj4cVsQyo
 /thfN4rUXmjVQm9XCIHT6elvRC5dXiry3uM4jEQJysnWgDhJPQcHn87r3ICMRtavZlT6
 bFdSKM9kgeoXDcSRbyo2bGx8uYYkF9sv5mjDRjs2QaMU8/5W5yGFVVSlbmwIgR60Jfjw
 pxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771568649; x=1772173449;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I8V20AH9DivawdN2WvBcTWCfzrYOSe1nOSQ/HpoI7LA=;
 b=MT87LddSm4xtQlMadHfL06V9hH5DVOyxZ2gbuL6HV4UWS9Zx+Fec5rpjSkKQEcrUEn
 sdgj+EzKyhiTBSLVUJpJPXhn8JQ2vIEl/gDgRKH8wPtrfT5BsU6Mv7U5duI5Ayv8FhtB
 1s6TrLt0RNCVdWKGHnx8BykG9NtbMh4okLRR9J9nj6uDJRjdBiciL9mj4mU3ieBeWivG
 q5HyA1PPq2Eh/iT8GpBnzc+SKLFzpjyvJF5DPiVIMQxr4SxT2GeB19em4Hkotim6LnbV
 PSG7tny2l9O+HvxG6kpSLtZYou3bKATK7H0mEgjh9fRfn8iacoowngiieQ2UbmB5JUJG
 CT8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9FzfoZqaHro39+T1w66urbti7SsUwANentUebm/W2ivpo+zSomaV8ViTniZCHhuii/IfQ3CfOEDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH+bCd4BJ2SCLojpuyzzWPcYvQPEb48kvmCvkumMVD3TyACz57
 aACPtCKq8Aq5JZCOgw+Lv2xSQrkJTwqMox15NIMYTH1piQ4Ruc6RqXNvVmmAFpQcrVGBSdazgWS
 sLSc65JvJTw1gtBEnNCCEoPdbYZbWRZrneeqybgdzMzwWOOmf+gXUlNt93t9nhInXmNo4Rlu38W
 RHJWY=
X-Gm-Gg: AZuq6aIQJKnvo6bdR/Fxlt8pv3sgMXzB391Oxe+0IEqTSnumTZJ2qe46TCaxV8wWmqw
 pxBLD4h7nNhKFLdEW2q4jYpcT0Z5+RMYhRaR3qx3P5VA/LfsQX2XOkTb3ws/1bqTCWgzPc/hoty
 k+MK9uFinp+FpETbVHGVhn0H2DWRIV05GtX0VlDCat+HZs+wWpU9W1Qa75jV0aXQ65o3xfFeq9z
 Jn1NDglO93w8aaGxFKyBIbq6JsUqQBg8cZ8iVqDsL6l+NCyKBwu7atQroby07lXa1UBG6qHgS5W
 cF069ROJ2AUrrScfnsOSUC9U8X+l7xDSoaGg05AlAhqpNQlifQOFdlL5ujLsPqaNywDXjyI5HH7
 aA6ZcYmRu/CG5P1xrpeFE1Tsu12zuANSVKapz7zRkl7ks3LgIgAmu3jr0kH0Zyc8cbMc6EPsPZ/
 /1VcbdOma5wCI13bGtnEuCUfulTA+JsCxOISz1jVP6oA==
X-Received: by 2002:a17:902:e785:b0:2a9:5fa7:3d9b with SMTP id
 d9443c01a7336-2ab4cfd5202mr169705255ad.7.1771568649228; 
 Thu, 19 Feb 2026 22:24:09 -0800 (PST)
X-Received: by 2002:a17:902:e785:b0:2a9:5fa7:3d9b with SMTP id
 d9443c01a7336-2ab4cfd5202mr169705155ad.7.1771568648755; 
 Thu, 19 Feb 2026 22:24:08 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a73b0fesm183300375ad.38.2026.02.19.22.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 22:24:08 -0800 (PST)
Date: Fri, 20 Feb 2026 11:54:00 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony <syyang@lontium.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com,
 Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: bridge: lt8713sx: Add bindings
Message-ID: <aZf+AJrEKTPs8nRn@hu-vishsain-blr.qualcomm.com>
References: <20251228-lt8713sx-bridge-driver-v3-0-9169fbef0e5b@oss.qualcomm.com>
 <20251228-lt8713sx-bridge-driver-v3-1-9169fbef0e5b@oss.qualcomm.com>
 <ua6ewpauwabzyf4srnawqz6znsvrzkkl75zwqhpxk4ltdnzvj6@dkntys7skfan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ua6ewpauwabzyf4srnawqz6znsvrzkkl75zwqhpxk4ltdnzvj6@dkntys7skfan>
X-Proofpoint-ORIG-GUID: Usef3zW5HBjpGPJG-71N2UgwmPCq9gsJ
X-Authority-Analysis: v=2.4 cv=dqzWylg4 c=1 sm=1 tr=0 ts=6997fe0a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=i8Grg5fijvnERB4Ir38A:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA1NCBTYWx0ZWRfX0sjmNvf61+Ss
 d5uMpxlWnWeREvhve/Ws9tO+ZRZ8gM5gow9FDvypQfII2HXeYa4qUVFVnsQl67LlLf/XY80oeAX
 7wy8nMfKgn0Z08XV5NEFN+G+D0G2tQcQHgjbBGoO5eF/xnGcJTTf61pQJ8slcwTEs27/hmSVU0N
 kwhImO8jqB4s9wNk019KZxnk6ysHoEgM7APe20RgSvHhlkrnppXHBwhFpdRzvM6Mt6sZy5p1n58
 IZXUVV4SOPfrye3SA5aOTiymBO58xJ2uQZtKsH8MCGHEXFkH1QVjy0MZBe59+yZIVfQKLoWM9wF
 vGnz0FNon07jUP0ApcZDXuM3SqqZKcMgvXRmc9Qm81wjeBV7f4+vjQyF3ULVQ4vnJDJPuZGu8tL
 /Z8AnZSIMn25zuziv1Dbk23O3pUyZLhKHYNJKxSnn4Je4PwkDmrbeAkquTrei6uCIB2KswrdSKm
 Mroo1fhs+Wstsyoa18Q==
X-Proofpoint-GUID: Usef3zW5HBjpGPJG-71N2UgwmPCq9gsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200054
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lontium.com,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:syyang@lontium.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prahlad.valluru@oss.qualcomm.com,m:vvalluru@qti.qualcomm.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,hu-vishsain-blr.qualcomm.com:mid,0.0.0.1:email]
X-Rspamd-Queue-Id: ED2B6164F24
X-Rspamd-Action: no action

On Sun, Dec 28, 2025 at 04:20:46PM +0200, Dmitry Baryshkov wrote:
> On Sun, Dec 28, 2025 at 05:10:39PM +0530, Vishnu Saini wrote:
> > Add bindings for lt8713sx.
> > 
> > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> >  .../bindings/display/bridge/lontium,lt8713sx.yaml  | 101 +++++++++++++++++++++
> >  1 file changed, 101 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
> > new file mode 100644
> > index 000000000000..0a6dc56e337c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
> > @@ -0,0 +1,101 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/lontium,lt8713sx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Lontium LT8713SX Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0/DP++ bridge-hub
> > +
> > +maintainers:
> > +  - Tony <syyang@lontium.com>
> 
> Is he/she aware of this?
>
yes, Got the confirmation in email for upstreaming. I will add him in CC in next patch. 
> > +
> > +description:
> > +  The Lontium LT8713SX is a Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0 converter
> > +  that integrates one DP input and up to three configurable output interfaces
> > +  (DP1.4 / HDMI2.0 / DP++), with SST/MST functionality and audio support.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - lontium,lt8713sx
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vcc-supply:
> > +    description: Regulator for 3.3V vcc.
> > +
> > +  vdd-supply:
> > +    description: Regulator for 1.1V vdd.
> > +
> > +  reset-gpios:
> > +    description: GPIO connected to active low RESET pin.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          DP port for DP input from soc to bridge chip
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          DP port for DP output from bridge
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Additional DP port for DP output from bridge
> 
> Why do you have only two output ports here? The datasheet documents
> three ports.
Currently using only 2 ports in rb4 main board, 3rd edp port is in mezz board.
Will add one more port in next patch.
> > +
> > +    required:
> > +      - port@0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        bridge@4f {
> > +            compatible = "lontium,lt8713sx";
> > +            reg = <0x4f>;
> > +            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +                    lt8713sx_dp_in: endpoint {
> > +                        remote-endpoint = <&mdss_dp0_out>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg = <1>;
> > +                    lt8713sx_dp0_out: endpoint {
> > +                        remote-endpoint = <&dp0_connector_in>;
> > +                    };
> > +                };
> > +
> > +                port@2 {
> > +                    reg = <2>;
> > +                    lt8713sx_dp1_out: endpoint {
> > +                        remote-endpoint = <&dp1_connector_in>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > 
> > -- 
> > 2.34.1
> > 
Sorry maintainers for delay in update on lt8713sx driver and dt series.
I was on travel and than went on leave for a couple of weeks. Will be dedicately work on this now. 
> -- 
> With best wishes
> Dmitry

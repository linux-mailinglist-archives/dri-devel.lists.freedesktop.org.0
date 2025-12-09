Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710A8CB1594
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 23:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979C710E555;
	Tue,  9 Dec 2025 22:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iy1gBp9Y";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMtrTpoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0995B8876A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 22:51:07 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B9MlT5u837402
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Dec 2025 22:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QEQMzl7vqNIap2ByUNZYi+y3
 EAq/MDWdLePRuwHVOoc=; b=Iy1gBp9YC7bM+9rD0CFVoQcnDIzWXbZb0blFrH/t
 OzDmsj1dZ87Z65SyzJ8fwsvO+e7F23EqzgLhF1bKfhkCs0PvuG+pH3dMfDJb/hZr
 AYE5MX/cD3Iq+fmo8pscBgEwRWDpViRHt4Y6C+hdclZGYc7SH3Y7RUu10IOl6KKj
 qLYEfxo+AxUQt1xfzUkhlpuRwlsz64jozRnDV6UPJ8oXOLrimgUgOnb7kVPrCfUu
 X+5pTC2SMz0wJvGqs5UKD9gxyDOzxgKV4IVwXdFTzkUxfhKrL0LWaSurr51K5QJV
 eFTgtw3tRMGweJve7sYm9Y80dILNL58CeM+AGafZgRiLXg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axrhm8t3u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 22:51:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee04f4c632so105230671cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 14:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765320665; x=1765925465;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QEQMzl7vqNIap2ByUNZYi+y3EAq/MDWdLePRuwHVOoc=;
 b=TMtrTpoVQVcdX0n69LpNQ3ZK4eaXH6YLJg5ltD6a8sf035IYRDwBYs5Krod3cKfyx/
 WJykKOsIIazsDPACuzJjdZrOKNlazbqjIRrOEajAh65fkOLgsUplZdNkYAc/jK2yFyWH
 /M0g6vETSl4Ki4Vrwi8WrnUrobGZF2x2Rt9d/XR6N1WTkhjHCvA8vcLJQT9ul4eV5rGr
 Xel4GhL6ga7y9Xho/vd7KyRiMN1Q/2g+hbGpwqqs+cf5Fn+17ANWTkBBsoWaCFaKHnMl
 KtB1AAuutgwuILhlbBusXMPsFKemFYYcJui0IdDxN6S5mOkDp1ezUe1dzlfwzpZu2iB+
 iQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765320665; x=1765925465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QEQMzl7vqNIap2ByUNZYi+y3EAq/MDWdLePRuwHVOoc=;
 b=dsSRYzH9rX504E1EGquXWIb6r40/6cbnFLazQFjkR4AS00OykW5OgqrG0ANNV408PE
 kY6J3LyV8rXgTY989KbYCUzY5TGXV77DiYKMeANvfzsRWmpP2rsdhs0MILPLyK/4gFhw
 uigvbQrcx3FvOnXaiTzJiE03ZzuNy2Z6RFEbOtrEmD6BMfet01T8SqxlVmYCnqapz8au
 WOv51kXquSy6vmknP7ViwpUo+eDBBTsKdjQ6ff0fIJMBJNu+GCRmwlQ0OQxkyhdeRar/
 CQhhS3Wx7zW3+fBpE8tVMrgD0jYRQH7f+/Z3O+ocXZWXb2UfALsjlcQhtiy8Ibxorfq+
 GHfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+CV2LI5pUucDELMe9ZOypqQS1Q5nB5wIGlEHnh+r2J+h3xrNoBCOosOa8geaXD13isd5iIOgm7ok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzra5bGV/3IBCQTXPRO0HrSxwSZCj0cC0CGdB/q3phwp81klVkG
 R/2VYfIRgLG5NzyUBmUvEJ9Zhn2wGXDZdrpGAseqKfHqiOluXYHen4cQFednuxxb1WNL3NzAU/u
 yMT88jkHsdP9UcZLlnoV/HDCFjpQ2QRT8yBuH13SJlOurrc0Oy4qA3dVig2XdhsYLqmQAFJ8=
X-Gm-Gg: ASbGncuyeMnL9NFx98rwd3nFiPWf20cK2+aKDYSwKLbDOy9DT1n1YHiebbKXYq2yWRq
 19H8CSFvyxGb+zwzd261ZoTQ1TofEoCSx0hXiwr6wXdHYdrcsQ5YbsYoiajU4kgzAks4Ytg1wph
 Xheo4DPh7w1vbCtgN/z4OB/nTjNyJBXry0SOadKhZbrv0ErilC8HkXUvafNqPK1KVUeFVNRv7kk
 n7tr3dvutF66jAV6EXzje4rnkOey9x8vaMdmgt//7srOT2SgWOU84fGPC37z+uOEeONfa6lHt6c
 V4vjlKOgZHxLz4LXAXQUG14Xf+bitC9T0ujNzF7UD5MNJGk+kK9YKbNnRSlmZBAS0niawigvoKW
 fPrWPUTDNF5bLrk6Q62BBcldjuogPr9PxWMIykosm4ObrUypae9hsuIHNzSlpTP5N8OICqXcmJv
 iSTmgtAlD9lF7b8F1206b88m0=
X-Received: by 2002:a05:622a:229a:b0:4ed:1948:a8a2 with SMTP id
 d75a77b69052e-4f1b1a7e138mr5189931cf.40.1765320665288; 
 Tue, 09 Dec 2025 14:51:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqXfCXoGkec/geIDZqj9qtcWGnUkW/xMVVONs/SH655X16SAhaO0w/9u2YnfaCWf+p71MfPg==
X-Received: by 2002:a05:622a:229a:b0:4ed:1948:a8a2 with SMTP id
 d75a77b69052e-4f1b1a7e138mr5189521cf.40.1765320664869; 
 Tue, 09 Dec 2025 14:51:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7c1e476sm5689248e87.54.2025.12.09.14.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 14:51:04 -0800 (PST)
Date: Wed, 10 Dec 2025 00:51:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Ji <xji@analogixsemi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 2/2] drm: bridge: anx7625: implement minimal Type-C
 support
Message-ID: <7wp25rctnwydxa3zfpbmddgygyxmg5eg5crv4yuo45k6ovvww2@bnvcw3yorqw2>
References: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
 <20251126-anx7625-typec-v1-2-22b30f846a88@oss.qualcomm.com>
 <aTGJXAnlkK5vQTzk@kuha>
 <BY5PR04MB673939B585B2419534D48E77C7A2A@BY5PR04MB6739.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR04MB673939B585B2419534D48E77C7A2A@BY5PR04MB6739.namprd04.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=d7X4CBjE c=1 sm=1 tr=0 ts=6938a7da cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GaQpPoNlAAAA:8 a=cm27Pg_UAAAA:8 a=PJmAgKdD5_Fpd0EMymkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE3OCBTYWx0ZWRfX+MEnJMHLgCVa
 8k86+3dGByv3X9cqiijboQNOr2ee0t6D4FurOKa3CJ6rpQJGJhalPUbUT8U7GrFQSg11DKai5+R
 MGco7u6CTp5pRHv2iMmKQfn10g+rmzQ0ngSD1hVHBuuTYI4yEKarh8Hn8EamkrBFVx8TzKqmBFv
 oZuHxUStYhNHkIZGfPoQwHXfaFyiG4vy6P9T5HhBbpzerYEFkMwievvGjCuaMBW6nIT31jv2fMk
 wn1BfTl9pul6SDq4HwZKglwI70PYGufMTar/eg4RmQBoXo2VilTt2+AZjjZv0EU5xR1mwyrAVfB
 7gYAUcSdtrNXIZrtR6WXtM6j7/GWsOYEXUnZz8oBzaQ1LZHkU5G0HyUtBBz9gMW8rlcXTr5psJ0
 6NBAOZDAsn5sM8gi0jG0VCVGfJyk7A==
X-Proofpoint-GUID: Y9nCGIOWDlxO4CviJLHeF_FsgFd3nrCP
X-Proofpoint-ORIG-GUID: Y9nCGIOWDlxO4CviJLHeF_FsgFd3nrCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090178
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

On Mon, Dec 08, 2025 at 07:37:30AM +0000, Xin Ji wrote:
> Hi Dmitry, I found there is another patch "Register USB Type-C mode switches" which provided by Pin-yen Lin <treapking@chromium.org>, but I didn't find it in the v6.18, is it obsolete?.

It has been posted 2 years ago, it has not been reposted since that
time, it targets a very specific ChromeOS usecase. I can't call it
obsolete, but it wasn't merged.

> https://patchew.org/linux/20221124102056.393220-1-treapking@chromium.org/20221124102056.393220-6-treapking@chromium.org/
> 
> Thanks,
> Xin

-- 
With best wishes
Dmitry

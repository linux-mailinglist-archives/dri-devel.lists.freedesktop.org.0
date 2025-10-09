Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54B3BCA270
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 18:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248C710E203;
	Thu,  9 Oct 2025 16:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cqci1QN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1589510E203
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 16:23:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599F6TK2020128
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Oct 2025 16:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bt39X8dW+ZDv9jSNO3RMlOzt
 N0nkdVf4IKuaB0k3nl4=; b=Cqci1QN97/teVcqE1BVo4WyOolpPKOXmhP86rTTe
 8ablEGLhj9fFsU9s985Tl1Z1dMi/kpDskgXb9j1AyPCJWvua/8YGu0f1PFl9aByj
 5/EkUJlKgKzkpjvV7gAcXUmxIItNXXBGbGWz9fz7pbC4RDIGLjbnJmIziaUIajfn
 XsPMG4FSEtXP2iJivh+TkgEihFQMzuyJJkjTRjWqs0f52DIhZhBsSF5oPlpzquCU
 ZjG5/RkpmodNzNLNcEuPtiYDjZYihWa+RieBSkyTxkBSjWQ+Z2JR7/LEEZA9lcV+
 xKm54IxR9QyJ3mLxjWBSX2xuc7ciZ6ql00hGMK3dNtdujQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nujna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 16:23:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4de36c623f6so41989051cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 09:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760026991; x=1760631791;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bt39X8dW+ZDv9jSNO3RMlOztN0nkdVf4IKuaB0k3nl4=;
 b=AsVbiH5AgQhx74PuAUyqml/w1VAwNIVJbICTQep3Vcpi5rrDlVBeuvKzRdN3n+d6FG
 RPYGQy5fCSt4+jVOonlxvpxZsO0Ur1TGAsQRIrfLHWRjcDpKsmT2dWhi3FCNOJ0A3FgY
 I4xfU//WaJCAgB+jU+i0zvzjGvKoRZGb0vgeSVVBK6+qT4ooTp0kCx6l0iQ5LrRCPRPx
 LyyAAegSIJPxG4iQNuA348tmqUU58ZFdY5aWJvLMknxKvC3wSoHh6WO9xcSbms/gsk+d
 oIs2L1sUGauBhs05upFIRKxO3qcm2JO5418PmesTauz2oTsBNsifSDIDV+p2wtc9wmVV
 eFdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAtBIrON1gzAcQ4S42zARdMLIfp9OjagWVYhfR9cEV9Z+5O6POdAxGWMIiW8lw26fwXyiBU8W4yCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiAiVbsXfits6sH/CPZYuAvXeJUdMBXLxsjCxhLhsbaef8cWUI
 5ZTSM4GknXxAqD9HqC0zc2heQdDz9zcyThyuhkZMKKoxS5LZt2s2i2BgXq7IsCqFM74+cUty55U
 06YLEEmraLmw/YT4X4RUw8oR6i4xnFRNIZHP+MOJc5nVWD/TmiBrjiKlQyYxzrN1PNM8/E14=
X-Gm-Gg: ASbGnculDXdUhnEhV0lAZik4pO5HWDqy5uvxwdLnsC84mkVt+29GocbLjDWy0UbMOT6
 70rrft4mRfX5t8JaRBfpN+DCDtb6/snPZmerha2wmcuYUX0GrPoMDivbRlrwebN91z16tG0R7fm
 iqb3LCLK6YEidCMZ5rgY9IIWXke0CWT8/AXUvqczh2J38cA+t0xXcWS5UEhLCgr9TXHCdLNLF/U
 Gdy7h7Q9aAQzR/ntzoKic5EqkNUuDJF+OVTJ2c7kFM0IDgVliKKbFHQF5gW3F9aeT0LMgcqGfbZ
 G56mZo/BalTSQb+xmAOxCj4HFfW/C2XMzzN6XtU6U2uY/P5uzTlzPYbBW1mVb7NhThuEFwJhW1C
 8O/2H2AlgtP8KqrlT36bP42IzEfnkKX/7/kFrkudBR+D7quVRkqy+5wIBxA==
X-Received: by 2002:a05:622a:355:b0:4bd:f73d:eee3 with SMTP id
 d75a77b69052e-4e6ead54c1fmr111202991cf.39.1760026991316; 
 Thu, 09 Oct 2025 09:23:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg801ObE8F+R8kZBeMVN+M/a5YBBI9id+lFXKMYLvZEjycOY0KP+OvFKokNNP+wtFnRV298w==
X-Received: by 2002:a05:622a:355:b0:4bd:f73d:eee3 with SMTP id
 d75a77b69052e-4e6ead54c1fmr111202101cf.39.1760026990405; 
 Thu, 09 Oct 2025 09:23:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907ac00a78sm1182099e87.19.2025.10.09.09.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 09:23:09 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:23:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
Message-ID: <ylnjckdtgfktz4x7tcgy5g5qebpppregubhjn23e6cx7s5w23b@7tq35tvwx2qi>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
 <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
 <74893f76-1b7d-4cfb-ba7a-9fd64427762b@oss.qualcomm.com>
 <bmsxmwfdwx7wlmngaqpvz7c2nudcoukspkxgq6zqh2mdlolfxg@fsdbafotp5q2>
 <75011ead-8bd8-4939-ae7b-1c127eba8aa8@ixit.cz>
 <3mbngf2r3rvbn5fr4vxbk64ouvm3voo5o2r63vg3clyswnceoh@64r6ujb5qr65>
 <9018af52-1c81-4d2d-8717-44e5372dbffa@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9018af52-1c81-4d2d-8717-44e5372dbffa@ixit.cz>
X-Proofpoint-ORIG-GUID: q3ykJloc1vucWLq338to-4SQ1UgVW9Gj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXytOJhdaPZeAX
 DeIi3wy0Did6oyx1LQkiUSg+DsH0A5pD8vBcNVVTeX7JiEXu8ISn+q47kVKLmNcq6+fL37Ejqre
 BAgQ/QGUm//fkeJb+/Vqgldf8a+9w/1dAUXWFaCtwZsw/KqDoNx798HXasdN+4+4CDlAtNu7+Rl
 f+wGkjUGZLyPQMq9X5KHJQiNNqoE/jxGCRLa4CYMEOMUnkwJZN3gTofmNl+1Q5P15anVyuapGNc
 E0FRBhjTXosSB0mv5Nz4c8BEjXlr79MJBS6y3lNbJm6fOdDl04zAPpukpjDrhUEyjt/X5AXWk8r
 PZsdkzpWpIM2OJ+EL8ebpP84kEvykGFscAcy/diYHH1rf/wujddw5njm5d62jH0uPT1iKK/1VlE
 UfsEQYkg+QpQ/TYNDocYytc9FkrbQg==
X-Proofpoint-GUID: q3ykJloc1vucWLq338to-4SQ1UgVW9Gj
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e7e170 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=7einrZQClg3FUqyrEHMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Thu, Oct 09, 2025 at 05:44:46PM +0200, David Heidelberg wrote:
> On 09/10/2025 16:26, Dmitry Baryshkov wrote:
> > On Thu, Oct 09, 2025 at 03:32:22PM +0200, David Heidelberg wrote:
> > > 
> > > 
> > > On 09/10/2025 15:21, Dmitry Baryshkov wrote:
> > > > On Thu, Oct 09, 2025 at 10:51:31AM +0200, Konrad Dybcio wrote:
> > > > > On 10/8/25 8:57 PM, Dmitry Baryshkov wrote:
> > > > > > On Wed, Oct 08, 2025 at 04:05:28PM +0200, David Heidelberg via B4 Relay wrote:
> > > > > > > From: David Heidelberg <david@ixit.cz>
> > > > > > > 
> > > > > > > Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> > > > > > > 
> > > > > > > Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> > > > > > > 
> > > > > > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > > > > > ---
> > > > > > >    .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 78 ++++++++++++++++++++++
> > > > > > >    MAINTAINERS                                        |  5 ++
> > > > > > >    2 files changed, 83 insertions(+)
> > > > > > > 
> > > > > > 
> > > > > > Please also describe, why it's not enough to use defined compatible,
> > > > > > samsung,s6e3fc2x01. Why do we need a separate schema and can't use the
> > > > > > panel-simple-dsi.yaml
> > > > > 
> > > > > panel-simple works for 'dumb' (perhaps a harsh word for 'made with
> > > > > just the in-spec DCS commands in mind') panels, but Samsungs are
> > > > > widely known to require a ton of vendor magic
> > > > 
> > > > The question is about the _schema_. I think it's fine to have a driver
> > > > for a panel covered by panel-simple-dsi.yaml.
> > > 
> > > see display/panel/samsung,amoled-mipi-dsi.yaml
> > > the OLED display don't fit well, but I wouldn't mind consolidating at some
> > > point, but since we know very little (no datasheets), it's hard to do for
> > > now. Maybe in the future when there will be more panels schemas, we can find
> > > a way to consolidate into one big?
> > 
> > I'm looking for a simple answer ATM: it doesn't fit
> > panel-simple-dsi.yaml because it needs foo bar baz, which is not a part
> > of that schema.
> 
> v3 will have:
> 
>     dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
> 
>     Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> 
>     Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> 
>     panel-simple-dsi cannot be used because it's limited to one
>     power-supply, while we use three.

Perfect, thank you. If the bindings for samsumg,s6e3fc2x01 are
incorrect, they should be dropped too.

> > > > > Perhaps the original change was made with an "oh it just works
> > > > > surely there's no drawbacks possible" attitude, as the panel
> > > > > was left initialized by the bootloader

-- 
With best wishes
Dmitry

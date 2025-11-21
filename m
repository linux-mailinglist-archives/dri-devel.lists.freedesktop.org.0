Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C50CC7AFE3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 18:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA6A10E8EE;
	Fri, 21 Nov 2025 17:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4APoDqW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUF73EZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98B110E8EC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 17:09:10 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALG3bw23675812
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 17:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=x0fV9NRyP8TnHzItdc8ySrlQ
 TcvtIdk/VVgrWEjJPc0=; b=B4APoDqWIA0Q9AeMTnpJVkVO36SUvb3a5/+qAsqP
 Tb5iHWl+c+j7AS1YjDdCFfbR6GuhJ5JvuGnxI7TdThZ4Yq2PUeq1Y15etT5xEWy/
 3rT/it0r9p1j3+7OVDQf6pSOfoh2pZ7hMJK8HV6V6LqIqg6gDSyEnMYdk0EMOZSh
 eVYvrj2UIbrqoM52Us5L2PSTv816x780JqcHc/gDOPD10DCuFQTmsd/G7TPH1iXA
 BxChtxlXPfAR+7T/lUfFsPwOuO7FegvBOcUJthEyUWMB1aHBYW15WomzO0OrsldF
 /nfEIols4htpuraVZkztWDHlP0PNhLEm8wBE6/74tIByng==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmyj9mdc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 17:09:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-559549c0edbso4105475e0c.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 09:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763744949; x=1764349749;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x0fV9NRyP8TnHzItdc8ySrlQTcvtIdk/VVgrWEjJPc0=;
 b=dUF73EZShTTGVieAMLB48aNqYyYePrR4r7o1MbOiPsQF5crbD/FBmrSgCwx0vOvkX5
 SH1jnVn2Rv1pwrVv7q+ninuyQQwv5zC36ckuiC0NZujrRWq3Nopnr1y4klOSr76dUbTA
 i9wIHzKfzpMJXMgXsekZt3TnWte/vGCF1bFl4/PClqNA+hEnoFApWoRS9GRo+7QGCFD2
 Us3cFqPB3vAcE1vC7cHhq3t8RRN2BbfB1bjI83K7mTPPufT9U/DmJwn1djiskKVmHcgg
 y7OwYmjqGdxpFGjBCRhYyeiXxpvS/zYHtfDm5LAveai6vzOxGszS7j76S1f0kUyBkl2Q
 9vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763744949; x=1764349749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x0fV9NRyP8TnHzItdc8ySrlQTcvtIdk/VVgrWEjJPc0=;
 b=aP3XdcK//HRgHWU25TDqsCkooDhattr5i6uUhCSVwYxVW8pirSm0cxV6tJebkyuFdH
 EWHtJ3jqN2lzdGe1T/+uXm5gMR8Weg3pS94epUGEsmC60N2kPq153nqHXL3kAge3mavz
 J8QztsslyVL7TmYhvP2tH9ezh4MOKXMRyGEAhs8ZuH5w/gKk8mNLiMJ5oQPyGu6hwXGa
 4h2gPfi+R+SvqZ4cqjHEoeoTbSgAg/7b3iF/W/CxRI5IPHc9aVI0fKUMUB9ZokIyt4nX
 9bTG8YBtwJmiM+dQAYiz1lAsqD2BLpDHzZZr8A0M+IHVGP5buD6NDgpIg/mq7ddhK3y0
 NTGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV5syP1UcDlqS9DkILaIZLhUarJYkj8zSVyiconL9iXsmtcfzM8tsfIdVj23WfplRp+sjE3J1welU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfIdh3CvXI4slMiZxxd3uvKiaKZmyABUX87VNpSRqj9FmVT3pK
 ZHmE1mr+ysTNyWX2+P5RTwlX8EOozxqsGzjQX1so1qNrBTohxkHzy9Bbi3dL9zOucZS0HGzrIWc
 Q+3GW0X9deLaqHSdwai1LkQ3SwTlZDe+d8689Lia0juo7Y4kpSO+pwTcF73qf83CyLYw9Nk8=
X-Gm-Gg: ASbGnctDWBfxOKbq1LM+WKkiAY51PHhDfoRW3zuhHLx3dpKGGTBCrloYXnYzHN6DOZR
 XZDPfUMNYmGqv66U9+X1H6jKoaqz3jZfD/FQ8sukw8Fo2pvLh4nYXFOlAyT57jYD04Dbnk/c3h1
 mhNOnxQ4CmqRCFV2eONuyo+6iEIa4s+sKYOS//3m8XGsA5I2iMEp/VCvxMQ4qrgYTfud9W3FiJJ
 jzXl/AlRqYrN5m6q2kAcewaXgUhYOVY69Pk4YS5+dfEco/pnlehZmZajAk+fdWqjVMsxbDbZ/aa
 WlcZ7+rz3iONDryuO/IULG3AiG05Z2UlPijh/7R6d7aPmUqYVYErPrhtDHoBHeomp9pmvEq4ncr
 nIjPLT4OMIRUhiaA5DOPNCFlwKw9WZ9/y/neZvpd32Xe4Ru7ni5ExtMirBpP8Ij5XT4VLtLdQhq
 fqFfJ3AlsVoGbIvfvOCP/AFQ0=
X-Received: by 2002:a05:6122:7d4:b0:559:6960:be0d with SMTP id
 71dfb90a1353d-55b8eff05d5mr958217e0c.13.1763744948655; 
 Fri, 21 Nov 2025 09:09:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF36LpwNvaeUrXiQQ+d43AV7lmHEWkjfB6DhLEkoVm8OII4kz9GMX8vz0phN/PdxWiZlMmV4g==
X-Received: by 2002:a05:6122:7d4:b0:559:6960:be0d with SMTP id
 71dfb90a1353d-55b8eff05d5mr958134e0c.13.1763744948011; 
 Fri, 21 Nov 2025 09:09:08 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37cc6bafc06sm11695981fa.23.2025.11.21.09.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 09:09:03 -0800 (PST)
Date: Fri, 21 Nov 2025 19:09:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
References: <x562ueky2z5deqqmhl222moyrbylfwi35u4hb34dpl3z52ra4c@dyw4iayrewnz>
 <20250925-fervent-merry-beagle-2baba3@penduick>
 <qx5ashx62pufott6hnsfna3qntnoyvxwxze4rihhuxcsdxi37s@bbdvc3sfsgne>
 <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
 <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
 <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=69209cb5 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=01VIiY21fa0fjPjSqwYA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEyNiBTYWx0ZWRfX6sJG7DrAF1nY
 0D40oIfNxUKCW0jgaje8PIW2RcyKJhKY34OT95aBsn/UYL0g1ZJ8+wHW5EZ1EO6qRZbva8LHgO/
 rSRUiyJf2yGbYD+1SXvrNkSStb1gQFt0ppryPEDouqnEtYIdeauAR1wSEc8wBrm5J1/Z5174yeI
 kMTWWk3KBktmaQrgj2xgBqqMtxKTS+EBVxobqvDAWy+a8IeviVdQzse+Hg4vDlCMOFh0PaZuL3w
 f1dJrLKSewR7l3DP4mGP/R97+B1g4aqn0zeIMM4r9lVrvZMyYshWYyPfDcLF6fRzUB1IsX512b/
 qQ0X8Wglt5LniSESQr+e0ObpEtZG36/usgQnrXPT54IHQmfhBWED0SNcj3Vpg/K6hUTRNaSnchW
 cqsQ+LYzUfit3/Og1Dvsh7wsMx7hCw==
X-Proofpoint-GUID: E8HEiN7AyqDoAS8ewbdxFPz399UZWwR0
X-Proofpoint-ORIG-GUID: E8HEiN7AyqDoAS8ewbdxFPz399UZWwR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210126
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

On Fri, Nov 21, 2025 at 04:36:28PM +0100, Maxime Ripard wrote:
> On Tue, Oct 14, 2025 at 06:48:19PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Oct 14, 2025 at 02:59:43PM +0200, Maxime Ripard wrote:
> > > On Fri, Oct 03, 2025 at 06:54:47PM +0300, Dmitry Baryshkov wrote:
> > > > On Fri, Oct 03, 2025 at 03:22:23PM +0200, Maxime Ripard wrote:
> > > > > On Tue, Sep 30, 2025 at 10:02:28AM +0300, Dmitry Baryshkov wrote:
> > > > > > On Mon, Sep 29, 2025 at 03:00:04PM +0200, Maxime Ripard wrote:
> > > > > > > On Thu, Sep 25, 2025 at 05:16:07PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > On Thu, Sep 25, 2025 at 03:13:47PM +0200, Maxime Ripard wrote:
> > > > > > > > > On Wed, Sep 10, 2025 at 06:26:56PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > On Wed, Sep 10, 2025 at 09:30:19AM +0200, Maxime Ripard wrote:
> > > > > > > > > > > On Wed, Sep 03, 2025 at 03:03:43AM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > > > On Tue, Sep 02, 2025 at 08:06:54PM +0200, Maxime Ripard wrote:
> > > > > > > > > > > > > On Tue, Sep 02, 2025 at 06:45:44AM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > > > > > On Mon, Sep 01, 2025 at 09:07:02AM +0200, Maxime Ripard wrote:
> > > > > > > > > > > > > > > On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > > > > > > > On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > > > > > > > > > > > > > > > > Hi Dmitry,
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > > > > > > > > > > > > > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > > > > > > > > > > > > It's not uncommon for the particular device to support only a subset of
> > > > > > > > > > > > > > > > > > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > > > > > > > > > > > > > > > > > a model of ignoring the unsupported Infoframes, but it's a bigger
> > > > > > > > > > > > > > > > > > problem for the userspace: we end up having files in debugfs which do
> > > > > > > > > > > > > > > > > > mot match what is being sent on the wire.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Sort that out, making sure that all interfaces are consistent.
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > Thanks for the series, it's a really good cleanup.
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > > > > > > > > > > > > > > > > packing it into the two GHDMI banks. So the supported set there is
> > > > > > > > > > > > > > > > > 'all of the currently well-known ones, plus any two others, but only
> > > > > > > > > > > > > > > > > two and not more'. I wonder if that has any effect on the interface
> > > > > > > > > > > > > > > > > you were thinking about for userspace?
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > I was mostly concerned with the existing debugfs interface (as it is
> > > > > > > > > > > > > > > > also used e.g. for edid-decode, etc).
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> > > > > > > > > > > > > > > > HDMI also have those. I don't have at hand the proper datasheet for
> > > > > > > > > > > > > > > > LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> > > > > > > > > > > > > > > > generic).  Maybe we should change debugfs integration to register the
> > > > > > > > > > > > > > > > file when the frame is being enabled and removing it when it gets unset.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > But, like, for what benefit?
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > It's a debugfs interface for userspace to consume. The current setup
> > > > > > > > > > > > > > > works fine with edid-decode already. Why should we complicate the design
> > > > > > > > > > > > > > > that much and create fun races like "I'm running edid-decode in parallel
> > > > > > > > > > > > > > > to a modeset that would remove the file I just opened, what is the file
> > > > > > > > > > > > > > > now?".
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Aren't we trading that with the 'I'm running edid-decode in paralle with
> > > > > > > > > > > > > > to a modeset and the file suddenly becomes empty'?
> > > > > > > > > > > > > 
> > > > > > > > > > > > > In that case, you know what the file is going to be: empty. And you went
> > > > > > > > > > > > > from a racy, straightforward, design to a racy, complicated, design.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > It was my question before, but I still don't really see what benefits it
> > > > > > > > > > > > > would have, and why we need to care about it in the core, when it could
> > > > > > > > > > > > > be dealt with in the drivers just fine on a case by case basis.
> > > > > > > > > > > > 
> > > > > > > > > > > > Actually it can not: debugfs files are registered from the core, not
> > > > > > > > > > > > from the drivers. That's why I needed all the supported_infoframes
> > > > > > > > > > > > (which later became software_infoframes).
> > > > > > > > > > > 
> > > > > > > > > > > That's one thing we can change then.
> > > > > > > > > > > 
> > > > > > > > > > > > Anyway, I'm fine with having empty files there.
> > > > > > > > > > > > 
> > > > > > > > > > > > > > > > Then in the long run we can add 'slots' and allocate some of the frames
> > > > > > > > > > > > > > > > to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> > > > > > > > > > > > > > > > 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> > > > > > > > > > > > > > > > salvaged as another generic one)). MSM HDMI would get 'software AVI',
> > > > > > > > > > > > > > > > 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> > > > > > > > > > > > > > > > want to use). Then the framework might be able to prioritize whether to
> > > > > > > > > > > > > > > > use generic slots for important data (as DRM HDR, HDMI) or less important
> > > > > > > > > > > > > > > > (SPD).
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Why is it something for the framework to deal with? If you want to have
> > > > > > > > > > > > > > > extra infoframes in there, just go ahead and create additional debugfs
> > > > > > > > > > > > > > > files in your driver.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > If you want to have the slot mechanism, check in your atomic_check that
> > > > > > > > > > > > > > > only $NUM_SLOT at most infoframes are set.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > The driver can only decide that 'we have VSI, SPD and DRM InfoFrames
> > > > > > > > > > > > > > which is -ETOOMUCH for 2 generic slots'. The framework should be able to
> > > > > > > > > > > > > > decide 'the device has 2 generic slots, we have HDR data, use VSI and
> > > > > > > > > > > > > > DRM InfoFrames and disable SPD for now'.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > I mean... the spec does? The spec says when a particular feature
> > > > > > > > > > > > > requires to send a particular infoframe. If your device cannot support
> > > > > > > > > > > > > to have more than two "features" enabled at the same time, so be it. It
> > > > > > > > > > > > > something that should be checked in that driver atomic_check.
> > > > > > > > > > > > 
> > > > > > > > > > > > Sounds good to me. Let's have those checks in the drivers until we
> > > > > > > > > > > > actually have seveal drivers performing generic frame allocation.
> > > > > > > > > > > > 
> > > > > > > > > > > > > Or just don't register the SPD debugfs file, ignore it, put a comment
> > > > > > > > > > > > > there, and we're done too.
> > > > > > > > > > > > 
> > > > > > > > > > > > It's generic code.
> > > > > > > > > > > > 
> > > > > > > > > > > > > > But... We are not there yet and I don't have clear usecase (we support
> > > > > > > > > > > > > > HDR neither on ADV7511 nor on MSM HDMI, after carefully reading the
> > > > > > > > > > > > > > guide I realised that ADV7511 has normal audio infoframes). Maybe I
> > > > > > > > > > > > > > should drop all the 'auto' features, simplifying this series and land
> > > > > > > > > > > > > > [1] for LT9611UXC as I wanted origianlly.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > [1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Looking back at that series, I think it still has value to rely on the
> > > > > > > > > > > > > HDMI infrastructure at the very least for the atomic_check sanitization.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > But since you wouldn't use the generated infoframes, just skip the
> > > > > > > > > > > > > debugfs files registration. You're not lying to userspace anymore, and
> > > > > > > > > > > > > you get the benefits of the HDMI framework.
> > > > > > > > > > > > 
> > > > > > > > > > > > We create all infoframe files for all HDMI connectors.
> > > > > > > > > > > 
> > > > > > > > > > > Then we can provide a debugfs_init helper to register all of them, or
> > > > > > > > > > > only some of them, and let the drivers figure it out.
> > > > > > > > > > > 
> > > > > > > > > > > Worst case scenario, debugfs files will not get created, which is a much
> > > > > > > > > > > better outcome than having to put boilerplate in every driver that will
> > > > > > > > > > > get inconsistent over time.
> > > > > > > > > > 
> > > > > > > > > > debugfs_init() for each infoframe or taking some kind of bitmask?
> > > > > > > > > 
> > > > > > > > > I meant turning hdmi_debugfs_add and create_hdmi_*_infoframe_file into
> > > > > > > > > public helpers. That way, drivers that don't care can use the (renamed)
> > > > > > > > > hdmi_debugfs_add, and drivers with different constraints can register
> > > > > > > > > the relevant infoframes directly.
> > > > > > > > 
> > > > > > > > Doesn't that mean more boilerplate?
> > > > > > > 
> > > > > > > I don't think it would? In the general case, it wouldn't change
> > > > > > > anything, and in special cases, then it's probably going to be different
> > > > > > > from one driver to the next so there's not much we can do.
> > > > > > > 
> > > > > > > > In the end, LT9611UXC is a special case, for which I'm totally fine
> > > > > > > > not to use HDMI helpers at this point: we don't control infoframes
> > > > > > > > (hopefully that can change), we don't care about the TMDS clock, no
> > > > > > > > CEC, etc.
> > > > > > > 
> > > > > > > Not using the helpers sound pretty reasonable here too.
> > > > > > > 
> > > > > > > > For all other usecases I'm fine with having atomic_check() unset all
> > > > > > > > unsupported infoframes and having empty files in debugfs. Then we can
> > > > > > > > evolve over the time, once we see a pattern. We had several drivers
> > > > > > > > which had very limited infoframes support, but I think this now gets
> > > > > > > > sorted over the time.
> > > > > > > 
> > > > > > > I never talked about atomic_check()? You were initially concerned that
> > > > > > > the framework would expose data in debugfs that it's not using. Not
> > > > > > > registering anything in debugfs solves that, but I'm not sure we need to
> > > > > > > special case atomic_check.
> > > > > > 
> > > > > > Well... I ended up with [1], handling infoframes in the atomic_check()
> > > > > > rather than registering fewer infoframe debugfs files. This way device
> > > > > > state is consistent, we don't have enabled instances, etc. However it
> > > > > > results in repetetive code in atomic_check().
> > > > > > 
> > > > > > [1] https://lore.kernel.org/dri-devel/20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com/
> > > > > 
> > > > > I guess we can continue the discussion there, but I'm not sure we want
> > > > > to have more boilerplate in drivers, and especially in the atomic_check
> > > > > part. If drivers are inconsistent or wrong in the debugfs path, there's
> > > > > no major issue. If they are wrong in the atomic_check path, it will lead
> > > > > to regressions, possibly in paths that are pretty hard to test.
> > > > 
> > > > You've responded there and I can drop the extra handling for HDR DRM and
> > > > audio infoframes in the atomic_check(). What is your opinion about the
> > > > atomic_check() unsetting the infoframe->set for SPD and HDMI infoframes?
> > > 
> > > HDMI infoframes are mandatory, so that's a big no-no.
> > 
> > Nevertheless... There are drivers (sun4i, inno_hdmi, rk3066, dw_hdmi_qp)
> > which don't (yet) implement VSI support.
> 
> We should really differentiate drivers that didn't because they were
> allowed to, and drivers that can't.
> 
> For the bridge you mentioned earlier in the discussion, it makes sense
> not to expose the debugfs file because we simply don't have access to
> the actual content. That's fine.
> 
> For the drivers you listed there, I'm pretty confident that it's because
> nobody really tried. That's definitely not fine, and we should complain
> as loudly as possible for that particular case, and not give them a free
> pass. Checking sun4i, I'm pretty sure it can be implemented. Looking at
> the incomplete RK3066 TRM, it can be implemented too. And inno_hdmi
> looks really similar.

Interesting, according do a10s and a31 user manuals, there is no support
for vendor infoframes, but it has SPD infoframe, which seemingly can be
reused for HVIF.

> So it's not really impossible, you just need some hardware and a day's
> worth of work.
> 
> There's no reason these should get a pass, it's breaking the spec for no
> reason.
> 
> > > For SPD, It's really not clear to me why atomic_check should do that in
> > > the first place. Your initial concern was about exposing infoframes in
> > > debugfs that wouldn't be used by the driver.
> > > 
> > > If the driver doesn't register a debugfs file for SPD, and ignores
> > > whatever is in the atomic state, what's should we force drivers to do
> > > that?
> > 
> > I really don't think that drivers should mess up with debugfs on their
> > own. Making atomic_check() disable the unsupported InfoFrames makes the
> > picture perfect: the DRM no longer tries to program them to the
> > hardware, DebugFS files stay empty, so the whole state becomes
> > consistent.
> 
> In the "bridge has no access to infoframes" case, there's really no
> infoframe. An empty file is "the infoframe can be there but isn't used",
> not "we don't have access to it and can't report them". Only drivers
> have those infos.
> 
> If we do split up write_infoframe into multiple functions though, I
> guess we could create the debugfs file only if the function pointer is
> set, which removes drivers' involvement if you don't like that.

I'm fine with not using HDMI connector framework for lt9611uxc.
Likewise, I think, it's fine to have empty files for the infoframes
which are not being sent over the wire for any reason (hw not supporting
it is one of the reasons). I really don't see a good way to implement
multiple-callbacks-as-a-supporter-flag inside drm_bridge_connector.
So, I really think, disabling unsupported infoframes in atomic_check is
the beset course.

-- 
With best wishes
Dmitry
